# CN MONEY v0.4F SAFE

Sound-only hotfix berbasis v0.4E SAFE yang sudah lolos tes.

Perubahan:
- Sound cash-register/ka-ching diganti memakai audio referensi yang diberikan user.
- Bagian hening awal dibuang.
- Dipotong menjadi sekitar 1,46 detik agar singkat tetapi karakter ka-ching tetap utuh.
- Fade-in/fade-out ringan untuk mencegah klik digital.
- Level suara dinormalisasi agar jelas di speaker HP tanpa terlalu keras.
- Nama asset dibuat baru agar PWA tidak memakai file suara lama dari cache.
- Cache Service Worker dinaikkan ke v0.4F.

Tidak ada perubahan database, transaksi, Supabase, realtime, startup, atau flow aplikasi. Tidak memerlukan SQL baru.
