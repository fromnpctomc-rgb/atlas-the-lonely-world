# 06 — Godot Engineering & Integration | Atlas Game 1
**Sumber naratif:** `00_MASTER_SOURCE_v1.7.md` dan dokumen 01–05. **Status:** rancangan teknis awal untuk Codex; struktur bisa disesuaikan sesudah mengecek proyek dan versi Godot terpasang.

## Target awal
Buat **prototype gameplay yang berjalan**, bukan game lengkap. Periksa lingkungan pengguna (OS, versi Godot, repo, plugin) sebelum menginstal atau mengubah sistem. Jangan menjanjikan kontrol laptop tanpa izin dan akses yang benar.

## Rancangan folder kerja (PROPOSAL)
```text
atlas-godot/
├── AGENTS.md                  # instruksi Codex (dokumen 07)
├── docs/                      # dokumen 00–06
├── project.godot              # dibuat/diinspeksi oleh Codex
├── scenes/{prototype,characters,world,ui}/
├── scripts/{characters,systems,world}/
├── assets/{characters,environment,audio,ui}/
└── tests/
```

## Urutan build pertama (task kecil; verifikasi setiap tahap)
1. Inspeksi environment/repo, catat baseline project dan Git status; pilih Godot 4.x hanya bila kompatibel dengan proyek aktual.
2. Buat satu greybox scene dengan `CharacterBody2D` Okto, platform collision, spawn, batas kamera.
3. Tambahkan kamera follow yang lembut dan uji framing character/landmark.
4. Tambahkan Moss placeholder (follow/idle/context), dengan recovery anti-softlock.
5. Tambahkan satu interactable dan cooperative puzzle sederhana.
6. Buat scene terpisah untuk playable transition: lorong sempit → reveal panorama (placeholder visuals).
7. Integrasi satu aset visual nyata; pastikan ukuran, pivot, parallax dan import settings benar.

## Standar engineering
- Scene modular dan kode terpisah dari aset; gunakan resource/data untuk tuning jika berguna.
- Tidak menambahkan mekanik dan lore final dari inisiatif coding sendiri.
- Tiap perubahan: daftar file diubah, cara menjalankan, hasil tes, keterbatasan, rollback.
- Hindari instalasi paket/akses jaringan/perintah destruktif tanpa izin Game Director.
- Tetapkan input mapping, UI, physics tuning berdasarkan playtest; nilai dalam kode adalah **prototype tuning**, bukan canon.

## Acceptance test prototipe
Launch scene berhasil, kontrol tidak macet, karakter tidak menembus terrain, Moss mengikuti tanpa softlock, puzzle dapat diselesaikan ulang, kamera stabil saat transisi, tidak ada error fatal, script dan scene versioned.

## Definition of done per tugas Codex
`Goal | Scope files | No-go changes | Implementation | How to run | Expected behavior | Test evidence | Known limitations | Approval needed`.
