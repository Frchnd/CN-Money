# CN MONEY v0.5G SAFE

Dashboard interaction refinement built from stable v0.5F.

Perubahan:
- PENGELUARAN BULAN INI memakai month picker CN MONEY, bukan select browser.
- Posisi scroll dipertahankan saat membuka/menutup modal, memilih bulan, edit, dan render ulang pada layar yang sama.
- Tombol edit anggaran dipindahkan ke dalam card ANGGARAN BELANJA.
- Card anggaran dan selector bulan diberi visual affordance yang lebih jelas sebagai elemen yang bisa ditap.
- INSIGHT berada dalam satu panel dengan scroll internal bila isinya panjang.
- AKTIVITAS TERBARU berada dalam satu panel, maksimal 4 transaksi, tanpa tombol edit/undo. Perubahan transaksi dilakukan dari HISTORY.
- Engine transaksi, Supabase, realtime, startup, shopping, dan schema database tidak diubah.
- Tidak perlu SQL.
