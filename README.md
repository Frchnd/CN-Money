# CN MONEY v0.6A.3 SAFE

Perubahan:
- Teks "Kelola sumber dana" dihapus.
- DOMPET, INVESTASI, ASET: card -> tap -> popup DETAIL.
- EDIT/HAPUS dipindah ke popup DETAIL.
- EDIT DOMPET bisa koreksi SALDO SAAT INI.
- Koreksi saldo dicatat ke HISTORY sebagai adjustment, tidak dihitung sebagai PEMASUKAN/PENGELUARAN.
- INVESTASI: Total Modal dan Nilai Sekarang tetap bisa diedit.
- ASET: Harga Beli dan Nilai Sekarang tetap bisa diedit.
- TAMBAH INVESTASI: SUMBER DANA memakai picker CN MONEY.
- Jenis DOMPET / INVESTASI / ASET memakai picker CN MONEY.
- TAMBAH dan EDIT ASET: TANGGAL BELI memakai kalender CN MONEY.
- Tombol BATALKAN SESI di DETAIL PEMBELIAN diperkecil.
- Startup, checkout, realtime, budget, sound, dan struktur database shopping tidak diubah.

WAJIB satu kali:
Jalankan SUPABASE-v06A3-WALLET-CORRECTION.sql di Supabase SQL Editor sebelum memakai fitur koreksi saldo.
