# CN MONEY v2.4.14 — DATABASE SELECTION FIX

## Perubahan
- Memperbaiki toggle KATEGORI / SUB KATEGORI / MEREK / BARANG di Pengaturan > DATABASE.
- Pilihan sekarang berupa draft lokal: tap tidak langsung menulis ke Supabase.
- Tombol **SIMPAN** menjadi satu-satunya commit perubahan ke Supabase.
- Tombol **SELECT ALL** tersedia di setiap tab dan bersifat toggle dua arah.
- SELECT ALL pada KATEGORI mencakup seluruh kategori + subkategori di dalamnya.
- SELECT ALL pada SUB KATEGORI memastikan parent kategori aktif lalu memilih seluruh subkategori.
- SELECT ALL pada BARANG memastikan parent kategori/subkategori aktif lalu memilih seluruh barang.
- Menutup DATABASE tanpa SIMPAN membuang perubahan draft.

## Database / Supabase
Tidak ada SQL baru. Tetap memakai RPC `cn_catalog_set_visibility` yang sudah tersedia.

## Regression freeze
Tidak mengubah master taxonomy, finance, sync dua HP, offline boot, transaction picker, atau layout utama.
