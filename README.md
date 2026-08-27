# CN MONEY v0.6A SAFE

Shopping DATA redesign dari basis v0.5G yang stabil.

Perubahan:
- Tab BELANJA sekarang hanya CHECKOUT | DATA | RECEIPT.
- HISTORY BELANJA dihapus dari navigasi.
- Tap item di DATA membuka detail item.
- Detail item berisi kategori, satuan, pembelian terakhir, dan seluruh riwayat pembelian item tersebut (terbaru di atas).
- Dari setiap riwayat item bisa membuka RECEIPT atau membatalkan checkout terkait.
- EDIT dan HAPUS Data Barang dipindahkan ke dalam detail item.
- Hapus Data Barang tetap tidak menghapus transaksi finansial, receipt, atau history checkout di server.
- Startup, Supabase schema/RPC, saldo, realtime, sound, dan engine checkout tidak diubah.
- Tidak perlu SQL baru.

Deploy:
1. Replace file versi sebelumnya dengan isi folder ini.
2. Commit ke repo `finansial-main`.
3. Tunggu Vercel Ready.
4. Buka online sekali, tutup, lalu buka PWA lagi.
