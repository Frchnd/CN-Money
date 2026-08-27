# CN MONEY v0.5C SAFE

Input interaction & picker cleanup. Tidak perlu SQL.

Perubahan:
- Quick Checkout tidak lagi auto-focus Harga dan tidak auto-select nominal. Keyboard baru muncul setelah kolom disentuh.
- HISTORY, HISTORY BELANJA, dan RECEIPT memakai month picker custom bertema CN MONEY; tidak lagi memakai picker bulan native browser.
- Picker custom memakai tombol - / + untuk tahun dan grid bulan, tanpa dropdown arrow.
- Form/input diberi hint autocomplete/autocorrect/spellcheck off untuk mengurangi suggestion browser/keyboard semaksimal yang diizinkan Android/Chrome.
- Tidak mengubah startup engine, Supabase, realtime, saldo, transaksi, checkout RPC, sound, smart input, atau struktur database.

Catatan:
- Suggestion dari Gboard/keyboard dan notifikasi Chrome tertentu berada di level Android/Chrome. PWA hanya bisa mengurangi pemicunya, bukan menjamin menghapusnya 100%.

Deploy:
1. Replace file repo `finansial-main` dengan isi folder ini.
2. Commit dan tunggu Vercel Ready.
3. Buka online sekali, tutup, lalu buka PWA lagi.
