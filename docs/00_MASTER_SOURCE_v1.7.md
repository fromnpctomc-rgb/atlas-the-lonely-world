# ATLAS OF THE LONELY WORLD — UNIFIED PROJECT SOURCE v1.7

**Tanggal konsolidasi:** 31 Oktober 2026  
**Versi:** 1.7 — menambahkan World Visual Diversity Pass, World Route & Transition Blueprint, dan Cinematic Direction; menjaga pemisahan approved direction vs proposal  
**Status:** WORKING MASTER SOURCE — PARTIALLY APPROVED, **BUKAN FINAL CANON**  
**Pemegang otoritas:** Game Director  
**Tujuan:** **Satu-satunya file sumber aktif** untuk Project Horizon agar semua AI/penulis/desainer/developer memakai keputusan yang sama.

> **PENTING UNTUK SEMUA AGENT:** Baca bagian A dan B sebelum menggunakan materi berikutnya. Bagian sumber historis/arsip tidak boleh mengesampingkan keputusan terbaru. Label `APPROVED—DETAIL`, `APPROVED—DIRECTION`, `FOUNDATION`, `PROPOSAL`, `OPEN`, dan `LEGACY` harus dipertahankan. Jika detail belum disetujui, jangan tulis sebagai fakta, dialog final, cutscene final, atau mekanik final.

## B0. UPDATE DIREKTUR GAME — WORLD ROUTE, TRANSITION & CINEMATIC (31 OKTOBER 2026)

**Prioritas:** Bagian ini mengungguli proposal lama yang bertentangan. Ini persetujuan **arah**, bukan persetujuan atas semua nama geografis, ilustrasi, scene, mekanik, atau koordinat.

### Decision register terbaru

| ID | Status | Keputusan / batas persetujuan |
|---|---|---|
| WVD-01 | APPROVED—DIRECTION | Enam region memiliki identitas geografi, ekologi, atmosfer, siluet, dan pengalaman eksplorasi yang berbeda, tetapi tetap satu dunia *Living Ancient World*. Monumentalitas tidak boleh membuat gameplay 2D kehilangan readability. |
| MM-01 | APPROVED—DIRECTION | Monumen kolosal dapat berupa peninggalan peradaban, keajaiban alam, atau objek ambigu seperti gunung/kerangka menyerupai Golem; misteri boleh dibiarkan tanpa jawaban. Tidak berarti Golem kolosal hidup atau fosil tertentu otomatis canon. |
| WC-01 | APPROVED—DIRECTION | **Continuous World Illusion**: perpindahan keenam region memiliki kesinambungan geografis, ekologis, dan arsitektural. Gunakan foreshadowing landmark, perubahan biome bertahap, callback lokasi sebelumnya, dan transisi teknis tersembunyi bila diperlukan. |
| WRT-01 | APPROVED—DIRECTION | **World Route & Transition Blueprint**: satu perjalanan utama terarah dengan cabang pendek *branch-and-rejoin* untuk eksplorasi bermakna, bukan open world atau koridor tanpa pilihan. Rincian geografi di bawah masih PROPOSAL. |
| WRT-02 | APPROVED—DIRECTION + DIRECTOR EXAMPLE | **Playable Transitions**: perpindahan wilayah diwujudkan melalui aksi pemain, perubahan ruang, kamera, cahaya, suara, dan lingkungan; tidak mengandalkan cutscene/loading yang terasa terputus. Contoh spesifik disukai Game Director: Okto merunduk/merayap keluar dari lorong gelap sempit dan menemukan panorama dunia luar yang sangat kontras. |
| CD-01 | APPROVED—DIRECTION | **Gameplay-first cinematic storytelling**: perjalanan dan perkembangan emosi Okto–Moss terutama dialami lewat gameplay, perilaku companion, environmental storytelling, dan in-engine interactive cinematic; hindari cutscene non-interaktif berulang. |
| CD-02 | APPROVED—DIRECTION | **Animated cutscene khusus prolog dan epilog.** Prolog berupa film naratif sederhana sekitar **30 detik–3 menit** untuk memperkenalkan latar Okto dan alasan perjalanannya; epilog menutup cerita secara emosional sesuai ending. Durasi final, storyboard, dan teknik animasi belum ditetapkan. |

### WVD-01 — enam identitas visual (working, belum final art bible)

| Region | Kontras visual / ekologi | Fungsi emosional | Status rincian |
|---|---|---|---|
| Nomad Crater Valley | Lembah terlindung, permukiman, rerumputan hangat, dinding kawah | Akrab → penasaran → berani | PROPOSAL |
| Broken Crossing | Jurang lembap, jembatan rusak, kabut, vertikalitas | Kagum → gentar → percaya | PROPOSAL |
| Overgrown Aqueduct | Saluran air bertingkat, vegetasi lebat, fauna, ruang alam terbuka | Bebas → bermain → kedekatan | PROPOSAL |
| Echoing Ruins | Galeri/ruang observasi kuno, lebih kering, sunyi, material hangat | Misteri → kekhawatiran | PROPOSAL |
| Fracture Approach | Dataran tinggi terbuka, angin, geologi patahan, landmark ambigu | Keterasingan → keteguhan | PROPOSAL |
| Continental Spire | Infrastruktur monumental yang masih berfungsi, detail resonansi selektif | Kagum → tekanan → tanggung jawab | PROPOSAL |

**Guardrail:** Broken Crossing ≠ Fracture Approach (lembap/vertikal vs kering/terbuka); Aqueduct ≠ Echoing Ruins (subur/ramai vs sunyi/observasional). Hindari enam variasi reruntuhan batu berlumut. Pastikan Act 2 memiliki sub-area alam terbuka yang hidup dan momen kebersamaan Okto–Moss. Referensi visual adalah inspirasi, bukan aset atau sejarah canon. Skema 50/35/15 persen tipe landmark hanyalah ilustrasi, **bukan kuota disetujui**.

### WRT-01 — World Route & Transition Blueprint (topologi kerja)

**Hipotesis geografis, PROPOSAL:** *The Broken Watershed* — rute Game 1 mengikuti jaringan lembah, jurang, saluran air, infrastruktur lama, lereng, dan dataran tinggi menuju Spire. Nama, sumber air, arah mata angin, ketinggian, jarak, dan koordinat **OPEN**. Jangan menyimpulkan seluruh dunia Atlas adalah satu watershed.

**Rute berurutan:**
1. **Nomad Valley → Broken Crossing:** lereng kawah / jalur keluar; ruang menyempit lalu horizon terbuka. **First Horizon Reveal**.
2. **Broken Crossing → Overgrown Aqueduct:** menuruni jurang mengikuti jalur dan jejak infrastruktur air; kabut berkurang, vegetasi/fauna meningkat.
3. **Overgrown Aqueduct → Echoing Ruins:** saluran air bercabang ke struktur terlindung; suara kehidupan mereda, arsitektur menjadi lebih tertutup.
4. **Echoing Ruins → Fracture Approach:** keluar dari galeri melalui jalur naik; ruang sempit berubah menjadi dataran tinggi berangin; dapat melihat kembali area yang dilalui.
5. **Fracture Approach → Continental Spire:** bekas jalur perawatan dan fondasi makin teratur; Spire membesar secara bertahap di horizon.

**Aturan implementasi:** setiap transisi mempunyai (a) sebab geografi yang masuk akal, (b) perubahan bertahap minimal beberapa unsur tanah/vegetasi/cahaya/suara/arsitektur, (c) aksi gameplay, dan (d) beat emosi khas. Chapter/scene boleh dipisah secara teknis asalkan ilusi perjalanan kontinu terjaga. Gunakan landmark global, regional, dan lokal; landmark jauh yang dilihat pemain idealnya dapat dikunjungi atau dikenali kembali. Gunakan cabang pendek *branch-and-rejoin* yang memberi Living Map discoveries, sejarah, habitat, atau interaksi Moss, bukan hanya collectible. Perlihatkan kehidupan yang bergantung pada infrastruktur sebelum pilihan H18 agar dilema akhir punya bobot.

### WRT-02 — contoh Director: transisi terowongan → panorama

**APPROVED—DIRECTION (contoh konkret disukai, staging final masih terbuka):**
- **Compression:** Okto meninggalkan lembah melalui lorong batu yang gelap dan sempit; pemain merunduk/merayap untuk melewatinya, kamera dekat, suara teredam.
- **Threshold:** cahaya dan udara luar muncul bertahap; kontrol pemain dipertahankan semaksimal mungkin; hindari white flash berlebihan.
- **Release:** Okto keluar, berdiri, dan kamera membuka panorama dunia yang sangat berbeda serta jauh lebih luas daripada yang dibayangkan; perubahan skala menjadi pengalaman emosional.
- **Afterglow:** pemain kembali bebas bergerak, melihat landmark jauh, dan menghubungkan panorama dengan motivasi Cartographer/Living Map.
- **Produksi:** crawling dapat berupa animasi/interaksi khusus untuk momen ini, tidak wajib menjadi sistem universal. Hindari pengulangan pola reveal yang identik di tiap region dan jangan memperlihatkan semua keajaiban sekaligus.

### CD-01 / CD-02 — kebijakan sinematik

- **Animated prologue:** film naratif singkat **30 detik–3 menit** yang menjelaskan Okto secara sederhana dan mengapa ia memulai perjalanan. Fokus pada Okto, lembah, dan motivasi/peta ayah; **bukan** eksposisi Origin Core, perang, Seven Spires, atau seluruh lore.
- **Animated epilogue:** penutupan emosional Game 1 yang menghormati kedua ending H18 dan memberikan resolusi standalone; bukan teaser semata.
- **Antara prolog–epilog:** utamakan gameplay, in-engine staging, gerak kamera halus, perubahan ambience/musik, animasi dan perilaku Moss. Momen emosional terutama dialami, bukan ditonton. Pertemuan Moss, penurunan kondisinya, dan klimaks boleh memiliki *in-engine cinematic beats*, bukan kewajiban film terpisah.
- **OPEN:** durasi final prolog/epilog, storyboard *The Unfinished Map*, detail ayah Okto, voice-over/dialog, animasi, rasio waktu cutscene, scene-by-scene blocking. Saran prolog 60–90 detik hanyalah rekomendasi, bukan perubahan rentang yang diputuskan Director.

### Production planning dan gate

- **Baseline tetap:** 5 act, 6 region, ~12 chapter, ~18–24 sub-area, ~4 jam target utama, estimasi aset v1.6; semua hitungan estimasi planning, bukan kewajiban final.
- **Usulan validasi:** 12 environment concepts awal (establishing shot + playable composition untuk masing-masing region); kemudian world art bible, world topology/elevation sketch, biome transition sheets, parallax/gameplay readability test, dan vertical slice Aqueduct. Angka 12 ini **PROPOSAL**, tidak mengganti baseline 6 master environment concepts yang sudah tercatat.
- **Masih OPEN:** peta geografi final, distribusi sub-area, jumlah transisi yang benar-benar seamless secara engine, landmark permanen, desain kamera, mekanik crawling, jalur cabang, cutscene storyboard, biaya dan teknik animasi.
- **Dampak Game 1:** rasa dunia utuh, eksplorasi, keterikatan Okto–Moss, dan bobot pilihan akhir meningkat.
- **Dampak Game 2/3:** landmark dan geografi yang kelak diperluas harus konsisten, tetapi tidak ada lore/region sekuel baru yang ditetapkan oleh blueprint ini.

---

## A. ATURAN PRIORITAS DAN PENGGUNAAN

1. **Keputusan eksplisit Game Director terbaru** mengalahkan isi blueprint v5 dan proposal lama yang bertentangan.
2. `APPROVED—DETAIL`: hanya rumusan yang secara spesifik disetujui; jangan mengasumsikan konsekuensi tambahan.
3. `APPROVED—DIRECTION`: arah diterima, tetapi tanggal, mekanisme, pelaku, adegan, nama, dan angka **belum** otomatis diterima.
4. `FOUNDATION`: premis/identitas yang konsisten dipertahankan; detail turunannya tetap harus diperiksa.
5. `PROPOSAL`: bahan eksplorasi. `OPEN`: belum diputuskan. `LEGACY`: sumber lama yang mungkin bertentangan; **bukan instruksi untuk kembali ke canon lama**.
6. Jangan mengisi celah lore secara diam-diam. Tulis **Decision ID**, alternatif, konsekuensi Game 1–3, dan minta persetujuan Game Director.
7. Semua penulisan, art direction, gameplay, level, dan implementasi harus menjaga tiga pilar: **eksplorasi, tantangan, perjalanan emosional**.
8. Stone Cub adalah makhluk hidup sadar dan otonom; **bukan baterai, alat puzzle tanpa kehendak, atau korban yang sengaja diciptakan ibunya untuk sistem Spire**.
9. Manusia dan Golem sama-sama memiliki agensi, sejarah kerja sama, tanggung jawab, dan pilihan moral.
10. Dokumen ini menggabungkan **materi dengan tingkat otoritas berbeda**, bukan berarti semua isinya telah disetujui.

## B. DECISION REGISTER — STATUS TERBARU

