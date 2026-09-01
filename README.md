# CN MONEY v3.1.0 — CHECKOUT PURCHASE DATE

Baseline: CN MONEY v3.0.0 Stable.

## Perubahan

- Quick Checkout sekarang punya field **TANGGAL DIBELI**.
- Default tanggal adalah hari ini, sehingga checkout normal tetap cepat.
- User dapat mencatat pembelian lama pada tanggal sebenarnya.
- Tanggal masa depan tidak dapat dipilih.
- `finance_complete_checkout_v2` sekarang menerima tanggal yang dipilih melalui parameter `p_checkout_date` yang memang sudah tersedia di backend.
- DATA, riwayat pembelian, Receipt, dan Receipt Kustom membaca tanggal pembelian tersebut.
- Input pembelian historis tidak menimpa harga/toko/satuan terbaru jika tanggalnya lebih lama dari pembelian terbaru yang sudah tercatat.
- Rekonstruksi harga setelah Cancel Checkout juga memprioritaskan `checkout_date`, bukan waktu record dibuat.

## Database / Supabase

Tidak ada SQL migration baru. RPC checkout yang digunakan v3.0.0 sudah memiliki parameter `p_checkout_date`.
Migration historis tetap:

- `SUPABASE-v2.4.7-STABILITY-SYNC.sql`
- `SUPABASE-v2.4.8-FINANCE-IDEMPOTENCY.sql`
- `SUPABASE-v2.4.15-CATALOG-VISIBILITY-BATCH.sql`

## Regression focus

1. Checkout hari ini tanpa mengubah tanggal.
2. Checkout barang dengan tanggal kemarin / tanggal lama.
3. DATA → riwayat pembelian menampilkan tanggal yang dipilih.
4. Receipt filter tanggal menemukan pembelian backdated.
5. Pembelian lama yang baru diinput tidak mengganti harga terbaru pada LIST.
6. Cancel Checkout backdated tetap mengembalikan saldo/budget dengan benar.
