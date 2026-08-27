# CN MONEY v0.4C SAFE

Tahap rebuild visual ketiga di atas basis v0.4B yang sudah lolos startup dan UI test.

Perubahan tahap ini dibatasi pada Dashboard:
- Insight menggunakan warna semantik yang tetap terbaca di mode terang dan gelap
- merah untuk kondisi negatif, amber untuk peringatan, hijau untuk kondisi baik, warna utama untuk informasi
- Insight dibuat lebih minimalis tanpa emoji dekoratif
- chart Arus Kas Bulan Ini ditambahkan untuk membandingkan pemasukan dan pengeluaran
- chart dibuat murni dengan CSS, tanpa library atau request eksternal baru

Tidak ada SQL baru. Tidak ada perubahan pada boot, Supabase, realtime, transaction engine, kategori, smart input, atau sound.
