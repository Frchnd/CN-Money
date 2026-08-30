# CN MONEY v2.2.0

Shopping + History UX update.

1. PROFIL BARANG:
   - Nama barang kembali bisa diedit.
   - Rename ikut mengubah item aktif + Data Barang.
   - Riwayat pembelian lama tetap tertaut lewat alias; Receipt lama tidak ditulis ulang.

2. VIEWPORT / BOTTOM NAV:
   - Bottom navigation fixed ke viewport.
   - Body tidak lagi ikut scroll di luar app.
   - Mengurangi kasus nav turun keluar layar setelah keyboard/modal.

3. MONTH PICKER:
   - Ganti desain grid + +/- menjadi horizontal rail BULAN dan TAHUN.

4. DATA BARANG:
   - SEMUA / ABJAD / KATEGORI / PRIORITAS / TERAKHIR.

5. LIST:
   - Tab berubah dari LIST BELANJAAN -> LIST.
   - Item aktif diurutkan alfabetis.

6. CLEAN LIST:
   - Card LIST hanya menampilkan nama + tombol edit/hapus.
   - Kategori, prioritas, UOM, harga disembunyikan dari LIST.
   - Data tetap ada di Profil/Data Barang.

7. HISTORY FILTER:
   - SEMUA -> BELANJA -> PENGELUARAN -> PEMASUKAN -> TRANSFER.

8. HISTORY DEVICE:
   - Tiap transaksi menampilkan DIBUAT OLEH [NAMA PERANGKAT].
   - Membutuhkan SQL v2.2.0 sekali.

Tidak perlu ubah Edge Function / Push Secrets.
