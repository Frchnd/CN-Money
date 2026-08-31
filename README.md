# CN MONEY v2.4.17 — DATA DETAIL HISTORY REFINEMENT

Scope release ini sengaja sempit: hanya detail item di tab DATA dan riwayat pembeliannya.

## Perubahan
- Panel `PEMBELIAN TERAKHIR` menampilkan harga unit termurah yang pernah tercatat untuk item/varian terkait beserta tempat belinya.
- Tanggal di panel tersebut dihapus karena tanggal sudah tersedia pada RIWAYAT PEMBELIAN.
- Nama produk pada setiap card RIWAYAT PEMBELIAN diperbesar.
- Tanggal pembelian dipindah ke baris bawah, tepat di tengah antara `QTY × HARGA` dan nama Saku.
- UOM (`PCS`, `KG`, dll.) di header detail DATA sekarang tampil sebagai pill/badge seperti kategori dan prioritas.
- RIWAYAT PEMBELIAN memiliki area scroll vertikal sendiri ketika data semakin panjang.

## Tidak disentuh
- Taxonomy/master barang v2.4.16.
- DATABASE visibility/select-unselect v2.4.15.
- Finance/saldo/transaksi.
- Sync dua HP, offline queue, backup/restore.
- Back navigation.
- Warna/layout global aplikasi.

Tidak ada SQL baru untuk v2.4.17.
