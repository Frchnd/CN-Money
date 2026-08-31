# CN MONEY v2.4.16 — TOTAL SHOPPING TAXONOMY RESET + MASTER EXPANSION

## Master kategori baru
Taxonomy belanja di-reset penuh sesuai master yang disetujui. Judul kategori boleh memiliki keterangan Inggris dalam kurung; subkategori tidak menampilkan teks penjelas dalam kurung.

1. Kebutuhan Rumah (House Care)
   - Dapur
   - Laundry
   - Kamar Mandi
   - Penghilang Bau & Hama
   - Lainnya
2. Perawatan Diri (Personal Care)
   - Rambut & Kepala
   - Gigi & Mulut
   - Badan
   - Lainnya
3. Bahan Segar (Fresh Goods)
   - Bumbu
   - Sayur
   - Buah
   - Seafood
   - Daging
   - Telur, Tahu & Tempe
   - Lainnya
4. Sembako & Bahan Kering (Pantry / Dry Goods)
   - Beras & Karbohidrat
   - Minyak & Lemak
   - Saus & Bumbu Kering
   - Awetan & Kaleng
   - Lainnya
5. Susu & Makanan Beku (Dairy & Frozen)
   - Susu & Olahannya
   - Frozen Food
   - Lainnya
6. Minuman & Camilan (Beverages & Snacks)
   - Kopi & Teh
   - Minuman Cair
   - Camilan
   - Lainnya
7. Kesehatan & P3K (Health Care)
   - Obat Dalam & Vitamin
   - Obat Luar & Perawatan
   - Lainnya
8. Kebutuhan Khusus
   - Bayi & Anak
   - Hewan Peliharaan
   - Lainnya
9. Lainnya
   - Lainnya

## Master barang / autocorrect
- Master canonical diperluas dari 318 menjadi **959 nama barang**.
- Alias bahasa sehari-hari ditambah dan dinormalisasi, termasuk odol, sampo, SKM, cabe, mie, saos, pampers, cat food, dog food, dan variasi umum lain.
- Autocorrect v2.4.16 berisi mapping typo konservatif yang hanya menarget canonical master aktif.
- Nama yang tidak dikenali tetap masuk **Lainnya → Lainnya** sampai diedit manual di DATA.

## Migrasi data lama
- Item di LIST/DATA yang masih menyimpan taxonomy sebelum v2.4.16 otomatis direlasikan ulang ke master baru pada load pertama.
- Semua 318 master lama sudah dipetakan ke taxonomy baru.
- Item user yang tidak dikenal master dipindahkan ke **Lainnya → Lainnya**.
- Setelah v2.4.16, edit manual kategori/subkategori di DATA diberi `taxonomyVersion=2.4.16` dan tetap menjadi override user.
- Migrasi menggunakan RPC bucket atomik v2.4.7 yang sudah ada; tidak ada schema baru.

## DATABASE visibility
Fitur select/unselect + SELECT ALL + save atomik v2.4.15 tetap dipertahankan. Key taxonomy lama menjadi orphan dan tidak dipakai oleh taxonomy baru; semua node taxonomy baru aktif secara default sampai user mengubahnya dan menekan SIMPAN.

## Supabase
**Tidak ada SQL baru untuk v2.4.16.**

Tetap simpan migration sebelumnya di repo:
- `SUPABASE-v2.4.7-STABILITY-SYNC.sql`
- `SUPABASE-v2.4.8-FINANCE-IDEMPOTENCY.sql`
- `SUPABASE-v2.4.15-CATALOG-VISIBILITY-BATCH.sql`

## Regression freeze
v2.4.16 tidak mengubah finance, saldo, transaksi, receipt, investasi, aset, offline boot, sync dua HP, back navigation, warna transaction picker, atau layout utama.
