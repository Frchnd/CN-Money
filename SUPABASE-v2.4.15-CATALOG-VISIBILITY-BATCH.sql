-- CN MONEY v2.4.15 — atomic DATABASE visibility save
-- Run once in Supabase SQL Editor BEFORE deploying v2.4.15.
-- This does not change finance/shopping history data. It only adds a batch RPC
-- around the existing cn_catalog_set_visibility(...) RPC.

create or replace function public.cn_catalog_set_visibility_batch_v1(
  p_household_id uuid,
  p_changes jsonb
)
returns jsonb
language plpgsql
security invoker
set search_path = public
as $$
declare
  v_change jsonb;
  v_kind text;
  v_key text;
  v_next boolean;
  v_count integer := 0;
begin
  if p_household_id is null then
    raise exception 'household_id is required';
  end if;

  if p_changes is null or jsonb_typeof(p_changes) <> 'array' then
    raise exception 'changes must be a JSON array';
  end if;

  if jsonb_array_length(p_changes) > 2000 then
    raise exception 'too many visibility changes';
  end if;

  for v_change in select value from jsonb_array_elements(p_changes)
  loop
    v_kind := nullif(trim(v_change ->> 'kind'), '');
    v_key  := nullif(trim(v_change ->> 'key'), '');
    v_next := coalesce((v_change ->> 'next')::boolean, true);

    if v_kind not in ('category','subcategory','brand','item') then
      raise exception 'invalid catalog kind: %', coalesce(v_kind, '<null>');
    end if;
    if v_key is null then
      raise exception 'catalog key is required';
    end if;

    -- Keep the existing household-membership / visibility rules in one place.
    -- If any one mutation fails, PostgreSQL rolls back the whole outer RPC,
    -- so the client can never end up with a half-saved selection.
    perform public.cn_catalog_set_visibility(
      p_household_id => p_household_id,
      p_kind => v_kind,
      p_entry_key => v_key,
      p_is_visible => v_next
    );

    v_count := v_count + 1;
  end loop;

  return jsonb_build_object('ok', true, 'count', v_count);
end;
$$;

grant execute on function public.cn_catalog_set_visibility_batch_v1(uuid,jsonb) to authenticated;
