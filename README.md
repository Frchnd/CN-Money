CN MONEY v2.4.10 — CANCEL / UNDO + BACK NAVIGATION STABILITY

Baseline
- Melanjutkan v2.4.9 Offline Boot Fix.
- SQL v2.4.7 dan v2.4.8 tetap dipakai dan TIDAK berubah.
- Tidak ada SQL baru untuk v2.4.10.

Perubahan v2.4.10
1. Cancel checkout sekarang crash-safe di sisi client.
   - Intent pembatalan disimpan lokal sebelum RPC dijalankan.
   - Jika server sudah membatalkan checkout tetapi aplikasi tertutup sebelum cleanup LIST/DATA selesai, cleanup dilanjutkan otomatis saat online/reopen.
   - Cleanup LIST, legacy history, dan DATA tetap memakai mutation queue conflict-safe v2.4.7.

2. Backup/Restore tidak boleh berjalan ketika pembatalan checkout masih pending.
   - Pending cancel dicoba diselesaikan lebih dulu.
   - Jika belum selesai, backup/restore ditahan agar snapshot tidak berada di state setengah jadi.

3. Confirmation tidak lagi membuang konteks.
   - Tekan HAPUS/BATALKAN dari detail -> muncul konfirmasi di atas detail.
   - Pilih BATAL -> kembali ke detail yang sama.
   - Detail baru ditutup setelah tindakan destruktif benar-benar dikonfirmasi.

4. Back navigation bertingkat.
   - Choice/date picker -> tutup picker dulu.
   - Form transaksi -> kembali ke pemilih jenis transaksi.
   - Edit Dompet/Investasi/Aset -> kembali ke detail entity.
   - Pendapatan Investasi -> kembali ke detail Investasi.
   - Edit DATA -> kembali ke detail DATA jika dibuka dari sana.
   - Detail pembelian -> kembali ke detail DATA jika dibuka dari riwayat barang.
   - Detail Receipt -> kembali ke daftar Receipt.
   - Guide/Panduan/Database Settings -> kembali ke Pengaturan.
   - Setelah tidak ada layer/detail lagi, Back kembali mengikuti navigasi utama dan double-back untuk keluar.

5. Guard double-action.
   - Delete/Undo/Cancel yang sedang diproses tidak dapat dijalankan ulang paralel karena tap berulang.

Audit alur UI
- Entry point yang muncul di beberapa konteks tidak dihapus bila memang memperpendek akses pengguna.
- Tidak ada redesign besar atau penambahan fitur pada release ini.

Deploy
1. Pastikan v2.4.7 SQL dan v2.4.8 SQL sudah pernah dijalankan seperti versi sebelumnya.
2. Tidak perlu menjalankan SQL baru.
3. Deploy/install v2.4.10.
4. Buka sekali online agar service worker v2.4.10 mengambil shell baru.
5. Jalankan RELEASE-CHECKLIST.txt.
