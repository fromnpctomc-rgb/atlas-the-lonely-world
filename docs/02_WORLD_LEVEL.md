# 02 — World, Regions & Level Design | Atlas Game 1
**Sumber:** `00_MASTER_SOURCE_v1.7.md` B0, D1–D7. **Status:** 6 region & 5 act adalah baseline planning; nama region dan detail fisik masih working.

## Prinsip wajib
**Continuous World Illusion (WC-01):** geografi, arsitektur, ekologi, suara dan landmark harus terasa menyatu. **Playable Transitions (WRT-02):** pemain mengalami perpindahan dengan kontrol, kamera dan ruang; tidak perlu video antarregion. Scene Godot boleh terpisah secara teknis. Gunakan directed exploration, cabang pendek yang kembali ke rute utama, bukan open-world besar.

## Rute kerja
| Urutan | Region | Identitas dan tujuan | Transisi ke wilayah berikutnya |
|---|---|---|---|
| 1 | Nomad Crater Valley | Lembah terlindung, permukiman, peta ayah | Lorong sempit dan gelap → panorama dunia luar |
| 2 | Broken Crossing | Jurang lembap, jembatan terputus, pertemuan Moss | Turun mengikuti jalur/infrastruktur air |
| 3 | Overgrown Aqueduct | Infrastruktur air subur, fauna, eksplorasi & kedekatan | Saluran menuju ruang arsitektur sunyi |
| 4 | Echoing Ruins | Galeri kuno, sejarah terbatas, petunjuk kondisi Moss | Keluar menuju dataran tinggi berangin |
| 5 | Fracture Approach | Dataran tinggi, patahan, lanskap monumental ambigu | Jalur tua dan fondasi makin besar menuju Spire |
| 6 | Continental Spire | Infrastruktur yang masih menopang kehidupan wilayah | Pilihan akhir dan resolusi |

**First Horizon Reveal:** Okto merunduk/merayap dalam lorong gelap, kamera dan audio terkompresi; di ujung lorong pemandangan terbuka drastis, kamera mundur halus, kontrol kembali/bertahan. Mekanik crawling universal belum disetujui; boleh adegan khusus untuk prototipe.

## Aturan level
- Satu vista harus memiliki tujuan navigasi/emosi, bukan hanya wallpaper. Landmark yang terlihat dari jauh idealnya dapat dikenali kembali.
- Tiga lapisan navigasi: global (Spire), regional (jembatan/aqueduct), lokal (objek penciri).
- Bedakan Broken Crossing (vertikal, lembap) dari Fracture Approach (terbuka, kering), dan Aqueduct (hidup/subur) dari Echoing Ruins (hening/observasional).
- Act 2 wajib menyediakan ruang alam terbuka, kehidupan ambient, dan momen tenang Okto–Moss.
- Tiap transisi: **alasan lokasi + perubahan lingkungan bertahap + aksi pemain + beat emosi**.
- Estimasi planning: ~12 chapter, ~18–24 subarea; **bukan** 12 spesifikasi chapter final. Jangan buat dokumen per chapter dulu.

## Template singkat untuk implementasi area (gunakan issue/task, bukan file baru)
`ID | Region | Masuk→Keluar | Aksi utama | Moss role | Narative beat | Landmark | Aset minimum | Kriteria lolos`.

## Masih OPEN
Peta koordinat, ketinggian, jarak, biome final, jumlah chapter riil, hidden loading, arsitektur final, apakah formasi mirip Golem adalah alam/artefak/fosil. *The Broken Watershed* hanya hipotesis, bukan canon.
