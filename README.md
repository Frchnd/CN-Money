# CN MONEY v2.1.0

Settings + Smart Shopping polish.

Perubahan:
- HOUSEHOLD + ONLINE/OFFLINE dipindah dari header ke PENGATURAN.
- GUIDE CN MONEY ditambahkan ke PENGATURAN.
- GUIDE menjelaskan Dashboard, Belanja, Smart Learning, Data Barang, Receipt, Kekayaan, Backup/Restore, dan Notifikasi.
- Subtitle "Semua arus uang bersama" di HISTORY dihapus.
- Barang SUDAH DIBELI hanya tampil maksimal 24 jam di LIST BELANJAAN.
- Setelah 24 jam barang hanya disembunyikan dari List; Receipt/History tetap aman.
- Item tes lama otomatis tidak tampil lagi karena sudah lewat 24 jam.
- RESTORE TERAKHIR / BATALKAN hanya muncul setelah Restore benar-benar dilakukan pada v2.1.0+, bukan karena marker tes versi lama.

SMART LEARNING SAAT INI:
- Koreksi Kategori/Prioritas/UOM disimpan sebagai profil barang di Supabase.
- Profil tersinkron antar perangkat Household.
- Harga, toko, UOM, dan dompet terakhir dipelajari dari riwayat pembelian.
- Barang baru memakai rule internal.
- Tidak ada AI/search internet background.

Tidak ada SQL baru.
Tidak perlu ubah Edge Function.
Tidak perlu ubah Push Secrets.
