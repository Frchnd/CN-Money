# CN MONEY v2.4.15 — DATABASE VISIBILITY / SCROLL / ATOMIC SAVE FIX

## Perubahan
- Select / unselect di Pengaturan > DATABASE tidak lagi memanggil render penuh.
- Posisi scroll daftar dipertahankan saat memilih item di bagian bawah; daftar tidak lompat ke atas.
- KATEGORI / SUB KATEGORI / MEREK / BARANG tetap memakai draft lokal sampai tombol **SIMPAN** ditekan.
- **SELECT ALL** tetap toggle dua arah dan juga tidak mereset posisi scroll.
- Save visibility sekarang menggunakan **1 batch RPC atomik**. Tidak ada lagi 8 request paralel yang bisa menghasilkan state setengah tersimpan.
- Jika batch save gagal, committed state tidak berubah dan draft tetap ada untuk dicoba ulang.
- Setelah save sukses, visibility langsung menjadi source of truth untuk BELANJA.
- Kategori nonaktif hilang dari pilihan/group KATEGORI; subkategori nonaktif hilang dari pilihan/group SUB KATEGORI.
- Barang nonaktif tidak dipakai sebagai master/autocorrect aktif, dan merek nonaktif tidak dipakai untuk brand matching.
- Barang/merek master yang sengaja dinonaktifkan tidak bisa ditambahkan kembali seolah masih aktif.
- Data transaksi, receipt, dan riwayat pembelian tidak dihapus oleh visibility setting.

## Supabase
**Ada 1 SQL baru dan wajib dijalankan sebelum deploy v2.4.15:**

`SUPABASE-v2.4.15-CATALOG-VISIBILITY-BATCH.sql`

SQL hanya menambah RPC `cn_catalog_set_visibility_batch_v1(...)` yang membungkus RPC visibility lama dalam satu transaksi atomik. Tidak mengubah schema finance, saldo, transaksi, receipt, aset, investasi, atau shopping history.

## Regression freeze
Tidak mengubah taxonomy/autocorrect v2.4.6, sync dua HP v2.4.7, finance idempotency v2.4.8, offline boot v2.4.9, navigation fixes, transaction picker colors, atau layout utama.