| ID | Status | Keputusan yang boleh digunakan |
|---|---|---|
| H01 | APPROVED—DETAIL | Origin Core adalah fenomena alami, bukan ciptaan Golem. |
| H02 | APPROVED—DIRECTION | Spire berkembang dari infrastruktur peradaban menjadi penopang dunia terpecah. |
| H03 | APPROVED—DETAIL | Manusia dan Golem memiliki sejarah panjang hidup berdampingan, saling mempelajari, dan bekerja sama. |
| H04 | APPROVED—DIRECTION | Terdapat kesepakatan pengelolaan akses dan keselamatan penggunaan Spire. |
| H05 | APPROVED—DIRECTION | Freedom vs Stewardship melibatkan aliansi campuran manusia–Golem. |
| H06 | APPROVED—DIRECTION | Kedua ideologi punya alasan masuk akal dan risiko ekstremisme. |
| H07 | APPROVED—DIRECTION | Arah eskalasi W2 → W3 → W1; kejadian spesifik dan pelaku belum final. |
| H08 | APPROVED—DIRECTION | Perang mengakibatkan kerusakan Origin Core melalui gangguan resonansi berantai; fisika rinci belum final. |
| H09 | APPROVED—DIRECTION | Perang menyebabkan kehancuran/pemisahan dunia; penyelamatan menstabilkan pecahannya. |
| H10 | APPROVED—DIRECTION | The Last Separation merupakan upaya penyelamatan lintas spesies. |
| H11 | APPROVED—DIRECTION | Ibu Cub merupakan salah satu ahli/kolaborator penyelamatan; nasib dan tindakan rinci belum final. |
| H12 | APPROVED—DETAIL | Resonance Imprint muncul **tidak sengaja** saat Cub diselamatkan; efeknya belum diputuskan. |
| H13 | APPROVED—DETAIL | Cub berasal dari zaman kuno, bertahan melalui dormansi, dan memiliki ingatan terfragmentasi. |
| H14 | APPROVED—DIRECTION | **Resonance Instability**: kerentanan pascadormansi dan perubahan resonansi dunia mengganggu keselarasan individual Moss. Stabilisasi Spire terbatas; Imprint bukan kunci/baterai. Rincian medis/teknis belum final. |
| H15 | APPROVED—DIRECTION | Banyak faktor menjelaskan kelangsungan manusia dan kemunduran Golem; rinciannya belum final. |
| H16 | **DIRECTOR CLARIFICATION — APPROVED CAUSAL DIRECTION** | **Nomad terisolasi tujuh generasi karena dampak perang dan kehancuran dunia luar.** Mereka tidak mengetahui sebab isolasi itu. **Jangan** mengusulkan bencana lokal independen sebagai sebab utama. Hitungan tanggal perang, awal isolasi, dan durasi dormansi **belum** dipastikan. |
| H17 | APPROVED—DIRECTION | Pengungkapan sejarah dibagi bertahap sepanjang trilogi; jadwal spesifik belum final. |
| H18 | APPROVED—DIRECTION | **The Weight of One Life**: menolong Moss vs tanggung jawab terhadap dunia; dua ending **Preserve the Balance** dan **The Quiet Promise** beserta konsekuensi utama sesuai B6. Implementasi rinci belum final. |

**Catatan sinkronisasi:** Review Log v0.7 masih menyebut H16 “revision required” karena dibuat **sebelum** klarifikasi Game Director. Status H16 di tabel ini dan di Narrative & World Bible v1.0 yang sudah dikoreksi **menggantikan** entri lama tersebut. Proposal v0.6 juga salah menyebut isolasi sebagai peristiwa terpisah; gagasan itu **tidak berlaku**.

## B2. KEPUTUSAN GAME DIRECTOR TERBARU — IDENTITAS DAN NAMA (CANON)

Keputusan di bawah **mengungguli istilah kerja, usulan nama, atau jadwal pengungkapan** yang bertentangan dalam materi arsip yang terintegrasi setelah bagian ini.

| ID | Status | Keputusan canon |
|---|---|---|
| N01 | APPROVED—DETAIL | Judul game yang ditetapkan: **Atlas of the Lonely World**. Project Horizon tetap boleh dipakai sebagai nama proyek internal. |
| N02 | APPROVED—DETAIL | Nama pribadi tokoh utama: **Okto**. **The Cartographer** adalah sebutan peran, bukan nama pribadinya. |
| N03 | APPROVED—DETAIL | Nama yang diberikan Okto kepada Stone Cub adalah **Moss**. |
| N04 | APPROVED—DETAIL | Nama asli Stone Cub yang diberikan ibunya dalam peradaban Golem adalah **Oru**. |
| N05 | APPROVED—DETAIL | Makna yang dimaksud untuk nama Oru: **“kehidupan kecil yang disayangi”** (*a small cherished life*); nama ini merupakan ungkapan kasih ibu, **bukan ramalan, gelar, atau identitas kunci Spire**. |
| N06 | APPROVED—DIRECTION | Bahasa Golem menggunakan **resonansi** sebagai bagian penting komunikasi, bersama pola bunyi, getaran, gestur, dan/atau cahaya. Aturan fonologi, aksara, dan mekanisme komunikasi detail belum final. |
| N07 | APPROVED—DIRECTION | Nama asli **Oru terungkap pada Game 2** lewat eksplorasi yang memunculkan jejak masa lalu dan resonansi terkait ibunya. Lokasi, adegan, urutan petunjuk, dan dialog persisnya **belum canon**. |
| N08 | APPROVED—DETAIL | **Oru** dan **Moss** adalah nama bagi individu yang sama; keduanya bermakna dan tidak saling membatalkan. Nama bukan perintah aktivasi Spire, bukan kunci teknis, dan bukan penyembuh otomatis. |

**Batasan kesinambungan:** (1) Game 1 mengutamakan hubungan Okto–Moss; petunjuk masa lalu boleh ada tetapi tidak boleh mengungkap penuh nama Oru sebelum Game 2. (2) Game 2 memberikan pengungkapan emosional yang diperoleh melalui penjelajahan, bukan sekadar eksposisi. (3) Game 3 menghormati kedua identitas tanpa memaksakan pilihan nama. (4) Resonance Imprint tetap terjadi **secara tidak sengaja** saat penyelamatan oleh ibu Oru (H12), dan ingatan Oru tetap terfragmentasi (H13). (5) Hubungan antara bahasa resonansi, sistem Spire, dan ingatan Golem masih memerlukan aturan yang diuji; jangan menyamakan kemampuan komunikasi dengan kontrol infrastruktur.

**Belum ditetapkan (OPEN):** istilah “Orunic”, etimologi terpisah “Or” + “U”, tata bahasa Golem, apakah nama dipanggil dengan dua nada, bentuk simbol nama, adegan dialog “Oru? Moss?”, lokasi reruntuhan, rekaman suara ibu, dan detail bagaimana petunjuk diperoleh. Itu adalah **contoh eksplorasi**, bukan fakta canon.

---

## B3. WORLD FOUNDATION WF-01 — KEPUTUSAN GAME DIRECTOR (30 OKTOBER 2026)

**Putusan:** Game Director menyetujui **R1–R6, model Origin Core, Fracture, dan fungsi Seven Spires sebagai APPROVED—DIRECTION**. Persetujuan ini **bukan** penguncian seluruh mekanisme fisika, kronologi, geografi, atau desain level. Bila materi lama di bawah bertentangan dengan bagian ini, **B3 menang**.

| ID | Status | Arah canon yang disetujui |
|---|---|---|
| WF-R1 | APPROVED—DIRECTION | Resonansi adalah fenomena alam yang telah ada sebelum peradaban, Golem, dan Spire. |
| WF-R2 | APPROVED—DIRECTION | Resonansi tidak menghasilkan energi tanpa batas atau menyelesaikan semua masalah secara ajaib; ia memediasi keselarasan sistem. |
| WF-R3 | APPROVED—DIRECTION | Keselarasan terbatas; ketidakselarasan besar dapat mengganggu sistem lain dan menyebar. |
| WF-R4 | APPROVED—DIRECTION | Golem memiliki pola resonansi individual yang berkaitan dengan tubuh dan kesadarannya, tanpa kehilangan otonomi. |
| WF-R5 | APPROVED—DIRECTION | Material/struktur tertentu dapat menyimpan jejak resonansi terbatas; bukan rekaman sempurna masa lalu. |
| WF-R6 | APPROVED—DIRECTION | Stabilisasi dunia yang rusak memiliki batas kapasitas, memerlukan dukungan/pemeliharaan, dan dapat menimbulkan trade-off. |
| WF-CORE | APPROVED—DIRECTION | Origin Core adalah fenomena/struktur **alami** yang berkaitan dengan keselarasan resonansi skala dunia, bukan ciptaan Golem, mesin buatan, atau penjara yang telah dipastikan. Manifestasi fisiknya belum final. |
| WF-FRACTURE | APPROVED—DIRECTION | Gangguan resonansi berantai terkait perang merusak kestabilan Origin Core dan menyebabkan dunia terfragmentasi. Penyelamatan lintas spesies menstabilkan bagian yang tersisa; penyelamat bukan penyebab utama pemisahan. |
| WF-SPIRE | APPROVED—DIRECTION | Tujuh Spire semula infrastruktur kemajuan (regulasi, koneksi, pemanfaatan resonansi); pascaperang difungsikan sebagai penopang darurat wilayah terfragmentasi (regulation, connection, anchoring). Fungsi tepat per Spire belum final. |
| WF-SUSPENSION | PROPOSAL / NOT LOCKED | *Resonant Suspension* sebagai mekanisme daratan melayang; kondisi geologis dan batas gaya belum disetujui terpisah. |
| WF-CLOUDS | PROPOSAL / NOT LOCKED | Sea of Clouds sebagai lapisan atmosfer nyata di antara daratan; sifat, kedalaman, dan bahayanya belum final. |

**Batasan sebab-akibat:** Spire tidak wajib untuk menjaga dunia tetap utuh sebelum perang; fungsi penopang muncul setelah kerusakan Core. Angka tujuh adalah jumlah simpul utama yang sudah menjadi premis; alasan teknis/urutan pembangunan tujuh simpul belum ditetapkan. Tidak boleh mengubah Golem menjadi mesin atau mengasumsikan setiap Golem dapat mengendalikan Spire.

**Catatan historis WF-01 (status H14/H18 di bawah telah diperbarui oleh keputusan Game Director pada B6):**
- **H14:** penyebab pasti penyakit Moss, efek Resonance Imprint, kemungkinan terapi, biaya dan kemampuan Continental Spire. Hipotesis *ketidakselarasan pascadormansi* serta *konflik kapasitas Spire* adalah **PROPOSAL**.
- **H18:** bentuk, syarat, konsekuensi, dan kontinuitas dua ending Game 1. Arah pilihan yang berdampak nyata disetujui, rinciannya belum.
- Mekanisme gravitasi/pulau melayang, detail Sea of Clouds, desain tujuh Spire, kronologi absolut, pemicu persis perang, nasib ibu Oru, dan keadaan populasi Golem.
- Alasan praktis mengapa Okto mampu keluar dari lembah; peta ayahnya adalah fondasi cerita, tetapi jalur/kejadian spesifik masih perlu desain.

## B4. NARRATIVE & WORLD FOUNDATION — HANDOFF KE GAME 1

### Premis kerja yang boleh digunakan
**Atlas of the Lonely World** mengikuti **Okto**, pemuda dari komunitas Nomad yang terisolasi selama tujuh generasi sebagai akibat langsung kehancuran dunia setelah perang manusia–Golem. Dengan peta ayahnya yang belum selesai, Okto meninggalkan lembah untuk menjelajahi dan memetakan dunia yang belum ia kenal. Ia bertemu Golem kecil yang ia beri nama **Moss**; nama asli makhluk itu adalah **Oru**, yang maknanya “kehidupan kecil yang disayangi.” Oru adalah makhluk sadar, otonom, penyintas zaman kuno melalui dormansi dengan ingatan terfragmentasi. Hubungan mereka dibangun melalui perjalanan, tindakan, gestur, dan komunikasi nonverbal. Pengungkapan nama Oru ditempatkan pada **Game 2**, bukan Game 1.

### Kerangka sejarah yang disetujui arahnya
Golem mendahului manusia → kerja sama lintas spesies → jaringan tujuh Spire dan pengaturan The Covenant → perselisihan **Freedom vs Stewardship** dalam aliansi campuran → perang dan gangguan resonansi berantai → Origin Core terganggu dan dunia terfragmentasi → upaya penyelamatan lintas spesies / Last Separation, termasuk kontribusi ibu Oru → Age of Silence, kemunduran Golem dan isolasi Nomad. **Urutan umum** ini boleh dipakai; detail peristiwa dan tanggal tetap terbuka.

### Pilar pengalaman dan batas pengetahuan pemain
1. **Eksplorasi yang berarti:** pemain menemukan tempat, rute, fenomena, dan jejak sejarah; tidak semua misteri harus dijelaskan.
2. **Tantangan gameplay:** platforming, navigasi, puzzle lingkungan, dan interaksi dua arah dengan Moss harus tumbuh dari aturan dunia; jangan membuat Moss sekadar tombol pembuka pintu.
3. **Hubungan emosional:** ikatan Okto–Moss berkembang lewat bantuan timbal balik, rasa ingin tahu, kerentanan, dan pilihan; jangan menghilangkan agensi Moss demi drama.
4. **Game 1 — Discover:** pengetahuan pemain lokal dan parsial; cerita utamanya harus memuaskan sendiri, bukan prolog eksposisi.
5. **Game 2 — Understand:** perluasan geografi dan sejarah, termasuk pengungkapan nama Oru secara emosional melalui eksplorasi.
6. **Game 3 — Decide:** persoalan konsekuensi jangka panjang jaringan Spire dan Origin Core; resolusi spesifik belum canon.

### Pintu masuk Game 1 Narrative Design (semua masih perlu rancangan/persetujuan)
| ID | Pertanyaan | Keluaran berikutnya |
|---|---|---|
| G1-N01 | Apa kebutuhan batin, tujuan awal, dan konflik internal Okto? | Character arc dan premis emosional |
| G1-N02 | Apa pemicu konkret keberangkatan Okto dan peran peta ayahnya? | Opening dan inciting incident |
| G1-N03 | Bagaimana Okto bertemu Moss dan bagaimana kepercayaan dibangun lewat gameplay? | Encounter, companion arc, dan milestone |
| G1-N04 | Apa rangkaian wilayah, rintangan, dan penemuan menuju Continental Spire? | Beat sheet, world route, level purpose |
| G1-N05 | Apa ancaman pada Moss, petunjuknya, dan batas penyembuhan yang mungkin? | Review H14 tanpa penguncian prematur |
| G1-N06 | Apa pilihan moral klimaks dan konsekuensi dua ending yang sama-sama masuk akal? | Review H18 dan dampak Game 2–3 |
| G1-N07 | Informasi apa yang wajib diketahui pemain dan apa yang tetap misteri? | Reveal map dan spoiler boundaries |
| G1-N08 | Apa vertical slice yang membuktikan eksplorasi, platforming, dan ikatan Okto–Moss? | Slice brief dan acceptance criteria |

### Exit criteria fase Narrative Design
Fase berikutnya baru layak dikunci setelah Game Director menyetujui **arc Okto–Moss, beat sheet Game 1, alasan tiap wilayah, progression interaksi companion, H14, H18, reveal map, dan kesinambungan ke Game 2/3**. Jumlah level, durasi, act, nama wilayah, serta adegan akhir yang berasal dari file legacy **bukan canon otomatis**.

