# CN MONEY v2.3.1

CLEAN UI / BUG PATCH

- Hapus spinner/panah bawaan browser pada JUMLAH checkout.
- DATA depan sekarang mengikuti gaya LIST:
  - hanya nama barang
  - tanpa kategori
  - tanpa prioritas
  - tanpa UOM
  - tanpa toko
  - tanpa harga
  - tanpa tulisan DETAIL
  - tap item untuk membuka seluruh detail.
- HISTORY mencegah kategori tampil dua kali jika sudah ada di judul transaksi.
- RECEIPT tidak mengulang judul RECEIPT di bawah tab RECEIPT.
- KEKAYAAN tidak mengulang judul SAKU / INVESTASI / ASET di hero dan list.
- Empty state DOMPET diselaraskan menjadi SAKU.

Tidak ada SQL baru.
Tetap memakai Supabase v2.3.0.
Fitur autocorrect lanjutan dipindahkan ke update berikutnya agar patch ini tetap aman.
