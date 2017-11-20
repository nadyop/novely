-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 03, 2017 at 12:09 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.5.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cias`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_items`
--

CREATE TABLE `tbl_items` (
  `itemId` int(11) NOT NULL,
  `itemHeader` varchar(512) NOT NULL COMMENT 'Heading',
  `itemSub` varchar(1021) NOT NULL COMMENT 'sub heading',
  `itemDesc` text COMMENT 'content or description',
  `itemImage` varchar(80) DEFAULT NULL,
  `isDeleted` tinyint(4) NOT NULL DEFAULT '0',
  `createdBy` int(11) NOT NULL,
  `createdDtm` datetime NOT NULL,
  `updatedDtm` datetime DEFAULT NULL,
  `updatedBy` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_items`
--

INSERT INTO `tbl_items` (`itemId`, `itemHeader`, `itemSub`, `itemDesc`, `itemImage`, `isDeleted`, `createdBy`, `createdDtm`, `updatedDtm`, `updatedBy`) VALUES
(1, 'jquery.validation.js', 'Contribution towards jquery.validation.js', 'jquery.validation.js is the client side javascript validation library authored by Jörn Zaefferer hosted on github for us and we are trying to contribute to it. Working on localization now', 'validation.png', 0, 1, '2015-09-02 00:00:00', NULL, NULL),
(2, 'CodeIgniter User Management', 'Demo for user management system', 'This the demo of User Management System (Admin Panel) using CodeIgniter PHP MVC Framework and AdminLTE bootstrap theme. You can download the code from the repository or forked it to contribute. Usage and installation instructions are provided in ReadMe.MD', 'cias.png', 0, 1, '2015-09-02 00:00:00', NULL, NULL);

--
-- Struktur dari tabel `tbl_kurir`
--

CREATE TABLE `tbl_kurir` (
  `id_kurir` int(11) NOT NULL,
  `nama_kurir` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_kurir`
--

INSERT INTO `tbl_kurir` (`id_kurir`, `nama_kurir`) VALUES
(1, 'JNE_OK'),
(2, 'JNE_YES'),
(3, 'JNE_REGULER');

-- --------------------------------------------------------
--
-- Struktur dari tabel `tbl_novel`
--

CREATE TABLE `tbl_novel` (
  `id_novel` int(11) NOT NULL,
  `gambar` varchar(50) NOT NULL,
  `nama_novel` varchar(255) NOT NULL,
  `pengarang` varchar(255) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_novel`
--

INSERT INTO `tbl_novel` (`id_novel`, `gambar`, `nama_novel`, `pengarang`, `harga`) VALUES
(1, 'hujan.jpg', 'Hujan', 'Tere Liye', 57800),
(2, '', 'Rentang Kisah', 'Gita Savitri', 61700),
(3, '', 'After Met You', 'Dwitasaridwita', 63600),
(4, '', 'Anak Rantau', 'A.Fuadi', 72000),
(5, '', 'Filosofi Kopi', 'Dee Lestari', 45900),
(6, '', 'Keluarga Tak Kasat Mata', 'Bonaventura Genta', 47300),
(7, '', 'Radikus Makankakus', 'Raditya Dika', 53500),
(8, '', 'Matahari', 'Tere Liye', 74800),
(9, '', 'Catatan Juang', 'Fiersa Besari', 60000),
(10, '', 'Origin', 'Dan Brown', 160600),
(11, '', 'My Devil Butler', 'Queen Nakey', 79600),
(12, '', 'Cold Hearts', 'Bels', 61600),
(13, '', 'Rushing', 'Kammora', 63700),
(14, '', 'Ayah', 'Andrea Hirata', 50000),
(15, '', 'Harry Potter #1: Harry Potter dan Batu Bertuah', 'J.K Rowling', 40000),
(16, '', 'Harry Potter #2: CHAMBER OF SECRETS', 'J.K Rowling', 58000),
(17, '', 'Harry Potter #3: Harry Potter dan Tawanan Azkaban', 'J.K Rowling', 55000),
(18, '', 'Harry Potter #4: Harry Potter dan Piala Api', 'J.K Rowling', 85000),
(19, '', 'Harry Potter #5: Harry Potter and the Order of the Phoenix', 'J.K Rowling', 130000),
(20, '', 'Harry Potter #6: Harry Potter dan Pangeran Berdarah Campuran', 'J.K Rowling', 125000),
(21, '', 'Harry Potter #7: Harry Potter dan Relikui Kematian', 'J.K Rowling', 200000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_pembeli`
--

--
-- Struktur dari tabel `tbl_post`
--

CREATE TABLE IF NOT EXISTS `tbl_post` (
`id_post` int(11) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `isi` varchar(255) NOT NULL,
  `gambar` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_post`
--

INSERT INTO `tbl_post` (`id_post`, `judul`, `isi`, `gambar`, `created_at`, `update_at`) VALUES
(1, 'Keluarga Tak Kasat Mata', 'Pengarang : Genta \\n Harga Rp 55.000,-', '', '2017-11-20 10:27:28', '0000-00-00 00:00:00'),
(2, 'Filosofi Kopi', 'Pengarang : DEE Lestari\r\nHarga : Rp 46.000,-', '', '2017-11-20 10:28:32', '0000-00-00 00:00:00');

-- ---------------------------------------------------------

CREATE TABLE `tbl_pembeli` (
  `id_pembeli` int(11) NOT NULL,
  `nama_pembeli` varchar(255) NOT NULL,
  `email_pembeli` varchar(50) NOT NULL,
  `telepon_pembeli` char(12) NOT NULL,
  `alamat_pembeli` varchar(255) NOT NULL,
  `provinsi` varchar(50) NOT NULL,
  `kota` varchar(255) NOT NULL,
  `kode_pos` char(10) NOT NULL,
  `kurir` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_pembeli`
--

INSERT INTO `tbl_pembeli` (`id_pembeli`, `nama_pembeli`, `email_pembeli`, `telepon_pembeli`, `alamat_pembeli`, `provinsi`, `kota`, `kode_pos`, `kurir`, `created_at`, `updated_at`) VALUES
(1, 'Diana', 'mardiana.dwi.m@mail.ugm.ac.id', '081231992632', 'Jl.C.Simanjuntak GkV/79A', 'D.I.Yogyakarta', 'Yogyakarta', '55223', '1', '2017-11-20 03:57:13', '0000-00-00 00:00:00'),
(2, 'Nadya', 'nadyaprabaningrum@gmail.com', '085712939029', 'Jalan Soragan', 'DIY', 'Bantul', '55182', '2', '2017-11-20 03:59:58', '0000-00-00 00:00:00');

-- --------------------------------------------------------
--
-- Table structure for table `tbl_reset_password`
--

CREATE TABLE `tbl_reset_password` (
  `id` bigint(20) NOT NULL,
  `email` varchar(128) NOT NULL,
  `activation_id` varchar(32) NOT NULL,
  `agent` varchar(512) NOT NULL,
  `client_ip` varchar(32) NOT NULL,
  `isDeleted` tinyint(4) NOT NULL DEFAULT '0',
  `createdBy` bigint(20) NOT NULL DEFAULT '1',
  `createdDtm` datetime NOT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedDtm` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_roles`
--

CREATE TABLE `tbl_roles` (
  `roleId` tinyint(4) NOT NULL COMMENT 'role id',
  `role` varchar(50) NOT NULL COMMENT 'role text'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_roles`
--

INSERT INTO `tbl_roles` (`roleId`, `role`) VALUES
(1, 'System Administrator'),
(2, 'Manager'),
(3, 'Employee');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `userId` int(11) NOT NULL,
  `email` varchar(128) NOT NULL COMMENT 'login email',
  `password` varchar(128) NOT NULL COMMENT 'hashed login password',
  `name` varchar(128) DEFAULT NULL COMMENT 'full name of user',
  `mobile` varchar(20) DEFAULT NULL,
  `roleId` tinyint(4) NOT NULL,
  `isDeleted` tinyint(4) NOT NULL DEFAULT '0',
  `createdBy` int(11) NOT NULL,
  `createdDtm` datetime NOT NULL,
  `updatedBy` int(11) DEFAULT NULL,
  `updatedDtm` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`userId`, `email`, `password`, `name`, `mobile`, `roleId`, `isDeleted`, `createdBy`, `createdDtm`, `updatedBy`, `updatedDtm`) VALUES
(1, 'admin@codeinsect.com', '$2y$10$WQQRBQDkxV/98bqK.24Dp.uMVS6KcztVqdwwTrOBLIWLSeSqE2gii', 'System Administrator', '9890098900', 1, 0, 0, '2015-07-01 18:56:49', 1, '2017-03-03 12:08:39'),
(2, 'manager@codeinsect.com', '$2y$10$quODe6vkNma30rcxbAHbYuKYAZQqUaflBgc4YpV9/90ywd.5Koklm', 'Manager', '9890098900', 2, 0, 1, '2016-12-09 17:49:56', 1, '2017-02-10 17:23:53'),
(3, 'employee@codeinsect.com', '$2y$10$M3ttjnzOV2lZSigBtP0NxuCtKRte70nc8TY5vIczYAQvfG/8syRze', 'Employee', '9890098900', 3, 0, 1, '2016-12-09 17:50:22', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_items`
--
ALTER TABLE `tbl_items`
  ADD PRIMARY KEY (`itemId`);

--
-- Indexes for table `tbl_reset_password`
--
ALTER TABLE `tbl_reset_password`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_roles`
--
ALTER TABLE `tbl_roles`
  ADD PRIMARY KEY (`roleId`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_items`
--
ALTER TABLE `tbl_items`
  MODIFY `itemId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tbl_reset_password`
--
ALTER TABLE `tbl_reset_password`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `tbl_roles`
--
ALTER TABLE `tbl_roles`
  MODIFY `roleId` tinyint(4) NOT NULL AUTO_INCREMENT COMMENT 'role id', AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
