-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 05, 2025 at 02:37 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbpuskesmas`
--

-- --------------------------------------------------------

--
-- Table structure for table `kelurahan`
--

CREATE TABLE `kelurahan` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kelurahan`
--

INSERT INTO `kelurahan` (`id`, `nama`) VALUES
(1, 'Kelurahan Kiarapandak'),
(2, 'Kelurahan Urug'),
(3, 'Kelurahan Cipatat'),
(4, 'Kelurahan Sukajaya'),
(5, 'Kelurahan Kiarasari');

-- --------------------------------------------------------

--
-- Table structure for table `paramedik`
--

CREATE TABLE `paramedik` (
  `id` int(11) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `gender` char(1) NOT NULL,
  `tmp_lahir` varchar(50) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `kategori` enum('Dokter','Perawat') NOT NULL,
  `telepon` varchar(20) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `idunit_kerja` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `paramedik`
--

INSERT INTO `paramedik` (`id`, `nama`, `gender`, `tmp_lahir`, `tgl_lahir`, `kategori`, `telepon`, `alamat`, `idunit_kerja`) VALUES
(4, 'Rama Aditt', 'L', 'Medan', '2000-03-05', 'Dokter', '0851235383', 'Jl. Sempurna', NULL),
(5, 'Bilal', 'L', 'Depok', '1999-02-09', 'Dokter', '0859856728', 'Kp. Kebon teh', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `id` int(11) NOT NULL,
  `kode` varchar(8) NOT NULL,
  `nama` varchar(80) NOT NULL,
  `tmp_lahir` varchar(50) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `gender` enum('L','P') NOT NULL,
  `idkelurahan` int(11) DEFAULT NULL,
  `email` varchar(80) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`id`, `kode`, `nama`, `tmp_lahir`, `tgl_lahir`, `gender`, `idkelurahan`, `email`, `alamat`) VALUES
(1, 'K001', 'Ahmad Rojali', 'Bogor', '2005-05-05', 'L', NULL, 'Rojali54@gmail.com', 'jl. Aja jadian kagak'),
(2, 'K002', 'Enjum Jamaldi', 'Bogor', '2005-10-10', 'L', 2, 'Enjum32@gmail.com', 'jl. Melati dan Mawar 1'),
(3, 'K003', 'Mukliss', 'Bogor', '2005-03-04', 'L', 5, 'Muklis@gmail.com', 'jl. Terus sampe ketemu dia'),
(4, 'K004', 'Eren Yeagrt', 'Jakarta', '2004-02-07', 'L', 1, 'Erenn23@gmail.com', 'Kp.Paradist Benteng 3'),
(6, 'K005', 'Ajani', 'Bogor', '2005-05-07', 'L', NULL, 'Ajani23@gmail.com', 'Kp.Ciamiss'),
(7, 'k006', 'Sitiii', 'Jakarta', '2005-12-12', 'P', NULL, 'sitii32@gmail.com', 'jl. Melati suki');

-- --------------------------------------------------------

--
-- Table structure for table `periksa`
--

CREATE TABLE `periksa` (
  `id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `berat` double NOT NULL,
  `tinggi` double NOT NULL,
  `tensi` varchar(20) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `pasien_id` int(11) DEFAULT NULL,
  `dokter_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `periksa`
--

INSERT INTO `periksa` (`id`, `tanggal`, `berat`, `tinggi`, `tensi`, `keterangan`, `pasien_id`, `dokter_id`) VALUES
(3, '2025-05-05', 60, 167, '2', 'super bahagia', 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `unit_kerja`
--

CREATE TABLE `unit_kerja` (
  `id` int(11) NOT NULL,
  `nama` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `unit_kerja`
--

INSERT INTO `unit_kerja` (`id`, `nama`) VALUES
(1, 'IGD'),
(2, 'UGD'),
(3, 'Layanan Ambulans');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kelurahan`
--
ALTER TABLE `kelurahan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `paramedik`
--
ALTER TABLE `paramedik`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idunit_kerja` (`idunit_kerja`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Foreign key` (`idkelurahan`);

--
-- Indexes for table `periksa`
--
ALTER TABLE `periksa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pasien_id` (`pasien_id`),
  ADD KEY `dokter_id` (`dokter_id`);

--
-- Indexes for table `unit_kerja`
--
ALTER TABLE `unit_kerja`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kelurahan`
--
ALTER TABLE `kelurahan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `paramedik`
--
ALTER TABLE `paramedik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pasien`
--
ALTER TABLE `pasien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `periksa`
--
ALTER TABLE `periksa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `unit_kerja`
--
ALTER TABLE `unit_kerja`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `paramedik`
--
ALTER TABLE `paramedik`
  ADD CONSTRAINT `paramedik_ibfk_1` FOREIGN KEY (`idunit_kerja`) REFERENCES `unit_kerja` (`id`);

--
-- Constraints for table `pasien`
--
ALTER TABLE `pasien`
  ADD CONSTRAINT `Foreign key` FOREIGN KEY (`idkelurahan`) REFERENCES `kelurahan` (`id`);

--
-- Constraints for table `periksa`
--
ALTER TABLE `periksa`
  ADD CONSTRAINT `periksa_ibfk_1` FOREIGN KEY (`pasien_id`) REFERENCES `pasien` (`id`),
  ADD CONSTRAINT `periksa_ibfk_2` FOREIGN KEY (`dokter_id`) REFERENCES `paramedik` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
