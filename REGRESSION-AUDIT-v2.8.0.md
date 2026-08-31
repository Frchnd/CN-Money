# CN MONEY v2.8.0 — Regression Audit RC1

## Hasil otomatis
- Static/integrity checks: 51/51 PASS.
- Cached/offline UI smoke: 19/19 PASS, 0 JavaScript page error.
- index.html behavior: identical to v2.7.2 setelah release marker/version dinormalisasi.
- service-worker behavior: identical to v2.7.2 setelah cache version dinormalisasi.
- JavaScript syntax: PASS.
- Service worker + push service worker syntax: PASS.
- JSON master/autocorrect/manifest: PASS.

## Data/master
- 9 kategori.
- 35 subkategori.
- 959 canonical item.
- 224 alias.
- 49.239 autocorrect mapping.
- Seluruh item memiliki kategori/subkategori valid.
- Seluruh alias dan autocorrect mengarah ke canonical item valid.
- Subkategori Lainnya berada paling akhir di semua kategori.

## Flow yang di-smoke-test
- Offline cached app shell.
- Dashboard + dan transaction picker.
- Pengeluaran form + Back bertingkat.
- Saku +.
- Investasi +.
- Aset +.
- Shopping LIST.
- DATA + search/card.
- Custom Receipt + filter + export control.
- DATABASE hanya Kategori/Subkategori.

## Critical hardening markers
- Durable bucket queue v2.4.7 ada.
- Durable finance queue/idempotency v2.4.8 ada.
- Pending cancel checkout v2.4.10 ada.
- Offline local boot ada.
- Android/browser Back guard ada.
- Stale estimate guard v2.4.19 ada.
- Receipt custom/PDF pipeline ada.
- v2.7.x render/search performance indexes ada.

## Backend/assets
SQL v2.4.7, v2.4.8, v2.4.15 tetap ada dan tidak dimodifikasi oleh RC1. Sound/master assets juga tidak diubah.

## Batas validasi
Operasi yang bergantung pada project Supabase asli, dua perangkat fisik, restore sungguhan, dan timing force-close real tetap harus dites di device sebelum label Stable.
