# CN MONEY v2.3.8

KEYBOARD / FOCUS FIX — REBUILT

- LIST input tidak dirender ulang saat Enter.
- Enter hanya memperbarui area daftar di bawah input.
- Input LIST tetap terpasang di DOM, dikosongkan, lalu tetap fokus.
- Realtime sync tidak full-render halaman saat input LIST aktif.
- Input LIST memakai one-line textarea agar Enter tidak diperlakukan sebagai tombol Done.
- Klik di luar input tetap membolehkan keyboard tertutup.
- Search PANDUAN KATEGORI hanya memperbarui hasil, bukan modal/input.
- Service worker mengecek update saat app dibuka.

Tidak ada SQL baru.
Tetap memakai Supabase v2.3.5.
