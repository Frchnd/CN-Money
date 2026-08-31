# CN MONEY v2.4.13 — UI FLOW CLEANUP / REGRESSION HARDENING

Release ini adalah stability cleanup setelah v2.4.12.

Tidak ada redesign UI. Warna, card, icon, layout, urutan tab, dan picker transaksi v2.4.12 dipertahankan.

Perubahan:
- no-op ketika user menekan tab/subtab/filter yang sudah aktif, agar tidak membuat render dan back-stack noise;
- Guide Aplikasi, Panduan Kategori, dan Database memakai mekanisme Back yang sama;
- dead event handler dan helper legacy yang sudah tidak punya UI/caller dihapus;
- accessibility label tombol tambah transaksi di History disamakan dengan Dashboard.

Backend:
- tidak ada SQL baru;
- migration v2.4.7 dan v2.4.8 tetap disertakan sebagai histori backend.

Lihat `UI-FLOW-AUDIT-v2.4.13.md` untuk keputusan audit.
