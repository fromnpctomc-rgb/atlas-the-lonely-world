# CODEX IMPLEMENTATION DIRECTIVE
## PROJECT HORIZON — ATLAS OF THE LONELY WORLD
### Godot 4.7.2 · Existing Project · Playable Greybox A01–A07

**ROLE:** Senior Godot Gameplay Engineer, Technical Level Designer, Gameplay Systems Architect, QA Engineer.

**MISSION:** Implementasikan seluruh Opening Gameplay Greybox A01–A07 ke project Atlas yang sudah berjalan. Hasil harus playable, terintegrasi dengan project eksisting, dan diuji secara nyata. Jangan berhenti pada perencanaan, dokumentasi, atau scene placeholder.

## 1. SOURCE OF TRUTH

Baca secara menyeluruh:

1. `ATLAS_OF_THE_LONELY_WORLD_MASTER_CANON_FINAL_v4.0.md`
2. `ATLAS_OPENING_GAMEPLAY_BLUEPRINT_A01_A07_v1.md`
3. `ATLAS_GREYBOX_TECHNICAL_BLUEPRINT_A01_A07_v1.0.md`

Gunakan urutan otoritas dan rekonsiliasi yang dijelaskan dalam blueprint teknis. Jangan mengubah canon, urutan cerita, motivasi Okto, atau pertemuan Moss.

Apabila file belum ada di workspace, cari terlebih dahulu di folder project atau lokasi referensi yang tersedia. Jika tidak ditemukan, laporkan file yang hilang. Jangan mengarang isi dokumen.

## 2. MANDATORY PROJECT AUDIT

Sebelum mengubah kode:

- Temukan root project yang mengandung `project.godot`.
- Verifikasi versi Godot yang tersedia. Target adalah Godot 4.7.2; bila executable atau API berbeda, laporkan dan jangan mengklaim telah menguji pada 4.7.2.
- Periksa struktur folder, main scene, autoload, input map, scene transitions, character controller, camera, animation, collision, dan sistem save yang sudah ada.
- Identifikasi scene dan asset Okto, termasuk idle, walk, run, jump, pivot, collision, dan skala sprite.
- Identifikasi implementasi Moss yang sudah tersedia.
- Periksa error, warning, dependency, serta konfigurasi rendering.
- Periksa status Git dan perubahan lokal sebelum melakukan modifikasi.

**Dilarang:**

- Membuat project Godot baru sebagai pengganti project Atlas.
- Menghapus scene, asset, atau script eksisting tanpa alasan yang terverifikasi.
- Mengganti character controller yang sudah berfungsi hanya karena lebih mudah.
- Menimpa perubahan lokal yang tidak terkait.
- Menggunakan scale berbeda untuk setiap animasi Okto.
- Mengklaim fitur selesai tanpa menjalankan pengujian.

Jika sistem eksisting sudah memadai, gunakan dan perluas. Jika perlu refactor, lakukan secara terukur dengan menjaga kompatibilitas.

## 3. DEFINITION OF DONE

Saat project dijalankan, pemain harus dapat:

1. Membuka main menu Atlas.
2. Menekan New Game.
3. Menyaksikan opening cinematic.
4. Mengendalikan Okto di Nomad Settlement.
5. Mempelajari gerakan secara alami.
6. Mendaki Survey Ridge.
7. Menyelesaikan puzzle observasi.
8. Mengalami runtuhan batu yang reaktif.
9. Menyeberangi Cliff Passage.
10. Menyaksikan First Horizon Reveal.
11. Mengeksplorasi Crossing Rim melalui dua cabang.
12. Mengalami runtuhan struktur dan menemukan recovery route.
13. Jatuh secara aman ke Fallen Span.
14. Bertemu Moss untuk pertama kalinya.
15. Menyelesaikan puzzle kerja sama dua arah.
16. Melewati Shared Bridgeworks bersama Moss.
17. Menuruni Downstream Descent.
18. Menyaksikan Aqueduct Reveal dan mencapai batas R03.

Seluruh urutan harus dapat dimainkan tanpa error kritis, soft-lock, atau placeholder yang memblokir progres.

## 4. CHARACTER CONTROLLER