### Change log v1.3
`WF-01 | Persetujuan eksplisit Game Director atas R1–R6, Origin Core, Fracture, Seven Spires sebagai arah canon | APPROVED—DIRECTION | Game 1: aturan eksplorasi dan Continental Spire; Game 2: geografi terfragmentasi dan jaringan Spire; Game 3: konsekuensi Origin Core | 2026-10-30`.

---

## B5. GAME 1 — KEPUTUSAN NARATIF DAN PRODUK TERBARU (30 OKTOBER 2026)

**Keputusan Game Director eksplisit:**

| ID | Status | Keputusan |
|---|---|---|
| CA-01 | APPROVED—DIRECTION | Arc Okto–Moss: eksplorasi berkembang menjadi hubungan dan kepedulian; Living Map sebagai konsep pengembangan, bukan mekanik final. |
| NS-01 | APPROVED—DIRECTION | Game 1 menggunakan struktur lima babak: The Valley; Beyond the Edge; The Living World; The Fading Light; Continental Spire. Alokasi durasi tiap babak tidak terkunci. |
| PS-01 | APPROVED—DIRECTION | Target main story **3–5 jam**, harga acuan **sekitar US$15** (US$14.99 sebagai kandidat), game pertama harus memuaskan secara mandiri. Harga rilis belum final. |
| SF-01 | APPROVED—DIRECTION | Okto berangkat melalui petunjuk peta ayah; bertemu Moss melalui pertolongan timbal balik; Continental Spire adalah harapan yang belum pasti, bukan jaminan kesembuhan. Adegan rinci belum final. |
| H18-CONFLICT | APPROVED—DIRECTION | Game Director memilih konflik **B: menolong Moss vs tanggung jawab terhadap dunia** sebagai konflik klimaks Game 1. |
| H14 | APPROVED—DIRECTION | Resonance Instability; rincian gejala, durasi, dan implementasi terbuka. |
| H18-ENDINGS | APPROVED—DIRECTION | Preserve the Balance dan The Quiet Promise; konsekuensi utama disetujui, rincian interaksi dan epilog terbuka. |

### H14 + H18 — ARAH CANON DISETUJUI (RINCIAN IMPLEMENTASI BELUM FINAL)

**H14 — Resonance Instability (APPROVED—DIRECTION):** Kerentanan setelah dormansi panjang bertemu kondisi resonansi dunia yang berubah dan tidak stabil. Pola resonansi individual Moss mengalami gangguan progresif; ia tetap individu sadar dan otonom. Imprint dari penyelamatan ibu Oru **bukan** kunci, baterai, penyebab yang telah dipastikan, atau rekaman sempurna. Continental Spire mungkin dapat membantu proses penyesuaian terbatas, bukan menyembuhkan secara ajaib.

**H18 — The Weight of One Life (APPROVED—DIRECTION):** Continental Spire memiliki kapasitas terbatas untuk menopang kawasan dan membantu penyesuaian Moss. Pemain memahami trade-off sebelum memilih. Dua rancangan ending:

- **Preserve the Balance:** mempertahankan stabilisasi kawasan; Moss menerima bantuan terbatas, bertahan hidup dengan kondisi belum sepenuhnya pulih. Akibat lokal harus nyata dan diperlihatkan.
- **The Quiet Promise:** mengalokasikan sebagian kapasitas terbatas untuk stabilisasi Moss; sebagai konsekuensi, sebuah rute penghubung harus ditutup sementara secara terkendali, dengan jalur alternatif yang tetap aman. Moss memperoleh kondisi yang lebih stabil, bukan kesembuhan sempurna. Konsekuensi terhadap warga dan perjalanan harus diperlihatkan.

**Design constraints:** (1) Tidak ada korban massal otomatis; (2) tidak ada satu ending sebagai pilihan moral benar yang tersembunyi; (3) Moss mengekspresikan kehendaknya; (4) tidak ada keputusan tanpa informasi; (5) kedua ending menyelesaikan konflik lokal dan memiliki epilog Living Map; (6) jangan menjadikan Moss alat kontrol Spire; (7) konsekuensi harus logis menurut WF-R6 dan dapat disampaikan melalui gameplay; (8) ending tidak boleh mensyaratkan Game 2 agar Game 1 terasa selesai.

**Pemeriksaan sebelum lock:** Jelaskan mengapa Spire secara teknis dapat menstabilkan Moss, mengapa bantuan terbatas tidak cukup untuk kesembuhan penuh, siapa yang menggunakan jalur penghubung, bagaimana pemain mengetahui konsekuensi, dan apa peran aktif Moss. Detail teknis tersebut masih **OPEN / DESIGN PROPOSAL** dan harus konsisten dengan konsekuensi utama yang sudah disetujui.

**Dampak trilogi:** Game 1 harus menutup konflik Okto–Moss/Spire secara memuaskan; Game 2 tetap dapat mengungkap nama Oru dan sejarah ibunya tanpa membatalkan ending Game 1; Game 3 tidak boleh menganggap satu tindakan di Continental Spire telah memperbaiki Origin Core seluruh dunia.

### Berikutnya setelah persetujuan arah H14/H18
Susun **Game 1 Beat Sheet** (tujuan tiap babak, peristiwa pemicu, kemampuan baru, emotional beat), **World Route & Level Purpose**, dan **Vertical Slice** untuk membuktikan kualitas pengalaman premium 3–5 jam. Jangan memperluas Game 2/3 sebelum Game 1 tervalidasi.

---

## B6. GAME 1 — GAME DIRECTOR LOCK & DESIGN HANDOFF (30 OKTOBER 2026)

**Keputusan eksplisit terbaru:** H14 **Resonance Instability** dan H18 **The Weight of One Life** dengan dua ending **Preserve the Balance** / **The Quiet Promise** disetujui sebagai **APPROVED—DIRECTION**. Implementasi boleh disempurnakan tanpa mengubah konsekuensi utama. Konflik Game 1 harus tuntas secara lokal, bukan bergantung pada sekuel.

### H14/H18: kontrak konsekuensi yang tidak boleh diam-diam berubah
- Moss adalah individu hidup. Gangguan keselarasan resonansi terkait kerentanan setelah dormansi panjang dan dunia pascaperang yang berubah. Jangan mengubah Moss menjadi baterai, kunci Spire, atau penyakit sebagai kutukan.
- Continental Spire memiliki fungsi regulasi/stabilisasi terbatas; bukan mesin penyembuh tanpa biaya. Detail mengapa stabilisasi parsial bekerja masih perlu desain.
- **Preserve the Balance:** Okto mempertahankan kapasitas stabilisasi kawasan; Moss tetap hidup dan mendapat bantuan terbatas tetapi **belum pulih sepenuhnya**; infrastruktur wilayah tetap berfungsi.
- **The Quiet Promise:** Okto mengalihkan kapasitas terbatas untuk stabilisasi Moss; Moss **lebih stabil tetapi tidak sembuh sempurna**; **satu jalur penghubung kawasan ditutup sementara secara terkendali**, dengan jalur alternatif aman, dampak sosial/perjalanan nyata.
- Pemain mendapat informasi konsekuensi sebelum memilih; Moss menunjukkan agensi; tidak ada kematian massal otomatis atau ending yang dipromosikan sebagai satu-satunya pilihan benar. Kedua ending memberi epilog dan penutupan cerita Game 1.

### G1-BS-01 — Beat sheet lima babak (DESIGN PROPOSAL, bukan adegan canon)
**Target produk:** main story 3–5 jam; titik tengah produksi sekitar 4 jam, bukan kewajiban durasi tiap pemain. Harga acuan sekitar US$15, belum harga rilis final.

| Act / waktu acuan | Tujuan pemain | Beat sebab-akibat | Tantangan interaktif | Emotional beat / payoff |
|---|---|---|---|---|
| 0 The Valley / 0–20m | Temukan jalur keluar berdasarkan peta ayah | Okto menggabungkan observasi medan dan petunjuk peta; berangkat atas pilihannya sendiri | Gerak, lompatan, baca landmark, tandai peta | Rasa ingin tahu dan keberanian; dunia lebih besar dari lembah |
| 1 Beyond the Edge / 20–60m | Menyeberangi reruntuhan dan memahami makhluk asing | Okto membantu Moss melewati rintangan; kemudian Moss membantu Okto; hubungan bukan penyelamatan satu arah | Platforming traversal, puzzle observasi, perkenalan companion | Kecurigaan → kepercayaan; syal diberikan setelah hubungan mulai terbentuk |
| 2 The Living World / 60–150m | Temukan jalur dan tempat baru bersama | Peta menjadi Living Map; penemuan jejak manusia–Golem dan fungsi awal Spire; petunjuk kondisi Moss mula-mula samar | Eksplorasi bercabang, puzzle kolaboratif, rute opsional, interaksi lingkungan | Kebersamaan, kegembiraan, rasa memiliki; jangan dominasi tragedi |
| 3 The Fading Light / 150–210m | Cari sumber pertolongan bagi Moss | Gejala memburuk; jejak stabilisasi mengarah ke Continental Spire sebagai harapan belum pasti | Puzzle kerja sama yang beradaptasi, navigasi berisiko, pengumpulan petunjuk | Cemas tetapi saling percaya; Moss tetap aktif dan punya kehendak |
| 4 Continental Spire / 210–240m | Pahami sistem, selesaikan tantangan, pilih trade-off | Pemain mempelajari ketergantungan wilayah pada Spire, melihat konsekuensi kedua tindakan, lalu memilih | Ujian terpadu navigasi, peta, companion; keputusan melalui tindakan, bukan hanya dialog | Tanggung jawab, konsekuensi, resolusi Okto–Moss; epilog Living Map |

**Pacing safeguard:** temukan Moss cukup awal dalam Act 1; hindari >20 menit tutorial pasif; Act 2 harus paling kaya eksplorasi; informasi moral di Act 4 disiapkan sejak Act 2–3. Durasi di atas contoh 240 menit, **belum lock**.

### G1-WR-01 — World Route (PROPOSAL: identitas tempat/nama belum canon)

| Urutan | Zona kerja | Identitas eksplorasi | Tujuan level & clue | Diferensiasi gameplay |
|---|---|---|---|---|
| 1 | Nomad Crater Valley | Tempat aman, tebing, jejak jalur lama | Peta ayah, motivasi Okto, isolasi akibat perang | Tutorial traversal + cartography |
| 2 | Broken Crossing | Jembatan/struktur rusak di luar lembah | Encounter Moss, pertolongan timbal balik | Puzzle lingkungan dan companion pertama |
| 3 | Overgrown Aqueduct | Infrastruktur lama yang direbut vegetasi | Bukti kerja sama manusia–Golem, jejak pemanfaatan resonansi | Vertical traversal, aliran/gerak lingkungan, jalur bercabang |
| 4 | Echoing Ruins | Sisa permukiman atau fasilitas resonansi | Jejak terbatas masa lalu, fungsi regulasi Spire; bukan rekaman sejarah sempurna | Observasi pola, kerja sama Moss, environmental storytelling |
| 5 | Fracture Approach | Medan terfragmentasi mendekati Spire | Bukti dampak gangguan dunia; kondisi Moss makin tampak | Platforming tingkat lanjut, variasi rute aman dan menantang |
| 6 | Continental Spire & Settled Passage | Menara dan jalur penghubung yang digunakan kehidupan lokal | Pemain melihat siapa yang terdampak keputusan; kedua solusi ditunjukkan | Final integrated challenge + informed trade-off + ending |

**Kritik cakupan:** enam zona kerja bukan otomatis enam level; dapat dipecah menjadi 8–10 segmen produksi atau digabung berdasarkan hasil prototipe. Tidak semua area harus floating islands; geografi Sea of Clouds dan Resonant Suspension belum final. **Settled Passage** adalah usulan untuk membuat dampak jalur penyeberangan terasa konkret; keberadaan komunitas/lokasi tepatnya belum canon.

### G1-GP-01 — Gameplay Design (PROPOSAL, belum mekanik canon)

**Core loop:** amati landmark → jelajahi/platform → temukan hambatan → gunakan pemetaan dan kolaborasi Moss → buka jalur/temukan jejak → catat di Living Map → pilih tujuan eksplorasi berikutnya.

| Sistem | MVP yang perlu dibuktikan | Prinsip kualitas |
|---|---|---|
| Movement | Lari, lompat, climb/ledge interaction secukupnya, kontrol responsif | Hindari menambah kemampuan hanya untuk memperpanjang durasi |
| Cartography | Penanda landmark, peta yang terisi melalui penemuan | Living Map berguna bagi navigasi, bukan hanya scrapbook |
| Companion Moss | Follow, wait/come, interaksi kontekstual, inisiatif terbatas | Moss tidak terasa seperti tombol atau beban escort |
| Co-op puzzle | Membuka rute lewat dua peran yang berbeda | Pemain memahami sebab-akibat, bukan teka-teki trial-and-error buta |
| Resonance interaction | Satu kemampuan lingkungan dengan aturan dan batas jelas | Jangan membuat Moss mengendalikan seluruh Spire |
| Exploration reward | Rute opsional, vistas, artefak, interaksi lucu/emosional | Tidak ada grind atau collectible wajib untuk ending baik |
| Condition variation | Tantangan situasional saat Moss tidak stabil | Tidak menghukum pemain dengan AI macet atau menonaktifkan semua kemampuan |
| Final choice | Pemain melihat jalur kawasan yang ditopang dan kebutuhan Moss | Trade-off disampaikan melalui lingkungan dan aksi; bukan teks panjang |

**Vertical slice prioritas:** satu area 12–20 menit dari Act 2 yang mencakup traversal menyenangkan, satu landmark, puzzle dua karakter, interaksi Moss mandiri, satu penemuan Living Map, satu momen emosional tenang. **Exit criteria:** pemain memahami tujuan tanpa eksposisi panjang, Moss terasa hidup, kontrol dan kamera nyaman, puzzle dapat diselesaikan tanpa tebakan acak, dan eksplorasi terasa memuaskan. Angka 12–20 menit hanya target prototipe.

