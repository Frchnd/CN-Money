# CN MONEY v3.1.1 — QUICK CHECKOUT BLANK ENTRY

Baseline: CN MONEY v3.1.0 Stable.

## Perubahan

- **Harga per Satuan** pada Quick Checkout tidak lagi diisi otomatis dari harga terakhir.
- Kolom harga selalu kosong setiap kali Quick Checkout dibuka, sehingga user langsung mengetik harga pembelian saat ini.
- **Nama Produk** juga selalu kosong ketika Quick Checkout dibuka.
- Nama Produk tetap opsional: jika dibiarkan kosong, checkout memakai nama induk barang dari LIST/DATA sebagai nama produk.
- Harga terakhir tetap disimpan setelah checkout valid dan tetap dipakai untuk estimasi LIST/DATA; yang dihapus hanya perilaku auto-fill pada form checkout.
- Tempat Beli, Satuan, Dompet terakhir, dan Tanggal Dibeli tetap berperilaku seperti v3.1.0.

## Database / Supabase

Tidak ada SQL migration baru. Tidak ada perubahan schema/RPC.

## Regression focus

1. Tap item LIST yang sudah punya riwayat harga → Harga per Satuan harus kosong.
2. Tap item LIST yang sudah punya variant/product lama → Nama Produk harus kosong.
3. Checkout dengan Nama Produk kosong → item tersimpan memakai nama induk.
4. Isi Nama Produk manual → nama variant tersebut tersimpan normal.
5. Setelah checkout, estimasi LIST tetap dapat memakai harga terakhir yang baru.
6. Tanggal Dibeli v3.1.0 tetap bekerja.
