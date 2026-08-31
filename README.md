# CN MONEY v2.7.0 — PERFORMANCE PHASE 1

Release ini fokus ke kecepatan tanpa mengubah UI atau fitur bisnis.

Perubahan utama:
- master barang/alias dipre-index sekali, bukan dibangun + di-sort ulang setiap lookup;
- lookup item/subkategori/merek memakai index Map + regex yang sudah dikompilasi;
- autocorrect 1.8 MB dipanaskan saat browser idle, bukan berebut CPU saat boot;
- snapshot catalog dan nama device diberi TTL 3 menit agar tidak RPC ulang pada setiap refresh/realtime;
- penyimpanan cache hasil cloud didebounce agar JSON.stringify/localStorage tidak memblok UI berulang;
- service worker navigation memakai fast network fallback (650 ms) lalu shell cache;
- Supabase JS runtime cache memakai stale-while-revalidate agar launch berikutnya tidak selalu menunggu CDN.

Tidak ada SQL baru. UI/CSS, taxonomy, receipt custom/PDF, finance, sync, offline queue, DATABASE visibility, dan master data tetap dipertahankan.