### Reveal boundaries & continuity
- Game 1 dapat mengungkap Spire sebagai infrastruktur lama yang kini menopang wilayah; **tidak** mengungkap keseluruhan sejarah perang atau nama asli **Oru**.
- Game 2 tetap mengungkap nama Oru dan hubungan dengan ibunya; kedua ending Game 1 tidak boleh dibatalkan atau dianggap noncanon tanpa keputusan baru.
- Game 3 tetap memiliki persoalan Origin Core skala dunia; satu pilihan di Continental Spire tidak menyembuhkan seluruh dunia.

### Open design decisions setelah lock arah
`G1-D01` mekanik traversal final; `G1-D02` bentuk kemampuan resonansi Moss; `G1-D03` sistem kamera/checkpoint; `G1-D04` geografi dan jumlah level; `G1-D05` cara memperlihatkan pengguna jalur penghubung dan jalur alternatif; `G1-D06` cara menyampaikan pilihan tanpa teks berlebihan; `G1-D07` urutan gejala yang aman bagi pengalaman pemain; `G1-D08` bentuk epilog kedua ending; `G1-D09` target visual/audio dan pipeline produksi.

**Change log v1.5:** `H14/H18 | APPROVED—DIRECTION by Game Director | Preserve the Balance & The Quiet Promise approved at consequential level; technical details open | 2026-10-30`. `G1-BS-01 / G1-WR-01 / G1-GP-01 | PROPOSAL for review, NOT APPROVED | 2026-10-30`.

---


---

## D. KEPUTUSAN TERBARU GAME DIRECTOR — VISUAL & WORLD EXPERIENCE / ASSET PLANNING (30 OKTOBER 2026)

**Instruksi eksplisit:** Game Director meminta **seluruh hasil pembahasan terakhir dicatat sebagai final agar menjadi konteks tetap**. Karena itu keputusan berikut adalah **FINAL—PLANNING BASELINE** untuk estimasi dan pengembangan produksi; ini **tidak otomatis** mengesahkan nama geografis, gambar moodboard, mekanisme lore, jumlah sprite aktual, atau desain level sebagai `APPROVED—DETAIL`. Bila ada konflik dengan World Foundation, WF-01 tetap mengikat. Revisi baseline membutuhkan keputusan Game Director berikutnya.

### D1. Target dan struktur produksi — FINAL—PLANNING BASELINE

- **Game:** Atlas of the Lonely World, Game 1; target cerita utama **3–5 jam** (acuan desain sekitar 4 jam), target harga sekitar **US$15**; game harus memuaskan sebagai karya mandiri.
- **Struktur cerita:** **5 act** (Act 0–4), mempertahankan arah CA-01 / NS-01 / SF-01 dan H14/H18 yang sudah disetujui.
- **Perencanaan dunia:** **6 world regions**, **12 gameplay chapters**, kira-kira **18–24 sub-areas**. Ini adalah **baseline perencanaan final**, bukan kewajiban menciptakan 6 biome yang sepenuhnya berbeda atau 24 lukisan unik. Chapter tidak sama dengan act, dan sub-area tidak sama dengan biome.
- **Distribusi kasar:** Act 0 chapter 1 (Nomad Crater Valley); Act 1 chapters 2–3 (Broken Crossing/perbatasan); Act 2 chapters 4–8 (Overgrown Aqueduct, Echoing Ruins, transisi); Act 3 chapters 9–10 (Fracture Approach); Act 4 chapters 11–12 (Continental Spire dan epilog). Pembagian chapter, urutan scene dan menit per chapter **masih dapat disesuaikan setelah playtest**.
- **Arah gameplay:** Okto dikendalikan pemain; Moss adalah **AI companion otonom dengan contextual cooperation**. Game Director menilai arahnya baik; **detail input, abilities, AI dan mekanik belum disetujui sebagai spesifikasi final**. Living Map, eksplorasi, tantangan, hubungan Okto–Moss menjadi pilar pengalaman.

### D2. Enam region sebagai kerangka kebutuhan art — FINAL—PLANNING BASELINE; nama/isi spesifik WORKING

| No | Region (working name) | Kisaran sub-area | Keluarga aset dominan |
|---|---|---:|---|
| 01 | Nomad Crater Valley | 2–3 | Permukiman Nomad, lereng dan tebing, rumput, jalur keluar, perlengkapan hidup |
| 02 | Broken Crossing | 2–3 | Perbatasan, jembatan kuno patah, ceruk pertemuan Moss, akar, jurang, kabut |
| 03 | Overgrown Aqueduct | 3–4 | Viaduct, kanal air, bagian runtuh, teras observasi, pilar, roda mekanis, air terjun, vegetasi |
| 04 | Echoing Ruins | 3–4 | Reruntuhan, ruang observasi, arsitektur kuno, ukiran, mineral, struktur resonansi |
| 05 | Fracture Approach | 3–4 | Tebing patahan, jalur tinggi, struktur penghubung, angin, debu, kabut |
| 06 | Continental Spire | 3–4 | Gerbang, jalur pendakian, ruang regulasi, mekanisme monumental, cahaya atmosferik |

**Catatan angka:** rentang sub-area per region di atas bila dijumlahkan menghasilkan **16–22**, sedangkan target global baseline **±18–24**. Selisih ini adalah ruang perencanaan untuk area transisi/epilog, **bukan daftar area yang sudah dikunci**. Jangan menyatakan angka-angka ini sudah merupakan level list final.

### D3. Prinsip orisinalitas visual — FINAL—DIRECTION

- **Planet of Lana adalah benchmark kualitas rasa hidup, luas, indah, sinematik dan emosional, BUKAN template untuk disalin.** Hindari kemiripan komposisi karakter kecil+companion, urutan biome, siluet, gaya ilustrasi, palet, dan solusi puzzle secara bersamaan.
- **The Living Fracture** dipakai sebagai **working visual direction**; bukan nama lore atau mekanisme geologi yang sudah canon.
- Empat pembeda utama Atlas: **geologi terfragmentasi**, **peradaban berlapis dengan fungsi nyata**, **ekologi/kehidupan ambient yang aktif**, **Cartographer's Gaze** (pemain membaca medan, menemukan jalur, dan membangun Living Map).
- Pilar pendukung: **Geological Grandeur**, **Civilizations in Layers**, **Resonance as a Natural Phenomenon** (efek cahaya cyan tidak berlebihan), **Ecological Continuity**, dan **Cartographer's Gaze**.
- Rasa dunia luas dihasilkan lewat **directed exploration with layered depth**: persistent landmarks, parallax dan kedalaman, area bermain lebih kecil dari dunia yang terlihat, rute bercabang terbatas, environmental callbacks, ambient activity yang efisien, dan konsistensi spasial.
- **Belum canon:** pulau terapung/Resonant Suspension, Sea of Clouds, arsitektur final, palette final, desain makhluk spesifik, sifat teknis resonansi. Semua harus lolos WF-01 dan persetujuan art direction.

### D4. Estimasi inventaris aset — FINAL—BUDGETING REFERENCE (bukan kuota wajib)

| Jenis output | Estimasi awal |
|---|---:|
| Master environment concepts | 6–8 |
| Sub-area concept / keyframes | 18–24 |
| Background / parallax layers | 50–80 |
| Modular terrain & architecture pieces | 80–140 |
| Vegetation & environmental props | 60–100 |
| Interactive objects & puzzle assets | 25–45 |
| Ambient fauna & life elements | 15–25 |
| Weather, lighting & resonance effects | 20–35 |
| **Total kasar** | **274–457 unit/komponen** |

Angka **274–457 bukan jumlah ilustrasi AI unik**; aset modular bisa dipakai ulang, divariasikan dan digabung. Estimasi perlu divalidasi setelah satu sub-area diimplementasikan. Jangan memulai mass-generation sebelum art bible dan uji implementasi.

### D5. Pipeline visual — FINAL—PROCESS DIRECTION

1. **World Visual Diversity Pass terlebih dahulu**: cegah Broken Crossing, Aqueduct, Echoing Ruins, dan Fracture Approach terasa seperti empat variasi batu-reruntuhan-lumut yang sama; uji geografi, ekologi, warna, arsitektur, atmosfer, dan pengalaman eksplorasi.
2. **World Art Bible / VWD-01**: shape language, material, rendering, palet, skala, arsitektur, ekologi, aturan atmosfer, standar layer dan integrasi.
3. **6 master environment concepts**: satu identitas visual yang berbeda untuk setiap region; tetap satu dunia yang koheren.
4. **18–24 sub-area concept/keyframes**: variasi tempat dan fungsi gameplay, tidak semua perlu set aset unik.
5. **Production asset breakdown**: sprite, tile/module, background layer, prop, animasi, VFX, interaktif, reuse matrix.
6. **Vertical slice / VWD-03**: prioritaskan **Overgrown Aqueduct**, uji kamera, parallax, lighting, ambient life, Moss, puzzle dan Living Map, baru kemudian produksi massal.

### D6. Originality review gate — FINAL—PROCESS DIRECTION

Sebelum desain region masuk produksi, review: (1) siluet dan komposisi berbeda dari Planet of Lana; (2) arsitektur punya fungsi dan sejarah; (3) ada membaca medan/menemukan rute; (4) ambient life bukan dekorasi kosong; (5) tantangan gameplay khas Atlas; (6) palet/komposisi tidak terlalu serupa referensi. Checklist ini **review kreatif**, bukan jaminan legal.

### D7. Hubungan dengan canon dan keputusan selanjutnya

- **H14/H18 tetap APPROVED—DIRECTION** dengan konsekuensi ending yang telah ditetapkan; rancangan visual tidak boleh mengubahnya.
- Game 1 harus memberi pengalaman premium yang berdiri sendiri; **Game 2/3 hanya dievaluasi bila perubahan besar berpengaruh terhadap kontinuitas**, tidak menjadi alasan memperluas scope Game 1.
- **Langkah berikutnya:** lakukan World Visual Diversity Pass untuk enam region, lalu susun Art Bible dan master concept. Bentuk visual final tetap menunggu persetujuan Game Director; jangan menganggap contoh gambar yang pernah muncul sebagai aset canon.

**Change log v1.6:** `VWD-BASELINE-01 | Game Director meminta seluruh hasil pembahasan terakhir dijadikan final | FINAL—PLANNING BASELINE / FINAL—PROCESS DIRECTION | 2026-10-30`. `World-specific artwork, names, asset counts and physical lore | WORKING / ESTIMATES / OPEN as specified`.

## C. STATUS SUMBER DAN PERBEDAAN YANG HARUS DIWASPADAI

- **Narrative & World Bible v1.0:** dasar naratif terintegrasi; berisi status per keputusan dan koreksi H16.
- **Stone Cub Character & Companion System v1:** rincian bahasa, ekspresi, companion, prototipe; beberapa klaim `[KANON TERTULIS]` berasal dari blueprint lama dan **tidak otomatis disetujui ulang**. Gunakan label asalnya.
- **Canon v5 / Premis Sequel:** arsip ide awal; nama sekuel, angka level, ending numerik, konsep baterai/segel ketujuh, dan Origin Core sebagai penjara **tidak boleh** diadopsi tanpa keputusan baru.
- **Broken Covenant Proposal v0.6:** kandidat sejarah; sebagian mendapat persetujuan arah/detail lewat H01–H18, tetapi paragraf proposal tidak seluruhnya menjadi canon.
- **Canon Review Log & Review Log v0.7:** jejak audit; bila bertentangan dengan klarifikasi terbaru, ikuti tabel B.

---

# BAGIAN UTAMA — NARRATIVE & WORLD BIBLE v1.0 (TERINTEGRASI)

# PROJECT HORIZON
# NARRATIVE & WORLD BIBLE — v1.0

**Status:** WORKING MASTER BIBLE — PARTIALLY APPROVED, NOT FINAL CANON  
**Tanggal:** 30 Oktober 2026  
**Otoritas keputusan:** Game Director  
**Cakupan:** Dunia, sejarah, konflik, karakter, arsitektur trilogi, aturan naratif, keputusan terbuka.  
**Basis:** Project_Horizon_FINAL_CANON_v5.md; Project_x5f_Horizon_x5f_Premis_x5f_Sequel.md; HORIZON_STONE_CUB_CHARACTER_AND_COMPANION_SYSTEM_v1.md; HORIZON_CANON_REVIEW_DECISION_LOG_2026-10-30.md; The Broken Covenant Decision Proposal v0.6; Review Log v0.7; serta klarifikasi langsung Game Director dalam percakapan.

> **ATURAN PENTING:** Label `APPROVED—DETAIL` menunjukkan keputusan yang telah disetujui secara spesifik. `APPROVED—DIRECTION` hanya menyetujui arah, bukan rincian implementasi. `FOUNDATION` adalah premis yang dipertahankan dari pembahasan. `PROPOSAL` merupakan hipotesis yang belum disetujui. `OPEN` belum memiliki keputusan. Jangan mengubah PROPOSAL menjadi canon dengan mengutip dokumen ini.

---

## 0. RINGKASAN EKSEKUTIF

**Project Horizon** adalah petualangan platformer sinematik atmosferik 2D/2.5D mengenai seorang pemeta muda dari lembah terisolasi yang berangkat mencari dunia di luar peta warisan ayahnya. Dalam perjalanan, ia membangun persahabatan dengan **Stone Cub**, anak Golem kecil yang hidup, mandiri, dan menyimpan jejak masa lalu yang tidak ia pahami. Perjalanan eksplorasi perlahan berubah menjadi tanggung jawab emosional ketika Cub melemah dan tujuan sang pemeta bersinggungan dengan misteri **Continental Spire**.

Dunia yang mereka jelajahi pernah menjadi tempat kerja sama manusia dan Golem. Kedua peradaban kemudian terlibat dalam perang seputar pengelolaan **tujuh Spire**. Konflik tersebut merusak **Origin Core**, fenomena alami dunia, dan menyebabkan kehancuran serta keterpisahan wilayah. Upaya penyelamatan lintas spesies mempertahankan sisa dunia. Komunitas Nomad tempat Cartographer dibesarkan telah terisolasi selama tujuh generasi **sebagai akibat perang dan kehancuran dunia luar**, tetapi tidak mengetahui penyebab sebenarnya.

**Tema kerja:** penemuan versus tanggung jawab; kebebasan versus penjagaan; warisan kesalahan peradaban; hubungan lintas perbedaan; nilai kehidupan individual di tengah kepentingan besar. Tema-tema ini merupakan rumusan editorial, bukan dialog atau dogma cerita yang sudah dikunci.

