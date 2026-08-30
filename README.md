CN MONEY v2.4.2 — AUDIT AUTOCORRECT

Kebijakan baru:
1. Autocorrect otomatis dipakai untuk TYPO yang jelas.
2. MANUAL synonym / translation / istilah alternatif tidak otomatis diubah.
3. Nama barang/master valid dan brand tetap dilindungi.
4. Household rename/alias tetap prioritas tertinggi.
5. Input ambigu tetap meminta pilihan.
6. Preferensi canonical eksplisit:
   SAMPO / SHAMPO / SAMPOO / SMPO -> SHAMPOO

Keluarga canonical:
- Shampoo
- Shampoo Bayi
- Shampoo Sachet
- Shampoo Hewan

Contoh yang TIDAK lagi dipaksa otomatis:
- conditioner -> Kondisioner
- tissue -> Tisu
- butter -> Mentega
- odol -> Pasta Gigi
- obat maag -> Antasida
- cling wrap -> Plastic Wrap

Safety:
- ayam -> bayam: BLOK
- sapi -> sapu: BLOK
- sapo: PILIH SHAMPOO / SAPU

Source autocorrect: 35823
Mapping otomatis aman: 25071
Mapping diblok/filter: 10751

Supabase:
Jalankan SUPABASE-v2.4.2-AUDIT-CANONICAL.sql sekali,
lalu hasil cek harus menampilkan nama keluarga SHAMPOO di atas.
