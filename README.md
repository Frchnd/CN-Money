# CN MONEY v2.6.0 — RECEIPT PDF THERMAL TYPOGRAPHY

Scope release ini sengaja sempit: hanya export PDF Receipt.

## Perubahan
- PDF Receipt tetap ukuran thermal 80 mm.
- Teks PDF dirender memakai font stack monospace yang sama dengan Receipt di UI perangkat.
- Hasil teks diraster ke canvas resolusi tinggi lalu ditempel ke PDF agar rupa font konsisten dengan tampilan aplikasi.
- Separator dibuat dashed seperti Receipt di aplikasi.
- Spacing item, total, dan footer dirapikan agar terasa seperti struk thermal.
- Ada fallback ke generator PDF vector lama bila canvas tidak tersedia.

## Tidak berubah
- UI aplikasi v2.5.0.
- Finance, Shopping, DATA, DATABASE, sync, offline, backup/restore, taxonomy, autocorrect.
- Tidak ada SQL baru.
