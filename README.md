# CN MONEY v2.4.18 — DATABASE CATEGORY VISIBILITY FIX

Scope release ini sengaja sempit: memperbaiki Pengaturan > DATABASE untuk KATEGORI dan SUB KATEGORI.

## Perubahan
- DATABASE sekarang hanya menampilkan dua tab: `KATEGORI` dan `SUB KATEGORI`.
- Tab `MEREK` dan `BARANG` dihapus dari UI DATABASE sesuai keputusan produk; master merek/barang tetap dipakai aplikasi untuk autocorrect dan auto-category.
- Select/unselect tetap memakai draft lokal dan baru berlaku setelah `SIMPAN`.
- Toggle individual dan `SELECT ALL` tidak melakukan render ulang list, sehingga posisi scroll tetap di tempat yang sama.
- Penyimpanan visibility tidak lagi memakai RPC catalog lama yang bergantung pada key taxonomy server legacy.
- Kategori/subkategori sekarang disimpan sebagai satu konfigurasi household di bucket `database` melalui RPC stabil `cn_household_bucket_mutate_v1` dari v2.4.7.
- Karena itu taxonomy lokal v2.4.16 (termasuk key `local:*`) dapat disimpan tanpa error.
- Visibility tersinkron antar perangkat melalui `household_data` dan ikut tercakup dalam Backup/Restore.
- Setting visibility lama untuk `MEREK`/`BARANG` tidak lagi dipakai; merek/barang aktif mengikuti visibility kategori/subkategori induknya.
- Item LIST yang kategori atau subkategorinya dinonaktifkan tidak ditampilkan di BELANJA dan tidak dihitung dalam estimasi list aktif.

## Backend
Tidak ada SQL baru untuk v2.4.18.

v2.4.18 memakai RPC `cn_household_bucket_mutate_v1` yang sudah dipasang pada migration v2.4.7.
File SQL v2.4.15 tetap disimpan di repo/ZIP hanya sebagai migration history, tetapi UI v2.4.18 tidak lagi bergantung pada RPC batch visibility v2.4.15.

## Tidak disentuh
- Master taxonomy dan 959 barang v2.4.16.
- Detail DATA v2.4.17.
- Finance/saldo/transaksi.
- Offline boot, sync dua HP, cancel/undo, Back navigation, backup/restore.
- Styling/layout global aplikasi.
