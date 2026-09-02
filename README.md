# CN MONEY v3.1.3 — RECEIPT FILTER UI THEME REFINE

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
