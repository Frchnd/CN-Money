# CN MONEY v0.5E SAFE

UI/picker update dari checkpoint v0.5D yang stabil.

Perubahan:
- PENGELUARAN merah, PEMASUKAN hijau, TRANSFER biru dengan visual family CN MONEY.
- Dompet, kategori, tanggal transaksi memakai picker/bottom-sheet CN MONEY; tidak lagi select/calendar browser.
- Transfer tetap tanpa kategori karena transfer bukan pemasukan/pengeluaran.
- Grouping HISTORY memakai picker CN MONEY.
- Checkout Dompet dan Satuan memakai picker CN MONEY.
- Edit kategori barang + satuan memakai picker CN MONEY.
- LAINNYA tetap di urutan paling bawah.
- Settings: SUARA ON hijau, OFF merah; helper text yang diminta dihapus; judul setting diperbesar.
- Judul utama/card/item tampil CAPSLOCK termasuk nama item DATA BELANJA.
- CN MONEY lebih tebal dan letter spacing lebih lega.
- Startup, Supabase RPC, realtime, saldo, database schema, dan sound files tidak diubah.
- Tidak perlu SQL.

Deploy: replace isi repo `finansial-main`, commit, tunggu Vercel Ready, buka online sekali lalu buka ulang PWA.
