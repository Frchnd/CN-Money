# CN MONEY v2.3.9

DELETE / UNDO SFX

SFX sumber: file DELETE yang diberikan user.
Leading silence dipotong supaya efek berbunyi langsung.
Durasi asset aplikasi: 0.667 detik.

SFX diterapkan ke aksi berhasil:
- Hapus item LIST
- Hapus DATA barang
- Hapus SAKU
- Hapus INVESTASI
- Hapus ASET
- Undo / batalkan transaksi
- Batalkan checkout dari LIST / DATA / Receipt / History
- Batalkan restore terakhir
- Hapus data perangkat

Aksi internal seperti pembersihan alias lama tidak memutar SFX.
Tombol batal pada dialog/modal biasa juga tidak dianggap UNDO.

SOUND ON/OFF di Pengaturan tetap mengontrol seluruh SFX.

Tidak ada SQL baru.
Tetap memakai Supabase v2.3.5.