Pertahankan dan kalibrasi controller Okto:

- CharacterBody2D.
- Horizontal movement responsif dengan sedikit momentum.
- Jump terasa berat, dengan air control terbatas.
- Auto ledge grab pada permukaan valid.
- Ledge climb dan controlled descent.
- Coyote time dan jump buffering.
- Fixed collision dimensions.
- Fixed animation pivot.
- Konsistensi ukuran idle, walk, run, jump.
- Tidak ada dash, double jump, wall jump, atau combat.

Gunakan baseline dokumen teknis, lalu ukur jarak lompatan aktual sebelum menentukan lebar celah.

Definisikan 1 Character Unit (CU) berdasarkan tinggi collision Okto.

Target visual Okto: 18–22% tinggi viewport. Kamera tidak boleh mengubah ukuran karakter secara tidak konsisten.

## 5. LEVEL GEOMETRY A01–A07

Bangun geometri side-on dengan proporsi mendekati final, tetapi gunakan visual greybox yang jelas.

### A01 — Nomad Settlement

Implementasikan rumah sebagai titik awal setelah cinematic, jalur permukiman bertingkat, lereng, tangga, teras, tutorial movement/jump/ledge, beberapa sudut eksplorasi opsional, serta transisi alami menuju Survey Ridge.

Tidak boleh ada bahaya fatal.

### A02 — Survey Ridge

Bangun pendakian bertingkat, satu brittle shelf tutorial, recovery route, tiga formasi batu, titik Survey, dua kandidat jalur, serta celah tersembunyi menuju A03.

Puzzle harus dapat diselesaikan melalui observasi lingkungan. Membuka Living Map bukan syarat penyelesaian.

### A03 — Cliff Passage

Bangun lorong dengan progresi sempit → vertikal → gelap → terbuka.

Implementasikan ledge grab, controlled descent, satu runtuhan masonry, recovery shelf, camera transition, dan First Horizon Reveal.

Setelah reveal, kendali pemain segera dikembalikan.

### A04 — Crossing Rim

Bangun jalur utama dengan upper loop dan lower loop yang kembali bergabung.

Implementasikan broken bridge traversal, reactive slab yang membuka jalur bawah, checkpoint, observasi lingkungan, serta transisi menuju Fallen Span.

Jangan memunculkan Moss sebelum A05.

### A05 — Fallen Span

Implementasikan authored safe fall ke ruang servis tua dengan dua elevasi.

Bangun first encounter Moss dan puzzle:

- Okto mencapai dan mengoperasikan pengungkit.
- Pengungkit membuka akses fisik untuk Moss.
- Moss berinisiatif memasuki jalur sempit.
- Moss menggerakkan catch atau counterweight.
- Jalur pendakian Okto terbuka.
- Struktur keluar mengalami keruntuhan.
- Okto dan Moss saling membantu menyelamatkan diri.

Jangan menjadikan Moss tombol puzzle, battery, atau companion yang selalu menunggu perintah.

### A06 — Shared Bridgeworks

Implementasikan hesitant following, contextual initiative, companion navigation, jembatan dengan jalur berbeda untuk Okto dan Moss, latch puzzle, serta regroup.

### A07 — Downstream Descent

Bangun switchback descent, layered ledges, wet wooden walkway, recoverable lower tier, aliran air yang konsisten menuju Aqueduct, serta cinematic reveal di batas R03.

Jangan membangun puzzle utama R03 pada tahap ini.

## 6. REACTIVE ENVIRONMENT SYSTEM

Buat sistem modular reusable untuk permukaan dan struktur reaktif.

Gunakan state machine:

`STABLE → CONTACT_REACT → WARNING → FAILING → SETTLED`

Tambahkan RESETTING hanya bila diperlukan.

Sistem harus mendukung:

- Pemicu kontak, beban, atau scripted event.
- Micro-tilt.
- Retakan progresif.
- Debu dan debris.
- Perubahan collision pada frame yang tepat.
- Keruntuhan fisik atau animasi yang terkontrol.
- Recovery route.
- Persisted structural changes.
- Reset lokal saat checkpoint jika sesuai.

Baseline waktu:

