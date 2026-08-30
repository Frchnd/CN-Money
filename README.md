# CN MONEY v2.3.4

DATA DETAIL / CANCEL CHECKOUT FIX

- Detail DATA sekarang scroll vertikal sebagai satu halaman.
- Tidak ada nested scroll yang bikin bagian bawah terjebak.
- BATALKAN CHECKOUT sekarang ikut membersihkan data pembelian:
  - produk dibeli dari checkout itu hilang
  - riwayat pembelian dari checkout itu hilang
  - harga/toko/pembelian terakhir dihitung ulang
  - kalau produk yang sama masih punya checkout valid lain, produknya tetap ada
- Pembelian yang pernah dibatalkan sebelum v2.3.4 juga tidak lagi ditampilkan
  di detail DATA karena hanya sesi checkout aktif yang dihitung.
- Profil barang, kategori, sub kategori, UOM dan alias tetap dipertahankan.

Tidak ada SQL baru.
Tetap memakai Supabase v2.3.2.
Autocorrect/ambiguity dipindahkan ke update berikutnya.
