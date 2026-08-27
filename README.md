# CN MONEY MAIN v0.4.1

Hotfix startup loading.

- Membuka cache lokal lebih dulu bila perangkat sudah pernah bergabung.
- Sinkronisasi Supabase berjalan setelah UI sudah terbuka.
- Ada timeout agar aplikasi tidak berhenti selamanya di layar loading ketika jaringan/API lambat.
- Offline startup tetap memakai data terakhir di perangkat.
- Tidak memerlukan SQL baru.
