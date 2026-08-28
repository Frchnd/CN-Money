# CN MONEY v1.62.3

Patch release lanjutan dari CN MONEY v1.62.2.

## Perubahan
- Teks "Receipt muncul otomatis setelah checkout." dihapus.
- Smart defaults belanja sekarang membaca histori pembelian terakhir jika DATA BARANG lokal belum lengkap.
- Harga terakhir otomatis menjadi default Checkout.
- Tempat beli terakhir otomatis menjadi default Checkout.
- UOM/satuan terakhir otomatis menjadi default Checkout.
- Kategori dan prioritas tetap memakai profil/koreksi pengguna terlebih dahulu, lalu fallback ke DATA BARANG dan rule lokal.
- Dompet terakhir aplikasi tetap menjadi prioritas; jika belum ada, histori item terakhir bisa menjadi fallback dompet.
- LIST BELANJAAN bisa menampilkan harga terakhir dari histori walaupun cache DATA BARANG belum lengkap.
- Tidak ada AI/cloud dependency baru untuk klasifikasi/default ini.

## Versioning CN MONEY
Mulai release ini nomor versi user-facing memakai pola:
- patch kecil: 1.62.2 -> 1.62.3
- feature/minor release yang lebih besar: contoh 1.7.0
- major/final milestone: contoh 2.0.0 atau 3.0.0

Label v0.6B.x sebelumnya hanya dianggap label kerja internal.

## Database
Tidak ada SQL baru.

## Area yang tidak diubah
Startup, Supabase schema/RPC finansial, saldo, transaksi, realtime, investasi, aset, budget, receipt engine, dan sound.
