CN MONEY v2.4.3 — AUTOCORRECT RUNTIME GUARD

Fokus update:
1. Dataset audit v2.4.2 tetap dipakai sebagai dasar.
2. Ditambah runtime guard supaya mapping buruk tidak langsung dipercaya jika database autocorrect berubah di masa depan.
3. Input satu kata yang sudah merupakan kosakata valid di katalog aktif dianggap disengaja, bukan typo.
4. Input satu kata <= 3 karakter tidak boleh otomatis diubah menjadi produk lain.
5. Household rename/alias, exact master item, brand, dan ambiguity tetap memiliki prioritas lebih tinggi.
6. Preferensi canonical eksplisit tetap dipertahankan:
   SAMPO / SHAMPO / SAMPOO / SMPO -> SHAMPOO

Regression safety:
- shampoo -> Shampoo: OK
- shampo -> Shampoo: OK
- sampo -> Shampoo: OK
- sampoo -> Shampoo: OK
- smpo -> Shampoo: OK
- conditioner -> tetap Conditioner: OK (bukan autocorrect otomatis)
- apa -> api: BLOK
- ada -> dada: BLOK
- ayam -> bayam: BLOK
- sapi -> sapu: BLOK
- sapo: PILIH SHAMPOO / SAPU

Catatan:
- Guard katalog hanya memblok perubahan untuk input SATU kata yang memang sudah valid di vocabulary katalog.
- Input multi-kata tetap boleh menggunakan mapping typo yang sudah diaudit, sehingga typo seperti nama barang + kata kedua yang salah tetap dapat dikoreksi.
- Tidak ada perubahan schema / SQL untuk v2.4.3.
