# CN MONEY v0.6A.3.2 HOTFIX

Perbaikan regresi interaksi dari v0.6A.3 / v0.6A.3.1.

Akar masalah:
- Helper `numericInput()` tidak sengaja terhapus saat merge v0.6A.3.
- Semua modal yang membutuhkan input nominal gagal dirender.

Yang diperbaiki:
- EDIT ANGGARAN kembali bisa dibuka.
- CHECKOUT barang kembali bisa dibuka.
- TAMBAH PENGELUARAN / PEMASUKAN / TRANSFER kembali bisa dibuka.
- TAMBAH DOMPET / INVESTASI / ASET kembali bisa dibuka.
- EDIT DOMPET / INVESTASI / ASET kembali bisa dibuka.
- Tombol EDIT/HAPUS pada detail DOMPET / INVESTASI / ASET dibuat compact.
- Semua ikon tong sampah dibuat merah, termasuk hapus item LIST BELANJAAN.
- Fitur v0.6A.3 tetap dipertahankan.

Tidak ada perubahan database baru.
Tidak perlu menjalankan SQL lagi jika patch v0.6A.3 sudah pernah dijalankan.
File SQL sengaja tidak disertakan dalam hotfix ini agar tidak membingungkan.