| Area | Warning-to-failure |
|---|---|
| A02 brittle shelf | 1.0–1.5 s |
| A03 masonry | 0.75–1.2 s |
| A04 slab | 1.2–1.8 s |
| A05 story shelf | 0.8–1.3 s |
| A05 rescue catwalk | 1.4–2.2 s |
| A07 wet walkway | 0.8–1.4 s |

Timer dimulai sesuai trigger yang ditetapkan dalam blueprint, bukan secara acak.

**Penting:** petunjuk bahaya wajib berbasis visual. Audio material dan benturan tetap ada, tetapi suara bukan satu-satunya cara mengetahui bahaya.

Runtuhan penting harus mengubah kondisi medan secara konsisten. Hindari kejadian acak yang menyebabkan pemain terjebak.

## 7. PUZZLE IMPLEMENTATION

Buat setiap puzzle dengan state machine yang jelas, bukan sekumpulan trigger tanpa pengelolaan state.

**A02 Survey Puzzle:** observasi tiga landmark, pengenalan hubungan medan, penemuan jalur tersembunyi. Tidak ada magical reveal atau syarat membuka peta.

**A05 Moss Cooperation:** dua karakter harus memberikan kontribusi nyata. Mekanisme harus menunjukkan sebab-akibat secara visual. Pastikan reload atau respawn tidak membuat puzzle tidak dapat diselesaikan.

**A06 Shared Bridge:** Okto membuka akses, Moss melihat kesempatan dan bertindak, latch bergeser, jalur terhubung, kedua karakter berkumpul kembali.

Setiap puzzle wajib memiliki kondisi awal, trigger, state progression, completion condition, fallback, dan reset behavior.

## 8. MOSS COMPANION AI

Moss baru tersedia pada A05.

Implementasikan behavior berbasis state:

- Curious approach.
- Wary observation.
- Contextual investigation.
- Cooperation opportunity.
- Independent action.
- Hesitant follow.
- Wait safe.
- Regroup.
- Safe offscreen recovery jika benar-benar diperlukan.

Gunakan navigation anchors dan state yang deterministik pada puzzle.

Moss harus bisa tertinggal sementara tanpa menyebabkan soft-lock. Jangan teleport Moss secara terlihat saat momen emosional atau penyelamatan.

Jangan menambahkan kemampuan Resonance besar yang belum diperkenalkan dalam canon Game 1.

## 9. CAMERA & CINEMATIC

Implementasikan Camera2D dengan:

- Smooth follow.
- Horizontal look-ahead.
- Vertical dead zone.
- Camera bounds.
- Framing yang memperlihatkan landing zone.
- Contextual camera zones.
- Survey framing.
- Horizon Reveal.
- Moss first encounter.
- Mutual rescue reaction.
- Aqueduct Reveal.

Cinematic tidak boleh mengambil alih kendali saat pemain harus bereaksi terhadap runtuhan.

HUD normal harus minimal atau tidak terlihat. Context prompt muncul hanya saat relevan.

## 10. CHECKPOINT & SAVE

Implementasikan checkpoint sesuai blueprint teknis, termasuk:

- A01 exit.
- A02 exposed climb.
- A03 descent dan reveal.
- A04 bridge.
- A05 safe drop dan cooperation.
- A06 bridge.
- A07 wet walkway.
- R03 entry.

Simpan state yang relevan: posisi aman, area, puzzle, perubahan struktur penting, progress observasi, cinematic flags, dan companion state.

Respawn tidak boleh menempatkan Okto di atas platform yang sudah hancur.

Target respawn setelah kegagalan fatal: kurang dari 2 detik, setelah dikalibrasi.

## 11. GODOT ARCHITECTURE

Gunakan scene modular dan typed GDScript yang kompatibel dengan versi Godot yang terpasang.

Arsitektur harus memisahkan:

- Player movement.
- Camera control.
- Level triggers.
- Reactive environment.
- Puzzle controllers.
- Companion behavior.
- Checkpoint/save state.
- Cinematic direction.
- Scene transitions.

Gunakan signals dan node references yang jelas. Hindari hardcoded path yang rapuh, circular dependencies, dan singleton tambahan yang tidak diperlukan.

Ikuti konvensi penamaan project eksisting.