**Pilar pengalaman:** eksplorasi, tantangan traversal/puzzle, dan perjalanan emosional harus saling menopang. Lingkungan indah, terang, dan dipenuhi jejak peradaban; kesunyian tidak berarti kosong. Cerita terutama disampaikan melalui tindakan, gestur, lingkungan, suara, dan konsekuensi gameplay, bukan eksposisi panjang.

---

## 1. HIERARKI SUMBER DAN KONTROL CANON

1. Keputusan eksplisit terbaru Game Director mengatasi rincian dokumen lama yang bertentangan.
2. Persetujuan **arah** tidak mengesahkan semua penjelasan, nama, tanggal, angka, dan mekanisme dalam proposal.
3. Premis dan identitas karakter yang terus dipertahankan boleh digunakan sebagai `FOUNDATION`, tetapi jangan menganggap seluruh detail Canon v5 tetap final.
4. Rincian `PROPOSAL` disimpan untuk eksplorasi, bukan untuk ditanam permanen ke dialog, cutscene, level, atau kode.
5. Saat sebuah keputusan berubah, catat ID, versi sebelumnya, alasan perubahan, serta dampaknya ke game lain.

### 1.1 Keputusan eksplisit hasil review

| ID | Status | Rumusan yang dapat digunakan |
|---|---|---|
| H01 | APPROVED—DETAIL | Origin Core adalah fenomena alami, bukan ciptaan Golem. |
| H02 | APPROVED—DIRECTION | Spire berkembang dari infrastruktur peradaban menjadi penopang dunia terpecah. |
| H03 | APPROVED—DETAIL | Manusia dan Golem pernah memiliki sejarah panjang saling mempelajari dan bekerja sama. |
| H04 | APPROVED—DIRECTION | Ada perjanjian mengenai akses dan keselamatan penggunaan Spire. |
| H05 | APPROVED—DIRECTION | Aliansi konflik mencampur manusia dan Golem, berdasarkan ideologi, bukan spesies semata. |
| H06 | APPROVED—DIRECTION | Freedom dan Stewardship masing-masing memiliki alasan yang masuk akal serta potensi ekstrem. |
| H07 | APPROVED—DIRECTION | Arah eskalasi W2 → W3 → W1 diterima; peristiwa, pelaku, dan detail belum dikunci. |
| H08 | APPROVED—DIRECTION | Perang mengakibatkan gangguan resonansi berantai yang merusak Origin Core. |
| H09 | APPROVED—DIRECTION | Perang memecah dunia; penyelamatan mempertahankan/stabilkan pecahan tersisa. |
| H10 | APPROVED—DIRECTION | The Last Separation adalah upaya penyelamatan lintas spesies. |
| H11 | APPROVED—DIRECTION | Ibu Cub adalah salah satu ahli/kolaborator dalam penyelamatan, bukan penyelamat tunggal. |
| H12 | APPROVED—DETAIL | Resonance Imprint terbentuk secara tidak sengaja ketika Cub diselamatkan; bukan pengorbanan sengaja. |
| H13 | APPROVED—DETAIL | Cub bertahan melalui dormansi dan memiliki ingatan terfragmentasi. |
| H14 | OPEN | Penyebab sakit Cub, interaksi dengan Spire, dan akibat mekanis belum diputuskan. |
| H15 | APPROVED—DIRECTION | Kelangsungan manusia dan kemunduran Golem memiliki lebih dari satu penyebab; detail terbuka. |
| H16 | CLARIFIED BY DIRECTOR | Tujuh generasi isolasi Nomad **disebabkan dampak perang/kehancuran dunia luar**; masyarakat Nomad tidak mengetahui penyebab sebenarnya. Detail kronologi mutlak masih perlu dipastikan. |
| H17 | APPROVED—DIRECTION | Pengungkapan sejarah disebar sepanjang trilogi; jadwal reveal belum final. |
| H18 | OPEN | Konsekuensi spesifik dua ending Game 1 belum diputuskan. Arah ending berdampak nyata sebelumnya disetujui. |

**Catatan H16:** H16 awalnya berstatus REVISE karena proposal v0.6 menyebut isolasi sebagai peristiwa terpisah. Klarifikasi langsung Game Director mengganti asumsi itu. Hubungan kausal kini jelas; **belum otomatis membuktikan bahwa perang terjadi tepat tujuh generasi lalu**. Tanggal perang, durasi kehancuran, dan titik mulai hitungan generasi masih perlu diselaraskan.

---

## 2. VISI NARATIF DAN PRINSIP PENGALAMAN

### 2.1 Janji kepada pemain

- **Eksplorasi:** menemukan wilayah, panorama, reruntuhan, dan petunjuk dunia yang belum diketahui Cartographer.
- **Tantangan:** memanjat, melintasi bahaya alam, memecahkan hambatan lingkungan, dan memanfaatkan kerja sama dengan Cub tanpa memperlakukannya sebagai perkakas.
- **Emosi:** perubahan hubungan dari pertemuan canggung menjadi kepercayaan, perhatian, dan keputusan sulit yang memiliki akibat.

Tidak satu pilar boleh meniadakan dua lainnya: lore tidak boleh menghentikan permainan, traversal tidak boleh menghapus kedekatan karakter, dan drama tidak boleh muncul hanya lewat cutscene.

### 2.2 Gaya penyampaian

`FOUNDATION`: storytelling nonverbal/minim dialog; gestur, ritme langkah, tatapan, cahaya, suara resonansi, tindakan spontan, dan respons lingkungan. Pemain mengetahui dunia lewat perjalanan bersama karakter, bukan narator serbatahu.

### 2.3 Aturan etis untuk karakter

- Cub adalah subjek yang memiliki kehendak, rasa takut, rasa ingin tahu, dan kemampuan memilih; **bukan baterai hidup**.
- Ibu Cub berusaha menyelamatkan anaknya; ia **tidak merancang pengorbanan anak sebagai komponen Spire**.
- Manusia dan Golem sama-sama mempunyai kapasitas untuk bekerja sama, bersalah, menolong, dan berubah.
- Konflik Freedom/Stewardship tidak boleh menjadi alegori satu spesies baik versus spesies lain jahat.
- Keputusan Cartographer harus lahir dari pengetahuan dan hubungan yang dibangun pemain, bukan twist mendadak yang meniadakan agensi.

---

## 3. KOSMOLOGI DAN ATURAN DUNIA

### 3.1 Origin Core

`APPROVED—DETAIL H01`: fenomena **alami** dunia; bukan mesin yang diciptakan Golem. Peradaban Golem dapat mempelajari dan memodifikasi interaksi dengannya, tetapi tidak menciptakan sumbernya.

`APPROVED—DIRECTION H08`: perang mengganggu resonansi dan merusak Core melalui efek berantai.

`OPEN`: bentuk fisik Core; apakah pusat geologis, medan, struktur kristalin, atau fenomena lain; batas energi; cara resonansi memengaruhi gravitasi/materi; penyebab persis kerusakan.

**Batas desain:** jangan menyebut Core sebagai penjara entitas jahat atau mesin pembuat dunia sebagai fakta. Ide 'segel ancaman purba' pada Canon v5 adalah **legacy concept yang tidak otomatis berlaku**.

### 3.2 Tujuh Spire

`FOUNDATION`: jumlah tujuh; keberadaan Continental Spire sebagai tujuan Game 1.

`APPROVED—DIRECTION H02`: awalnya jaringan yang mendukung perkembangan dan konektivitas peradaban, kemudian berfungsi mempertahankan dunia setelah kehancuran.

`PROPOSAL`: jaringan hibrida dengan tiga fungsi—pengaturan resonansi, konektivitas wilayah, dan stabilisasi struktural. Urutan pembangunan, pembagian fungsi tiap Spire, mode darurat, serta perawatan belum ditetapkan.

`OPEN`: mengapa tepat tujuh; lokasi; apakah semua masih beroperasi; konsekuensi kegagalan satu Spire; cara bertahan selama banyak generasi tanpa pemeliharaan; apa yang dapat dilakukan manusia pada sistem.

### 3.3 Fraktur dunia dan Sea of Clouds

`APPROVED—DIRECTION H09`: perang memicu pemisahan/kehancuran; penyelamatan menstabilkan pecahan, bukan sengaja menghancurkan dunia sebagai solusi awal.

`FOUNDATION / VISUAL DIRECTION`: dunia memiliki wilayah terpisah, daratan melayang, lanskap vertikal, dan potensi Sea of Clouds untuk sekuel.

`OPEN`: mekanisme mengambang; batas medan; apakah awan adalah atmosfer biasa atau fenomena khusus; jarak antardaratan; kondisi wilayah yang jatuh; peran tiap Spire pada stabilitas.

**Uji konsistensi:** jika Spire semula tidak wajib bagi keseimbangan alam, mengapa setelah perang menjadi wajib? Jawaban arah: perubahan permanen pada Core/dunia menyebabkan ketergantungan baru. Fisika rinci belum disetujui.

---

## 4. SEJARAH PERADABAN — GARIS BESAR

> Berikut adalah **kerangka kronologis kerja**. Hanya peristiwa yang memiliki ID persetujuan yang boleh dianggap diterima pada tingkat persetujuannya.

### Era A — Before Humanity / Age of Resonance

`FOUNDATION`: Golem mendahului manusia.

`PROPOSAL`: mereka mempelajari fenomena Origin Core, mengembangkan teknologi resonansi, dan secara bertahap membangun Spire. Detail kemunculan Golem, bentuk masyarakat, dan usia peradaban belum final.

### Era B — Age of Accord

`APPROVED—DETAIL H03`: manusia dan Golem hidup berdampingan cukup lama untuk saling mempelajari dan bekerja sama.

`APPROVED—DIRECTION H04`: ada kerangka perjanjian pengelolaan akses dan keselamatan Spire.

`PROPOSAL`: permukiman campuran, riset bersama, pertukaran teknologi, jalur dagang, monumen kerja sama. Nama **The Covenant** dan **Age of Accord** bersifat sementara.

### Era C — Ideological Fracture

`APPROVED—DIRECTION H05/H06`: konflik berkisar pada **Freedom vs Stewardship**, dengan anggota manusia maupun Golem di kedua kubu.

**Freedom:** hak akses yang adil, transparansi, dan penolakan monopoli. Risiko ekstrem: eksperimen paksa atau pengabaian keselamatan.

**Stewardship:** pengawasan risiko dan perlindungan stabilitas jangka panjang. Risiko ekstrem: pembatasan sewenang-wenang, dominasi penjaga, dan kekerasan atas nama keamanan.

`PROPOSAL`: kubu bukan dua organisasi tunggal. Ada moderat, reformis, oportunis, dan ekstremis; relasi personal lintas kubu tetap mungkin.

### Era D — Escalation and War

`APPROVED—DIRECTION H07`: arah eskalasi **W2 → W3 → W1**:

- **W2 / Unauthorized Opening (PROPOSAL):** aktivasi fungsi Spire tanpa persetujuan penuh menghasilkan manfaat nyata dan kerusakan pada pihak lain.
- **W3 / Emergency Decree (PROPOSAL):** pembatasan darurat terlalu luas memicu penolakan dan konflik.
- **W1 / Broken Assembly (PROPOSAL):** negosiasi penting gagal di tengah insiden mematikan, mempercepat perang terbuka.

Urutan ini **arah**, bukan rangkaian kejadian historis yang sudah dipastikan. Nama, korban, pelaku, alasan, durasi, serta apakah ada sabotase tetap terbuka.

`APPROVED—DIRECTION H08/H09`: perang merusak Core melalui gangguan resonansi berantai, menimbulkan keretakan dunia.

### Era E — The Last Separation

`APPROVED—DIRECTION H10`: operasi penyelamatan manusia–Golem.

`APPROVED—DIRECTION H11`: ibu Cub adalah salah satu ahli dan kolaborator, bukan satu-satunya penyelamat.

`PROPOSAL`: kelompok stabilisasi, komunikasi, dan evakuasi bekerja bersama; Spire diubah menjadi mode penopang. Nasib tim, operasi tepat, serta kontribusi individu belum ditentukan.

### Era F — Aftermath / Age of Silence

`APPROVED—DIRECTION H15`: banyak faktor memengaruhi kelangsungan manusia dan kemunduran peradaban Golem.

`PROPOSAL`: kerusakan pusat peradaban, ketergantungan berbeda pada resonansi, keterpisahan geografis, dan hilangnya pengetahuan berkontribusi bersama.

`OPEN`: apakah Golem punah, tersembunyi, dorman, atau bertahan di wilayah lain; apa yang diingat masyarakat manusia di berbagai wilayah.

### Era G — Seven Generations of Isolation

`DIRECTOR CLARIFICATION H16`: komunitas Nomad Cartographer terisolasi selama **tujuh generasi akibat dampak perang dan kehancuran dunia luar**. Mereka **tidak mengetahui** penyebab sebenarnya dan tidak menyadari keadaan dunia di luar lembah.

`OPEN`: apakah tujuh generasi dimulai saat perang, saat wilayah lembah terputus, atau setelah fase kehancuran; bagaimana pengetahuan hilang; apakah generasi pertama mengetahui sebagian kebenaran; apa yang membuat jalan keluar bisa ditempuh Cartographer sekarang.

**Larangan:** jangan menambahkan bencana lokal independen sebagai penyebab utama isolasi. Usulan tersebut telah direvisi oleh Game Director.

---

## 5. MASYARAKAT, KEBUDAYAAN, DAN ARKEOLOGI

### 5.1 Manusia

`FOUNDATION`: manusia memiliki peradaban dan sejarah bersama Golem; komunitas Nomad adalah salah satu kelompok penyintas, bukan representasi seluruh umat manusia.

`OPEN`: sistem politik, bahasa, lokasi komunitas lain, akses teknologi, rentang waktu perang, dan cara tradisi berubah menjadi legenda.

### 5.2 Golem

`FOUNDATION`: Golem merupakan makhluk sadar, bukan sekadar konstruksi. Stone Cub memiliki ibu dan merupakan individu.

`OPEN`: reproduksi/kelahiran Golem, usia alami, jenis tubuh, sumber kehidupan, kebutuhan resonansi, hubungan Golem hidup dengan patung/mesin raksasa, dan dampak kerusakan Core terhadap spesies.

