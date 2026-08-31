CN MONEY v2.4.8 — FINANCE IDEMPOTENCY / CRASH-REOPEN PHASE 2

Fokus release
- Freeze fitur. Tidak menambah fitur produk baru.
- Menutup risiko transaksi finansial dobel saat request sudah commit di Supabase tetapi app kehilangan respons karena koneksi putus / force-close / reopen.
- Membuat create Dompet, Investasi, dan Aset retry-safe.
- Membuat Pemasukan, Pengeluaran, Transfer, Pendapatan Investasi, dan koreksi saldo Dompet memakai durable pending operation di perangkat.

WAJIB sebelum deploy v2.4.8
1. Backup .cnmoney dari Settings.
2. Pastikan migration v2.4.7 sudah pernah dijalankan.
3. Jalankan SUPABASE-v2.4.8-FINANCE-IDEMPOTENCY.sql di Supabase SQL Editor.
4. Pastikan query selesai tanpa error.
5. Baru deploy/install frontend v2.4.8.

SQL migration v2.4.8
- Tidak mengubah kolom/tabel finance existing.
- Tidak memigrasikan saldo, transaksi, receipt, investasi, aset, budget, atau master barang.
- Menambah schema internal cn_internal jika belum ada.
- Menambah cn_internal.finance_operation_guard_v1 yang hanya menyimpan Household ID, random operation ID, jenis operasi, user ID, dan timestamp.
- Menambah RPC public.cn_finance_create_once_v1 untuk create wallet/investment/asset sekali saja per operation ID.
- RPC memakai SECURITY INVOKER. Existing finance RPC + RLS/authorization tetap menjadi sumber kebenaran.
- Guard row dan create finance berada di transaksi database yang sama: kalau create gagal, guard ikut rollback.

Durable finance queue frontend
- Pending operation disimpan di localStorage per Household sebelum RPC dikirim.
- Kalau error terdeteksi sebagai network/timeout/server sementara, operation tetap disimpan.
- Saat online/reopen/pageshow, pending finance operation dicoba ulang sebelum load data final.
- Kalau backend sudah commit sebelumnya, operation ID yang sama membuat retry menjadi no-op/dedupe, bukan create kedua.
- Error bisnis definitif (mis. input/backend menolak) tidak diretry tanpa batas.

Dilindungi v2.4.8
- Pemasukan: finance_add_income_v2 + durable client transaction ID.
- Pengeluaran: finance_add_expense_v2 + durable client transaction ID.
- Transfer: finance_transfer_v2 + durable client transaction ID.
- Pendapatan investasi: finance_add_investment_income + durable client transaction ID.
- Koreksi saldo Dompet: finance_update_wallet_v2 + durable client transaction ID.
- Create Dompet: cn_finance_create_once_v1.
- Create Investasi: cn_finance_create_once_v1; termasuk pembelian dari Dompet supaya debit tidak terulang saat retry.
- Create Aset: cn_finance_create_once_v1.

Sudah aman dari phase sebelumnya
- Checkout sudah memiliki clientCheckoutId yang disimpan di checklist sebelum finance_complete_checkout_v2 dipanggil.
- LIST/DATA bucket pending queue + atomic mutation v2.4.7 tetap dipakai.
- Taxonomy/autocorrect/search DATA v2.4.6 tetap dipakai.

Belum diklaim selesai
- Phase berikutnya tetap audit edit/delete/undo/cancel secara menyeluruh dan Back Navigation. v2.4.8 fokus pada create/add money flows dan crash-reopen idempotency.

Backup/Restore interlock
- Backup dan Restore mencoba flush durable finance queue terlebih dahulu.
- Jika masih ada operasi uang yang belum bisa sync, Backup/Restore ditahan agar snapshot/restore tidak bertabrakan dengan operasi pending.
