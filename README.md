# CN MONEY v0.5A SAFE

Startup & stability optimization dari checkpoint stabil v0.4G.

Perubahan:
- Jika Household/cache lokal tersedia, UI dibuka langsung dari cache tanpa menunggu sync cloud selesai.
- Menghapus load cloud kedua dan jeda startup 250 ms yang redundant.
- Seed kategori tidak lagi dijalankan setiap boot; hanya bila hasil cloud benar-benar belum memiliki kategori.
- Mencegah pageshow/visibility/online memulai sync kedua saat startup masih berjalan.
- Reconnect diberi single-flight lock agar beberapa event tidak menembakkan loadAll bersamaan.
- Engine transaksi, RPC keuangan, struktur database, realtime subscription, shopping flow, sound, dan UI feature tidak diubah.
- Tidak perlu SQL.

Deploy:
1. Replace isi repo finansial-main dengan isi folder ini.
2. Commit dan tunggu Vercel Ready.
3. Buka online sekali.
4. Tutup lalu buka PWA kembali.
