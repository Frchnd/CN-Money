# CN MONEY v2.4.12 — TRANSACTION PICKER UI RESTORE

Hotfix visual regression: picker Tambah Transaksi dikembalikan ke desain semantic yang sudah ada sebelumnya — Pengeluaran merah, Pemasukan hijau, Transfer biru — tanpa mengubah logic navigation/stability. Tidak ada SQL baru.

# CN MONEY v2.4.12 — NAVIGATION + ACTION REGRESSION FIX

Hotfix setelah stability audit v2.4.10.

## Perbaikan
- Semua modal finance yang dibutuhkan tombol `+` dipulihkan: transaksi, Saku, Investasi, Aset, dan Budget.
- Detail/Edit Investasi dan Aset dipulihkan agar seluruh flow Kekayaan lengkap.
- Back di modal/detail memakai satu mekanisme `performAppBack()` yang sama.
- Tombol Back Android selalu mencoba kembali ke tampilan user sebelumnya sebelum menawarkan keluar dari aplikasi.
- Tombol close/back pada detail tidak lagi hard-close ke state yang salah.
- Status ONLINE/OFFLINE dipindahkan ke header tepat di bawah `CN MONEY`.
- Status koneksi tidak diduplikasi lagi di baris Household Pengaturan.

## Backend
Tidak ada SQL baru. Migration v2.4.7 dan v2.4.8 tetap sama.
