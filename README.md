# CN MONEY v3.1.5 — TRANSACTION DESCRIPTION ANDROID FIX

Patch sempit dari v3.1.1.

## Perubahan
- Quick Checkout: field **TEMPAT BELI** selalu kosong saat modal checkout dibuka.
- Quick Checkout: default **TANGGAL DIBELI** dan batas tanggal maksimum memakai WIB (UTC+7 / Asia Jakarta), sehingga tanggal baru terbuka tepat saat pergantian hari WIB.
- Nama Produk dan Harga per Satuan tetap blank-by-default seperti v3.1.1.
- Dompet tetap mengingat pilihan terakhir.

## Tidak berubah
- Estimasi harga, DATA, Receipt, finance, sync 2 HP, offline, taxonomy, autocorrect, dan SQL migration.
- Tidak ada SQL baru.


- UI modal **Atur Receipt** dirapikan agar mengikuti tema CN Money.
- Dropdown tanggal & toko diganti menjadi picker bergaya CN Money, bukan dropdown native browser.
- Struktur filter lebih rapi, konsisten, dan lebih nyaman dipakai di layar HP.
- Scope sengaja dibatasi ke UI receipt filter saja; logic receipt tidak diubah.


- Hapus scroll horizontal yang muncul di UI filter / picker.
- Modal dan picker dipaksa overflow-x hidden agar tidak melebar ke samping.
- Daftar opsi picker sekarang punya area scroll vertikal sendiri, jadi kalau data makin panjang tetap bisa discroll dan tidak stuck.
- Fix ini diterapkan generik ke picker lain juga, bukan cuma Atur Receipt.

## v3.1.5 — Transaction Description Android Fix

- KETERANGAN pada Pemasukan, Pengeluaran, dan Transfer dipaksa sebagai input teks eksplisit (`type=text`, `inputmode=text`) untuk kompatibilitas Android/WebView.
- Field KETERANGAN saat edit transaksi Pemasukan/Pengeluaran juga memakai konfigurasi teks yang sama.
- Payload `p_description` dan tampilan description di HISTORY tidak diubah.
- Tidak ada SQL baru dan tidak ada perubahan ke Shopping, Receipt, DATA, sync, offline, taxonomy, atau finance calculation.
