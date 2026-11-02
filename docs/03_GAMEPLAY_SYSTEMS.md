# 03 — Gameplay & Companion Systems | Atlas Game 1
**Sumber:** `00_MASTER_SOURCE_v1.7.md` B6, D1 dan Lampiran A. **Status:** gameplay-first disetujui arah; kemampuan dan input spesifik merupakan usulan yang harus diuji.

## Game feel utama
Pemain **mengendalikan Okto**. **Moss** adalah AI companion dengan gerak mandiri, rasa ingin tahu, ekspresi, dan kerja sama kontekstual; bukan karakter yang terus-menerus dikendalikan bergantian atau tombol hidup. Hubungan tumbuh lewat tindakan.

## Core loop kerja (PROPOSAL)
Baca medan/landmark → bergerak & eksplorasi → amati hambatan → kolaborasi dengan Moss / gunakan Living Map → jalur/penemuan baru → peta berkembang → lanjut.

## MVP yang perlu dibuktikan lebih dulu
1. Okto: kiri/kanan, lompat, gravitasi, landing, collision; feel responsif dan aman.
2. Kamera: mengikuti dengan halus, preview area depan, tidak membocorkan seluruh vista terlalu cepat.
3. Moss: follow, idle, catch-up/recovery aman, perhatian pada objek, satu interaksi konteks sederhana; **jangan** membuat follow AI buntu di medan prototipe.
4. Puzzle: satu rintangan yang membutuhkan tindakan berbeda Okto dan Moss, dengan affordance jelas.
5. Living Map: satu landmark/penemuan yang tercatat saat benar-benar ditemukan; tidak wajib sistem peta besar untuk MVP.
6. Emosi: satu interaksi kecil tanpa dialog; awalnya Moss punya perilaku khas, lalu perilaku bisa berubah saat kondisi naratif memburuk (jangan dulu terapkan efek sakit masif).
7. Transisi: satu sequence controllable *First Horizon Reveal* untuk uji kamera/lighting terpisah.

## Guardrails
- Moss tidak boleh menjadi kunci Spire atau alat energi; punya agensi dan tidak sekadar remote switch.
- Puzzle harus terbaca tanpa trial-and-error acak; jangan mengandalkan cutscene penjelasan.
- Hindari manipulasi emosi lewat kontrol Moss sengaja macet/AI sengaja buruk.
- State akhir H18 tidak boleh mengubah canon akibat simplifikasi mekanik.

## Acceptance MVP
Build bisa dimainkan dari awal sampai akhir area uji; Okto tak tembus tanah; Moss tidak hilang permanen/soft-lock; puzzle dapat diulang; kamera halus; log tanpa error kritis. Evaluasi rasa permainan dengan test, bukan hanya screenshot.

## OPEN
Input mapping, walk/run speeds, jump height, climb, Moss commands, state machine detail, kemampuan resonansi, checkpoint, penanda peta, mekanik pilihan akhir. Tentukan melalui prototipe dan persetujuan Director.
