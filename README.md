# CN MONEY v0.4E SAFE

Tahap finalisasi sound dan penyempurnaan interaksi belanja. Basis startup, Supabase, realtime, RPC transaksi, dan patch kategori tetap mengikuti v0.4D yang sudah lolos tes.

Perubahan utama:
- Sound tambah barang memakai klik mekanis singkat lokal.
- Pemasukan, pengeluaran, transfer, dan checkout memakai cash-register / ka-ching lokal yang lebih jelas.
- Sound tetap bekerja offline setelah asset tercache, dengan fallback Web Audio bila file tidak bisa diputar.
- Checklist dibuat lebih mudah dibaca: nama barang lebih besar, harga berada di sisi kanan, ikon edit/hapus di bawah harga.
- Item yang sudah dibeli menampilkan total dan ikon undo checkout di bawah total bila sesi masih tersedia.
- Data Barang menempatkan edit/hapus di bawah harga agar nama/kategori punya ruang lebih besar.
- Quick checkout dibuat price-first dan lebih ringkas.
- Dompet checkout terakhir diingat di perangkat untuk mengurangi tap berulang.

Tidak memerlukan SQL baru.