### 5.3 Bukti visual kerja sama dan perang

`PROPOSAL` untuk environmental storytelling: ruang yang dibuat untuk dua skala tubuh, mural manusia–Golem bekerja bersama, alat gabungan, jembatan atau observatorium bersama, serta monumen perang yang menimpa simbol persahabatan lama.

**Aturan:** artefak harus masuk akal sebagai hasil budaya, bukan hanya dekorasi untuk menjelaskan lore kepada pemain. Satu objek dapat memiliki makna praktis, historis, dan emosional sekaligus.

---

## 6. KARAKTER UTAMA

### 6.1 The Cartographer

`FOUNDATION`: pemeta/penjelajah muda dari komunitas Nomad yang terisolasi tujuh generasi. Membawa peta tidak lengkap warisan ayah; memiliki dorongan menemukan dan memetakan dunia. Perjalanannya berubah setelah ia membangun ikatan dengan Cub.

`LEGACY VISUAL PROPOSAL`: usia 19–22, jubah kebesaran, hood, perlengkapan panjat, penanda panorama/bendera. Rincian usia, warna, dan kostum tidak ditetapkan ulang sebagai canon baru di sini.

**Arc yang dijaga:** dari menganggap penemuan sebagai pencapaian personal menuju kesadaran bahwa eksplorasi membawa tanggung jawab terhadap makhluk hidup lain.

`OPEN`: latar ayah, alasan peta terputus, alasan pribadi keluar lembah, identitas/namanya, pilihan yang dapat dilakukan pemain, serta akhir hubungan dengan Cub.

### 6.2 Stone Cub

`FOUNDATION`: Golem kecil (~60 cm pada desain awal), tubuh batu berlumut, ekspresi melalui cahaya dan gestur, topeng retak, sifat penasaran dan rentan, takut ketinggian, kemampuan memilih dan menolak. Persahabatan dengan Cartographer berkembang melalui interaksi nonverbal. Scarf berasal dari sobekan jubah Cartographer sebagai tindakan perhatian.

`APPROVED—DETAIL H13`: berasal dari zaman kuno, bertahan lewat dormansi, mengingat masa lalu secara terfragmentasi.

`APPROVED—DETAIL H12`: ketika diselamatkan, Cub secara tidak sengaja memperoleh **Resonance Imprint**. Jejak itu **bukan** bukti bahwa Cub diciptakan sebagai baterai atau segel ketujuh.

**Batas memori yang diusulkan (PROPOSAL):** fragmen emosional (aman/takut), sensorik (bunyi/cahaya/tempat), dan peristiwa (potongan sejarah). Jangan memberi Cub amnesia yang sembuh tepat saat plot butuh penjelasan.

`OPEN H14`: pemicu sakit, hubungan teknis dengan Spire, kemampuan Imprint, dan kemungkinan penyembuhan.

### 6.3 Ibu Stone Cub

`FOUNDATION`: ibu yang berusaha melindungi anaknya, tidak sengaja menjadikannya korban atau komponen mesin.

`APPROVED—DIRECTION H11`: ahli/kolaborator dalam operasi penyelamatan, berbagi tanggung jawab dengan pihak lain.

`PROPOSAL`: pernah terlibat dalam riset lintas spesies, menyaksikan runtuhnya kerja sama, lalu berusaha menyelamatkan dunia dan Cub.

`OPEN`: nama, profesi spesifik, hubungan dengan manusia tertentu, keputusan moral, keberadaan saat Cub tertidur, dan nasib akhir.

### 6.4 Karakter historis dan faksi

`PROPOSAL`: para pemimpin Freedom, penjaga Stewardship, mediator lintas spesies, serta teknisi tim penyelamatan. Tidak ada nama tokoh atau organisasi baru yang dikunci. Kembangkan hanya setelah pemicu perang disetujui secara rinci.

---

## 7. HUBUNGAN CARTOGRAPHER–CUB DAN GAMEPLAY

### 7.1 Arc emosional kerja

1. **Pertemuan:** rasa asing, kehati-hatian, tindakan perhatian kecil (scarf).
2. **Belajar:** salah paham, komunikasi melalui gestur/ketukan, rasa ingin tahu timbal balik.
3. **Kepercayaan:** saling membantu mengatasi hambatan; Cub sesekali membuat keputusan sendiri.
4. **Kerentanan:** kondisi Cub berubah; Cartographer harus memperhatikan bukan hanya memanfaatkan kemampuan companion.
5. **Pilihan:** konflik antara tujuan eksplorasi dan tanggung jawab personal mencapai puncak di Continental Spire.

Urutan umum ini adalah rancangan naratif; waktu tepat tiap adegan dan mekanik belum dikunci.

### 7.2 Prinsip companion

- Cub boleh membantu puzzle tetapi bukan 'kunci hidup' yang hanya bergerak ketika diperintah.
- Komunikasi berkembang: pemain mempelajari bahasa gerak Cub, dan Cub mempelajari isyarat Cartographer.
- Sifat takut, penasaran, dan lelah harus menghasilkan perilaku yang dapat dipahami pemain.
- Jangan mengubah penyakit menjadi penalti stamina terus-menerus tanpa pilihan dan variasi; itu berisiko membuat pemain membenci Cub.
- Adegan emosional harus punya akibat pada tindakan, animasi, atau keputusan pemain.

### 7.3 Scarf

`FOUNDATION`: kain yang diberikan Cartographer kepada Cub menjadi simbol perhatian dan ikatan. `OPEN`: warna pasti, motif, apakah pernah rusak/hilang, dan komposisi adegan ending. **Jangan memberi scarf kekuatan magis tanpa persetujuan baru.**

---

## 8. GAME 1 — THE EDGE OF THE WORLD

**Judul kerja:** The Edge of the World.  
**Bentuk:** cinematic atmospheric platformer 2D/2.5D; penjelajahan vertikal, environmental puzzles, traversal, panorama, dan narasi minim dialog.

### 8.1 Premis

Cartographer meninggalkan lembah Nomad untuk mengisi peta yang diwariskan ayahnya. Ia menemukan dunia luas yang indah tetapi dipenuhi reruntuhan peradaban dan jejak kehancuran. Dalam perjalanan, ia berteman dengan Stone Cub. Tujuan menuju Continental Spire menjadi semakin rumit ketika kondisi Cub memburuk.

### 8.2 Struktur naratif kerja (TIDAK LOCKED)

| Babak | Fungsi pengalaman | Status |
|---|---|---|
| Act 0 — Lembah | Memperkenalkan isolasi, impian pemetaan, dasar traversal | PROPOSAL |
| Act 1 — Dunia luar | Kekaguman, bahaya, pertemuan Cub, scarf | PROPOSAL |
| Act 2 — Reruntuhan | Kerja sama, bukti sejarah manusia–Golem, puzzle | PROPOSAL |
| Act 3 — Pendakian | Tantangan meningkat, Cub melemah, ketegangan hubungan | PROPOSAL |
| Act 4 — Continental Spire | Penemuan panorama, pilihan emosional, konsekuensi | PROPOSAL |

Versi lama memiliki urutan level, durasi demo, dan jumlah level yang tidak sepenuhnya konsisten. Tidak ada angka final yang ditetapkan dalam Bible ini.

### 8.3 Ending

`APPROVED—DIRECTION dari review terdahulu`: dua arah ending **Conqueror** dan **Protector/Companion** memiliki akibat nyata pada Cub dan keadaan dunia.

`OPEN H18`: apa tindakan pemain di Spire; informasi apa yang diketahui saat memilih; apakah Cub mati, bertahan, berubah, atau berpisah; apakah peta selesai; perubahan dunia; cara kedua ending mengarah ke Game 2.

**Tidak disahkan dari Canon v5:** Cub pasti pecah menjadi baterai, scarf pasti tertinggal di altar, 100% vs 85% peta, kompas pasti dihancurkan, atau aktivasi Spire pasti membebaskan ancaman kuno.

### 8.4 Pengungkapan sejarah

`APPROVED—DIRECTION H17`: Game 1 memperlihatkan **jejak** kerja sama dan perang, bukan seluruh penjelasan sejarah. Game 1 tetap harus memiliki kepuasan emosional tersendiri, bukan hanya prolog untuk sekuel.

---

## 9. GAME 2 DAN GAME 3 — ARAH FRANCHISE

### 9.1 Game 2

`FOUNDATION / EXPLORATION`: memperluas skala dari benua menuju wilayah terpisah, daratan melayang, dan Sea of Clouds; mengungkap lebih banyak tentang Spire, sejarah dua spesies, dan keadaan dunia.

`OPEN`: judul final, kendaraan, lokasi, kondisi Cub berdasarkan ending Game 1, sistem percabangan, dan peran manusia/Golem yang masih hidup.

### 9.2 Game 3

`EXPLORATION`: mempertemukan konflik peradaban, Origin Core, dan keputusan tentang masa depan dunia.

`OPEN`: apakah Core dapat dipulihkan, apakah dunia disatukan, harga yang harus dibayar, bentuk akhir hubungan kedua spesies, dan akhir Cartographer/Cub.

**Larangan:** jangan mengunci premis lama bahwa Core adalah penjara ancaman kosmik, semua Golem harus mati untuk menyatukan dunia, atau semua jalur harus kembali ke satu ending tertentu.

---

## 10. NARRATIVE REVEAL & MYSTERY MANAGEMENT

| Pertanyaan pemain | Game 1 (arah) | Game 2 (arah) | Game 3 (arah) |
|---|---|---|---|
| Mengapa dunia dipenuhi reruntuhan? | Petunjuk visual | Sejarah konflik | Konsekuensi akhir |
| Apakah manusia dan Golem pernah bersahabat? | Bukti samar | Penjelasan lebih lengkap | Makna bagi masa depan |
| Apa fungsi Spire? | Terasa penting dan berbahaya | Mekanisme jaringan | Keputusan terhadap sistem |
| Siapa ibu Cub? | Jejak personal | Pengungkapan sejarah | Resolusi bila relevan |
| Apa yang terjadi pada Cub? | Gejala dan dilema | Penyelidikan | Konsekuensi jangka panjang |
| Mengapa Nomad terisolasi? | Pertanyaan awal | Hubungan dengan perang terungkap | Makna sejarah bagi dunia kini |

**Semua jadwal reveal masih PROPOSAL**. Jangan memberi tahu pemain seluruh latar konflik sebelum ikatan dengan Cub terbentuk.

---

## 11. DAFTAR KONFLIK, DEPENDENSI, DAN KEPUTUSAN TERBUKA

### PRIORITAS P0 — Harus selesai sebelum lore final dan klimaks dikunci

**P0-A / Physics of Fracture (H02, H08, H09)**  
Apa aturan resonansi, batas kegagalan, sebab daratan terpecah, mekanisme mengambang, dan biaya pemeliharaan Spire? Harus kompatibel dengan geografi dan traversal.

**P0-B / Cub–Spire–Illness (H12, H13, H14)**  
Mengapa Imprint terbentuk, apa dampak terbatasnya, mengapa Cub sakit saat perjalanan, apa peran kedekatan dengan Spire, dan bagaimana memastikan Cub tetap agen independen?

**P0-C / Game 1 Endings (H18)**  
Apa tepatnya pilihan, informasi pemain, tindakan dan konsekuensi pada Cub/dunia, serta bagaimana kedua jalur dapat diteruskan secara masuk akal?

**P0-D / Nomad Chronology (H16)**  
Tujuh generasi merupakan akibat perang; tentukan hubungan waktunya tanpa menciptakan penyebab isolasi terpisah. Jelaskan mengapa pengetahuan hilang dan mengapa Cartographer dapat keluar sekarang.

### PRIORITAS P1 — Harus selesai sebelum sejarah lengkap disahkan

**P1-A / War Escalation (H04–H07):** tokoh/faksi, bukti risiko, keluhan akses, titik kegagalan kompromi, urutan W2/W3/W1, pelaku dan tanggung jawab.  
**P1-B / Last Separation (H10–H12):** peran manusia, Golem, ibu Cub, tindakan penyelamatan, biaya dan korban.  
**P1-C / Survival and Memory (H15):** nasib Golem, persebaran manusia, jejak pengetahuan, komunitas lain.  
**P1-D / Seven Spires:** lokasi, karakter masing-masing, sistem koneksi, alasan jumlah tujuh.

### PRIORITAS P2 — Dapat diputuskan saat perancangan produksi

Nama era/faksi/tokoh, bahasa, simbol, kalender, struktur politik, desain arsitektur, detail kostum, daftar level, durasi, kendaraan, konten collectible, urutan cutscene, dan pilihan kamera.

---

## 12. CONTRADICTION REGISTER — LEGACY v5 VS ARAH TERBARU

| Klaim lama | Status dalam Bible v1.0 | Alasan |
|---|---|---|
| Cub adalah baterai/segel ketujuh | SUPERSEDED / JANGAN DIANGGAP CANON | Cub individu hidup; H12 Imprint tidak sengaja; hubungan mekanis H14 terbuka |
| Perang semata-mata perang antarfaksi Golem | SUPERSEDED | Game Director menegaskan konflik manusia–Golem dengan aliansi campuran |
| Core menyegel entitas purba | UNAPPROVED LEGACY | Core natural H01; fungsi sebagai penjara belum disetujui |
| Dunia sengaja dipecah untuk mengunci ancaman | UNAPPROVED LEGACY | H09 arah: perang menyebabkan fraktur, penyelamatan menstabilkan |
| Cub pasti mati jika dipakai mengaktifkan Spire | OPEN | H18 belum ditentukan |
| Nomad terisolasi karena bencana lokal terpisah | REJECTED AS PRIMARY CAUSE | H16 diklarifikasi: dampak perang dan kehancuran luar |
| Tujuh generasi = umur perang yang pasti | NOT ESTABLISHED | Hubungan kausal ada; hitungan waktu belum dipastikan |
| 100% map vs 85% map sebagai ending pasti | OPEN | Rincian ending belum dikunci |
| Jadwal Act 0–4 persis seperti blueprint lama | OPEN | Struktur babak sebelumnya masih eksplorasi |

---

## 13. PANDUAN PENGGUNAAN UNTUK TIM AI / PENULIS / DEVELOPER

