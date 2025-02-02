-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 30, 2025 at 08:42 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `borangdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `butiran_kuliah`
--

CREATE TABLE `butiran_kuliah` (
  `butiran_id` int(11) NOT NULL,
  `pengecualian_id` int(11) NOT NULL,
  `tarikh` date NOT NULL,
  `hari` varchar(50) NOT NULL,
  `masa` varchar(50) NOT NULL,
  `kod_kursus` varchar(50) NOT NULL,
  `nama_pensyarah` varchar(50) NOT NULL,
  `tandatangan` varchar(100) NOT NULL,
  `nota` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `butiran_kuliah`
--

INSERT INTO `butiran_kuliah` (`butiran_id`, `pengecualian_id`, `tarikh`, `hari`, `masa`, `kod_kursus`, `nama_pensyarah`, `tandatangan`, `nota`) VALUES
(7, 11, '2025-01-30', 'KHAMIS', '10:00', 'IMS566', 'SIR FAIZAL', 'sirfaizal', 'TIADA'),
(8, 12, '2025-01-02', 'RABU', '09:00', 'IMS560', 'SIR SHAUQI', 'sirshauqi', 'TIADA');

-- --------------------------------------------------------

--
-- Table structure for table `keputusan`
--

CREATE TABLE `keputusan` (
  `keputusan_id` int(11) NOT NULL,
  `ulasan` text NOT NULL,
  `tandatangan_cop` int(11) NOT NULL,
  `tarikh_ulasan` date NOT NULL,
  `status_keputusan` enum('LULUS','TIDAK LULUS','','') NOT NULL,
  `tindakan` text NOT NULL,
  `tarikh_keputusan` date NOT NULL,
  `pengecualian_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `keputusan`
--

INSERT INTO `keputusan` (`keputusan_id`, `ulasan`, `tandatangan_cop`, `tarikh_ulasan`, `status_keputusan`, `tindakan`, `tarikh_keputusan`, `pengecualian_id`) VALUES
(23, 'GOODLUCK', 0, '2025-01-30', 'LULUS', 'BERIKAN KEPADA PENSYARAH', '2025-01-30', 11),
(24, 'GOODLUCK', 0, '2025-01-30', 'LULUS', 'BERIKAN KEPADA PENSYARAH', '2025-01-30', 11),
(25, 'BUAT PERSEDIAAN AWAL', 0, '2025-01-02', 'LULUS', 'JANGAN LUPA STUDY', '2025-01-02', 12);

-- --------------------------------------------------------

--
-- Table structure for table `maklumat_pelajar`
--

CREATE TABLE `maklumat_pelajar` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `pelajar_id` varchar(50) NOT NULL,
  `nokp` varchar(20) NOT NULL,
  `kodprogram` varchar(50) NOT NULL,
  `bhg` varchar(50) NOT NULL,
  `nohp` varchar(20) NOT NULL,
  `norumah` varchar(20) NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `maklumat_pelajar`
--

INSERT INTO `maklumat_pelajar` (`id`, `name`, `pelajar_id`, `nokp`, `kodprogram`, `bhg`, `nohp`, `norumah`, `gambar`, `created_at`) VALUES
(2, 'AMY HAIKAL BIN ROSLI', '2024158761', '100000', 'CDIM262', '4B', '019444444', '000000', '1738217795_amy.png', '2025-01-30 06:16:35'),
(3, 'NUR ALEEYA FAZLYIANIE BINTI AHMAD MOHTAR', '2024745835', '200000', 'CDIM262', '4B', '123123', '123123', '1738218533_aleya.png', '2025-01-30 06:28:53');

-- --------------------------------------------------------

--
-- Table structure for table `pengecualian`
--

CREATE TABLE `pengecualian` (
  `pengecualian_id` int(11) NOT NULL,
  `pelajar_id` int(11) NOT NULL,
  `mula` date NOT NULL,
  `tamat` date NOT NULL,
  `bil_hari` int(3) NOT NULL,
  `sebab` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pengecualian`
--

INSERT INTO `pengecualian` (`pengecualian_id`, `pelajar_id`, `mula`, `tamat`, `bil_hari`, `sebab`) VALUES
(11, 2024158761, '2025-01-30', '2025-01-31', 1, 'EVENT LUAR KAMPUS'),
(12, 2024745835, '2025-01-01', '2025-01-04', 4, 'SUKAN WAKIL UNIVERSITI');

-- --------------------------------------------------------

--
-- Table structure for table `signup`
--

CREATE TABLE `signup` (
  `name` varchar(50) NOT NULL,
  `pelajar_id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `signup`
--

INSERT INTO `signup` (`name`, `pelajar_id`, `email`, `password`, `status`) VALUES
('AMY HAIKAL BIN ROSLI', 2024158761, 'amy@gmail.com', 'amy', 'USER'),
('NUR ALEEYA FAZLYIANIE BINTI AHMAD MOHTAR', 2024745835, 'aleya@gmail.com', 'aleya', 'USER'),
('SYAFIQ BIN AHMAD ASRI', 2024794987, 'syafiqahmadasri@gmail.com', 'admin', 'ADMIN');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `butiran_kuliah`
--
ALTER TABLE `butiran_kuliah`
  ADD PRIMARY KEY (`butiran_id`),
  ADD KEY `pengecualian_id` (`pengecualian_id`);

--
-- Indexes for table `keputusan`
--
ALTER TABLE `keputusan`
  ADD PRIMARY KEY (`keputusan_id`),
  ADD KEY `fk` (`pengecualian_id`);

--
-- Indexes for table `maklumat_pelajar`
--
ALTER TABLE `maklumat_pelajar`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pelajar_id` (`pelajar_id`),
  ADD UNIQUE KEY `nokp` (`nokp`);

--
-- Indexes for table `pengecualian`
--
ALTER TABLE `pengecualian`
  ADD PRIMARY KEY (`pengecualian_id`),
  ADD KEY `foreign key` (`pelajar_id`);

--
-- Indexes for table `signup`
--
ALTER TABLE `signup`
  ADD PRIMARY KEY (`pelajar_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `butiran_kuliah`
--
ALTER TABLE `butiran_kuliah`
  MODIFY `butiran_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `keputusan`
--
ALTER TABLE `keputusan`
  MODIFY `keputusan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `maklumat_pelajar`
--
ALTER TABLE `maklumat_pelajar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pengecualian`
--
ALTER TABLE `pengecualian`
  MODIFY `pengecualian_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `butiran_kuliah`
--
ALTER TABLE `butiran_kuliah`
  ADD CONSTRAINT `butiran_kuliah_ibfk_1` FOREIGN KEY (`pengecualian_id`) REFERENCES `pengecualian` (`pengecualian_id`);

--
-- Constraints for table `keputusan`
--
ALTER TABLE `keputusan`
  ADD CONSTRAINT `fk` FOREIGN KEY (`pengecualian_id`) REFERENCES `pengecualian` (`pengecualian_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pengecualian`
--
ALTER TABLE `pengecualian`
  ADD CONSTRAINT `foreign key` FOREIGN KEY (`pelajar_id`) REFERENCES `signup` (`pelajar_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
