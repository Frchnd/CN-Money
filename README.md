# CN MONEY v2.4.19 — STALE SHOPPING ESTIMATE FIX

Scope release ini sengaja sempit: memperbaiki ESTIMASI TOTAL pada LIST setelah DATA barang dihapus atau checkout dibatalkan.

## Perubahan
- ESTIMASI TOTAL sekarang mengambil harga hanya dari DATA aktif (`itemDb`), bukan menghidupkan kembali harga dari riwayat mentah.
- Jika DATA harga suatu barang dihapus, item tersebut kembali dianggap `ITEM TANPA HARGA` sampai ada checkout valid baru.
- Jika checkout dibatalkan, harga dari sesi yang dibatalkan tidak boleh muncul lagi pada estimasi.
- Riwayat/Receipt tetap menjadi arsip dan tidak dihapus hanya karena DATA harga dihapus.
- Fallback history untuk dompet terakhir hanya membaca session yang masih aktif; row dari checkout yang sudah dibatalkan diabaikan.

## Backend
Tidak ada SQL baru untuk v2.4.19.

## Tidak disentuh
- UI/tab/card/layout global.
- Detail DATA v2.4.17.
- DATABASE Kategori/Subkategori v2.4.18.
- Master taxonomy/autocorrect v2.4.16.
- Finance, saldo, transaksi, sync dua HP, offline, Back, cancel/undo, backup/restore.
