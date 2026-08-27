-- CN MONEY MAIN v0.3
-- Memperluas kategori barang belanja. Tidak menghapus data yang sudah ada.

create or replace function public.shopping_seed_categories(
    p_household_id uuid
)
returns void
language plpgsql
security definer
set search_path = ''
as $$
begin
    if auth.uid() is null then
        raise exception 'Authentication required';
    end if;

    if not public.is_household_member(p_household_id) then
        raise exception 'Not a household member';
    end if;

    insert into public.shopping_categories (
        household_id,
        name,
        sort_order
    )
    values
        (p_household_id, 'Makanan Pokok', 10),
        (p_household_id, 'Makanan Kaleng & Instan', 15),
        (p_household_id, 'Daging & Seafood', 20),
        (p_household_id, 'Telur & Protein Lain', 30),
        (p_household_id, 'Sayur', 40),
        (p_household_id, 'Buah', 50),
        (p_household_id, 'Susu & Produk Olahan', 60),
        (p_household_id, 'Bumbu & Bahan Masak', 70),
        (p_household_id, 'Bahan Baking & Dessert', 75),
        (p_household_id, 'Minuman', 80),
        (p_household_id, 'Snack & Camilan', 90),
        (p_household_id, 'Frozen Food', 100),
        (p_household_id, 'Roti & Bakery', 110),
        (p_household_id, 'Sarapan & Sereal', 120),
        (p_household_id, 'Kebersihan Rumah', 130),
        (p_household_id, 'Kebutuhan Kamar Mandi', 135),
        (p_household_id, 'Laundry', 140),
        (p_household_id, 'Perawatan Diri', 150),
        (p_household_id, 'Kesehatan & Obat', 160),
        (p_household_id, 'Bayi & Anak', 170),
        (p_household_id, 'Hewan Peliharaan', 180),
        (p_household_id, 'Perlengkapan Dapur', 190),
        (p_household_id, 'Perlengkapan Rumah', 200),
        (p_household_id, 'Tisu & Produk Kertas', 210),
        (p_household_id, 'Penyimpanan & Plastik', 220),
        (p_household_id, 'Alat Tulis & Sekolah', 230),
        (p_household_id, 'Elektronik & Baterai', 240),
        (p_household_id, 'Lainnya', 999)
    on conflict (
        household_id,
        name
    )
    do update set
        deleted_at = null,
        sort_order = excluded.sort_order;
end;
$$;

revoke execute
on function public.shopping_seed_categories(uuid)
from public, anon;

grant execute
on function public.shopping_seed_categories(uuid)
to authenticated;