## 12. IMPLEMENTATION PHASES

Kerjakan dalam urutan berikut:

**Phase 0 — Audit and Baseline**
- Inspeksi project.
- Dokumentasikan kondisi awal.
- Pastikan project dapat dibuka dan dijalankan.
- Buat backup/commit aman sesuai workflow repository.

**Phase 1 — Movement & Camera**
- Perbaiki konsistensi Okto.
- Kalibrasi gerakan.
- Ukur jangkauan lompatan.
- Implementasikan ledge traversal dan kamera.

**Phase 2 — A01–A03**
- Geometri.
- Tutorial.
- Survey puzzle.
- Runtuhan pembelajaran.
- Cliff Passage.
- Horizon Reveal.

**Phase 3 — A04**
- Percabangan.
- Bridge traversal.
- Reactive slab.
- Recovery route.

**Phase 4 — A05**
- Safe fall.
- Moss encounter.
- Cooperative puzzle.
- Mutual rescue.

**Phase 5 — A06–A07**
- Companion traversal.
- Shared Bridgeworks.
- Downstream Descent.
- Aqueduct Reveal.

**Phase 6 — QA and Tuning**
- Validasi keseluruhan journey.
- Perbaiki error dan soft-lock.
- Uji checkpoint dan save.
- Evaluasi timing dan difficulty.
- Dokumentasikan parameter yang masih membutuhkan human playtest.

Selesaikan satu fase sebelum bergantung pada fase berikutnya. Jangan berhenti hanya karena telah membuat laporan fase; lanjutkan hingga seluruh scope selesai, kecuali ada blocker nyata.

## 13. MANDATORY TESTING

Jalankan pengujian menggunakan executable Godot yang tersedia.

Wajib memeriksa:

- Project import dan scene loading.
- Parse errors.
- Runtime errors.
- Missing resource references.
- Collision behavior.
- Player movement.
- Ledge grab.
- Reactive platform transitions.
- Puzzle completion.
- Checkpoint restoration.
- Moss navigation dan cooperation.
- A01 → A07 scene progression.
- New Game → R03 boundary full playthrough.

Jika memungkinkan, buat automated smoke tests atau scripted test scenes untuk state machine, save/restore, dan puzzle transitions.

Headless validation tidak cukup untuk menyatakan gameplay sudah sempurna. Jika graphical playtest atau kontrol interaktif tidak tersedia, nyatakan batas pengujiannya secara eksplisit.

Jangan melaporkan fitur sebagai verified jika hanya diimplementasikan tanpa pengujian.

## 14. ACCEPTANCE CRITERIA

Pekerjaan diterima apabila:

- Existing project Atlas tetap berfungsi.
- Tidak ada perubahan canon yang tidak diminta.
- Semua area A01–A07 dapat diakses.
- Seluruh critical path dapat diselesaikan.
- Semua puzzle wajib memiliki solusi yang bekerja.
- Runtuhan memberikan feedback visual dan konsekuensi fisik.
- Okto tidak berubah ukuran antar-animation state.
- Moss memiliki kontribusi aktif.
- Kamera mendukung gameplay.
- Checkpoint tidak menimbulkan soft-lock.
- Tidak ada error kritis atau resource hilang.
- Semua scene utama dapat dijalankan.
- Keterbatasan pengujian dilaporkan dengan jelas.

## 15. FINAL DELIVERY

Setelah implementasi, laporkan:

1. Ringkasan audit project awal.
2. File yang dibuat dan diubah.
3. Sistem gameplay yang diimplementasikan.
4. Daftar scene A01–A07.
5. Hasil pengujian yang benar-benar dijalankan.
6. Masalah yang ditemukan dan diperbaiki.
7. Masalah yang belum terselesaikan.
8. Parameter yang masih perlu tuning.
9. Cara menjalankan playable greybox.
10. Rekomendasi langkah produksi berikutnya.

Sediakan laporan implementasi dan QA dalam folder dokumentasi project yang sesuai.

**START NOW.** Audit existing Atlas project first, then implement the complete playable greybox. Prioritize working gameplay over visual decoration. Do not replace the existing project, do not fabricate test results, and do not stop at planning.
