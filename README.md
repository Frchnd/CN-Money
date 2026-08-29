# CN MONEY v2.0.0

FINAL RELEASE.

Sudah mencakup:
- Dashboard, Budget, Insight, Activity
- List Belanjaan, Data Barang, Receipt
- History finansial
- Dompet, Investasi, Aset, Total Aset
- Pendapatan investasi otomatis
- Household realtime
- Household push notifications
- Offline cache yang aman
- Backup / Restore + checkpoint + rollback
- Android Back navigation
- Light / Dark + sound

Final audit v2.0.0:
- Paket deploy sekarang self-contained.
- Icon dan sound approved ikut di ZIP.
- Main service worker tidak cache data Supabase.
- Restore rollback marker dibersihkan setelah sukses.
- Android Back dari preview Restore kembali ke Settings.
- Backup file menandai app_version 2.0.0.
- Service worker update tidak memakai cache lama.

Tidak ada SQL baru.
Tidak perlu ubah Edge Function.
Tidak perlu ubah Push Secrets.

Receipt PDF thermal 80mm:
- EXPORT PDF tersedia di detail RECEIPT.
- Lebar PDF 80mm, tinggi otomatis mengikuti panjang nota.
- Toko, tanggal, dompet, item, qty/UOM, harga satuan, subtotal, total.
- Dibuat lokal di perangkat tanpa layanan PDF eksternal.
