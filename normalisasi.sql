-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 24 Mar 2025 pada 04.43
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `normalisasi`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `dosen`
--

CREATE TABLE `dosen` (
  `ID_Dosen` int(11) NOT NULL,
  `Nama_Dosen` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `dosen`
--

INSERT INTO `dosen` (`ID_Dosen`, `Nama_Dosen`) VALUES
(1, 'Dr. Budi'),
(2, 'Dr. Siti');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `NIM` varchar(10) NOT NULL,
  `Nama_Mahasiswa` varchar(50) DEFAULT NULL,
  `Prodi` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `mahasiswa`
--

INSERT INTO `mahasiswa` (`NIM`, `Nama_Mahasiswa`, `Prodi`) VALUES
('22001', 'Andi Wijaya', 'Informatika'),
('22002', 'Rina Lestari', 'Informatika'),
('22003', 'Dika Pratama', 'Sistem Informasi');

-- --------------------------------------------------------

--
-- Struktur dari tabel `matakuliah`
--

CREATE TABLE `matakuliah` (
  `Kode_MK` varchar(10) NOT NULL,
  `Nama_MK` varchar(50) DEFAULT NULL,
  `SKS` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `matakuliah`
--

INSERT INTO `matakuliah` (`Kode_MK`, `Nama_MK`, `SKS`) VALUES
('IF101', 'Basis Data', 3),
('IF102', 'Pemrograman', 4),
('SI201', 'Manajemen Proyek', 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `nilai`
--

CREATE TABLE `nilai` (
  `ID_Nilai` int(11) NOT NULL,
  `NIM` varchar(10) DEFAULT NULL,
  `Kode_MK` varchar(10) DEFAULT NULL,
  `Nilai` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `nilai`
--

INSERT INTO `nilai` (`ID_Nilai`, `NIM`, `Kode_MK`, `Nilai`) VALUES
(1, '22001', 'IF101', 'A'),
(2, '22001', 'IF102', 'B+'),
(3, '22002', 'IF101', 'A-'),
(4, '22003', 'SI201', 'B');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengajaran`
--

CREATE TABLE `pengajaran` (
  `ID_Pengajaran` int(11) NOT NULL,
  `Kode_MK` varchar(10) DEFAULT NULL,
  `ID_Dosen` int(11) DEFAULT NULL,
  `Ruang_Kelas` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pengajaran`
--

INSERT INTO `pengajaran` (`ID_Pengajaran`, `Kode_MK`, `ID_Dosen`, `Ruang_Kelas`) VALUES
(1, 'IF101', 1, 'A101'),
(2, 'IF102', 2, 'B202'),
(3, 'SI201', 1, 'C303');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengampu`
--

CREATE TABLE `pengampu` (
  `ID_Dosen` int(11) NOT NULL,
  `Kode_MK` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`ID_Dosen`);

--
-- Indeks untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`NIM`);

--
-- Indeks untuk tabel `matakuliah`
--
ALTER TABLE `matakuliah`
  ADD PRIMARY KEY (`Kode_MK`);

--
-- Indeks untuk tabel `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`ID_Nilai`),
  ADD KEY `NIM` (`NIM`),
  ADD KEY `Kode_MK` (`Kode_MK`);

--
-- Indeks untuk tabel `pengajaran`
--
ALTER TABLE `pengajaran`
  ADD PRIMARY KEY (`ID_Pengajaran`),
  ADD KEY `Kode_MK` (`Kode_MK`),
  ADD KEY `ID_Dosen` (`ID_Dosen`);

--
-- Indeks untuk tabel `pengampu`
--
ALTER TABLE `pengampu`
  ADD PRIMARY KEY (`ID_Dosen`,`Kode_MK`),
  ADD KEY `Kode_MK` (`Kode_MK`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `dosen`
--
ALTER TABLE `dosen`
  MODIFY `ID_Dosen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `nilai`
--
ALTER TABLE `nilai`
  MODIFY `ID_Nilai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `pengajaran`
--
ALTER TABLE `pengajaran`
  MODIFY `ID_Pengajaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `nilai`
--
ALTER TABLE `nilai`
  ADD CONSTRAINT `nilai_ibfk_1` FOREIGN KEY (`NIM`) REFERENCES `mahasiswa` (`NIM`),
  ADD CONSTRAINT `nilai_ibfk_2` FOREIGN KEY (`Kode_MK`) REFERENCES `matakuliah` (`Kode_MK`);

--
-- Ketidakleluasaan untuk tabel `pengajaran`
--
ALTER TABLE `pengajaran`
  ADD CONSTRAINT `pengajaran_ibfk_1` FOREIGN KEY (`Kode_MK`) REFERENCES `matakuliah` (`Kode_MK`),
  ADD CONSTRAINT `pengajaran_ibfk_2` FOREIGN KEY (`ID_Dosen`) REFERENCES `dosen` (`ID_Dosen`);

--
-- Ketidakleluasaan untuk tabel `pengampu`
--
ALTER TABLE `pengampu`
  ADD CONSTRAINT `pengampu_ibfk_1` FOREIGN KEY (`ID_Dosen`) REFERENCES `dosen` (`ID_Dosen`) ON DELETE CASCADE,
  ADD CONSTRAINT `pengampu_ibfk_2` FOREIGN KEY (`Kode_MK`) REFERENCES `matakuliah` (`Kode_MK`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
