# CN MONEY v3.0.0 — STABLE

Final stable release dari rangkaian audit taxonomy, sync/offline, finance idempotency, Receipt custom, visual polish, performance, regression RC1, dan final hardening RC2.

## Prinsip release
- Tidak ada fitur baru dibanding v2.9.0 RC2.
- Tidak ada perubahan business logic, UI, taxonomy, master barang, atau schema Supabase.
- Perubahan release hanya version/cache bump dari v2.9.0 RC2 ke v3.0.0 Stable dan dokumentasi final.
- SQL migration yang dibutuhkan tetap migration historis v2.4.7, v2.4.8, dan v2.4.15; tidak ada SQL baru untuk v3.0.0.

## Baseline final
- 9 kategori / 35 subkategori.
- 959 master barang canonical.
- 49.239 autocorrect mapping tervalidasi.
- Offline boot + durable sync.
- Finance idempotency + crash/reopen protection.
- Custom combined Receipt + PDF thermal export.
- Performance optimization v2.7.x.
- Regression/freeze dari v2.8.0 RC1 dan v2.9.0 RC2.

---

# CN MONEY v2.9.0 — FINAL HARDENING / RC2

Release ini adalah final hardening sebelum v3.0.0. Tidak ada fitur baru dan tidak ada perubahan logic aplikasi dibanding v2.8.0 RC1. Perubahan hanya version/cache bump, pembersihan dua file master legacy v2.4.6 yang sudah tidak direferensikan runtime, dan dokumentasi freeze.

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