**Untuk penulis:** boleh menyusun adegan dari `FOUNDATION` dan keputusan yang disetujui; beri label `PROPOSAL` pada detail baru. Jangan membuat dialog eksposisi yang menyatakan mekanisme terbuka sebagai fakta.

**Untuk game designer:** prototipe traversal, companionship, dan atmosfer boleh berjalan; jangan mengunci puzzle atau sistem stamina yang bergantung pada Cub sebagai sumber energi Spire.

**Untuk environment artist:** visual reruntuhan, kolaborasi manusia–Golem, lanskap terang dan jejak perang boleh dikembangkan; bedakan konsep visual dari sejarah final.

**Untuk lore researcher / narrative QA:** cek semua ide terhadap H01–H18, koreksi H16, dan daftar kontradiksi. Setiap usulan baru harus menyebut ID dependensi.

**Untuk producer:** dokumen ini boleh menjadi single source of truth **untuk status keputusan**, bukan berarti semua paragrafnya adalah canon final.

### Template perubahan

```
Decision ID:
Versi sebelumnya:
Status sebelumnya:
Usulan baru:
Status persetujuan Game Director:
Alasan:
Dampak ke Game 1:
Dampak ke Game 2/3:
Dampak gameplay/art/level:
Tanggal:
```

---

## 14. NEXT DECISION GATES

**Gate 1 — Mekanisme dunia:** pilih model resonansi dan hubungan Core–Spire–daratan yang konsisten.  
**Gate 2 — Kronologi:** tentukan titik perang, The Last Separation, awal tujuh generasi Nomad, dan dormansi Cub.  
**Gate 3 — Hubungan Cub:** uji sebab sakit dan pilihan di Spire tanpa menjadikannya baterai.  
**Gate 4 — Perang dan penyelamatan:** kunci pelaku, insiden pemicu, kontribusi kedua spesies, serta peran ibu Cub.  
**Gate 5 — Ending dan trilogi:** pastikan konsekuensi dua ending dapat diikuti pada sekuel.  
**Gate 6 — Final Canon Review:** Game Director menyetujui perubahan per ID; baru terbitkan `FINAL`.

---

## 15. CHANGELOG

**v1.0 — 2026-10-30**
- Menggabungkan premis dan identitas karakter dari dokumen awal dengan keputusan eksplisit terbaru.
- Mengadopsi review H01–H18 sesuai tingkat persetujuan masing-masing.
- Mengintegrasikan koreksi H16: isolasi tujuh generasi Nomad merupakan dampak perang, bukan bencana independen.
- Menandai lore lama 'Cub sebagai baterai', 'Core sebagai penjara', dan angka ending pasti sebagai belum berlaku.
- Memisahkan sejarah yang disetujui, hipotesis, dan keputusan terbuka untuk pengembangan berikutnya.

**Status akhir:** DOKUMEN KERJA UTAMA — BELUM FINAL CANON. Tidak ada keputusan terbuka yang dikunci hanya karena dimasukkan ke dalam Bible ini.

---

# LAMPIRAN A — STONE CUB: KARAKTER, KOMUNIKASI, DAN SISTEM COMPANION

> **Status lampiran:** Diambil dari dokumen karakter v1 untuk menjaga detail implementasi dan arah emosional. Label `[KANON TERTULIS]` di lampiran berarti tercatat di blueprint lama, **bukan** persetujuan baru. Semua konflik dengan Decision Register bagian B atau Bible utama tunduk pada bagian B. Contoh implementasi Godot adalah **usulan**, bukan persyaratan canon.

# PROJECT HORIZON
# STONE CUB — CHARACTER CANON & COMPANION SYSTEM
**Versi:** 1.0 — Consolidation Draft  
**Tanggal:** 30 Oktober 2026  
**Status:** Dokumen kerja untuk persetujuan Game Director; **bukan seluruhnya canon final**  
**Penggunaan:** Konteks naratif, art direction, animasi, audio, AI companion, dan implementasi Godot/Codex.

> **Aturan otoritas:** [TERKUNCI] = secara eksplisit disepakati dalam percakapan; [KANON TERTULIS] = tercatat pada file Canon v5; [USULAN] = spesifikasi implementasi yang perlu diuji; [BELUM FINAL] = belum diselesaikan atau terdapat konflik sumber. Jangan menganggap [USULAN] sebagai fakta dunia.

## 1. Identitas dan fungsi naratif

**Nama:** Stone Cub / The Moss Golem.  
**Peran:** Companion utama The Cartographer; pusat hubungan emosional dan dilema antara menyelesaikan peta dunia atau melindungi sahabatnya.  
**Tema hubungan:** Dari dua makhluk asing yang tidak saling memahami menuju dua sahabat yang belajar memahami tanpa kata-kata.

- [KANON TERTULIS] Golem batu lumut kecil setinggi kira-kira 60 cm, bentuk tidak simetris, mata bercahaya cyan, topeng kayu tribal retak, lumut di punggung, dan scarf dari sobekan jubah Cartographer.
- [KANON TERTULIS] Penasaran, gemar mengoleksi benda kecil, lugu, protektif, dan takut pada ketinggian.
- [TERKUNCI] Stone Cub bukan pet, robot patuh, atau alat puzzle. Ia memiliki kesadaran, kehendak, ketakutan, dan cara memahami dunia yang berbeda dari manusia.
- [TERKUNCI] Hubungan berkembang melalui observasi, tindakan bersama, kesalahpahaman kecil, dan rasa saling percaya.
- [BELUM FINAL] Istilah “mental balita 3 tahun” dalam Canon v5 merupakan analogi karakterisasi; jangan diterjemahkan sebagai pembatasan kecerdasan spesies Golem.

## 2. Bahasa dan komunikasi — keputusan percakapan

### 2.1 Bahasa manusia
- [TERKUNCI] Stone Cub **tidak memahami bahasa manusia pada awal Game 1**.
- [TERKUNCI] Ia belajar membaca maksud Cartographer lewat gerakan, ritme langkah, tindakan berulang, ekspresi fisik, arah perhatian, dan pengalaman bersama; bukan tiba-tiba mengerti kosakata.
- [TERKUNCI] Cartographer juga secara bertahap belajar memahami Stone Cub; proses belajar **dua arah**.
- [TERKUNCI] Game 1 mengutamakan storytelling nonverbal. Cartographer dapat bernapas, tertawa kecil, bergumam sesekali, atau berteriak spontan ketika kesulitan. Ekspresi emosional jarang tetapi respons fisik tetap natural.
- [TERKUNCI] Dunia manusia tetap memiliki bahasa; pilihan tanpa dialog yang terdengar jelas **bukan** berarti manusia tidak bisa berbicara.

### 2.2 Bahasa Golem
- [TERKUNCI] Peradaban Golem memiliki sistem komunikasi resonansi yang lebih kaya/kompleks.
- [TERKUNCI] Stone Cub hanya mengenal bentuk dasar atau fragmen bahasa itu akibat keterputusan masa kecilnya.
- [TERKUNCI] Stone Cub dapat berekspresi melalui gestur, ketukan batu, resonansi suara, intensitas cahaya, dan postur.
- [TERKUNCI] Hindari pemetaan satu warna = satu emosi seperti UI status. Makna harus terbaca melalui kombinasi tanda dan konteks.
- [BELUM FINAL] Tata bahasa resonansi, pola fonetik/ritmis, cara pewarisan bahasa, dan apakah resonansi juga dapat mengaktifkan artefak belum ditentukan.
- [USULAN] Bila resonansi dipakai dalam puzzle, buat hubungan sebab-akibat yang bisa diamati; jangan menjadikannya kekuatan magis universal.

### 2.3 Prinsip desain
**Pemain boleh belum memahami sejarah dunia, tetapi harus bisa membaca keadaan emosional Stone Cub.** Kesalahpahaman digunakan untuk cerita, bukan membuat companion gagal terus dalam platforming.

## 3. Bahasa tubuh, suara, dan ekspresi

| Keadaan | Arah ekspresi yang dibahas | Status |
|---|---|---|
| Penasaran | Mendekat, memiringkan kepala, mengetuk objek pelan | [TERKUNCI — arah] |
| Takut | Tubuh merapat, cahaya melemah, ketukan tidak teratur, mundur | [TERKUNCI — arah] |
| Nyaman | Gerak lebih santai, cahaya stabil, berani mendekat | [TERKUNCI — arah] |
| Bermain | Mengamati/mengumpulkan benda kecil, aktivitas spontan | [KANON TERTULIS] |
| Memercayai Cartographer | Jarak mendekat, mulai mengikuti setelah scarf | [KANON TERTULIS] |
| Melemah | Berkurangnya aktivitas, respons melambat, batuk cahaya biru | [KANON TERTULIS + TERKUNCI — arah] |
| Menolak/khawatir | Berhenti, menarik diri atau mencoba mengalihkan Cartographer | [USULAN — contoh adegan] |

**Audio:** Suara ketukan, gesekan batu, dan resonansi perlu mempunyai identitas konsisten; hindari dialog manusia yang diucapkan oleh Cub. Detail sound palette, frekuensi, dan desain sintetis belum final.

## 4. Scarf Origin — adegan identitas karakter

- [KANON TERTULIS] Cartographer menemukan Cub yang kedinginan/lemah.
- [KANON TERTULIS] Cartographer merobek ujung jubahnya dan membuat scarf kecil.
- [KANON TERTULIS] Cub menerima kehangatan, satu bunga putih tumbuh di lumutnya, dan cahaya berubah menjadi kuning hangat.
- [KANON TERTULIS] Setelahnya Cub mulai mengikuti Cartographer; salah satu versi sumber menyebut jarak sekitar dua meter.
- [TERKUNCI] Ini titik awal relasi, bukan perintah “rekrut companion” yang mekanis.
- [BELUM FINAL] Penempatan persis adegan berbeda antardokumen v5: salah satu menaruh pertemuan di The Throat/Lonely Shrine, sedangkan blueprint lain di Giant Moss Forest (Act 1). **Jangan pilih lokasi final tanpa persetujuan.**

## 5. Perkembangan emosional dan gameplay sepanjang Game 1

| Fase | Peran Stone Cub | Pengalaman yang dituju | Status |
|---|---|---|---|
| Pertemuan | Asing, takut, tidak memahami Cartographer | Rasa ingin melindungi tanpa eksposisi | [TERKUNCI] |
| Awal perjalanan | Penasaran, lucu, kadang ceroboh; mulai mengikuti | Pemain membangun keterikatan | [KANON TERTULIS + TERKUNCI] |
| Eksplorasi bersama | Membantu secara kontekstual, bukan selalu patuh | Saling percaya dan saling belajar | [KANON TERTULIS + TERKUNCI] |
| Mendekati Spire | Mulai lemah, lebih diam, bantuan berubah menjadi kebutuhan dirawat | Perubahan rasa dari teman bermain ke tanggung jawab | [KANON TERTULIS + TERKUNCI] |
| Klimaks | Nasib Cub berhubungan dengan dilema moral Cartographer | Collector vs Protector | [KANON TERTULIS] |

**Catatan konflik:** Canon v5 yang berbeda memuat rincian act, durasi, dan gejala penyakit yang tidak sepenuhnya sama. Gunakan perkembangan **relatif** di atas sampai blueprint act terbaru disahkan. Angka drain stamina/berat bukan spesifikasi final yang boleh langsung dikodekan.

## 6. Kemampuan eksplorasi dan sistem companion

### 6.1 Fungsi yang sudah tercatat
- [KANON TERTULIS] Membawa sumber cahaya/lentera atau obor.
- [KANON TERTULIS] Memasuki celah sempit.
- [KANON TERTULIS] Menjadi pemberat switch dalam environmental puzzle.
- [KANON TERTULIS] Bereaksi terhadap lingkungan dengan micro-behaviors (contoh: menyusun batu, mengejar domba, menampung hujan, berputar di sekitar bendera).
- [KANON TERTULIS] Dapat dibawa ketika memanjat; takut ketinggian.
- [KANON TERTULIS] Ada rancangan tombol companion LT/L2 untuk scout / membawa obor, **tetapi mekanisme kontrol belum disahkan ulang setelah arah komunikasi nonverbal**.

### 6.2 Prinsip yang disepakati
- [TERKUNCI] Cub harus terasa hidup dan memiliki inisiatif.
- [TERKUNCI] Ia belajar lewat observasi, bukan langsung memahami instruksi verbal.
- [TERKUNCI] Bantuan eksplorasi tidak boleh menghapus kepribadian atau membuat pemain frustrasi karena kegagalan AI yang berulang.
- [TERKUNCI] Perilaku, kontribusi eksplorasi, dan perkembangan emosi harus saling mendukung; jangan mengutamakan satu dengan mengorbankan dua lainnya.

### 6.3 Usulan implementasi Godot (belum final)
Gunakan state machine sederhana yang dapat diuji:
`WAITING → CURIOUS → FOLLOWING → INTERACTING → ASSISTING → FRIGHTENED → RECOVERING`.
Kondisi melemah menjadi **lapisan status terpisah** (misalnya `health_phase`), bukan state yang menghapus seluruh kepribadian.

Komponen yang disarankan:
- `StoneCubController.gd`: navigasi dan transisi perilaku.
- `StoneCubPerception.gd`: observasi jarak, line-of-sight, stimulus lingkungan.
- `StoneCubExpression.gd`: sinkronisasi gestur, glow, ketukan, dan animasi.
- `StoneCubInteraction.gd`: interaksi dengan puzzle dan Cartographer.
- `CompanionDirector.gd`: orkestrasi beat naratif, tanpa mengambil alih agensi pemain.
- `StoneCubDebugOverlay.gd`: status pengujian, **hanya debug**, tidak muncul dalam UI final.

**Batasan teknis:** Jangan memulai dengan LLM runtime atau model AI lokal untuk perilaku Cub. Behavior tree/state machine yang deterministic dan authorable lebih mudah diuji, ringan untuk perangkat target, dan memberi kontrol emosional yang lebih baik. Istilah “AI companion” di sini berarti AI gameplay, bukan wajib generative AI real-time.

## 7. Lore Golem, ibu Stone Cub, dan konflik canon

