CN MONEY v2.4.7 — STABILITY SYNC / CRASH-REOPEN PHASE 1

Fokus release
- Freeze fitur. Tidak menambah fitur produk baru.
- Menutup lost-update pada LIST/DATA saat dua perangkat menulis hampir bersamaan.
- Menambah pending-sync queue durable agar perubahan lokal tidak hilang setelah app ditutup/reopen saat koneksi gagal.
- Mengurangi realtime reload storm dan mencegah response load lama menimpa response yang lebih baru.

WAJIB sebelum deploy v2.4.7
1. Backup .cnmoney dari Settings.
2. Jalankan SUPABASE-v2.4.7-STABILITY-SYNC.sql di Supabase SQL Editor.
3. Pastikan query selesai tanpa error.
4. Baru deploy/install frontend v2.4.7.

SQL migration
- Tidak menambah/menghapus kolom atau tabel.
- Tidak memigrasikan saldo, transaksi, receipt, investasi, aset, master barang, atau history.
- Hanya menambah RPC public.cn_household_bucket_mutate_v1.
- RPC memakai SECURITY INVOKER sehingga RLS/permission existing tetap berlaku.
- RPC memodifikasi checklist/database/history secara atomik per item/key, bukan replace seluruh JSON bucket dari satu HP.

Perubahan sinkronisasi
- Tambah LIST: upsert item atomik berdasarkan id.
- Hapus LIST: delete atomik berdasarkan id.
- Checkout: checklist, database item, dan legacy history disinkronkan sebagai operasi granular setelah finance checkout sukses.
- Cancel checkout: restore checklist + hapus history session + rebuild database dikirim sebagai operasi granular.
- Edit DATA: hanya key/item terkait yang diubah di shared bucket.
- Delete DATA: hanya key terkait yang dihapus.
- Whole-bucket writer lama di frontend tidak lagi digunakan.

Crash/reopen safety
- Mutasi bucket yang gagal dikirim disimpan di localStorage per Household.
- Pending mutation dicoba ulang saat online/reopen.
- Saat cloud reload terjadi tetapi masih ada pending mutation, pending local state diaplikasikan kembali ke tampilan agar tidak menghilang.
- Pending queue dihapus ketika user menghapus Household dari perangkat, sehingga tidak ikut terbawa saat keluar/rejoin.

Realtime safety
- Event realtime yang datang bertubi-tubi didebounce 140 ms.
- loadAll memakai generation guard: response request lama tidak boleh menimpa response request yang lebih baru.

Tidak berubah
- Taxonomy/autocorrect/search DATA v2.4.6 tetap dipakai.
- File master tetap master-catalog-v246.json dan autocorrect-v246.json karena kontennya tidak berubah pada release ini.
- Finance RPC existing, saldo, budget, transaksi, investasi, aset, receipt, backup/restore tidak dimigrasikan pada phase ini.

Catatan audit lanjutan
- Phase berikutnya tetap perlu audit idempotency untuk create wallet/investment/asset dan request finance lain yang belum memiliki durable request token di frontend. v2.4.7 fokus menutup risiko terbesar shared LIST/DATA + reopen pending sync terlebih dahulu.
