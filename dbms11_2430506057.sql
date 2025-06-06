-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 16 Mar 2025 pada 08.12
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
-- Database: `dbms11_2430506057`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbgaji`
--

CREATE TABLE `tbgaji` (
  `gol` int(1) NOT NULL,
  `gapok` int(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbgaji`
--

INSERT INTO `tbgaji` (`gol`, `gapok`) VALUES
(1, 1500000),
(2, 2000000),
(3, 3500000),
(4, 5000000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbpegawai`
--

CREATE TABLE `tbpegawai` (
  `nip` varchar(5) NOT NULL,
  `nama` varchar(25) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `kota` varchar(15) DEFAULT NULL,
  `thn_masuk` year(4) DEFAULT NULL,
  `gol` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbpegawai`
--

INSERT INTO `tbpegawai` (`nip`, `nama`, `tgl_lahir`, `kota`, `thn_masuk`, `gol`) VALUES
('1001', 'Ahmad Burhanuddin', '1990-12-12', 'Bandung', '2010', 3),
('1002', 'Amin Imsyorry', '1989-12-02', 'Ciamis', '2009', 2),
('1003', 'Budhy Bungaox', '1989-01-20', 'Tasikmalaya', '2011', 4),
('1004', 'Zulkarnaen', '1991-02-20', 'Bandung', '2009', 1),
('1005', 'Dewi Sudewa', '1990-12-02', 'Bogor', '2009', 1),
('1006', 'Ina Nurlian', '1993-08-09', 'Sumedang', '2011', 4),
('1007', 'Cheppy Chardut', '1992-07-09', 'Garut', '2011', 4),
('1008', 'Dodong M', '1990-07-10', 'Bandung', '2010', 3),
('1009', 'Gandung P', '1990-06-25', 'Bogor', '2009', 2),
('1010', 'Agus Wisman', '1993-10-17', 'Garut', '2010', 3);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tbgaji`
--
ALTER TABLE `tbgaji`
  ADD PRIMARY KEY (`gol`);

--
-- Indeks untuk tabel `tbpegawai`
--
ALTER TABLE `tbpegawai`
  ADD PRIMARY KEY (`nip`),
  ADD KEY `fk_gol` (`gol`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tbpegawai`
--
ALTER TABLE `tbpegawai`
  ADD CONSTRAINT `fk_gol` FOREIGN KEY (`gol`) REFERENCES `tbgaji` (`gol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
