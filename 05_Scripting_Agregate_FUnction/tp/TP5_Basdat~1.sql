-- =========================================
-- DATABASE BIOSKOP
-- =========================================

-- Hapus tabel jika sudah ada (urut dari child ke parent)
DROP TABLE IF EXISTS transaksi;
DROP TABLE IF EXISTS kursi;
DROP TABLE IF EXISTS jadwal;
DROP TABLE IF EXISTS member;
DROP TABLE IF EXISTS film;
DROP TABLE IF EXISTS theater;

-- =========================================
-- 1. TABEL FILM
-- =========================================
CREATE TABLE film (
    id_film INT AUTO_INCREMENT PRIMARY KEY,
    judul VARCHAR(100),
    durasi INT,
    rating VARCHAR(10),
    sinopsis TEXT
);

-- =========================================
-- 2. TABEL THEATER
-- =========================================
CREATE TABLE theater (
    id_theater INT AUTO_INCREMENT PRIMARY KEY,
    nama_theater VARCHAR(50),
    kapasitas INT,
    harga INT,
    kelas VARCHAR(20)
);

-- =========================================
-- 3. TABEL KURSI
-- =========================================
CREATE TABLE kursi (
    id_kursi INT AUTO_INCREMENT PRIMARY KEY,
    id_theater INT,
    baris CHAR(1),
    nomor INT,
    FOREIGN KEY (id_theater) REFERENCES theater(id_theater)
);

-- =========================================
-- 4. TABEL JADWAL
-- =========================================
CREATE TABLE jadwal (
    id_jadwal INT AUTO_INCREMENT PRIMARY KEY,
    id_film INT,
    id_theater INT,
    tanggal_mulai DATE,
    tanggal_selesai DATE,
    jam_mulai TIME,
    jam_selesai TIME,
    FOREIGN KEY (id_film) REFERENCES film(id_film),
    FOREIGN KEY (id_theater) REFERENCES theater(id_theater)
);

-- =========================================
-- 5. TABEL MEMBER
-- =========================================
CREATE TABLE member (
    id_member INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100),
    tanggal_lahir DATE
);

-- =========================================
-- 6. TABEL TRANSAKSI
-- =========================================
CREATE TABLE transaksi (
    id_transaksi INT AUTO_INCREMENT PRIMARY KEY,
    id_member INT,
    id_jadwal INT,
    tanggal_nonton DATE,
    FOREIGN KEY (id_member) REFERENCES member(id_member),
    FOREIGN KEY (id_jadwal) REFERENCES jadwal(id_jadwal)
);

-- =========================================
-- INSERT DATA CONTOH
-- =========================================

-- Film
INSERT INTO film (judul, durasi, rating)
VALUES ('Spider-Man: Far From Home', 129, 'PG-13');

-- Theater
INSERT INTO theater (nama_theater, kapasitas, harga, kelas)
VALUES 
('Theater 1', 10, 35000, 'Regular'),
('Theater 2', 20, 50000, 'VIP');

-- Jadwal
INSERT INTO jadwal (id_film, id_theater, tanggal_mulai, tanggal_selesai, jam_mulai, jam_selesai)
VALUES
(1, 1, '2019-07-03', '2019-07-20', '12:30:00', '14:30:00'),
(1, 1, '2019-07-03', '2019-07-20', '16:00:00', '18:00:00'),
(1, 1, '2019-07-03', '2019-07-20', '19:30:00', '21:30:00'),
(1, 2, '2019-07-03', '2019-07-15', '13:00:00', '15:00:00'),
(1, 2, '2019-07-03', '2019-07-15', '16:00:00', '18:00:00'),
(1, 2, '2019-07-03', '2019-07-15', '19:00:00', '21:00:00');

-- Member
INSERT INTO member (nama, tanggal_lahir)
VALUES
('Andi', '2000-05-10'),
('Budi', '1998-08-20'),
('Citra', '2002-01-15');

-- Transaksi
INSERT INTO transaksi (id_member, id_jadwal, tanggal_nonton)
VALUES
(1,1,'2019-07-03'),
(1,2,'2019-07-04'),
(1,3,'2019-07-05'),
(2,1,'2019-07-03'),
(3,2,'2019-07-04');

-- =========================================
-- QUERY LATIHAN
-- =========================================

-- 1. Jumlah film
SELECT COUNT(*) AS jumlah_film FROM film;

-- 2. Jumlah film yang sedang diputar
SELECT COUNT(DISTINCT id_film) AS jumlah_film_tayang FROM jadwal;

-- 3. Member yang menonton lebih dari 2 kali
SELECT id_member
FROM transaksi
GROUP BY id_member
HAVING COUNT(*) > 2;

-- 4. Member termuda dan jumlah film yang ditonton
SELECT m.id_member, m.nama, COUNT(t.id_jadwal) AS jumlah_tonton
FROM member m
JOIN transaksi t ON m.id_member = t.id_member
WHERE m.tanggal_lahir = (SELECT MAX(tanggal_lahir) FROM member)
GROUP BY m.id_member, m.nama;

-- 5. Jumlah member berdasarkan bulan lahir
SELECT MONTH(tanggal_lahir) AS bulan, COUNT(*) AS jumlah_member
FROM member
GROUP BY MONTH(tanggal_lahir);

-- 6. Jumlah jadwal tayang per film
SELECT id_film, COUNT(*) AS jumlah_jadwal
FROM jadwal
GROUP BY id_film;