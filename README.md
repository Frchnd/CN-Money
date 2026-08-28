# CN MONEY v1.9.0

Backup / Restore + Release Audit.

- BACKUP sekarang mengambil snapshot penuh langsung dari Supabase, bukan hanya data yang sedang tampil di layar.
- Format tetap .cnmoney.
- RESTORE validasi file + Household sebelum perubahan data.
- Preview jumlah Dompet / Transaksi / Investasi / Aset / Belanja.
- Restore hanya untuk Household yang sama.
- Checkpoint server otomatis dibuat sebelum restore.
- BATALKAN RESTORE tersedia setelah restore.
- Push subscriptions / secrets / device settings tidak ikut ditimpa.
- Empty-state emoji lama diganti outline icon yang konsisten.

SQL v1.9.0 wajib dijalankan sekali sebelum fitur Backup/Restore dipakai.
