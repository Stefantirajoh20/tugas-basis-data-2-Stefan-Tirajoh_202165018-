-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 13, 2023 at 03:05 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `data_jual`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `kode_brg` varchar(50) NOT NULL,
  `no_jual` varchar(50) DEFAULT NULL,
  `nama_brg` varchar(50) DEFAULT NULL,
  `harga` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id_customer` varchar(50) NOT NULL,
  `nama_customer` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `detail_penjualan_brg`
--

CREATE TABLE `detail_penjualan_brg` (
  `no_jual` varchar(50) DEFAULT NULL,
  `kode_brg` varchar(50) NOT NULL,
  `qty_jual` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `penjualan_brg`
--

CREATE TABLE `penjualan_brg` (
  `no_jual` varchar(50) DEFAULT NULL,
  `tgl_jual` varchar(50) DEFAULT NULL,
  `id_customer` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`kode_brg`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id_customer`);

--
-- Indexes for table `detail_penjualan_brg`
--
ALTER TABLE `detail_penjualan_brg`
  ADD PRIMARY KEY (`kode_brg`),
  ADD KEY `no_jual` (`no_jual`);

--
-- Indexes for table `penjualan_brg`
--
ALTER TABLE `penjualan_brg`
  ADD PRIMARY KEY (`id_customer`),
  ADD KEY `no_jual` (`no_jual`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `barang_ibfk_1` FOREIGN KEY (`kode_brg`) REFERENCES `detail_penjualan_brg` (`kode_brg`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`id_customer`) REFERENCES `penjualan_brg` (`id_customer`);

--
-- Constraints for table `penjualan_brg`
--
ALTER TABLE `penjualan_brg`
  ADD CONSTRAINT `penjualan_brg_ibfk_1` FOREIGN KEY (`no_jual`) REFERENCES `detail_penjualan_brg` (`no_jual`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
