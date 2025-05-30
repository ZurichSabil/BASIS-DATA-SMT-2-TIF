-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 30 Bulan Mei 2025 pada 16.27
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
-- Database: `studycore`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `kursus`
--

CREATE TABLE `kursus` (
  `kursusID` int(11) NOT NULL,
  `judul` varchar(255) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `trainerID` int(11) DEFAULT NULL,
  `harga` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `materikursus`
--

CREATE TABLE `materikursus` (
  `materiID` int(11) NOT NULL,
  `kursusID` int(11) DEFAULT NULL,
  `judul` varchar(255) DEFAULT NULL,
  `fileMateri` varchar(255) DEFAULT NULL,
  `tanggalUpload` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `pembayaranID` int(11) NOT NULL,
  `pesertaID` int(11) DEFAULT NULL,
  `kursusID` int(11) DEFAULT NULL,
  `jumlahBayar` decimal(10,2) DEFAULT NULL,
  `tanggalBayar` datetime DEFAULT NULL,
  `status` enum('lunas','pending','gagal') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengumpulantugas`
--

CREATE TABLE `pengumpulantugas` (
  `pengumpulanID` int(11) NOT NULL,
  `tugasID` int(11) DEFAULT NULL,
  `pesertaID` int(11) DEFAULT NULL,
  `fileJawaban` varchar(255) DEFAULT NULL,
  `tanggalPengumpulan` datetime DEFAULT NULL,
  `nilai` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `peserta`
--

CREATE TABLE `peserta` (
  `pesertaID` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `passwordHash` varchar(255) DEFAULT NULL,
  `tanggalLahir` date DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `nomorTelepon` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sertifikat`
--

CREATE TABLE `sertifikat` (
  `sertifikatID` int(11) NOT NULL,
  `pesertaID` int(11) DEFAULT NULL,
  `kursusID` int(11) DEFAULT NULL,
  `nomorSertifikat` varchar(50) DEFAULT NULL,
  `nilaiAkhir` decimal(5,2) DEFAULT NULL,
  `tanggalTerbit` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `trainer`
--

CREATE TABLE `trainer` (
  `trainerID` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `passwordHash` varchar(255) DEFAULT NULL,
  `spesialisasi` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tugas`
--

CREATE TABLE `tugas` (
  `tugasID` int(11) NOT NULL,
  `kursusID` int(11) DEFAULT NULL,
  `judul` varchar(255) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `tanggalDeadline` datetime DEFAULT NULL,
  `fileLampiran` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `kursus`
--
ALTER TABLE `kursus`
  ADD PRIMARY KEY (`kursusID`),
  ADD KEY `trainerID` (`trainerID`);

--
-- Indeks untuk tabel `materikursus`
--
ALTER TABLE `materikursus`
  ADD PRIMARY KEY (`materiID`),
  ADD KEY `kursusID` (`kursusID`);

--
-- Indeks untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`pembayaranID`),
  ADD KEY `pesertaID` (`pesertaID`),
  ADD KEY `kursusID` (`kursusID`);

--
-- Indeks untuk tabel `pengumpulantugas`
--
ALTER TABLE `pengumpulantugas`
  ADD PRIMARY KEY (`pengumpulanID`),
  ADD KEY `tugasID` (`tugasID`),
  ADD KEY `pesertaID` (`pesertaID`);

--
-- Indeks untuk tabel `peserta`
--
ALTER TABLE `peserta`
  ADD PRIMARY KEY (`pesertaID`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indeks untuk tabel `sertifikat`
--
ALTER TABLE `sertifikat`
  ADD PRIMARY KEY (`sertifikatID`),
  ADD KEY `pesertaID` (`pesertaID`),
  ADD KEY `kursusID` (`kursusID`);

--
-- Indeks untuk tabel `trainer`
--
ALTER TABLE `trainer`
  ADD PRIMARY KEY (`trainerID`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indeks untuk tabel `tugas`
--
ALTER TABLE `tugas`
  ADD PRIMARY KEY (`tugasID`),
  ADD KEY `kursusID` (`kursusID`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `kursus`
--
ALTER TABLE `kursus`
  MODIFY `kursusID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `materikursus`
--
ALTER TABLE `materikursus`
  MODIFY `materiID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `pembayaranID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pengumpulantugas`
--
ALTER TABLE `pengumpulantugas`
  MODIFY `pengumpulanID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `peserta`
--
ALTER TABLE `peserta`
  MODIFY `pesertaID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `sertifikat`
--
ALTER TABLE `sertifikat`
  MODIFY `sertifikatID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `trainer`
--
ALTER TABLE `trainer`
  MODIFY `trainerID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tugas`
--
ALTER TABLE `tugas`
  MODIFY `tugasID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `kursus`
--
ALTER TABLE `kursus`
  ADD CONSTRAINT `kursus_ibfk_1` FOREIGN KEY (`trainerID`) REFERENCES `trainer` (`trainerID`);

--
-- Ketidakleluasaan untuk tabel `materikursus`
--
ALTER TABLE `materikursus`
  ADD CONSTRAINT `materikursus_ibfk_1` FOREIGN KEY (`kursusID`) REFERENCES `kursus` (`kursusID`);

--
-- Ketidakleluasaan untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`pesertaID`) REFERENCES `peserta` (`pesertaID`),
  ADD CONSTRAINT `pembayaran_ibfk_2` FOREIGN KEY (`kursusID`) REFERENCES `kursus` (`kursusID`);

--
-- Ketidakleluasaan untuk tabel `pengumpulantugas`
--
ALTER TABLE `pengumpulantugas`
  ADD CONSTRAINT `pengumpulantugas_ibfk_1` FOREIGN KEY (`tugasID`) REFERENCES `tugas` (`tugasID`),
  ADD CONSTRAINT `pengumpulantugas_ibfk_2` FOREIGN KEY (`pesertaID`) REFERENCES `peserta` (`pesertaID`);

--
-- Ketidakleluasaan untuk tabel `sertifikat`
--
ALTER TABLE `sertifikat`
  ADD CONSTRAINT `sertifikat_ibfk_1` FOREIGN KEY (`pesertaID`) REFERENCES `peserta` (`pesertaID`),
  ADD CONSTRAINT `sertifikat_ibfk_2` FOREIGN KEY (`kursusID`) REFERENCES `kursus` (`kursusID`);

--
-- Ketidakleluasaan untuk tabel `tugas`
--
ALTER TABLE `tugas`
  ADD CONSTRAINT `tugas_ibfk_1` FOREIGN KEY (`kursusID`) REFERENCES `kursus` (`kursusID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