### Sudah disampaikan/disepakati dalam percakapan
- [TERKUNCI — arah cerita] Stone Cub memiliki ibu yang terkait dengan leluhur Golem.
- [TERKUNCI — arah cerita] Peradaban Golem telah ada sebelum manusia.
- [TERKUNCI — arah cerita] Perang besar para leluhur Golem terkait kehancuran/pemisahan dunia.
- [TERKUNCI — arah cerita] Stone Cub berperan dalam dilema menjaga keselarasan/segel dunia versus membuka kemungkinan penyatuan dunia.
- [TERKUNCI — arah cerita] Manusia harus tetap memiliki agensi dan peran penting dalam konflik, bukan sekadar penonton sejarah Golem.

### Yang tertulis di Canon v5
- [KANON TERTULIS] Cub adalah fragmen baterai/segel ketujuh dari sistem Spire, dengan ingatan terputus.
- [KANON TERTULIS] Nasibnya terkait pengaktifan Spire dan pilihan akhir.

### Yang BELUM FINAL
- Identitas dan kondisi ibu Cub, peristiwa terakhir mereka bersama, serta bagaimana Cub terpisah darinya.
- Apakah ibu Cub merupakan “leluhur” secara literal, gelar, atau bagian dari generasi kuno.
- Mekanisme persis hubungan Cub dengan fragmen ketujuh/Spire.
- Apakah membuka dunia menyatu atau justru melemahkan segel, dan konsekuensi pasti untuk manusia/Golem.
- Bagaimana pengetahuan Golem tersisa dalam memori Cub tanpa membuatnya memahami bahasa kompleks.
- Kapan pemain pertama kali melihat ibu Cub yang telah menyatu dengan lingkungan dan apa yang boleh diungkap saat itu.

**Larangan:** Codex tidak boleh memilih sendiri salah satu jawaban lore ini.

## 8. Prototipe 3–5 menit: spesifikasi tugas awal untuk Codex

**Tujuan:** Membuktikan bahwa Cub terasa sebagai makhluk hidup dan hubungan awalnya bisa dipahami tanpa dialog, dengan gaya 2.5D painterly.

### Lingkup wajib
1. Scene pertemuan sederhana dengan lingkungan berlapis dan atmosfer.
2. Cartographer bisa berjalan dan melompat dengan collision stabil.
3. Cub bereaksi terhadap pendekatan Cartographer: memperhatikan, takut, lalu lebih tenang.
4. Interaksi scarf yang dipicu oleh kondisi adegan (bukan cutscene panjang yang meniadakan kontrol seluruhnya).
5. Setelah scarf, glow menghangat dan bunga putih muncul.
6. Cub mengikuti pemain dengan jarak yang dapat diatur; minimal satu idle behavior yang tidak mengganggu gameplay.
7. Gerak, animasi placeholder, dan audio sementara diberi label jelas sebagai **prototype**.
8. Headless run/test jika tersedia, laporan error yang benar-benar diuji, dan instruksi menjalankan proyek di Windows.

### Di luar lingkup awal
- Bahasa resonansi penuh, seluruh 12 micro-behavior, puzzle kompleks, seluruh act, cutscene ibu Cub, sistem penyakit lengkap, dua ending, serta final art dan final audio.

### Acceptance criteria (usulan)
- Proyek Godot 4 terbuka dan scene dapat dimainkan.
- Cub tidak tersangkut permanen pada rintangan sederhana.
- Perubahan takut → percaya terbaca melalui setidaknya dua kanal ekspresi, bukan warna saja.
- Scarf dapat dilihat jelas; transisi glow/bunga dipicu tepat satu kali.
- Semua perubahan cerita yang belum final ditahan untuk approval.
- AI melaporkan: file berubah, tes yang dilakukan, keterbatasan, dan video/screenshot bila tersedia.

## 9. Matriks approval sebelum produksi besar

| Keputusan | Status | Pemilik keputusan |
|---|---|---|
| Stone Cub tidak paham bahasa manusia sejak awal | TERKUNCI | Game Director |
| Belajar melalui observasi dan interaksi | TERKUNCI | Game Director |
| Bahasa Golem berbasis resonansi, Cub mengenal fragmen | TERKUNCI — arah | Game Director |
| Ekspresi nonverbal multi-kanal | TERKUNCI — arah | Game Director |
| Bentuk visual dasar dan scarf | KANON TERTULIS | Game Director |
| Struktur sistem AI gameplay di Godot | USULAN | Review teknis |
| Tombol perintah companion dan level kemandirian | BELUM FINAL | Game Director |
| Lore ibu, hubungan dengan Spire, dan reveal | BELUM FINAL | Game Director |
| Urutan act dan lokasi pertemuan final | BELUM FINAL — konflik v5 | Game Director |
| Sistem penyakit numerik | BELUM FINAL | Game Director |

## 10. Instruksi permanen bagi AI developer

1. Baca dokumen ini dan file canon naratif sebelum coding.
2. Jangan menyamakan usulan implementasi dengan lore yang sudah final.
3. Pertahankan sifat Stone Cub sebagai makhluk otonom, bukan NPC yang sepenuhnya patuh.
4. Jangan menambahkan dialog bahasa manusia untuk Cub.
5. Jangan menambahkan HUD emosi berbasis warna.
6. Jangan mengunci asal-usul ibu, twist Spire, lokasi pertemuan, atau sistem kontrol tanpa approval.
7. Pecah pekerjaan menjadi task kecil, tes dan laporkan hasil sebenarnya.
8. Prioritaskan performa Godot 4 pada laptop Windows RAM 8 GB.
9. Hindari aset AI yang tidak konsisten; simpan model sheet/asset manifest.
10. Laporkan konflik sumber dan pertanyaan yang menghalangi implementasi; jangan mengarang jawabannya.

## 11. Catatan sumber dan integritas dokumen

Dokumen ini menggabungkan:
- **`Project_Horizon_FINAL_CANON_v5.md`** — blueprint tersinkron dengan karakter, gameplay, dan act.
- **`Project_x5f_Horizon_x5f_Premis_x5f_Sequel.md`** — versi premis/sekuel lain berlabel Canon v5 dengan perincian berbeda.
- **Keputusan percakapan terbaru** — terutama bahasa, komunikasi, observasi, hubungan dua arah, asal-usul Golem, dan arah produksi AI-first.

Dua file berlabel v5 **tidak sepenuhnya identik**. Dokumen ini sengaja **tidak menggabungkan kontradiksi secara diam-diam**. Semua perbedaan penting ditandai sebagai belum final.

**Status rilis:** Siap digunakan sebagai *context pack* untuk planning Codex. **Belum boleh dipakai sebagai izin mengimplementasikan lore yang belum disetujui.**

---

# LAMPIRAN B — RIWAYAT KEPUTUSAN AWAL (ARSIP)

> Arsip ini disertakan agar keputusan eksplorasi terdahulu tidak hilang. Bila ada ketidaksesuaian, **bagian B di awal dokumen menang**.

# PROJECT HORIZON — CANON REVIEW DECISION LOG

**Tanggal:** 2026-10-30
**Status:** Konfirmasi langsung Game Director, untuk pengembangan Narrative & World Bible.
**Aturan:** 'Eksplorasi lagi' berarti TERBUKA, bukan ditolak atau disetujui. 'Setujui arah' berarti arah diterima, bukan rincian mekanisme final.

## Keputusan yang dikonfirmasi

| ID | Topik | Putusan | Implikasi |
|---|---|---|---|
| B04–B05 | Pemisahan dunia dan tindakan ibu Stone Cub | EKSPLORASI LAGI | Belum kunci mekanisme, pelaku utama, dan motif |
| B06–B07 | Fungsi tujuh Spire dan Origin Core | EKSPLORASI LAGI | Belum kunci fungsi energi, stabilisasi, segel, atau asal ancaman |
| B09–C06 | Peran manusia | EKSPLORASI LAGI | Perlu peran sejarah dan agensi Cartographer yang kausal |
| D06–D10 | Asal-usul Stone Cub dan nasib ibunya | EKSPLORASI LAGI | Hubungan fragmen ketujuh, ibu, dan Spire belum final |
| E08 | Struktur Act 0–4 | EKSPLORASI LAGI | Urutan dan lokasi adegan belum final |
| E09 | Pengungkapan ibu Stone Cub | EKSPLORASI LAGI | Timing dan tingkat informasi belum final |
| E10–F03 | Ending Game 1 dan konsekuensi Game 2 | SETUJUI ARAH | Dua ending berdampak nyata pada Cub dan keadaan dunia; detail belum terkunci |
| F04–F06 | Arah final franchise | EKSPLORASI LAGI | Origin Core, konflik trilogi, dan judul sekuel belum final |

## Dasar yang tidak sedang dibatalkan
- Peradaban Golem mendahului manusia.
- Perang besar leluhur Golem berhubungan dengan kehancuran dunia.
- Stone Cub memiliki ibu, merupakan makhluk sadar dengan kehendak sendiri, dan menjadi pusat dilema keseimbangan/penyatuan.
- Cartographer memiliki motivasi memetakan dunia, lalu menghadapi pilihan melindungi sahabatnya.
- Storytelling nonverbal dan pembelajaran komunikasi dua arah.
- Tidak boleh menganggap setiap rincian Canon v5 otomatis mengatasi revisi percakapan berikutnya.

## Dependensi eksplorasi
1. Perang → pemisahan dunia → sistem Spire/Origin Core.
2. Peran ibu dan Stone Cub dalam sistem tersebut.
3. Peran manusia dan Cartographer dalam pilihan yang bermakna.
4. Penempatan petunjuk dan pengungkapan sepanjang Act 0–4.
5. Konsistensi dua ending Game 1 dengan Game 2/3.

## Pertanyaan terbuka prioritas
1. Apakah pemisahan dunia keputusan penyelamatan, akibat perang, atau gabungan keduanya?
2. Apakah tujuh Spire terutama menstabilkan fragmen, menyegel ancaman, atau memiliki dua fungsi dengan biaya tertentu?
3. Mengapa ibu Stone Cub dapat memengaruhi sistem itu? Apa yang terjadi padanya?
4. Mengapa Stone Cub terhubung ke fragmen ketujuh? Apakah ia makhluk independen yang kemudian terikat, bukan baterai yang diciptakan?
5. Apa tindakan manusia yang dapat memengaruhi sistem secara masuk akal?
6. Bagaimana membagi misteri menjadi reveal Game 1, 2, dan 3 tanpa merusak klimaks Game 1?

## Aturan untuk AI/Codex
- Jangan implementasikan jawaban atas pertanyaan terbuka sebagai fakta lore.
- Tandai setiap ide baru sebagai OPSI, bukan CANON.
- Jangan menulis ulang sumber lama secara diam-diam; catat perubahan beserta ID keputusan.
- Game Director memegang persetujuan akhir.


---

# LAMPIRAN C — KONSEP LEGACY YANG TIDAK BOLEH DIANGGAP FINAL

| Konsep dari file lama | Status terkini |
|---|---|
| Cub adalah baterai/segel ketujuh yang sengaja dibuat untuk Spire | **Bertentangan dengan arah Cub otonom dan H12; jangan pakai sebagai fakta.** |
| Perang hanya antarfaksi Golem | **Digantikan** sejarah konflik manusia–Golem dengan aliansi ideologis campuran. |
| Origin Core merupakan penjara entitas purba | **Belum disetujui**; H01 menetapkan Core alami. |
| Dunia sengaja dihancurkan oleh tim penyelamat | **Bertentangan dengan arah H09**: perang menyebabkan fraktur; penyelamatan menstabilkan. |
| Isolasi Nomad disebabkan bencana lokal yang terpisah dari perang | **Ditolak sebagai sebab utama** lewat klarifikasi H16. |
| Cub pasti mati/pecah dalam ending tertentu, angka peta 100% vs 85% | **OPEN H18**; jangan gunakan sebagai konsekuensi pasti. |
| Act 0–4, lokasi pertemuan Cub, jumlah level, durasi, judul sekuel | **Rancangan kerja/legacy**, bukan keputusan final. |
| Sistem tombol companion, AI Godot, angka stamina, warna glow spesifik | **Usulan implementasi**, bukan lore atau spesifikasi final. |

## Pertanyaan P0 sebelum Final Canon

1. Aturan resonansi, kerusakan Origin Core, tujuh Spire, daratan melayang, dan Sea of Clouds.
2. Penyebab sakit Cub, batas fungsi Imprint, dan pengaruh Continental Spire (H14).
3. Pilihan akhir Game 1 dan konsekuensi nyata kedua ending tanpa menghilangkan agensi Cub (H18).
4. Rincian kronologi perang → fraktur → isolasi tujuh generasi Nomad; hubungan kausal **sudah jelas**, tanggal dan proses pengetahuan hilang **belum**.
5. Pemicu perang W2/W3/W1, nasib ibu Cub, dan keadaan Golem yang tersisa.

## Petunjuk perubahan versi

Setiap perubahan harus dicatat: `Decision ID | Usulan | Bukti/persetujuan Game Director | Status | Dampak Game 1 | Dampak Game 2/3 | Dampak gameplay/art | Tanggal`. **Jangan mengubah status hanya karena teks ditambahkan ke dokumen.**

## Manifest sumber yang digabung

1. `Project_Horizon_Narrative_World_Bible_v1.0.md` — teks utama.
2. `HORIZON_STONE_CUB_CHARACTER_AND_COMPANION_SYSTEM_v1.md` — Lampiran A.
3. `HORIZON_CANON_REVIEW_DECISION_LOG_2026-10-30.md` — Lampiran B.
4. `HORIZON_BROKEN_COVENANT_REVIEW_LOG_v0.7.md` — status diperbarui di bagian B; versi lama hanya arsip.
5. `HORIZON_BROKEN_COVENANT_DECISION_PROPOSAL_v0.6.md` — kandidat di bagian sejarah Bible, bukan keputusan final.
6. `Project_Horizon_FINAL_CANON_v5.md` — legacy reference; konflik dicatat di Lampiran C.
7. `Project_x5f_Horizon_x5f_Premis_x5f_Sequel.md` — legacy franchise reference; konflik dicatat di Lampiran C.

**ATURAN AKHIR:** Satu file aktif untuk Project Sources. Jika ada perubahan canon berikutnya, **perbarui file ini** dan naikkan versinya, jangan mengunggah file lama sebagai sumber paralel dengan otoritas setara.
