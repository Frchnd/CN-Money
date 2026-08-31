# CN MONEY v2.6.1 — CUSTOM COMBINED RECEIPT

## Scope
- Tab RECEIPT tidak lagi membuat satu card untuk setiap checkout.
- Semua data pembelian tetap disimpan per transaksi asli untuk audit/cancel, tetapi tampilan RECEIPT dibangun dinamis dari filter.
- Filter bisa digabung: TANGGAL + TOKO + BARANG.
- BARANG mendukung pemilihan satu atau beberapa item.
- Hasil filter ditampilkan sebagai satu receipt gabungan, dikelompokkan per tanggal/toko/dompet agar asal pembelian tetap jelas.
- EXPORT PDF mengikuti receipt kustom yang sedang tampil.
- Tidak ada SQL baru dan tidak ada perubahan transaksi finansial.

## Catatan
Data checkout asli tidak di-merge atau dihapus. Perubahan hanya pada cara data receipt dibaca dan ditampilkan.
