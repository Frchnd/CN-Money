# CN MONEY v2.7.2 — PERFORMANCE PHASE 3

Scope release ini hanya optimasi render/derived-data. UI, taxonomy, finance behavior, Shopping behavior, Receipt behavior, sync/offline, dan schema Supabase tidak diubah.

## Optimasi
- Reuse `Intl.NumberFormat` / `Intl.DateTimeFormat` agar format rupiah/tanggal tidak membuat formatter baru berulang kali.
- Render-level index untuk wallet, category, investment, shopping session, dan investment income.
- DATA search membangun index riwayat pembelian satu kali per render, bukan scan seluruh history untuk setiap card.
- RECEIPT source rows + filter options dihitung sekali per render dan dipakai ulang.
- Investment income di-index sekali per render, bukan filter seluruh transaksi untuk setiap investment card.

Tidak ada SQL baru.
