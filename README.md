# CN MONEY v2.7.1 — PERFORMANCE PHASE 2

Release ini fokus membuat aksi harian terasa lebih cepat tanpa mengubah UI atau model data.

Perubahan utama:
- realtime cloud refresh sekarang di-coalesce/debounce agar satu aksi tidak memicu full reload berulang;
- add/delete LIST memakai durable local-first mutation: UI berubah dulu, queue disimpan lokal, sync dilakukan di belakang;
- checkout tidak lagi menunggu serial sync bucket + full load sebelum menutup modal;
- edit DATA mem-paralelkan profile/priority write dan menyinkronkan household override di background;
- cancel checkout melakukan finalisasi lokal segera setelah finance RPC berhasil, lalu reconcile cloud di background;
- edit/delete/undo finance yang sudah dikonfirmasi server memperbarui state lokal langsung lalu reconcile cloud;
- create wallet/investment/asset/transaksi tidak lagi menunggu full `loadAll()` sebelum UI kembali responsif;
- wealth summary lokal direkalkulasi setelah edit/delete/undo agar tampilan tidak menunggu cloud refresh.

Safety yang tetap dipertahankan:
- pending bucket queue v2.4.7;
- finance idempotency queue v2.4.8;
- crash-safe checkout cancel v2.4.10;
- offline boot v2.4.9;
- DATABASE visibility v2.4.18;
- taxonomy/master/autocorrect v2.4.16;
- custom receipt/PDF v2.6.x.

Tidak ada SQL baru. UI/CSS tidak diubah.
