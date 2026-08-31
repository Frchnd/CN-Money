# CN MONEY v2.8.0 — RELEASE CANDIDATE 1

Release ini adalah freeze candidate setelah rangkaian taxonomy, sync/offline, finance idempotency, Receipt custom, visual polish, dan performance v2.7.x.

## Prinsip RC1
- Tidak menambah fitur baru.
- Tidak mengubah UI/layout/warna dari v2.7.2.
- Tidak mengubah schema Supabase atau SQL migration.
- Tidak mengubah master taxonomy 2.4.16, 959 master barang, alias, atau autocorrect.
- Tidak mengubah logic finance, Shopping, DATA, Receipt, offline, sync, Back Android, DATABASE visibility, backup/restore, cancel/undo.
- Perubahan source hanya nomor versi/cache + dokumentasi RC.

## Audit sebelum packaging
- JavaScript syntax: PASS.
- Service worker syntax: PASS.
- Manifest/master/autocorrect JSON: PASS.
- UI smoke-test cached/offline: 19/19 PASS, 0 JS error.
- Master taxonomy: 9 kategori, 35 subkategori, 959 canonical item.
- Alias master: 224.
- Autocorrect: 49.239 mapping dengan target canonical valid.
- SQL v2.4.7, v2.4.8, v2.4.15 tidak diubah.
- Sound assets tidak diubah.

## Status
RC1 belum disebut v3.0.0 Stable sampai regression real-device + Supabase lolos.
