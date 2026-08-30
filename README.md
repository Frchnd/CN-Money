# CN MONEY v2.3.3

HOUSEHOLD DATABASE + PRODUCT VARIANTS

- Dropdown rekomendasi saat mengetik LIST dihapus.
- DATA filter ALPHABET -> A - Z.
- Edit nama barang mengubah record keluarga barang yang sama.
  Nama lama tetap menjadi alias dan akan diarahkan ke nama terbaru saat ditambahkan lagi.
- Edit KATEGORI / SUB KATEGORI / PRIORITAS / UOM langsung menjadi preferensi database Household.
  Database master bawaan tetap fallback.
- Quick Checkout punya NAMA PRODUK:
  LIST bisa tetap SHAMPOO, sementara produk yang dibeli bisa SHAMPOO ZINC / PANTENE / LIFEBUOY.
- Receipt dan riwayat pembelian menyimpan nama produk yang benar.
- DATA tetap satu card keluarga (contoh SHAMPOO).
- Detail DATA menampilkan PRODUK DIBELI dan riwayat masing-masing produk.
- Produk terakhir diingat sebagai default NAMA PRODUK checkout berikutnya.

Tidak ada SQL baru.
Tetap memakai Supabase v2.3.2.
Autocorrect typo/ambiguity belum diaktifkan dan dipindahkan ke update berikutnya.
