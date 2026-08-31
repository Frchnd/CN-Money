CN MONEY v2.4.9 — OFFLINE BOOT FIX

Tujuan
- Memperbaiki aplikasi yang berhenti di layar "Menyiapkan aplikasi" saat dibuka tanpa internet.
- Menjaga seluruh patch stability v2.4.7 dan finance idempotency v2.4.8 tetap utuh.

Akar masalah
- v2.4.8 memuat Supabase JS sebagai <script> CDN yang blocking sebelum boot lokal berjalan.
- Saat CDN tidak bisa dijangkau, kode aplikasi berhenti sebelum cache lokal/household lokal sempat dirender.

Perubahan v2.4.9
1. Supabase JS tidak lagi blocking saat startup.
   - Library dimuat lazy hanya ketika cloud benar-benar dibutuhkan.
   - Saat offline, app shell + cache lokal bisa boot tanpa Supabase JS.
2. Loader cloud punya timeout 7 detik.
   - Kondisi navigator.onLine=true tetapi internet sebenarnya mati tidak boleh menggantung library loader selamanya.
3. Service worker v2.4.9.
   - Shell/cache version dibump.
   - Runtime cache tetap boleh menyimpan library Supabase setelah berhasil dimuat online.
   - Instalasi offline shell tidak bergantung pada CDN Supabase.
4. Tidak ada perubahan SQL/schema Supabase.
5. Tidak ada perubahan master data, taxonomy, LIST/DATA mutation, finance RPC, saldo, transaksi, investasi, atau aset.

Cara update
- Tidak perlu menjalankan SQL baru.
- Deploy/install frontend v2.4.9 seperti update biasa.
- Buka sekali dengan internet setelah update agar service worker v2.4.9 aktif dan shell terbaru tersimpan.

Tes utama
A. Online sekali -> force close -> matikan internet -> buka CN MONEY.
   Expected: langsung masuk memakai data terakhir, bukan stuck loading.
B. Saat offline, pindah tab Dashboard / Shopping / Data / Wealth.
   Expected: data cache terakhir tetap bisa dibaca; operasi yang memang butuh internet boleh ditolak/pending sesuai desain.
C. Offline -> tambah LIST item -> force close -> reopen masih offline.
   Expected: item tetap ada lokal.
D. Nyalakan internet.
   Expected: app reconnect dan pending sync jalan tanpa reload manual.
E. Simulasikan jaringan buruk/captive connection.
   Expected: app yang sudah punya cache lokal tetap usable; cloud sync boleh gagal dan retry kemudian.
