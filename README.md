# CN MONEY v0.6A.2 SAFE

Interaction hotfix untuk DATA BARANG.

- Teks UI non-input tidak bisa terseleksi tidak sengaja.
- Input/textarea tetap normal.
- Setelah edit kategori/satuan dari detail item lalu simpan, kembali ke detail item yang sama.
- Riwayat pembelian dibatasi tinggi dan scroll di dalam kotaknya.
- Tiap riwayat bisa ditap untuk membuka DETAIL PEMBELIAN.
- Detail menampilkan tanggal, tempat beli, dompet, qty/UOM, harga satuan, subtotal, dan total sesi checkout.
- Tidak ada edit per-item yang berisiko merusak total sesi/saldo/budget.
- Pembatalan memakai BATALKAN SESI CHECKOUT yang sudah atomik.
- Receipt tetap hanya di tab RECEIPT.
- Tidak perlu SQL.
