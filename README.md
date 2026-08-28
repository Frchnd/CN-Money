# CN MONEY v0.6B.1 SAFE — SHOPPING INTELLIGENCE

Fokus: klasifikasi KATEGORI + PRIORITAS barang.

Yang berubah:
- Barang baru tetap diklasifikasikan otomatis ke kategori belanja.
- Ditambahkan prioritas otomatis: PRIMER / SEKUNDER / PELENGKAP.
- Hasil otomatis tetap bisa diedit dari ikon pensil / detail DATA BARANG.
- Koreksi kategori dan prioritas disimpan sebagai profil barang dan dipakai lagi di perangkat household.
- LIST BELANJAAN menampilkan chip kategori + prioritas yang compact.
- DATA BARANG menampilkan chip kategori + prioritas + UOM.
- Detail DATA BARANG menampilkan PRIORITAS di ringkasan.
- Modal edit barang berubah menjadi PROFIL BARANG: KATEGORI, PRIORITAS, SATUAN.
- LAINNYA tetap selalu berada paling akhir.
- Tidak ada AI/API berbayar. Klasifikasi dasar berjalan rule-based dan offline-friendly.
- Startup, saldo, transaksi, checkout RPC, wallet, investasi, aset, receipt, realtime, sound, dan budget tidak diubah.

SQL:
- Jalankan `SUPABASE-v06B1-SHOPPING-PRIORITY.sql` SEKALI sebelum deploy.
- SQL hanya menambah kolom `priority` pada `shopping_item_profiles` dan RPC aman untuk menyimpan koreksi prioritas.
- SQL tidak menghapus data lama.

Tes utama:
1. Tambah `Telur` -> harus otomatis TELUR + PRIMER.
2. Tambah `Tahu` -> PROTEIN + PRIMER.
3. Tambah `Keripik` -> SNACK & CAMILAN + SEKUNDER.
4. Tambah `Spatula` -> PERLENGKAPAN DAPUR + PELENGKAP.
5. Edit prioritas satu barang, simpan, tutup/buka kembali aplikasi -> koreksi harus tetap.
6. Cek perangkat household kedua -> koreksi harus ikut setelah sync.
