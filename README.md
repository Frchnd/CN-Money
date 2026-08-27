# CN MONEY v0.5F SAFE

Fokus: Detail Anggaran + consistency/stability audit.

Perubahan:
- Card ANGGARAN BELANJA dapat diketuk untuk membuka DETAIL ANGGARAN.
- Detail menampilkan anggaran, terpakai, sisa/kelebihan, sesi checkout bulan aktif, item, qty, harga satuan, subtotal, tempat beli, tanggal, dan dompet.
- Edit anggaran tidak lagi menggunakan month picker browser. Anggaran mengikuti bulan yang sedang aktif di Dashboard.
- HISTORY, HISTORY BELANJA, dan RECEIPT diberi sorting eksplisit terbaru di atas.
- Tidak ada alert/confirm browser baru; modal/konfirmasi tetap menggunakan UI CN MONEY.
- Startup, Supabase schema/RPC, realtime, transaksi, saldo, sound, dan engine checkout tidak diubah.
- Tidak perlu SQL.

Deploy:
1. Replace isi repo `finansial-main` dengan isi folder ini.
2. Commit dan tunggu Vercel Ready.
3. Buka aplikasi online sekali, tutup, lalu buka PWA lagi.
