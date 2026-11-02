# 05 — Animation, Audio & Cinematics | Atlas Game 1
**Sumber:** `00_MASTER_SOURCE_v1.7.md` B0, CD-01/02, Lampiran A. **Status:** pendekatan disetujui, storyboard/tempo/audio masih OPEN.

## Aturan cinematic
- **Hanya prolog dan epilog** yang direncanakan sebagai animated short terpisah.
- Prolog **30 detik–3 menit**, memberi pemahaman sederhana tentang Okto dan alasan perjalanannya, terkait lembah dan peta ayah. Hindari eksposisi sejarah perang/Core/Spire.
- Epilog adalah penyelesaian emosional **untuk dua ending berbeda**, tidak sekadar teaser sekuel.
- Di antara keduanya: utamakan aksi pemain, gestur Moss, lingkungan, perubahan musik/ambience, camera choreography in-engine. Jangan membuat video cutscene tiap region.

## Animasi prioritas prototipe
- Okto: idle, move, jump rise/fall/land, turn; crouch/crawl khusus transisi bila dipakai.
- Moss: idle attentive, follow, turn, curious pause, interact, recovery/teleport yang tak merusak ilusi (jika perlu).
- Ekspresi Moss: body language, arah perhatian, jarak ke Okto; hindari dialog yang menjelaskan semua emosi.
- Belum perlu puluhan sprite sheet sebelum lock ukuran karakter, pivot, kamera dan rig.

## Bahasa kamera dan audio untuk First Horizon Reveal
1. **Compression**: framing ketat, ruang gelap, suara teredam, jalan merunduk.
2. **Threshold**: cahaya bertambah alami, ambience luar masuk perlahan, kontrol dipertahankan.
3. **Release**: kamera mengungkap lanskap secara bertahap, bed musik berkembang, karakter tetap terhubung ke gameplay.
4. **Afterglow**: pemain berjalan dan boleh mengamati landmark; jangan memaksa cutscene panjang.

## Audio awal yang dibutuhkan
Footsteps per material dasar; jump/land; ambience lembah, angin/jurang, aliran air, fauna; cue interaksi Moss; musik adaptif untuk reveal. Soundscape, orkestrasi, dan VO belum dikunci. Placeholder audio boleh untuk uji tanpa melanggar lisensi.

## Approval gate
Prologue storyboard, epilogue kedua ending, metode rig, frames dan voice-over **memerlukan keputusan kreatif berikutnya**. Hindari memasukkan detail ayah Okto yang belum disetujui sebagai fakta dialog.
