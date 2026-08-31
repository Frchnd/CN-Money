-- CN MONEY v2.4.7 — atomic household bucket mutations
-- Run once in Supabase SQL Editor before deploying v2.4.7.
-- This does not alter finance tables or existing data. It only adds an RPC
-- used to update shared checklist/database/history JSON without replacing
-- the entire bucket from one device.

create or replace function public.cn_household_bucket_mutate_v1(
  p_household_id uuid,
  p_bucket text,
  p_action text,
  p_item jsonb default null,
  p_item_id text default null,
  p_key text default null,
  p_session_id text default null
)
returns jsonb
language plpgsql
security invoker
set search_path = public
as $$
declare
  v_data jsonb;
  v_next jsonb;
  v_id text;
begin
  if p_bucket not in ('checklist','database','history') then
    raise exception 'Unsupported bucket: %', p_bucket;
  end if;

  select data
    into v_data
  from public.household_data
  where household_id = p_household_id
    and bucket = p_bucket
  for update;

  if not found then
    raise exception 'Household data bucket not found: %', p_bucket;
  end if;

  if p_bucket = 'database' then
    v_data := case when jsonb_typeof(v_data) = 'object' then v_data else '{}'::jsonb end;

    if p_action = 'set_key' then
      if nullif(p_key,'') is null or p_item is null then
        raise exception 'set_key requires p_key and p_item';
      end if;
      v_next := jsonb_set(v_data, array[p_key], p_item, true);
    elsif p_action = 'delete_key' then
      if nullif(p_key,'') is null then
        raise exception 'delete_key requires p_key';
      end if;
      v_next := v_data - p_key;
    else
      raise exception 'Unsupported database action: %', p_action;
    end if;

  else
    v_data := case when jsonb_typeof(v_data) = 'array' then v_data else '[]'::jsonb end;

    if p_action = 'upsert_id' then
      if p_item is null then raise exception 'upsert_id requires p_item'; end if;
      v_id := coalesce(nullif(p_item->>'id',''), nullif(p_item_id,''));
      if v_id is null then raise exception 'upsert_id requires item id'; end if;

      select coalesce(jsonb_agg(elem order by ord), '[]'::jsonb)
        into v_next
      from jsonb_array_elements(v_data) with ordinality as t(elem, ord)
      where coalesce(elem->>'id','') <> v_id;

      -- Keep newest mutation first; app sorting remains authoritative for display.
      v_next := jsonb_build_array(p_item) || v_next;

    elsif p_action = 'delete_id' then
      v_id := nullif(p_item_id,'');
      if v_id is null then raise exception 'delete_id requires p_item_id'; end if;

      select coalesce(jsonb_agg(elem order by ord), '[]'::jsonb)
        into v_next
      from jsonb_array_elements(v_data) with ordinality as t(elem, ord)
      where coalesce(elem->>'id','') <> v_id;

    elsif p_action = 'delete_session' and p_bucket = 'history' then
      if nullif(p_session_id,'') is null then raise exception 'delete_session requires p_session_id'; end if;

      select coalesce(jsonb_agg(elem order by ord), '[]'::jsonb)
        into v_next
      from jsonb_array_elements(v_data) with ordinality as t(elem, ord)
      where coalesce(elem->>'shoppingSessionId','') <> p_session_id;

    else
      raise exception 'Unsupported % action: %', p_bucket, p_action;
    end if;
  end if;

  update public.household_data
  set data = v_next,
      updated_at = now(),
      updated_by = auth.uid()
  where household_id = p_household_id
    and bucket = p_bucket;

  return v_next;
end;
$$;

revoke execute on function public.cn_household_bucket_mutate_v1(uuid,text,text,jsonb,text,text,text) from public, anon;
grant execute on function public.cn_household_bucket_mutate_v1(uuid,text,text,jsonb,text,text,text) to authenticated;
