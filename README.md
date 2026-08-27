# CN MONEY v0.6A.1 SAFE

Hotfix visual BELANJA berbasis v0.6A.

Perubahan:
- Tab CHECKOUT -> LIST BELANJAAN.
- Tab DATA -> DATA BARANG.
- Tiga sub-tab BELANJA dirapikan dan dibuat centered/equal.
- Ikon Undo pada item SUDAH DIBELI tidak ikut redup.
- DATA BARANG dirapikan menjadi card yang jelas dan tanpa chevron/panah.
- Card DATA BARANG memakai indikator DETAIL yang ringan.
- Popup detail barang didesain ulang menjadi bottom sheet yang tertata.
- Informasi dipisah menjadi PEMBELIAN TERAKHIR, RINGKASAN BARANG, dan RIWAYAT PEMBELIAN.
- Riwayat pembelian punya pembatas/card per transaksi dan terbaru tetap di atas.
- Tombol Receipt di riwayat item dihapus. Receipt tetap hanya di tab RECEIPT.
- EDIT dan HAPUS tetap berada di detail barang.
- Checkout engine, saldo, anggaran, Supabase, realtime, startup, dan sound tidak diubah.
- Tidak perlu SQL.

Deploy:
1. Extract ZIP.
2. Replace isi repo `finansial-main` dengan isi folder ini.
3. Commit.
4. Tunggu Vercel Ready.
5. Buka aplikasi online sekali lalu buka ulang PWA.
