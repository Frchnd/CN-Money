# CN MONEY v0.5B SAFE

Visual/layout cleanup only. No SQL required.

Perubahan:
- History Belanja: garis putus-putus dihilangkan, typography diperbesar dan memakai font utama aplikasi.
- Receipt: font thermal/monospace dibatasi untuk receipt yang sedang dibuka; list receipt tetap modern.
- Chart arus kas: nilai 0 tampil sebagai capsule kosong yang rapi; bar tidak overflow.
- Daftar Belanja & Data Barang: nama/meta diperbesar dan diberi ruang lebih banyak tanpa menabrak harga/aksi.
- Selector Tampilan/Suara di Settings dipusatkan dalam tap target.
- Arrow/icon native pada selector bulan disembunyikan, fungsi selector tetap ada.
- Scrollbar visual pada content/subtab/filter disembunyikan.
- Startup screen diganti dengan splash CN MONEY yang lebih rapi tanpa mengubah boot logic.
- Tidak mengubah Supabase, realtime, saldo, transaksi, checkout, sound, smart input, atau startup engine.

Deploy:
1. Replace file repo `finansial-main` dengan isi folder ini.
2. Commit dan tunggu Vercel Ready.
3. Buka online sekali, tutup, lalu buka PWA lagi.
