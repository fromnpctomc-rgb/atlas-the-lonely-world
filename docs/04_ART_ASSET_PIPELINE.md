# 04 — Art Direction & Asset Pipeline | Atlas Game 1
**Sumber:** `00_MASTER_SOURCE_v1.7.md` B0 dan D. **Status:** *Living Ancient World* arah disetujui; style sheet dan asset specs final belum dikunci.

## Empat pilar visual
1. Geologi megah dan bentuk alam yang khas (tidak setiap tempat harus reruntuhan).
2. Peninggalan peradaban dengan fungsi sejarah dan struktur yang masuk akal.
3. Alam yang aktif: fauna, air, vegetasi, angin, cahaya ambient.
4. **Cartographer’s Gaze:** pemain membaca jarak, medan, landmark, dan hubungan antarwilayah.

Monumen boleh berupa arsitektur, keajaiban alam, atau objek ambigu. Jangan mengubah siluet menyerupai Golem menjadi fakta sejarah tanpa approval. Referensi *Planet of Lana* adalah tolok mutu atmosfer, **bukan template visual**.

## Produksi aset: urutan minimum
- **Pertama:** satu model sheet Okto, satu model sheet Moss (side/3⁄4 sesuai kamera & rig), satu panduan skala karakter.
- **Kedua:** satu playable environment style test dari Aqueduct: far BG, midground, terrain platform, foreground, 3–5 props, satu objek interaktif.
- **Ketiga:** uji keterbacaan di Godot pada viewport sebenarnya; baru perluas ke master concepts enam region.
- **Terakhir:** aset modular regional, fauna, VFX, variations, dan produksi massal setelah kualitas lolos.

## Kontrak aset sederhana (setiap task aset, tidak perlu file sendiri)
`Asset ID | Nama | Region/Scene | Penggunaan (BG/FG/terrain/prop/character/UI) | Sudut kamera | Resolusi kandidat | Transparansi | Pivot/anchor | Frames/rig | Skala in-engine | Status (proposal/approved) | File path`.

**Wajib untuk playable asset:** background bersih saat perlu transparansi; prop tanpa bayangan/horizon yang tak bisa dipisahkan; sprite konsisten perspektif dan skala; animasi tak berubah bentuk antarframe; layer parallax bukan satu gambar flatten ketika butuh depth; lisensi/sumber aset dicatat. Resolusi dan frame count ditentukan setelah uji camera zoom & pixels-per-unit, bukan angka asal.

## Budgeting reference, bukan order generasi
6–8 master concepts; 18–24 subarea keys; 50–80 BG layers; 80–140 terrain/architecture modules; 60–100 props; 25–45 interactables; 15–25 ambient fauna; 20–35 VFX. **274–457 unit komponen bukan ilustrasi unik.** Reuse modul dan sesuaikan angka sesudah vertical slice.

## Quality gate art
Style coherent dengan Okto–Moss; region punya siluet berbeda; material tidak berubah acak; gameplay plane readable; tidak terlalu banyak cyan glow generik; bukan tiruan komposisi/warna game referensi; impor Godot lolos sebelum batch berikutnya.
