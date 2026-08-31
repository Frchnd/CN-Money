-- CN MONEY v2.4.8 — finance create idempotency guard
-- Run once in Supabase SQL Editor BEFORE deploying v2.4.8.
--
-- Purpose:
--   * create wallet / investment / asset becomes retry-safe
--   * a request that already committed will not be executed twice when the app
--     retries it after a network drop, force-close, or reopen
--
-- Existing finance tables/data are NOT altered. This migration adds:
--   1) an internal operation-guard table (random request ids only)
--   2) one public SECURITY INVOKER RPC that delegates to the existing finance
--      create RPCs while preserving their existing RLS/authorization behavior

create schema if not exists cn_internal;
grant usage on schema cn_internal to authenticated;

create table if not exists cn_internal.finance_operation_guard_v1 (
  household_id uuid not null,
  operation_id text not null,
  operation_type text not null,
  created_by uuid not null default auth.uid(),
  created_at timestamptz not null default now(),
  primary key (household_id, operation_id)
);

alter table cn_internal.finance_operation_guard_v1 enable row level security;

revoke all on cn_internal.finance_operation_guard_v1 from public, anon;
revoke update, delete on cn_internal.finance_operation_guard_v1 from authenticated;
grant select, insert on cn_internal.finance_operation_guard_v1 to authenticated;

drop policy if exists "cn finance guard own select v1" on cn_internal.finance_operation_guard_v1;
create policy "cn finance guard own select v1"
on cn_internal.finance_operation_guard_v1
for select
to authenticated
using (created_by = auth.uid());

drop policy if exists "cn finance guard own insert v1" on cn_internal.finance_operation_guard_v1;
create policy "cn finance guard own insert v1"
on cn_internal.finance_operation_guard_v1
for insert
to authenticated
with check (created_by = auth.uid());

create or replace function public.cn_finance_create_once_v1(
  p_household_id uuid,
  p_operation_id text,
  p_operation_type text,
  p_payload jsonb
)
returns jsonb
language plpgsql
security invoker
set search_path = public, cn_internal
as $$
declare
  v_inserted integer := 0;
  v_existing cn_internal.finance_operation_guard_v1%rowtype;
  v_dummy integer;
begin
  if auth.uid() is null then
    raise exception 'Authentication required';
  end if;

  if nullif(trim(p_operation_id), '') is null then
    raise exception 'Operation id is required';
  end if;

  if p_operation_type not in ('create_wallet', 'create_investment', 'create_asset') then
    raise exception 'Unsupported finance operation: %', p_operation_type;
  end if;

  if p_payload is null or jsonb_typeof(p_payload) <> 'object' then
    raise exception 'Operation payload must be a JSON object';
  end if;

  insert into cn_internal.finance_operation_guard_v1(
    household_id,
    operation_id,
    operation_type,
    created_by
  ) values (
    p_household_id,
    p_operation_id,
    p_operation_type,
    auth.uid()
  )
  on conflict (household_id, operation_id) do nothing;

  get diagnostics v_inserted = row_count;

  if v_inserted = 0 then
    select *
      into v_existing
    from cn_internal.finance_operation_guard_v1
    where household_id = p_household_id
      and operation_id = p_operation_id;

    if not found then
      raise exception 'Operation guard is not accessible';
    end if;

    if v_existing.created_by <> auth.uid() then
      raise exception 'Operation id belongs to another user';
    end if;

    if v_existing.operation_type <> p_operation_type then
      raise exception 'Operation id was already used for a different action';
    end if;

    return jsonb_build_object(
      'ok', true,
      'deduped', true,
      'operation_id', p_operation_id,
      'operation_type', p_operation_type
    );
  end if;

  -- Dynamic SQL intentionally uses quoted literals (%L). The existing RPC
  -- signatures remain the source of truth for enum/text/numeric/date types,
  -- while this wrapper does not need to duplicate those custom type names.
  if p_operation_type = 'create_wallet' then
    if nullif(trim(p_payload->>'name'), '') is null then
      raise exception 'Wallet name is required';
    end if;

    execute format(
      'select 1 from public.finance_create_wallet(p_household_id => %L, p_name => %L, p_wallet_type => %L, p_initial_balance => %L) limit 1',
      p_household_id::text,
      p_payload->>'name',
      p_payload->>'wallet_type',
      coalesce(p_payload->>'initial_balance', '0')
    ) into v_dummy;

  elsif p_operation_type = 'create_investment' then
    if nullif(trim(p_payload->>'name'), '') is null then
      raise exception 'Investment name is required';
    end if;

    execute format(
      'select 1 from public.finance_create_investment(p_household_id => %L, p_name => %L, p_investment_type => %L, p_amount => %L, p_source_wallet_id => %L) limit 1',
      p_household_id::text,
      p_payload->>'name',
      p_payload->>'investment_type',
      coalesce(p_payload->>'amount', '0'),
      nullif(p_payload->>'source_wallet_id', '')
    ) into v_dummy;

  elsif p_operation_type = 'create_asset' then
    if nullif(trim(p_payload->>'name'), '') is null then
      raise exception 'Asset name is required';
    end if;

    execute format(
      'select 1 from public.finance_create_asset(p_household_id => %L, p_name => %L, p_asset_type => %L, p_purchase_value => %L, p_current_value => %L, p_purchase_date => %L) limit 1',
      p_household_id::text,
      p_payload->>'name',
      p_payload->>'asset_type',
      coalesce(p_payload->>'purchase_value', '0'),
      coalesce(p_payload->>'current_value', p_payload->>'purchase_value', '0'),
      nullif(p_payload->>'purchase_date', '')
    ) into v_dummy;
  end if;

  return jsonb_build_object(
    'ok', true,
    'deduped', false,
    'operation_id', p_operation_id,
    'operation_type', p_operation_type
  );
end;
$$;

revoke execute on function public.cn_finance_create_once_v1(uuid,text,text,jsonb) from public, anon;
grant execute on function public.cn_finance_create_once_v1(uuid,text,text,jsonb) to authenticated;
