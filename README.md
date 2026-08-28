# CN MONEY v1.8.1

Household notification stability patch.

Perubahan:
- Subscription push otomatis diperiksa ulang saat aplikasi dibuka.
- Subscription push otomatis diperbaiki setelah koneksi kembali online.
- Sync subscription diberi lock + throttle agar tidak request berulang.
- Jika permission Android/Chrome dicabut dari luar aplikasi, status NOTIFIKASI otomatis kembali OFF.
- Toggle NOTIFIKASI membaca status permission aktual.
- Service worker push diminta update tanpa cache lama.
- Tidak mengubah aturan notifikasi: hanya PEMASUKAN, PENGELUARAN, dan barang baru LIST BELANJAAN.
- TRANSFER dan CHECKOUT tetap tanpa notifikasi.

Tidak ada SQL baru.
Tidak perlu ubah Edge Function atau Secrets.
