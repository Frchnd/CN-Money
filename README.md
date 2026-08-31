CN MONEY v2.4.6 — TAXONOMY FREEZE + DEEP DATA SEARCH

Fokus release
- Audit dan finalisasi seluruh kategori/subkategori aktif berdasarkan keputusan user.
- Tidak ada SQL / schema migration Supabase.
- Unknown item tetap deterministik ke Lainnya / Lainnya sampai user edit manual di DATA.
- Manual DATA override tetap menang setelah user memilih kategori/subkategori sendiri.

Taxonomy final
- Bahan Segar: Buah; Daging & Ayam; Ikan & Hasil Laut; Sayur; Bumbu Segar; Telur, Tahu & Tempe; Lainnya.
- Kebersihan Rumah: Alat Kebersihan; Cuci Piring; Kamar Mandi; Laundry; Pembersih Rumah; Tisu; Lainnya.
- Kebutuhan Bayi: Makanan & Susu; Perawatan Bayi; Popok; Lainnya.
- Kesehatan: Obat Umum; P3K; Perlengkapan Kesehatan; Vitamin & Suplemen; Lainnya.
- Makanan: Bahan Pokok; Bumbu & Bahan Masak; Camilan; Makanan Beku; Mi & Pasta; Makanan Instan; Makanan Siap Makan; Produk Susu & Olahan; Roti & Bakery; Sereal & Oat; Lainnya.
- Minuman: Air Minum; Kopi & Teh; Minuman Siap Minum; Minuman Serbuk & Sirup; Susu; Krimer; Lainnya.
- Perawatan Diri: Gigi & Mulut; Kebutuhan Wanita; Kebersihan Pribadi; Mandi & Tubuh; Rambut; Wajah & Kulit; Deodoran; Cukur; Lainnya.
- Perlengkapan Rumah: Alat Tulis; Baterai & Lampu; Elektronik & Aksesori; Mainan & Anak; Penyimpanan & Kemasan; Peralatan Dapur; Peralatan Sekali Pakai; Lainnya.
- Hewan Peliharaan: Makanan; Perawatan & Kebersihan; Lainnya.
- Lainnya: Lainnya.

Keputusan canonical penting
- SKM / susu SKM / susu kental manis -> Susu Kental Manis.
- Bentuk lama Krimer Kental Manis tetap dikenali dan diarahkan ke Susu Kental Manis.
- Mi dan pasta disatukan dalam subkategori eksplisit Mi & Pasta sesuai keputusan user.
- Toilet/WC tidak dipakai sebagai dua label berbeda; item toilet-specific masuk Kamar Mandi.
- Ikan & Seafood diganti menjadi Ikan & Hasil Laut.
- Bawang/cabai/rempah segar dipisah dari Sayur menjadi Bumbu Segar.
- Tisu & Kebersihan disederhanakan menjadi Tisu.
- Roti & Sarapan dipecah menjadi Roti & Bakery serta Sereal & Oat.
- Minuman Kemasan dipecah menjadi Minuman Siap Minum serta Minuman Serbuk & Sirup.
- Deodoran dan Cukur dipisah dari Wajah & Kulit. Kebutuhan Wanita tetap memakai nama tersebut.
- Perawatan Hewan dipindahkan keluar dari Perlengkapan Rumah menjadi kategori utama Hewan Peliharaan.

DATA search
- Search tersedia di tab DATA.
- Pencarian membaca isi card, bukan hanya nama induk: nama induk, alias, varian/produk dibeli, kategori, subkategori, prioritas, satuan, toko, dompet, tanggal, jumlah, harga satuan, subtotal, dan metadata riwayat.
- Jika satu istilah muncul di beberapa card berbeda, semua card yang mengandung istilah itu ditampilkan.
- Filter dilakukan in-place agar input search tidak kehilangan fokus/keyboard setiap huruf.

Data files
- /data/master-catalog-v246.json
- /data/autocorrect-v246.json
