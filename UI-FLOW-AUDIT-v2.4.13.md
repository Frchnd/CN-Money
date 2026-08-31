# CN MONEY v2.4.13 — UI / FLOW AUDIT

Scope: audit duplikasi UI, alur kepanjangan, dead path, dan navigation noise tanpa redesign visual.

## Keputusan audit

- Dashboard + transaksi dan History + transaksi tetap dipertahankan. Keduanya shortcut kontekstual, bukan duplikasi yang merugikan.
- LIST / DATA / RECEIPT tetap tiga subtab terpisah. Fungsinya berbeda dan menggabungkannya akan menambah langkah.
- Saku / Investasi / Aset tetap memakai alur list → detail → edit. Detail berfungsi sebagai review sebelum aksi destructive/edit sehingga tidak dipangkas.
- Guide Aplikasi, Panduan Kategori, dan Database tetap terpisah karena isinya berbeda.

## Cleanup yang diterapkan

- Re-tap tab utama yang sudah aktif tidak lagi membuat render/navigation entry yang tidak perlu.
- Re-tap subtab Shopping, subtab Kekayaan, dan filter History yang sudah aktif tidak lagi membuat render ulang.
- Child screen di Settings (Guide, Panduan Kategori, Database) kembali melalui mekanisme Back yang sama dengan Android/UI Back.
- Dead event handler legacy untuk tombol edit/delete/list DATA lama yang tidak lagi dirender di UI dihapus.
- Dead helper lama yang tidak punya caller dihapus.

## Visual freeze

Tidak ada perubahan sengaja pada warna, card, spacing, icon, urutan tab, ukuran tombol, picker transaksi, atau layout layar utama dibanding v2.4.12.
