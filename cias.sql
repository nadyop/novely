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
(1, '14.jpg', 'Hujan', 'Tere Liye', 57800),
(2, '20.jpg', 'Rentang Kisah', 'Gita Savitri', 61700),
(3, '1.png', 'After Met You', 'Dwitasaridwita', 63600),
(4, '2.jpg', 'Anak Rantau', 'A.Fuadi', 72000),
(5, '6.jpg', 'Filosofi Kopi', 'Dee Lestari', 45900),
(6, '15.jpg', 'Keluarga Tak Kasat Mata', 'Bonaventura Genta', 55000),
(7, '19.jpg', 'Radikus Makankakus', 'Raditya Dika', 53500),
(8, '16.jpg', 'Matahari', 'Tere Liye', 74800),
(9, '4.jpg', 'Catatan Juang', 'Fiersa Besari', 60000),
(10, '18.jpg', 'Origin', 'Dan Brown', 160600),
(11, '17.jpg', 'My Devil Butler', 'Queen Nakey', 79600),
(12, '5.jpg', 'Cold Hearts', 'Bels', 61600),
(13, '21.jpg', 'Rushing', 'Kammora', 63700),
(14, '3.jpg', 'Ayah', 'Andrea Hirata', 50000),
(15, '7.jpg', 'Harry Potter #1: Harry Potter dan Batu Bertuah', 'J.K Rowling', 40000),
(16, '8.jpg', 'Harry Potter #2: CHAMBER OF SECRETS', 'J.K Rowling', 58000),
(17, '9.jpg', 'Harry Potter #3: Harry Potter dan Tawanan Azkaban', 'J.K Rowling', 55000),
(18, '10.jpg', 'Harry Potter #4: Harry Potter dan Piala Api', 'J.K Rowling', 85000),
(19, '11.jpg', 'Harry Potter #5: Harry Potter and the Order of the Phoenix', 'J.K Rowling', 130000),
(20, '12.jpg', 'Harry Potter #6: Harry Potter dan Pangeran Berdarah Campuran', 'J.K Rowling', 125000),
(21, '13.jpg', 'Harry Potter #7: Harry Potter dan Relikui Kematian', 'J.K Rowling', 200000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_pembeli`
--
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
  `latittude` varchar(20) NOT NULL,
  `longitude` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_pembeli`
--

INSERT INTO `tbl_pembeli` (`id_pembeli`, `nama_pembeli`, `email_pembeli`, `telepon_pembeli`, `alamat_pembeli`, `provinsi`, `kota`, `kode_pos`, `kurir`, `latittude`, `longitude`, `created_at`, `updated_at`) VALUES
(1, 'Mardiana', 'mardiana@gmail.com', '08123456789', 'Jl. Jend. Sudirman No.Kav 44-46, RT.13/RW.1, Bendungan Hilir, Kota Jakarta Pusat, Jakarta 10210', 'DKI Jakarta', 'Jakarta Pusat', '10210', '1', '106.8122026', '-6.2167335', '2017-11-21 03:32:10', '0000-00-00 00:00:00'),
(2, 'Nadya', 'nadya@gmail.com', '08123456789', 'Jalan Professor Doktor Satrio Kav. 18, RT.14/RW.4, Karet Kuningan, Setiabudi, Karet Kuningan, Setia Budi, Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta 12940', 'DKI Jakarta', 'Jakarta Selatan', '12940', '2', '106.8122026', '-6.2167335', '2017-11-21 03:39:08', '0000-00-00 00:00:00'),
(3, 'Abdur', 'abdur@gmail.com', '08123456789', 'Masjid Jami Al-Kautsar Domas - Domas, Pontang, Serang, Banten 42192', 'DKI Jakarta', 'Banten', '42192', '3', '106.265332', '-5.9909625', '2017-11-21 03:39:08', '0000-00-00 00:00:00'),
(4, 'Bastian', 'bastian@gmail.com', '08123456789', 'Jl. Ki Penjawi No.17, Prenggan, Kotagede, Kota Yogyakarta, Daerah Istimewa Yogyakarta 55172', 'DIY', 'Yogyakarta', '55172', '1', '110.3917008', '-7.8136253', '2017-11-21 03:39:08', '0000-00-00 00:00:00'),
(5, 'Hilmawan', 'hilmawan@gmail.com', '08123456789', 'Jl. Jakarta, Loa Bakung, Sungai Kunjang, Kota Samarinda, Kalimantan Timur 75129', 'Kalimantan', 'Samarinda', '75129', '2', '117.0912021', '-0.4959095', '2017-11-21 03:50:03', '0000-00-00 00:00:00'),
(6, 'Mardiana', 'mardiana@gmail.com', '08123456789', 'Jl.Jend.Urip Sumoharjo, No. 62, Purworejo, Kec. Purworejo, Kabupaten Purworejo, Jawa Tengah 67171', 'Jawa Tengah', 'Purworejo', '67171', '3', '110.0114778', '-7.7098884', '2017-11-21 03:50:03', '0000-00-00 00:00:00'),
(7, 'Nadya', 'nadya@gmail.com', '08123456789', 'Jl. Palasari No.9A, Lkr. Sel., Lengkong, Kota Bandung, Jawa Barat 40262', 'Jawa Barat', 'Bandung', '40262', '1', '107.6173577', '-6.9298013', '2017-11-21 03:50:03', '0000-00-00 00:00:00'),
(8, 'Abdur', 'abdur@gmail.com', '08123456789', 'Tegalsari, Walantaka, Kota Serang, Banten 42183', 'DKI Jakarta', 'Banten', '42183', '2', '106.2034855', '-6.1483576', '2017-11-21 03:50:03', '0000-00-00 00:00:00'),
(9, 'Bastian', 'bastian@gmail.com', '08123456789', 'JL. Memet Sastrowiryo, Komplek TNI-AL Kenjeran, Komp. Kenjeran, Bulak, Kota SBY, Jawa Timur 60121', 'Jawa Timur', 'Surabaya', '60121', '3', '112.6429649', '-7.2815652', '2017-11-21 03:50:03', '0000-00-00 00:00:00'),
(10, 'Hilmawan', 'hilmawan@gmail.com', '08123456789', 'Jl. Cik Di Tiro No.5 · (0274) 550380', 'DIY', 'Yogyakarta', '55038', '1', '110.3726973', '-7.780782', '2017-11-21 03:50:03', '0000-00-00 00:00:00'),
(11, 'Mardiana', 'mardiana@gmail.com', '08123456789', 'JL. Besar, Merbau, Mengkopot, Rantauprapat, Kabupaten Kepulauan Meranti, Riau 28752', 'Riau', 'Kepulauan Riau', '28752', '2', '102.4057813', '1.170992', '2017-11-21 04:11:54', '0000-00-00 00:00:00'),
(12, 'Nadya', 'nadya@gmail.com', '08123456789', 'JL. Sumatera, 15, Madiun Lor, Madiun, Kota Madiun, Jawa Timur 63122', 'Jawa Timur', 'Madiun', '63122', '3', '111.5210686', '-7.6214219', '2017-11-21 04:11:54', '0000-00-00 00:00:00'),
(13, 'Abdur', 'abdur@gmail.com', '08123456789', 'Jalan Jenderal Sudirman KM. 10, No. 38, Rendeng, Jekulo, Klaling, Jekulo, Kabupaten Kudus, Jawa Tengah 59311', 'Jawa Tengah', 'Kudus', '59311', '1', '110.8042807', '-6.77857', '2017-11-21 04:11:54', '0000-00-00 00:00:00'),
(14, 'Bastian', 'bastian@gmail.com', '08123456789', 'Gedung YKKPT Lantai Dasar, Jalan Kwitang Raya No. 21, Kwitang, Senen, RT.1/RW.4, Kwitang, Senen, Kota Jakarta Pusat, Daerah Khusus Ibukota Jakarta 10340', 'DKI Jakarta', 'Jakarta Pusat', '10340', '2', '106.833465', '6.1823366', '2017-11-21 04:11:54', '0000-00-00 00:00:00'),
(15, 'Hilmawan', 'hilmawan@gmail.com', '08123456789', 'Jalan Jendral Gatot Subroto No.Kav 31, Bendungan Hilir, Tanah Abang, RT.14/RW.5, Bend. Hilir, Tanah Abang, Kota Jakarta Pusat, Daerah Khusus Ibukota Jakarta 10210', 'DKI Jakarta', 'Jakarta Pusat', '10210', '3', '106.8004393', '-6.2057778', '2017-11-21 04:11:54', '0000-00-00 00:00:00'),
(16, 'Mardiana', 'mardiana@gmail.com', '08123456789', '(Jl. Kol Sugiono Rt 09 Rw 02 No. 10 A Pati), Jl. Raya Pati, Winong, Pati Sub-District, Pati Regency, Central Java 59118', 'Jawa Tengah', 'Pati', '59118', '1', '110.9296311', '-6.7459239', '2017-11-21 04:11:54', '0000-00-00 00:00:00'),
(17, 'Nadya', 'nadya@gmail.com', '08123456789', 'Jl. Babarsari No.5, Caturtunggal, Kec. Depok, Kabupaten Sleman, Daerah Istimewa Yogyakarta 55281', 'D.I.Yogyakarta', 'Yogyakarta', '55281', '2', '110.4117463', '-7.782545', '2017-11-21 04:11:54', '0000-00-00 00:00:00'),
(18, 'Abdur', 'abdur@gmail.com', '08123456789', 'Jl. Karang Tengah - Cigunung Agung, Karangtengah, Kadungora, Kabupaten Garut, Jawa Barat 44153', 'Jawa Barat', 'Garut', '44153', '3', '107.8943638', '-7.0768633', '2017-11-21 04:11:54', '0000-00-00 00:00:00'),
(19, 'Bastian', 'bastian@gmail.com', '08123456789', 'Jl. Dermojoyo, Payaman, Kec. Nganjuk, Kabupaten Nganjuk, Jawa Timur 64412', 'Jawa Timur', 'Nganjuk', '64412', '1', '111.8922615', '-7.6268838', '2017-11-21 04:11:54', '0000-00-00 00:00:00'),
(20, 'Hilmawan', 'hilmawan@gmail.com', '08123456789', 'Jl. Winong No.9, Sudimara Tim., Ciledug, Kota Tangerang, Banten 15151', 'DKI Jakarta', 'Banten', '15151', '2', '106.5928757', ' -6.2511073', '2017-11-21 04:11:54', '0000-00-00 00:00:00');

-- --------------------------------------------------------
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
