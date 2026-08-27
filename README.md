# CN MONEY MAIN v0.4

Visual cleanup + fast shopping refinement.

## Update utama
- Icon transaksi konsisten dengan style navigasi utama.
- Insight memakai warna semantik (positif / warning / negatif / info).
- Tombol tambah Dompet, Investasi, dan Aset menjadi tombol `+` minimalis.
- Scrollbar horizontal filter HISTORY disembunyikan.
- Hierarki font diperkuat.
- RECEIPT memakai tampilan font monospaced ala struk.
- Arrow pada select disederhanakan/dihilangkan secara visual.
- DATA BARANG sekarang bisa dihapus dengan aman tanpa menghapus history transaksi.
- Normalisasi UOM dan tempat beli: `pcs -> Pcs`, `pasar -> Pasar`, dll.
- Koreksi typo umum item: `sampo -> Shampoo`, `syabun -> Sabun`, dll.
- Kategori `Telur & Protein Lain` dipecah menjadi `Telur` dan `Protein`.
- `Lainnya` selalu diletakkan paling akhir.
- Teks bantuan yang tidak penting dibersihkan.
- Aksi edit/delete/undo diletakkan dekat nominal/harga agar nama lebih mudah dibaca.
- Ringkasan kekayaan diganti menjadi `TOTAL ASET`.
- Dashboard mendapat chart komposisi pengeluaran yang ringkas.
- Semua daftar aktivitas finansial tetap terbaru di atas.
- Sound lokal pendek: click untuk tambah item, cash-register untuk transaksi berhasil.

## Supabase
Jalankan `SUPABASE-v04-CATEGORY-PATCH.sql` sekali sebelum/dekat waktu deploy agar kategori baru tersedia.
