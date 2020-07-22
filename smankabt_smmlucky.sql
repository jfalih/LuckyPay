-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 22, 2020 at 11:32 AM
-- Server version: 10.3.23-MariaDB-log-cll-lve
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smankabt_smmlucky`
--

-- --------------------------------------------------------

--
-- Table structure for table `beritas`
--

CREATE TABLE `beritas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','not_active') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `beritas`
--

INSERT INTO `beritas` (`id`, `title`, `keterangan`, `status`, `created_at`, `updated_at`) VALUES
(5, 'Informasi', 'Jika Ada Trouble Oleh Services Silahkan Hubungin Langsung Ke Cs Melalui Wa Maupun Telegram Kita Supaya Services Tdk Kebanyakan Terus Menurus.', 'active', '2020-06-30 21:30:56', '2020-06-30 21:30:56'),
(6, 'Informasi', 'Asalamualaikum Warohmatuallahi Wabarokatu \r\n\r\n Berikut Merupakan Deposit Kita Yang Open Saat Ini Kak\r\n\r\nOtomatis\r\n- GoPay\r\n- Ovo\r\n- Bank Mandiri\r\n\r\nManual\r\n- Dana ( Secepetnya Bakal Kita Open Otomatisnya Ya Kak )\r\n\r\nJika Ada Layanan Yang Lebih Murah Untuk Sosmed Silahkan Laporan Ke Ticket Maupun Owener Ya Kak Supaya Di Kondisikan Langsung', 'active', '2020-07-16 07:16:27', '2020-07-16 07:16:27'),
(7, 'Informasi', 'Hallo Untuk Saat Ini Deposit Via Mandiri Kita Alihkan Manual Ya Silahkan Di Cek Kembali. Semoga Anda Puas Bersama Server Kami^_^', 'active', '2020-07-19 05:24:37', '2020-07-19 05:24:37');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `template` enum('pulsa','sosmed','pln') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','not_active') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `icon`, `slug`, `template`, `status`, `created_at`, `updated_at`) VALUES
(9, 'Social Media', 'feather icon-instagram', 'social-media', 'sosmed', 'active', '2020-07-18 01:38:00', '2020-07-18 01:38:00'),
(10, 'Pulsa Reguler', 'fa fa-mobile', 'pulsa-reguler', 'pulsa', 'active', '2020-06-14 18:30:40', '2020-06-21 20:59:53'),
(11, 'Paket Internet', 'feather icon-globe', 'paket-internet', 'pln', 'active', '2020-06-16 21:59:09', '2020-07-17 21:30:34'),
(12, 'Paket Sms', 'fa fa-envelope-square', 'paket-sms', 'pulsa', 'active', '2020-06-16 22:09:03', '2020-06-21 21:26:43'),
(13, 'Paket Telepon', 'feather icon-phone-call', 'paket-telepon', 'pulsa', 'active', '2020-06-16 22:10:18', '2020-06-21 21:29:18'),
(15, 'Saldo E-Money', 'feather icon-cast', 'saldo-emony', 'pln', 'active', '2020-06-16 22:34:09', '2020-06-25 02:49:14'),
(16, 'Voucher Game', 'fa fa-gamepad', 'game-garena', 'pln', 'active', '2020-06-16 22:39:28', '2020-06-25 02:44:05'),
(25, 'Token PLN', 'fa fa-lightbulb-o', 'token-pln', 'pln', 'active', '2020-06-21 01:10:43', '2020-06-25 02:50:13'),
(28, 'Games Fiture', 'fa fa-gamepad', 'games-fiture', 'pln', 'active', '2020-07-16 08:55:56', '2020-07-16 08:55:56');

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `rate` float NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `atas_nama` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `min` int(11) NOT NULL,
  `rekening` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','not_active') COLLATE utf8mb4_unicode_ci NOT NULL,
  `jenis` enum('otomatis','manual') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `deposits`
--

INSERT INTO `deposits` (`id`, `rate`, `image`, `atas_nama`, `min`, `rekening`, `code`, `name`, `status`, `jenis`, `created_at`, `updated_at`) VALUES
(7, 1, 'ovo.jpeg', 'MHD. YUSUF', 10000, '081374655989', 'OVO', 'OVO', 'active', 'otomatis', '2020-06-14 07:37:42', '2020-06-14 07:37:42'),
(8, 1, 'GOPAY.jpeg', 'RIKO SUSANTO', 10000, '081374655989', 'GOPAY', 'GOPAY', 'active', 'otomatis', '2020-06-14 07:40:48', '2020-06-14 07:40:48'),
(9, 1, 'mandiri.jpeg', 'Jangkung Prastia', 10000, '108-00-1666654-8', 'Mndri', 'Mandiri Online', 'active', 'otomatis', '2020-06-26 08:46:58', '2020-06-26 08:46:58'),
(10, 1, 'dana.jpeg', 'RIKO SUSANTO', 10000, '081374655989', 'dana', 'Dana', 'active', 'manual', '2020-07-13 05:27:33', '2020-07-13 05:27:33');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `histories`
--

CREATE TABLE `histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `service_id` bigint(20) UNSIGNED NOT NULL,
  `trx_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sn` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `target` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `status` enum('pending','error','processing','refund','partial','success','canceled') COLLATE utf8mb4_unicode_ci NOT NULL,
  `refund` enum('NO','YES') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'NO',
  `start_count` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remains` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `via` enum('web','api') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'web',
  `date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `histories`
--

INSERT INTO `histories` (`id`, `user_id`, `service_id`, `trx_id`, `sn`, `quantity`, `target`, `price`, `status`, `refund`, `start_count`, `remains`, `via`, `date`, `created_at`, `updated_at`) VALUES
(104, 1, 20, 'FYxFGnS0CxxRWXWGa6P00DCPmCnxIV', '', 1, '813746559', 1700, 'canceled', 'YES', NULL, NULL, 'web', '2020-06-17', '2020-06-17 03:23:46', '2020-06-18 01:03:30'),
(115, 56, 20, 'c8bfuuUGLiY0V7XiKHCYfa8dT8tWSv', '10233072295604080520200618082358', 1, '85156040805', 1700, 'success', 'NO', NULL, NULL, 'web', '2020-06-17', '2020-06-17 12:01:55', '2020-06-17 22:34:55'),
(116, 1, 20, 'WX4keIluG7MbASUm4GHVVmA511kMJJ', 'Transaksi Gagal', 1, '81374655', 1700, 'canceled', 'YES', NULL, NULL, 'web', '2020-06-18', '2020-06-17 22:49:04', '2020-06-18 01:41:46'),
(120, 56, 79, 'BaUDWQA2XWe0GWwiqM0m7yJhaQt9RY', 'TKXL0618167492', 1, '85947594453', 49200, 'success', 'NO', NULL, NULL, 'web', '2020-06-18', '2020-06-18 04:37:11', '2020-06-19 02:47:21'),
(121, 25, 36, 'aEjbfDvwgkHc4CyFZJluNx1PzvuNqk', '51003790746882', 1, '82175469903', 10335, 'success', 'NO', NULL, NULL, 'web', '2020-06-18', '2020-06-18 04:55:19', '2020-06-19 02:47:21'),
(126, 54, 111, '3RILbao9Hdp7RUPusWw9gkQIWxaa2i', 'Transaksi Gagal', 1, '85694934078', 96820, 'canceled', 'YES', NULL, NULL, 'web', '2020-06-18', '2020-06-18 10:05:21', '2020-06-19 03:00:12'),
(130, 25, 37, 'Vp07v4XOXofSuyk8jPJmKbyLNpl6af', '01996100000025083791', 1, '82175469903', 15050, 'success', 'NO', NULL, NULL, 'web', '2020-06-19', '2020-06-18 20:15:04', '2020-06-19 02:47:21'),
(133, 41, 62, 'tnTXxpoRXFmJjJq8TQo0lKwf4QZ2UD', '806491332', 1, '8888319206', 5100, 'success', 'NO', NULL, NULL, 'web', '2020-06-19', '2020-06-19 07:49:52', '2020-06-19 07:54:04'),
(134, 54, 111, 'Q7kpR3wMO2xiVN2n1V7hViUxUFpgL3', '01996900012079473799', 1, '85694934078', 96820, 'success', 'NO', NULL, NULL, 'web', '2020-06-19', '2020-06-19 08:09:56', '2020-06-19 08:12:02'),
(141, 24, 58, 'LdyhE9pGTQCSW3sJWrH77mS7mK6nWB', '01999600000090930716', 1, '82346991009', 196200, 'success', 'NO', NULL, NULL, 'web', '2020-06-22', '2020-06-22 01:31:59', '2020-06-22 01:33:01'),
(145, 24, 47, 'zy60mSIMViBWB3jRJRy2kx3P7owGFF', '02001800000134957568', 1, '82346991009', 59250, 'success', 'NO', NULL, NULL, 'web', '2020-06-22', '2020-06-22 01:41:43', '2020-06-24 03:00:02'),
(147, 41, 64, 'atNLMJj8GTIWqQYGWlHD1vqJyNq4q1', '807210650', 1, '88214472559', 19750, 'success', 'NO', NULL, NULL, 'web', '2020-06-22', '2020-06-22 06:59:46', '2020-06-24 02:59:00'),
(148, 29, 100, 'Xfc9L9OhstBfDdifcvpdPslkzLjX51', '2013504735', 1, '85776462195', 5780, 'success', 'NO', NULL, NULL, 'web', '2020-06-22', '2020-06-22 15:33:56', '2020-06-24 02:59:01'),
(149, 29, 89, 'k5RmPM5Oozxsgke91gq3UdqQiTDSny', 'Produk Seller Sedang Tidak Tersedia', 1, '895350462090', 5325, 'canceled', 'YES', NULL, NULL, 'web', '2020-06-22', '2020-06-22 15:34:39', '2020-06-24 02:59:05'),
(153, 126, 37, 'HcRpSCfvpYpmNf2TYvCAiM4DVWnwKf', 'Nomor Tujuan Salah', 1, '81290309466', 15050, 'canceled', 'YES', NULL, NULL, 'web', '2020-06-24', '2020-06-24 03:01:40', '2020-06-24 03:02:11'),
(155, 126, 244, 'JHEXvJySAJINKr9IXpckQNH4OrbBjs', 'Nomor Tujuan Salah', 1, '81290309466', 10200, 'canceled', 'YES', NULL, NULL, 'web', '2020-06-24', '2020-06-24 03:03:53', '2020-06-26 19:01:05'),
(157, 126, 37, '41RtHXd3plaEL4czoYF1aJqgQKRhiZ', 'Transaksi sudah pernah terjadi sebelumnya', 1, '081290309466', 15050, 'canceled', 'YES', NULL, NULL, 'web', '2020-06-24', '2020-06-24 04:38:55', '2020-06-24 04:39:04'),
(158, 126, 36, 'phS1o9UDj0GV7HpRMZRbQQZwrt2sej', '51003808767171', 1, '81290309466', 10335, 'success', 'NO', NULL, NULL, 'web', '2020-06-24', '2020-06-24 05:05:47', '2020-06-24 05:13:03'),
(161, 54, 89, 'hEas3HGT6DLtrBZf31niPDleqzLyP5', '120425727960', 1, '895703096748', 5325, 'success', 'NO', NULL, NULL, 'web', '2020-06-24', '2020-06-24 05:11:21', '2020-06-24 05:12:00'),
(162, 126, 89, '3YRlWLkAhdgo8Us1rJ6lFwEqlfgV43', '120428846745', 1, '89637738771', 5325, 'success', 'NO', NULL, NULL, 'web', '2020-06-24', '2020-06-24 05:57:37', '2020-06-24 05:58:00'),
(164, 28, 244, 'IXTi4u7uo0yIbOPIRdyFsqcPJojSHh', 'Sedang Cut Off', 1, '81292193280', 10200, 'canceled', 'YES', NULL, NULL, 'web', '2020-06-24', '2020-06-24 10:17:55', '2020-06-26 19:02:05'),
(165, 56, 89, 'NcSdHNOs65uMBGBi2AlIZmQNhlQCNp', '1275913966748667904', 1, '0895344471395', 5325, 'success', 'NO', NULL, NULL, 'web', '2020-06-24', '2020-06-24 15:09:28', '2020-06-24 15:10:01'),
(166, 56, 89, 'dJJ0y3l8N9Y6Wtt9ApT9LRyEUnxqei', 'Transaksi Gagal', 1, '2.0895344471395', 5325, 'canceled', 'YES', NULL, NULL, 'web', '2020-06-24', '2020-06-24 15:09:29', '2020-06-24 15:11:09'),
(167, 56, 89, 'AP5fPniJwzCUwLlBYEGSQx8Oyl8Fqc', 'Transaksi sudah pernah terjadi sebelumnya', 1, '2.0895344471395', 5325, 'canceled', 'YES', NULL, NULL, 'web', '2020-06-24', '2020-06-24 15:09:35', '2020-06-24 15:10:08'),
(168, 56, 89, 'gSXHrp7Tc70cfrYYHVE5RYVuBlQfxb', 'Transaksi sudah pernah terjadi sebelumnya', 1, '2.0895344471395', 5325, 'canceled', 'YES', NULL, NULL, 'web', '2020-06-24', '2020-06-24 15:10:15', '2020-06-24 15:12:12'),
(169, 56, 89, 'hvx6LO0K792wBxnNQ1YFJrmjg1kd1J', 'Transaksi sudah pernah terjadi sebelumnya', 1, '2.0895344471395', 5325, 'canceled', 'YES', NULL, NULL, 'web', '2020-06-24', '2020-06-24 15:13:01', '2020-06-24 15:13:09'),
(170, 56, 89, 'zYB05kh3VytTdi7RXZhGp8LTVdqgGk', 'Transaksi sudah pernah terjadi sebelumnya', 1, '2.0895344471395', 5325, 'canceled', 'YES', NULL, NULL, 'web', '2020-06-24', '2020-06-24 15:13:04', '2020-06-24 15:14:10'),
(171, 56, 89, 'GSg0BKRZTy1T3Ghy8fNlnXo1e6Fo7T', 'Transaksi sudah pernah terjadi sebelumnya', 1, '2.0895344471395', 5325, 'canceled', 'YES', NULL, NULL, 'web', '2020-06-24', '2020-06-24 15:13:07', '2020-06-24 15:15:06'),
(172, 56, 89, 'B2020t0NfqE4FqY3u0b3vG0fp1c1by', 'Transaksi sudah pernah terjadi sebelumnya', 1, '2.0895344471395', 5325, 'canceled', 'YES', NULL, NULL, 'web', '2020-06-24', '2020-06-24 15:13:10', '2020-06-24 15:16:08'),
(173, 56, 89, 'WK2VmBlkArIxRwoj2d9Qlb4S19xFcd', 'Transaksi sudah pernah terjadi sebelumnya', 1, '2.0895344471395', 5325, 'canceled', 'YES', NULL, NULL, 'web', '2020-06-24', '2020-06-24 15:13:14', '2020-06-24 15:17:05'),
(174, 56, 89, 'iknARiD3i8DuYULQS0BWAVKfLV3IHs', 'Transaksi sudah pernah terjadi sebelumnya', 1, '2.0895344471395', 5325, 'canceled', 'YES', NULL, NULL, 'web', '2020-06-24', '2020-06-24 15:13:17', '2020-06-24 15:18:21'),
(175, 56, 89, 'Y6jNZu1GLYbUPBPXztL75e7NLSCV76', 'Transaksi sudah pernah terjadi sebelumnya', 1, '2.0895344471395', 5325, 'canceled', 'YES', NULL, NULL, 'web', '2020-06-24', '2020-06-24 15:13:20', '2020-06-24 15:19:10'),
(176, 56, 89, 'aWVfbN6boDVE8PLpADsgcgMVjTllal', 'Transaksi sudah pernah terjadi sebelumnya', 1, '2.0895344471395', 5325, 'canceled', 'YES', NULL, NULL, 'web', '2020-06-24', '2020-06-24 15:16:35', '2020-06-24 15:20:13'),
(177, 56, 89, 'UBXpOs7AV625CyRVnQRPfvLKozheAS', 'Transaksi sudah pernah terjadi sebelumnya', 1, '2.0895344471395', 5325, 'canceled', 'YES', NULL, NULL, 'web', '2020-06-24', '2020-06-24 15:16:38', '2020-06-24 15:21:11'),
(178, 56, 89, 'tKpy7cQGKP2jRMIZr4LDPRFiYMj7Zr', 'Transaksi sudah pernah terjadi sebelumnya', 1, '2.0895344471395', 5325, 'canceled', 'YES', NULL, NULL, 'web', '2020-06-24', '2020-06-24 15:16:40', '2020-06-24 15:22:04'),
(179, 56, 89, 'wNQY4xthUASNu0FiiGkvkX6abxZtAT', 'Transaksi sudah pernah terjadi sebelumnya', 1, '2.0895344471395', 5325, 'canceled', 'YES', NULL, NULL, 'web', '2020-06-24', '2020-06-24 15:16:43', '2020-06-24 15:23:04'),
(180, 56, 89, 'ObhV2WY5E7beXZOHhzqP2Z5GZO4iLJ', 'Transaksi sudah pernah terjadi sebelumnya', 1, '2.0895344471395', 5325, 'canceled', 'YES', NULL, NULL, 'web', '2020-06-24', '2020-06-24 15:16:45', '2020-06-24 15:24:20'),
(181, 56, 89, 'O0ZDoP4MpjKL2OCINGFeLG6OI2PcPK', 'Transaksi sudah pernah terjadi sebelumnya', 1, '2.0895344471395', 5325, 'canceled', 'YES', NULL, NULL, 'web', '2020-06-24', '2020-06-24 15:16:47', '2020-06-24 15:25:13'),
(182, 56, 89, 'bPY3CRzSb87aviJzDoGU9IfPv35GUP', 'Transaksi sudah pernah terjadi sebelumnya', 1, '2.0895344471395', 5325, 'canceled', 'YES', NULL, NULL, 'web', '2020-06-24', '2020-06-24 15:16:51', '2020-06-24 15:26:11'),
(183, 56, 89, 'VYr1rlb6YiXcXDmdGaeBcfW7cziChO', 'Transaksi sudah pernah terjadi sebelumnya', 1, '2.0895344471395', 5325, 'canceled', 'YES', NULL, NULL, 'web', '2020-06-24', '2020-06-24 15:16:56', '2020-06-24 15:27:11'),
(184, 56, 89, 'uig1nFtJ0qdy75e1uZzWiyKO04D14R', 'Transaksi sudah pernah terjadi sebelumnya', 1, '2.0895344471395', 5325, 'canceled', 'YES', NULL, NULL, 'web', '2020-06-24', '2020-06-24 15:16:58', '2020-06-24 15:28:09'),
(185, 56, 89, '9hPyYHhytrvXFSkBxxqQ8FNz0aHPkn', 'Transaksi sudah pernah terjadi sebelumnya', 1, '2.0895344471395', 5325, 'canceled', 'YES', NULL, NULL, 'web', '2020-06-24', '2020-06-24 15:17:01', '2020-06-24 15:29:04'),
(186, 56, 89, 'zqwZzKLMOSg6ZiYrhd729j3XOJnQ2R', 'Transaksi sudah pernah terjadi sebelumnya', 1, '2.0895344471395', 5325, 'canceled', 'YES', NULL, NULL, 'web', '2020-06-24', '2020-06-24 15:17:04', '2020-06-24 15:30:22'),
(187, 56, 89, 'aJUJU7Mz2Zf6vMwwg4aAbiAnbc6P1u', 'Transaksi sudah pernah terjadi sebelumnya', 1, '2.0895344471395', 5325, 'canceled', 'YES', NULL, NULL, 'web', '2020-06-24', '2020-06-24 15:17:06', '2020-06-24 15:31:11'),
(188, 56, 89, 'QLZimvBjpwqqMjJB7a0yCNq91vLmGC', 'Transaksi sudah pernah terjadi sebelumnya', 1, '2.0895344471395', 5325, 'canceled', 'YES', NULL, NULL, 'web', '2020-06-24', '2020-06-24 15:17:09', '2020-06-24 15:32:12'),
(189, 56, 89, 'ruLM7eRyzz6bCWg0SNgKoLMM2Qli1G', 'Transaksi sudah pernah terjadi sebelumnya', 1, '2.0895344471395', 5325, 'canceled', 'YES', NULL, NULL, 'web', '2020-06-24', '2020-06-24 15:17:11', '2020-06-24 15:33:08'),
(190, 56, 89, 'SDgCmAjh95aE8QBfDq2CCcNLSTI3Dv', 'Transaksi sudah pernah terjadi sebelumnya', 1, '2.0895344471395', 5325, 'canceled', 'YES', NULL, NULL, 'web', '2020-06-24', '2020-06-24 15:17:14', '2020-06-24 15:34:05'),
(191, 56, 89, '64cQcJlEu9Qi8nvFLHVhhk82t09eC8', 'Transaksi sudah pernah terjadi sebelumnya', 1, '2.0895344471395', 5325, 'canceled', 'YES', NULL, NULL, 'web', '2020-06-24', '2020-06-24 15:40:47', '2020-06-24 15:41:05'),
(192, 56, 89, 'ShcXEEYPrIoqwzTmg6CrFM1VVUJXoB', 'Transaksi sudah pernah terjadi sebelumnya', 1, '2.0895344471395', 5325, 'canceled', 'YES', NULL, NULL, 'web', '2020-06-24', '2020-06-24 15:40:50', '2020-06-24 15:42:19'),
(193, 56, 89, 'CpSzeowoFVgvUdh9B59boGv41BRpTn', 'Transaksi sudah pernah terjadi sebelumnya', 1, '2.0895344471395', 5325, 'canceled', 'YES', NULL, NULL, 'web', '2020-06-24', '2020-06-24 15:40:52', '2020-06-24 15:43:10'),
(194, 56, 89, 'R4ly5Eu5LqvP3pfreXTHhcZZB96NhV', 'Transaksi sudah pernah terjadi sebelumnya', 1, '2.0895344471395', 5325, 'canceled', 'YES', NULL, NULL, 'web', '2020-06-24', '2020-06-24 15:40:57', '2020-06-24 15:44:05'),
(195, 56, 89, 'hnY1LZNjE2xtY5DRALkPCdXFTw7lI8', 'Transaksi sudah pernah terjadi sebelumnya', 1, '2.0895344471395', 5325, 'canceled', 'YES', NULL, NULL, 'web', '2020-06-24', '2020-06-24 15:41:01', '2020-06-24 15:45:10'),
(196, 56, 89, 'MrgudPWqjGdRX2meEXTVdyL8o68SXG', 'Transaksi sudah pernah terjadi sebelumnya', 1, '2.0895344471395', 5325, 'canceled', 'YES', NULL, NULL, 'web', '2020-06-24', '2020-06-24 15:41:04', '2020-06-24 15:46:06'),
(197, 56, 89, 'bRAuBHl7h46hymXIAgG5XYSddP6Tc4', 'Transaksi sudah pernah terjadi sebelumnya', 1, '2.0895344471395', 5325, 'canceled', 'YES', NULL, NULL, 'web', '2020-06-24', '2020-06-24 15:41:18', '2020-06-24 15:47:05'),
(198, 56, 249, 'C66T8eW9rEGkUAAeK8NogcfCcXagTS', '200625GM11656494/DANA DNID 0895344471395', 1, '2.0895344471395', 50200, 'success', 'NO', NULL, NULL, 'web', '2020-06-24', '2020-06-24 15:51:13', '2020-06-24 15:52:01'),
(199, 56, 249, 'ZsmIY5GK6qFim1c46XIWKGBzCCRgTO', 'Transaksi sudah pernah terjadi sebelumnya', 1, '2.0895344471395', 50200, 'canceled', 'YES', NULL, NULL, 'web', '2020-06-24', '2020-06-24 15:51:15', '2020-06-26 19:03:04'),
(200, 56, 249, 'ycsxQn3ed9GiS1NEy2VAC9F6dpNA8D', 'Transaksi sudah pernah terjadi sebelumnya', 1, '2.0895344471395', 50200, 'canceled', 'YES', NULL, NULL, 'web', '2020-06-24', '2020-06-24 15:51:28', '2020-06-26 19:04:05'),
(201, 56, 249, '6acRv4mDb37G6Ld3f0MpkxldsjhET0', 'Transaksi sudah pernah terjadi sebelumnya', 1, '2.0895344471395', 50200, 'canceled', 'YES', NULL, NULL, 'web', '2020-06-24', '2020-06-24 15:52:39', '2020-06-26 19:05:05'),
(202, 56, 89, '4k03bP0BJrwvel8EbMCTMqiJiWfgVv', 'Transaksi sudah pernah terjadi sebelumnya', 1, '2.0895344471395', 5325, 'canceled', 'YES', NULL, NULL, 'web', '2020-06-24', '2020-06-24 16:20:16', '2020-06-24 16:21:12'),
(203, 56, 89, '782FsGpaeX3IiFMXXfTSpQXVXjX49V', 'Transaksi sudah pernah terjadi sebelumnya', 1, '2.0895344471395', 5325, 'canceled', 'YES', NULL, NULL, 'web', '2020-06-24', '2020-06-24 16:20:17', '2020-06-24 16:22:05'),
(204, 56, 89, 'fnMK4LprnjdFMNiwbUunuTHxFxm9SQ', 'Transaksi sudah pernah terjadi sebelumnya', 1, '2.0895344471395', 5325, 'canceled', 'YES', NULL, NULL, 'web', '2020-06-24', '2020-06-24 16:20:23', '2020-06-24 16:23:06'),
(205, 56, 89, 'D0aRYBuOLNmuv5AziYtGx0sqLZ7sgh', 'Transaksi sudah pernah terjadi sebelumnya', 1, '2.0895344471395', 5325, 'canceled', 'YES', NULL, NULL, 'web', '2020-06-24', '2020-06-24 16:20:29', '2020-06-24 16:24:18'),
(206, 56, 89, 'r4Ek33VdyJG3wP2y7jo8L100eoFSYO', 'Transaksi sudah pernah terjadi sebelumnya', 1, '2.0895344471395', 5325, 'canceled', 'YES', NULL, NULL, 'web', '2020-06-24', '2020-06-24 16:20:31', '2020-06-24 16:25:13'),
(207, 56, 89, 'nSus5GkFO1CYioR4SPUql4JPYtk1sw', 'Transaksi sudah pernah terjadi sebelumnya', 1, '2.0895344471395', 5325, 'canceled', 'YES', NULL, NULL, 'web', '2020-06-24', '2020-06-24 16:20:33', '2020-06-24 16:26:11'),
(208, 56, 89, '0XQXPF24KT5455QQqHuZxnG0ODEJbv', 'Transaksi sudah pernah terjadi sebelumnya', 1, '2.0895344471395', 5325, 'canceled', 'YES', NULL, NULL, 'web', '2020-06-24', '2020-06-24 16:20:35', '2020-06-24 16:27:10'),
(209, 56, 89, 'YPXFTyLLwkNxMSRubcrpL5dNZXVajc', 'Transaksi sudah pernah terjadi sebelumnya', 1, '2.0895344471395', 5325, 'canceled', 'YES', NULL, NULL, 'web', '2020-06-24', '2020-06-24 16:20:39', '2020-06-24 16:28:07'),
(210, 56, 89, 'jVmtGPC7PYx1TDMA2ci4xm4ocFbfT2', 'Transaksi sudah pernah terjadi sebelumnya', 1, '2.0895344471395', 5325, 'canceled', 'YES', NULL, NULL, 'web', '2020-06-24', '2020-06-24 16:20:41', '2020-06-24 16:29:04'),
(211, 56, 89, 'OVCXnpJgAodHnY8BsfEsIewchB9h5t', 'Transaksi sudah pernah terjadi sebelumnya', 1, '2.0895344471395', 5325, 'canceled', 'YES', NULL, NULL, 'web', '2020-06-24', '2020-06-24 16:20:44', '2020-06-24 16:30:12'),
(212, 56, 89, 'S81nC7hzFs5UZJfkwC6PFCH9pmNnIy', 'Transaksi sudah pernah terjadi sebelumnya', 1, '2.0895344471395', 5325, 'canceled', 'YES', NULL, NULL, 'web', '2020-06-24', '2020-06-24 16:20:46', '2020-06-24 16:31:10'),
(213, 56, 89, 'j5ntgDxKf3AqcjoTHUI9QhEG3FlgxZ', 'Transaksi sudah pernah terjadi sebelumnya', 1, '2.0895344471395', 5325, 'canceled', 'YES', NULL, NULL, 'web', '2020-06-24', '2020-06-24 16:20:49', '2020-06-24 16:32:14'),
(214, 56, 89, 'IK0WnAu1xOnXBY5uRfJyzxissnK22p', 'Transaksi sudah pernah terjadi sebelumnya', 1, '2.0895344471395', 5325, 'canceled', 'YES', NULL, NULL, 'web', '2020-06-24', '2020-06-24 16:20:51', '2020-06-24 16:33:06'),
(215, 1, 20, 'joZDQTNOHsMxmRy7IHKtJTTvoN6z5P', 'Transaksi Gagal', 1, '8518239823', 1700, 'canceled', 'YES', NULL, NULL, 'web', '2020-06-25', '2020-06-24 18:54:40', '2020-06-24 18:55:13'),
(216, 1, 33, 'i5qAPoXNetLyfTxuM8WJ2RH5fKYdkn', 'Transaksi Gagal', 1, '8518239823', 2850, 'canceled', 'YES', NULL, NULL, 'web', '2020-06-25', '2020-06-24 18:57:07', '2020-06-24 18:58:11'),
(217, 1, 89, 'ggpfjjZXBg16TU6zAWQTDbQmRIxQOy', 'Nomor Tujuan Salah', 1, '8951203912391', 5325, 'canceled', 'YES', NULL, NULL, 'web', '2020-06-25', '2020-06-24 18:59:08', '2020-06-24 19:00:21'),
(219, 21, 238, 'BF8ebHw3yRdNNip73OjdTBFvvPLY0M', '3643-9058-9448-3627-6760/ZULKIFLI/R1/1300/12,7', 1, '32162308343', 20160, 'success', 'NO', NULL, NULL, 'web', '2020-06-25', '2020-06-25 01:59:43', '2020-06-25 02:00:06'),
(225, 121, 266, 'NjgHIjYgtppPGq7vzYMamOqKCyWVY7', '5121911516866762', 1, '89608606069', 45640, 'success', 'NO', NULL, NULL, 'web', '2020-06-26', '2020-06-26 01:44:16', '2020-06-26 01:45:00'),
(226, 121, 266, 'lVYnJLU7HL6gXOruvXkmXBYwjyAeyP', '6766415751980716', 1, '89608606069', 45640, 'success', 'NO', NULL, NULL, 'web', '2020-06-26', '2020-06-26 02:03:40', '2020-06-26 02:04:00'),
(227, 41, 143, 'GRiwMRbtJPmeZLLSLIrDnf1sBewcqW', '02004600000195588966', 1, '81212870098', 15100, 'success', 'NO', NULL, NULL, 'web', '2020-06-27', '2020-06-26 19:41:14', '2020-06-26 19:42:00'),
(228, 41, 38, 'GJwqaDFPeI395rPWaNPescuDrkmfuz', '51003816643452', 1, '81212870098', 20150, 'success', 'NO', NULL, NULL, 'web', '2020-06-27', '2020-06-26 20:15:33', '2020-06-26 20:16:00'),
(229, 85, 251, 'b7TcvEwUdHGi0b47mA1mxveNNxvW6i', '200627GM11782385/DANA DNID 085156413611', 1, '85156413611', 100200, 'success', 'NO', NULL, NULL, 'web', '2020-06-27', '2020-06-27 05:54:42', '2020-06-27 05:55:00'),
(230, 85, 251, '9ZKGwEy8fkOnpdHmeySCvMnAZ3Qauu', 'Transaksi Gagal', 1, '85156413611', 100200, 'canceled', 'YES', NULL, NULL, 'web', '2020-06-27', '2020-06-27 14:04:34', '2020-06-27 14:05:07'),
(231, 85, 245, 'YdNcAhxVwifhxjJZ3KOp2xTbK43zce', 'Transaksi Gagal', 1, '85156413611', 20200, 'canceled', 'YES', NULL, NULL, 'web', '2020-06-27', '2020-06-27 14:05:13', '2020-06-27 14:06:07'),
(232, 85, 251, '6LCIUHQyvo376H5BgtMqLUlHrUXxtF', 'Transaksi Gagal', 1, '85156413611', 100200, 'canceled', 'YES', NULL, NULL, 'web', '2020-06-27', '2020-06-27 14:07:44', '2020-06-27 14:08:07'),
(233, 85, 251, 'dkDnjIwfg8rkhNlu2zAcDdFOEVUwWI', 'Transaksi Gagal', 1, '85156413611', 100200, 'canceled', 'YES', NULL, NULL, 'web', '2020-06-27', '2020-06-27 15:15:27', '2020-06-27 15:18:09'),
(234, 85, 250, 'mdkzB9mmIyKhgY7L3WzWttD8Ggd664', 'Transaksi Gagal', 1, '85156413611', 75200, 'canceled', 'YES', NULL, NULL, 'web', '2020-06-27', '2020-06-27 15:22:05', '2020-06-27 15:23:04'),
(235, 85, 251, 'uy1AvuuMEsBf77iG27Ogu5Pv516PHD', '200628GM11792466/DANA DNID 085156413611', 1, '85156413611', 100200, 'success', 'NO', NULL, NULL, 'web', '2020-06-28', '2020-06-27 18:28:44', '2020-06-27 18:29:01'),
(237, 85, 244, 'kFL1kygFrJ2Qa4Bnhm2VlDkF4F8zRi', 'Transaksi Gagal', 1, '85156413611', 10200, 'canceled', 'YES', NULL, NULL, 'web', '2020-06-28', '2020-06-28 00:53:19', '2020-06-28 00:54:04'),
(239, 92, 248, 'NnF9B58QUkOMsZPQ1KBOV8FAO2TgT7', '200628GM11808662/DANA DNID 087700662424', 1, '87700662424', 40200, 'success', 'NO', NULL, NULL, 'web', '2020-06-28', '2020-06-28 02:07:37', '2020-06-28 02:08:00'),
(241, 83, 107, '2ylL1mvNeLO4oSZk5W9yVl5R5omRWf', '02005700012149801557', 1, '85717637949', 48900, 'success', 'NO', NULL, NULL, 'web', '2020-06-28', '2020-06-28 08:22:04', '2020-06-28 08:23:00'),
(246, 1, 33, '5IqhcwVTJHS0d1CkTKihc9aQoJ0kOr', '02000290617464112415978', 1, '82128558963', 2850, 'success', 'NO', NULL, NULL, 'web', '2020-06-29', '2020-06-29 03:46:31', '2020-06-29 03:47:00'),
(250, 85, 244, 'o2hyoaYYe4we9VA1r2Aq48o9lvjs41', '200630GM11877549/DANA DNID 085156413611', 1, '85156413611', 10200, 'success', 'NO', NULL, NULL, 'web', '2020-06-30', '2020-06-29 18:00:35', '2020-06-29 18:01:01'),
(252, 28, 245, 'fcQf54AADxYQbUqMgKwht3Zx8dmeyd', '200630GM11924134/DANA DNID 081292193280', 1, '81292193280', 20200, 'success', 'NO', NULL, NULL, 'web', '2020-06-30', '2020-06-30 07:14:41', '2020-06-30 07:15:03'),
(254, 41, 64, 'dp5iCaDphzeRwerGuK48VlpqkqaDMc', '809260806', 1, '88214472559', 19790, 'success', 'NO', NULL, NULL, 'web', '2020-06-30', '2020-06-30 08:17:03', '2020-06-30 08:18:00'),
(255, 64, 35, 'VslGDKd8iWZ26FbmGqPv1atnpCWOlf', '02007800000276121718', 1, '82291505592', 5850, 'success', 'NO', NULL, NULL, 'web', '2020-06-30', '2020-06-30 09:40:18', '2020-06-30 09:41:02'),
(264, 121, 266, 'KMhjCDIghfpDAzGpi3DXD1mbNcr80X', '0775798370891171', 1, '89608606069', 45640, 'success', 'NO', NULL, NULL, 'web', '2020-07-04', '2020-07-03 20:48:21', '2020-07-03 20:49:00'),
(265, 121, 266, 'hoWKwvsf0x3EtefGNYeewuTlcWSxv9', '9127886586170379', 1, '89608606069', 45640, 'success', 'NO', NULL, NULL, 'web', '2020-07-04', '2020-07-03 20:48:29', '2020-07-03 20:49:00'),
(266, 31, 245, 'JxT7ZS19uOBV12pUTxov4C6hHmDYNO', '200704GM11055185/DANA DNID 08987860515', 1, '8987860515', 20200, 'success', 'NO', NULL, NULL, 'web', '2020-07-04', '2020-07-03 20:51:36', '2020-07-03 20:52:00'),
(267, 1, 279, 'lgSVZT0ss8cTGWMJo1rWI9KMT2TM3L', 'Nomor Tujuan Salah', 1, '85155037511', 50500, 'canceled', 'YES', NULL, NULL, 'web', '2020-07-04', '2020-07-03 21:22:26', '2020-07-03 21:23:02'),
(268, 1, 279, 'UspnLL28SztHWH9msn8d9mqyTe0F3I', 'Nomor Tujuan Salah', 1, '85155012867', 50500, 'canceled', 'YES', NULL, NULL, 'web', '2020-07-04', '2020-07-03 21:26:44', '2020-07-03 21:28:05'),
(269, 1, 249, 'weKNXGKmKU0LyTG0PweBeXnbH8y9mn', '200704GM11056760/DANA DNID 087889895327', 1, '87889895327', 50200, 'success', 'NO', NULL, NULL, 'web', '2020-07-04', '2020-07-03 21:29:43', '2020-07-03 21:31:13'),
(270, 41, 244, 'TjuVVXHxmwladXdZX5CpnUYGKJ280e', '200704GM11058873/DANA DNID 082298879148', 1, '82298879148', 10200, 'success', 'NO', NULL, NULL, 'web', '2020-07-04', '2020-07-03 22:34:12', '2020-07-03 22:35:00'),
(280, 85, 266, 'GaA3g0pj16ZLmZaC9ef4e9uqSidzK5', '216816650/CODE=6985034981241394', 1, '8990717157', 9190, 'success', 'NO', NULL, NULL, 'web', '2020-07-05', '2020-07-05 05:36:32', '2020-07-05 05:36:59'),
(282, 162, 137, 'MfAwxQPoflSzm22gHciu1VbSHxXkal', '02012000000375119210', 1, '85156549714', 10150, 'success', 'NO', NULL, NULL, 'web', '2020-07-05', '2020-07-05 09:35:57', '2020-07-05 09:37:01'),
(284, 41, 244, 'ihqyy2pjUKUVeCWNtc854DHKgHYYvs', '200706GM11140955/DANA DNID 082298879148', 1, '82298879148', 10200, 'success', 'NO', NULL, NULL, 'web', '2020-07-06', '2020-07-06 04:39:36', '2020-07-06 04:40:00'),
(287, 41, 63, 'yHxDtxGrwWZAoPL3k51WsVF7Qz79S9', '810766922', 1, '88214472559', 9930, 'success', 'NO', NULL, NULL, 'web', '2020-07-06', '2020-07-06 07:57:01', '2020-07-06 07:58:01'),
(290, 1, 247, 'nfGVYUAV6wtUvdQsJnZaipZZYMVYIS', '200706GM11151680/DANA DNID 081374655989', 1, '81374655989', 30200, 'success', 'NO', NULL, NULL, 'web', '2020-07-06', '2020-07-06 08:46:41', '2020-07-06 08:46:59'),
(291, 1, 301, 'vmcuAr9SWmpPazKmUQBZwMxOqmuLrZ', '1A97C04E-2625-41CD-9B0A-98D9772FDAB4', 1, '088888888888', 5620, 'success', 'NO', NULL, NULL, 'web', '2020-07-06', '2020-07-06 09:05:19', '2020-07-06 09:06:00'),
(296, 41, 244, 'puzga6SlHZBmd52jfqxLxRCOAx3gXi', '200707GM11170943/DANA DNID 083131779494', 1, '83131779494', 10200, 'success', 'NO', NULL, NULL, 'web', '2020-07-07', '2020-07-06 23:06:56', '2020-07-06 23:07:01'),
(299, 41, 244, 'NxTz0qG33HyXV3ZH2Gee2gP7Nwfo5Q', 'Transaksi Gagal', 1, '83131779494', 10200, 'canceled', 'YES', NULL, NULL, 'web', '2020-07-07', '2020-07-07 00:19:50', '2020-07-07 00:20:33'),
(300, 41, 244, 'FFDoXGR6GdVdABFHgru5C57U0xxfBl', 'Transaksi Gagal', 1, '83131779494', 10200, 'canceled', 'YES', NULL, NULL, 'web', '2020-07-07', '2020-07-07 00:22:08', '2020-07-07 00:23:13'),
(301, 41, 244, 'OSpTpJh2NFeFHZuRwpigcF14xI88Mt', 'Transaksi Gagal', 1, '83131779494', 10200, 'canceled', 'YES', NULL, NULL, 'web', '2020-07-07', '2020-07-07 00:31:24', '2020-07-07 00:32:19'),
(303, 41, 245, 'QiPVoUQsWS7P3kN9azD3vC92nnMyxg', '200707GM11182034/DANA DNID 081367268711', 1, '81367268711', 20200, 'success', 'NO', NULL, NULL, 'web', '2020-07-07', '2020-07-07 03:16:28', '2020-07-07 03:17:00'),
(314, 41, 244, 'aYGOcpaySryCWzms5UJHPxBgi9uhdl', '200708GM11219734/DANA DNID 083876262329', 1, '83876262329', 10200, 'success', 'NO', NULL, NULL, 'web', '2020-07-08', '2020-07-07 22:16:55', '2020-07-07 22:17:00'),
(315, 41, 36, 'tmK0030QuSsdfuvu4Jqu72uM0GSBKG', '51003856271740', 1, '82121471264', 10335, 'success', 'NO', NULL, NULL, 'web', '2020-07-08', '2020-07-08 03:28:18', '2020-07-08 03:29:00'),
(316, 121, 300, 'tNlhVWJGR89gb9Ytdfv8EmJpmFroEz', '217401135/CODE=1924211192500896', 1, '89608606069', 91240, 'success', 'NO', NULL, NULL, 'web', '2020-07-08', '2020-07-08 04:55:36', '2020-07-08 04:56:00'),
(317, 83, 101, 'POaotwO9pEH3whtJht8GzkZwSkYVbZ', '02015400012227656884', 1, '85770309864', 10825, 'success', 'NO', NULL, NULL, 'web', '2020-07-08', '2020-07-08 06:28:06', '2020-07-08 06:29:01'),
(335, 1, 127, 'QF5dPhJUOioYCugpm0L1g2au3YLgm2', '02020700000519448927', 1, '085156043265', 1199, 'success', 'NO', NULL, NULL, 'web', '2020-07-13', '2020-07-12 23:28:33', '2020-07-12 23:29:01'),
(336, 1, 20, 'ux2LkCl1iBtyknMP12OETHgo4F8hGk', 'Transaksi Gagal', 1, '0812132382828', 1700, 'canceled', 'YES', NULL, NULL, 'web', '2020-07-13', '2020-07-12 23:36:16', '2020-07-12 23:37:10'),
(338, 151, 20, 'FUTFMDQE0HGd4caYMviSeX22KSwGf4', '02025700000536660752.', 1, '82249033883', 1700, 'success', 'NO', NULL, NULL, 'web', '2020-07-13', '2020-07-12 23:52:37', '2020-07-12 23:53:01'),
(362, 25, 35, 'uBVKzIZ9ICQS4Cq8iCDu9mzmQukLcT', '02022600000558242466', 1, '82175469903', 5850, 'success', 'NO', NULL, NULL, 'web', '2020-07-15', '2020-07-14 20:04:16', '2020-07-14 20:05:17'),
(373, 206, 300, 'T5ONNc0PBTqOT8fXbOur9yZO8AJMXF', '221202603/CODE=9523507441239529', 1, '082285387397', 91300, 'success', 'NO', NULL, NULL, 'web', '2020-07-16', '2020-07-15 22:49:09', '2020-07-15 22:50:01'),
(374, 206, 300, 'uHR3TTjNJuroUJJk6QKhsPVPuBBl2X', '221202715/CODE=8168776714816299', 1, '082285387397', 91300, 'success', 'NO', NULL, NULL, 'web', '2020-07-16', '2020-07-15 23:06:44', '2020-07-15 23:07:02'),
(375, 206, 300, 'tlD2nZnzd6yNz8MeBATY62bwqQC7r5', '221202716/CODE=8710995833209061', 1, '082285387397', 91300, 'success', 'NO', NULL, NULL, 'web', '2020-07-16', '2020-07-15 23:06:55', '2020-07-15 23:07:02'),
(376, 206, 300, 'NnyyNDkyRnpRAzxl8iMNeK7n3aD68A', '221202717/CODE=8863191059338388', 1, '082285387397', 91300, 'success', 'NO', NULL, NULL, 'web', '2020-07-16', '2020-07-15 23:07:05', '2020-07-15 23:08:01'),
(377, 206, 300, 'OtW0kjTIxf8hlzutR7XsZ9Gj3XpPDW', '221202719/CODE=0157541293608598', 1, '082285387397', 91300, 'success', 'NO', NULL, NULL, 'web', '2020-07-16', '2020-07-15 23:07:15', '2020-07-15 23:08:01'),
(398, 179, 50, 'DzvIw3mpYpoU1FLE7BvejcCnbLJoTq', '51003888839275', 1, '82213826012', 73600, 'success', 'NO', NULL, NULL, 'web', '2020-07-17', '2020-07-16 18:54:41', '2020-07-16 18:55:01'),
(399, 179, 36, 'Juwqhiff6hh6UxYbviTsVACd6Xhili', '51003888861651', 1, '82213826012', 10335, 'success', 'NO', NULL, NULL, 'web', '2020-07-17', '2020-07-16 18:58:40', '2020-07-16 19:02:01'),
(401, 89, 88, 'DD0WbIpsYHstpqDlWHFTQhXlSMsBO7', '121627201799', 1, '895700390267', 10125, 'success', 'NO', NULL, NULL, 'web', '2020-07-17', '2020-07-17 08:01:39', '2020-07-17 08:03:01'),
(405, 162, 131, 'ZkrYEyfv21OTfi3xsBoCLaAh2IBuMY', '02025700000624787367', 1, '85156549714', 5500, 'success', 'NO', NULL, NULL, 'web', '2020-07-18', '2020-07-18 00:23:02', '2020-07-18 05:05:00'),
(406, 206, 300, '2qTD7slVuL6t5c4kyE4AeSqEAKuQai', '222200302/CODE=0233969444632386', 1, '082285387397', 91300, 'success', 'NO', NULL, NULL, 'web', '2020-07-18', '2020-07-18 04:34:07', '2020-07-18 05:05:01'),
(407, 206, 300, 'OAubsrHqfCjCJranIuNUEq0NJUCz6b', '222200304/CODE=1438509892829010', 1, '082285387397', 91300, 'success', 'NO', NULL, NULL, 'web', '2020-07-18', '2020-07-18 04:34:14', '2020-07-18 05:05:01'),
(408, 206, 300, 'P7212f24ZfMAe9FhEfLnMT3zqfFGA7', '222200306/CODE=1861944839393150', 1, '082285387397', 91300, 'success', 'NO', NULL, NULL, 'web', '2020-07-18', '2020-07-18 04:34:19', '2020-07-18 05:05:01'),
(409, 206, 300, 'A0qcn7MKTQj866QToqTWilZ3c3LaY5', '222200308/CODE=0356127065737013', 1, '082285387397', 91300, 'success', 'NO', NULL, NULL, 'web', '2020-07-18', '2020-07-18 04:34:23', '2020-07-18 05:05:01'),
(410, 206, 300, 'RdRQzkm6tXlaxSHWcdmoheoNxhRgDD', '222200309/CODE=0108348289352551', 1, '082285387397', 91300, 'success', 'NO', NULL, NULL, 'web', '2020-07-18', '2020-07-18 04:34:27', '2020-07-18 05:05:01'),
(411, 1, 20, 'gd36WYdI6gQUCYoYmDYIqqb5QdISLl', '113937894474655989.', 1, '81374655989', 1700, 'success', 'NO', NULL, NULL, 'web', '2020-07-18', '2020-07-18 04:46:39', '2020-07-18 05:05:02'),
(412, 1, 469, '1123869', '0', 50, 'luckynur_apriana', 180, 'success', 'NO', '1663', '0', 'web', '2020-07-18', '2020-07-18 06:05:30', '2020-07-18 07:49:03'),
(413, 31, 470, '1123948', '0', 660, 'habib.umami1698', 18480, 'success', 'NO', '234', '0', 'web', '2020-07-18', '2020-07-18 06:20:00', '2020-07-18 06:36:08'),
(414, 182, 475, '1124223', '0', 110, 'https://www.instagram.com/p/CCyTr8hhwEV7fRoVWMR856qP9AAuOLWx9BEiYM0/?igshid=1pbfdhsg6szoi', 429, 'error', 'YES', NULL, '82', 'web', '2020-07-18', '2020-07-18 07:26:52', '2020-07-18 09:39:04'),
(415, 45, 477, '1124363', '0', 1000, 'https://www.instagram.com/p/CCxSxB-jKRs/?igshid=17qd51roy5bvr', 30, 'success', 'NO', '652', '0', 'web', '2020-07-18', '2020-07-18 08:05:53', '2020-07-18 08:17:02'),
(423, 89, 486, 'KM-564297', '0', 1000, 'theflates.co', 8500, 'pending', 'NO', NULL, '1000', 'web', '2020-07-19', '2020-07-19 06:09:43', '2020-07-21 21:32:01'),
(424, 89, 489, '1128217', '0', 100, 'https://www.instagram.com/p/CC0HpKSpUAW/?igshid=1n0he1t99sx9v', 550, 'error', 'YES', NULL, '0', 'web', '2020-07-19', '2020-07-19 06:10:28', '2020-07-19 06:47:02'),
(425, 28, 487, 'KM-564359', '0', 30, 'firmansyahgangs.verified', 255, 'success', 'NO', NULL, '0', 'web', '2020-07-19', '2020-07-19 08:11:20', '2020-07-19 09:00:09'),
(426, 45, 477, '1129024', '0', 1000, 'https://www.instagram.com/p/CC1M98Mj6G_/?igshid=15q9gpeq9yi4x', 60, 'error', 'YES', '0', '1000', 'web', '2020-07-19', '2020-07-19 10:28:21', '2020-07-19 10:57:06'),
(427, 45, 477, '1129065', '0', 500, 'https://www.instagram.com/p/CCn52nJjp8Q/?igshid=781jrbh6kcf6', 30, 'success', 'NO', '2239', '0', 'web', '2020-07-19', '2020-07-19 10:45:14', '2020-07-19 10:55:12'),
(428, 45, 477, '1129107', '0', 1000, 'https://www.instagram.com/p/CC1SNvPjBVa/?igshid=1mdodiazumb8c', 60, 'success', 'NO', '25', '0', 'web', '2020-07-19', '2020-07-19 11:16:07', '2020-07-19 11:22:04'),
(429, 93, 478, '1129233', '0', 118, 'nanzkyle', 6490, 'pending', 'NO', '0', '118', 'web', '2020-07-19', '2020-07-19 12:51:36', '2020-07-21 21:32:02'),
(430, 31, 470, '1129592', '0', 100, 'rikipm7', 2800, 'success', 'NO', '6760', '0', 'web', '2020-07-20', '2020-07-19 18:05:39', '2020-07-19 18:23:03'),
(431, 31, 477, '1129594', '0', 10000, 'https://www.instagram.com/p/CBlC24gJk3J', 600, 'success', 'NO', '2805', '0', 'web', '2020-07-20', '2020-07-19 18:06:33', '2020-07-19 18:22:04'),
(432, 45, 477, '1129831', '0', 1500, 'https://www.instagram.com/p/CC1SNvPjBVa/?igshid=y0qx5hisicqe', 90, 'error', 'YES', '0', '1500', 'web', '2020-07-20', '2020-07-19 19:15:39', '2020-07-20 01:15:07'),
(433, 45, 477, '1130398', '0', 250, 'https://www.instagram.com/p/CC2Xoeyl7Dv/?igshid=31ym6eekq9p9', 15, 'success', 'NO', '6', '0', 'web', '2020-07-20', '2020-07-19 21:30:32', '2020-07-19 21:40:11'),
(434, 75, 472, '9425303', '0', 1000, 'defristwn08', 5200, 'success', 'NO', '4981', '0', 'web', '2020-07-20', '2020-07-20 02:30:10', '2020-07-20 11:03:04'),
(435, 75, 474, '1131616', '0', 1000, 'https://www.instagram.com/p/CCwvrhkDKsE/?igshid=ldjg7lsdlqx4', 3000, 'error', 'YES', NULL, '1000', 'web', '2020-07-20', '2020-07-20 02:35:49', '2020-07-21 12:44:07'),
(436, 45, 477, '1131724', '0', 1000, 'https://www.instagram.com/p/CC1SNvPjBVa/?igshid=alrrsg74ogny', 60, 'success', 'NO', '1416', '0', 'web', '2020-07-20', '2020-07-20 03:08:44', '2020-07-20 03:20:13'),
(437, 1, 471, '1132976', '0', 100, 'janfalih_', 510, 'success', 'NO', '21', '0', 'web', '2020-07-20', '2020-07-20 07:34:49', '2020-07-20 07:53:08'),
(438, 1, 471, '1132980', '0', 100, 'janfalih_', 510, 'success', 'NO', '128', '0', 'web', '2020-07-20', '2020-07-20 07:35:32', '2020-07-20 08:15:12'),
(439, 1, 471, '1132983', '0', 100, 'janfalih_', 510, 'success', 'NO', '234', '0', 'web', '2020-07-20', '2020-07-20 07:36:00', '2020-07-20 08:26:09'),
(440, 197, 250, 'mMAy4Izi0mjQ1GwRZIHAXSpthHsf7V', '200720GM11689659/DANA DNID 085235368447', 1, '85235368447', 75200, 'success', 'NO', NULL, NULL, 'web', '2020-07-20', '2020-07-20 08:36:53', '2020-07-20 08:36:59'),
(441, 77, 477, '1133261', '0', 100, '1123', 6, 'success', 'NO', '0', '0', 'web', '2020-07-20', '2020-07-20 08:54:27', '2020-07-20 11:38:06'),
(442, 89, 469, '1133264', '0', 1100, 'nunnnaaa25', 3960, 'success', 'NO', '549', '0', 'web', '2020-07-20', '2020-07-20 08:55:57', '2020-07-20 11:57:07'),
(443, 45, 477, '1133716', '0', 1000, 'https://www.instagram.com/p/CC4PRDmD_Oy/?igshid=j2f06ykvhi99', 60, 'success', 'NO', '13', '0', 'web', '2020-07-20', '2020-07-20 14:38:19', '2020-07-20 14:45:09'),
(444, 77, 471, '1133981', '0', 50, 'S7usysy', 255, 'error', 'YES', NULL, '50', 'web', '2020-07-21', '2020-07-20 17:45:23', '2020-07-20 17:54:11'),
(445, 82, 501, '1134226', '0', 50, 'https://www.instagram.com/p/B_6B_zYl4sx/?igshid=yqab6rzv9xnd', 750, 'success', 'NO', '63', '0', 'web', '2020-07-21', '2020-07-20 19:30:09', '2020-07-20 21:14:05'),
(446, 45, 477, '1134234', '0', 3000, 'https://www.instagram.com/p/CC1SNvPjBVa/?igshid=10b67ce2027c0', 180, 'success', 'NO', '2545', '0', 'web', '2020-07-21', '2020-07-20 19:32:28', '2020-07-20 19:56:10'),
(447, 45, 477, '1134236', '0', 2000, 'https://www.instagram.com/p/CC4PRDmD_Oy/?igshid=s5wh9dl3epgk', 120, 'success', 'NO', '1098', '0', 'web', '2020-07-21', '2020-07-20 19:32:56', '2020-07-20 19:51:06'),
(448, 82, 494, '9430213', '0', 70, 'https://www.instagram.com/p/B_6B_zYl4sx/?igshid=yqab6rzv9xnd', 840, 'success', 'NO', '57', '0', 'web', '2020-07-21', '2020-07-20 19:35:37', '2020-07-20 20:23:09'),
(449, 82, 494, '9430215', '0', 70, 'https://www.instagram.com/p/B_6B_zYl4sx/?igshid=yqab6rzv9xnd', 840, 'success', 'NO', '57', '0', 'web', '2020-07-21', '2020-07-20 19:35:42', '2020-07-20 20:23:11'),
(450, 1, 36, 'thWWTTNkd3Q78FUGyZVnplztkJtxVK', '51003905702207', 1, '81378877680', 10335, 'success', 'NO', NULL, NULL, 'web', '2020-07-21', '2020-07-20 19:48:09', '2020-07-20 19:49:00'),
(451, 11, 299, 'a8qeGq3NQjczUMho2JHBDuDnK7ObsJ', '0377956910480246', 1, '083132297240', 45600, 'success', 'NO', NULL, NULL, 'web', '2020-07-21', '2020-07-21 01:34:26', '2020-07-21 01:34:59'),
(452, 28, 85, 'yTKcPFtxvKxXHdThqqrzdvT7EUNBOU', 'R200721.1930.2000D8', 1, '89653433016', 1200, 'success', 'NO', NULL, NULL, 'web', '2020-07-21', '2020-07-21 05:30:17', '2020-07-21 05:30:59'),
(453, 1, 171, 'yJOg3ln93XGuPXGwq20Im2ILSxcvQC', '19467200721201900065', 1, '083185016238', 17700, 'success', 'NO', NULL, NULL, 'web', '2020-07-21', '2020-07-21 06:18:46', '2020-07-21 06:20:01'),
(454, 197, 519, '9436836', '0', 72, 'https://www.facebook.com/munir.sanz.9', 5040, 'processing', 'NO', '0', '72', 'web', '2020-07-21', '2020-07-21 10:46:30', '2020-07-21 21:32:04'),
(455, 31, 477, '1137951', '0', 10000, 'https://www.instagram.com/p/CBlC24gJk3J', 600, 'success', 'NO', '14624', '0', 'web', '2020-07-21', '2020-07-21 13:32:08', '2020-07-21 13:37:06'),
(456, 31, 477, '1137960', '0', 10000, 'https://www.instagram.com/p/CC5LeawAzlN', 600, 'success', 'NO', '763', '0', 'web', '2020-07-21', '2020-07-21 13:43:20', '2020-07-21 13:50:11'),
(457, 25, 302, 'l8uu5OuuANAQdxDRe8jh1sKM1nuh46', 'EBLS792662915', 1, '082175469903', 10580, 'success', 'NO', NULL, NULL, 'web', '2020-07-21', '2020-07-21 15:00:22', '2020-07-21 15:01:01'),
(458, 11, 469, '1138222', '0', 1000, 'septyan.store.id', 3600, 'success', 'NO', '171', '0', 'web', '2020-07-22', '2020-07-21 17:23:33', '2020-07-21 17:38:07'),
(459, 75, 489, '1138274', '0', 1000, 'https://www.instagram.com/p/CC7I_vKDEqY/?igshid=1eh5u68484l1f', 5500, 'processing', 'NO', NULL, '0', 'web', '2020-07-22', '2020-07-21 17:50:26', '2020-07-21 21:32:07');

-- --------------------------------------------------------

--
-- Table structure for table `history_deposits`
--

CREATE TABLE `history_deposits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `trx_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_unik` int(11) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `deposit_id` bigint(20) UNSIGNED NOT NULL,
  `jumlah` int(11) NOT NULL,
  `status` enum('pending','success','canceled') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `history_deposits`
--

INSERT INTO `history_deposits` (`id`, `trx_id`, `kode_unik`, `user_id`, `deposit_id`, `jumlah`, `status`, `created_at`, `updated_at`) VALUES
(13, 'bhwhoDMws9sqDi89f3bvvfF3fZUExc', 672, 1, 7, 10000, 'canceled', '2020-06-16 00:16:19', '2020-06-16 00:16:23'),
(15, 'EdARQzmzq83wAkZUbbJou6fPmIil2j', 568, 1, 7, 10000, 'canceled', '2020-06-16 00:25:55', '2020-06-16 00:25:59'),
(16, 'KH08JSBLrxzFDWlLU2rA2t6IuVTgQS', 916, 70, 8, 19000, 'canceled', '2020-06-17 02:35:39', '2020-06-17 02:35:54'),
(17, 'cKlyoFC8NKn0QX2Hg7RssJV9OpCDbg', 501, 70, 8, 199000, 'canceled', '2020-06-17 02:36:37', '2020-06-26 02:08:22'),
(18, 'P9REllBqrCJgZnAp9mi5VwAtK5Ne8M', 194, 74, 7, 10000, 'canceled', '2020-06-17 07:52:42', '2020-06-17 07:54:48'),
(19, 'ss0MOhbdCshiA1CW8DEvglXmVh9Ufs', 551, 74, 7, 60000, 'canceled', '2020-06-17 07:55:12', '2020-06-17 07:56:01'),
(20, 'NPCl63qMaazdkLgmDWBfN9uN3D4ZMy', 121, 74, 7, 20000, 'canceled', '2020-06-17 08:22:27', '2020-06-17 08:25:52'),
(21, 'baeUAMHFcxfuBH3S8OK3Tm4B0lI9zi', 710, 41, 7, 55000, 'canceled', '2020-06-18 12:03:25', '2020-06-22 06:54:47'),
(23, 'JR7uQhEac35jYzoLNQ8EVZRrNQak28', 731, 91, 7, 10000, 'canceled', '2020-06-21 08:48:02', '2020-06-21 16:36:28'),
(24, '1cqFqwMwvWB1chGLkAvyWA2uz3goZu', 912, 51, 7, 20000, 'canceled', '2020-06-21 22:04:29', '2020-06-26 02:07:34'),
(25, '3dIJopSrn6cNpT7YaIc3VVmHcSglBw', 601, 92, 7, 40000, 'success', '2020-06-22 00:59:34', '2020-06-22 01:07:46'),
(26, 'ExYiTdRClRNq4ULJOrerMkfzOqnkuS', 920, 1, 7, 19999, 'canceled', '2020-06-22 01:24:16', '2020-06-26 02:07:59'),
(27, 'QtMZvTJAtBD3dDFKHF70bNrvAT1LtM', 545, 109, 8, 5200000, 'canceled', '2020-06-22 03:49:03', '2020-06-26 02:07:27'),
(28, 'vAQXqwE4IOXtCRWVmz6AUO6rklSFeA', 519, 41, 7, 20000, 'success', '2020-06-22 06:55:00', '2020-06-22 06:56:59'),
(29, '7XeiiwCWo4PMCLMYqQ227lHILlFMNc', 960, 41, 8, 10000, 'canceled', '2020-06-23 05:19:31', '2020-06-25 03:00:29'),
(30, 'lDRz2yaNYweAg1K9LFD7SfPcBK4ZaZ', 846, 41, 7, 80000, 'success', '2020-06-25 03:00:41', '2020-06-25 03:04:11'),
(31, 'rYwR1c46SKugE3apEGbsa546PlfuKW', 801, 142, 8, 50000, 'canceled', '2020-06-26 04:18:12', '2020-06-26 08:20:24'),
(32, '4J0YGKwwcB9UKNXHlOsXAtxP9fM2y4', 132, 1, 9, 10000, 'canceled', '2020-06-26 08:47:32', '2020-06-26 08:55:34'),
(33, 'y70QDvh09JmZj3gBCfxK35RDt5Agqz', 555, 41, 8, 10000, 'success', '2020-06-26 19:36:08', '2020-06-26 20:10:36'),
(34, '8qkHMAdykf0qPmaehakesJ9AXhYq8K', 391, 1, 8, 19999, 'canceled', '2020-06-26 20:04:10', '2020-06-29 01:55:45'),
(35, 'n1ZdQbvjLAede3RQRG46SkT63yqGfS', 217, 85, 7, 18000, 'canceled', '2020-06-27 05:57:16', '2020-06-29 01:55:34'),
(36, 'RlTSkH3DGz4pVc09rbpltLbEFdfoHY', 633, 41, 7, 50000, 'canceled', '2020-06-28 08:31:05', '2020-06-28 09:07:40'),
(37, '0zIVdEwwQgAy2kvNpgcpoHMuJrgMVH', 560, 149, 8, 50000, 'canceled', '2020-06-28 21:31:20', '2020-06-28 21:31:26'),
(38, 'OQYxyYSGyN9yCnq9ivESreYgKMQznU', 253, 151, 7, 10000, 'success', '2020-06-29 05:13:37', '2020-06-29 05:58:51'),
(39, 'aR63V0V0Q6JXMQQrDUCz7v5g5ul4g5', 210, 149, 8, 50000, 'canceled', '2020-06-29 07:10:51', '2020-06-29 07:12:07'),
(40, 'CqMxrLrK3TGWDdYNwiGlgbch5h8rv9', 997, 149, 8, 10000, 'canceled', '2020-06-29 07:12:18', '2020-06-29 07:12:36'),
(41, '2vx67U7mU5Gz1WqppIkC5Xpx2LyskP', 441, 79, 8, 10000, 'canceled', '2020-06-29 19:27:12', '2020-07-06 06:09:25'),
(42, 'Tjs7Pxhrnr2vXvMBU4vZlsPmbAowC6', 679, 155, 7, 20000, 'canceled', '2020-06-30 04:40:13', '2020-06-30 04:40:21'),
(43, '3qqZZx4rVxHx7X4PNY4UMcqmj7f35O', 911, 41, 7, 50000, 'canceled', '2020-06-30 07:37:45', '2020-07-01 05:20:35'),
(44, 'dvssCmIZnvtqpqDxmp8hgQufUI6GK5', 180, 41, 7, 50000, 'canceled', '2020-07-01 16:32:57', '2020-07-01 16:56:33'),
(45, 'RK4KwPu6RI3nvMHld01whVOPFkASzU', 277, 158, 7, 10000, 'canceled', '2020-07-02 06:08:10', '2020-07-02 06:08:53'),
(46, 'pUBXGbboQ3B6WD8gbqkMsaqie6K5nl', 365, 158, 7, 10000, 'canceled', '2020-07-02 06:09:26', '2020-07-06 05:22:18'),
(47, 'VstMwt6QRvcwS8T7LI8IzEO1Jo1Ic8', 358, 95, 7, 10000, 'canceled', '2020-07-06 05:09:06', '2020-07-06 05:22:06'),
(48, 'a4teHVK1o2pGSITSiOlksF3EfB4DyH', 587, 95, 9, 10000, 'success', '2020-07-06 05:41:30', '2020-07-06 06:08:22'),
(49, 'Zs6lJyXTRabQzQQnDcvNvlhgNXQuY3', 499, 171, 7, 50000, 'canceled', '2020-07-06 19:44:19', '2020-07-08 05:37:02'),
(50, 'hhqSKPB8aKOICe5MCWR2c9vDNg6qZF', 852, 41, 8, 10000, 'canceled', '2020-07-10 08:58:51', '2020-07-15 22:49:17'),
(51, 'y9UgRdf0U1cA4kDpIid17TjKarq5p4', 521, 179, 7, 100000, 'canceled', '2020-07-11 07:30:21', '2020-07-15 22:49:06'),
(52, 'HRLTvp3llTufsI8WSRj2Zj3wqC4lJA', 203, 152, 9, 20000, 'success', '2020-07-12 23:22:56', '2020-07-15 22:48:30'),
(53, 'gQlnpumDCt03k3pEin9HX41q34sldZ', 634, 190, 8, 15000, 'canceled', '2020-07-14 19:12:05', '2020-07-15 22:48:48'),
(54, 'jQAWadU5KHWMGyuQEfnmaWeWM3yXHB', 121, 23, 8, 1000000, 'canceled', '2020-07-14 21:09:01', '2020-07-15 22:48:38'),
(55, '1Eh6dHCMDHWFSTtRyOM6hulf130LwX', 179, 206, 9, 100000, 'success', '2020-07-15 22:38:12', '2020-07-15 22:48:18'),
(56, '9UvrrFMT9zLSZ3SrrQf8SPIsFvrPlt', 250, 206, 8, 356400, 'success', '2020-07-15 22:52:32', '2020-07-15 23:06:05'),
(57, 'kLlOVuYmML8QN0yfQHm0rEn73ZDfaX', 254, 179, 7, 90000, 'success', '2020-07-16 14:38:10', '2020-07-16 18:51:42'),
(58, 'tveCBLNrhQybxCv85qeJrDeaYo2d8f', 257, 149, 7, 10000, 'canceled', '2020-07-16 16:22:45', '2020-07-16 23:42:51'),
(59, 'eSrflnWFOohT5utaPfp9ZwqDjsj6L0', 488, 1, 7, 10000, 'success', '2020-07-16 18:58:20', '2020-07-16 18:58:33'),
(60, 'yXmPpABqTFv2WXtAz6exOcA5e7BNyc', 605, 1, 7, 10000, 'success', '2020-07-16 19:03:12', '2020-07-16 19:14:38'),
(61, 'Cq8rWp6bkVjn5NBzWImzFTGHbqCn0B', 269, 44, 10, 50000, 'canceled', '2020-07-16 19:53:41', '2020-07-16 19:54:02'),
(62, 'xQRcqHjiSZfC3bXX7Oqs4hhBBXnkHv', 508, 93, 7, 50000, 'success', '2020-07-16 22:51:38', '2020-07-16 22:56:19'),
(63, 'uiciicHQh35VxZc4Ou3lMNqkuF0ykq', 999, 1, 7, 10000, 'success', '2020-07-17 04:47:10', '2020-07-17 04:49:41'),
(64, 'xUGYGkoBGEr1DPRpxzSjYP4ojGgWg5', 370, 206, 9, 456500, 'success', '2020-07-18 04:17:38', '2020-07-18 04:25:00'),
(65, 'ZSMOlxEmWj99OYTWCA72QImZaO1svc', 285, 23, 7, 364000, 'canceled', '2020-07-18 06:48:13', '2020-07-18 06:49:48'),
(66, 'LDRBwY6BgqLiDHuf3KXOy1cmVGRjQa', 603, 1, 9, 10000, 'canceled', '2020-07-19 01:01:50', '2020-07-19 07:19:38'),
(67, 'Lm8ullRUQ0JIwfAKJZnVQrHBuEwkvQ', 550, 28, 10, 10000, 'success', '2020-07-19 06:04:24', '2020-07-19 06:16:00'),
(68, '7TQqTWsh9RzyVHdSRuNb9bHQ0hNuAU', 377, 41, 7, 15000, 'canceled', '2020-07-19 06:37:36', '2020-07-19 13:01:31'),
(69, 'XXCPVj0VxleRo3533OryHjXhSOlfT0', 611, 1, 7, 10000, 'canceled', '2020-07-19 07:19:48', '2020-07-19 07:20:13'),
(70, 'vWnGQkJHwNvFhPjcexefJtlHwawCGR', 460, 41, 8, 90000, 'canceled', '2020-07-19 13:01:40', '2020-07-19 13:07:25');

-- --------------------------------------------------------

--
-- Table structure for table `history_saldos`
--

CREATE TABLE `history_saldos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `jumlah` int(11) NOT NULL,
  `keterangan` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('plus','minus') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `history_saldos`
--

INSERT INTO `history_saldos` (`id`, `user_id`, `jumlah`, `keterangan`, `status`, `created_at`, `updated_at`) VALUES
(6, 1, 1, 'Penambahan 1 Point', 'plus', '2020-06-14 02:26:53', '2020-06-14 02:26:53'),
(7, 1, 450, 'Pembelian Instagram Followers Dengan Jumlah 450', 'minus', '2020-06-14 02:26:53', '2020-06-14 02:26:53'),
(8, 1, 1, 'Penambahan 1 Point', 'plus', '2020-06-14 17:49:11', '2020-06-14 17:49:11'),
(9, 1, 450, 'Pembelian Instagram Followers PROMO 1 ( BOT ) TERMURAH LQ Dengan Jumlah 450', 'minus', '2020-06-14 17:49:11', '2020-06-14 17:49:11'),
(10, 1, 1, 'Penambahan 1 Point', 'plus', '2020-06-14 18:44:43', '2020-06-14 18:44:43'),
(11, 1, 1700, 'Pembelian Telkomsel 1.000 Dengan Jumlah 1700', 'minus', '2020-06-14 18:44:43', '2020-06-14 18:44:43'),
(12, 1, 1, 'Penambahan 1 Point', 'plus', '2020-06-14 19:13:16', '2020-06-14 19:13:16'),
(13, 1, 1700, 'Pembelian Telkomsel 1.000 Dengan Jumlah 1700', 'minus', '2020-06-14 19:13:16', '2020-06-14 19:13:16'),
(14, 1, 1, 'Penambahan 1 Point', 'plus', '2020-06-14 19:15:36', '2020-06-14 19:15:36'),
(15, 1, 1700, 'Pembelian Telkomsel 1.000 Dengan Jumlah 1700', 'minus', '2020-06-14 19:15:36', '2020-06-14 19:15:36'),
(16, 1, 1, 'Penambahan 1 Point', 'plus', '2020-06-14 19:31:16', '2020-06-14 19:31:16'),
(17, 1, 1700, 'Pembelian Telkomsel 1.000 Dengan Jumlah 1700', 'minus', '2020-06-14 19:31:16', '2020-06-14 19:31:16'),
(18, 1, 1, 'Penambahan 1 Point', 'plus', '2020-06-14 20:04:25', '2020-06-14 20:04:25'),
(19, 1, 1700, 'Pembelian Telkomsel 1.000 Dengan Jumlah 1700', 'minus', '2020-06-14 20:04:25', '2020-06-14 20:04:25'),
(20, 1, 1, 'Penambahan 1 Point', 'plus', '2020-06-14 20:13:56', '2020-06-14 20:13:56'),
(21, 1, 1700, 'Pembelian Telkomsel 1.000 Dengan Jumlah 1700', 'minus', '2020-06-14 20:13:56', '2020-06-14 20:13:56'),
(22, 1, 1, 'Penambahan 1 Point', 'plus', '2020-06-14 20:41:29', '2020-06-14 20:41:29'),
(23, 1, 1700, 'Pembelian Telkomsel 1.000 Dengan Jumlah 1700', 'minus', '2020-06-14 20:41:29', '2020-06-14 20:41:29'),
(24, 1, 1, 'Penambahan 1 Point', 'plus', '2020-06-15 05:29:29', '2020-06-15 05:29:29'),
(25, 1, 2500, 'Pembelian Instagram Followers Indonesia [INSTAN] MAX 300 Dengan Jumlah 2500', 'minus', '2020-06-15 05:29:29', '2020-06-15 05:29:29'),
(26, 1, 1, 'Penambahan 1 Point', 'plus', '2020-06-15 05:52:16', '2020-06-15 05:52:16'),
(27, 1, 495, 'Pembelian Instagram Followers PROMO 1 ( BOT ) TERMURAH LQ Dengan Jumlah 495', 'minus', '2020-06-15 05:52:16', '2020-06-15 05:52:16'),
(28, 1, 1, 'Penambahan 1 Point', 'plus', '2020-06-15 05:53:53', '2020-06-15 05:53:53'),
(29, 1, 495, 'Pembelian Instagram Followers PROMO 1 ( BOT ) TERMURAH LQ Dengan Jumlah 495', 'minus', '2020-06-15 05:53:53', '2020-06-15 05:53:53'),
(30, 1, 1, 'Penambahan 1 Point', 'plus', '2020-06-15 07:32:42', '2020-06-15 07:32:42'),
(31, 1, 1500, 'Pembelian Telkomsel 2.000 Dengan Jumlah 1500', 'minus', '2020-06-15 07:32:42', '2020-06-15 07:32:42'),
(32, 1, 1700, 'Pembelian Telkomsel 1.000 Dengan Jumlah 1700', 'minus', '2020-06-16 05:19:23', '2020-06-16 05:19:23'),
(33, 1, 1500, 'Pembelian Telkomsel 2.000 Dengan Jumlah 1500', 'minus', '2020-06-16 05:22:09', '2020-06-16 05:22:09'),
(34, 1, 1500, 'Pembelian Telkomsel 2.000 Dengan Jumlah 1500', 'minus', '2020-06-16 05:25:25', '2020-06-16 05:25:25'),
(35, 1, 1500, 'Pembelian Telkomsel 2.000 Dengan Jumlah 1500', 'minus', '2020-06-16 05:26:09', '2020-06-16 05:26:09'),
(36, 1, 3850, 'Pembelian Telkomsel 3.000 Dengan Jumlah 3850', 'minus', '2020-06-16 05:26:39', '2020-06-16 05:26:39'),
(37, 1, 0, 'Penambahan 0 Point', 'plus', '2020-06-16 05:37:07', '2020-06-16 05:37:07'),
(38, 1, 0, 'Pembelian Instagram View PROMO RMD 1 GRATIS SELAMANYA Dengan Jumlah 0', 'minus', '2020-06-16 05:37:07', '2020-06-16 05:37:07'),
(39, 1, 1, 'Penambahan 1 Point', 'plus', '2020-06-16 07:39:20', '2020-06-16 07:39:20'),
(40, 1, 4500, 'Pembelian Instagram Followers PROMO 1 ( BOT ) TERMURAH LQ Dengan Jumlah 4500', 'minus', '2020-06-16 07:39:20', '2020-06-16 07:39:20'),
(41, 1, 0, 'Penambahan 0 Point', 'plus', '2020-06-16 07:43:37', '2020-06-16 07:43:37'),
(42, 1, 0, 'Pembelian Instagram View PROMO RMD 1 GRATIS SELAMANYA Dengan Jumlah 0', 'minus', '2020-06-16 07:43:37', '2020-06-16 07:43:37'),
(43, 1, 1, 'Penambahan 1 Point', 'plus', '2020-06-16 07:44:27', '2020-06-16 07:44:27'),
(44, 1, 450, 'Pembelian Instagram Followers PROMO 1 ( BOT ) TERMURAH LQ Dengan Jumlah 450', 'minus', '2020-06-16 07:44:27', '2020-06-16 07:44:27'),
(45, 1, 1, 'Penambahan 1 Point', 'plus', '2020-06-16 07:45:17', '2020-06-16 07:45:17'),
(46, 1, 4900, 'Pembelian Followers RMD 2 ( BOT ~ MAX 30K ) INSTAN CHEAP Dengan Jumlah 4900', 'minus', '2020-06-16 07:45:17', '2020-06-16 07:45:17'),
(47, 1, 0, 'Penambahan 0 Point', 'plus', '2020-06-16 07:48:00', '2020-06-16 07:48:00'),
(48, 1, 0, 'Pembelian Instagram View SERVER RMD 1 GRATIS SELAMANYA Dengan Jumlah 0', 'minus', '2020-06-16 07:48:00', '2020-06-16 07:48:00'),
(49, 1, 1, 'Penambahan 1 Point', 'plus', '2020-06-16 08:05:58', '2020-06-16 08:05:58'),
(50, 1, 495, 'Pembelian Instagram Followers PROMO 1 ( BOT ) TERMURAH LQ Dengan Jumlah 495', 'minus', '2020-06-16 08:05:58', '2020-06-16 08:05:58'),
(51, 1, 10000, 'Transfer Saldo Ke triplex1230@gmail.com', 'minus', '2020-06-16 08:50:46', '2020-06-16 08:50:46'),
(52, 3, 10000, 'Menerima Saldo Dari bosspulsa57@gmail.com', 'plus', '2020-06-16 08:50:46', '2020-06-16 08:50:46'),
(53, 1, 57102, 'Transfer Saldo Ke bydzreal@gmail.com', 'minus', '2020-06-16 09:11:09', '2020-06-16 09:11:09'),
(54, 56, 57102, 'Menerima Saldo Dari bosspulsa57@gmail.com', 'plus', '2020-06-16 09:11:09', '2020-06-16 09:11:09'),
(55, 1, 0, 'Penambahan 0 Point', 'plus', '2020-06-16 09:11:44', '2020-06-16 09:11:44'),
(56, 1, 0, 'Pembelian Instagram View SERVER RMD 1 GRATIS SELAMANYA Dengan Jumlah 0', 'minus', '2020-06-16 09:11:44', '2020-06-16 09:11:44'),
(57, 1, 0, 'Penambahan 0 Point', 'plus', '2020-06-16 09:12:57', '2020-06-16 09:12:57'),
(58, 1, 0, 'Pembelian Instagram View SERVER RMD 1 GRATIS SELAMANYA Dengan Jumlah 0', 'minus', '2020-06-16 09:12:57', '2020-06-16 09:12:57'),
(59, 1, 0, 'Penambahan 0 Point', 'plus', '2020-06-16 09:14:48', '2020-06-16 09:14:48'),
(60, 1, 0, 'Pembelian Instagram View SERVER RMD 1 GRATIS SELAMANYA Dengan Jumlah 0', 'minus', '2020-06-16 09:14:48', '2020-06-16 09:14:48'),
(61, 1, 5850, 'Pembelian Telkomsel 5.000 Dengan Jumlah 5850', 'minus', '2020-06-16 16:44:58', '2020-06-16 16:44:58'),
(62, 1, 0, 'Penambahan 0 Point', 'plus', '2020-06-16 16:47:34', '2020-06-16 16:47:34'),
(63, 1, 0, 'Pembelian Instagram View SERVER RMD 1 GRATIS SELAMANYA Dengan Jumlah 0', 'minus', '2020-06-16 16:47:34', '2020-06-16 16:47:34'),
(64, 1, 1, 'Penambahan 1 Point', 'plus', '2020-06-16 16:48:05', '2020-06-16 16:48:05'),
(65, 1, 290, 'Pembelian Instagram Likes RMD 1 ( INSTAN ~ MAX 15K ) Dengan Jumlah 290', 'minus', '2020-06-16 16:48:05', '2020-06-16 16:48:05'),
(66, 1, 1700, 'Pembelian Telkomsel 1.000 Dengan Jumlah 1700', 'minus', '2020-06-16 16:50:33', '2020-06-16 16:50:33'),
(67, 1, 2850, 'Pembelian Telkomsel 2.000 Dengan Jumlah 2850', 'minus', '2020-06-16 16:50:52', '2020-06-16 16:50:52'),
(68, 1, 5850, 'Pembelian Telkomsel 5.000 Dengan Jumlah 5850', 'minus', '2020-06-16 17:02:46', '2020-06-16 17:02:46'),
(69, 1, 2850, 'Pembelian Telkomsel 2.000 Dengan Jumlah 2850', 'minus', '2020-06-16 17:21:34', '2020-06-16 17:21:34'),
(70, 1, 2850, 'Pembelian Telkomsel 2.000 Dengan Jumlah 2850', 'minus', '2020-06-16 17:26:26', '2020-06-16 17:26:26'),
(71, 1, 5780, 'Pembelian Indosat 5.000 Dengan Jumlah 5780', 'minus', '2020-06-16 17:28:54', '2020-06-16 17:28:54'),
(72, 1, 1700, 'Pembelian Telkomsel 1.000 Dengan Jumlah 1700', 'minus', '2020-06-16 17:32:26', '2020-06-16 17:32:26'),
(73, 1, 2850, 'Pembelian Telkomsel 2.000 Dengan Jumlah 2850', 'minus', '2020-06-16 17:32:39', '2020-06-16 17:32:39'),
(74, 1, 2850, 'Pembelian Telkomsel 2.000 Dengan Jumlah 2850', 'minus', '2020-06-16 17:34:18', '2020-06-16 17:34:18'),
(75, 1, 2850, 'Pembelian Telkomsel 2.000 Dengan Jumlah 2850', 'minus', '2020-06-16 17:35:03', '2020-06-16 17:35:03'),
(76, 1, 1700, 'Pembelian Telkomsel 1.000 Dengan Jumlah 1700', 'minus', '2020-06-16 17:40:17', '2020-06-16 17:40:17'),
(77, 1, 2850, 'Pembelian Telkomsel 2.000 Dengan Jumlah 2850', 'minus', '2020-06-16 17:42:41', '2020-06-16 17:42:41'),
(78, 1, 2850, 'Pembelian Telkomsel 2.000 Dengan Jumlah 2850', 'minus', '2020-06-16 17:44:11', '2020-06-16 17:44:11'),
(79, 1, 1700, 'Pembelian Telkomsel 1.000 Dengan Jumlah 1700', 'minus', '2020-06-16 17:46:46', '2020-06-16 17:46:46'),
(80, 1, 1700, 'Pembelian Telkomsel 1.000 Dengan Jumlah 1700', 'minus', '2020-06-16 17:47:40', '2020-06-16 17:47:40'),
(81, 1, 2850, 'Pembelian Telkomsel 2.000 Dengan Jumlah 2850', 'minus', '2020-06-16 17:47:54', '2020-06-16 17:47:54'),
(82, 1, 1700, 'Pembelian Telkomsel 1.000 Dengan Jumlah 1700', 'minus', '2020-06-16 17:53:14', '2020-06-16 17:53:14'),
(83, 1, 1700, 'Pembelian Telkomsel 1.000 Dengan Jumlah 1700', 'minus', '2020-06-16 17:54:16', '2020-06-16 17:54:16'),
(84, 1, 31212, 'Transfer Saldo Ke rikichannel7@gmail.com', 'minus', '2020-06-16 18:28:55', '2020-06-16 18:28:55'),
(85, 31, 31212, 'Menerima Saldo Dari bosspulsa57@gmail.com', 'plus', '2020-06-16 18:28:55', '2020-06-16 18:28:55'),
(86, 1, 103539, 'Transfer Saldo Ke muhamfarhan65@gmail.com', 'minus', '2020-06-16 18:48:09', '2020-06-16 18:48:09'),
(87, 54, 103539, 'Menerima Saldo Dari bosspulsa57@gmail.com', 'plus', '2020-06-16 18:48:09', '2020-06-16 18:48:09'),
(88, 1, 250000, 'Transfer Saldo Ke alifstore95@gmail.com', 'minus', '2020-06-16 18:59:44', '2020-06-16 18:59:44'),
(89, 24, 250000, 'Menerima Saldo Dari bosspulsa57@gmail.com', 'plus', '2020-06-16 18:59:44', '2020-06-16 18:59:44'),
(90, 1, 50769, 'Transfer Saldo Ke rianariansyah337@gmail.com', 'minus', '2020-06-16 19:03:07', '2020-06-16 19:03:07'),
(91, 38, 50769, 'Menerima Saldo Dari bosspulsa57@gmail.com', 'plus', '2020-06-16 19:03:07', '2020-06-16 19:03:07'),
(92, 1, 46000, 'Transfer Saldo Ke rvn.dropdead@gmail.com', 'minus', '2020-06-16 19:24:46', '2020-06-16 19:24:46'),
(93, 62, 46000, 'Menerima Saldo Dari bosspulsa57@gmail.com', 'plus', '2020-06-16 19:24:46', '2020-06-16 19:24:46'),
(94, 1, 36095, 'Transfer Saldo Ke firmansyah04092003@gmail.com', 'minus', '2020-06-16 20:42:22', '2020-06-16 20:42:22'),
(95, 28, 36095, 'Menerima Saldo Dari bosspulsa57@gmail.com', 'plus', '2020-06-16 20:42:22', '2020-06-16 20:42:22'),
(96, 1, 7100, 'Transfer Saldo Ke yosiaaser5@gmail.com', 'minus', '2020-06-16 20:42:51', '2020-06-16 20:42:51'),
(97, 64, 7100, 'Menerima Saldo Dari bosspulsa57@gmail.com', 'plus', '2020-06-16 20:42:51', '2020-06-16 20:42:51'),
(98, 1, 27986, 'Transfer Saldo Ke hes01pedia@gmail.com', 'minus', '2020-06-16 20:46:10', '2020-06-16 20:46:10'),
(99, 25, 27986, 'Menerima Saldo Dari bosspulsa57@gmail.com', 'plus', '2020-06-16 20:46:10', '2020-06-16 20:46:10'),
(100, 1, 10000, 'Transfer Saldo Ke prohomint17@gmail.com', 'minus', '2020-06-17 02:04:05', '2020-06-17 02:04:05'),
(101, 41, 10000, 'Menerima Saldo Dari bosspulsa57@gmail.com', 'plus', '2020-06-17 02:04:05', '2020-06-17 02:04:05'),
(102, 41, 0, 'Penambahan 0 Point', 'plus', '2020-06-17 02:47:14', '2020-06-17 02:47:14'),
(103, 41, 0, 'Pembelian Instagram View SERVER RMD 1 GRATIS SELAMANYA Dengan Jumlah 0', 'minus', '2020-06-17 02:47:14', '2020-06-17 02:47:14'),
(104, 41, 0, 'Penambahan 0 Point', 'plus', '2020-06-17 02:47:43', '2020-06-17 02:47:43'),
(105, 41, 0, 'Pembelian Instagram View SERVER RMD 1 GRATIS SELAMANYA Dengan Jumlah 0', 'minus', '2020-06-17 02:47:43', '2020-06-17 02:47:43'),
(106, 28, 1, 'Penambahan 1 Point', 'plus', '2020-06-17 03:03:34', '2020-06-17 03:03:34'),
(107, 28, 400, 'Pembelian Instagram Followers RMD 1 ( BOT ~ MAX 20K ) INSTAN Dengan Jumlah 400', 'minus', '2020-06-17 03:03:34', '2020-06-17 03:03:34'),
(108, 1, 1, 'Penambahan 1 Point', 'plus', '2020-06-17 03:20:58', '2020-06-17 03:20:58'),
(109, 1, 450, 'Pembelian Instagram Followers PROMO 1 ( BOT ) TERMURAH LQ Dengan Jumlah 450', 'minus', '2020-06-17 03:20:58', '2020-06-17 03:20:58'),
(110, 1, 1700, 'Pembelian Telkomsel 1.000 Dengan Jumlah 1700', 'minus', '2020-06-17 03:23:46', '2020-06-17 03:23:46'),
(111, 28, 1, 'Penambahan 1 Point', 'plus', '2020-06-17 04:51:05', '2020-06-17 04:51:05'),
(112, 28, 3900, 'Pembelian Instagram Followers ( SuperFast ~ Max 30k ) Dengan Jumlah 3900', 'minus', '2020-06-17 04:51:05', '2020-06-17 04:51:05'),
(113, 1, 0, 'Penambahan 0 Point', 'plus', '2020-06-17 06:54:21', '2020-06-17 06:54:21'),
(114, 1, 0, 'Pembelian Instagram View SERVER RMD 1 GRATIS SELAMANYA Dengan Jumlah 0', 'minus', '2020-06-17 06:54:21', '2020-06-17 06:54:21'),
(115, 63, 0, 'Penambahan 0 Point', 'plus', '2020-06-17 07:11:39', '2020-06-17 07:11:39'),
(116, 63, 0, 'Pembelian Instagram View SERVER RMD 1 GRATIS SELAMANYA Dengan Jumlah 0', 'minus', '2020-06-17 07:11:39', '2020-06-17 07:11:39'),
(117, 24, 5, 'Penambahan 5 Point', 'plus', '2020-06-17 07:34:43', '2020-06-17 07:34:43'),
(118, 24, 5000, 'Pembelian Instagram Followers Indonesia ( REAL ACCOUNT ~ INSTAN ~ SUPERFAST ) HQ Dengan Jumlah 5000', 'minus', '2020-06-17 07:34:43', '2020-06-17 07:34:43'),
(119, 24, 5, 'Penambahan 5 Point', 'plus', '2020-06-17 07:40:54', '2020-06-17 07:40:54'),
(120, 24, 7000, 'Pembelian Instagram Followers Indonesia [ REAL AKTIF ~ MAX 100K ] Dengan Jumlah 7000', 'minus', '2020-06-17 07:40:54', '2020-06-17 07:40:54'),
(121, 24, 1, 'Penambahan 1 Point', 'plus', '2020-06-17 07:41:29', '2020-06-17 07:41:29'),
(122, 24, 4000, 'Pembelian Instagram Followers RMD 1 ( BOT ~ MAX 20K ) INSTAN Dengan Jumlah 4000', 'minus', '2020-06-17 07:41:29', '2020-06-17 07:41:29'),
(123, 56, 1700, 'Pembelian Telkomsel 1.000 Dengan Jumlah 1700', 'minus', '2020-06-17 12:01:55', '2020-06-17 12:01:55'),
(124, 1, 1700, 'Pembelian Telkomsel 1.000 Dengan Jumlah 1700', 'minus', '2020-06-17 22:49:04', '2020-06-17 22:49:04'),
(125, 1, 7100, 'Transfer Saldo Ke dfrisetiawan@gmail.com', 'minus', '2020-06-18 01:01:56', '2020-06-18 01:01:56'),
(126, 75, 7100, 'Menerima Saldo Dari bosspulsa57@gmail.com', 'plus', '2020-06-18 01:01:56', '2020-06-18 01:01:56'),
(127, 1, 42786, 'Transfer Saldo Ke hadiyoung112@gmail.com', 'minus', '2020-06-18 01:12:42', '2020-06-18 01:12:42'),
(128, 21, 42786, 'Menerima Saldo Dari bosspulsa57@gmail.com', 'plus', '2020-06-18 01:12:42', '2020-06-18 01:12:42'),
(129, 28, 1575, 'Pembelian Instagram Followers PROMO 1 ( BOT ) TERMURAH LQ Dengan Jumlah 1575', 'minus', '2020-06-18 02:28:26', '2020-06-18 02:28:26'),
(130, 56, 49200, 'Pembelian XL 50.000 Dengan Jumlah 49200', 'minus', '2020-06-18 04:37:11', '2020-06-18 04:37:11'),
(131, 25, 10335, 'Pembelian Telkomsel 10.000 Dengan Jumlah 10335', 'minus', '2020-06-18 04:55:19', '2020-06-18 04:55:19'),
(132, 28, 1950, 'Pembelian Instagram Followers ( SuperFast ~ Max 30k ) Dengan Jumlah 1950', 'minus', '2020-06-18 05:22:48', '2020-06-18 05:22:48'),
(133, 28, 3900, 'Pembelian Instagram Followers ( SuperFast ~ Max 30k ) Dengan Jumlah 3900', 'minus', '2020-06-18 05:27:39', '2020-06-18 05:27:39'),
(134, 28, 1550, 'Pembelian Instagram Likes RMD 5 ( MAX 3K ~ CHEAP ) Dengan Jumlah 1550', 'minus', '2020-06-18 05:38:58', '2020-06-18 05:38:58'),
(135, 31, 400, 'Pembelian Instagram Followers RMD 1 ( BOT ~ MAX 20K ) INSTAN Dengan Jumlah 400', 'minus', '2020-06-18 09:36:50', '2020-06-18 09:36:50'),
(136, 54, 96820, 'Pembelian Indosat 100.000 Dengan Jumlah 96820', 'minus', '2020-06-18 10:05:21', '2020-06-18 10:05:21'),
(137, 54, 96820, 'Pembelian Indosat 100.000 Dengan Jumlah 96820', 'minus', '2020-06-18 10:06:17', '2020-06-18 10:06:17'),
(138, 54, 5825, 'Pembelian XL 5.000 Dengan Jumlah 5825', 'minus', '2020-06-18 10:08:30', '2020-06-18 10:08:30'),
(139, 54, 5825, 'Pembelian XL 5.000 Dengan Jumlah 5825', 'minus', '2020-06-18 10:09:00', '2020-06-18 10:09:00'),
(140, 25, 15050, 'Pembelian Telkomsel 15.000 Dengan Jumlah 15050', 'minus', '2020-06-18 20:15:04', '2020-06-18 20:15:04'),
(141, 1, 20000, 'Transfer Saldo Ke ferdiansahxd@gmail.com', 'minus', '2020-06-19 02:48:52', '2020-06-19 02:48:52'),
(142, 84, 20000, 'Menerima Saldo Dari bosspulsa57@gmail.com', 'plus', '2020-06-19 02:48:52', '2020-06-19 02:48:52'),
(143, 1, 50000, 'Transfer Saldo Ke kiikyy02@gmail.com', 'minus', '2020-06-19 02:50:02', '2020-06-19 02:50:02'),
(144, 83, 50000, 'Menerima Saldo Dari bosspulsa57@gmail.com', 'plus', '2020-06-19 02:50:02', '2020-06-19 02:50:02'),
(145, 21, 600, 'Pembelian Instagram Likes PROMO 2 [ INSTAN] HQ Dengan Jumlah 600', 'minus', '2020-06-19 03:33:42', '2020-06-19 03:33:42'),
(146, 21, 600, 'Pembelian Instagram Likes PROMO 2 [ INSTAN] HQ Dengan Jumlah 600', 'minus', '2020-06-19 03:33:44', '2020-06-19 03:33:44'),
(147, 1, 12000, 'Transfer Saldo Ke botekiki22@gmail.com', 'minus', '2020-06-19 05:31:16', '2020-06-19 05:31:16'),
(148, 58, 12000, 'Menerima Saldo Dari bosspulsa57@gmail.com', 'plus', '2020-06-19 05:31:16', '2020-06-19 05:31:16'),
(149, 41, 5100, 'Pembelian Smart 5.000 Dengan Jumlah 5100', 'minus', '2020-06-19 07:49:52', '2020-06-19 07:49:52'),
(150, 54, 96820, 'Pembelian Indosat 100.000 Dengan Jumlah 96820', 'minus', '2020-06-19 08:09:56', '2020-06-19 08:09:56'),
(151, 1, 22000, 'Transfer Saldo Ke nailanwar919@gmail.com', 'minus', '2020-06-19 23:10:26', '2020-06-19 23:10:26'),
(152, 29, 22000, 'Menerima Saldo Dari bosspulsa57@gmail.com', 'plus', '2020-06-19 23:10:26', '2020-06-19 23:10:26'),
(153, 29, 3100, 'Pembelian Instagram Followers PROMO 2  ( INSTAN ) LQ Dengan Jumlah 3100', 'minus', '2020-06-19 23:33:30', '2020-06-19 23:33:30'),
(154, 1, 12491, 'Transfer Saldo Ke adityarakap99@gmail.com', 'minus', '2020-06-20 00:59:01', '2020-06-20 00:59:01'),
(155, 82, 12491, 'Menerima Saldo Dari bosspulsa57@gmail.com', 'plus', '2020-06-20 00:59:01', '2020-06-20 00:59:01'),
(156, 62, 10000, 'Pembelian Instagram Followers Refill RMD 1 [ Refill 30 days ] [ 5K/day ] Dengan Jumlah 10000', 'minus', '2020-06-20 19:10:03', '2020-06-20 19:10:03'),
(157, 21, 3400, 'Pembelian Instagram Likes Indonesia RMD 1 ( TERMURAH ~ REKOMENDASI ) Dengan Jumlah 3400', 'minus', '2020-06-20 20:06:07', '2020-06-20 20:06:07'),
(158, 58, 11000, 'Transfer Saldo Ke ulungbrian@gmail.com', 'minus', '2020-06-21 05:43:01', '2020-06-21 05:43:01'),
(159, 22, 11000, 'Menerima Saldo Dari botekiki22@gmail.com', 'plus', '2020-06-21 05:43:01', '2020-06-21 05:43:01'),
(160, 92, 20000, 'Pembelian Instagram Followers Refill RMD 1 [ Refill 30 days ] [ 5K/day ] Dengan Jumlah 20000', 'minus', '2020-06-22 01:17:47', '2020-06-22 01:17:47'),
(161, 92, 20000, 'Pembelian Instagram Followers Refill RMD 1 [ Refill 30 days ] [ 5K/day ] Dengan Jumlah 20000', 'minus', '2020-06-22 01:19:16', '2020-06-22 01:19:16'),
(162, 22, 10920, 'Pembelian Instagram Followers Indonesia EMD 2 [ FAST ~ REAL ACTIVE ~ MAX 1K ] Dengan Jumlah 10920', 'minus', '2020-06-22 01:29:58', '2020-06-22 01:29:58'),
(163, 24, 196200, 'Pembelian Telkomsel 200.000 Dengan Jumlah 196200', 'minus', '2020-06-22 01:31:59', '2020-06-22 01:31:59'),
(164, 24, 59250, 'Pembelian Telkomsel 60.000 Dengan Jumlah 59250', 'minus', '2020-06-22 01:34:35', '2020-06-22 01:34:35'),
(165, 24, 59250, 'Pembelian Telkomsel 60.000 Dengan Jumlah 59250', 'minus', '2020-06-22 01:35:51', '2020-06-22 01:35:51'),
(166, 38, 20000, 'Pembelian Instagram Followers Refill RMD 1 [ Refill 30 days ] [ 5K/day ] Dengan Jumlah 20000', 'minus', '2020-06-22 01:39:26', '2020-06-22 01:39:26'),
(167, 24, 59250, 'Pembelian Telkomsel 60.000 Dengan Jumlah 59250', 'minus', '2020-06-22 01:41:43', '2020-06-22 01:41:43'),
(168, 56, 6000, 'Pembelian Instagram Followers RMD 1 ( BOT ~ MAX 20K ) INSTAN Dengan Jumlah 6000', 'minus', '2020-06-22 03:44:16', '2020-06-22 03:44:16'),
(169, 41, 19750, 'Pembelian Smart 20.000 Dengan Jumlah 19750', 'minus', '2020-06-22 06:59:46', '2020-06-22 06:59:46'),
(170, 1, 10000, 'Transfer Saldo Ke skychkzoya@gmail.com', 'minus', '2020-06-22 08:28:24', '2020-06-22 08:28:24'),
(171, 121, 10000, 'Menerima Saldo Dari bosspulsa57@gmail.com', 'plus', '2020-06-22 08:28:24', '2020-06-22 08:28:24'),
(172, 1, 50000, 'Transfer Saldo Ke rianariansyah337@gmail.com', 'minus', '2020-06-22 08:52:25', '2020-06-22 08:52:25'),
(173, 38, 50000, 'Menerima Saldo Dari bosspulsa57@gmail.com', 'plus', '2020-06-22 08:52:25', '2020-06-22 08:52:25'),
(174, 29, 5780, 'Pembelian Indosat 5.000 Dengan Jumlah 5780', 'minus', '2020-06-22 15:33:56', '2020-06-22 15:33:56'),
(175, 29, 5325, 'Pembelian Three 5.000 Dengan Jumlah 5325', 'minus', '2020-06-22 15:34:39', '2020-06-22 15:34:39'),
(176, 21, 850, 'Pembelian Instagram Likes Indonesia RMD 1 ( TERMURAH ~ REKOMENDASI ) Dengan Jumlah 850', 'minus', '2020-06-23 01:02:20', '2020-06-23 01:02:20'),
(177, 21, 1700, 'Pembelian Instagram Likes Indonesia RMD 1 ( TERMURAH ~ REKOMENDASI ) Dengan Jumlah 1700', 'minus', '2020-06-23 01:23:41', '2020-06-23 01:23:41'),
(178, 1, 10960, 'Transfer Saldo Ke prohomint17@gmail.com', 'minus', '2020-06-23 06:55:48', '2020-06-23 06:55:48'),
(179, 41, 10960, 'Menerima Saldo Dari bosspulsa57@gmail.com', 'plus', '2020-06-23 06:55:48', '2020-06-23 06:55:48'),
(180, 41, 16000, 'Transfer Saldo Ke bayuanwari98@gmail.com', 'minus', '2020-06-23 07:29:17', '2020-06-23 07:29:17'),
(181, 126, 16000, 'Menerima Saldo Dari prohomint17@gmail.com', 'plus', '2020-06-23 07:29:17', '2020-06-23 07:29:17'),
(182, 21, 850, 'Pembelian Instagram Likes Indonesia RMD 1 ( TERMURAH ~ REKOMENDASI ) Dengan Jumlah 850', 'minus', '2020-06-24 01:42:59', '2020-06-24 01:42:59'),
(183, 126, 15050, 'Pembelian Telkomsel 15.000 Dengan Jumlah 15050', 'minus', '2020-06-24 03:01:40', '2020-06-24 03:01:40'),
(184, 121, 8500, 'Pembelian Instagram Followers ( SuperFast ~ Bot ~ Instan ~ HQ ) ) Dengan Jumlah 8500', 'minus', '2020-06-24 03:02:43', '2020-06-24 03:02:43'),
(185, 126, 10200, 'Pembelian Saldo Dana 10.000 Dengan Jumlah 10200', 'minus', '2020-06-24 03:03:53', '2020-06-24 03:03:53'),
(186, 21, 1700, 'Pembelian Instagram Followers ( SuperFast ~ Bot ~ Instan ~ HQ ) ) Dengan Jumlah 1700', 'minus', '2020-06-24 03:47:01', '2020-06-24 03:47:01'),
(187, 1, 10200, 'Transfer Saldo Ke bayuanwari98@gmail.com', 'minus', '2020-06-24 04:36:59', '2020-06-24 04:36:59'),
(188, 126, 10200, 'Menerima Saldo Dari bosspulsa57@gmail.com', 'plus', '2020-06-24 04:36:59', '2020-06-24 04:36:59'),
(189, 126, 15050, 'Pembelian Telkomsel 15.000 Dengan Jumlah 15050', 'minus', '2020-06-24 04:38:55', '2020-06-24 04:38:55'),
(190, 1, 12150, 'Transfer Saldo Ke prohomint17@gmail.com', 'minus', '2020-06-24 04:51:31', '2020-06-24 04:51:31'),
(191, 41, 12150, 'Menerima Saldo Dari bosspulsa57@gmail.com', 'plus', '2020-06-24 04:51:31', '2020-06-24 04:51:31'),
(192, 126, 10335, 'Pembelian Telkomsel 10.000 Dengan Jumlah 10335', 'minus', '2020-06-24 05:05:47', '2020-06-24 05:05:47'),
(193, 29, 8500, 'Pembelian Instagram Followers ( SuperFast ~ Bot ~ Instan ~ HQ ) ) Dengan Jumlah 8500', 'minus', '2020-06-24 05:07:50', '2020-06-24 05:07:50'),
(194, 41, 8500, 'Pembelian Instagram Followers ( SuperFast ~ Bot ~ Instan ~ HQ ) ) Dengan Jumlah 8500', 'minus', '2020-06-24 05:11:10', '2020-06-24 05:11:10'),
(195, 54, 5325, 'Pembelian Three 5.000 Dengan Jumlah 5325', 'minus', '2020-06-24 05:11:21', '2020-06-24 05:11:21'),
(196, 126, 5325, 'Pembelian Three 5.000 Dengan Jumlah 5325', 'minus', '2020-06-24 05:57:37', '2020-06-24 05:57:37'),
(197, 29, 7718, 'Pembelian Instagram Followers ( SuperFast ~ Bot ~ Instan ~ HQ ) ) Dengan Jumlah 7718', 'minus', '2020-06-24 06:27:05', '2020-06-24 06:27:05'),
(198, 28, 10200, 'Pembelian Saldo Dana 10.000 Dengan Jumlah 10200', 'minus', '2020-06-24 10:17:55', '2020-06-24 10:17:55'),
(199, 1, 1700, 'Pembelian Telkomsel 1.000 Dengan Jumlah 1700', 'minus', '2020-06-24 18:54:40', '2020-06-24 18:54:40'),
(200, 1, 2850, 'Pembelian Telkomsel 2.000 Dengan Jumlah 2850', 'minus', '2020-06-24 18:57:07', '2020-06-24 18:57:07'),
(201, 1, 5325, 'Pembelian Three 5.000 Dengan Jumlah 5325', 'minus', '2020-06-24 18:59:08', '2020-06-24 18:59:08'),
(202, 121, 1496, 'Pembelian Instagram Followers ( SuperFast ~ Bot ~ Instan ~ HQ ) ) Dengan Jumlah 1496', 'minus', '2020-06-24 23:05:13', '2020-06-24 23:05:13'),
(203, 21, 20160, 'Pembelian Token PLN 20.000 Dengan Jumlah 20160', 'minus', '2020-06-25 01:59:43', '2020-06-25 01:59:43'),
(204, 1, 25308, 'Transfer Saldo Ke nailanwar919@gmail.com', 'minus', '2020-06-25 02:39:45', '2020-06-25 02:39:45'),
(205, 29, 25308, 'Menerima Saldo Dari bosspulsa57@gmail.com', 'plus', '2020-06-25 02:39:45', '2020-06-25 02:39:45'),
(206, 29, 8500, 'Pembelian Instagram Followers ( SuperFast ~ Bot ~ Instan ~ HQ ) ) Dengan Jumlah 8500', 'minus', '2020-06-25 02:41:05', '2020-06-25 02:41:05'),
(207, 41, 65000, 'Pembelian Instagram Followers RMD 3 ( BOT ~ NO REFFIL ) CHEAP Dengan Jumlah 65000', 'minus', '2020-06-25 03:10:10', '2020-06-25 03:10:10'),
(208, 29, 16805, 'Pembelian Instagram Followers ( SuperFast ~ Bot ~ Instan ~ HQ ) ) Dengan Jumlah 16804.5', 'minus', '2020-06-25 07:13:44', '2020-06-25 07:13:44'),
(209, 21, 1275, 'Pembelian Instagram Likes Indonesia RMD 1 ( TERMURAH ~ REKOMENDASI ) Dengan Jumlah 1275', 'minus', '2020-06-25 11:02:55', '2020-06-25 11:02:55'),
(210, 21, 4250, 'Pembelian Instagram Followers ( SuperFast ~ Bot ~ Instan ~ HQ ) ) Dengan Jumlah 4250', 'minus', '2020-06-25 11:04:10', '2020-06-25 11:04:10'),
(211, 1, 92000, 'Transfer Saldo Ke skychkzoya@gmail.com', 'minus', '2020-06-26 01:42:07', '2020-06-26 01:42:07'),
(212, 121, 92000, 'Menerima Saldo Dari bosspulsa57@gmail.com', 'plus', '2020-06-26 01:42:07', '2020-06-26 01:42:07'),
(213, 121, 45640, 'Pembelian Garena 165 Shell Dengan Jumlah 45640', 'minus', '2020-06-26 01:44:16', '2020-06-26 01:44:16'),
(214, 121, 45640, 'Pembelian Garena 165 Shell Dengan Jumlah 45640', 'minus', '2020-06-26 02:03:40', '2020-06-26 02:03:40'),
(215, 31, 5500, 'Transfer Saldo Ke prohomint17@gmail.com', 'minus', '2020-06-26 19:39:12', '2020-06-26 19:39:12'),
(216, 41, 5500, 'Menerima Saldo Dari rikichannel7@gmail.com', 'plus', '2020-06-26 19:39:12', '2020-06-26 19:39:12'),
(217, 41, 15100, 'Pembelian Telkomsel Telepon 20.000 Dengan Jumlah 15100', 'minus', '2020-06-26 19:41:14', '2020-06-26 19:41:14'),
(218, 41, 20150, 'Pembelian Telkomsel 20.000 Dengan Jumlah 20150', 'minus', '2020-06-26 20:15:33', '2020-06-26 20:15:33'),
(219, 1, 176025, 'Transfer Saldo Ke toniznn11@gmail.com', 'minus', '2020-06-27 05:23:17', '2020-06-27 05:23:17'),
(220, 85, 176025, 'Menerima Saldo Dari bosspulsa57@gmail.com', 'plus', '2020-06-27 05:23:17', '2020-06-27 05:23:17'),
(221, 85, 100200, 'Pembelian Saldo Dana 100.000 Dengan Jumlah 100200', 'minus', '2020-06-27 05:54:42', '2020-06-27 05:54:42'),
(222, 1, 44217, 'Transfer Saldo Ke toniznn11@gmail.com', 'minus', '2020-06-27 06:52:49', '2020-06-27 06:52:49'),
(223, 85, 44217, 'Menerima Saldo Dari bosspulsa57@gmail.com', 'plus', '2020-06-27 06:52:49', '2020-06-27 06:52:49'),
(224, 85, 100200, 'Pembelian Saldo Dana 100.000 Dengan Jumlah 100200', 'minus', '2020-06-27 14:04:34', '2020-06-27 14:04:34'),
(225, 85, 20200, 'Pembelian Saldo Dana 20.000 Dengan Jumlah 20200', 'minus', '2020-06-27 14:05:13', '2020-06-27 14:05:13'),
(226, 85, 100200, 'Pembelian Saldo Dana 100.000 Dengan Jumlah 100200', 'minus', '2020-06-27 14:07:44', '2020-06-27 14:07:44'),
(227, 85, 100200, 'Pembelian Saldo Dana 100.000 Dengan Jumlah 100200', 'minus', '2020-06-27 15:15:27', '2020-06-27 15:15:27'),
(228, 85, 75200, 'Pembelian Saldo Dana 75.000 Dengan Jumlah 75200', 'minus', '2020-06-27 15:22:05', '2020-06-27 15:22:05'),
(229, 85, 100200, 'Pembelian Saldo Dana 100.000 Dengan Jumlah 100200', 'minus', '2020-06-27 18:28:44', '2020-06-27 18:28:44'),
(230, 38, 35000, 'Pembelian Instagram Followers Reffil RMD 5 ( REFFIL 30D ~ REAL ~ MIXED ) INSTAN Dengan Jumlah 35000', 'minus', '2020-06-27 23:06:03', '2020-06-27 23:06:03'),
(231, 85, 10200, 'Pembelian Saldo Dana 10.000 Dengan Jumlah 10200', 'minus', '2020-06-28 00:53:19', '2020-06-28 00:53:19'),
(232, 21, 9000, 'Pembelian Instagram Followers Indonesia EMD 2 [ FAST ~ REAL ACTIVE ~ MAX 1K ] Dengan Jumlah 9000', 'minus', '2020-06-28 01:15:34', '2020-06-28 01:15:34'),
(233, 92, 40200, 'Pembelian Saldo Dana 40.000 Dengan Jumlah 40200', 'minus', '2020-06-28 02:07:37', '2020-06-28 02:07:37'),
(234, 38, 35000, 'Pembelian Instagram Followers Reffil RMD 5 ( REFFIL 30D ~ REAL ~ MIXED ) INSTAN Dengan Jumlah 35000', 'minus', '2020-06-28 03:26:21', '2020-06-28 03:26:21'),
(235, 83, 48900, 'Pembelian Indosat 50.000 Dengan Jumlah 48900', 'minus', '2020-06-28 08:22:04', '2020-06-28 08:22:04'),
(236, 1, 50000, 'Transfer Saldo Ke prohomint17@gmail.com', 'minus', '2020-06-28 08:44:34', '2020-06-28 08:44:34'),
(237, 41, 50000, 'Menerima Saldo Dari bosspulsa57@gmail.com', 'plus', '2020-06-28 08:44:34', '2020-06-28 08:44:34'),
(238, 41, 50000, 'Pembelian Facebook Page Likes  [ R30D ~ New ] Dengan Jumlah 50000', 'minus', '2020-06-28 09:04:08', '2020-06-28 09:04:08'),
(239, 1, 72000, 'Transfer Saldo Ke morristioarrival@gmail.com', 'minus', '2020-06-29 00:32:30', '2020-06-29 00:32:30'),
(240, 45, 72000, 'Menerima Saldo Dari bosspulsa57@gmail.com', 'plus', '2020-06-29 00:32:30', '2020-06-29 00:32:30'),
(241, 45, 5950, 'Pembelian Instagram Likes Indonesia RMD 1 ( TERMURAH ~ REKOMENDASI ) Dengan Jumlah 5950', 'minus', '2020-06-29 00:47:02', '2020-06-29 00:47:02'),
(242, 45, 8500, 'Pembelian Instagram Likes Indonesia RMD 1 ( TERMURAH ~ REKOMENDASI ) Dengan Jumlah 8500', 'minus', '2020-06-29 00:52:29', '2020-06-29 00:52:29'),
(243, 1, 750, 'Pembelian Instagram Likes RMD 2 ( NO REFFIL ~ INSTAN ) Dengan Jumlah 750', 'minus', '2020-06-29 01:26:29', '2020-06-29 01:26:29'),
(244, 1, 2850, 'Pembelian Telkomsel 2.000 Dengan Jumlah 2850', 'minus', '2020-06-29 03:46:31', '2020-06-29 03:46:31'),
(245, 1, 80, 'Pembelian Instagram Followers RMD 4 ( INSTAN ~ NO REFFIL ~ MAX 25K ) CHEAP Dengan Jumlah 80', 'minus', '2020-06-29 06:59:42', '2020-06-29 06:59:42'),
(246, 151, 8000, 'Pembelian Instagram Followers RMD 4 ( INSTAN ~ NO REFFIL ~ MAX 25K ) CHEAP Dengan Jumlah 8000', 'minus', '2020-06-29 07:04:12', '2020-06-29 07:04:12'),
(247, 31, 3000, 'Pembelian Instagram Followers Reffil RMD 2 [ REFILL 30 DAYS] Dengan Jumlah 3000', 'minus', '2020-06-29 10:32:49', '2020-06-29 10:32:49'),
(248, 85, 10200, 'Pembelian Saldo Dana 10.000 Dengan Jumlah 10200', 'minus', '2020-06-29 18:00:35', '2020-06-29 18:00:35'),
(249, 45, 9000, 'Pembelian Instagram Likes Indonesia ( HQ ~ SUPERFAST ~ MAX 1K ) Dengan Jumlah 9000', 'minus', '2020-06-29 18:04:44', '2020-06-29 18:04:44'),
(250, 28, 20200, 'Pembelian Saldo Dana 20.000 Dengan Jumlah 20200', 'minus', '2020-06-30 07:14:41', '2020-06-30 07:14:41'),
(251, 1, 70000, 'Transfer Saldo Ke prohomint17@gmail.com', 'minus', '2020-06-30 08:01:47', '2020-06-30 08:01:47'),
(252, 41, 70000, 'Menerima Saldo Dari bosspulsa57@gmail.com', 'plus', '2020-06-30 08:01:47', '2020-06-30 08:01:47'),
(253, 41, 50000, 'Pembelian Facebook Page Likes  [ R30D ~ New ] Dengan Jumlah 50000', 'minus', '2020-06-30 08:03:40', '2020-06-30 08:03:40'),
(254, 41, 19790, 'Pembelian Smart 20.000 Dengan Jumlah 19790', 'minus', '2020-06-30 08:17:03', '2020-06-30 08:17:03'),
(255, 64, 5850, 'Pembelian Telkomsel 5.000 Dengan Jumlah 5850', 'minus', '2020-06-30 09:40:18', '2020-06-30 09:40:18'),
(256, 1, 650, 'Pembelian Instagram Likes RMD 1 ( INSTAN ~ MAX 15K ) EXCLUSIVE Dengan Jumlah 650', 'minus', '2020-06-30 21:46:44', '2020-06-30 21:46:44'),
(257, 1, 90, 'Pembelian Instagram Likes RMD 3 ( SUPERFAST ~ INSTAN ) MAX 5K Dengan Jumlah 90', 'minus', '2020-06-30 21:47:12', '2020-06-30 21:47:12'),
(258, 1, 750, 'Pembelian Instagram Likes RMD 2 ( NO REFFIL ~ INSTAN ) Dengan Jumlah 750', 'minus', '2020-06-30 21:48:25', '2020-06-30 21:48:25'),
(259, 1, 50180, 'Transfer Saldo Ke prohomint17@gmail.com', 'minus', '2020-07-01 16:49:59', '2020-07-01 16:49:59'),
(260, 41, 50180, 'Menerima Saldo Dari bosspulsa57@gmail.com', 'plus', '2020-07-01 16:49:59', '2020-07-01 16:49:59'),
(261, 1, 32500, 'Transfer Saldo Ke prohomint17@gmail.com', 'minus', '2020-07-01 20:00:56', '2020-07-01 20:00:56'),
(262, 41, 32500, 'Menerima Saldo Dari bosspulsa57@gmail.com', 'plus', '2020-07-01 20:00:56', '2020-07-01 20:00:56'),
(263, 41, 80000, 'Pembelian Instagram Followers RMD 4 ( INSTAN ~ NO REFFIL ~ MAX 25K ) CHEAP Dengan Jumlah 80000', 'minus', '2020-07-01 20:09:25', '2020-07-01 20:09:25'),
(264, 38, 6060, 'Pembelian Instagram Followers Indonesia RMD 2 [ FAST ~ REAL ACTIVE ~ MAX 1K ] Dengan Jumlah 6060', 'minus', '2020-07-01 23:54:08', '2020-07-01 23:54:08'),
(265, 1, 14761, 'Transfer Saldo Ke achmadlemon23@gmail.com', 'minus', '2020-07-02 05:01:53', '2020-07-02 05:01:53'),
(266, 89, 14761, 'Menerima Saldo Dari bosspulsa57@gmail.com', 'plus', '2020-07-02 05:01:53', '2020-07-02 05:01:53'),
(267, 45, 7500, 'Pembelian Instagram Likes Indonesia ( HQ ~ SUPERFAST ~ MAX 1K ) Dengan Jumlah 7500', 'minus', '2020-07-02 10:21:35', '2020-07-02 10:21:35'),
(268, 45, 8500, 'Pembelian Instagram Likes Indonesia RMD 1 ( TERMURAH ~ REKOMENDASI ) Dengan Jumlah 8500', 'minus', '2020-07-02 13:39:23', '2020-07-02 13:39:23'),
(269, 38, 9000, 'Pembelian Instagram Followers Indonesia RMD 2 [ FAST ~ REAL ACTIVE ~ MAX 1K ] Dengan Jumlah 9000', 'minus', '2020-07-03 15:57:12', '2020-07-03 15:57:12'),
(270, 1, 92000, 'Transfer Saldo Ke skychkzoya@gmail.com', 'minus', '2020-07-03 20:27:33', '2020-07-03 20:27:33'),
(271, 121, 92000, 'Menerima Saldo Dari bosspulsa57@gmail.com', 'plus', '2020-07-03 20:27:33', '2020-07-03 20:27:33'),
(272, 121, 45640, 'Pembelian Garena 165 Shell Dengan Jumlah 45640', 'minus', '2020-07-03 20:48:21', '2020-07-03 20:48:21'),
(273, 121, 45640, 'Pembelian Garena 165 Shell Dengan Jumlah 45640', 'minus', '2020-07-03 20:48:29', '2020-07-03 20:48:29'),
(274, 31, 20200, 'Pembelian Saldo Dana 20.000 Dengan Jumlah 20200', 'minus', '2020-07-03 20:51:36', '2020-07-03 20:51:36'),
(275, 1, 50500, 'Pembelian Saldo Ovo 50.000 Dengan Jumlah 50500', 'minus', '2020-07-03 21:22:26', '2020-07-03 21:22:26'),
(276, 1, 50500, 'Pembelian Saldo Ovo 50.000 Dengan Jumlah 50500', 'minus', '2020-07-03 21:26:44', '2020-07-03 21:26:44'),
(277, 1, 50200, 'Pembelian Saldo Dana 50.000 Dengan Jumlah 50200', 'minus', '2020-07-03 21:29:43', '2020-07-03 21:29:43'),
(278, 41, 10200, 'Pembelian Saldo Dana 10.000 Dengan Jumlah 10200', 'minus', '2020-07-03 22:34:12', '2020-07-03 22:34:12'),
(279, 45, 8500, 'Pembelian Instagram Likes Indonesia RMD 1 ( TERMURAH ~ REKOMENDASI ) Dengan Jumlah 8500', 'minus', '2020-07-04 01:41:57', '2020-07-04 01:41:57'),
(280, 89, 13000, 'Pembelian Instagram Likes  [ NO DROP ~ Max 25K ~ 1 / 3 k Hour ] Dengan Jumlah 13000', 'minus', '2020-07-04 04:42:18', '2020-07-04 04:42:18'),
(281, 45, 125, 'Pembelian Instagram View + Impressions ( SuperFast ~ New ) Dengan Jumlah 125', 'minus', '2020-07-04 06:14:17', '2020-07-04 06:14:17'),
(282, 45, 8500, 'Pembelian Instagram Likes Indonesia RMD 1 ( TERMURAH ~ REKOMENDASI ) Dengan Jumlah 8500', 'minus', '2020-07-04 06:22:25', '2020-07-04 06:22:25'),
(283, 45, 175, 'Pembelian Instagram View + Impressions ( SuperFast ~ New ) Dengan Jumlah 175', 'minus', '2020-07-04 06:25:54', '2020-07-04 06:25:54'),
(284, 45, 175, 'Pembelian Instagram View + Impressions ( SuperFast ~ New ) Dengan Jumlah 175', 'minus', '2020-07-04 17:28:16', '2020-07-04 17:28:16'),
(285, 1, 190000, 'Transfer Saldo Ke achmadlemon23@gmail.com', 'minus', '2020-07-05 02:18:09', '2020-07-05 02:18:09'),
(286, 89, 190000, 'Menerima Saldo Dari bosspulsa57@gmail.com', 'plus', '2020-07-05 02:18:09', '2020-07-05 02:18:09'),
(287, 89, 160000, 'Pembelian Youtube Subscribe [ R30D ] [ CHEAP ~ SUPERFAST ] Dengan Jumlah 160000', 'minus', '2020-07-05 02:20:11', '2020-07-05 02:20:11'),
(288, 1, 26000, 'Transfer Saldo Ke andialiflubis@gmail.com', 'minus', '2020-07-05 02:23:45', '2020-07-05 02:23:45'),
(289, 162, 26000, 'Menerima Saldo Dari bosspulsa57@gmail.com', 'plus', '2020-07-05 02:23:45', '2020-07-05 02:23:45'),
(290, 162, 5389, 'Pembelian Instagram Likes RMD 1 ( INSTAN ~ MAX 15K ) EXCLUSIVE Dengan Jumlah 5388.5', 'minus', '2020-07-05 02:48:37', '2020-07-05 02:48:37'),
(291, 162, 750, 'Pembelian Instagram View + Impressions ( SuperFast ~ New ) Dengan Jumlah 750', 'minus', '2020-07-05 02:56:56', '2020-07-05 02:56:56'),
(292, 85, 9190, 'Pembelian Garena 33 Shell Dengan Jumlah 9190', 'minus', '2020-07-05 05:36:32', '2020-07-05 05:36:32'),
(293, 89, 16000, 'Pembelian Youtube Subscribe [ R30D ] [ CHEAP ~ SUPERFAST ] Dengan Jumlah 16000', 'minus', '2020-07-05 06:01:27', '2020-07-05 06:01:27'),
(294, 1, 16000, 'Transfer Saldo Ke achmadlemon23@gmail.com', 'minus', '2020-07-05 06:02:50', '2020-07-05 06:02:50'),
(295, 89, 16000, 'Menerima Saldo Dari bosspulsa57@gmail.com', 'plus', '2020-07-05 06:02:50', '2020-07-05 06:02:50'),
(296, 162, 10150, 'Pembelian By.U 10.000 Dengan Jumlah 10150', 'minus', '2020-07-05 09:35:57', '2020-07-05 09:35:57'),
(297, 89, 9500, 'Pembelian Instagram Likes RMD 5 ( MAX 10K ~ LESSDROP ) Dengan Jumlah 9500', 'minus', '2020-07-06 04:13:41', '2020-07-06 04:13:41'),
(298, 41, 10200, 'Pembelian Saldo Dana 10.000 Dengan Jumlah 10200', 'minus', '2020-07-06 04:39:36', '2020-07-06 04:39:36'),
(299, 1, 10587, 'Transfer Saldo Ke pubgbg103@gmail.com', 'minus', '2020-07-06 06:08:00', '2020-07-06 06:08:00'),
(300, 95, 10587, 'Menerima Saldo Dari bosspulsa57@gmail.com', 'plus', '2020-07-06 06:08:00', '2020-07-06 06:08:00'),
(301, 95, 3400, 'Pembelian Instagram Likes Indonesia RMD 1 ( TERMURAH ~ REKOMENDASI ) Dengan Jumlah 3400', 'minus', '2020-07-06 06:12:18', '2020-07-06 06:12:18'),
(302, 95, 5500, 'Pembelian Instagram Followers Indonesia ( REAL ACCOUNT ~ INSTAN ~ SUPERFAST ) HQ Dengan Jumlah 5500', 'minus', '2020-07-06 06:28:40', '2020-07-06 06:28:40'),
(303, 1, 100000, 'Transfer Saldo Ke kiikyy02@gmail.com', 'minus', '2020-07-06 07:46:13', '2020-07-06 07:46:13'),
(304, 83, 100000, 'Menerima Saldo Dari bosspulsa57@gmail.com', 'plus', '2020-07-06 07:46:13', '2020-07-06 07:46:13'),
(305, 41, 9930, 'Pembelian Smart 10.000 Dengan Jumlah 9930', 'minus', '2020-07-06 07:57:01', '2020-07-06 07:57:01'),
(306, 83, 56000, 'Pembelian Instagram Followers Indonesia [ REAL AKTIF ~ MAX 1K ] Dengan Jumlah 56000', 'minus', '2020-07-06 08:06:36', '2020-07-06 08:06:36'),
(307, 83, 5100, 'Pembelian Instagram Likes Indonesia RMD 1 ( TERMURAH ~ REKOMENDASI ) Dengan Jumlah 5100', 'minus', '2020-07-06 08:08:10', '2020-07-06 08:08:10'),
(308, 1, 30200, 'Pembelian Saldo Dana 30.000 Dengan Jumlah 30200', 'minus', '2020-07-06 08:46:41', '2020-07-06 08:46:41'),
(309, 1, 5620, 'Pembelian Saldo Go Pay 5.000 Dengan Jumlah 5620', 'minus', '2020-07-06 09:05:19', '2020-07-06 09:05:19'),
(310, 1, 50000, 'Transfer Saldo Ke mfajarilham13@gmail.com', 'minus', '2020-07-06 19:50:22', '2020-07-06 19:50:22'),
(311, 171, 50000, 'Menerima Saldo Dari bosspulsa57@gmail.com', 'plus', '2020-07-06 19:50:22', '2020-07-06 19:50:22'),
(312, 171, 17500, 'Pembelian Instagram Followers Indonesia [ REAL AKTIF ~ MAX 1K ] Dengan Jumlah 17500', 'minus', '2020-07-06 19:52:19', '2020-07-06 19:52:19'),
(313, 45, 100, 'Pembelian instagram view ( Cheap ~ Instan ~ SuperFast ) Dengan Jumlah 100', 'minus', '2020-07-06 21:20:21', '2020-07-06 21:20:21'),
(314, 45, 7500, 'Pembelian Instagram Likes Indonesia ( HQ ~ SUPERFAST ~ MAX 1K ) Dengan Jumlah 7500', 'minus', '2020-07-06 21:26:34', '2020-07-06 21:26:34'),
(315, 89, 5500, 'Pembelian Instagram Followers Indonesia ( REAL ACCOUNT ~ INSTAN ~ SUPERFAST ) HQ Dengan Jumlah 5500', 'minus', '2020-07-06 22:15:54', '2020-07-06 22:15:54'),
(316, 41, 10200, 'Pembelian Saldo Dana 10.000 Dengan Jumlah 10200', 'minus', '2020-07-06 23:06:56', '2020-07-06 23:06:56'),
(317, 1, 120000, 'Transfer Saldo Ke achmadlemon23@gmail.com', 'minus', '2020-07-06 23:23:51', '2020-07-06 23:23:51'),
(318, 89, 120000, 'Menerima Saldo Dari bosspulsa57@gmail.com', 'plus', '2020-07-06 23:23:51', '2020-07-06 23:23:51'),
(319, 89, 55000, 'Pembelian Instagram Followers Indonesia ( REAL ACCOUNT ~ INSTAN ~ SUPERFAST ) HQ Dengan Jumlah 55000', 'minus', '2020-07-06 23:35:32', '2020-07-06 23:35:32'),
(320, 45, 125, 'Pembelian Instagram View + Impressions ( SuperFast ~ New ) Dengan Jumlah 125', 'minus', '2020-07-07 00:09:26', '2020-07-07 00:09:26'),
(321, 41, 10200, 'Pembelian Saldo Dana 10.000 Dengan Jumlah 10200', 'minus', '2020-07-07 00:19:50', '2020-07-07 00:19:50'),
(322, 41, 10200, 'Pembelian Saldo Dana 10.000 Dengan Jumlah 10200', 'minus', '2020-07-07 00:22:08', '2020-07-07 00:22:08'),
(323, 41, 10200, 'Pembelian Saldo Dana 10.000 Dengan Jumlah 10200', 'minus', '2020-07-07 00:31:24', '2020-07-07 00:31:24'),
(324, 45, 18, 'Pembelian Instagram View + Impressions ( SuperFast ~ New ) Dengan Jumlah 17.5', 'minus', '2020-07-07 03:12:11', '2020-07-07 03:12:11'),
(325, 41, 20200, 'Pembelian Saldo Dana 20.000 Dengan Jumlah 20200', 'minus', '2020-07-07 03:16:28', '2020-07-07 03:16:28'),
(326, 45, 100, 'Pembelian instagram view ( Cheap ~ Instan ~ SuperFast ) Dengan Jumlah 100', 'minus', '2020-07-07 04:05:35', '2020-07-07 04:05:35'),
(327, 1, 10000, 'Transfer Saldo Ke rizkysulivant@gmail.com', 'minus', '2020-07-07 07:28:17', '2020-07-07 07:28:17'),
(328, 79, 10000, 'Menerima Saldo Dari bosspulsa57@gmail.com', 'plus', '2020-07-07 07:28:17', '2020-07-07 07:28:17'),
(329, 79, 100, 'Pembelian instagram view ( Cheap ~ Instan ~ SuperFast ) Dengan Jumlah 100', 'minus', '2020-07-07 09:16:11', '2020-07-07 09:16:11'),
(330, 1, 750, 'Pembelian Instagram Likes RMD 2 ( NO REFFIL ~ INSTAN ) Dengan Jumlah 750', 'minus', '2020-07-07 09:35:16', '2020-07-07 09:35:16'),
(331, 79, 1000, 'Pembelian instagram view ( Cheap ~ Instan ~ SuperFast ) Dengan Jumlah 1000', 'minus', '2020-07-07 09:42:50', '2020-07-07 09:42:50'),
(332, 45, 100, 'Pembelian instagram view ( Cheap ~ Instan ~ SuperFast ) Dengan Jumlah 100', 'minus', '2020-07-07 09:46:08', '2020-07-07 09:46:08'),
(333, 79, 7000, 'Pembelian Instagram Followers ( TERMURAH ~ No Reffil ~ INSTAN ) Dengan Jumlah 7000', 'minus', '2020-07-07 09:49:37', '2020-07-07 09:49:37'),
(334, 1, 2500, 'Pembelian Instagram Followers Indonesia [INSTAN] MAX 300 Dengan Jumlah 2500', 'minus', '2020-07-07 09:54:13', '2020-07-07 09:54:13'),
(335, 83, 17500, 'Pembelian Instagram Followers Indonesia RMD 1 [ CHEAP ] INSTAN Dengan Jumlah 17500', 'minus', '2020-07-07 10:02:19', '2020-07-07 10:02:19'),
(336, 79, 1625, 'Pembelian Instagram Likes RMD 1 ( INSTAN ~ MAX 15K ) EXCLUSIVE Dengan Jumlah 1625', 'minus', '2020-07-07 11:48:58', '2020-07-07 11:48:58'),
(337, 171, 27500, 'Pembelian Instagram Followers Indonesia ( REAL ACCOUNT ~ INSTAN ~ SUPERFAST ) HQ Dengan Jumlah 27500', 'minus', '2020-07-07 21:15:24', '2020-07-07 21:15:24'),
(338, 41, 10200, 'Pembelian Saldo Dana 10.000 Dengan Jumlah 10200', 'minus', '2020-07-07 22:16:55', '2020-07-07 22:16:55'),
(339, 41, 10335, 'Pembelian Telkomsel 10.000 Dengan Jumlah 10335', 'minus', '2020-07-08 03:28:18', '2020-07-08 03:28:18'),
(340, 1, 90000, 'Transfer Saldo Ke skychkzoya@gmail.com', 'minus', '2020-07-08 04:54:13', '2020-07-08 04:54:13'),
(341, 121, 90000, 'Menerima Saldo Dari bosspulsa57@gmail.com', 'plus', '2020-07-08 04:54:13', '2020-07-08 04:54:13'),
(342, 121, 91240, 'Pembelian Garena 330 Shell Dengan Jumlah 91240', 'minus', '2020-07-08 04:55:36', '2020-07-08 04:55:36'),
(343, 83, 10825, 'Pembelian Indosat 10.000 Dengan Jumlah 10825', 'minus', '2020-07-08 06:28:06', '2020-07-08 06:28:06'),
(344, 45, 100, 'Pembelian instagram view ( Cheap ~ Instan ~ SuperFast ) Dengan Jumlah 100', 'minus', '2020-07-08 09:36:11', '2020-07-08 09:36:11'),
(345, 45, 100, 'Pembelian instagram view ( Cheap ~ Instan ~ SuperFast ) Dengan Jumlah 100', 'minus', '2020-07-08 09:38:36', '2020-07-08 09:38:36'),
(346, 45, 250, 'Pembelian Instagram View + Impressions ( SuperFast ~ New ) Dengan Jumlah 250', 'minus', '2020-07-09 02:12:16', '2020-07-09 02:12:16'),
(347, 89, 55000, 'Pembelian Instagram Followers Indonesia ( REAL ACCOUNT ~ INSTAN ~ SUPERFAST ) HQ Dengan Jumlah 55000', 'minus', '2020-07-09 04:19:24', '2020-07-09 04:19:24'),
(348, 1, 120000, 'Transfer Saldo Ke hes01pedia@gmail.com', 'minus', '2020-07-09 05:14:52', '2020-07-09 05:14:52'),
(349, 25, 120000, 'Menerima Saldo Dari bosspulsa57@gmail.com', 'plus', '2020-07-09 05:14:52', '2020-07-09 05:14:52'),
(350, 89, 10000, 'Pembelian Instagram Followers RMD 3 ( BOT ~ NO REFFIL ) SuperFast Dengan Jumlah 10000', 'minus', '2020-07-09 07:06:25', '2020-07-09 07:06:25'),
(351, 1, 10000, 'Transfer Saldo Ke achmadlemon23@gmail.com', 'minus', '2020-07-09 07:10:50', '2020-07-09 07:10:50'),
(352, 89, 10000, 'Menerima Saldo Dari bosspulsa57@gmail.com', 'plus', '2020-07-09 07:10:50', '2020-07-09 07:10:50'),
(353, 89, 9000, 'Pembelian Instagram Followers RMD 1 ( BOT ~ MAX 25K )  Dengan Jumlah 9000', 'minus', '2020-07-09 08:03:31', '2020-07-09 08:03:31'),
(354, 1, 10000, 'Transfer Saldo Ke achmadlemon23@gmail.com', 'minus', '2020-07-09 08:07:46', '2020-07-09 08:07:46'),
(355, 89, 10000, 'Menerima Saldo Dari bosspulsa57@gmail.com', 'plus', '2020-07-09 08:07:46', '2020-07-09 08:07:46'),
(356, 45, 150, 'Pembelian Instagram View + Impressions ( SuperFast ~ New ) Dengan Jumlah 150', 'minus', '2020-07-10 01:35:30', '2020-07-10 01:35:30'),
(357, 45, 100, 'Pembelian instagram view ( Cheap ~ Instan ~ SuperFast ) Dengan Jumlah 100', 'minus', '2020-07-10 01:54:27', '2020-07-10 01:54:27'),
(358, 45, 100, 'Pembelian instagram view ( Cheap ~ Instan ~ SuperFast ) Dengan Jumlah 100', 'minus', '2020-07-11 00:30:49', '2020-07-11 00:30:49'),
(359, 1, 100000, 'Transfer Saldo Ke widyantororico@gmail.com', 'minus', '2020-07-11 16:59:14', '2020-07-11 16:59:14'),
(360, 179, 100000, 'Menerima Saldo Dari bosspulsa57@gmail.com', 'plus', '2020-07-11 16:59:14', '2020-07-11 16:59:14'),
(361, 179, 7500, 'Pembelian Instagram Followers Indonesia [INSTAN] MAX 300 Dengan Jumlah 7500', 'minus', '2020-07-11 20:03:49', '2020-07-11 20:03:49'),
(362, 179, 45000, 'Pembelian Instagram Followers Refill RMD 1 [ Refill 30 days ] [ 5K/day ] Dengan Jumlah 45000', 'minus', '2020-07-11 20:12:16', '2020-07-11 20:12:16'),
(363, 179, 33000, 'Pembelian Instagram Followers Reffil RMD 2 [ REFILL 30 DAYS] Dengan Jumlah 33000', 'minus', '2020-07-11 23:01:18', '2020-07-11 23:01:18'),
(364, 62, 16500, 'Pembelian Instagram Followers Indonesia ( REAL ACCOUNT ~ INSTAN ~ SUPERFAST ) HQ Dengan Jumlah 16500', 'minus', '2020-07-12 04:47:04', '2020-07-12 04:47:04'),
(365, 89, 19250, 'Pembelian Instagram Followers Indonesia ( REAL ACCOUNT ~ INSTAN ~ SUPERFAST ) HQ Dengan Jumlah 19250', 'minus', '2020-07-12 20:24:57', '2020-07-12 20:24:57'),
(366, 45, 200, 'Pembelian Instagram View + Impressions ( SuperFast ~ New ) Dengan Jumlah 200', 'minus', '2020-07-12 21:50:15', '2020-07-12 21:50:15'),
(367, 1, 8000, 'Transfer Saldo Ke dandisubhani22@gmail.com', 'minus', '2020-07-12 22:18:54', '2020-07-12 22:18:54'),
(368, 182, 8000, 'Menerima Saldo Dari bosspulsa57@gmail.com', 'plus', '2020-07-12 22:18:54', '2020-07-12 22:18:54'),
(369, 89, 9000, 'Pembelian Instagram Followers RMD 1 ( BOT ~ MAX 25K )  Dengan Jumlah 9000', 'minus', '2020-07-12 22:26:45', '2020-07-12 22:26:45'),
(370, 182, 2500, 'Pembelian Instagram Likes Indonesia RMD 2 ( TERMURAH ~ INSTAN ) Dengan Jumlah 2500', 'minus', '2020-07-12 22:34:20', '2020-07-12 22:34:20'),
(371, 1, 1700, 'Pembelian Telkomsel 1.000 Dengan Jumlah 1700 Melalui API', 'minus', '2020-07-12 23:36:16', '2020-07-12 23:36:16'),
(372, 1, 25000, 'Transfer Saldo Ke davidtamvans23@gmail.com', 'minus', '2020-07-12 23:44:22', '2020-07-12 23:44:22'),
(373, 152, 25000, 'Menerima Saldo Dari bosspulsa57@gmail.com', 'plus', '2020-07-12 23:44:22', '2020-07-12 23:44:22'),
(374, 152, 3400, 'Pembelian Instagram Likes Indonesia RMD 1 ( TERMURAH ~ REKOMENDASI ) Dengan Jumlah 3400', 'minus', '2020-07-12 23:49:01', '2020-07-12 23:49:01'),
(375, 151, 1700, 'Pembelian Telkomsel 1.000 Dengan Jumlah 1700', 'minus', '2020-07-12 23:52:37', '2020-07-12 23:52:37'),
(376, 152, 5250, 'Pembelian Instagram Likes Indonesia [ INSTAN ~ SUPERFAST ~ MAX 5K ] [CEK DESCRIPTION] Dengan Jumlah 5250', 'minus', '2020-07-13 00:02:13', '2020-07-13 00:02:13'),
(377, 152, 5500, 'Pembelian Instagram Followers Indonesia ( REAL ACCOUNT ~ INSTAN ~ SUPERFAST ) HQ Dengan Jumlah 5500', 'minus', '2020-07-13 00:18:50', '2020-07-13 00:18:50'),
(378, 152, 5500, 'Pembelian Instagram Followers Indonesia ( REAL ACCOUNT ~ INSTAN ~ SUPERFAST ) HQ Dengan Jumlah 5500', 'minus', '2020-07-13 00:19:13', '2020-07-13 00:19:13'),
(379, 45, 300, 'Pembelian Instagram View + Impressions ( SuperFast ~ New ) Dengan Jumlah 300', 'minus', '2020-07-13 00:22:06', '2020-07-13 00:22:06'),
(380, 45, 50, 'Pembelian Instagram View + Impressions ( SuperFast ~ New ) Dengan Jumlah 50', 'minus', '2020-07-13 02:19:30', '2020-07-13 02:19:30'),
(381, 45, 200, 'Pembelian instagram view ( Cheap ~ Instan ~ SuperFast ) Dengan Jumlah 200', 'minus', '2020-07-13 02:37:44', '2020-07-13 02:37:44'),
(382, 1, 9217, 'Transfer Saldo Ke gifanapriadi@gmail.com', 'minus', '2020-07-13 04:56:46', '2020-07-13 04:56:46'),
(383, 30, 9217, 'Menerima Saldo Dari bosspulsa57@gmail.com', 'plus', '2020-07-13 04:56:46', '2020-07-13 04:56:46'),
(384, 1, 25000, 'Transfer Saldo Ke mochtoby12@gmail.com', 'minus', '2020-07-13 05:33:02', '2020-07-13 05:33:02'),
(385, 174, 25000, 'Menerima Saldo Dari bosspulsa57@gmail.com', 'plus', '2020-07-13 05:33:02', '2020-07-13 05:33:02'),
(386, 45, 150, 'Pembelian Instagram View + Impressions ( SuperFast ~ New ) Dengan Jumlah 150', 'minus', '2020-07-13 15:53:03', '2020-07-13 15:53:03'),
(387, 45, 50, 'Pembelian Instagram View + Impressions ( SuperFast ~ New ) Dengan Jumlah 50', 'minus', '2020-07-13 16:10:48', '2020-07-13 16:10:48'),
(388, 45, 1275, 'Pembelian Instagram Likes Indonesia RMD 1 ( TERMURAH ~ REKOMENDASI ) Dengan Jumlah 1275', 'minus', '2020-07-13 20:55:22', '2020-07-13 20:55:22'),
(389, 45, 150, 'Pembelian Instagram View + Impressions ( SuperFast ~ New ) Dengan Jumlah 150', 'minus', '2020-07-13 20:56:15', '2020-07-13 20:56:15'),
(390, 45, 3400, 'Pembelian Instagram Likes Indonesia RMD 1 ( TERMURAH ~ REKOMENDASI ) Dengan Jumlah 3400', 'minus', '2020-07-13 23:11:45', '2020-07-13 23:11:45'),
(391, 89, 5500, 'Pembelian Instagram Followers Indonesia ( REAL ACCOUNT ~ INSTAN ~ SUPERFAST ) HQ Dengan Jumlah 5500', 'minus', '2020-07-13 23:38:00', '2020-07-13 23:38:00'),
(392, 1, 7500, 'Pembelian Instagram Followers Indonesia [INSTAN] MAX 300 Dengan Jumlah 7500', 'minus', '2020-07-14 00:13:01', '2020-07-14 00:13:01'),
(393, 89, 1725, 'Pembelian Instagram Likes RMD 4 ( NO DROP ~ NO REFFIL ) Dengan Jumlah 1725', 'minus', '2020-07-14 03:16:20', '2020-07-14 03:16:20'),
(394, 89, 1150, 'Pembelian Instagram Likes RMD 4 ( NO DROP ~ NO REFFIL ) Dengan Jumlah 1150', 'minus', '2020-07-14 03:16:45', '2020-07-14 03:16:45'),
(395, 89, 1150, 'Pembelian Instagram Likes RMD 4 ( NO DROP ~ NO REFFIL ) Dengan Jumlah 1150', 'minus', '2020-07-14 03:17:08', '2020-07-14 03:17:08'),
(396, 89, 1150, 'Pembelian Instagram Likes RMD 4 ( NO DROP ~ NO REFFIL ) Dengan Jumlah 1150', 'minus', '2020-07-14 03:17:35', '2020-07-14 03:17:35');
INSERT INTO `history_saldos` (`id`, `user_id`, `jumlah`, `keterangan`, `status`, `created_at`, `updated_at`) VALUES
(397, 89, 1150, 'Pembelian Instagram Likes RMD 4 ( NO DROP ~ NO REFFIL ) Dengan Jumlah 1150', 'minus', '2020-07-14 03:17:54', '2020-07-14 03:17:54'),
(398, 1, 15000, 'Transfer Saldo Ke achmadlemon23@gmail.com', 'minus', '2020-07-14 03:24:02', '2020-07-14 03:24:02'),
(399, 89, 15000, 'Menerima Saldo Dari bosspulsa57@gmail.com', 'plus', '2020-07-14 03:24:02', '2020-07-14 03:24:02'),
(400, 45, 1700, 'Pembelian Instagram Likes Indonesia RMD 1 ( TERMURAH ~ REKOMENDASI ) Dengan Jumlah 1700', 'minus', '2020-07-14 06:24:55', '2020-07-14 06:24:55'),
(401, 45, 100, 'Pembelian Instagram View + Impressions ( SuperFast ~ New ) Dengan Jumlah 100', 'minus', '2020-07-14 06:49:42', '2020-07-14 06:49:42'),
(402, 41, 1000, 'Pembelian TikTok Dengan Jumlah 1000', 'minus', '2020-07-14 07:33:59', '2020-07-14 07:33:59'),
(403, 162, 1500, 'Pembelian Instagram Likes PROMO 1 [ INSTAN] [ SUPER CHEAP ] LQ Dengan Jumlah 1500', 'minus', '2020-07-14 10:14:54', '2020-07-14 10:14:54'),
(404, 182, 525, 'Pembelian Instagram Followers PROMO 1 ( BOT ) TERMURAH LQ Dengan Jumlah 525', 'minus', '2020-07-14 11:15:27', '2020-07-14 11:15:27'),
(405, 1, 15634, 'Transfer Saldo Ke jebehunchek@gmail.com', 'minus', '2020-07-14 19:35:34', '2020-07-14 19:35:34'),
(406, 190, 15634, 'Menerima Saldo Dari bosspulsa57@gmail.com', 'plus', '2020-07-14 19:35:34', '2020-07-14 19:35:34'),
(407, 25, 5850, 'Pembelian Telkomsel 5.000 Dengan Jumlah 5850', 'minus', '2020-07-14 20:04:16', '2020-07-14 20:04:16'),
(408, 89, 3060, 'Pembelian Instagram Followers PROMO 2 ( INSTAN ) LQ Dengan Jumlah 3060', 'minus', '2020-07-14 21:13:10', '2020-07-14 21:13:10'),
(409, 89, 2550, 'Pembelian Instagram Likes Indonesia RMD 1 ( TERMURAH ~ REKOMENDASI ) Dengan Jumlah 2550', 'minus', '2020-07-14 22:02:18', '2020-07-14 22:02:18'),
(410, 1, 84000, 'Transfer Saldo Ke izulmunir74@gmail.com', 'minus', '2020-07-14 22:23:43', '2020-07-14 22:23:43'),
(411, 197, 84000, 'Menerima Saldo Dari bosspulsa57@gmail.com', 'plus', '2020-07-14 22:23:43', '2020-07-14 22:23:43'),
(412, 197, 2550, 'Pembelian Instagram Followers PROMO 2 ( INSTAN ) LQ Dengan Jumlah 2550', 'minus', '2020-07-14 22:50:51', '2020-07-14 22:50:51'),
(413, 45, 100, 'Pembelian Instagram View + Impressions ( SuperFast ~ New ) Dengan Jumlah 100', 'minus', '2020-07-15 03:32:41', '2020-07-15 03:32:41'),
(414, 45, 100, 'Pembelian Instagram View + Impressions ( SuperFast ~ New ) Dengan Jumlah 100', 'minus', '2020-07-15 03:33:12', '2020-07-15 03:33:12'),
(415, 82, 3500, 'Pembelian Instagram Followers PROMO 1 ( BOT ) TERMURAH LQ Dengan Jumlah 3500', 'minus', '2020-07-15 04:18:03', '2020-07-15 04:18:03'),
(416, 45, 50, 'Pembelian Instagram View + Impressions ( SuperFast ~ New ) Dengan Jumlah 50', 'minus', '2020-07-15 06:06:21', '2020-07-15 06:06:21'),
(417, 1, 14500, 'Transfer Saldo Ke rizkysulivant@gmail.com', 'minus', '2020-07-15 20:45:07', '2020-07-15 20:45:07'),
(418, 79, 14500, 'Menerima Saldo Dari bosspulsa57@gmail.com', 'plus', '2020-07-15 20:45:07', '2020-07-15 20:45:07'),
(419, 79, 3500, 'Pembelian Instagram Followers PROMO 1 ( BOT ) TERMURAH LQ Dengan Jumlah 3500', 'minus', '2020-07-15 20:54:11', '2020-07-15 20:54:11'),
(420, 79, 10000, 'Pembelian Instagram View + Impressions ( SuperFast ~ New ) Dengan Jumlah 10000', 'minus', '2020-07-15 21:00:49', '2020-07-15 21:00:49'),
(421, 79, 900, 'Pembelian Instagram Likes PROMO 1 [ INSTAN] [ SUPER CHEAP ] LQ Dengan Jumlah 900', 'minus', '2020-07-15 21:23:28', '2020-07-15 21:23:28'),
(422, 1, 100179, 'Transfer Saldo Ke imacrosid@gmail.com', 'minus', '2020-07-15 22:47:50', '2020-07-15 22:47:50'),
(423, 206, 100179, 'Menerima Saldo Dari bosspulsa57@gmail.com', 'plus', '2020-07-15 22:47:50', '2020-07-15 22:47:50'),
(424, 206, 91300, 'Pembelian Garena 330 Shell Dengan Jumlah 91300', 'minus', '2020-07-15 22:49:09', '2020-07-15 22:49:09'),
(425, 1, 356400, 'Transfer Saldo Ke imacrosid@gmail.com', 'minus', '2020-07-15 23:02:22', '2020-07-15 23:02:22'),
(426, 206, 356400, 'Menerima Saldo Dari bosspulsa57@gmail.com', 'plus', '2020-07-15 23:02:22', '2020-07-15 23:02:22'),
(427, 206, 91300, 'Pembelian Garena 330 Shell Dengan Jumlah 91300', 'minus', '2020-07-15 23:06:44', '2020-07-15 23:06:44'),
(428, 206, 91300, 'Pembelian Garena 330 Shell Dengan Jumlah 91300', 'minus', '2020-07-15 23:06:55', '2020-07-15 23:06:55'),
(429, 206, 91300, 'Pembelian Garena 330 Shell Dengan Jumlah 91300', 'minus', '2020-07-15 23:07:05', '2020-07-15 23:07:05'),
(430, 206, 91300, 'Pembelian Garena 330 Shell Dengan Jumlah 91300', 'minus', '2020-07-15 23:07:15', '2020-07-15 23:07:15'),
(431, 1, 10000, 'Pembelian Instagram View + Impressions ( SuperFast ~ New ) Dengan Jumlah 10000', 'minus', '2020-07-15 23:51:29', '2020-07-15 23:51:29'),
(432, 1, 5000, 'Pembelian Instagram View + Impressions ( SuperFast ~ New ) Dengan Jumlah 5000', 'minus', '2020-07-16 00:11:24', '2020-07-16 00:11:24'),
(433, 1, 13600, 'Pembelian Instagram Likes Indonesia RMD 1 ( TERMURAH ~ REKOMENDASI ) Dengan Jumlah 13600', 'minus', '2020-07-16 00:25:32', '2020-07-16 00:25:32'),
(434, 79, 300, 'Pembelian Instagram Likes PROMO 1 [ INSTAN] [ SUPER CHEAP ] LQ Dengan Jumlah 300', 'minus', '2020-07-16 01:30:48', '2020-07-16 01:30:48'),
(435, 1, 10000, 'Transfer Saldo Ke rizkysulivant@gmail.com', 'minus', '2020-07-16 01:56:50', '2020-07-16 01:56:50'),
(436, 79, 10000, 'Menerima Saldo Dari bosspulsa57@gmail.com', 'plus', '2020-07-16 01:56:50', '2020-07-16 01:56:50'),
(437, 79, 3500, 'Pembelian Instagram Followers PROMO 1 ( BOT ) TERMURAH LQ Dengan Jumlah 3500', 'minus', '2020-07-16 01:58:32', '2020-07-16 01:58:32'),
(438, 1, 100, 'Penambahan Saldo Dari Poin Sebesar ', 'plus', '2020-07-16 02:25:20', '2020-07-16 02:25:20'),
(439, 79, 2450, 'Pembelian Instagram Followers PROMO 1 ( BOT ) TERMURAH LQ Dengan Jumlah 2450', 'minus', '2020-07-16 02:26:19', '2020-07-16 02:26:19'),
(440, 79, 100, 'Pembelian TikTok Dengan Jumlah 100', 'minus', '2020-07-16 02:32:36', '2020-07-16 02:32:36'),
(441, 182, 1050, 'Pembelian Instagram Followers PROMO 1 ( BOT ) TERMURAH LQ Dengan Jumlah 1050', 'minus', '2020-07-16 03:46:12', '2020-07-16 03:46:12'),
(442, 79, 1750, 'Pembelian Instagram Followers PROMO 1 ( BOT ) TERMURAH LQ Dengan Jumlah 1750', 'minus', '2020-07-16 04:36:58', '2020-07-16 04:36:58'),
(443, 89, 5500, 'Pembelian Instagram Followers Indonesia ( REAL ACCOUNT ~ INSTAN ~ SUPERFAST ) HQ Dengan Jumlah 5500', 'minus', '2020-07-16 05:09:10', '2020-07-16 05:09:10'),
(444, 1, 10000, 'Transfer Saldo Ke prohomint17@gmail.com', 'minus', '2020-07-16 05:20:58', '2020-07-16 05:20:58'),
(445, 41, 10000, 'Menerima Saldo Dari bosspulsa57@gmail.com', 'plus', '2020-07-16 05:20:58', '2020-07-16 05:20:58'),
(446, 41, 7000, 'Pembelian Instagram Followers ( TERMURAH ~ No Reffil ~ INSTAN ) Dengan Jumlah 7000', 'minus', '2020-07-16 05:24:11', '2020-07-16 05:24:11'),
(447, 1, 50000, 'Transfer Saldo Ke rikichannel7@gmail.com', 'minus', '2020-07-16 06:03:40', '2020-07-16 06:03:40'),
(448, 31, 50000, 'Menerima Saldo Dari bosspulsa57@gmail.com', 'plus', '2020-07-16 06:03:40', '2020-07-16 06:03:40'),
(449, 31, 36300, 'Pembelian Instagram Followers Indonesia ( REAL ACCOUNT ~ INSTAN ~ SUPERFAST ) HQ Dengan Jumlah 36300', 'minus', '2020-07-16 06:05:10', '2020-07-16 06:05:10'),
(450, 182, 345, 'Pembelian Instagram Likes PROMO 1 [ INSTAN] [ SUPER CHEAP ] LQ Dengan Jumlah 345', 'minus', '2020-07-16 06:09:13', '2020-07-16 06:09:13'),
(451, 182, 1050, 'Pembelian Instagram Followers PROMO 1 ( BOT ) TERMURAH LQ Dengan Jumlah 1050', 'minus', '2020-07-16 06:45:00', '2020-07-16 06:45:00'),
(452, 182, 525, 'Pembelian Instagram Followers PROMO 1 ( BOT ) TERMURAH LQ Dengan Jumlah 525', 'minus', '2020-07-16 06:48:58', '2020-07-16 06:48:58'),
(453, 79, 4000, 'Pembelian Instagram View + Impressions ( SuperFast ~ New ) Dengan Jumlah 4000', 'minus', '2020-07-16 07:00:12', '2020-07-16 07:00:12'),
(454, 182, 300, 'Pembelian Instagram Likes PROMO 1 [ INSTAN] [ SUPER CHEAP ] LQ Dengan Jumlah 300', 'minus', '2020-07-16 07:03:47', '2020-07-16 07:03:47'),
(455, 182, 300, 'Pembelian Instagram Likes PROMO 1 [ INSTAN] [ SUPER CHEAP ] LQ Dengan Jumlah 300', 'minus', '2020-07-16 07:22:49', '2020-07-16 07:22:49'),
(456, 182, 0, 'Pembelian Instagram View PROMO RMD 1 GRATIS SELAMANYA Dengan Jumlah 0', 'minus', '2020-07-16 07:23:28', '2020-07-16 07:23:28'),
(457, 79, 2013, 'Pembelian Instagram Followers PROMO 1 ( BOT ) TERMURAH LQ Dengan Jumlah 2012.5', 'minus', '2020-07-16 12:59:12', '2020-07-16 12:59:12'),
(458, 179, 73600, 'Pembelian Telkomsel 75.000 Dengan Jumlah 73600', 'minus', '2020-07-16 18:54:41', '2020-07-16 18:54:41'),
(459, 179, 10335, 'Pembelian Telkomsel 10.000 Dengan Jumlah 10335', 'minus', '2020-07-16 18:58:40', '2020-07-16 18:58:40'),
(460, 93, 44000, 'Pembelian Instagram Followers Indonesia ( REAL ACCOUNT ~ INSTAN ~ SUPERFAST ) HQ Dengan Jumlah 44000', 'minus', '2020-07-16 22:59:38', '2020-07-16 22:59:38'),
(461, 89, 10125, 'Pembelian Three 10.000 Dengan Jumlah 10125', 'minus', '2020-07-17 08:01:39', '2020-07-17 08:01:39'),
(462, 1, 50000, 'Transfer Saldo Ke ahmadabdillah181@gmail.com', 'minus', '2020-07-17 09:08:34', '2020-07-17 09:08:34'),
(463, 214, 50000, 'Menerima Saldo Dari bosspulsa57@gmail.com', 'plus', '2020-07-17 09:08:34', '2020-07-17 09:08:34'),
(464, 214, 600, 'Pembelian instagram view ( Cheap ~ Instan ~ SuperFast ) Dengan Jumlah 600', 'minus', '2020-07-17 09:21:21', '2020-07-17 09:21:21'),
(465, 214, 500, 'Pembelian Instagram View + Impressions ( SuperFast ~ New ) Dengan Jumlah 500', 'minus', '2020-07-17 15:25:29', '2020-07-17 15:25:29'),
(466, 45, 75, 'Pembelian Instagram View + Impressions ( SuperFast ~ New ) Dengan Jumlah 75', 'minus', '2020-07-17 21:55:49', '2020-07-17 21:55:49'),
(467, 162, 5500, 'Pembelian By.U 5.000 Dengan Jumlah 5500', 'minus', '2020-07-18 00:23:02', '2020-07-18 00:23:02'),
(468, 1, 40000, 'Transfer Saldo Ke rikichannel7@gmail.com', 'minus', '2020-07-18 04:18:16', '2020-07-18 04:18:16'),
(469, 31, 40000, 'Menerima Saldo Dari bosspulsa57@gmail.com', 'plus', '2020-07-18 04:18:16', '2020-07-18 04:18:16'),
(470, 1, 456500, 'Transfer Saldo Ke imacrosid@gmail.com', 'minus', '2020-07-18 04:25:24', '2020-07-18 04:25:24'),
(471, 206, 456500, 'Menerima Saldo Dari bosspulsa57@gmail.com', 'plus', '2020-07-18 04:25:24', '2020-07-18 04:25:24'),
(472, 206, 91300, 'Pembelian Garena 330 Shell Dengan Jumlah 91300', 'minus', '2020-07-18 04:34:07', '2020-07-18 04:34:07'),
(473, 206, 91300, 'Pembelian Garena 330 Shell Dengan Jumlah 91300', 'minus', '2020-07-18 04:34:14', '2020-07-18 04:34:14'),
(474, 206, 91300, 'Pembelian Garena 330 Shell Dengan Jumlah 91300', 'minus', '2020-07-18 04:34:19', '2020-07-18 04:34:19'),
(475, 206, 91300, 'Pembelian Garena 330 Shell Dengan Jumlah 91300', 'minus', '2020-07-18 04:34:23', '2020-07-18 04:34:23'),
(476, 206, 91300, 'Pembelian Garena 330 Shell Dengan Jumlah 91300', 'minus', '2020-07-18 04:34:27', '2020-07-18 04:34:27'),
(477, 1, 1700, 'Pembelian Telkomsel 1.000 Dengan Jumlah 1700', 'minus', '2020-07-18 04:46:39', '2020-07-18 04:46:39'),
(478, 1, 180, 'Pembelian Instagram Followers PROMO 1 ( BOT ) TERMURAH LQ Dengan Jumlah 180', 'minus', '2020-07-18 06:05:30', '2020-07-18 06:05:30'),
(479, 31, 18480, 'Pembelian Instagram Followers Reffil RMD 1 ( REFIL 30D ~ NEW ) CHEAP Dengan Jumlah 18480', 'minus', '2020-07-18 06:20:00', '2020-07-18 06:20:00'),
(480, 182, 429, 'Pembelian Instagram Likes PROMO 2 [ INSTAN ~ SUPERFAST ~ LQ ] Dengan Jumlah 429', 'minus', '2020-07-18 07:26:52', '2020-07-18 07:26:52'),
(481, 45, 30, 'Pembelian Instagram View + Impressions ( SuperFast ~ New ~ Super Cheap) Dengan Jumlah 30', 'minus', '2020-07-18 08:05:53', '2020-07-18 08:05:53'),
(497, 1, 60000, 'Transfer Saldo Ke mardiansyah.pw14@gmail.com', 'minus', '2020-07-19 01:51:57', '2020-07-19 01:51:57'),
(498, 26, 60000, 'Menerima Saldo Dari bosspulsa57@gmail.com', 'plus', '2020-07-19 01:51:57', '2020-07-19 01:51:57'),
(499, 1, 13000, 'Transfer Saldo Ke achmadlemon23@gmail.com', 'minus', '2020-07-19 06:08:10', '2020-07-19 06:08:10'),
(500, 89, 13000, 'Menerima Saldo Dari bosspulsa57@gmail.com', 'plus', '2020-07-19 06:08:10', '2020-07-19 06:08:10'),
(501, 89, 8500, 'Pembelian Instagram Followers WIKY 2 [ BOT ~ MAX 25K ~ FAST ] Dengan Jumlah 8500', 'minus', '2020-07-19 06:09:43', '2020-07-19 06:09:43'),
(502, 89, 550, 'Pembelian Instagram Likes [ Max 15k ] [ INSTANT ] Dengan Jumlah 550', 'minus', '2020-07-19 06:10:28', '2020-07-19 06:10:28'),
(503, 1, 10550, 'Transfer Saldo Ke firmansyah04092003@gmail.com', 'minus', '2020-07-19 06:18:06', '2020-07-19 06:18:06'),
(504, 28, 10550, 'Menerima Saldo Dari bosspulsa57@gmail.com', 'plus', '2020-07-19 06:18:06', '2020-07-19 06:18:06'),
(505, 1, 15000, 'Transfer Saldo Ke prohomint17@gmail.com', 'minus', '2020-07-19 06:20:01', '2020-07-19 06:20:01'),
(506, 41, 15000, 'Menerima Saldo Dari bosspulsa57@gmail.com', 'plus', '2020-07-19 06:20:01', '2020-07-19 06:20:01'),
(507, 28, 255, 'Pembelian Instagram Followers WIKY 3 [ INSTAN - MAX 10K ] Dengan Jumlah 255', 'minus', '2020-07-19 08:11:20', '2020-07-19 08:11:20'),
(508, 45, 60, 'Pembelian Instagram View + Impressions ( SuperFast ~ New ~ Super Cheap) Dengan Jumlah 60', 'minus', '2020-07-19 10:28:21', '2020-07-19 10:28:21'),
(509, 45, 30, 'Pembelian Instagram View + Impressions ( SuperFast ~ New ~ Super Cheap) Dengan Jumlah 30', 'minus', '2020-07-19 10:45:14', '2020-07-19 10:45:14'),
(510, 45, 60, 'Pembelian Instagram View + Impressions ( SuperFast ~ New ~ Super Cheap) Dengan Jumlah 60', 'minus', '2020-07-19 11:16:07', '2020-07-19 11:16:07'),
(511, 93, 6490, 'Pembelian Instagram Followers Indonesia [ Real Account ~ New ] Dengan Jumlah 6490', 'minus', '2020-07-19 12:51:36', '2020-07-19 12:51:36'),
(512, 31, 2800, 'Pembelian Instagram Followers Reffil RMD 1 ( REFIL 30D ~ NEW ) CHEAP Dengan Jumlah 2800', 'minus', '2020-07-19 18:05:39', '2020-07-19 18:05:39'),
(513, 31, 600, 'Pembelian Instagram View + Impressions ( SuperFast ~ New ~ Super Cheap) Dengan Jumlah 600', 'minus', '2020-07-19 18:06:33', '2020-07-19 18:06:33'),
(514, 45, 90, 'Pembelian Instagram View + Impressions ( SuperFast ~ New ~ Super Cheap) Dengan Jumlah 90', 'minus', '2020-07-19 19:15:39', '2020-07-19 19:15:39'),
(515, 45, 15, 'Pembelian Instagram View + Impressions ( SuperFast ~ New ~ Super Cheap) Dengan Jumlah 15', 'minus', '2020-07-19 21:30:32', '2020-07-19 21:30:32'),
(516, 1, 21000, 'Transfer Saldo Ke dfrisetiawan@gmail.com', 'minus', '2020-07-20 01:56:32', '2020-07-20 01:56:32'),
(517, 75, 21000, 'Menerima Saldo Dari bosspulsa57@gmail.com', 'plus', '2020-07-20 01:56:33', '2020-07-20 01:56:33'),
(518, 75, 5200, 'Pembelian Instagram Followers PROMO 3 ( BOT ~ NO REFFIL ~ MAX 20K ) CHEAP Dengan Jumlah 5200', 'minus', '2020-07-20 02:30:10', '2020-07-20 02:30:10'),
(519, 75, 3000, 'Pembelian Instagram Likes PROMO 1 [ INSTAN] [ SUPER CHEAP ] LQ Dengan Jumlah 3000', 'minus', '2020-07-20 02:35:49', '2020-07-20 02:35:49'),
(520, 45, 60, 'Pembelian Instagram View + Impressions ( SuperFast ~ New ~ Super Cheap) Dengan Jumlah 60', 'minus', '2020-07-20 03:08:44', '2020-07-20 03:08:44'),
(521, 1, 510, 'Pembelian Instagram Followers PROMO 2  ( INSTAN ~ LQ ~ NEW ) CEK NOTE Dengan Jumlah 510', 'minus', '2020-07-20 07:36:00', '2020-07-20 07:36:00'),
(522, 1, 5000, 'Transfer Saldo Ke prohomint17@gmail.com', 'minus', '2020-07-20 08:23:41', '2020-07-20 08:23:41'),
(523, 41, 5000, 'Menerima Saldo Dari bosspulsa57@gmail.com', 'plus', '2020-07-20 08:23:41', '2020-07-20 08:23:41'),
(524, 197, 75200, 'Pembelian Saldo Dana 75.000 Dengan Jumlah 75200', 'minus', '2020-07-20 08:36:53', '2020-07-20 08:36:53'),
(525, 1, 5000, 'Transfer Saldo Ke dwip19963@gmail.com', 'minus', '2020-07-20 08:54:15', '2020-07-20 08:54:15'),
(526, 77, 5000, 'Menerima Saldo Dari bosspulsa57@gmail.com', 'plus', '2020-07-20 08:54:15', '2020-07-20 08:54:15'),
(527, 77, 6, 'Pembelian Instagram View + Impressions ( SuperFast ~ New ~ Super Cheap) Dengan Jumlah 6', 'minus', '2020-07-20 08:54:27', '2020-07-20 08:54:27'),
(528, 89, 3960, 'Pembelian Instagram Followers PROMO 1 ( BOT ) TERMURAH LQ Dengan Jumlah 3960', 'minus', '2020-07-20 08:55:57', '2020-07-20 08:55:57'),
(529, 45, 60, 'Pembelian Instagram View + Impressions ( SuperFast ~ New ~ Super Cheap) Dengan Jumlah 60', 'minus', '2020-07-20 14:38:19', '2020-07-20 14:38:19'),
(530, 77, 255, 'Pembelian Instagram Followers PROMO 2  ( INSTAN ~ LQ ~ NEW ) CEK NOTE Dengan Jumlah 255', 'minus', '2020-07-20 17:45:23', '2020-07-20 17:45:23'),
(531, 82, 750, 'Pembelian Instagram Likes Indonesia [ INSTAN ~ NEW ] Dengan Jumlah 750', 'minus', '2020-07-20 19:30:09', '2020-07-20 19:30:09'),
(532, 45, 180, 'Pembelian Instagram View + Impressions ( SuperFast ~ New ~ Super Cheap) Dengan Jumlah 180', 'minus', '2020-07-20 19:32:28', '2020-07-20 19:32:28'),
(533, 45, 120, 'Pembelian Instagram View + Impressions ( SuperFast ~ New ~ Super Cheap) Dengan Jumlah 120', 'minus', '2020-07-20 19:32:56', '2020-07-20 19:32:56'),
(534, 82, 840, 'Pembelian Instagram Likes Asian 2 [ Real Account ~ Turkey + Asia + Indonesia ] Dengan Jumlah 840', 'minus', '2020-07-20 19:35:37', '2020-07-20 19:35:37'),
(535, 82, 840, 'Pembelian Instagram Likes Asian 2 [ Real Account ~ Turkey + Asia + Indonesia ] Dengan Jumlah 840', 'minus', '2020-07-20 19:35:42', '2020-07-20 19:35:42'),
(536, 1, 10335, 'Pembelian Telkomsel 10.000 Dengan Jumlah 10335', 'minus', '2020-07-20 19:48:09', '2020-07-20 19:48:09'),
(537, 1, 103000, 'Transfer Saldo Ke septyanpratama600@gmail.com', 'minus', '2020-07-21 00:50:18', '2020-07-21 00:50:18'),
(538, 11, 103000, 'Menerima Saldo Dari bosspulsa57@gmail.com', 'plus', '2020-07-21 00:50:18', '2020-07-21 00:50:18'),
(539, 11, 45600, 'Pembelian Garena 165 Shell Dengan Jumlah 45600', 'minus', '2020-07-21 01:34:26', '2020-07-21 01:34:26'),
(540, 28, 1200, 'Pembelian Three 1.000 Dengan Jumlah 1200', 'minus', '2020-07-21 05:30:17', '2020-07-21 05:30:17'),
(541, 1, 17700, 'Pembelian BRONET 2 GB Dengan Jumlah 17700', 'minus', '2020-07-21 06:18:46', '2020-07-21 06:18:46'),
(542, 197, 5040, 'Pembelian Facebook Profile Followers [ No Reffil ~ Max 1K ] Dengan Jumlah 5040', 'minus', '2020-07-21 10:46:30', '2020-07-21 10:46:30'),
(543, 31, 600, 'Pembelian Instagram View + Impressions ( SuperFast ~ New ~ Super Cheap) Dengan Jumlah 600', 'minus', '2020-07-21 13:32:08', '2020-07-21 13:32:08'),
(544, 31, 600, 'Pembelian Instagram View + Impressions ( SuperFast ~ New ~ Super Cheap) Dengan Jumlah 600', 'minus', '2020-07-21 13:43:20', '2020-07-21 13:43:20'),
(545, 25, 10580, 'Pembelian Saldo Go Pay 10.000 Dengan Jumlah 10580', 'minus', '2020-07-21 15:00:22', '2020-07-21 15:00:22'),
(546, 11, 3600, 'Pembelian Instagram Followers PROMO 1 ( BOT ) TERMURAH LQ Dengan Jumlah 3600', 'minus', '2020-07-21 17:23:33', '2020-07-21 17:23:33'),
(547, 75, 5500, 'Pembelian Instagram Likes [ Max 15k ] [ INSTANT ] Dengan Jumlah 5500', 'minus', '2020-07-21 17:50:26', '2020-07-21 17:50:26');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(25, '2014_10_12_000000_create_users_table', 1),
(26, '2014_10_12_100000_create_password_resets_table', 1),
(27, '2019_08_19_000000_create_failed_jobs_table', 1),
(28, '2020_04_29_160023_categories', 1),
(29, '2020_04_29_161627_sites', 1),
(30, '2020_05_03_033145_providers', 1),
(31, '2020_05_05_171226_operans', 1),
(32, '2020_05_06_170656_services', 1),
(33, '2020_05_16_153508_histories', 2),
(34, '2020_05_18_122336_subject', 3),
(35, '2020_05_19_064923_tickets', 3),
(36, '2020_05_27_153819_deposits', 4),
(39, '2020_05_27_153855_history_deposits', 5),
(40, '2020_06_02_065424_beritas', 6),
(41, '2020_06_07_040444_history_saldo', 7);

-- --------------------------------------------------------

--
-- Table structure for table `operans`
--

CREATE TABLE `operans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `saldo` double NOT NULL DEFAULT 0,
  `code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','not_active') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `operans`
--

INSERT INTO `operans` (`id`, `name`, `link`, `api_key`, `api_id`, `saldo`, `code`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Medan Pedia', 'https://medanpedia.co.id/api/', 'a02527-95e418-96a11c-719acb-69da41', '6269', 776473.8, 'MDN', 'active', NULL, '2020-06-19 09:44:21'),
(2, 'Irvan', 'https://api.irvankede-smm.co.id/', '4cd9bd-042be1-8ccb5e-e778e9-492d8c', '1007', 1927.247, 'IRVN', 'active', NULL, '2020-06-19 09:44:22'),
(3, 'Digiflazz', 'https://api.digiflazz.com/v1/', '36d69e6b-3f2e-5734-b54d-a526a056a0b6', 'ganuyegvZvjg', 2572, 'DIGIFLAZZ', 'active', NULL, '2020-07-19 05:10:19'),
(4, 'Kmedia SMM', 'https://www.k-media.co.id/API', '2ddbf955c05e38850df4040e8a7fc2f85ee744b0eb43a', '0', 0, 'KMEDIA', 'active', '2020-06-15 03:58:21', '2020-06-15 04:56:27');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('devob10335@uhtso.com', '$2y$10$h2iGt8832V/SV4HgIeaX4e3sKtVgW.zMDL6Itr8L7JyKszcCpd2Y.', '2020-06-25 10:50:02'),
('smedoheny@gmail.com', '$2y$10$/NejZAUZWtEcnw2n6Y.4f.MzjovXYBnnz6eeHaNiCW3XstfYyhHl6', '2020-07-14 07:14:35'),
('nurfitridestiani9@gmail.com', '$2y$10$WCTefeR6XL5GlA5ptXFv9.A4P2W8MRGqKWmgvyzUkZPfZHtxfbtG.', '2020-07-15 06:17:31');

-- --------------------------------------------------------

--
-- Table structure for table `providers`
--

CREATE TABLE `providers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','not_active') COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `providers`
--

INSERT INTO `providers` (`id`, `name`, `code`, `slug`, `status`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 'AXIS', 'AXIS', 'axis', 'active', 10, '2020-06-17 03:52:27', '2020-06-17 03:52:02'),
(2, 'By.U', 'By.U', 'by.u', 'active', 10, '2020-06-16 06:38:27', '2020-06-16 06:38:27'),
(3, 'Telkomsel Semua Jaringan', 'TSEL', 'telkomsel-semua-jaringan', 'active', 11, '2020-06-17 05:00:27', '2020-07-17 21:58:12'),
(4, 'Telkomsel', 'TSEL', 'telkomsel', 'active', 13, '2020-06-17 09:09:27', '2020-06-17 09:52:02'),
(8, 'Telkomsel', 'TSEL', 'telkomsel', 'active', 10, '2020-06-14 18:31:41', '2020-06-14 18:31:41'),
(12, 'Smart', 'Smart', 'smartfren', 'active', 10, '2020-06-15 07:35:28', '2020-06-15 07:35:28'),
(13, 'XL', 'XL', 'xl', 'active', 10, '2020-06-16 03:20:01', '2020-06-16 05:24:05'),
(14, 'Three', 'Three', 'three', 'active', 10, '2020-06-16 04:55:41', '2020-06-16 05:24:22'),
(15, 'Indosat', 'IDS', 'indosat', 'active', 10, '2020-06-16 06:38:27', '2020-06-16 06:38:27'),
(16, 'Telkomsel', 'TSEL', 'telkomsel', 'active', 12, '2020-06-17 10:05:27', '2020-06-17 10:05:02'),
(17, 'Indosat', 'IDS', 'indosat', 'active', 12, '2020-06-17 04:42:07', '2020-06-17 04:42:07'),
(18, 'Indosat', 'IDS', 'indosat', 'active', 13, '2020-06-17 05:25:06', '2020-06-17 05:25:06'),
(19, 'XL AnyNet', 'XlAN', 'xl', 'active', 13, '2020-06-17 05:30:09', '2020-06-17 05:30:09'),
(20, 'Three', 'Three', 'three', 'active', 13, '2020-06-17 05:33:58', '2020-06-17 05:33:58'),
(21, 'Axis Bronet', 'ABNET', 'axis', 'active', 11, '2020-06-17 23:36:59', '2020-06-17 23:36:59'),
(22, 'Axis Owsem', 'AXOS', 'axis', 'active', 11, '2020-06-18 00:42:42', '2020-06-18 00:42:42'),
(33, 'PLN', 'pln', 'token-pln', 'active', 25, '2020-06-21 01:13:12', '2020-06-21 01:13:12'),
(35, 'Saldo Dana', 'DN', 'saldo-dana', 'active', 15, '2020-06-23 02:02:38', '2020-06-23 02:02:38'),
(37, 'Saldo GoPay', 'Sgp', 'saldo-emony', 'active', 15, '2020-06-25 02:51:51', '2020-06-25 02:51:51'),
(38, 'Saldo Ovo', 'ovo', 'saldo-ovo', 'active', 15, '2020-06-25 23:48:28', '2020-06-25 23:48:28'),
(39, 'Voucher Garena', 'GRNA', 'voucher-garena', 'active', 16, '2020-06-26 00:02:36', '2020-06-26 00:02:36'),
(40, 'Point Blank', 'PB', 'voucher-point-blank', 'active', 28, '2020-06-26 00:19:06', '2020-06-26 00:19:06'),
(43, 'Shopee Pay', 'SPAY', 'saldo-shopeepay', 'active', 15, '2020-07-12 21:59:58', '2020-07-12 21:59:58'),
(44, 'Saldo LinkAja', 'LA', 'saldo-linkaja', 'active', 15, '2020-07-14 20:31:49', '2020-07-14 20:31:49'),
(45, 'Promo Token PLN', 'PTPLN', 'token-pln', 'active', 25, '2020-07-15 21:22:04', '2020-07-15 21:22:04'),
(46, 'Mobile Legend', 'ML', 'game-mobile-legend', 'active', 28, '2020-07-16 08:58:41', '2020-07-16 08:58:41'),
(47, 'Garena Free Fire', 'GFF', 'garena-free-fire', 'active', 28, '2020-07-16 23:07:14', '2020-07-16 23:07:14'),
(48, 'Telkomsel Data Flash', 'TDF', 'telkomsel-data-flash', 'active', 11, '2020-07-17 06:22:55', '2020-07-17 06:22:55'),
(49, 'PUBG MOBILE', 'PM', 'pubg-mobile', 'active', 28, '2020-07-17 08:17:07', '2020-07-17 08:17:07'),
(50, 'Telkomsel Data Bulk', 'TSELDB', 'telkomsel-data-bulk', 'active', 11, '2020-07-17 20:02:15', '2020-07-17 20:02:15'),
(51, 'Telkomsel Data Instagram', 'TPI', 'telkomsel-data-instagram', 'active', 11, '2020-07-17 20:35:51', '2020-07-17 20:35:51'),
(52, 'Telkomsel Data Youtube', 'PDY', 'telkomsel-data-youtube', 'active', 11, '2020-07-17 20:48:30', '2020-07-17 20:48:30'),
(53, 'Telkomsel Data Facebook', 'PDF', 'telkomsel-data-facebook', 'active', 11, '2020-07-17 20:49:15', '2020-07-17 20:49:15'),
(54, 'Telkomsel Data Malam', 'DTM', 'telkomsel-data-malam', 'active', 11, '2020-07-17 21:10:17', '2020-07-17 21:10:17'),
(55, 'Telkomsel Data Mini', 'TDM1', 'telkomsel-data-malam', 'active', 11, '2020-07-17 21:11:19', '2020-07-17 21:11:19'),
(56, 'Indosat Internet Unlimited', 'IIU', 'indosat', 'active', 11, '2020-07-17 21:59:35', '2020-07-17 21:59:35'),
(57, '- PROMO - ON OF -', 'promo', 'social-media', 'active', 9, '2020-07-18 03:39:08', '2020-07-18 03:39:08'),
(58, 'Instagram Followers ( NOT GUARANTED ~ NO REFFIL )', 'IFGR', 'social-media', 'active', 9, '2020-07-18 06:08:24', '2020-07-18 06:08:24'),
(59, 'Instagram Followers ( GUARANTED ~ REFFIL )', 'IFGR2', 'social-media', 'active', 9, '2020-07-18 06:09:07', '2020-07-18 06:09:07'),
(60, 'Instagram Followers Indonesia', 'IFI', 'social-media', 'active', 9, '2020-07-18 06:10:02', '2020-07-18 06:10:02'),
(61, 'Instagram Followers Indonesia Kota', 'IFIK', 'social-media', 'active', 9, '2020-07-18 06:10:41', '2020-07-18 06:10:41'),
(62, 'Instagram View', 'IV', 'social-media', 'active', 9, '2020-07-18 07:09:04', '2020-07-18 07:09:04'),
(63, 'Instagram Likes', 'IL', 'social-media', 'active', 9, '2020-07-19 00:05:07', '2020-07-19 00:05:07'),
(64, 'Instagram Likes Indonesia', 'ILI', 'social-media', 'active', 9, '2020-07-19 00:05:26', '2020-07-19 00:05:26'),
(65, 'Instagram Followers Indonesia ( Reffil ~ Bergaransi )', 'IFRB', 'social-media', 'active', 9, '2020-07-19 00:06:47', '2020-07-19 00:06:47'),
(66, 'Instagram Likes Asian', 'ILA', 'social-media', 'active', 9, '2020-07-19 00:26:22', '2020-07-19 00:26:22'),
(67, 'Youtube Subscribe', 'YS', 'social-media', 'active', 9, '2020-07-20 07:45:12', '2020-07-20 07:45:12'),
(68, 'Youtube View Jam Tayang', 'YVJT', 'social-media', 'active', 9, '2020-07-21 00:51:55', '2020-07-21 00:51:55'),
(69, 'Youtube View', 'YV', 'social-media', 'active', 9, '2020-07-21 00:54:52', '2020-07-21 00:54:52'),
(70, 'Youtube Watchtime', 'YW', 'social-media', 'active', 9, '2020-07-21 00:55:29', '2020-07-21 00:55:29'),
(71, 'Youtube Live Stream / Like / Dislikes / Comment', 'YLSLDC', 'social-media', 'active', 9, '2020-07-21 00:57:07', '2020-07-21 00:57:07'),
(72, 'Facebook Followers / Friends', 'FFF', 'social-media', 'active', 9, '2020-07-21 05:14:41', '2020-07-21 05:14:41'),
(73, 'Facebook Post Likes / Comments / Shared', 'FPLCS', 'social-media', 'active', 9, '2020-07-21 05:15:24', '2020-07-21 05:15:24'),
(74, 'Facebook Page Likes / Stars', 'FPLS', 'social-media', 'active', 9, '2020-07-21 05:16:16', '2020-07-21 05:16:16'),
(75, 'Facebook Vidio Views / Live Stream', 'FVVLV', 'social-media', 'active', 9, '2020-07-21 05:17:35', '2020-07-21 05:17:35');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `min` int(11) NOT NULL,
  `max` int(11) NOT NULL,
  `point` int(11) NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `price_api` int(11) NOT NULL,
  `price_operan` int(11) NOT NULL,
  `code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_operan` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','not_active') COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider_id` bigint(20) UNSIGNED NOT NULL,
  `operan_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `name`, `min`, `max`, `point`, `note`, `price`, `price_api`, `price_operan`, `code`, `code_operan`, `status`, `provider_id`, `operan_id`, `created_at`, `updated_at`) VALUES
(20, 'Telkomsel 1.000', 1, 1, 1, 'Valid 100% Untuk Transaksi.', 1700, 1325, 1325, 'TSEL1', 'TSEL1', 'active', 8, 3, '2020-06-14 18:43:54', '2020-06-15 01:19:17'),
(33, 'Telkomsel 2.000', 1, 1, 1, 'Valid 100% Untuk Transaksi.', 2850, 2785, 2715, 'TSEL2', 'TSEL2', 'active', 8, 3, '2020-06-15 01:06:59', '2020-06-15 01:06:59'),
(34, 'Telkomsel 3.000', 1, 1, 1, 'Valid 100% Untuk Transaksi.', 3850, 3750, 3715, 'TSEL3', 'TSEL3', 'active', 8, 3, '2020-06-15 01:12:33', '2020-06-15 01:12:33'),
(35, 'Telkomsel 5.000', 1, 1, 1, 'Valid 100% Untuk Transaksi.', 5850, 5700, 5650, 'TSEL5', 'TSEL5', 'active', 8, 3, '2020-06-15 01:26:18', '2020-06-15 01:26:18'),
(36, 'Telkomsel 10.000', 1, 1, 1, 'Valid 100% Untuk Transaksi.', 10335, 10150, 10290, 'TSEL10', 'TSEL10', 'active', 8, 3, '2020-06-15 01:31:26', '2020-06-15 02:44:05'),
(37, 'Telkomsel 15.000', 1, 1, 1, 'Valid 100% Untuk Transaksi.', 15050, 14880, 14850, 'TSEL15', 'TSEL15', 'active', 8, 3, '2020-06-15 03:05:57', '2020-06-15 03:05:57'),
(38, 'Telkomsel 20.000', 1, 1, 1, 'Valid 100% Untuk Transaksi.', 20150, 2020, 19975, 'TSEL20', 'TSEL20', 'active', 8, 3, '2020-06-15 03:08:12', '2020-06-15 03:08:12'),
(39, 'Telkomsel 25.000', 1, 1, 1, 'Valid 100% Untuk Transaksi.', 24740, 24600, 24550, 'TSEL25', 'TSEL25', 'active', 8, 3, '2020-06-15 03:11:27', '2020-06-15 03:12:59'),
(40, 'Telkomsel 30.000', 1, 1, 1, 'Valid 100% Untuk Transaksi.', 30740, 30685, 30625, 'TSEL30', 'TSEL30', 'active', 8, 3, '2020-06-15 03:17:08', '2020-07-14 17:02:51'),
(41, 'Telkomsel 35.000', 1, 1, 1, 'Valid 100% Untuk Transaksi.', 34780, 34695, 34625, 'TSEL35', 'TSEL35', 'active', 8, 3, '2020-06-15 03:32:17', '2020-06-15 03:32:17'),
(43, 'Telkomsel 40.000', 1, 1, 1, 'Valid 100% Untuk Transaksi.', 39700, 39650, 39600, 'TSEL40', 'TSEL40', 'active', 8, 3, '2020-06-15 04:30:41', '2020-06-15 04:30:41'),
(44, 'Telkomsel 45.000', 1, 1, 1, 'Valid 100% Untuk Transaksi.', 44480, 44420, 44375, 'TSEL45', 'TSEL45', 'active', 8, 3, '2020-06-15 04:32:20', '2020-06-15 04:32:20'),
(45, 'Telkomsel 50.000', 1, 1, 1, 'Valid 100% Untuk Transaksi.', 49080, 48980, 48930, 'TSEL50', 'TSEL50', 'active', 8, 3, '2020-06-15 04:33:49', '2020-06-15 04:33:49'),
(46, 'Telkomsel 55.000', 1, 1, 1, 'Valid 100% Untuk Transaksi.', 54320, 54280, 54200, 'TSEL55', 'TSEL55', 'active', 8, 3, '2020-06-15 04:35:01', '2020-06-15 04:35:01'),
(47, 'Telkomsel 60.000', 1, 1, 1, 'Valid 100% Untuk Transaksi.', 59250, 59200, 59150, 'TSEL60', 'TSEL60', 'active', 8, 3, '2020-06-15 04:36:15', '2020-06-15 04:36:15'),
(48, 'Telkomsel 65.000', 1, 1, 1, 'Valid 100% Untuk Transaksi.', 64150, 64100, 64050, 'TSEL65', 'TSEL65', 'active', 8, 3, '2020-06-15 04:37:46', '2020-06-15 04:37:46'),
(49, 'Telkomsel 70.000', 1, 1, 1, 'Valid 100% Untuk Transaksi.', 69095, 69020, 68985, 'TSEL70', 'TSEL70', 'active', 8, 3, '2020-06-15 05:07:10', '2020-06-15 05:07:10'),
(50, 'Telkomsel 75.000', 1, 1, 1, 'Valid 100% Untuk Transaksi.', 73600, 73500, 73500, 'TSEL75', 'TSEL75', 'active', 8, 3, '2020-06-15 05:08:17', '2020-06-15 05:08:17'),
(51, 'Telkomsel 80.000', 1, 1, 1, 'Valid 100% Untuk Transaksi.', 78920, 78895, 78825, 'TSEL80', 'TSEL80', 'active', 8, 3, '2020-06-15 05:10:13', '2020-06-15 05:10:13'),
(52, 'Telkomsel 85.000', 1, 1, 1, 'Valid 100% Untuk Transaksi.', 83830, 83795, 83750, 'TSEL85', 'TSEL85', 'active', 8, 3, '2020-06-15 05:11:44', '2020-06-15 05:11:44'),
(53, 'Telkomsel 90.000', 1, 1, 1, 'Valid 100% Untuk Transaksi.', 88885, 88735, 88685, 'TSEL90', 'TSEL90', 'active', 8, 3, '2020-06-15 05:13:09', '2020-06-15 05:13:09'),
(54, 'Telkomsel 95.000', 1, 1, 1, 'Valid 100% Untuk Transaksi.', 93700, 93650, 93600, 'TSEL95', 'TSEL95', 'active', 8, 3, '2020-06-15 05:16:37', '2020-06-15 05:16:37'),
(56, 'Telkomsel 100.000', 1, 1, 1, 'Valid 100% Untuk Transaksi.', 96700, 96680, 96630, 'TSEL100', 'TSEL100', 'active', 8, 3, '2020-06-15 05:31:10', '2020-06-15 05:31:10'),
(57, 'Telkomsel 150.000', 1, 1, 1, 'Valid 100% Untuk Transaksi.', 146600, 146550, 146500, 'TSEL150', 'TSEL150', 'active', 8, 3, '2020-06-15 05:32:17', '2020-06-15 05:32:17'),
(58, 'Telkomsel 200.000', 1, 1, 1, 'Valid 100% Untuk Transaksi.', 196200, 195100, 195000, 'TSEL200', 'TSEL200', 'active', 8, 3, '2020-06-15 05:34:25', '2020-06-15 05:34:25'),
(59, 'Telkomsel 300.000', 1, 1, 1, 'Valid 100% Untuk Transaksi.', 292900, 292800, 292500, 'TSEL300', 'TSEL300', 'active', 8, 3, '2020-06-15 05:36:00', '2020-06-15 05:36:00'),
(60, 'Telkomsel 500.000', 1, 1, 1, 'Valid 100% Untuk Transaksi.', 487710, 487550, 487500, 'TSEL500', 'TSEL500', 'active', 8, 3, '2020-06-15 05:38:47', '2020-06-15 05:38:47'),
(61, 'Telkomsel 1.000.000', 1, 1, 1, 'Valid 100% Untuk Transaksi.', 973250, 973065, 973025, 'TSEL1JT', 'TSEL1JT', 'active', 8, 3, '2020-06-15 06:59:15', '2020-06-15 06:59:15'),
(62, 'Smart 5.000', 1, 1, 1, 'Pulsa Smart 5.000', 5100, 4960, 4890, 'smart5', 'smart5', 'active', 12, 3, '2020-06-15 07:40:36', '2020-06-15 07:40:36'),
(63, 'Smart 10.000', 1, 1, 1, 'Pulsa Smart 10.000', 9930, 9890, 9830, 'smart10', 'smart10', 'active', 12, 3, '2020-06-15 07:42:49', '2020-06-15 07:42:49'),
(64, 'Smart 20.000', 1, 1, 1, 'Pulsa Smart 20.000', 19790, 19690, 19610, 'smart20', 'smart20', 'active', 12, 3, '2020-06-15 07:44:14', '2020-06-15 07:44:14'),
(65, 'Smart 25.000', 1, 1, 1, 'Pulsa Smart 25.000', 24580, 24445, 24435, 'smart25', 'smart25', 'active', 12, 3, '2020-06-15 07:46:07', '2020-06-15 07:46:07'),
(66, 'Smart 30.000', 1, 1, 1, 'Pulsa Smart 30.000', 29500, 29450, 29335, 'smart30', 'smart30', 'active', 12, 3, '2020-06-15 07:48:05', '2020-06-15 07:48:05'),
(67, 'Smart 50.000', 1, 1, 1, 'Pulsa Smart 50.000', 48825, 48695, 48650, 'smart50', 'smart50', 'active', 12, 3, '2020-06-15 07:52:41', '2020-06-15 07:52:41'),
(68, 'Smart 60.000', 1, 1, 1, 'Pulsa Smart 60.000', 58750, 58699, 58645, 'smart60', 'smart60', 'active', 12, 3, '2020-06-15 07:55:43', '2020-06-15 07:55:43'),
(69, 'Smart 100.000', 1, 1, 1, 'Pulsa Smart 100.000', 97250, 97115, 97070, 'smart100', 'smart100', 'active', 12, 3, '2020-06-15 08:06:01', '2020-06-15 08:06:01'),
(70, 'Smart 150.000', 1, 1, 1, 'Pulsa Smart 150.000', 146750, 146699, 146650, 'smart150', 'smart150', 'active', 12, 3, '2020-06-15 08:14:06', '2020-06-15 08:14:06'),
(71, 'Smart 200.000', 1, 1, 1, 'Pulsa Smart 200.000', 198799, 198645, 198575, 'smart200', 'smart200', 'active', 12, 3, '2020-06-15 08:18:25', '2020-06-15 08:18:25'),
(72, 'Smart 300.000', 1, 1, 1, 'Pulsa Smart 300.000', 297699, 297675, 297575, 'smart300', 'smart300', 'active', 12, 3, '2020-06-15 08:19:58', '2020-06-15 08:19:58'),
(73, 'Smart 500.000', 1, 1, 1, 'Pulsa Smart 500.000', 498250, 498225, 498125, 'smart500', 'smart500', 'active', 12, 3, '2020-06-15 08:21:24', '2020-06-15 08:21:24'),
(75, 'XL 5.000', 1, 1, 1, 'Pulsa', 5825, 5880, 5820, 'XL5', 'XL5', 'active', 13, 3, '2020-06-16 03:21:22', '2020-06-16 03:59:26'),
(76, 'XL 10.000', 1, 1, 1, 'Pulsa XL 10.000', 10785, 10725, 10690, 'XL10', 'XL10', 'active', 13, 3, '2020-06-16 03:22:57', '2020-06-16 03:22:57'),
(77, 'XL 25.000', 1, 1, 1, 'Pulsa XL 25.000', 24680, 24650, 24600, 'XL25', 'XL25', 'active', 13, 3, '2020-06-16 04:03:40', '2020-06-16 04:03:40'),
(78, 'XL 30.000', 1, 1, 1, 'Pulsa XL 30.000', 29625, 29595, 29575, 'XL30', 'XL30', 'active', 13, 3, '2020-06-16 04:04:48', '2020-06-16 04:04:48'),
(79, 'XL 50.000', 1, 1, 1, 'Pulsa XL 50.000', 49200, 49170, 49150, 'XL50', 'XL50', 'active', 13, 3, '2020-06-16 04:35:03', '2020-06-16 04:35:03'),
(80, 'XL 100.000', 1, 1, 1, 'Pulsa XL 100.000', 98250, 98150, 97995, 'XL100', 'XL100', 'active', 13, 3, '2020-06-16 04:36:35', '2020-07-12 21:09:51'),
(81, 'XL 200.000', 1, 1, 1, 'Pulsa XL 200.000', 197115, 197075, 197025, 'XL200', 'XL200', 'active', 13, 3, '2020-06-16 04:37:36', '2020-06-16 04:37:36'),
(82, 'XL 300.000', 1, 1, 1, 'Pulsa XL 300.000', 295610, 295585, 295525, 'XL300', 'XL300', 'active', 13, 3, '2020-06-16 04:38:34', '2020-06-16 04:38:34'),
(83, 'XL 500.000', 1, 1, 1, 'Pulsa XL 500.000', 492610, 492585, 492525, 'XL500', 'XL500', 'active', 13, 3, '2020-06-16 04:40:09', '2020-06-16 04:40:09'),
(84, 'XL 1.000.000', 1, 1, 1, 'Pulsa XL 1.000.000', 985315, 985285, 985225, 'XL1000000', 'XL1000000', 'active', 12, 3, '2020-06-16 04:41:22', '2020-06-16 04:41:22'),
(85, 'Three 1.000', 1, 1, 1, 'Pulsa Three 1.000', 1200, 1150, 1100, 'LTE1', 'LTE1', 'active', 14, 3, '2020-06-16 04:55:17', '2020-06-24 04:50:41'),
(86, 'Three 2.000', 1, 1, 1, 'Pulsa Three 2.000', 2210, 2180, 2140, 'LTE2', 'LTE2', 'active', 14, 3, '2020-06-16 04:57:14', '2020-06-16 04:57:14'),
(87, 'Three 3.000', 1, 1, 1, 'Pulsa Three 3.000', 3399, 3375, 3315, 'LTE3', 'LTE3', 'active', 14, 3, '2020-06-16 04:58:32', '2020-06-16 04:58:32'),
(88, 'Three 10.000', 1, 1, 1, 'Pulsa Three 10.000', 10125, 10099, 10045, 'LTE10', 'LTE10', 'active', 14, 3, '2020-06-16 05:01:26', '2020-06-16 05:01:26'),
(89, 'Three 5.000', 1, 1, 1, 'Pulsa', 5325, 5295, 5275, 'LTE5', 'LTE5', 'active', 14, 3, '2020-06-16 05:05:12', '2020-06-24 04:50:17'),
(90, 'Three 15.000', 1, 1, 1, 'Pulsa Three 15.000', 14670, 14620, 14590, 'LTE15', 'LTE15', 'active', 14, 3, '2020-06-16 05:07:53', '2020-06-16 05:07:53'),
(91, 'Three 20.000', 1, 1, 1, 'Pulsa Three 20.000', 19525, 19490, 19460, 'LTE20', 'LTE20', 'active', 14, 3, '2020-06-16 05:09:33', '2020-06-16 05:09:33'),
(92, 'Three 25.000', 1, 1, 1, 'Pulsa Three 25.000', 24450, 24350, 24300, 'LTE25', 'LTE25', 'active', 14, 3, '2020-06-16 05:13:10', '2020-06-16 05:13:10'),
(93, 'Three 30.000', 1, 1, 1, 'Pulsa Three 30.000', 29100, 29050, 29000, 'LTE30', 'LTE30', 'active', 14, 3, '2020-06-16 05:14:14', '2020-06-16 05:14:14'),
(94, 'Three 50.000', 1, 1, 1, 'Pulsa Three 50.000', 48400, 48350, 48300, 'LTE50', 'LTE50', 'active', 14, 3, '2020-06-16 05:16:19', '2020-06-16 05:16:19'),
(95, 'Three 100.000', 1, 1, 1, 'Pulsa Three 100.000', 96500, 96550, 96500, 'LTE100', 'LTE100', 'active', 14, 3, '2020-06-16 05:18:59', '2020-06-16 05:18:59'),
(96, 'Three 150.000', 1, 1, 1, 'Pulsa Three 150.000', 146215, 146195, 146145, 'LTE150', 'LTE150', 'active', 14, 2, '2020-06-16 05:34:01', '2020-06-16 05:34:01'),
(97, 'Three 200.000', 1, 1, 1, 'Pulsa Three 200.000', 194900, 194880, 194830, 'LTE200', 'LTE200', 'active', 14, 3, '2020-06-16 05:35:02', '2020-06-16 05:35:02'),
(98, 'Three 300.000', 1, 1, 1, 'Pulsa Three 200.000', 293200, 293150, 293100, 'LTE300', 'LTE300', 'active', 14, 3, '2020-06-16 05:36:04', '2020-06-16 05:36:04'),
(99, 'Three 500.000', 1, 1, 1, 'Pulsa Three 500.000', 488200, 488550, 488500, 'LTE500', 'LTE500', 'active', 14, 3, '2020-06-16 05:38:32', '2020-06-16 05:38:32'),
(100, 'Indosat 5.000', 1, 1, 1, 'Tidak Suport Multi Pembelian.', 5780, 5745, 5690, 'IDS5', 'IDS5', 'active', 15, 3, '2020-06-16 06:48:59', '2020-06-16 06:48:59'),
(101, 'Indosat 10.000', 1, 1, 1, 'Pulsa Indosat 10.000', 10825, 10798, 10775, 'IDS10', 'IDS10', 'active', 15, 3, '2020-06-16 06:50:14', '2020-06-16 06:50:14'),
(102, 'Indosat 12.000', 1, 1, 1, 'Pulsa Indosat 12.000', 12150, 12085, 12025, 'IDS12', 'IDS12', 'active', 15, 3, '2020-06-16 06:51:09', '2020-06-16 06:51:09'),
(103, 'Indosat 15.000', 1, 1, 1, 'Pulsa Indosat 15.000', 15125, 15085, 15025, 'IDS15', 'IDS15', 'active', 15, 3, '2020-06-16 06:52:30', '2020-06-16 06:52:30'),
(104, 'Indosat 20.000', 1, 1, 1, 'Pulsa Indosat 20.000', 19950, 19900, 19850, 'IDS20', 'IDS20', 'active', 15, 3, '2020-06-16 06:53:51', '2020-06-16 06:53:51'),
(105, 'Indosat 25.000', 1, 1, 1, 'Pulsa Indosat 25.000', 24900, 24850, 24800, 'IDS25', 'IDS25', 'active', 15, 3, '2020-06-16 06:56:15', '2020-06-16 06:56:15'),
(106, 'Indosat 30.000', 1, 1, 1, 'Pulsa Indosat 30.000', 29550, 29500, 29475, 'IDS30', 'IDS30', 'active', 15, 3, '2020-06-16 06:57:34', '2020-06-16 06:57:34'),
(107, 'Indosat 50.000', 1, 1, 1, 'Pulsa Indosat 50.000', 48900, 48875, 48825, 'IDS50', 'IDS50', 'active', 15, 3, '2020-06-16 06:59:35', '2020-06-16 06:59:35'),
(108, 'Indosat 60.000', 1, 1, 1, 'Pulsa Indosat 60.000', 59610, 59550, 59500, 'IDS60', 'IDS60', 'active', 15, 3, '2020-06-16 07:13:02', '2020-06-16 07:13:02'),
(109, 'Indosat 80.000', 1, 1, 1, 'Pulsa Indosat 80.000', 78620, 78550, 78500, 'IDS80', 'IDS80', 'active', 15, 3, '2020-06-16 07:14:44', '2020-06-16 07:14:44'),
(110, 'Indosat 90.000', 1, 1, 1, 'Pulsa Indosat 90.000', 88620, 88550, 88500, 'IDS90', 'IDS90', 'active', 15, 3, '2020-06-16 07:15:42', '2020-06-16 07:15:42'),
(111, 'Indosat 100.000', 1, 1, 1, 'Pulsa Indosat 100.000', 96820, 96750, 96700, 'IDS100', 'IDS100', 'active', 15, 3, '2020-06-16 07:17:23', '2020-06-16 07:17:23'),
(112, 'Indosat 125.000', 1, 1, 1, 'Pulsa Indosat 125.000', 124040, 123999, 123950, 'IDS125', 'IDS125', 'active', 15, 3, '2020-06-16 07:23:43', '2020-06-16 07:23:43'),
(113, 'Indosat 150.000', 1, 1, 1, 'Pulsa Indosat 150.000', 143600, 143550, 143500, 'IDS150', 'IDS150', 'active', 15, 3, '2020-06-16 07:26:05', '2020-06-16 07:26:05'),
(114, 'Indosat 175.000', 1, 1, 1, 'Pulsa Indosat 175.000', 172550, 172500, 172450, 'IDS175', 'IDS175', 'active', 15, 3, '2020-06-16 07:30:33', '2020-06-16 07:30:33'),
(115, 'Indosat 200.000', 1, 1, 1, 'Pulsa Indosat 200.000', 187100, 187050, 187000, 'IDS200', 'IDS200', 'active', 15, 3, '2020-06-16 07:31:26', '2020-06-16 07:31:26'),
(116, 'Indosat 250.000', 1, 1, 1, 'Pulsa Indosat 250.000', 232600, 232550, 232500, 'IDS250', 'IDS250', 'active', 15, 3, '2020-06-16 07:33:11', '2020-06-16 07:33:11'),
(117, 'Indosat 500.000', 1, 1, 1, 'Pulsa Indosat 500.000', 465080, 465050, 465000, 'IDS500', 'IDS500', 'active', 15, 3, '2020-06-16 07:34:14', '2020-06-16 07:34:14'),
(119, 'Axis 5.000', 1, 1, 1, 'Tidak Suport Multi Pembelian.', 5880, 5805, 5775, 'LAX5', 'LAX5', 'active', 1, 3, '2020-06-16 21:00:56', '2020-06-16 21:00:56'),
(120, 'Axis 10.000', 1, 1, 1, 'Tidak Suport Multi Pembelian.', 10800, 10730, 10700, 'LAX10', 'LAX10', 'active', 1, 3, '2020-06-16 21:02:01', '2020-06-16 21:02:01'),
(121, 'Axis 15.000', 1, 1, 1, 'Pulsa Axis 15.000', 14920, 14875, 14825, 'LAX15', 'LAX15', 'active', 1, 3, '2020-06-16 21:03:42', '2020-06-16 21:03:42'),
(122, 'Axis 25.000', 1, 1, 1, 'Pulsa Axis 25.000', 24720, 24650, 24600, 'LAX25', 'LAX25', 'active', 1, 2, '2020-06-16 21:04:53', '2020-06-16 21:04:53'),
(123, 'Axis 30.000', 1, 1, 1, 'Pulsa Axis 30.000', 29825, 29780, 29725, 'LAX30', 'LAX30', 'active', 1, 3, '2020-06-16 21:06:05', '2020-06-16 21:06:05'),
(124, 'Axis 50.000', 1, 1, 1, 'Pulsa Axis 50.000', 49200, 49235, 49175, 'LAX50', 'LAX50', 'active', 1, 3, '2020-06-16 21:07:24', '2020-06-16 21:07:24'),
(125, 'Axis 100.000', 1, 1, 1, 'Pulsa Axis 100.000', 98350, 98299, 98225, 'LAX100', 'LAX100', 'active', 1, 3, '2020-06-16 21:08:51', '2020-06-16 21:08:51'),
(126, 'Axis 200.000', 1, 1, 1, 'Pulsa Axis 200.000', 197150, 197065, 197025, 'LAX200', 'LAX200', 'active', 1, 3, '2020-06-16 21:10:30', '2020-06-16 21:10:30'),
(127, 'B.yU 1.000', 1, 1, 1, 'Pulsa B.yU 1.000', 1199, 10100, 1055, 'BYU1', 'BYU1', 'active', 2, 3, '2020-06-16 21:22:17', '2020-06-16 21:22:17'),
(128, 'B.yU 2.000', 1, 1, 1, 'Pulsa B.yU 2.000', 2150, 2100, 2055, 'BYU2', 'BYU2', 'active', 2, 3, '2020-06-16 21:23:17', '2020-06-16 21:23:17'),
(129, 'B.yU 3.000', 1, 1, 1, 'Tidak Suport Multi Pembelian.', 3350, 3300, 3250, 'BYU3', 'BYU3', 'active', 2, 3, '2020-06-16 21:24:24', '2020-06-16 21:24:24'),
(130, 'B.yU 4.000', 1, 1, 1, 'Pulsa B.yU 4.000', 4150, 4100, 4055, 'BYU4', 'BYU4', 'active', 2, 3, '2020-06-16 21:25:38', '2020-06-16 21:25:38'),
(131, 'By.U 5.000', 1, 1, 1, 'Tidak Suport Multi Pembelian.', 5500, 5450, 5400, 'BYU5', 'BYU5', 'active', 2, 3, '2020-06-16 21:27:01', '2020-06-16 21:27:01'),
(132, 'B.yU 6.000', 1, 1, 1, 'Pulsa B.yU 6.000', 6150, 6100, 6055, 'BYU6', 'BYU6', 'active', 2, 3, '2020-06-16 21:28:08', '2020-06-16 21:28:08'),
(133, 'By.U 7.000', 1, 1, 1, 'Pulsa B.yU 7.000', 7150, 7100, 7055, 'BYU7', 'BYU7', 'active', 2, 3, '2020-06-16 21:29:09', '2020-06-16 21:29:09'),
(134, 'B.yU 8.000', 1, 1, 1, 'Tidak Suport Multi Pembelian.', 8350, 8300, 8250, 'BYU8', 'BYU8', 'active', 2, 3, '2020-06-16 21:30:12', '2020-06-16 21:30:12'),
(135, 'B.yU 9.000', 1, 1, 1, 'Pulsa B.yU 9.000', 9150, 9100, 9055, 'BYU9', 'BYU9', 'active', 2, 3, '2020-06-16 21:31:07', '2020-06-16 21:31:07'),
(136, 'B.yU 20.000', 1, 1, 1, 'Tidak Suport Multi Pembelian.', 20150, 20099, 20025, 'BYU20', 'BYU20', 'active', 2, 3, '2020-06-16 21:33:06', '2020-06-16 21:33:06'),
(137, 'By.U 10.000', 1, 1, 1, 'Pulsa B.yU 10.000', 10150, 10100, 10055, 'BYU10', 'BYU10', 'active', 2, 3, '2020-06-16 21:42:25', '2020-06-16 21:42:25'),
(138, 'B.yU 25.000', 1, 1, 1, 'Pulsa B.yU 25.000', 24950, 24890, 24810, 'BYU25', 'BYU25', 'active', 2, 3, '2020-06-16 21:43:32', '2020-06-16 21:43:32'),
(139, 'B.yU 50.000', 1, 1, 1, 'Pulsa B.yU 50.000', 49680, 49625, 49575, 'BYU50', 'BYU50', 'active', 2, 3, '2020-06-16 21:44:48', '2020-06-16 21:44:48'),
(140, 'B.yU 100.000', 1, 1, 1, 'Tidak Suport Multi Pembelian.', 97700, 97600, 97500, 'BYU100', 'BYU100', 'active', 2, 3, '2020-06-16 21:46:03', '2020-06-16 21:46:03'),
(141, 'Telkomsel Telepon 5.000', 1, 1, 1, 'Telepon 80 menit sesama, 20 menit semua op 1 Hari', 5150, 5099, 5075, 'TTELEPON5', 'TTELEPON5', 'active', 4, 3, '2020-06-17 02:25:48', '2020-06-17 02:25:48'),
(142, 'Telkomsel Telepon 10.000', 1, 1, 1, 'Telepon 185 menit sesama, 15 menit semua operator (1 Hari)', 8145, 8099, 8025, 'TTELEPON10', 'TTELEPON10', 'active', 4, 3, '2020-06-17 02:26:41', '2020-06-17 02:26:41'),
(143, 'Telkomsel Telepon 20.000', 1, 1, 1, 'Telepon 370 menit sesama, 30 menit semua op (3 Hari)', 15100, 15050, 15000, 'TTELEPON20', 'TTELEPON20', 'active', 4, 3, '2020-06-17 02:28:06', '2020-06-17 02:28:06'),
(144, 'Telkomsel Telepon 25.000', 1, 1, 1, 'Telepon 550 menit sesama, 50 menit semua op (7 Hari)', 23600, 23550, 23500, 'TTELEPON25', 'TTELEPON25', 'active', 4, 3, '2020-06-17 02:29:18', '2020-06-17 02:29:18'),
(145, 'Telkomsel Telepon 50.000', 1, 1, 1, 'Telepon 1200 menit sesama, 100 menit semua op (15 Hari)', 50140, 50090, 50025, 'TTELEPON50', 'TTELEPON50', 'active', 4, 3, '2020-06-17 02:32:36', '2020-06-17 02:32:36'),
(146, 'Telkomsel Telepon 80.000', 1, 1, 1, '2100 MENIT (2000MNT TSEL + 100MNT ALL OPR) 30 HARI', 70350, 70300, 70275, 'TTELEPON80', 'TTELEPON80', 'active', 4, 3, '2020-06-17 02:33:45', '2020-06-17 02:33:45'),
(147, 'Telkomsel Telepon 130.000', 1, 1, 1, 'Telepon 6250 menit sesama, 250 menit semua op (30 Hari)', 105145, 105099, 105025, 'TTELEPON130', 'TTELEPON130', 'active', 4, 3, '2020-06-17 02:34:59', '2020-06-17 02:34:59'),
(148, 'Telkomsel Telepon 170 menit sesama, 30 menit semua op 3 Hari', 1, 1, 1, 'Telepon 170 menit sesama, 30 menit semua op 3 Hari', 10525, 10499, 10425, 'TCALL1', 'TCALL1', 'active', 4, 3, '2020-06-17 02:57:31', '2020-06-17 02:57:31'),
(149, 'Telkomsel Telepon 350 menit sesama, 50 menit semua op 7 Hari', 1, 1, 1, 'Telepon 350 menit sesama, 50 menit semua op 7 Hari', 21150, 21100, 21050, 'TCALL2', 'TCALL2', 'active', 4, 3, '2020-06-17 02:59:25', '2020-06-17 02:59:25'),
(150, 'Telepon 1000 menit sesama, 100 menit semua op (30 Hari)', 1, 1, 1, 'Telepon 1000 menit sesama, 100 menit semua op (30 Hari)', 51100, 51050, 51000, 'TCALL3', 'TCALL3', 'active', 4, 3, '2020-06-17 03:00:11', '2020-06-17 03:00:11'),
(151, 'Telkomsel 1000 SMS ke semua op 5 hari', 1, 1, 1, 'Paket SMS - 1000 SMS ke semua 5 hari', 4900, 4850, 4800, 'TSMS1', 'TSMS1', 'active', 16, 3, '2020-06-17 03:14:56', '2020-06-17 03:14:56'),
(152, 'Telkomsel 1000 SMS ke semua op 15 hari', 1, 1, 1, 'Paket SMS - 1000 SMS ke semua 15 hari', 15550, 15500, 15450, 'TSMS2', 'TSMS2', 'active', 16, 3, '2020-06-17 03:15:51', '2020-06-17 03:15:51'),
(153, 'Telkomsel 2000 SMS ke semua op 30 hari', 1, 1, 1, 'Paket SMS - 2000 SMS ke semua 30 hari', 25650, 25600, 25550, 'TSMS3', 'TSMS3', 'active', 16, 3, '2020-06-17 03:16:37', '2020-06-17 03:16:37'),
(154, 'Indosat telepon 1000 Menit Sesama Masa Aktif Paket 1 Hari', 1, 1, 1, '300 sms sesama+100 sms operator lain/mengikuti masa aktif kartu', 6220, 6175, 6125, 'IDSSMS1', 'IDSSMS1', 'active', 17, 3, '2020-06-17 04:45:38', '2020-06-17 04:45:38'),
(155, '600 SMS sesama Isat + 200 SMS operator lain', 1, 1, 1, '600 sms sesama+250 sms operator lain/mengikuti masa aktif kartu', 11725, 11675, 11625, 'IDSSMS2', 'IDSSMS2', 'active', 17, 3, '2020-06-17 05:21:28', '2020-06-17 05:21:28'),
(156, '1250 SMS sesama Isat + 250 SMS operator lain', 1, 1, 1, '1250 sms sesama+250 sms operator lain 30hr', 10225, 10175, 10125, 'IDSSMS3', 'IDSSMS3', 'active', 17, 3, '2020-06-17 05:23:56', '2020-06-17 05:23:56'),
(157, '2000 SMS sesama Isat + 500 SMS operator lain', 1, 1, 1, '2000 sms sesama+500 sms operator lain / mengikuti masa aktif kartu', 27725, 27675, 27625, 'IDSSMS4', 'IDSSMS4', 'active', 17, 3, '2020-06-17 05:24:48', '2020-06-17 05:24:48'),
(158, 'Indosat telepon 1000 Menit Sesama Masa Aktif Paket 1 Hari', 1, 1, 1, '1000 menit sesama 1hr', 3200, 3150, 3095, 'IDSCALL1', 'IDSCALL1', 'active', 18, 3, '2020-06-17 05:26:08', '2020-06-17 05:26:08'),
(159, 'Indosat telepon unlimited sesama Masa Aktif Paket 10 Hari', 1, 1, 1, 'unlimited sesama + 30 mnt all opr 14hr', 15150, 15100, 15050, 'IDSCALL2', 'IDSCALL2', 'not_active', 18, 3, '2020-06-17 05:27:29', '2020-06-17 05:27:29'),
(160, 'Indosat telepon unlimited sesama + 60 Menit All Operator Masa Aktif Paket 30 Hari', 1, 1, 1, 'unlimited sesama + 60 mnt all 30hr', 23630, 23550, 23500, 'IDSCALL3', 'IDSCALL3', 'active', 18, 3, '2020-06-17 05:28:23', '2020-06-17 05:28:23'),
(161, 'Indosat telepon unlimited sesama + 250 Menit All Operator Masa Aktif Paket 30 Hari', 1, 1, 1, 'unlimited sesama + 250 mnt all opr 30hr', 48830, 48750, 48700, 'IDSCALL4', 'IDSCALL4', 'active', 18, 3, '2020-06-17 05:29:10', '2020-06-17 05:29:10'),
(162, 'Three Telepon 20 Menit Ke Semua Op 7 Hari', 1, 1, 1, 'Telepon 20 Menit Ke Semua Op 7 Hari', 5180, 5125, 5075, 'TECALL1', 'TECALL1', 'active', 20, 3, '2020-06-17 05:35:09', '2020-06-17 05:35:09'),
(163, 'Three Telepon 60 Menit Ke Semua Op 7 Hari', 1, 1, 1, 'Telepon 60 Menit Ke Semua Op 7 Hari', 15200, 15150, 15100, 'TECALL2', 'TECALL2', 'active', 20, 3, '2020-06-17 05:35:57', '2020-06-17 05:35:57'),
(164, 'Three Telepon 150 Menit Ke Semua Op 30 Hari', 1, 1, 1, 'Telepon 150 Menit Ke Semua Op 30 Hari', 31200, 31150, 31100, 'TECALL3', 'TECALL3', 'active', 20, 3, '2020-06-17 05:36:48', '2020-06-17 05:36:48'),
(165, 'AnyNet 500 Menit 30 Hari', 1, 1, 1, 'Tidak Suport Multi Pembelian.', 120100, 120050, 120000, 'XLAN1', 'XLAN1', 'active', 19, 3, '2020-06-17 06:27:27', '2020-06-17 06:27:27'),
(166, 'AnyNet 500 Menit 90 Hari', 1, 1, 1, 'Tidak Suport Multi Pembelian.', 131700, 131650, 131600, 'XLAN2', 'XLAN2', 'active', 19, 3, '2020-06-17 06:28:20', '2020-06-17 06:28:20'),
(167, 'AnyNet 300 Menit 90 Hari', 1, 1, 1, 'Tidak Suport Multi Pembelian.', 91050, 90975, 90925, 'XLAN3', 'XLAN3', 'active', 19, 3, '2020-06-17 06:31:46', '2020-06-17 06:31:46'),
(169, 'BRONET 1GB', 1, 1, 1, '24Jam 1GB 30hr', 12600, 12550, 12500, 'AXBN1', 'AXBN1', 'active', 21, 3, '2020-06-17 23:39:24', '2020-06-17 23:39:24'),
(170, 'BRONET 2GB', 1, 1, 1, 'DATA BRONET 24JM 2GB 30-60HR', 22800, 22750, 22700, 'AXBN2', 'AXBN2', 'active', 21, 3, '2020-06-17 23:54:33', '2020-06-17 23:54:33'),
(171, 'BRONET 2 GB', 1, 1, 1, 'Kuota 2 GB, Masa Aktif 7 Hari, 24 Jam', 17700, 15600, 17500, 'AXBN3', 'AXBN3', 'active', 21, 3, '2020-06-17 23:55:32', '2020-07-17 06:41:31'),
(172, 'BRONET 3GB', 1, 1, 1, 'DATA BRONET 24JM 3GB 30-60HR', 29100, 29050, 29000, 'AXBN4', 'AXBN4', 'active', 21, 3, '2020-06-17 23:56:23', '2020-06-17 23:56:23'),
(173, 'BRONET 3GB', 1, 1, 1, '3gb 24jam 15hr', 28100, 28050, 28000, 'AXBN5', 'AXBN5', 'active', 21, 3, '2020-06-17 23:57:12', '2020-06-17 23:57:12'),
(174, 'BRONET 5GB', 1, 1, 1, 'DATA BRONET 24JM 5GB 30-60HR', 42700, 42650, 42600, 'AXBN6', 'AXBN6', 'active', 21, 3, '2020-06-17 23:58:10', '2020-06-17 23:58:10'),
(175, 'BRONET 5GB', 1, 1, 1, '5gb 15hr 24jam', 40100, 40050, 40000, 'AXBN7', 'AXBN7', 'active', 21, 3, '2020-06-17 23:59:08', '2020-06-17 23:59:08'),
(176, 'BRONET 8 GB', 1, 1, 1, 'DATA BRONET 24JM 8GB 30-60HR', 57120, 57050, 57000, 'AXBN8', 'AXBN8', 'active', 21, 3, '2020-06-18 00:00:27', '2020-06-18 00:00:27'),
(177, 'BRONET 2GB 60 hari', 1, 1, 1, 'AXIS DATA BRONET 2GB 30H', 21720, 24670, 24620, 'AXBN9', 'AXBN9', 'active', 21, 3, '2020-06-18 00:12:10', '2020-06-18 00:12:10'),
(178, 'BRONET 3GB 60 hari', 1, 1, 1, 'AXIS DATA BRONET 3GB 30H', 31250, 31190, 31145, 'AXBN10', 'AXBN10', 'active', 21, 3, '2020-06-18 00:13:27', '2020-06-18 00:13:27'),
(179, 'BRONET 5GB 60 hari', 1, 1, 1, 'AXIS DATA BRONET 5GB 30H', 46235, 46190, 46145, 'AXBN11', 'AXBN11', 'active', 21, 3, '2020-06-18 00:14:46', '2020-06-18 00:14:46'),
(180, 'BRONET 8GB 60 hari', 1, 1, 1, 'AXIS DATA BRONET 8GB 30H', 59820, 59775, 59725, 'AXBN12', 'AXBN12', 'active', 21, 3, '2020-06-18 00:16:15', '2020-06-18 00:16:15'),
(181, 'OWSEM 1GB + 1GB 4G', 1, 1, 1, '1GB+1GB 4G 30Hr', 17120, 17050, 16950, 'AXOS1', 'AXOS1', 'active', 22, 3, '2020-06-18 00:44:31', '2020-06-18 00:44:31'),
(182, 'OWSEM 1GB + 3GB 4G', 1, 1, 1, '1GB+3GB 4G 30Hr', 28600, 28550, 28500, 'AXOS2', 'AXOS2', 'active', 22, 3, '2020-06-18 00:45:14', '2020-06-18 00:45:14'),
(183, 'OWSEM 2GB + 6GB 4G', 1, 1, 1, '2GB+6GB 4G 30Hr', 45299, 45220, 45175, 'AXOS3', 'AXOS3', 'active', 22, 3, '2020-06-18 00:46:39', '2020-06-18 00:46:39'),
(184, 'OWSEM 3GB + 9GB 4G', 1, 1, 1, '3GB+9GB 4G 30Hr', 59860, 59820, 59775, 'AXOS4', 'AXOS4', 'active', 22, 3, '2020-06-18 00:48:10', '2020-06-18 00:48:10'),
(185, 'Axis OWSEM 16GB + Unlimited Games 30hr', 1, 1, 1, 'Kuota Internet 24jam 2Gb + Kuota Sosmed 4Gb (FB, Twitter, IG, Tiktok) + Kuota Musik 4Gb (Joox, Smule) + 6Gb Kuota Malam 00-06 + Kuota Games Unlimited 1Gb /day (FreeFire, Mobile Legends, AOV, ASPHALT Legends, Vain Glory, Modern Combat 5)', 40250, 40200, 40150, 'AXOS5', 'AXOS5', 'active', 22, 3, '2020-06-18 00:56:14', '2020-06-18 00:56:14'),
(186, 'Axis OWSEM 24GB + Unlimited Games 30hr', 1, 1, 1, 'Kuota Internet 24jam 3Gb + Kuota Sosmed 6Gb (FB, Twitter, IG, Tiktok) + Kuota Musik 6Gb (Joox, Smule) + 9Gb Kuota Malam 00-06 + Kuota Games Unlimited 1Gb /day (FreeFire, Mobile Legends, AOV, ASPHALT Legends, Vain Glory, Modern Combat 5)', 51725, 51689, 51624, 'AXOS6', 'AXOS6', 'active', 22, 3, '2020-06-18 01:03:57', '2020-06-18 01:03:57'),
(187, 'Axis OWSEM 32GB + Unlimited Games 30hr', 1, 1, 1, 'Kuota Internet 24jam 4Gb + Kuota Sosmed 8Gb (FB, Twitter, IG, Tiktok) + Kuota Musik 8Gb (Joox, Smule) + 12Gb Kuota Malam 00-06 + Kuota Games Unlimited 1Gb /day (FreeFire, Mobile Legends, AOV, ASPHALT Legends, Vain Glory, Modern Combat 5)', 59650, 59598, 59546, 'AXOS7', 'AXOS7', 'active', 22, 3, '2020-06-18 01:05:10', '2020-06-18 01:05:10'),
(188, 'Axis OWSEM 48GB + Unlimited Games 30hr', 1, 1, 1, 'Kuota Internet 24jam 6Gb + Kuota Sosmed 12Gb (FB, Twitter, IG, Tiktok) + Kuota Musik 12Gb (Joox, Smule) + 18Gb Kuota Malam 00-06 + Kuota Games Unlimited 1Gb /day (FreeFire, Mobile Legends, AOV, ASPHALT Legends, Vain Glory, Modern Combat 5)', 74240, 74198, 74138, 'AXOS8', 'AXOS8', 'active', 22, 3, '2020-06-18 01:06:26', '2020-06-18 01:06:26'),
(235, 'Token PLN 10.000', 1, 1, 3, 'Token PLN 10.000', 10600, 10500, 10300, 'PLN10', 'PLN10', 'active', 33, 3, '2020-06-21 01:15:11', '2020-07-03 21:47:29'),
(238, 'Token PLN 20.000', 1, 1, 5, 'Token PLN 20.000', 20160, 20050, 20020, 'PLN20', 'PLN20', 'active', 33, 3, '2020-06-23 01:12:42', '2020-07-03 21:48:04'),
(239, 'Token PLN 50.000', 1, 1, 5, 'Token PLN 50.000', 50160, 50050, 50050, 'PLN50', 'PLN50', 'active', 33, 3, '2020-06-23 01:20:06', '2020-06-23 01:20:06'),
(240, 'Token PLN 100.000', 1, 1, 5, 'Token PLN 100.000', 100160, 100050, 100050, 'PLN100', 'PLN100', 'active', 33, 3, '2020-06-23 01:21:13', '2020-06-23 01:21:13'),
(241, 'Token PLN 200.000', 1, 1, 5, 'Token PLN 200.000', 200160, 200050, 200050, 'PLN200', 'PLN200', 'active', 33, 3, '2020-06-23 01:24:02', '2020-06-23 01:24:02'),
(242, 'Token PLN 500.000', 1, 1, 5, 'Token PLN 500.000', 500160, 500050, 500050, 'PLN500', 'PLN500', 'active', 33, 3, '2020-06-23 01:25:34', '2020-06-23 01:25:34'),
(243, 'Token PLN 1.000.000', 1, 1, 5, 'Token PLN 100.000.000', 1000160, 1000050, 1000050, 'PLN1000K', 'PLN1000K', 'active', 33, 3, '2020-06-23 01:26:47', '2020-06-23 01:26:47'),
(244, 'Saldo Dana 10.000', 1, 1, 1, 'Saldo Dana 10.000', 10200, 10150, 10100, 'DN10', 'DN10', 'active', 35, 3, '2020-06-23 02:04:44', '2020-06-23 02:04:44'),
(245, 'Saldo Dana 20.000', 1, 1, 1, 'Saldo Dana Rp. 20.000', 20200, 20150, 20100, 'DN20', 'DN20', 'active', 35, 3, '2020-06-23 02:09:39', '2020-06-30 07:10:36'),
(246, 'Saldo Dana 25.000', 1, 1, 1, 'Saldo Dana 25.000', 25200, 25150, 25100, 'DN25', 'DN25', 'active', 35, 3, '2020-06-23 02:10:32', '2020-06-23 02:10:32'),
(247, 'Saldo Dana 30.000', 1, 1, 1, 'Saldo Dana 30.000', 30200, 30150, 30100, 'DN30', 'DN30', 'active', 35, 3, '2020-06-23 02:11:17', '2020-06-23 02:11:17'),
(248, 'Saldo Dana 40.000', 1, 1, 1, 'Saldo Dana 40.000', 40200, 40150, 40100, 'DN40', 'DN40', 'active', 35, 3, '2020-06-23 02:13:55', '2020-06-23 02:13:55'),
(249, 'Saldo Dana 50.000', 1, 1, 1, 'Saldo Dana 50.000', 50200, 50150, 50100, 'DN50', 'DN50', 'active', 35, 3, '2020-06-23 02:14:40', '2020-06-23 02:14:40'),
(250, 'Saldo Dana 75.000', 1, 1, 1, 'Saldo Dana 75.000', 75200, 75150, 75100, 'DN75', 'DN75', 'active', 35, 3, '2020-06-23 02:16:21', '2020-06-23 02:16:21'),
(251, 'Saldo Dana 100.000', 1, 1, 1, 'Saldo Dana 100.000', 100200, 100150, 100100, 'DN100', 'DN100', 'active', 35, 3, '2020-06-23 02:17:52', '2020-06-23 02:17:52'),
(252, 'Saldo Dana 150.000', 1, 1, 1, 'Saldo Dana 150.000', 150200, 150150, 150100, 'DN150', 'DN150', 'active', 35, 3, '2020-06-23 02:18:46', '2020-06-23 02:18:46'),
(253, 'Saldo Dana 200.000', 1, 1, 1, 'Saldo Dana 200.000', 200200, 200150, 200100, 'DN200', 'DN200', 'active', 35, 3, '2020-06-23 02:19:36', '2020-06-23 02:19:36'),
(254, 'Saldo Dana 250.000', 1, 1, 1, 'Saldo Dana 250.000', 250200, 250150, 250100, 'DN250', 'DN250', 'active', 35, 3, '2020-06-23 02:20:54', '2020-06-23 02:20:54'),
(255, 'Saldo Dana 300.000', 1, 1, 1, 'Saldo Dana 300.000', 300200, 300150, 300100, 'DN300', 'DN300', 'active', 35, 3, '2020-06-23 02:21:50', '2020-06-23 02:21:50'),
(256, 'Saldo Dana 400.000', 1, 1, 1, 'Saldo Dana 400.000', 400200, 400150, 400100, 'DN400', 'DN400', 'active', 35, 3, '2020-06-23 02:22:34', '2020-06-23 02:22:34'),
(257, 'Saldo Dana 500.000', 1, 1, 1, 'Saldo Dana 500.000', 500200, 500150, 500100, 'DN500', 'DN500', 'active', 35, 3, '2020-06-23 02:25:49', '2020-06-23 02:25:49'),
(258, 'Saldo Dana 600.000', 1, 1, 1, 'Saldo Dana 600.000', 600475, 600425, 600375, 'DN600', 'DN600', 'active', 35, 3, '2020-06-23 02:27:37', '2020-06-23 02:27:37'),
(259, 'Saldo Dana 700.000', 1, 1, 1, 'Saldo Dana 700.000', 700475, 700425, 700375, 'DN700', 'DN700', 'active', 35, 3, '2020-06-23 02:28:48', '2020-06-23 02:28:48'),
(260, 'Saldo Dana 800.000', 1, 1, 1, 'Saldo Dana 800.000', 800475, 800425, 800375, 'DN800', 'DN800', 'active', 35, 3, '2020-06-23 02:28:48', '2020-06-23 02:49:29'),
(261, 'Saldo Dana 1.000.000', 1, 1, 1, 'Saldo Dana 1.000.000', 1000200, 1000150, 1000100, 'DN1000K', 'DN1000K', 'active', 35, 3, '2020-06-23 02:31:41', '2020-06-23 02:31:41'),
(265, 'Saldo Dana 900.000', 1, 1, 1, 'Saldo Dana 900.000', 900150, 900120, 900070, 'DN900', 'DN900', 'active', 35, 3, '2020-06-26 00:00:07', '2020-06-26 00:00:07'),
(266, 'Garena 33 Shell', 1, 1, 1, 'Garena Shell 33', 9190, 9180, 9130, 'GS33', 'GS33', 'active', 39, 3, '2020-06-26 00:07:46', '2020-07-03 22:35:29'),
(267, 'Cash PB 60000', 1, 1, 1, 'Cash PB 60000', 482390, 482320, 482225, 'PB60000', 'PB60000', 'active', 40, 3, '2020-06-26 00:23:13', '2020-06-26 00:23:13'),
(268, 'Cash PB 1200', 1, 1, 1, 'Cash PB 1.200', 9120, 9050, 9005, 'PB1200', 'PB1200', 'active', 40, 3, '2020-06-26 00:37:54', '2020-06-26 00:37:54'),
(269, 'Cash PB 2400', 1, 1, 1, 'Cash PB 2.400', 18140, 18050, 18010, 'PB2400', 'PB2400', 'active', 40, 3, '2020-06-26 00:39:28', '2020-06-26 00:39:28'),
(270, 'Cash PB 6000', 1, 1, 1, 'Cash PB 6.000', 45140, 45070, 45025, 'PB6000', 'PB6000', 'active', 40, 3, '2020-06-26 00:41:12', '2020-06-26 00:41:12'),
(271, 'Cash PB 12.000', 1, 1, 1, 'Cash PB 12.000', 90140, 90070, 90025, 'PB12000', 'PB12000', 'active', 40, 3, '2020-06-26 00:42:40', '2020-06-26 00:42:40'),
(275, 'Saldo Ovo 20.000', 1, 1, 5, 'Saldo Ovo Rp. 20.000', 20420, 20325, 20275, 'OVO20', 'OVO20', 'active', 38, 3, '2020-06-29 02:15:18', '2020-06-29 02:15:18'),
(276, 'Saldo Ovo 25.000', 1, 1, 5, 'Saldo Ovo Rp. 25.000', 25425, 25325, 25275, 'OVO25', 'OVO25', 'active', 38, 3, '2020-06-29 02:16:21', '2020-06-29 02:16:21'),
(277, 'Saldo Ovo 30.000', 1, 1, 5, 'Saldo Ovo Rp. 30.000', 30500, 30450, 30400, 'OVO30', 'OVO30', 'active', 38, 3, '2020-06-29 02:37:39', '2020-06-29 02:37:39'),
(278, 'Saldo Ovo 40.000', 1, 1, 5, 'Saldo Ovo Rp. 40.000', 40500, 40450, 40400, 'OVO40', 'OVO40', 'active', 38, 3, '2020-06-29 02:38:45', '2020-06-29 02:38:45'),
(279, 'Saldo Ovo 50.000', 1, 1, 5, 'Saldo Ovo Rp. 50.000', 50500, 50450, 50400, 'OVO50', 'OVO50', 'active', 38, 3, '2020-06-29 02:39:43', '2020-07-03 21:21:46'),
(280, 'Saldo Ovo 60.000', 1, 1, 5, 'Saldo Ovo Rp. 60.000', 60500, 60450, 60400, 'OVO60', 'OVO60', 'active', 38, 3, '2020-06-29 02:40:46', '2020-06-29 02:40:46'),
(281, 'Saldo Ovo 70.000', 1, 1, 5, 'Saldo Ovo Rp. 70.000', 70500, 70450, 70400, 'OVO70', 'OVO70', 'active', 38, 3, '2020-06-29 02:41:45', '2020-06-29 02:41:45'),
(282, 'Saldo Ovo 75.000', 1, 1, 5, 'Saldo Ovo Rp. 75.000', 75500, 75450, 75400, 'OVO75', 'OVO75', 'active', 38, 3, '2020-06-29 02:42:58', '2020-06-29 02:42:58'),
(283, 'Saldo Ovo 80.000', 1, 1, 5, 'Saldo Ovo Rp. 80.000', 80500, 80450, 80400, 'OVO80', 'OVO80', 'active', 38, 3, '2020-06-29 02:49:21', '2020-06-29 02:49:21'),
(284, 'Saldo Ovo 90.000', 1, 1, 3, 'Saldo Ovo Rp. 90.000', 90500, 90450, 90400, 'OVO90', 'OVO90', 'active', 38, 3, '2020-06-29 02:50:04', '2020-06-29 02:50:04'),
(285, 'Saldo Ovo 100.000', 1, 1, 5, 'Saldo Ovo Rp. 100.000', 100500, 100450, 100400, 'OVO100', 'OVO100', 'active', 38, 3, '2020-06-29 02:50:49', '2020-06-29 02:50:49'),
(287, 'Saldo Ovo 150.000', 1, 1, 5, 'Saldo Ovo Rp. 150.000', 150500, 150450, 150400, 'OVO150', 'OVO150', 'active', 38, 3, '2020-07-03 21:12:36', '2020-07-03 21:12:36'),
(288, 'Saldo Ovo 200.000', 1, 1, 5, 'Saldo Ovo Rp. 200.000', 200500, 200450, 200400, 'OVO200', 'OVO200', 'active', 38, 3, '2020-07-03 21:13:33', '2020-07-03 21:13:33'),
(289, 'Saldo Ovo 250.000', 1, 1, 5, 'Saldo Ovo Rp. 250.000', 250400, 250335, 250285, 'OVO250', 'OVO250', 'active', 38, 3, '2020-07-03 21:50:29', '2020-07-03 21:50:29'),
(290, 'Saldo Ovo 300.000', 1, 1, 5, 'Saldo Ovo Rp. 300.000', 300400, 300335, 300285, 'OVO300', 'OVO300', 'active', 38, 3, '2020-07-03 21:51:31', '2020-07-03 21:51:31'),
(291, 'Saldo Ovo 400.000', 1, 1, 5, 'Saldo Ovo Rp. 400.000', 400400, 400335, 400285, 'OVO400', 'OVO400', 'active', 38, 3, '2020-07-03 21:53:32', '2020-07-03 21:53:32'),
(292, 'Saldo Ovo 500.000', 1, 1, 5, 'Saldo Ovo Rp. 500.000', 500400, 500335, 500285, 'OVO500', 'OVO500', 'active', 38, 3, '2020-07-03 21:54:30', '2020-07-03 21:54:30'),
(293, 'Saldo Ovo 600.000', 1, 1, 5, 'Saldo Ovo Rp. 600.000', 600500, 600450, 600400, 'OVO600', 'OVO600', 'active', 38, 3, '2020-07-03 21:57:27', '2020-07-03 21:57:27'),
(294, 'Saldo Ovo 700.000', 1, 1, 5, 'Saldo Ovo Rp. 700.000', 700500, 700450, 700400, 'OVO700', 'OVO700', 'active', 38, 3, '2020-07-03 21:58:25', '2020-07-03 21:58:25'),
(295, 'Saldo Ovo 800.000', 1, 1, 5, 'Saldo Ovo Rp. 800.000', 800500, 800450, 800400, 'OVO800', 'OVO800', 'active', 38, 3, '2020-07-03 21:59:14', '2020-07-03 21:59:14'),
(296, 'Saldo Ovo 900.000', 1, 1, 5, 'Saldo Ovo Rp. 900.000', 900500, 900450, 900400, 'OVO900', 'OVO900', 'active', 38, 3, '2020-07-03 22:00:10', '2020-07-03 22:00:10'),
(297, 'Saldo Ovo 1.000.000', 1, 1, 5, 'Saldo Ovo Rp. 1.000.000', 1000500, 1000450, 1000400, 'OVO1000K', 'OVO1000K', 'active', 43, 3, '2020-07-03 22:01:29', '2020-07-03 22:01:29'),
(298, 'Garena 66 Shell', 1, 1, 3, 'Garena Shell 66', 18380, 18330, 18300, 'GRN66', 'GRN66', 'active', 39, 3, '2020-07-03 22:12:08', '2020-07-03 22:12:08'),
(299, 'Garena 165 Shell', 1, 1, 3, 'Garena Shell 165', 45600, 45545, 45500, 'GS165', 'GS165', 'active', 39, 3, '2020-07-03 22:13:43', '2020-07-03 22:13:43'),
(300, 'Garena 330 Shell', 1, 1, 3, 'Garena Shell 330', 91300, 91100, 91150, 'GS330', 'GS330', 'active', 39, 3, '2020-07-03 22:14:59', '2020-07-14 07:30:42'),
(301, 'Saldo Go Pay 5.000', 1, 1, 3, 'Saldo Gopay Rp. 5.000', 5620, 5550, 5500, 'GPAY5', 'GPAY5', 'active', 37, 3, '2020-07-03 22:36:38', '2020-07-03 22:36:38'),
(302, 'Saldo Go Pay 10.000', 1, 1, 3, 'Saldo', 10580, 10500, 10450, 'GPAY10', 'GPAY10', 'active', 37, 3, '2020-07-03 22:37:55', '2020-07-12 21:20:11'),
(303, 'Saldo Go Pay 20.000', 1, 1, 3, 'Saldo Gopay Rp. 20.000', 20620, 20500, 20450, 'GPAY20', 'GPAY20', 'active', 37, 3, '2020-07-03 22:46:11', '2020-07-03 22:46:11'),
(310, 'Saldo Go Pay 25.000', 1, 1, 1, 'Saldo Gopay Rp. 25.000', 25580, 25500, 25450, 'GPAY25', 'GPAY25', 'active', 37, 3, '2020-07-12 21:21:19', '2020-07-12 21:21:19'),
(311, 'Saldo Go Pay 30.000', 1, 1, 5, 'Saldo Gopay Rp. 30.000', 40600, 40550, 30475, 'GPAY30', 'GPAY30', 'active', 37, 3, '2020-07-12 21:23:46', '2020-07-12 21:23:46'),
(312, 'Saldo Go Pay 40.000', 1, 1, 5, 'Saldo Gopay Rp. 40.000', 40600, 40550, 40475, 'GPAY40', 'GPAY40', 'active', 37, 3, '2020-07-12 21:25:10', '2020-07-12 21:25:10'),
(313, 'Saldo Go Pay 40.000', 1, 1, 1, 'Saldo Gopay Rp. 50.000', 50580, 50500, 50450, 'GPAY50', 'GPAY50', 'active', 37, 3, '2020-07-12 21:27:32', '2020-07-12 21:27:32'),
(314, 'Saldo Go Pay 75.000', 1, 1, 5, 'Saldo Gopay Rp. 75.000', 75580, 75500, 75450, 'GPAY75', 'GPAY75', 'active', 37, 3, '2020-07-12 21:29:28', '2020-07-12 21:29:28'),
(315, 'Saldo Go Pay 100.000', 1, 1, 1, 'Saldo Gopay Rp. 100.000', 100580, 100500, 100450, 'GPAY100', 'GPAY100', 'active', 37, 3, '2020-07-12 21:30:57', '2020-07-12 21:30:57'),
(316, 'Saldo Go Pay 150.000', 1, 1, 1, 'Saldo Gopay Rp. 150.000', 150580, 150500, 150450, 'GPAY150', 'GPAY150', 'active', 37, 3, '2020-07-12 21:32:57', '2020-07-12 21:32:57'),
(317, 'Saldo Go Pay 200.000', 1, 1, 5, 'Saldo Gopay Rp. 200.000', 200580, 200500, 200450, 'GPAY200', 'GPAY200', 'active', 37, 3, '2020-07-12 21:34:46', '2020-07-12 21:34:46'),
(318, 'Saldo Go Pay 250.000', 1, 1, 5, 'Saldo Gopay Rp. 250.000', 250580, 250500, 25450, 'GPAY250', 'GPAY250', 'active', 37, 3, '2020-07-12 21:36:00', '2020-07-12 21:36:00'),
(319, 'Saldo Go Pay 500.000', 1, 1, 5, 'Saldo Gopay Rp. 500.000', 500880, 500800, 500750, 'GPAY500', 'GPAY500', 'active', 37, 3, '2020-07-12 21:37:45', '2020-07-12 21:37:45'),
(320, 'Saldo Go Pay 1.000.000', 1, 1, 1, 'Saldo Gopay Rp. 1.000.000', 1000880, 1000800, 1000750, 'GPAY1000', 'GPAY1000', 'active', 37, 3, '2020-07-12 21:40:02', '2020-07-12 21:40:02'),
(321, 'SHOPEE PAY 10.000', 1, 1, 5, 'Saldo Shopee Pay Rp. 10.000', 10250, 10150, 10100, 'SPAY10', 'SPAY10', 'active', 43, 3, '2020-07-12 23:25:23', '2020-07-12 23:25:23'),
(322, 'SHOPEE PAY 20.000', 1, 1, 5, 'Saldo Shopee Pay Rp. 20.000', 20250, 20150, 20100, 'SPAY20', 'SPAY20', 'active', 43, 3, '2020-07-12 23:26:13', '2020-07-12 23:26:13'),
(323, 'SHOPEE PAY 25.000', 1, 1, 1, 'Saldo Shopee Pay Rp. 25.000', 20250, 20150, 25100, 'SPAY25', 'SPAY25', 'active', 43, 3, '2020-07-12 23:27:02', '2020-07-12 23:27:02'),
(324, 'SHOPEE PAY 30.000', 1, 1, 1, 'Saldo Shopee Pay Rp. 30.000', 30250, 30150, 30100, 'SPAY30', 'SPAY30', 'active', 43, 3, '2020-07-12 23:27:47', '2020-07-12 23:27:47'),
(325, 'SHOPEE PAY 40.000', 1, 1, 3, 'Saldo Shopee Pay Rp. 40.000', 40250, 40150, 40100, 'SPAY40', 'SPAY40', 'active', 43, 3, '2020-07-12 23:28:58', '2020-07-12 23:28:58'),
(326, 'SHOPEE PAY 50.000', 1, 1, 3, 'Saldo Shopee Pay Rp. 50.000', 50250, 50150, 50100, 'SPAY50', 'SPAY50', 'active', 43, 3, '2020-07-12 23:30:00', '2020-07-12 23:30:00'),
(327, 'SHOPEE PAY 60.000', 1, 1, 3, 'Saldo Shopee Pay Rp. 60.000', 60250, 60150, 60100, 'SPAY60', 'SPAY60', 'active', 43, 3, '2020-07-12 23:30:43', '2020-07-12 23:30:43'),
(328, 'SHOPEE PAY 70.000', 1, 1, 3, 'Saldo Shopee Pay Rp. 70.000', 70250, 70150, 70100, 'SPAY70', 'SPAY70', 'active', 43, 3, '2020-07-12 23:31:30', '2020-07-12 23:31:30'),
(329, 'SHOPEE PAY 75.000', 1, 1, 2, 'Saldo Shopee Pay Rp. 75.000', 70250, 70150, 75100, 'SPAY75', 'SPAY75', 'active', 43, 3, '2020-07-12 23:32:29', '2020-07-12 23:32:29'),
(330, 'SHOPEE PAY 80.000', 1, 1, 2, 'Saldo Shopee Pay Rp. 80.000', 80250, 80150, 80100, 'SPAY80', 'SPAY80', 'active', 43, 3, '2020-07-12 23:34:12', '2020-07-12 23:34:12'),
(331, 'SHOPEE PAY 90.000', 1, 1, 2, 'Saldo Shopee Pay Rp. 90.000', 90350, 90250, 90200, 'SPAY90', 'SPAY90', 'active', 43, 3, '2020-07-12 23:35:17', '2020-07-12 23:35:17'),
(332, 'SHOPEE PAY 100.000', 1, 1, 2, 'Saldo Shopee Pay Rp. 100.000', 100250, 100150, 100100, 'SPAY100', 'SPAY100', 'active', 43, 3, '2020-07-12 23:36:19', '2020-07-12 23:36:19'),
(333, 'SHOPEE PAY 150.000', 1, 1, 2, 'Saldo Shopee Pay Rp. 150.000', 150250, 150150, 150100, 'SPAY150', 'SPAY150', 'active', 43, 3, '2020-07-12 23:37:15', '2020-07-12 23:37:15'),
(334, 'SHOPEE PAY 200.000', 1, 1, 2, 'Saldo Shopee Pay Rp. 200.000', 200250, 200150, 200100, 'SPAY200', 'SPAY200', 'active', 43, 3, '2020-07-12 23:38:15', '2020-07-12 23:38:15'),
(335, 'SHOPEE PAY 250.000', 1, 1, 2, 'Saldo Shopee Pay Rp. 250.000', 250350, 250250, 250200, 'SPAY250', 'SPAY250', 'active', 43, 3, '2020-07-12 23:39:07', '2020-07-12 23:39:07'),
(336, 'SHOPEE PAY 300.000', 1, 1, 2, 'Saldo Shopee Pay Rp. 300.000', 300350, 300250, 300200, 'SPAY300', 'SPAY300', 'active', 43, 3, '2020-07-12 23:40:16', '2020-07-12 23:40:16'),
(337, 'SHOPEE PAY 400.000', 1, 1, 2, 'Saldo Shopee Pay Rp. 400.000', 400350, 400300, 400200, 'SPAY400', 'SPAY400', 'active', 43, 3, '2020-07-12 23:44:02', '2020-07-12 23:44:02'),
(339, 'LinkAja 10.000', 1, 1, 1, 'Saldo LinkAja Rp. 10.000', 10280, 10150, 10100, 'LA10', 'LA10', 'active', 44, 3, '2020-07-14 20:33:08', '2020-07-14 20:35:11'),
(340, 'Promo Token PLN 20.000', 1, 1, 1, 'Promo Token PLN 20.000', 19900, 19900, 19860, 'PROMOPLN20', 'PROMOPLN20', 'active', 45, 3, '2020-07-15 21:24:55', '2020-07-15 21:24:55'),
(341, 'LinkAja 20.000', 1, 1, 2, 'Saldo LinkAja Rp. 20.000', 20280, 20150, 20100, 'LA20', 'LA20', 'active', 44, 3, '2020-07-16 07:08:49', '2020-07-16 07:08:49'),
(342, 'LinkAja 25.000', 1, 1, 1, 'Saldo LinkAja Rp. 25.000', 25280, 25150, 25100, 'LA25', 'LA25', 'active', 44, 3, '2020-07-16 07:09:43', '2020-07-16 07:09:43'),
(343, 'LinkAja 30.000', 1, 1, 2, 'Saldo LinkAja Rp. 30.000', 30280, 30150, 30100, 'LA30', 'LA30', 'active', 44, 3, '2020-07-16 07:10:36', '2020-07-16 07:10:36'),
(344, 'LinkAja 40.000', 1, 1, 2, 'Saldo LinkAja Rp. 40.000', 40280, 40150, 40100, 'LA40', 'LA40', 'active', 44, 3, '2020-07-16 07:11:54', '2020-07-16 07:11:54'),
(345, 'LinkAja 50.000', 1, 1, 2, 'Saldo LinkAja Rp. 50.000', 50280, 50150, 50100, 'LA50', 'LA50', 'active', 44, 3, '2020-07-16 07:20:22', '2020-07-16 07:20:22'),
(346, 'LinkAja 60.000', 1, 1, 3, 'Saldo LinkAja Rp. 60.000', 60380, 60250, 60150, 'LA60', 'LA60', 'active', 44, 3, '2020-07-16 07:28:02', '2020-07-16 07:28:02'),
(347, 'LinkAja 70.000', 1, 1, 2, 'Saldo LinkAja Rp. 60.000', 60280, 60150, 60100, 'LA70', 'LA70', 'active', 44, 3, '2020-07-16 07:29:17', '2020-07-16 07:29:17'),
(348, 'LinkAja 75.000', 1, 1, 2, 'Saldo LinkAja Rp. 75.000', 75280, 75150, 75100, 'LA75', 'LA75', 'active', 43, 3, '2020-07-16 07:31:00', '2020-07-16 07:31:00'),
(349, 'LinkAja 80.000', 1, 1, 2, 'Saldo LinkAja Rp. 80.000', 80280, 80150, 80100, 'LA80', 'LA80', 'active', 44, 3, '2020-07-16 07:38:12', '2020-07-16 07:38:12'),
(350, 'LinkAja 90.000', 1, 1, 2, 'Saldo LinkAja Rp. 90.000', 90380, 90200, 90150, 'LA90', 'LA90', 'active', 44, 3, '2020-07-16 07:42:30', '2020-07-16 07:42:30'),
(351, 'LinkAja 100.000', 1, 1, 2, 'Saldo LinkAja Rp. 100.000', 100280, 100150, 100100, 'LA100', 'LA100', 'active', 35, 3, '2020-07-16 07:47:45', '2020-07-16 07:47:45'),
(352, 'LinkAja 150.000', 1, 1, 2, 'Saldo LinkAja Rp. 150.000', 150280, 150150, 150100, 'LA150', 'LA150', 'active', 44, 3, '2020-07-16 07:53:11', '2020-07-16 07:53:11'),
(353, 'LinkAja 200.000', 1, 1, 2, 'Saldo LinkAja Rp. 200.000', 200280, 200150, 200100, 'LA200', 'LA200', 'active', 44, 3, '2020-07-16 07:55:57', '2020-07-16 07:55:57'),
(354, 'LinkAja 250.000', 1, 1, 2, 'Saldo LinkAja Rp. 250.000', 250380, 250250, 250200, 'LA250', 'LA250', 'active', 35, 3, '2020-07-16 07:58:00', '2020-07-16 07:58:00'),
(355, 'LinkAja 300.000', 1, 1, 2, 'Saldo LinkAja Rp. 300.000', 300280, 300150, 300100, 'LA300', 'LA300', 'active', 44, 3, '2020-07-16 07:59:30', '2020-07-16 07:59:30'),
(356, 'LinkAja 400.000', 1, 1, 2, 'Saldo LinkAja Rp. 400.000', 400280, 400150, 400100, 'LA400', 'LA400', 'active', 35, 3, '2020-07-16 08:01:14', '2020-07-16 08:01:14'),
(357, 'LinkAja 500.000', 1, 1, 2, 'Saldo LinkAja Rp. 500.000', 500280, 500150, 500100, 'LA500', 'LA500', 'active', 44, 3, '2020-07-16 08:02:53', '2020-07-16 08:02:53'),
(358, 'LinkAja 600.000', 1, 1, 2, 'Saldo LinkAja Rp. 600.000', 600280, 600150, 600100, 'LA600', 'LA600', 'active', 44, 3, '2020-07-16 08:03:59', '2020-07-16 08:03:59'),
(359, 'LinkAja 700.000', 1, 1, 2, 'Saldo LinkAja Rp. 700.000', 700280, 700150, 700100, 'LA700', 'LA700', 'active', 44, 3, '2020-07-16 08:05:53', '2020-07-16 08:05:53'),
(360, 'LinkAja 800.000', 1, 1, 2, 'Saldo LinkAja Rp. 800.000', 800280, 800150, 800100, 'LA800', 'LA800', 'active', 44, 3, '2020-07-16 08:07:42', '2020-07-16 08:07:42'),
(361, 'LinkAja 900.000', 1, 1, 2, 'Saldo LinkAja Rp. 900.000', 90280, 900150, 900100, 'LA900', 'LA900', 'active', 44, 3, '2020-07-16 08:08:59', '2020-07-16 08:08:59'),
(362, 'LinkAja 1.000.000', 1, 1, 2, 'Saldo LinkAja Rp. 1.000.000', 1000280, 1000150, 1000100, 'LA1000', 'LA1000', 'active', 44, 3, '2020-07-16 08:12:08', '2020-07-16 08:12:08'),
(363, '12 Diamond Mobile Legend', 1, 1, 2, 'nomor tujuan diisi gabungan user id dan zone id.<br>contoh: player id (389127272), zona id(9788) =  3891272729788', 3550, 3425, 3375, 'ML12', 'ML12', 'active', 46, 3, '2020-07-16 09:03:12', '2020-07-16 09:06:21'),
(364, '28 Diamond Mobile Legend', 1, 1, 2, '28 Diamond Mobile Legend', 7820, 76700, 7650, 'ML28', 'ML28', 'active', 46, 3, '2020-07-16 09:04:45', '2020-07-16 09:04:45'),
(365, '36 Diamond Mobile Legend', 1, 1, 2, 'nomor tujuan diisi gabungan user id dan zone id.<br>contoh: player id (389127272), zona id(9788) =  3891272729788', 9750, 9600, 9550, 'ML36', 'ML36', 'active', 46, 3, '2020-07-16 09:07:37', '2020-07-16 09:07:37'),
(366, '59 Diamond Mobile Legend', 1, 1, 2, 'nomor tujuan diisi gabungan user id dan zone id.<br>contoh: player id (389127272), zona id(9788) =  3891272729788', 16420, 15300, 15250, 'ML59', 'ML59', 'active', 46, 3, '2020-07-16 09:08:56', '2020-07-16 09:08:56'),
(367, '74 Diamond Mobile Legend', 1, 1, 2, 'nomor tujuan diisi gabungan user id dan zone id.<br>contoh: player id (389127272), zona id(9788) =  3891272729788', 19220, 19100, 19050, 'ML74', 'ML74', 'active', 46, 3, '2020-07-16 09:10:00', '2020-07-16 09:10:00'),
(368, '85 Diamond Mobile Legend', 1, 1, 2, 'nomor tujuan diisi gabungan user id dan zone id.<br>contoh: player id (389127272), zona id(9788) =  3891272729788', 22050, 21950, 21900, 'ML85', 'ML85', 'active', 46, 3, '2020-07-16 09:11:12', '2020-07-16 09:11:12'),
(369, '170 Diamond Mobile Legend', 1, 1, 2, 'nomor tujuan diisi gabungan user id dan zone id.<br>contoh: player id (389127272), zona id(9788) =  3891272729788', 43920, 43800, 43750, 'ML170', 'ML170', 'active', 46, 3, '2020-07-16 09:12:14', '2020-07-16 09:12:14'),
(370, '185 Diamond Mobile Legend', 1, 1, 2, 'nomor tujuan diisi gabungan user id dan zone id.<br>contoh: player id (389127272), zona id(9788) =  3891272729788', 47720, 47600, 47550, 'ML185', 'ML185', 'active', 46, 3, '2020-07-16 09:13:33', '2020-07-16 09:13:33'),
(371, '222 Diamond Mobile Legend', 1, 1, 2, 'nomor tujuan diisi gabungan user id dan zone id.<br>contoh: player id (389127272), zona id(9788) =  3891272729788', 57220, 57100, 57050, 'ML222', 'ML222', 'active', 46, 3, '2020-07-16 09:16:16', '2020-07-16 09:16:16'),
(372, '296 Diamond Mobile Legend', 1, 1, 2, 'nomor tujuan diisi gabungan user id dan zone id.<br>contoh: player id (389127272), zona id(9788) =  3891272729788', 76220, 76100, 76050, 'ML296', 'ML296', 'active', 46, 3, '2020-07-16 09:17:05', '2020-07-16 09:17:05'),
(373, '370 Diamond Mobile Legend', 1, 1, 5, 'nomor tujuan diisi gabungan user id dan zone id.<br>contoh: player id (389127272), zona id(9788) =  3891272729788', 95220, 95100, 95050, 'ML370', 'ML370', 'active', 46, 3, '2020-07-16 09:18:01', '2020-07-16 09:18:01'),
(374, '586 Diamond Mobile Legend', 1, 1, 2, 'nomor tujuan diisi gabungan user id dan zone id.<br>contoh: player id (389127272), zona id(9788) =  3891272729788', 142450, 142400, 142300, 'ML568', 'ML568', 'active', 46, 3, '2020-07-16 09:19:05', '2020-07-16 09:19:05'),
(375, '875 Diamond Mobile Legend', 1, 1, 2, 'nomor tujuan diisi gabungan user id dan zone id.<br>contoh: player id (389127272), zona id(9788) =  3891272729788', 218450, 218400, 218300, 'ML875', 'ML875', 'active', 46, 3, '2020-07-16 09:19:52', '2020-07-16 09:19:52'),
(376, '1159 Diamond Mobile Legend', 1, 1, 2, 'nomor tujuan diisi gabungan user id dan zone id.<br>contoh: player id (389127272), zona id(9788) =  3891272729788', 285200, 285100, 284950, 'ML1159', 'ML1159', 'active', 46, 3, '2020-07-16 09:21:39', '2020-07-16 09:21:39'),
(377, '2010 Diamond Mobile Legend', 1, 1, 2, 'nomor tujuan diisi gabungan user id dan zone id.<br>contoh: player id (389127272), zona id(9788) =  3891272729788', 475200, 475100, 474950, 'ML2010', 'ML2010', 'active', 46, 3, '2020-07-16 09:22:40', '2020-07-16 09:22:40'),
(378, '4830 Diamond Mobile Legend', 1, 1, 2, 'nomor tujuan diisi gabungan user id dan zone id.<br>contoh: player id (389127272), zona id(9788) =  3891272729788', 114220, 1140100, 1140050, 'ML4830', 'ML4830', 'active', 46, 2, '2020-07-16 09:24:13', '2020-07-16 09:24:13'),
(379, '6050 Diamond Mobile Legend', 1, 1, 2, 'nomor tujuan diisi gabungan user id dan zone id.<br>contoh: player id (389127272), zona id(9788) =  3891272729788', 1425220, 1425100, 1425050, 'ML6050', 'ML6050', 'active', 46, 3, '2020-07-16 09:25:08', '2020-07-16 09:25:08'),
(380, '5 Diamond Free Fire', 1, 1, 3, 'Masukan Id Game Free Fire', 1070, 1030, 960, 'FF5', 'FF5', 'active', 47, 3, '2020-07-16 23:09:19', '2020-07-16 23:09:19'),
(381, '12 Diamond Free Fire', 1, 1, 2, 'Masukan Id Game Free Fire', 2070, 2000, 1940, 'FF12', 'FF12', 'active', 47, 3, '2020-07-16 23:10:35', '2020-07-16 23:10:35');
INSERT INTO `services` (`id`, `name`, `min`, `max`, `point`, `note`, `price`, `price_api`, `price_operan`, `code`, `code_operan`, `status`, `provider_id`, `operan_id`, `created_at`, `updated_at`) VALUES
(382, '20 Diamond Free Fire', 1, 1, 3, 'Masukan Id Game Free Fire', 3850, 3790, 3725, 'FF20', 'FF20', 'active', 47, 3, '2020-07-16 23:11:33', '2020-07-16 23:11:33'),
(383, '50 Diamond Free Fire', 1, 1, 5, 'Masukan', 7690, 7600, 7505, 'FF50', 'FF50', 'active', 47, 3, '2020-07-16 23:12:30', '2020-07-16 23:13:05'),
(384, '70 Diamond Free Fire', 1, 1, 2, 'Masukan Id Game Free Fire', 9650, 9550, 9455, 'FF70', 'FF70', 'active', 47, 3, '2020-07-16 23:14:14', '2020-07-16 23:14:14'),
(385, '140 Diamond Free Fire', 1, 1, 2, 'Masukan Id Game Free Fire', 19270, 19170, 19110, 'FF140', 'FF140', 'active', 47, 3, '2020-07-16 23:16:17', '2020-07-16 23:16:17'),
(386, '355 Diamond Free Fire', 1, 1, 2, 'Masukan Id Game Free Fire', 46950, 46850, 46775, 'FF355', 'FF355', 'active', 47, 3, '2020-07-16 23:17:28', '2020-07-16 23:17:28'),
(387, '720 Diamond Free Fire', 1, 1, 2, 'Masukan Id Game Free Fire', 93250, 93150, 93025, 'FF720', 'FF720', 'active', 47, 3, '2020-07-16 23:18:30', '2020-07-16 23:18:30'),
(388, '1450 Diamond Free Fire', 1, 1, 2, 'Masukan Id Game Free Fire', 188350, 188250, 188125, 'FF1450', 'FF1450', 'active', 47, 3, '2020-07-16 23:20:05', '2020-07-16 23:20:05'),
(389, '2000 Diamond Free Fire', 1, 1, 2, 'Masukan Id Game Free Fire', 257700, 257600, 257500, 'FF2000', 'FF2000', 'active', 47, 3, '2020-07-16 23:24:34', '2020-07-16 23:24:34'),
(390, '2180 Diamond Free Fire', 1, 1, 2, 'Masukan Id Game Free Fire', 282400, 282300, 282175, 'FF2180', 'FF2180', 'active', 47, 3, '2020-07-16 23:26:08', '2020-07-16 23:26:08'),
(391, '3640 Diamond Free Fire', 1, 1, 2, 'Masukan Id Game Free Fire', 470500, 470400, 470225, 'FF3640', 'FF3640', 'active', 47, 3, '2020-07-16 23:27:20', '2020-07-16 23:27:20'),
(392, '7290 Diamond Free Fire', 1, 1, 2, 'Masukan Id Game Free Fire', 940500, 940400, 940325, 'FF7290', 'FF7290', 'active', 40, 3, '2020-07-16 23:28:24', '2020-07-16 23:28:24'),
(393, '36500 Diamond Free Fire', 1, 1, 2, 'Masukan Id Game Free Fire', 4700800, 4700700, 4700525, 'FF36500', 'FF36500', 'active', 47, 3, '2020-07-16 23:30:20', '2020-07-16 23:30:20'),
(394, '73100 Diamond Free Fire', 1, 1, 2, 'Masukan Id Game Free Fire', 9506900, 9505900, 9500000, 'FF73100', 'FF73100', 'active', 47, 3, '2020-07-16 23:31:55', '2020-07-16 23:31:55'),
(395, 'Telkomsel Data Flash 5.000', 1, 1, 10, '20MB - 40MB sesuai zona / 7 Hari', 4700, 4600, 4500, 'TSELDF5', 'TSELDF5', 'active', 48, 3, '2020-07-17 06:33:58', '2020-07-17 06:33:58'),
(396, 'Telkomsel Data Flash 10.000', 1, 1, 5, '50MB - 110MB sesuai zona, 7 Hari', 9160, 9050, 9000, 'TSELDF10', 'TSELDF10', 'active', 48, 3, '2020-07-17 06:35:23', '2020-07-17 06:35:23'),
(397, 'Telkomsel Data Flash 20.000', 1, 1, 5, 'Telkomsel 200MB - 420MB sesuai zona / 7 Hari', 12160, 17050, 17000, 'TSELDF20', 'TSELDF20', 'active', 48, 3, '2020-07-17 06:36:36', '2020-07-17 06:36:36'),
(398, 'Telkomsel Data Flash 25.000', 1, 1, 5, '360MB - 800MB sesuai zona / 30 Hari', 20160, 20050, 20000, 'TSELDF25', 'TSELDF25', 'active', 48, 3, '2020-07-17 06:43:53', '2020-07-17 06:43:53'),
(399, 'Telkomsel Data Flash 50.000', 1, 1, 2, '800MB - 1.5GB sesuai zona / 30 Hari', 45900, 45800, 45000, 'TSELDF50', 'TSELDF50', 'active', 48, 3, '2020-07-17 06:45:17', '2020-07-17 06:45:17'),
(400, 'Telkomsel Data Flash 100.000', 1, 1, 2, 'Tidak   -  12 GB / 30 Hari (sesuai zona)', 91150, 91000, 90000, 'TSELDF100', 'TSELDF100', 'active', 48, 3, '2020-07-17 06:46:16', '2020-07-17 06:46:16'),
(401, 'Telkomsel Data Flash 200.000', 1, 1, 3, '50 GB / 30 Hari (sesuai zona)', 195180, 195100, 195025, 'TSELDF200', 'TSELDF200', 'active', 48, 3, '2020-07-17 06:48:08', '2020-07-17 06:48:08'),
(402, 'Telkomsel Data Flash 100 MB', 1, 1, 2, 'Data Flash 100MB,  24 jam 7 hari', 4120, 4000, 3950, 'TSELDF100MB', 'TSELDF100MB', 'active', 48, 3, '2020-07-17 06:49:32', '2020-07-17 06:49:32'),
(403, 'Telkomsel Data Flash 50 MB', 1, 1, 2, 'Data Flash 50MB, 24 jam 7 hari', 3520, 3400, 3355, 'TSELDF50MB', 'TSELDF50MB', 'active', 48, 3, '2020-07-17 06:51:04', '2020-07-17 06:51:04'),
(404, 'Telkomsel Data Flash 250 MB', 1, 1, 2, 'Data Flash 250MB, 24 jam 7 hari', 7150, 7000, 6900, 'TSELDF250MB', 'TSELDF250MB', 'active', 48, 3, '2020-07-17 06:53:05', '2020-07-17 06:53:05'),
(405, 'Telkomsel Data Flash 500 MB', 1, 1, 2, 'Data Flash 500MB,  24 jam 30 hari', 11000, 10900, 10800, 'TSELDF500MB', 'TSELDF500MB', 'active', 48, 3, '2020-07-17 06:54:14', '2020-07-17 06:54:14'),
(406, 'Telkomsel Data Flash 750 MB', 1, 1, 2, 'Data Flash 750MB,  24 jam 30 hari', 17160, 17000, 16950, 'TSELDF750MB', 'TSELDF750MB', 'active', 48, 3, '2020-07-17 06:56:35', '2020-07-17 06:56:35'),
(407, 'Telkomsel Data Flash 1 GB', 1, 1, 2, 'Data Flash 1GB, 24 jam 30 hari', 17700, 17600, 17500, 'TSELDF1GB', 'TSELDF1GB', 'active', 48, 3, '2020-07-17 06:58:57', '2020-07-17 06:58:57'),
(408, 'Telkomsel Data Flash 2 GB', 1, 1, 1, 'Data Flash 2GB,  24 jam 30 hari', 35160, 35000, 34900, 'TSELDF2GB', 'TSELDF2GB', 'active', 48, 3, '2020-07-17 07:00:19', '2020-07-17 07:00:19'),
(409, 'Telkomsel Data Flash 3 GB', 1, 1, 2, 'Data Flash 3GB, 24 jam 30 hari', 44400, 44300, 44200, 'TSELDF3GB', 'TSELDF3GB', 'active', 48, 3, '2020-07-17 07:03:44', '2020-07-17 07:03:44'),
(410, 'Telkomsel Data Flash 4 GB', 1, 1, 2, 'Data Flash 4GB, 24 jam 30 hari', 60200, 60100, 60000, 'TSELDF4GB', 'TSELDF4GB', 'active', 48, 3, '2020-07-17 07:07:10', '2020-07-17 07:07:10'),
(411, 'Telkomsel Data Flash 8 GB', 1, 1, 3, 'Data Flash 8GB, 24 jam 30 hari', 82200, 82100, 82000, 'TSELDF8GB', 'TSELDF8GB', 'active', 48, 3, '2020-07-17 07:09:02', '2020-07-17 07:09:02'),
(412, 'Telkomsel Data Flash 12 GB', 1, 1, 2, 'Data Flash 12GB, 24 jam 30 hari', 97500, 97370, 97325, 'TSELDF12', 'TSELDF12', 'active', 48, 3, '2020-07-17 07:11:25', '2020-07-17 07:11:25'),
(413, 'PUBG MOBILE 50 UC', 1, 1, 2, 'PUBG MOBILE 50 UC . Langsung masuk ke id penggunaka . format transaksi menggunakan ID akun', 10160, 10050, 10000, 'PUBG50', 'PUBG50', 'active', 49, 3, '2020-07-17 08:27:13', '2020-07-17 08:27:13'),
(414, 'PUBG MOBILE 150 UC', 1, 1, 2, 'PUBG MOBILE 150 UC . Langsung masuk ke id penggunaka . format transaksi menggunakan ID akun', 18160, 28050, 28800, 'PUBG150', 'PUBG150', 'active', 49, 3, '2020-07-17 08:31:33', '2020-07-17 08:31:33'),
(415, 'PUBG MOBILE 250 UC', 1, 1, 2, 'PUBG MOBILE 150 UC . Langsung masuk ke id penggunaka . format transaksi menggunakan ID akun', 481360, 48250, 48200, 'PUBG250', 'PUBG250', 'active', 49, 3, '2020-07-17 08:34:23', '2020-07-17 08:34:23'),
(416, 'PUBG MOBILE 500 UC', 1, 1, 3, 'PUBG MOBILE 500 UC . Langsung masuk ke id penggunaka . format transaksi menggunakan ID akun', 96760, 96600, 96500, 'PUBG500', 'PUBG500', 'active', 49, 3, '2020-07-17 08:35:21', '2020-07-17 08:35:21'),
(417, 'PUBG MOBILE 1250 UC', 1, 1, 2, 'PUBG MOBILE 1250 UC . Langsung masuk ke id penggunaka . format transaksi menggunakan ID akun', 241250, 241100, 240925, 'PUBG1250', 'PUBG1250', 'active', 49, 3, '2020-07-17 08:37:39', '2020-07-17 08:37:39'),
(418, 'PUBG MOBILE 2500 UC', 1, 1, 2, 'PUBG MOBILE 2500 UC . Langsung masuk ke id penggunaka . format transaksi menggunakan ID akun', 491720, 491600, 491525, 'PUBG2500', 'PUBG2500', 'active', 49, 3, '2020-07-17 08:39:17', '2020-07-17 08:39:17'),
(419, 'PUBG MOBILE 3500 UC', 1, 1, 5, 'PUBG MOBILE 3500 UC . Langsung masuk ke id penggunaka . format transaksi menggunakan ID akun', 673720, 673650, 673600, 'PUBG3500', 'PUBG3500', 'active', 49, 3, '2020-07-17 08:40:38', '2020-07-17 08:40:38'),
(420, 'PUBG MOBILE 5000 UC', 1, 1, 2, 'PUBG MOBILE 5000 UC . Langsung masuk ke id penggunaka . format transaksi menggunakan ID akun', 1015150, 1015050, 1015000, 'PUBG5000', 'PUBG5000', 'active', 49, 3, '2020-07-17 08:42:09', '2020-07-17 08:42:09'),
(421, 'PUBG MOBILE 7000 UC', 1, 1, 1, 'PUBG MOBILE 7000 UC . Langsung masuk ke id penggunaka . format transaksi menggunakan ID akun', 1349650, 1349550, 1349500, 'PUBG7000', 'PUBG7000', 'active', 49, 3, '2020-07-17 08:43:17', '2020-07-17 08:43:17'),
(422, 'Telkomsel Data Bulk 3 GB', 1, 1, 2, 'Telkomsel 3 GB + 1GB OMG 30 Hari', 38920, 38800, 38750, 'TSELDB3', 'TSELDB3', 'active', 50, 3, '2020-07-17 20:09:16', '2020-07-17 20:09:16'),
(423, 'Telkomsel Data Bulk 4.5 GB', 1, 1, 2, 'elkomsel 4.5 GB + 2 GB OMG + 100 menit telepon + 60 sms (30 Hari)', 66980, 66900, 66750, 'TSELDB4', 'TSELDB4', 'active', 50, 3, '2020-07-17 20:10:12', '2020-07-17 20:10:12'),
(424, 'Telkomsel Data Bulk 5 GB', 1, 1, 3, 'Telkomsel 5 GB + 2GB OMG 30 Hari', 65680, 65600, 65500, 'TSELDB5', 'TSELDB5', 'active', 50, 3, '2020-07-17 20:12:40', '2020-07-17 20:12:40'),
(425, 'Telkomsel Data Bulk 8 GB', 1, 1, 5, 'Telkomsel 8 GB + 2GB OMG 30 Hari', 87820, 87550, 87500, 'TSELDB8', 'TSELDB8', 'active', 50, 3, '2020-07-17 20:28:04', '2020-07-17 20:28:04'),
(426, 'Telkomsel Data Bulk 12 GB', 1, 1, 2, 'Telkomsel 12 GB + 2 GB OMG 30 Hari', 96820, 96750, 96675, 'TSELDB12', 'TSELDB12', 'active', 50, 3, '2020-07-17 20:28:55', '2020-07-17 20:28:55'),
(427, 'Telkomsel Data Bulk 17 GB', 1, 1, 2, 'Telkomsel 17 GB + 2 GB OMG + 300 menit telepon + 100 sms (30 Hari)', 100220, 100100, 100025, 'TSELDB17', 'TSELDB17', 'active', 50, 3, '2020-07-17 20:29:40', '2020-07-17 20:29:40'),
(428, 'Telkomsel Data Bulk 25 GB', 1, 1, 2, 'Telkomsel 25 GB + 2 GB OMG 30 Hari', 150250, 150200, 150125, 'TSELDB25', 'TSELDB25', 'active', 50, 3, '2020-07-17 20:30:57', '2020-07-17 20:30:57'),
(429, 'Telkomsel Data Bulk 28 GB', 1, 1, 2, 'Telkomsel 28 GB + 2 GB OMG + 600 menit telepon + 200 sms (30 Hari)', 166220, 166150, 166100, 'TSELDB28', 'TSELDB28', 'active', 50, 3, '2020-07-17 20:31:55', '2020-07-17 20:31:55'),
(430, 'Telkomsel Data Bulk 50 GB', 1, 1, 2, 'Telkomsel 50 GB + 2 GB OMG 30 Hari', 181250, 181190, 181125, 'TSELDB50', 'TSELDB50', 'active', 50, 3, '2020-07-17 20:33:27', '2020-07-17 20:33:27'),
(431, 'Telkomsel Paket Internet Instagram 1GB / 1 Hari', 1, 1, 2, 'Telkomsel Paket Internet Instagram 1GB / 1 Hari', 5120, 5050, 5500, 'TSELDI1', 'TSELDI1', 'active', 51, 3, '2020-07-17 20:43:04', '2020-07-17 20:43:04'),
(432, 'Telkomsel Paket Internet Instagram 1GB / 3 Hari', 1, 1, 2, 'Telkomsel Paket Internet Instagram 1GB / 3 Hari', 10100, 10050, 9975, 'TSELDI2', 'TSELDI2', 'active', 51, 2, '2020-07-17 20:44:11', '2020-07-17 20:44:11'),
(433, 'Telkomsel Paket Internet Instagram 2GB / 3 Hari', 1, 1, 2, 'Telkomsel Paket Internet Instagram 2GB / 3 Hari', 13920, 13800, 13750, 'TSELDI3', 'TSELDI3', 'active', 51, 3, '2020-07-17 20:45:47', '2020-07-17 20:45:47'),
(434, 'Telkomsel Paket Internet Instagram 1GB / 7 Hari', 1, 1, 2, 'Telkomsel Paket Internet Instagram 1GB / 7 Hari', 17120, 17050, 16975, 'TSELDI4', 'TSELDI4', 'active', 51, 3, '2020-07-17 20:46:34', '2020-07-17 20:46:34'),
(435, 'Telkomsel Paket Internet Instagram 2GB / 7 Hari', 1, 1, 2, 'Telkomsel Paket Internet Instagram 2GB / 7 Hari', 20820, 20750, 20700, 'TSELDI5', 'TSELDI5', 'active', 51, 3, '2020-07-17 20:47:14', '2020-07-17 20:47:14'),
(436, 'Telkomsel Paket Internet Instagram 3GB / 7 Hari', 1, 1, 2, 'Telkomsel Paket Internet Instagram 3GB / 7 Hari', 24820, 24750, 24700, 'TSELDI6', 'TSELDI6', 'active', 51, 3, '2020-07-17 20:47:50', '2020-07-17 20:47:50'),
(437, 'Telkomsel Paket Internet Facebook 1GB / 1 Hari', 1, 1, 5, 'Telkomsel Paket Internet Facebook 1GB / 1 Hari', 5120, 5050, 5000, 'TSELDF1', 'TSELDF1', 'active', 53, 3, '2020-07-17 20:51:06', '2020-07-17 20:51:06'),
(438, 'Telkomsel Paket Internet Facebook 1GB / 3 Hari', 1, 1, 5, 'Telkomsel Paket Internet Facebook 1GB / 3 Hari', 9920, 9800, 9750, 'TSELDF2', 'TSELDF2', 'active', 53, 3, '2020-07-17 20:51:45', '2020-07-17 20:51:45'),
(439, 'Telkomsel Paket Internet Facebook 2GB / 3 Har', 1, 1, 5, 'Telkomsel Paket Internet Facebook 2GB / 3 Har', 13920, 13800, 13750, 'TSELDF3', 'TSELDF3', 'active', 53, 3, '2020-07-17 20:52:25', '2020-07-17 20:52:25'),
(440, 'Telkomsel Paket Internet Facebook 1GB / 7 Hari', 1, 1, 5, 'Telkomsel Paket Internet Facebook 1GB / 7 Hari', 16920, 16800, 16750, 'TSELDF4', 'TSELDF4', 'active', 53, 3, '2020-07-17 20:53:33', '2020-07-17 20:53:33'),
(441, 'Telkomsel Paket Internet Facebook 2GB / 7 Hari', 1, 1, 5, 'Telkomsel Paket Internet Facebook 2GB / 7 Hari', 20920, 20800, 20750, 'TSELDF6', 'TSELDF6', 'active', 53, 3, '2020-07-17 20:54:27', '2020-07-17 20:54:27'),
(442, 'Telkomsel Paket Internet Facebook 3GB / 7 Hari', 1, 1, 2, 'Telkomsel Paket Internet Facebook 3GB / 7 Hari', 24920, 24800, 24750, 'TSELDF7', 'TSELDF7', 'active', 53, 3, '2020-07-17 20:55:06', '2020-07-17 20:55:06'),
(443, 'Telkomsel Paket Internet Youtube 1GB / 1 Hari', 1, 1, 2, 'Telkomsel Paket Internet Youtube 1GB / 1 Hari', 5120, 5050, 5500, 'TSELDY1', 'TSELDY1', 'active', 52, 3, '2020-07-17 21:00:27', '2020-07-17 21:00:27'),
(444, 'Telkomsel Paket Internet Youtube 1GB / 3 Hari', 1, 1, 5, 'Telkomsel Paket Internet Youtube 1GB / 3 Hari', 9920, 9800, 9750, 'TSELDY2', 'TSELDY2', 'active', 52, 3, '2020-07-17 21:03:11', '2020-07-17 21:03:11'),
(445, 'Telkomsel Paket Internet Youtube 2GB / 3 Hari', 1, 1, 2, 'Telkomsel Paket Internet Youtube 2GB / 3 Hari', 15120, 14050, 13975, 'TSELDY3', 'TSELDY3', 'active', 52, 3, '2020-07-17 21:05:20', '2020-07-17 21:05:20'),
(446, 'Telkomsel Paket Internet Youtube 1GB / 7 Hari', 1, 1, 5, 'Telkomsel Paket Internet Youtube 1GB / 7 Hari', 17120, 17050, 16975, 'TSELDY4', 'TSELDY4', 'active', 52, 3, '2020-07-17 21:06:05', '2020-07-17 21:06:05'),
(447, 'Telkomsel Paket Internet Youtube 2GB / 7 Hari', 1, 1, 5, 'Telkomsel Paket Internet Youtube 2GB / 7 Hari', 21120, 21050, 20975, 'TSELDY5', 'TSELDY5', 'active', 52, 3, '2020-07-17 21:06:37', '2020-07-17 21:06:37'),
(448, 'Telkomsel Paket Internet Youtube 3GB / 7 Hari', 1, 1, 2, 'Telkomsel Paket Internet Youtube 3GB / 7 Hari', 25120, 25050, 24975, 'TSELDY6', 'TSELDY6', 'active', 52, 3, '2020-07-17 21:07:13', '2020-07-17 21:07:13'),
(449, 'Telkomsel Data Malam 1 Gb 1 Hari', 1, 1, 5, 'Aktif pukul 00-07', 3520, 3400, 3350, 'DATAM1', 'DATAM1', 'active', 54, 3, '2020-07-17 21:13:06', '2020-07-17 21:13:06'),
(450, 'Telkomsel Data Malam 5 Gb 1 Hari', 1, 1, 10, 'ktif pukul 00-07', 6520, 6450, 6400, 'DATAM2', 'DATAM2', 'active', 54, 3, '2020-07-17 21:13:51', '2020-07-17 21:13:51'),
(451, 'Telkomsel Data Malam 5 Gb 30 Hari', 1, 1, 10, 'Aktif pukul 00-07', 16320, 16200, 16150, 'DATAM3', 'DATAM3', 'active', 54, 3, '2020-07-17 21:14:40', '2020-07-17 21:14:40'),
(452, 'Telkomsel Data Malam 15 Gb 30 Hari', 1, 1, 5, 'Aktif pukul 00-07', 22220, 22100, 22000, 'DATAM4', 'DATAM4', 'active', 54, 3, '2020-07-17 21:15:26', '2020-07-17 21:15:26'),
(453, 'Telkomsel Data Mini 1 Gb 3 Hari', 1, 1, 5, '24 jam', 12320, 12530, 12475, 'TSELDM1', 'TSELDM1', 'active', 55, 3, '2020-07-17 21:17:44', '2020-07-17 21:17:44'),
(454, 'Telkomsel Data Mini 2 Gb 3 Hari', 1, 1, 5, '24 jam', 15620, 15550, 15500, 'TSELDM2', 'TSELDM2', 'active', 55, 3, '2020-07-17 21:18:29', '2020-07-17 21:18:29'),
(455, 'Telkomsel Data Mini 10 Gb 3 Hari', 1, 1, 10, '24 jam', 36820, 36850, 36800, 'TSELDM3', 'TSELDM3', 'not_active', 55, 3, '2020-07-17 21:19:20', '2020-07-17 21:19:20'),
(456, 'Telkomsel Data 250 MB semua jaringan + bebas zona 30 Hr', 1, 1, 10, '24 jam 30 hari', 8120, 8000, 7950, 'TSELSJ3', 'TSELSJ3', 'not_active', 3, 3, '2020-07-17 21:25:56', '2020-07-17 21:25:56'),
(457, '500 MB semua jaringan + bebas zona', 1, 1, 10, '24 JAM', 14120, 14050, 14000, 'TSELSJ1', 'TSELSJ1', 'active', 3, 3, '2020-07-17 21:27:46', '2020-07-17 21:27:46'),
(458, '1 GB semua jaringan + bebas zona', 1, 1, 10, '24 JAM', 18120, 18050, 18500, 'TSELSJ2', 'TSELSJ2', 'active', 3, 3, '2020-07-17 21:28:41', '2020-07-17 21:28:41'),
(459, 'Indosat Internet Unlimited + 500MB, 2 hari', 1, 1, 3, 'Kuota Utama 500MB + Unlimited Aplikasi sehari-hari + Unlimited Streaming Spotify dan iFlix + Unlimited SMS ke IM3 Ooredoo + Unlimited Nelpon ke IM3 Ooredoo + Unlimited Youtube (via MyIM3)', 5220, 5100, 5050, 'IDSIU500', 'IDSIU500', 'active', 56, 3, '2020-07-17 22:01:51', '2020-07-17 22:01:51'),
(460, 'Indosat Internet Unlimited + 1GB, 7 hari', 1, 1, 10, 'Kuota Utama 1GB + Unlimited Aplikasi sehari-hari + Unlimited Streaming Spotify dan iFlix + Unlimited SMS ke IM3 Ooredoo + Unlimited Nelpon ke IM3 Ooredoo + Unlimited Youtube (via MyIM3)', 15190, 15075, 15025, 'DSIU7D', 'DSIU7D', 'active', 56, 3, '2020-07-17 22:02:54', '2020-07-17 22:02:54'),
(461, 'Indosat Internet Unlimited + 1GB, 30 hari', 1, 1, 10, 'Kuota Utama 1GB + Unlimited Aplikasi sehari-hari + Unlimited Streaming Spotify dan iFlix . Masa Aktif 30 hari', 23920, 23850, 23800, 'IDSIIU1', 'IDSIIU1', 'active', 56, 3, '2020-07-17 22:03:43', '2020-07-17 22:03:43'),
(462, 'Indosat Internet Unlimited + 2GB, 30 hari', 1, 1, 3, 'Kuota Utama 2GB + Unlimited Aplikasi sehari-hari + Unlimited Streaming Spotify dan iFlix . Masa Aktif 30 hari', 37980, 37900, 37850, 'IDSIU2', 'IDSIU2', 'active', 56, 3, '2020-07-17 22:05:16', '2020-07-17 22:05:16'),
(463, 'Indosat Internet Unlimited + 3GB, 30 hari', 1, 1, 5, 'Kuota Utama 3GB + Unlimited Aplikasi sehari-hari + Unlimited Streaming Spotify dan iFlix + Unlimited SMS ke IM3 Ooredoo . Masa Aktif 30 hari', 56780, 56650, 56600, 'IDSIU3', 'IDSIU3', 'active', 56, 3, '2020-07-17 22:06:23', '2020-07-17 22:06:23'),
(464, 'Indosat Internet Unlimited + 7GB, 30 hari', 1, 1, 5, 'Kuota Utama 7GB + Unlimited Aplikasi sehari-hari + Unlimited Streaming Spotify dan iFlix + Unlimited SMS ke IM3 Ooredoo + Unlimited Youtube (via MyIM3) . Masa Aktif 30 hari', 75450, 75350, 75300, 'IDSIU7', 'IDSIU7', 'active', 56, 3, '2020-07-17 22:07:10', '2020-07-17 22:07:10'),
(465, 'Indosat Internet Unlimited + 10GB, 30 hari', 1, 1, 2, 'Kuota Utama 10GB + Unlimited Aplikasi sehari-hari + Unlimited Streaming Spotify dan iFlix + Unlimited SMS ke IM3 Ooredoo + Unlimited Nelpon ke IM3 Ooredoo + Unlimited Youtube (via MyIM3)', 95150, 95075, 95025, 'IDSIU10', 'IDSIU10', 'active', 56, 3, '2020-07-17 22:07:57', '2020-07-17 22:07:57'),
(466, 'Indosat Internet Unlimited + 15GB, 30 hari', 1, 1, 5, 'Kuota Utama 15GB + Unlimited Aplikasi sehari-hari + Unlimited Streaming Spotify dan iFlix + Unlimited SMS ke IM3 Ooredoo + Unlimited Nelpon ke IM3 Ooredoo + Unlimited Youtube (via MyIM3)', 119720, 119650, 119600, 'IDSIU15', 'IDSIU15', 'active', 56, 3, '2020-07-17 22:08:53', '2020-07-17 22:08:53'),
(467, 'Indosat Internet Unlimited JUMBO, 30 hari', 1, 1, 10, 'Kuota Utama JUMBO + Unlimited Aplikasi sehari-hari + Unlimited Streaming Spotify dan iFlix + 100 SMS ke Semua Operator + Unlimited Nelpon + SMS ke Indosat + Unlimited Youtube', 142160, 142075, 142025, 'IDSIUJ30', 'IDSIUJ30', 'active', 56, 3, '2020-07-17 22:10:06', '2020-07-17 22:10:06'),
(468, 'Instagram View PROMO RMD 1 GRATIS SELAMANYA', 100, 200, 1, 'NO', 0, 0, 0, '1', '1614', 'active', 57, 1, '2020-07-18 03:45:32', '2020-07-18 05:08:36'),
(469, 'Instagram Followers PROMO 1 ( BOT ) TERMURAH LQ', 50, 10000, 5, 'No Komplain, No Reffil, No Reffund, Haig Drop', 3600, 3300, 3800, '2', '1408', 'active', 57, 1, '2020-07-18 06:04:54', '2020-07-18 06:04:54'),
(470, 'Instagram', 100, 5000, 10, 'STAR', 28000, 28000, 27200, '3', '3213', 'active', 59, 2, '2020-07-18 06:17:54', '2020-07-21 00:31:52'),
(471, 'Instagram Followers PROMO 2  ( INSTAN ~ LQ ~ NEW ) CEK NOTE', 50, 10000, 10, 'HAIG DROP, DROP SAMPAI HABIS KITA TIDAK TANGGUNG JAWAB PERSEN KITA KEMUNGKINAN 90 - 100%', 5100, 5000, 5300, '4', '1385', 'active', 57, 1, '2020-07-18 06:30:37', '2020-07-18 06:30:37'),
(472, 'Instagram Followers PROMO 3 ( BOT ~ NO REFFIL ~ MAX 20K ) CHEAP', 50, 20000, 10, 'NO KOMPLAIN JIKA DROP SAMPAI 100%, NO REFFILL, NO REFFUND', 5200, 5200, 5400, '5', '3252', 'active', 57, 2, '2020-07-18 06:44:56', '2020-07-18 06:44:56'),
(473, 'Instagram Followers PROMO 4 ( No Reffil - BOT - MAX 10k )', 50, 10000, 10, 'NO REFFIL, NO REFFUD, DILARANG KOMPLAIN UNTUK DROP HINGGA 100%', 7000, 7000, 7000, '6', '3222', 'active', 57, 2, '2020-07-18 06:58:05', '2020-07-18 06:58:05'),
(474, 'Instagram Likes PROMO 1 [ INSTAN] [ SUPER CHEAP ] LQ', 1000, 10000, 10, 'INSTAN!! JIKA DROP NO REFFIL, NO REFFUND', 3000, 3000, 3300, '7', '1384', 'active', 57, 1, '2020-07-18 07:00:45', '2020-07-18 07:00:45'),
(475, 'Instagram Likes PROMO 2 [ INSTAN ~ SUPERFAST ~ LQ ]', 100, 20000, 10, 'INSTAN!! SUPERFAST, NO REFFIL', 3900, 3800, 4000, '8', '1386', 'active', 57, 1, '2020-07-18 07:02:23', '2020-07-18 07:02:23'),
(476, 'Instagram Likes PROMO 3 [ INSTAN] [ SUPER CHEAP ~ EXCLUSIVE ]', 100, 10000, 5, 'INSTAN!! SUPERFAST, NO REFFIL', 5500, 5000, 5600, '9', '3188', 'active', 57, 2, '2020-07-18 07:08:40', '2020-07-18 07:08:40'),
(477, 'Instagram View + Impressions ( SuperFast ~ New ~ Super Cheap)', 100, 10000, 5, 'INSTAN!', 60, 30, 50, '10', '1653', 'active', 62, 1, '2020-07-18 07:11:27', '2020-07-19 04:57:28'),
(478, 'Instagram Followers Indonesia [ Real Account ~ New ]', 50, 1000, 5, 'Star To 1 - 24 Jam, Kemungkinan Max Kerja Kita Maxsimalkan 3 Hari Jika Lebih Boleh Ke Ticket Kita.', 55000, 55000, 51000, '11', '1325', 'active', 60, 1, '2020-07-18 23:39:35', '2020-07-18 23:39:35'),
(479, 'Instagram Followers Indonesia [ CHEAP ~INSTAN ~ NEW ]', 1000, 1000, 10, 'Best Service !! Real Indonesia! Max Kerja 1-5 Days!!', 30000, 30000, 25000, '12', '1', 'active', 60, 4, '2020-07-18 23:41:40', '2020-07-19 00:37:54'),
(480, 'Instagram Followers Indonesia [ INSTAN ~ REAL ~ CHEAP ]', 100, 300, 10, 'INSTAN!! STAR KERJA 1 - 3 HARI KERJA, JIKA LEBIH BOLEH MINTA EROR KE TICKET.', 15500, 15500, 15000, '13', '365', 'active', 60, 4, '2020-07-18 23:44:03', '2020-07-18 23:44:03'),
(481, 'Instagram Followers Indonesia [ Real Indonesia ~ INSTAN - Cek Description ]', 50, 500, 10, 'Proses Instan, 100% Real Indonesia!! Harus memiliki followers awal minimal 1 !! Jika hasilnya data salah, Silahkan coba lagi!! Dijamin sukses order di percobaan ke 2/3. Karena server otomatis get startcount!', 40000, 40000, 35000, '14', '345', 'active', 60, 4, '2020-07-18 23:46:22', '2020-07-18 23:46:22'),
(482, 'Instagram Followers RMD 1 [ REAL + BOT + SUPERFAST ]', 100, 1000, 10, 'INSTAN!!', 18000, 18000, 16700, '15', '442', 'active', 58, 4, '2020-07-18 23:48:24', '2020-07-18 23:48:24'),
(483, 'Instagram Followers RMD 2 [ REAL + BOT + INSTAN ]', 100, 2000, 10, 'INSTANN!!! STAR 0 - 1 JAM', 19500, 19500, 18500, '16', '442', 'active', 58, 4, '2020-07-18 23:50:59', '2020-07-18 23:50:59'),
(484, 'Instagram Followers [ SuperFast ~ Instan ~ Max 25K ]', 100, 25000, 10, 'BOT!! INSTAN NO REFFIL', 6500, 6500, 6500, '17', '470', 'active', 58, 4, '2020-07-18 23:52:39', '2020-07-18 23:52:39'),
(485, 'Instagram Followers WIKY 1 [ BOT ~ CHEAP ~ FAST ]', 50, 10000, 10, 'BOT!! INSTAN', 7000, 7000, 6600, '18', '1650', 'active', 58, 1, '2020-07-18 23:55:48', '2020-07-18 23:55:48'),
(486, 'Instagram Followers WIKY 2 [ BOT ~ MAX 25K ~ FAST ]', 100, 25000, 10, 'INSTAN!!', 8500, 8500, 8200, '19', '454', 'active', 58, 4, '2020-07-18 23:58:13', '2020-07-18 23:58:13'),
(487, 'Instagram Followers WIKY 3 [ INSTAN - MAX 10K ]', 10, 10000, 10, 'No Reffil!! No Reffund!!', 8500, 8500, 8000, '20', '460', 'active', 58, 4, '2020-07-18 23:59:55', '2020-07-18 23:59:55'),
(488, 'Instagram Likes { BOT ~ INSTAN ~ SuperFast )', 100, 15000, 10, 'INSTAN!!!!', 7000, 6500, 6500, '21', '446', 'active', 63, 4, '2020-07-19 00:13:09', '2020-07-19 00:13:09'),
(489, 'Instagram Likes [ Max 15k ] [ INSTANT ]', 50, 15000, 10, 'INSTAN!!', 5500, 5500, 5400, '22', '469', 'active', 63, 1, '2020-07-19 00:14:42', '2020-07-19 00:17:03'),
(490, 'Instagram Likes [ Less Drop ~ Instan ]', 50, 5000, 10, 'Less Drop, No Reffund, No Reffil', 9000, 9000, 8650, '23', '3140', 'active', 63, 2, '2020-07-19 00:19:50', '2020-07-19 00:19:50'),
(491, 'Instagram Likes [ NO DROP ~ INSTAN ]', 100, 50000, 10, 'INSTAN!!!!', 10000, 9500, 9800, '24', '1651', 'active', 63, 1, '2020-07-19 00:21:15', '2020-07-19 00:21:15'),
(492, 'Instagram Likes [ Termurah ~ New ~ Instan ]', 100, 10000, 10, 'INSTAN!!!! NO REFFIL SPEED 1K / D', 4500, 4000, 4200, '25', '1632', 'active', 63, 1, '2020-07-19 00:24:22', '2020-07-19 00:24:22'),
(493, 'Instagram Likes Asian 1 [ Pakistan, Asia, Indo ]', 50, 25000, 10, 'INSTAN!! SPEED 1K / H', 12000, 12000, 10000, '26', '1501', 'active', 66, 1, '2020-07-19 00:28:24', '2020-07-19 00:28:24'),
(494, 'Instagram Likes Asian 2 [ Real Account ~ Turkey + Asia + Indonesia ]', 50, 25000, 10, 'instan!!', 12000, 12000, 11500, '27', '2926', 'active', 66, 2, '2020-07-19 00:30:34', '2020-07-19 00:30:34'),
(495, 'Instagram Likes Asian 3 [ UltraFast ~ Instan ~ Profil ]', 50, 5000, 10, 'INSTAN!!!!', 19500, 19500, 18900, '28', '3220', 'active', 66, 2, '2020-07-19 00:31:52', '2020-07-19 00:31:52'),
(496, 'Instagram Likes Asian 4  [ ULTRAFAST ~ INSTAN ~ PROFIL ]', 50, 5000, 10, '0 - 1 Hours Start!!', 18500, 18500, 18000, '29', '350', 'active', 66, 4, '2020-07-19 00:33:59', '2020-07-19 00:33:59'),
(497, 'Instagram Likes Asian 5 [ INSTAN - SUPERFAST ]', 50, 10000, 10, 'AKUN JANGAN PRIVATE!! MINIMAL LIKES AWAL HARUS ADA 1 !! 0 - 1 JAM!! INDO.INDIA,THAILAND,MALAYSIA,TURKEY', 18000, 18000, 17000, '30', '354', 'active', 66, 4, '2020-07-19 00:35:07', '2020-07-19 00:35:07'),
(498, 'Instagram Likes Indonesia [ SuperFast ~ Instan ]', 1000, 1000, 10, 'Minimal Memiliki 1 Likes Dalam Post Supaya Star Count Kebaca Oleh Syestem', 28000, 28000, 26000, '31', '2713', 'active', 64, 2, '2020-07-19 00:43:43', '2020-07-19 00:43:43'),
(499, 'Instagram Likes Indonesia ( HQ ~ SuperFast ~ 5K )', 100, 5000, 10, 'Minimal Memiliki 1 Likes Dalam Post Supaya Star Count Kebaca Oleh Syestem', 35000, 35000, 31000, '32', '2770', 'active', 64, 2, '2020-07-19 00:45:41', '2020-07-19 00:45:41'),
(500, 'Instagram Likes Indonesia [ INSTAN ~ Cek Dekscription ]', 50, 500, 10, 'Proses Instan, 100% Real Indonesia!! Harus memiliki likes awal minimal 1 !! Jika hasilnya data salah, Silahkan coba lagi!! Dijamin sukses order di percobaan ke 2/3 ^^. Karena server otomatis get startcount!', 23000, 23000, 22000, '33', '338', 'active', 64, 4, '2020-07-19 00:47:14', '2020-07-19 00:47:14'),
(501, 'Instagram Likes Indonesia [ INSTAN ~ NEW ]', 50, 1000, 10, 'STAR KERJA 1 - 3 HARI JALAN, LEBIH BOLEH MINTA EROR KE TIKET', 15000, 15000, 13000, '34', '1347', 'active', 64, 1, '2020-07-19 00:49:24', '2020-07-19 00:49:24'),
(502, 'Instagram Likes Indonesia [ Termurah ~ Instan ]', 200, 800, 10, 'STAR 1 - 3 HARI, BIASA MASUK DALAM 24 JAM KERJA JIKA LEBIH 1 - 3 HARI BOLEH MINTA EROR KE TIKET', 5500, 4900, 5200, '36', '1297', 'active', 64, 1, '2020-07-19 00:52:14', '2020-07-19 00:52:14'),
(503, 'Youtube Subscribe RMD 1 [ BEST SERVER ~ R30D ]', 10, 1500, 10, 'STAR TIME 1 - 6 DAYS, SPEED 50 / DAYS JDI MAKAN WAKTU, SUBS REAL USA', 229000, 228000, 225000, '37', '1437', 'active', 67, 1, '2020-07-20 07:49:05', '2020-07-20 07:49:05'),
(504, 'Youtube Subscribe RMD 2 [ R45D ~ BEST MARKET ]', 100, 3000, 10, 'KUALITAS SERVER GOOD, SPEED 50 - 70/DAYS', 280000, 280000, 275000, '38', '1520', 'active', 67, 1, '2020-07-20 07:54:30', '2020-07-20 07:54:30'),
(505, 'Youtube Subscribe RMD 3 [ R50D ~ BEST LAYANAN ~ 50/D ]', 50, 25000, 10, 'REKOMENDASI LAYANAN, 50 DAYS REFFIL, STAR JAM 0 24 HARI JIKA OVERLOAD HINGGA 40 DAYS.', 250000, 250000, 240000, '39', '1438', 'active', 67, 1, '2020-07-20 07:58:54', '2020-07-20 07:58:54'),
(506, 'Youtube Subscribe [ R30D ~ 50/D ~ INSTAN ]', 10, 3000, 10, '30 DAYS REFFIL, STAR INSTAN, SPEED 50 - 100/DAYS', 68000, 66000, 67000, '40', '1662', 'active', 67, 1, '2020-07-20 08:01:29', '2020-07-20 08:01:29'),
(507, 'Instagram Followers Reffil [ R30D ~ Max 30K ]', 50, 30000, 10, 'Reffil 30D ~ Speed 500 - 2k / D ~ New Server', 32000, 30000, 30200, '41', '3146', 'active', 59, 2, '2020-07-21 00:43:09', '2020-07-21 00:43:09'),
(508, 'Instagram Followers Reffil ( REFIL 30D ~ NEW ) CHEAP', 100, 10000, 10, 'INSTAN!! STAR 0 - 24 JAM MULAI.', 30000, 29500, 28900, '42', '3114', 'active', 59, 2, '2020-07-21 00:46:48', '2020-07-21 00:46:48'),
(509, 'Youtube View Jam Tayang [ R30D ] [ Paket Jam Tayang 1000 jam ] [ Durasi Video 1 jam+ ]', 500, 5000, 10, '- Guarantee : 30 days - kecepatan 300 - 500/hari - Gunakan Durasi Video lebih dari 1 jam untuk mendapatkan hasil yang bagus - Jam tayang anda dapat sekitar 50 - 60 menit (rata rata 55 menit) untuk 1 penonton atau 1 view Jika Anda memesan 1000 view kemungkinan mendapat 800 - 100 jam tayang - Sistem kami menghitung dari jumlah awal jadi jika ada penonton organik kami tidak bertanggung jawab COntoh : jumlah awal nya 100 anda pesan 1000 view dan ada yang menonton video anda dan jumlah sudah memenuhi 1100 view kami tidak bertanggung jawab jika jam tayang tidak dapat  NOTE : - Anda dapat menggunakan beberapa video lebih dari 1 jam di saluran yang sama untuk memesan, jadi, ini dapat mempersingkat waktu untuk menyelesaikan 4000 jam. Contoh: Menggunakan 8 video di saluran yang sama. Setiap pesanan video lebih dari 500 view. Kemungkinan Hanya perlu 2 hari untuk menyelesaikan 4000 jam.', 200000, 200000, 180000, '43', '1487', 'active', 68, 1, '2020-07-21 01:01:08', '2020-07-21 01:01:08'),
(510, 'Instagram Followers Indonesia ( R15D ~ INSTAN ~ NEW )', 500, 100000, 10, 'INSTAN!! AUTO REFFIL 7 DAYS!', 70000, 70000, 55000, '44', '209', 'active', 65, 4, '2020-07-21 01:03:04', '2020-07-21 01:03:04'),
(511, 'Instagram Followers Indonesia ( R15D ~ INSTAN ~ NEW )', 500, 75000, 10, 'INSTAN!! AUTO REFFIL 15 DAYS!', 80000, 80000, 60000, '45', '210', 'active', 65, 3, '2020-07-21 01:04:14', '2020-07-21 01:04:14'),
(512, 'Instagram View + Impressions ( SuperFast ~ New ~ Super Cheap)', 100, 1000000, 10, 'INSTAN!!!', 80, 60, 80, '46', '2942', 'active', 62, 2, '2020-07-21 01:06:55', '2020-07-21 01:06:55'),
(513, 'Youtube Like [ No Reffil ~ Instan ~ Cheap ]', 50, 25000, 10, 'REAL YOUTUBE LIKE, STAR INSTAN MINIMAL 0 - 1 JAM JIKA TIDAK DELAY', 19500, 19000, 18000, '47', '1621', 'active', 71, 1, '2020-07-21 01:11:01', '2020-07-21 01:11:01'),
(514, 'Youtube Like [ Livetime ~ Instan ~ Cheapfast ]', 10, 10000, 10, 'INSTAN!! SPEED 1 - 2 K/D', 20500, 20000, 20500, '48', '1634', 'active', 71, 1, '2020-07-21 01:13:22', '2020-07-21 01:13:22'),
(515, 'Youtube Share', 500, 20000, 10, 'Put Link Of Video Real 1.5K/Day 0-1 Hour Start! Minimum 500', 50000, 50000, 40000, '49', '58', 'active', 71, 4, '2020-07-21 01:16:59', '2020-07-21 01:16:59'),
(516, 'Youtube View [ LifeTime Gruanted ~ 25 - 150K/D ~Instan ]', 100, 1000000, 10, 'CHEAPFAST ~ LIFETIME GRUANTED', 7600, 7400, 7500, '50', '1637', 'active', 69, 1, '2020-07-21 05:05:36', '2020-07-21 05:10:14'),
(517, 'Youtube View [ LifeTime Gruanted ~ Sped 50-150k/D ]', 100, 1000000, 3, 'Retention, INSTAN!!', 8000, 8000, 7800, '51', '3254', 'active', 69, 2, '2020-07-21 05:09:36', '2020-07-21 05:09:36'),
(518, 'Youtube View [ No Reffil ~ Instan ~ Max 2jt ]', 1000, 2000000, 10, 'LifeTime Gruanted, Kemungkinan Non Drop.', 9000, 8500, 8000, '52', '1664', 'active', 69, 1, '2020-07-21 05:13:54', '2020-07-21 05:13:54'),
(519, 'Facebook Profile Followers [ No Reffil ~ Max 1K ]', 50, 1000, 10, 'Exsample : https://www.facebook.com/lucky.apriana/', 70000, 68000, 69000, '53', '2987', 'active', 72, 2, '2020-07-21 05:20:46', '2020-07-21 05:20:46'),
(520, 'Facebook Profile Followers [ R30Day ~ Max 5K ]', 100, 10000, 10, 'Real Asia, Star To 1 - 3 H', 80000, 80000, 72500, '54', '3258', 'active', 72, 2, '2020-07-21 05:25:21', '2020-07-21 05:25:21'),
(521, 'Facebook Page Likes [ Cheap ~ New ]', 100, 3000, 10, 'NO REFFIL ~ 500 - 1K / D', 33500, 31500, 32200, '55', '3156', 'active', 74, 2, '2020-07-21 05:29:18', '2020-07-21 05:29:18'),
(522, 'Facebook Page Likes [ REFILL 30DAYS ]', 100, 4000, 10, '500 - 1k/D', 38000, 37000, 37500, '56', '3157', 'active', 74, 2, '2020-07-21 05:31:57', '2020-07-21 05:31:57'),
(523, 'Facebook Page Likes [ Auto Refill ~ Instan ]', 1000, 1000, 10, 'Kemungkinan Sesudh Drop 5 - 10 %', 120000, 120000, 95000, '57', '2861', 'active', 74, 2, '2020-07-21 05:44:15', '2020-07-21 05:44:15'),
(524, 'Facebook Page Followers [ R30D ~ New ]', 100, 5000, 10, 'SPEED 1 - 7 HARI KERJA, REFFIL 30 HARI', 95000, 95000, 75000, '58', '3014', 'active', 74, 2, '2020-07-21 05:47:44', '2020-07-21 05:47:44'),
(525, 'Facebook Photo Like ~ Instan [ R15D ~  Cheap ~ Max 1k ]', 100, 1000, 10, 'REFFIL 15 DAYS, STAR INSTAN', 17000, 16500, 17100, '59', '3231', 'active', 73, 2, '2020-07-21 05:54:41', '2020-07-21 05:54:41'),
(526, 'Facebook Photo Like [ R30D Instan ~ Recomended ]', 50, 25000, 10, 'REFFIL 30 DAYS, INSTAN STAR', 60000, 60000, 40900, '60', '3232', 'active', 74, 1, '2020-07-21 05:58:43', '2020-07-21 05:58:43'),
(527, 'Facebook Post Like [ Instan ~ Speed 500 - 1k/D ]', 100, 2500, 10, 'speed 500 - 1k/D, INSTAN!!', 18000, 17500, 18000, '61', '910', 'active', 73, 1, '2020-07-21 06:01:04', '2020-07-21 06:01:04'),
(528, 'Facebook Vidio View [ Instan ~ Retention ]', 100, 50000, 10, 'Speed 15 - 20k/D', 1000, 800, 1000, '62', '3167', 'active', 75, 1, '2020-07-21 06:04:44', '2020-07-21 06:04:44'),
(529, 'Facebook Vidio View [ Retention 40 Second ]', 100, 1000000, 10, '10 - 30k/D', 2000, 1500, 2000, '63', '1283', 'active', 57, 1, '2020-07-21 06:08:12', '2020-07-21 06:08:12'),
(530, 'Facebook Vidio View [ Retention 60 Second ]', 100, 1000000, 10, 'no reffil, 10 - 20k/D', 2500, 2400, 2700, '64', '1284', 'active', 75, 1, '2020-07-21 06:23:20', '2020-07-21 06:23:20'),
(531, 'Facebook Video View [ R30D ~ Instan ~ CheapFast ]', 500, 1000000, 10, 'speed 500 - 5k/D, R30D, STAR INSTAN', 1500, 1000, 1300, '65', '999', 'active', 75, 1, '2020-07-21 06:25:27', '2020-07-21 06:25:27');

-- --------------------------------------------------------

--
-- Table structure for table `sites`
--

CREATE TABLE `sites` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telp` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('maintenance','not') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'not',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sites`
--

INSERT INTO `sites` (`id`, `image`, `url`, `name`, `title`, `description`, `telp`, `email`, `alamat`, `status`, `created_at`, `updated_at`) VALUES
(1, '20200612_194908.png', 'https://luckypay.id', 'LuckyPay', 'LuckyPay ~ Panel SMM & Distributor Pulsa PPOB Termurah Dan Penyedia H2H', 'LuckyPay ~ Sebuah Website Panel Smm & Distributor Pulsa PPOB Terlengkap Dan Menyediakan H2H Termurah', '081374655989', 'suport@lucky-pedia.com', 'Pangkalan Kerinci, Pelalawan, Pekanbaru, Riau', 'not', NULL, '2020-06-14 19:34:44');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('waiting','success','closed') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `user_id`, `title`, `status`, `created_at`, `updated_at`) VALUES
(13, 23, 'Halo gaes', 'success', '2020-06-21 05:44:01', '2020-06-21 06:15:20'),
(14, 22, 'SAYA GANS', 'closed', '2020-06-21 05:46:42', '2020-06-21 22:34:49'),
(15, 51, 'simplecreativeworks', 'success', '2020-06-21 05:48:02', '2020-06-22 01:19:15'),
(16, 1, 'Panel SMM & Distributor Pulsa PPOB Termurah', 'success', '2020-06-21 22:33:28', '2020-06-21 22:33:28'),
(17, 24, 'PESANAN PENDING', 'success', '2020-06-22 17:56:30', '2020-07-15 20:49:57'),
(18, 29, 'Pulsa reguler', 'success', '2020-06-23 20:54:44', '2020-07-14 06:52:07'),
(19, 126, 'saldo dana belom masuk masuk', 'success', '2020-06-24 03:25:55', '2020-07-14 06:53:04'),
(20, 54, 'Server error', 'success', '2020-06-24 03:54:26', '2020-07-14 06:54:22'),
(21, 28, 'To up dana blum masuk', 'success', '2020-06-24 10:30:36', '2020-07-14 06:55:08'),
(22, 45, 'Errorrrtt', 'success', '2020-06-29 13:43:01', '2020-07-14 06:56:07'),
(23, 154, 'DOWNLOAD APP', 'closed', '2020-06-30 03:16:14', '2020-07-14 06:57:14'),
(24, 45, 'Ig view', 'success', '2020-07-01 01:26:13', '2020-07-14 06:58:05'),
(25, 95, 'Deposit', 'success', '2020-07-06 05:48:25', '2020-07-14 06:58:20'),
(26, 43, 'farois nur', 'success', '2020-07-07 23:43:56', '2020-07-14 06:59:17'),
(27, 152, 'saldo tidak bertambah', 'success', '2020-07-12 23:29:59', '2020-07-15 20:47:38'),
(28, 1, 'Orderan', 'success', '2020-07-15 01:37:07', '2020-07-15 20:48:09'),
(29, 179, 'PENDING DEPOSIT', 'success', '2020-07-16 18:46:42', '2020-07-16 23:43:35'),
(30, 236, 'test doang', 'closed', '2020-07-20 03:01:33', '2020-07-20 07:41:58'),
(31, 236, '\'\'\'\'\'\'', 'closed', '2020-07-20 03:39:47', '2020-07-20 07:42:32'),
(32, 238, 'asdasdas', 'closed', '2020-07-20 06:39:00', '2020-07-20 07:42:52'),
(33, 238, 'asdasdas', 'closed', '2020-07-20 06:39:15', '2020-07-20 07:43:46'),
(34, 243, 'asdas das', 'waiting', '2020-07-21 02:44:11', '2020-07-21 02:44:11');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subject_id` bigint(20) UNSIGNED NOT NULL,
  `pesan` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`id`, `subject_id`, `pesan`, `created_at`, `updated_at`, `user_id`) VALUES
(21, 13, 'Ini cuma tes disuruh Mas Lucky', '2020-06-21 05:44:01', '2020-06-21 05:44:01', 23),
(22, 14, 'min saya gans gak ?', '2020-06-21 05:46:42', '2020-06-21 05:46:42', 22),
(23, 15, 'subcriber saya turun , lucky bohongi saya , tidak menjelaskan produk baru yang ada di luckypay', '2020-06-21 05:48:02', '2020-06-21 05:48:02', 51),
(24, 15, 'tolong tanggung jawabnya dimana', '2020-06-21 05:48:38', '2020-06-21 05:48:38', 51),
(25, 16, 'ramahnia dwi kumala sari', '2020-06-21 22:33:28', '2020-06-21 22:33:28', 1),
(26, 17, 'Pesanan kok saya pnding dri kemaren yak ? -_-', '2020-06-22 17:56:30', '2020-06-22 17:56:30', 24),
(27, 18, 'Kok madih pending ya bang', '2020-06-23 20:54:44', '2020-06-23 20:54:44', 29),
(28, 19, 'hadehh pusinkk', '2020-06-24 03:25:55', '2020-06-24 03:25:55', 126),
(29, 20, 'Error\' Mulu dari td dah', '2020-06-24 03:54:26', '2020-06-24 03:54:26', 54),
(30, 21, 'ID pesanan : 198 , tolong di percepat', '2020-06-24 10:30:37', '2020-06-24 10:30:37', 28),
(31, 22, 'Kok view Instagram nya dr kemarin error\' Mulu mint', '2020-06-29 13:43:01', '2020-06-29 13:43:01', 45),
(32, 23, 'Ayoo Download App Ini Di Link : http://ramahniadwi.club/Download/LuckyPay.apk', '2020-06-30 03:16:14', '2020-06-30 03:16:14', 154),
(33, 16, 'TESTED', '2020-06-30 21:32:41', '2020-06-30 21:32:41', 1),
(34, 24, 'Kok Instagram view masih gak bisa juga min', '2020-07-01 01:26:13', '2020-07-01 01:26:13', 45),
(35, 25, 'Saya sudah transfer tp deposit masih pending,', '2020-07-06 05:48:25', '2020-07-06 05:48:25', 95),
(36, 26, 'owner nya kek kintil ajhdaidliabldiandiqAICN', '2020-07-07 23:43:56', '2020-07-07 23:43:56', 43),
(37, 27, 'saya sudah kirim ke rekening yg diminta tapi saldonya ga nambah', '2020-07-12 23:29:59', '2020-07-12 23:29:59', 152),
(38, 17, 'boleh di cek kak sudh kita proses', '2020-07-14 06:51:24', '2020-07-14 06:51:24', 1),
(39, 18, 'boleh send id pemesanan mas ?', '2020-07-14 06:52:32', '2020-07-14 06:52:32', 1),
(40, 19, 'kenapa ya kak ?', '2020-07-14 06:53:34', '2020-07-14 06:53:34', 1),
(41, 21, 'sudha kita push kak', '2020-07-14 06:55:51', '2020-07-14 06:55:51', 1),
(42, 22, 'boleh send id layanan kak ?', '2020-07-14 06:56:25', '2020-07-14 06:56:25', 1),
(43, 24, 'silahkan di cek mas sudah bisa kok', '2020-07-14 06:57:40', '2020-07-14 06:57:40', 1),
(44, 25, 'boleh send id depositnya kak', '2020-07-14 06:58:53', '2020-07-14 06:58:53', 1),
(45, 26, 'mohon maap kak, maksutnya bagaimana ya ?', '2020-07-14 07:00:58', '2020-07-14 07:00:58', 1),
(46, 27, 'boleh send id depositnya kak ?', '2020-07-14 07:01:24', '2020-07-14 07:01:24', 1),
(47, 16, 'iini kak', '2020-07-14 19:54:53', '2020-07-14 19:54:53', 1),
(48, 16, 'oke kak', '2020-07-14 19:55:40', '2020-07-14 19:55:40', 1),
(49, 28, 'Hahahhahahah', '2020-07-15 01:37:07', '2020-07-15 01:37:07', 1),
(50, 27, 'sudah kita proses ya kak', '2020-07-15 20:47:38', '2020-07-15 20:47:38', 1),
(51, 28, 'jajajjajaja', '2020-07-15 20:48:09', '2020-07-15 20:48:09', 1),
(52, 17, 'oke kak', '2020-07-15 20:49:57', '2020-07-15 20:49:57', 1),
(53, 29, 'NO ID DEPOSIT 57', '2020-07-16 18:46:42', '2020-07-16 18:46:42', 179),
(54, 29, 'silahkan di cek kembali kak', '2020-07-16 23:43:35', '2020-07-16 23:43:35', 1),
(55, 30, 'sadasd as das dasd asd as das das s', '2020-07-20 03:01:33', '2020-07-20 03:01:33', 236),
(56, 30, 'sdfdsfsdfsdfsdf', '2020-07-20 03:25:37', '2020-07-20 03:25:37', 236),
(57, 30, 'sdfdsfsdfsdfsdf', '2020-07-20 03:26:25', '2020-07-20 03:26:25', 236),
(58, 31, '\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'', '2020-07-20 03:39:47', '2020-07-20 03:39:47', 236),
(59, 32, 'asdasd asd as dasd asd asdas dasdas dasda sdasd', '2020-07-20 06:39:00', '2020-07-20 06:39:00', 238),
(60, 33, 'asdasd asd as dasd asd asdas dasdas dasda sdasd', '2020-07-20 06:39:15', '2020-07-20 06:39:15', 238),
(61, 34, 'das asd as dasd asdd as', '2020-07-21 02:44:11', '2020-07-21 02:44:11', 243);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `point` int(11) NOT NULL DEFAULT 0,
  `total_pulsa` int(11) NOT NULL DEFAULT 0,
  `total_sosmed` int(11) NOT NULL DEFAULT 0,
  `total_deposit` int(11) NOT NULL DEFAULT 0,
  `balance` int(11) NOT NULL DEFAULT 0,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','not_active') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `level` enum('developer','api','member') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'member',
  `api_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_static` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `point`, `total_pulsa`, `total_sosmed`, `total_deposit`, `balance`, `email`, `email_verified_at`, `password`, `remember_token`, `status`, `level`, `api_key`, `ip_static`, `created_at`, `updated_at`) VALUES
(1, 'Lucky Nur Apriana', 46, 37534, 138360, 0, 7812769, 'bosspulsa57@gmail.com', '2020-05-14 02:55:37', '$2y$10$Cd5C5sQ6T4OwT7M8FA57leoMDRvxceSYG3fxtNTz.B3AYXfSIoxiy', 'htWRZJpeNpumRli5o2v2faeGfGY23dnBYIjYOSBt80qysjxl6HEEPjDsqDSH', 'active', 'developer', 'Kz05Kp9y4ysHxNRuTCc2jH3RFnTvrt', '12321.123123.123', '2020-05-14 02:55:23', '2020-07-21 06:20:01'),
(3, 'Boss Boss', 0, 0, 0, 0, 30000, 'triplex1230@gmail.com', '2020-06-23 17:00:00', '$2y$10$.7FmNIu1p0p9iZ60dcQ4QeHXTKPPDO1VfJFvIlMuif.dpgwcI6fBO', NULL, 'active', 'member', 'azL156O77v4zbbDKdSqF34fAP9ekeN', NULL, '2020-06-03 02:55:04', '2020-06-16 08:50:46'),
(6, 'Rizky ns', 0, 0, 0, 0, 0, 'rizkyns1938@gmail.com', NULL, '$2y$10$h1uHhwDlWq.i1.865Gj80OFlwUuRaCVWoJvG0BbVXnz0u9wx9dRr6', NULL, 'active', 'member', 'czKZA48Gmm7jYh0jsgdg47v5QhMGf6', NULL, '2020-06-14 02:08:51', '2020-06-14 02:08:51'),
(7, 'mar', 0, 0, 0, 0, 0, 'mardiansyah.pw13@ymail.com', NULL, '$2y$10$sFrHPnA9acvs.J2O9s4bnupk7o5rPX2K6Vc5VYcGHecZzg4O7TL/G', NULL, 'active', 'member', 'XOpXHsr1hAmSLEN9X8A1Sum2SIdHyg', NULL, '2020-06-14 02:13:55', '2020-06-14 02:13:55'),
(8, 'mardi', 0, 0, 0, 0, 0, 'mardiansyah.pw13@gmail.com', NULL, '$2y$10$B12pLuh.e9Dcx9u2bZub2eMmgByZBrCnsa2CgiohxlLPf7qTls2dm', NULL, 'active', 'member', 'I77dfJdpdPrB9HaY35w3ovWDvOiuQW', NULL, '2020-06-14 02:15:15', '2020-06-14 02:15:15'),
(10, 'Kevin Saputra', 0, 0, 0, 0, 0, 'executi102@gmail.com', '2020-06-14 06:00:11', '$2y$10$fSPEMduDlhR8f.I81BsStePVV9KYL7uVBkf81Jn1CYO7lhm1GrMI2', '9pYGh8HbGgUxsswdWkaN6Uv1yDmdPuZLKGHffA5uGh6NZwIXEwacLu2rfYhM', 'active', 'member', '8NX0vXsE5wLK90FVS5f8PBRYT5Rb5z', NULL, '2020-06-14 02:55:23', '2020-06-14 06:00:11'),
(11, 'Septyan Pratama Putra', 8, 45600, 3600, 0, 53800, 'septyanpratama600@gmail.com', '2020-07-21 00:45:35', '$2y$10$0Iq3v8vFYEmNjjxO5X5Y4.xBs7.DZ7nvjAFgduXYWYjlSrhz33mXC', '1d8x2K7XhQpY7R9P0tkSOws0BcyKKgHvx1P1eZA4YvQryJhvv5WLhImPuqQd', 'active', 'member', 'OiEptasaKH4L9eWowP1okjqJpFpbKf', NULL, '2020-06-14 03:28:01', '2020-07-21 17:38:07'),
(12, 'Pwryd', 0, 0, 0, 0, 0, 'farhan.mghfr@gmail.com', NULL, '$2y$10$dtsP9PjotAM9K4dlK286iuGnurvcJykXQXc79yDmdgDzGPw3OPqui', NULL, 'active', 'member', '4eVsjD6rLCfwGOhP4EVhwkXvlh9Mjo', NULL, '2020-06-14 04:48:09', '2020-06-14 04:48:09'),
(19, 'demo 123', 0, 0, 0, 0, 0, 'luckypedia10@gmail.com', NULL, '$2y$10$ci3c4eyfQKaMe.6qEiVxsuHXBkPr70W1D1YCckWx1Uftvh.YyqChe', NULL, 'active', 'member', 'Fn1vGOhSRu8yNAf9FXC95AJW8dshH5', NULL, '2020-06-14 05:52:27', '2020-06-14 05:52:27'),
(20, 'Lucky Pay', 0, 0, 0, 0, 0, 'pekanbarupanel030@gmail.com', '2020-06-14 05:57:17', '$2y$10$eVmwtYwjKvue58iPAGw0..6eXV6P3F0IWWwPwb6M/mSAAeyb2zB8m', 'rHqN4VNAk40BFWapgBIB4pnTPA8RQydNu7qdbvQEILbro4wE0UYVdnIhtQWX', 'active', 'member', 'j9c3ZtncavDopWJe0mlRLvkSeUNLCj', NULL, '2020-06-14 05:55:32', '2020-06-14 05:57:17'),
(21, 'Abdul hadi', 0, 0, 0, 0, 1126, 'hadiyoung112@gmail.com', '2020-06-14 06:00:04', '$2y$10$7iagI9983jT6Uypr10GCTuuCyBT5/SQOvk1HLhBXc4UZMrkqW4Tsq', NULL, 'active', 'member', 'twJGFx7dVnwX9GYauXlR0JiYeH9GhM', NULL, '2020-06-14 05:59:13', '2020-06-28 01:15:34'),
(22, 'UllungBrianSyahPutra', 0, 0, 0, 0, 80, 'ulungbrian@gmail.com', '2020-06-14 06:00:30', '$2y$10$4X/7dUIBbisvEL7akhU1oOjQLGcNToaWM.G7fi16k/uON3uZdbxya', 'Yb3DL3Fa33h0fczuNs29uBHBeuS0Yrrz047YLEJLBASSz78yJVCAUupAC54p', 'active', 'member', 'UT88f29SS7Cmry1yTTq46r3hzh2QaL', NULL, '2020-06-14 05:59:50', '2020-06-22 01:29:58'),
(23, 'Paundra YD', 0, 0, 0, 0, 0, 'paundra461@gmail.com', '2020-06-14 06:02:13', '$2y$10$WHiwUzXCeDjHtI6m/7JZ8eSHNN53LSPcD3LpTJeDuDNGdkEdMWYSm', 'OQ91hQ9UvonevhtMxNyEGEL9iDinY837xUJW46avfQLPymv47hYHhcvRipd1', 'active', 'member', '4iXYsCPH8fkcu4Uhv5ZvgeKOBYBm83', NULL, '2020-06-14 06:00:01', '2020-06-14 06:02:13'),
(24, 'Insurgent-Pedia', 1, 0, 0, 0, 2550, 'alifstore95@gmail.com', '2020-06-14 06:02:17', '$2y$10$3f/Cc4s2sZYMlInuFnfeW.6fbXm8Fx7vQXhNABpMJi1lqHmoWX0Xe', '7rqk1GZdaxbJSyrdLVtT6JElMcaGAtVUmN2ZGSyZKjygOSkdqu6DLbXpvPmx', 'active', 'member', 'BZc0bx7UtXMhg5yHoEDItGFq3pbUR9', NULL, '2020-06-14 06:01:36', '2020-06-22 01:56:18'),
(25, 'Fadhil_Stonks', 5, 16430, 0, 0, 103671, 'hes01pedia@gmail.com', '2020-06-14 06:04:25', '$2y$10$M3KChIYQ.Q5oURW73DVyzez5itYnBzrBjMpHcRAHM9ebBKTnW8Zsq', 'JIalMLAkrDCBtFx8o9cCOhoFSQp8fo6xq2YHDwAhsxRiMJYVnICjWWV8GchF', 'active', 'member', 'Kf7K8ilFPBPZ624yi8lEgzIEf2MVLl', NULL, '2020-06-14 06:03:46', '2020-07-21 15:01:01'),
(26, 'mardiansyah', 0, 0, 0, 0, 60000, 'mardiansyah.pw14@gmail.com', '2020-06-14 06:11:05', '$2y$10$/l94pLaRJHEouvcjH9Z2eu9Tu3ANrULl5ihq52Ory5YExb7pgE90K', 'em2bsZ8qS6mW9lvl5TpmYVueND6qX8ShkV1Pt5LVSQjRiYyR0T3lBJ3z6g6U', 'active', 'member', 'lhNFfAFAmIupItHZSBEQZe1Jjj6GDf', NULL, '2020-06-14 06:08:29', '2020-07-19 01:51:57'),
(27, 'anangganteng', 0, 0, 0, 0, 0, 'anangshop72@gmail.com', '2020-06-14 06:11:29', '$2y$10$Vp.O3bCOBaJmKzk22Tbfu.2Wl83KhUuFOvrShygMNkHWrHE3fKl0W', 'EmaLFxum2tIcHNrFAuCf5vTQKFO6OTyzSYpvkKBd2VqGIKpEvh47ndIGzHDt', 'active', 'member', 'l3tfIWDuggSjD1EclHIBcQ4I6p2KRO', NULL, '2020-06-14 06:10:58', '2020-06-14 06:11:29'),
(28, 'Firmansyah0409', 13, 1200, 255, 0, 11940, 'firmansyah04092003@gmail.com', '2020-06-14 06:31:07', '$2y$10$MGPD1W8EHXKYRkji.KHpNu1fYRdDoWlpyy3hAPcVUEwQ/WsHO9wEy', 'J29nBsSutSP0wikk73su6IVOoqSRP1OSxftFEASZyO8FhEwxy1C4ilT7ZBIW', 'active', 'member', 'WiRA2xkhxC82zifyIOwJNocBQfvGoI', NULL, '2020-06-14 06:26:44', '2020-07-21 05:30:59'),
(29, 'Anwar rawsh', 0, 0, 0, 0, 6, 'nailanwar919@gmail.com', '2020-06-14 06:51:29', '$2y$10$uvrBuAH2BhMTczHRLzpg6uC/SmI6aT7nUsGgfWUSBiOY9ao5oI5zq', 'yeMPFNxDldwcjwayYWanYV34QtH44Gm1Pjd6ubG6M3P8gmRESCncyJyizJ3p', 'active', 'member', 'qa5NHCGfIYLAcxFhPldyaeiqZYy2Fy', NULL, '2020-06-14 06:47:18', '2020-06-25 07:13:44'),
(30, 'Gifan Apriadi', 0, 0, 0, 0, 9217, 'gifanapriadi@gmail.com', '2020-06-14 07:01:08', '$2y$10$lFm1HOSltxeeDnOj4ivg7ugFjODvRxXZIoJGT39n2rkzZQIuDMcie', NULL, 'active', 'member', '8BGiBcxDIIgav0kXNNhWsRs0TUWYnI', NULL, '2020-06-14 06:59:48', '2020-07-13 04:56:46'),
(31, 'Riki Permana', 35, 0, 23080, 0, 33132, 'rikichannel7@gmail.com', '2020-06-14 07:13:44', '$2y$10$CeXsz.e7aiLE0Q3Ph8KOaO.OiNQBNOp7IQyYzeDY6PPmChoBjKq9e', 'OdL2RQMW4eAdILPJ54qPk7yLZWZEcYjylLZzFDE9r5cPI44WEjKhE1C9lhPB', 'active', 'member', 'am7PKfH7qt4pzwtsxwNJrtmdssOvns', NULL, '2020-06-14 07:13:06', '2020-07-21 13:50:11'),
(32, 'Septyan Pratama Putra', 0, 0, 0, 0, 0, 'septyanganz@gmail.com', NULL, '$2y$10$Ks/jUtO5Usbz.f0/wxtBJOTa8rqwjqjDN3M3BFwywsRwQ4eQEyZvW', NULL, 'active', 'member', '2R0jUa0Z9EPcKMvZqeR8Xw3ANuWrtH', NULL, '2020-06-14 07:31:14', '2020-06-14 07:31:14'),
(34, 'Maulana', 0, 0, 0, 0, 0, 'maulana.radith32@gmail.com', NULL, '$2y$10$vyxYRhE3PrgqyC0FeTsA5e1pVKa4f/wkZxMmNZJHCbq3lvtnWq/ou', NULL, 'active', 'member', 'ZHHVZc8uUDZYCeGbH3YEaJeBE49Ek7', NULL, '2020-06-14 09:07:53', '2020-06-14 09:07:53'),
(35, 'Maulana PW', 0, 0, 0, 0, 0, 'maulana.harja12@gmail.com', '2020-06-14 09:08:52', '$2y$10$JnXZqLJJWW/EIb8JvsdHgeJOsor/yVyQsAx5JL7vLbVtKjAXqF4PC', NULL, 'active', 'member', 'mwc6FjUMpCxMmkItRLgFIwFoqWbRpX', NULL, '2020-06-14 09:08:36', '2020-06-14 09:08:52'),
(37, 'Lukman Abdul Mukti', 0, 0, 0, 0, 0, 'lukmankun10@gmail.com', '2020-06-14 10:50:22', '$2y$10$MlvDJHe6yhbZIs/vW9O45eRSIYyRzQ1OB98cita8damh8.bp6xezG', NULL, 'active', 'member', 'Wn7F97LHRAkibDHIhlDZIYHeH4GyOA', NULL, '2020-06-14 10:49:08', '2020-06-14 10:50:22'),
(38, 'Trusted', 2, 0, 0, 0, 884, 'rianariansyah337@gmail.com', '2020-06-14 11:46:33', '$2y$10$LeMtDyrlukMPKf0GA3cAtO5xhPnxMdlsVYg5SIGefbK2.PB/pnXRK', 'eyp0YAt0KCWbs11LPrXbYqrZFlJzv5V0yzvzb9oNokWLTOPwyG7PP78cENEU', 'active', 'member', 'srgZ0bDaeBBWpoFoYk7TWOmN9urrZD', NULL, '2020-06-14 11:45:54', '2020-07-03 15:57:12'),
(39, 'Dirhank', 0, 0, 0, 0, 0, 'dirhank@gmail.com', '2020-06-14 12:12:19', '$2y$10$PES1t/ohDrn1stmVub4Bs.XkZm8yXo10Z.J2povQ75Fpa.ExeSNgS', NULL, 'active', 'member', '6RTnoWObpfrvEi4n8dS4E8JL3gmjfN', NULL, '2020-06-14 12:11:58', '2020-06-14 12:12:19'),
(40, 'Septyan Pratama Putra', 0, 0, 0, 0, 0, 'ganzseptyan@gmail.com', '2020-06-14 16:22:17', '$2y$10$eSExxyl03Xa16dUhedp4OuLH9uydXkHDlvBkqyvWCJ5t16rnLcL0i', 'PxNFhZrsCnGTgcBAaz7MbfROFC9cJfgA8F0prwbv74XJbqVmSt2KDuZ7WFqx', 'active', 'member', 'ROXLgyKq9PGjbWShRNGRsfVPaQLocV', NULL, '2020-06-14 16:21:59', '2020-06-14 16:22:17'),
(41, 'Akasaka', 1, 0, 1000, 0, 5000, 'prohomint17@gmail.com', '2020-06-14 16:59:25', '$2y$10$Bwf1rDcjLdMek3L93feIeOTChfrVtJbdSF0XNSqMxBBU.DWwtoEnu', 'DXuRomS2ySpXmhA7krJTiOZuKoJUtEtEIt839h0IddI105Dx364XO2KLpizG', 'active', 'member', 'VOfURNFLlC8w9CPc73z69kTdsvMj4M', NULL, '2020-06-14 16:58:44', '2020-07-20 08:23:41'),
(42, 'Dandyy', 0, 0, 0, 0, 0, 'dandteng@gmail.com', '2020-06-14 17:10:12', '$2y$10$Fcr3kY2QUYz29UmftLttuOEMfhSowbbYmiVRqQMl.B5TBxsGbE1OW', NULL, 'active', 'member', 'RShrUXrop6g5hSbNKWfR5WNy0ziXFt', NULL, '2020-06-14 17:09:14', '2020-06-14 17:18:01'),
(43, 'faroisnm31', 0, 0, 0, 0, 0, 'faroisnur@gmail.com', '2020-06-14 18:17:05', '$2y$10$QM9y4AGl4VnAExQnLAm5COXDXPanU9/67A9hlAFMX5vlu.BkFSCke', NULL, 'active', 'member', 'C8nDFXm05PoYoJiGKrLnI3sO2nwZ5W', NULL, '2020-06-14 18:16:22', '2020-06-14 18:17:05'),
(44, 'Andi surandi', 0, 0, 0, 0, 0, 'surandi2908@gmail.com', '2020-06-14 18:41:16', '$2y$10$qr.6hE.k.C1H.EI3C3fGd.inv2yu5cERAVM.cWsRnIHef/Ag.T.Se', NULL, 'active', 'member', 'BMdWlGUgmVjXwVZWP3xZJxvAApkCX2', NULL, '2020-06-14 18:40:36', '2020-06-15 17:53:56'),
(45, 'Morristio', 71, 0, 8380, 0, 4554, 'morristioarrival@gmail.com', '2020-06-14 20:41:31', '$2y$10$B9SfRlJMcVzUtHR6m2VSU.gbCm8tAp/VOuXuiw1XeTI3sUJtkBAGe', 'uQeYiGlBcpBLvKjVNZysTrACFDG8a6TBXZOcd5dO0qy3HcadB1BV3NVF548w', 'active', 'member', 'iAQ2KvWjjn5j26WjCAfkqgzXG80PWX', NULL, '2020-06-14 20:41:00', '2020-07-20 19:56:10'),
(46, 'favia', 0, 0, 0, 0, 0, 'favia.id@gmail.com', '2020-06-14 21:04:20', '$2y$10$7F.XRFelHcc3nBKEr7CtNOw1Hx0qWUombRBkl2ELpx0PvtXTMqllS', NULL, 'active', 'member', 'C3dWeMu5dCcuuZlem9cB8QvQtlDEFU', NULL, '2020-06-14 21:02:47', '2020-06-14 21:04:20'),
(47, 'Lutfizadeh', 0, 0, 0, 0, 0, 'lutfizadeh5@gmail.com', '2020-06-14 21:32:14', '$2y$10$pfNvHJTAIYRcJP5BpU9YH.pc2RTABxmQ0qBxuBkZgjXJx1WwtIuJ.', 'C2oDMuX6ZOFIPvqDAx8xaybPkzpectp62hrAknJmHcxsdBB7ASaXWT6sOSA8', 'active', 'member', '6YACp5YhZfEgan2YZT772FrQZTkjR6', NULL, '2020-06-14 21:30:51', '2020-06-14 21:32:14'),
(49, 'Ray', 0, 0, 0, 0, 0, 'enengraysa07@gmail.com', '2020-06-14 21:56:44', '$2y$10$Fu.NFii4lwnDj41QTaAWWuYJqkb0VCsDmNDbYFYKS79xAHie/P.km', NULL, 'active', 'member', 'ia9DUzTaloe18QzkHGqfyngq66ZFn0', NULL, '2020-06-14 21:56:05', '2020-06-14 21:56:44'),
(50, 'Faisal', 0, 0, 0, 0, 0, 'mfaisalabdillah01@gmail.com', '2020-06-15 00:31:42', '$2y$10$.w/.InhhnRC6Dp0OMN0Ofe1K0gtO1VFG9PGYkzOzUoRwz.OaEGM8.', NULL, 'active', 'member', 'riRLoydEaDbLoTrEcrXM8gxJNUJWVv', NULL, '2020-06-15 00:27:13', '2020-06-15 00:31:42'),
(51, 'heru dharmawan', 0, 0, 0, 0, 0, 'herudharmawan80@gmail.com', '2020-06-15 00:57:11', '$2y$10$nrBQKaB2Xhvpg94D8.Ai1ORk8qxHNgyg2Ogd2KJcTlbz7DvqFG7LO', '1QPonjDWjvhlXcTRottnKvNxpcBAtjav4GYfTNx4Le8kbchXY3nUsuevDa8w', 'active', 'member', 'ewAiiTeOjrzSYc8mgKlRciuq9Qm3PE', NULL, '2020-06-15 00:56:03', '2020-06-21 05:27:08'),
(52, 'Syaputra hidayat', 0, 0, 0, 0, 0, 'officialtafisme@gmail.com', '2020-06-15 03:21:11', '$2y$10$8hc7xBKzJIXH2pTMrX8ZA./1kr8pLic/vKQ7LNxRe5yBGfuKyEpLK', 'ofnHUfcdv6gEsIBstTTQZ8N0FUSM3bFuBD9vqGtCZ0cles5PIo4qXiLpwiwI', 'active', 'member', 'FVp8pug20S7deu2bsTB2Qe0EQ0qoKB', NULL, '2020-06-15 03:20:01', '2020-06-15 03:21:11'),
(53, 'Imam Muhannad', 0, 0, 0, 0, 0, 'imammuhannad.gg@gmail.com', '2020-06-15 03:21:30', '$2y$10$Xa7q9F9ZKI10MHWYtILzau94G2RZspQDLS.xjqBm3y7OTUgtqa2Pu', 'wWN0bhDKWfUfSivVnyErQVZHA9AsDjcL1vPOm2np9oVNAodgnUFXNKXTSwlv', 'active', 'member', 'yPeNYUfTt1gp06ANnTKrMW4K2xd6zh', NULL, '2020-06-15 03:20:26', '2020-06-15 03:21:30'),
(54, 'Farhan', 0, 0, 0, 0, 1394, 'muhamfarhan65@gmail.com', '2020-06-15 05:06:30', '$2y$10$.ZteH.qKo0erJejJIaB9K.9a5qCfBkhGqFoyF4EJ0BTuD50Q6WtPW', NULL, 'active', 'member', 'uPvH1XPkpmteZ6wVak7cRWMgE5Np8i', NULL, '2020-06-15 05:05:20', '2020-06-24 05:11:21'),
(55, 'Feryxz Dev', 0, 0, 0, 0, 0, 'aipfery@gmail.com', '2020-06-15 11:40:55', '$2y$10$ia6kvwj4/Fz3kjkXwzsPL.Ik2no1/Fs7jHb4zrF5I.RLd7T3f/4pa', NULL, 'active', 'member', 'j2msGCKwr90U5yNok2sjSe0rwRR8CI', NULL, '2020-06-15 11:40:23', '2020-06-15 11:40:55'),
(56, 'Hildan Antony', 0, 0, 0, 0, 0, 'bydzreal@gmail.com', '2020-06-16 02:21:09', '$2y$10$h7n10abF9zcuaZCjuzPNfObsb0etYUYau/u3uDb0TF.DfajjZuYdq', NULL, 'active', 'member', 'rrmRqdNfovjZGtpe9IqKP9qs7NWrde', NULL, '2020-06-16 02:20:37', '2020-07-17 05:58:49'),
(57, 'jopin', 0, 0, 0, 0, 0, 'akunjopin@gmail.com', '2020-06-16 03:45:10', '$2y$10$9b.49hZD2m366xXvIJ8QpOUrOO1A4G9HyDtuyg2A9RrKVQud8TCK.', 'he24jaNUAKFbsA10O8GuooIxOI8aOjqWMfN5znBaQYTEwL3uvqCoMMjoKPif', 'active', 'member', '0aCRLhtG8OOguIAeHo7IpaZPbJbdmV', NULL, '2020-06-16 03:44:41', '2020-06-16 03:45:10'),
(58, 'Mooriz-Channel-22', 0, 0, 0, 0, 1000, 'botekiki22@gmail.com', '2020-06-18 03:57:18', '$2y$10$YRahH.82hGMJNG15tPy7JOvY3IT0jmV..13O2rIN0x5Wj70nTjEzK', 'qJupSmh9QLY7d9JyTOi4PK7MB9eM7CJhBIs5WEEkMPcnKNcWscm92WXYfui1', 'active', 'member', 'pi0h7zrGIaI6C5928ZTChvs047Kazn', NULL, '2020-06-16 07:57:04', '2020-06-21 05:43:01'),
(59, 'Biyyu', 0, 0, 0, 0, 0, 'mabiyyufikri2@gmail.com', '2020-06-16 11:48:54', '$2y$10$vgf3RtVoA3wU.DmjUHOq6eazcPQhOdHDswdb0X8HHcEbFja4W.hrW', '443BZX6E9Q2WCHhbG46tAB8g5U297p2Iv5ZDZN2UotKElGjlfRIOraIFPJJk', 'active', 'member', '7xfoGKPAGazQzAq5M67yhvz5q7OnPZ', NULL, '2020-06-16 11:47:52', '2020-06-16 11:48:54'),
(60, 'agusrk', 0, 0, 0, 0, 0, 'ijalakunbaru@gmail.com', '2020-06-16 15:17:40', '$2y$10$3kCThFfv6PY5vNAI/3VTjeFGlXaNQh/Ug4e4hpH9wrMGBFoHatEhi', NULL, 'active', 'member', '1w0Rmoos57BMpMlISezTAFkK5kZjsl', NULL, '2020-06-16 15:15:59', '2020-06-16 15:17:40'),
(61, 'Mushan', 0, 0, 0, 0, 3000, 'hansmushan@gmail.com', '2020-06-16 18:31:54', '$2y$10$fMVfvDIv5SCrQEdVca6ph.uBlbM6xr70HheamSvyTSUk9butJvZQi', '4kzxt653h84QVDIhzCxYk5vqel4SRD1kZVT70Jp2SkIBl3KrLXmLlfZXhjnT', 'active', 'member', 'mP96jkLbcEFAz1eLrRiZs7NLKNDP7c', NULL, '2020-06-16 18:31:25', '2020-06-16 18:31:54'),
(62, 'Sandi', 5, 0, 16500, 0, 29500, 'rvn.dropdead@gmail.com', '2020-06-16 19:11:53', '$2y$10$VgRwspcd4Hv1xRQ1kJkiBO6wQWuklmMN0NH1OsNKK121UeSN0B51q', 'nFeACholRpZABbQPMGbWe86dqRtULmSYoOhbMlwH7OGabz6UeDoieJQcDtCO', 'active', 'member', 't7NkJv5LdDJMFMATuBNz5pr71T8qYd', NULL, '2020-06-16 19:11:28', '2020-07-15 07:45:02'),
(63, 'hopkinznathan', 1, 0, 0, 0, 75, 'mozanke@gmail.com', '2020-06-16 19:31:12', '$2y$10$n03TqjcXewR0JMOfu3SXzuETpdWnxeRELNHWhJmXgrxS0Yrv5ejlW', 'ZdFVxhOJpxO0uaLA9gZvmxrENVXmjVBUgKJ0SE9updzwBrz3vZZrrNz8fmHX', 'active', 'member', '4DRVQtipbqSM8aM3ckHLAjrLJ4vbga', NULL, '2020-06-16 19:29:55', '2020-07-13 00:56:13'),
(64, 'PalaKaoPecah', 0, 0, 0, 0, 1250, 'yosiaaser5@gmail.com', '2020-06-16 20:28:55', '$2y$10$8NIG64gV02KCBjOnv4qYeuuZ8mY6wd8Dx2oHUepLJYW9UKjr8TANa', 'ehfXCpggfNNgGftpEDfq2jtnd0sZqUkAsYoeOKxy09SCykeF6CyCLsc680MG', 'active', 'member', 'blft13vWE550RuW1krGFOW7Pb5ybxk', NULL, '2020-06-16 20:26:48', '2020-06-30 09:40:18'),
(65, 'selir44852', 0, 0, 0, 0, 0, 'selir44852@rm2rf.com', '2020-06-16 20:56:53', '$2y$10$SF.sf7r1wHh.Z4DKf5Nti.SQwb/ebsrvSiZmeuCsz4A0iHmeFEfcy', '5hyXYBqRio7wJuamKlrguWkFbvn5HBpIbY7CHRs8uQFr4f7GwSV3rO9fxbmZ', 'active', 'member', 'DFiJy2O1LmzxraNe24QWHLXqsTGKkV', NULL, '2020-06-16 20:55:50', '2020-06-16 20:56:53'),
(66, 'Rizky', 0, 0, 0, 0, 0, 'rizkyswp@gmail.com', '2020-06-16 21:03:25', '$2y$10$8sbRH.y4G7zWXL/hcri8L.vGOO.BC1CYWoX6w3.IDr71PB7fSy5Ty', 'DB1ZXoLiY6GQACVQnOgHO2kfZrciaD6MplNkCFFscLNfwYRO3Hk96OVVy3DI', 'active', 'member', 'vhasZKZKJZR7jdfyinoDaBpF3bvTgu', NULL, '2020-06-16 21:02:59', '2020-06-16 21:03:25'),
(67, 'Am cell', 0, 0, 0, 0, 0, 'mainulyaqin52@gmail.com', '2020-06-16 22:27:08', '$2y$10$SYjyMvSfZMNysdxd8eNj1.xKXeELq41F8pSxV9JRkRw2Gz1gOSbdK', 'up5U2mb8gqOzIfaens3d0sxeTi7WqhPOrmpKmrNDM34HIH3QXEVsNK0NS0v0', 'active', 'member', 'EnnTrT7juBM4q2pNkeDd21RmRb7MGy', NULL, '2020-06-16 22:26:39', '2020-06-16 22:27:08'),
(68, 'saya2', 0, 0, 0, 0, 0, 'riyanpanggabean69@gmail.com', '2020-06-16 23:10:50', '$2y$10$jX0/9Nu2.8DCdEiOX8whs.SmJ7.5jqfhYXqYkZyIMRbvlB4sQUdWy', 'PMpO76jtt5dhMpSIBUQu58kjAuflqrjpiw3ELz4BQVd28LuZLJd4Xrx8rQcV', 'active', 'member', 'y4TbIPH1uVmMQEAJaxZNepfjYxASvy', NULL, '2020-06-16 23:09:47', '2020-06-21 03:19:02'),
(69, 'Jacqueline M Dawson', 0, 0, 0, 0, 0, 'Jacqueline@gmail.com', NULL, '$2y$10$Q2bpMlckuYNpSn9.GexDIeQgF1KbR5PwFKtDgdXgFUKU8ztgMbCSa', NULL, 'active', 'member', 'uz6u3nHbcRJHOFWIVymQHq3dapCaB9', NULL, '2020-06-17 02:24:43', '2020-06-17 02:24:43'),
(70, 'Jacqueline Bode', 0, 0, 0, 0, 0, 'ujangmandali99@gmail.com', '2020-06-17 02:30:19', '$2y$10$q/JxSrig2JC8AeWUQ.9PxeyLwmwCPN1HU3k9lgb8S8HDyN9SisOBS', NULL, 'active', 'member', '93hi3E5L58dcnt2KE0OfBHaJHlDKez', NULL, '2020-06-17 02:29:58', '2020-06-17 02:35:02'),
(71, 'rosyidkurniawan', 0, 0, 0, 0, 0, 'rosyidkurniawan781@gmail.com', NULL, '$2y$10$Z10zGEJ.nZ8VfcdkchvkvefCbyoiwzu7F3QSsTC/SmFbTWfFjVI0W', NULL, 'active', 'member', '4YqbQmG8Bgc4F0N64Skd7EFAbGxSVl', NULL, '2020-06-17 03:48:23', '2020-06-17 03:48:23'),
(72, 'Nurakhim', 0, 0, 0, 0, 0, 'nurakhimjokim03@gmail.com', '2020-06-17 03:59:17', '$2y$10$E3cKQb38D3GtlVjDJkrwouJxeTtqCkrSuBdH/FVzRX4U8b9vO1kRC', NULL, 'active', 'member', 'E9WLv83kndMuEIoxnuWEo6pfang1jO', NULL, '2020-06-17 03:58:52', '2020-06-17 03:59:17'),
(73, 'Misael', 0, 0, 0, 0, 0, 'baguskan129@gmail.com', '2020-06-17 06:54:31', '$2y$10$E8kr34.5GRfnPlUPR/T93./k2Lf70ke5Gz9//8b0ujAyEL8vNxhou', NULL, 'active', 'member', 'Oa4wNoRJ3rvJyQPJ1Im1hD5Q0phOl7', NULL, '2020-06-17 06:54:02', '2020-06-17 06:54:31'),
(74, 'putuanugrah', 0, 0, 0, 0, 0, 'putu.anugrah23@gmail.com', '2020-06-17 07:46:04', '$2y$10$E6Dam91HZMMP2IwWiW/gvuWDtx6QLnpXOHzOVUE/yyQk.556FjXXy', NULL, 'active', 'member', 'Oixp98tNKHHPtFfVozXK3EyZoAmQVZ', NULL, '2020-06-17 07:45:35', '2020-06-17 07:46:04'),
(75, 'Defri', 11, 0, 5200, 0, 9400, 'dfrisetiawan@gmail.com', '2020-06-17 08:53:52', '$2y$10$aE0x95XPO73px15.ITkX1eRc236NL4o1reashH/tZO3j1.dihpzWu', NULL, 'active', 'member', '9mttWmcvRYl9L6IXtt5BF7ry5L5f8g', NULL, '2020-06-17 08:53:15', '2020-07-21 17:50:26'),
(76, 'dwip19963', 0, 0, 0, 0, 0, 'dani@gmail.com', NULL, '$2y$10$1j9znTycdRXrCtDiEngPcO/kYP9usqHHA8fz7/FQhG9hyHSPfWi/u', NULL, 'active', 'api', 'nX49YxWKNbVW7MP1n8CHLsu8A0Gcup', NULL, '2020-06-17 16:44:23', '2020-07-20 05:14:02'),
(77, 'dwip1996', 5, 0, 6, 0, 4739, 'dwip19963@gmail.com', '2020-06-17 16:47:46', '$2y$10$POrw7ftzkc47N6YXamVihuG08OcADCHZfT3s64ofdVyetqv9JDo5q', 'Nntu7nbKMdb3d2NDSdgz1JYlsc61MlvDm9EXiOG9Ot7alPcenziFvgigfrM7', 'active', 'api', 'igIhnhatjgvrGA1CSD5CXGkV50kXPJ', '172.104.32.244', '2020-06-17 16:45:58', '2020-07-20 17:45:23'),
(78, 'Akunepep201', 0, 0, 0, 0, 0, 'akunepep201@gmail.com', '2020-06-17 23:50:43', '$2y$10$WCwc8rssSQS6ADcA2PAy.Olqv/fomaR13wwOjRO8b3K1vRBVbR1sK', NULL, 'active', 'member', 'MFrM8OWSW5ZEXAuddsprX1yldSUyz9', NULL, '2020-06-17 23:50:07', '2020-06-17 23:50:43'),
(79, 'jaaya', 8, 0, 17613, 0, 60, 'rizkysulivant@gmail.com', '2020-06-18 02:07:47', '$2y$10$CyKGAkKFceu57iFkx96uFOXEED7Be1okukmCtu6/exb/dYZoq4mn.', 'QKrS2k8dcgNMzdID1pTtyS93AFaeO9Lm6bbpE0euuwDXR3J7EenA4eu1F77V', 'active', 'member', 'Gn83Sxp4lzRTSI22YbzqEWVz6IaoPG', NULL, '2020-06-18 02:05:59', '2020-07-16 17:22:04'),
(80, 'Deby Maulana H', 0, 0, 0, 0, 0, 'akunemeldeby@gmail.com', '2020-06-18 02:23:19', '$2y$10$NVWrH2eEK4VcS0IoSohlCO3KyCUpGVsDfBQBXxt3jWbLmOETzzsWu', NULL, 'active', 'member', 'TGf6LPquN3sb2QR84Ja8Gj7vaV83TS', NULL, '2020-06-18 02:22:48', '2020-06-18 02:23:19'),
(81, 'Ihdina', 0, 0, 0, 0, 0, 'NasutionOfficial29@gmail.com', '2020-06-18 04:17:57', '$2y$10$545HPd7naGT1lJLkQGQZEuyCQJeeZDmkoiFqeWREZoN4U1xaxQnqG', NULL, 'active', 'member', 'gMSytHxbwCTkWLsmxUtZQ242rfxcP8', NULL, '2020-06-18 04:17:30', '2020-06-18 04:17:57'),
(82, 'Aditya Raka Pratama', 31, 0, 5930, 0, 7401, 'adityarakap99@gmail.com', '2020-06-18 05:03:41', '$2y$10$S64RKETj1JGZ54JYybnzeOi4C/aXPBh/wo7d54Yzn0PAdJwXjj7.u', NULL, 'active', 'member', 'aJWoNntWjScYMpZnnhCdO23GullQ08', NULL, '2020-06-18 05:02:36', '2020-07-20 21:14:05'),
(83, 'Kiikyy', 0, 0, 0, 0, 14191, 'kiikyy02@gmail.com', '2020-06-18 23:16:53', '$2y$10$bWOc8ccDkoAiZV8RbRy7peo4ucPp4NvAUb1P5feXmjv8B7VuPqlwW', 'A636sn8YlS1MhnZoSR8LH2mH2kjQv5j6rXFdDfPKqHHLicoEv0mAOdw6NySO', 'active', 'member', 'F94fBuKy919FpKgWI6aUGe4qVgLlf4', NULL, '2020-06-18 23:15:59', '2020-07-08 17:30:15'),
(84, 'Muhamad Ferdiansah', 0, 0, 0, 0, 20000, 'ferdiansahxd@gmail.com', '2020-06-19 00:42:48', '$2y$10$.19ObRefiT/x/6UrtwercOpFUXTMM41NnV4NHBBr.29N1/eYIeTZi', NULL, 'active', 'member', 'RdtO9fxzAUKwvkxtf8AnEMDA4c3GlS', NULL, '2020-06-19 00:41:56', '2020-06-19 02:48:52'),
(85, 'Toni', 0, 0, 0, 0, 452, 'toniznn11@gmail.com', '2020-06-19 07:32:36', '$2y$10$.Lmr.a.ndGtqtCA6gh0PrOrfYq6tuC.pZpPsnq2SilU4Z5iHf70cK', 'O4tScL2HwG7wou8Ru6kYpU3twgyIJaU0vJICjto1pB5sLzVJG1Ut54LoL7ND', 'active', 'member', 'tu4owCms4hAgJSIo1UoAGgHL1PBrwf', NULL, '2020-06-19 07:31:38', '2020-07-05 05:36:32'),
(86, 'Sahrul', 0, 0, 0, 0, 0, 's0ceng186@gmail.com', '2020-06-21 16:54:17', '$2y$10$wIxTuB0SvBzrZs/neOCPe.2jn99VkQZ9dtMsi/Z.YUkvNtgzU4KeK', NULL, 'active', 'member', '97Cxxg9PCDUzVAR3UfnWLXKEedmIkQ', NULL, '2020-06-20 19:01:22', '2020-06-21 16:54:17'),
(87, 'viannugraha', 0, 0, 0, 0, 0, 'vianyt77@gmail.com', NULL, '$2y$10$fh9UGxPdU2xCX8yL8mOjZ.vAO8HCEpbgr7Pj1xzS68B6P/EVpJQou', NULL, 'active', 'member', 'ii9R5uMuVfaifV9S3RFrFJBNd8W3rP', NULL, '2020-06-20 19:13:09', '2020-06-20 19:13:09'),
(88, 'viannugraha', 0, 0, 0, 0, 0, 'viannugraha120@gmail.com', '2020-06-20 21:23:59', '$2y$10$HXVViKXkfyukuvn5wffHretz75ksI/WqHW44YGgd4ch5UAS3MShUu', 'SEuwlf0ZIBULpI9xiBeLwg1IR52sEJrP5Q6D1XZvkhK18yCwjgxXfTrlsnv5', 'active', 'member', 'Ob8b2sSj2z13ZakB1Q9OLyEPLTZggp', NULL, '2020-06-20 19:16:37', '2020-06-20 21:23:59'),
(89, 'evolution', 42, 10125, 41085, 0, 679, 'achmadlemon23@gmail.com', '2020-07-02 05:07:41', '$2y$10$bkocyma1Bp2jEaYWh1z8ju/agK2pUmWQ712QYstB2VWD6xhfcAZBi', 'j9iLzVbBV9KQvUpp5t4Llfjho1U9s6cXAyavEBZWOCBuNf0XibGN4ijmrcrG', 'active', 'member', 'TihVRTfQvoAlOMGNzosHiGoaanaarR', NULL, '2020-06-20 21:22:07', '2020-07-20 11:57:07'),
(91, 'Putra86', 0, 0, 0, 0, 0, 'febriae170@gmail.com', '2020-06-20 23:05:24', '$2y$10$hjkmlGoxgXZvx1uGEbP4BOxF3jyXmMVMhzmthouTrOw5pCEQ7LvjG', 'i39bOXDDWOqHmNbW3ozZhJjdfvE7GbjHDdOHQDGXxByAinGndBvbcp5eQhsq', 'active', 'member', 'gvnCgfIMO4UE3yy6qz5yRcuIp3ajFc', NULL, '2020-06-20 23:05:03', '2020-06-20 23:05:24'),
(92, 'yfernando', 0, 0, 0, 0, 401, 'nando.mbalelo1245@gmail.com', '2020-06-21 01:43:31', '$2y$10$PM4JS8FtR.Be7qHg9ShY9OWndHybG3z0PrCS/tGcNWQ8vQPPjAKfS', NULL, 'active', 'member', 'YUolbHhJ39y8F7d4luwbE4VulAOCxL', NULL, '2020-06-21 01:42:56', '2020-06-28 02:07:37'),
(93, 'Zilla', 0, 0, 0, 50508, 18, 'gajahberenang22@gmail.com', '2020-06-21 04:17:19', '$2y$10$E2mlb.1szgG2FqBesCLhiem1oEzOWgFLmyKRCUxbGvQMbntv9ECT.', 'gHV2fx71KvhtcCjabCiujqt7yH77noRDLWDXt7HpX2vOz7dyiYuA4zrwSmfP', 'active', 'member', 'CzX2A3JxQyQm6zAocM0g6fa5iOMCzj', NULL, '2020-06-21 04:16:07', '2020-07-19 12:51:36'),
(94, 'Dirga Putra', 0, 0, 0, 0, 0, 'dirgaputra6122@gmail.com', '2020-06-21 06:26:20', '$2y$10$DtsAlD9INPloYqHFrcr1suxqY.TqVdYa/34cWusguZASUTZxnwJXW', NULL, 'active', 'member', 'GPNca6DoGtZbXlcS7KGS53jbKWca1b', NULL, '2020-06-21 06:25:51', '2020-06-21 06:26:20'),
(95, 'Pramudya Aji', 0, 0, 0, 0, 1687, 'pubgbg103@gmail.com', '2020-06-21 07:31:29', '$2y$10$ccJbuvN0VkCboslxfJD3bulFw.AFfPJK98y9KUAbT9Vas5JanGdnq', NULL, 'active', 'member', 'ReDOHG0bsSo4MRvWbcwLXeN98jV8rE', NULL, '2020-06-21 07:30:09', '2020-07-06 06:28:39'),
(96, 'Skindra', 0, 0, 0, 0, 0, 'sugihsunday@gmail.com', '2020-06-22 00:01:01', '$2y$10$l4y5H5p9Bgcwdd7lMVbDQOgKKG1kgGxb0qFxmS2.Gzz2/PlITk4MG', NULL, 'active', 'member', 'PqhzTA2wc4TniqzHZJX5JsjaFG2OQW', NULL, '2020-06-22 00:00:38', '2020-06-22 00:01:01'),
(97, 'Samsul', 0, 0, 0, 0, 0, 'saefsamsul@gmail.com', '2020-06-22 02:11:31', '$2y$10$azTTzv.Hv6Q1JLq6AjaSV.tE6dXD/EhZAdy7m8.ofQNOW73p0HNXO', NULL, 'active', 'member', 'iHb5VGIIBMCS5O6010Z9P7r9pwQuBE', NULL, '2020-06-22 02:10:47', '2020-06-22 02:11:31'),
(98, 'Dayat', 0, 0, 0, 0, 0, 'teguch.121.us@gmail.com', '2020-06-22 02:54:04', '$2y$10$f4aE3oZ1vcM79BrtVE7lbuI7cNbfptfFEJM3HI4ik7v4e0agpxrOK', NULL, 'active', 'member', 'QiWj6FEFyGNdojxKJH3IxqmCACzWgq', NULL, '2020-06-22 02:52:19', '2020-06-22 02:55:38'),
(99, 'Febrian Pradandika', 0, 0, 0, 0, 0, 'pradandika@gmail.com', '2020-06-22 02:56:44', '$2y$10$LZb2mV.VqewivK1q3wzouemoKx15evNR60WwbLg4qNhqkEttJsXpG', NULL, 'active', 'member', 'yWyKq7VzraRUfdwujs7RTJO75PGilY', NULL, '2020-06-22 02:56:24', '2020-06-22 02:56:44'),
(100, 'Jorgi', 0, 0, 0, 0, 0, 'kenbo122@gmail.com', NULL, '$2y$10$WwrPK2NO2L42d5MnT5nBL.MIGg/DD1CGF7ctOWebMA9I4qMRQCEDS', NULL, 'active', 'member', 'nsjpohn6iEnW06MZaMvSWDhTGmyET1', NULL, '2020-06-22 02:58:01', '2020-06-22 02:58:01'),
(101, 'SafrizalEfendi', 0, 0, 0, 0, 0, 'ijalgaming90@gmail.com', NULL, '$2y$10$FiQCFYK37Vz9LHsAl03RpODRrKnUyiau7MzJ3W7nY3ddcD140OIW6', NULL, 'active', 'member', 'DyWFAdNc4VIQWZ47J0krr0EAhd6WL2', NULL, '2020-06-22 03:01:48', '2020-06-22 03:01:48'),
(102, 'reza pratama', 0, 0, 0, 0, 0, 'rezapersib067@gmail.com', '2020-06-22 03:04:09', '$2y$10$aB573m6uzPzjrTOHvlHtKe.wYCn6TGh67TFUD1LdVbNcILzU628lq', NULL, 'active', 'member', 'PQgWSNgzPprCvD4RDozEFpORfQh1KW', NULL, '2020-06-22 03:03:11', '2020-06-22 03:04:09'),
(103, 'Kontol', 0, 0, 0, 0, 0, 'kontol1@gmail.com', NULL, '$2y$10$sc30VtcHAKYFlQR2qNgFN.ggOSamUpuQ9hBQAB.FgQgRatSkzwkJy', NULL, 'active', 'member', 'AQcCdFhc5Ksf99NkDGjs5h72JaJpz3', NULL, '2020-06-22 03:03:55', '2020-06-22 03:03:55'),
(104, 'Zhy627', 0, 0, 0, 0, 0, 'malesbet9@gmail.com', NULL, '$2y$10$/aNW27UfF3or6lwxI6o6OuUKEWq2CxMq8xT.RuaKy5B/zz80hJXmu', NULL, 'active', 'member', 'ViIS9vOS0mStpqCrs0hCfUsN36RSgn', NULL, '2020-06-22 03:04:01', '2020-06-22 03:04:01'),
(105, 'Risky Aditya', 0, 0, 0, 0, 0, 'riskiadityap8@gmail.com', '2020-06-22 03:09:34', '$2y$10$jdXZ7Fftd.drR7DKXfemD.7N8l8.uR6PoCPPNhHuIvIL9WgvL1FSO', 'MQshxjZODdZJWOipsQhTOhnP0an51fuomGcV3KLqD34KPggzPKIJJZTxyMxB', 'active', 'member', 'k4Ag3RdhrkSPFpqVXyseHbAp3kjOQz', NULL, '2020-06-22 03:06:33', '2020-06-22 03:09:34'),
(106, 'rhiswank012', 0, 0, 0, 0, 0, 'istrikutercinta48@gmail.com', '2020-06-22 03:11:15', '$2y$10$jfUSCVoNuE77OaRANwdqdeYWCAnCL6qqJ2GibScnhV83fev5TfO2q', NULL, 'active', 'member', 'W2A5Sh3VrHf63FGwksT1s23cUU2aRQ', NULL, '2020-06-22 03:10:58', '2020-06-22 03:11:15'),
(107, 'Haha', 0, 0, 0, 0, 0, 'haha@gmail.com', NULL, '$2y$10$OibJv21u1u4X8rgF7m2Xu.F.j2vJv3PGtfEeMsJBC3igL0cJfYyXa', NULL, 'active', 'member', '7RUG3hbvxO0hLYVjoTP2NjprYgS4oV', NULL, '2020-06-22 03:33:39', '2020-06-22 03:33:39'),
(108, 'Gambrush\">', 0, 0, 0, 0, 0, 'gambrush@gmail.com', '2020-06-22 03:41:58', '$2y$10$1nOUSE3qd7bxN4yRGyu77O8539CZ4RSmgdz5y7qVzQ9ZYUCpx3fEC', NULL, 'active', 'member', '2IG9Sv8k1q8rMudHFCdnoa8xLd93jS', NULL, '2020-06-22 03:41:21', '2020-06-22 03:41:58'),
(109, 'nanda imam', 0, 0, 0, 0, 0, 'nandaimam121@gmail.com', '2020-06-22 03:43:14', '$2y$10$AZQj0OMmjGsWrC.MF05A9uZumiSfUdPiykaRdbgUUmXK/ItfqOP2G', NULL, 'active', 'member', 'UjCyN0O7cwVXoCm7NyRCoVEEXntD14', NULL, '2020-06-22 03:41:28', '2020-06-22 03:43:14'),
(110, 'mhabib', 0, 0, 0, 0, 0, 'fiqih476@gmail.com', '2020-06-22 03:47:38', '$2y$10$s/ahRD3KYRnLMCioWGntvuQlvd5.C8uGcoPkexUb82kwPWrEBGxeK', NULL, 'active', 'member', 'gpparfrabUn2LVP6FjZM9U9qEiSIZN', NULL, '2020-06-22 03:46:29', '2020-06-22 03:47:38'),
(111, 'demodemo', 0, 0, 0, 0, 0, 'devob10335@uhtso.com', NULL, '$2y$10$OHVRZCiWtJAJzmcSe9XsGOimP2iGE.xyL12vTS9fqYcALxxZrSqOi', NULL, 'active', 'member', 'IHF3A3sKnKPwGiBufd4IsgFPNebjOe', NULL, '2020-06-22 03:52:53', '2020-06-22 03:52:53'),
(112, 'demowebsite', 0, 0, 0, 0, 0, 'dakef94259@opwebw.com', '2020-06-22 03:54:12', '$2y$10$mnWCxuqLHc0sOHc8O3KN5eShTAVRtMCaYBvpl9QuQRfdhJwxI0oYa', NULL, 'active', 'member', '6glDkhAfB1ggUnSOjoT1zsOxJBmOWw', NULL, '2020-06-22 03:53:54', '2020-06-22 03:54:12'),
(113, 'William Quiin', 0, 0, 0, 0, 0, 'abadidata90@gmail.com', '2020-06-22 04:38:56', '$2y$10$kSyBJOnQFn96NJvUWeyiruxuDCei4o.duNVEMwbiRBZFTzWbW5RwC', NULL, 'active', 'member', 'QEQ67tN7tSHiWHONCZCM20FhK9a4nk', NULL, '2020-06-22 04:37:22', '2020-06-22 04:38:56'),
(114, 'Alban Rahman Alqindi', 0, 0, 0, 0, 0, 'albanraal13@gmail.com', '2020-06-22 05:00:07', '$2y$10$51FHAnZrWjR2y1SQXBueCeNz5w2TZL89.nqkCbHkxVNLRwk.dGnze', NULL, 'active', 'member', 'c0xLdtky9fsPfmGfzkeRoTti4BR1UR', NULL, '2020-06-22 04:59:06', '2020-06-22 05:00:07'),
(115, 'Farhan', 0, 0, 0, 0, 0, 'muhammadfarhann482@gmail.com', '2020-06-22 05:58:59', '$2y$10$NPj6M4FTYz4PWQiUEczSRef0XXc.dVDM8E9OzDMd66iybai506ixi', NULL, 'active', 'member', 'Ca99a5Jy3ddLSUxXSQq64LWX4UuRgy', NULL, '2020-06-22 05:57:24', '2020-06-22 05:58:59'),
(116, 'Asrul zacky', 0, 0, 0, 0, 0, 'asrulzacky20@gmail.com', '2020-06-22 06:12:44', '$2y$10$NYGVTllJVFQuD7eT1y9il.08MadJeZk0jfOl6uIIuN0GNqblx5.Pq', NULL, 'active', 'member', '4Y5C5HIbFPt5vJUiPi2aHrE827g8ao', NULL, '2020-06-22 06:09:21', '2020-06-22 06:12:44'),
(117, 'arkandisini', 0, 0, 0, 0, 0, 'arkanxcode@programer.co.id', NULL, '$2y$10$db1YBLzEVb8yRp7/RmuR5.ufI6aDGx2frhztrIrrW01.sOMElAro2', NULL, 'active', 'member', 'Sf9OZdk1TqiRt1awDpdSxs5q6OdBHH', NULL, '2020-06-22 07:44:18', '2020-06-22 07:44:18'),
(118, 'arkanpro', 0, 0, 0, 0, 0, 'garapterus01@gmail.com', '2020-06-22 07:46:27', '$2y$10$002nSLuskaAesFGw2ns2TOItlw7ycHZY2finvQi.Ehp0ATUm7W7SK', 'flndJYKBzCtC7cBY7BW5RCFgvvtxKtOFBPi9gukd5tUgsMIQAKJ8p6hMNf5V', 'active', 'member', 'ZShtLDs8PBZdGYYEWo5ypjCLZRThEE', NULL, '2020-06-22 07:45:11', '2020-06-22 07:46:27'),
(119, 'Muh.Mizan Zulmi', 0, 0, 0, 0, 0, 'mizanzulmi1515@gmail.com', '2020-06-22 08:15:50', '$2y$10$034zB2sN2srTyj0C0I6b/.HAw4JP.fELh8ecOPYFA3Rt4n8uSqJIe', NULL, 'active', 'member', '7w1W8ml7XkTHAdiQhojkLxHw45C4hi', NULL, '2020-06-22 08:15:11', '2020-06-22 08:15:50'),
(120, 'Kppp', 0, 0, 0, 0, 0, 'yhgkgf@gmail.com', NULL, '$2y$10$HeKaLKeWfQYLtyoA0mbHkeHhZjUC2oxSKXGDymhF.hj6uoeuEXI9C', NULL, 'active', 'member', 'zCSaSO3vcpZYIVPBJNRV2asDNUTiCe', NULL, '2020-06-22 08:15:48', '2020-06-22 08:15:48'),
(121, 'Skyzych', 0, 0, 0, 0, 204, 'skychkzoya@gmail.com', '2020-06-22 08:19:02', '$2y$10$pEy4aFKD.NhfU6G.ZRjLhuQdJvU1lewSyt4rZzSWw7WT4gXLPd7PC', NULL, 'active', 'member', 'FWDEK4P87eyOMFMcCgCkUH5jeY4xbF', NULL, '2020-06-22 08:18:42', '2020-07-08 04:55:36'),
(122, 'NJaks Ksjss', 0, 0, 0, 0, 0, 'hypersstars@gmail.com', '2020-06-22 09:11:21', '$2y$10$xanI5JABs9qqQSbx8KI8de98.BqxsM5Jxoir9WUwylYqIp7gO7h9C', NULL, 'active', 'member', 'STwvyWfVqPBd8XgBAabidNOidYQpRe', NULL, '2020-06-22 09:11:02', '2020-06-22 09:11:21'),
(123, 'Ghomidi Lawe', 0, 0, 0, 0, 0, 'ghomidi2284@gmail.com', '2020-06-22 09:21:13', '$2y$10$bJ6fgPTp5c65GDAvvVH.pube1GBzqPpXAajVHFFpp/lkeiyR2UBqm', NULL, 'active', 'member', '0CPwaNVLwVYkQftS9IqfekgTOgX3z5', NULL, '2020-06-22 09:20:09', '2020-06-22 09:21:13'),
(124, 'Zico Marchellino', 0, 0, 0, 0, 0, 'zicomarchellino2@gmail.com', '2020-06-23 02:34:17', '$2y$10$V83NWND9BAkVWUTkAFsltua2Ez2A3ZxXoLLOXFW.Yert5qdm1rNz6', NULL, 'active', 'member', 'z9oPH6jBJqddbtuDKhawK6dxtiq1OL', NULL, '2020-06-23 02:33:41', '2020-06-23 02:34:17'),
(125, 'Rizky Pray', 0, 0, 0, 0, 0, 'wnnpry@gmail.com', '2020-06-23 03:38:25', '$2y$10$Cundk2XCtoD2ko2eUqLZVOoeSKEz1EnirCJo4zPCmwF2RD7OlQ/hi', 'NGOekCyzoMLOl17gb7g61WDEl38MmDFq0C2TpPqJMKqerxII0S6vSzbiHtYS', 'active', 'member', 'm1pVtrokHC3pESquaywl1HCuC1AMeW', NULL, '2020-06-23 03:37:39', '2020-06-23 03:38:25'),
(126, 'bayuanwari', 0, 0, 0, 0, 10540, 'bayuanwari98@gmail.com', '2020-06-23 07:07:33', '$2y$10$KIiePgdzxK8uKYpi0gDMj.p3iYAPs2N2nTDPH/.9DDJzvuwLQn8Da', NULL, 'active', 'member', 'MGsOs0zYb4P8Hsz8YgmELM318LLyMM', NULL, '2020-06-23 07:06:52', '2020-06-26 19:01:05'),
(127, 'Kontolkuda', 0, 0, 0, 0, 0, 'kntl@gmail.com', NULL, '$2y$10$6BKez741SBX/lbn9M50K6Oup0GG16BTrL2SfHjujAJMu.8UGmGpRK', NULL, 'active', 'member', '3QvrVH5LMjNvwhjFZ1p29ZsALw3Avw', NULL, '2020-06-23 19:00:27', '2020-06-23 19:00:27'),
(128, 'tes', 0, 0, 0, 0, 0, 'tes@test', NULL, '$2y$10$yeAPtcyZGoX6TnGoMkjb9Oi88r8VbvZRzf7Efu0R5nv6hm923FdUm', NULL, 'active', 'member', 'qwDLCRK6O53MLgSyLIQuZClUQyDfR5', NULL, '2020-06-24 10:44:43', '2020-06-24 10:44:43'),
(129, 'Chandra Ziaemil Ihsan', 0, 0, 0, 0, 0, 'Chandra@gmail.com', NULL, '$2y$10$kRu0.sigyLRgQ.nGmRmSSO7Kj02Nm56yuxwmeILparr0lIJHez3jC', NULL, 'active', 'member', 'bI1F75K94bhfja7klyG7uttu5K87LK', NULL, '2020-06-24 22:44:19', '2020-06-24 22:44:19'),
(130, 'Syaputra hidayat', 0, 0, 0, 0, 0, 'syaputrahidayat05@gmail.com', '2020-06-25 02:05:04', '$2y$10$oisEK3AgnNoYGAtUwEn4H.CWUIZjq0rsG05EXKarlz20j4LzOEgNy', '9kVyqqgTxKAxn3C4LwiNeH6kYRkjF4Qu656fh14L6AHRWmgrTFX5mSSUEfHe', 'active', 'member', 'atT5hPqn9zOZ3ZjjDwqkDIsBUCS5ua', NULL, '2020-06-25 02:02:50', '2020-06-25 02:05:04'),
(131, 'Rian', 0, 0, 0, 0, 0, 'muhammadriany@gmail.com', '2020-06-25 03:14:14', '$2y$10$H40dhNMxhcMzQiAQZHHHH.puSTEG2mfqRbM6I8W1.lQSimtC.KCJO', NULL, 'active', 'member', 'emXBPvOoaV4KZA1DSnMz4QsQa5fLYJ', NULL, '2020-06-25 03:13:45', '2020-06-25 03:14:14'),
(132, 'abzabz', 0, 0, 0, 0, 0, 'abzabz@gmail.com', NULL, '$2y$10$il./l/htTTovbNVL4VfuouKbLnsKaWITknkOvTggxkMhOXLavaet2', NULL, 'active', 'member', '0nCgTcN6h9Qe8gUnTsOXOjNp5vyb1c', NULL, '2020-06-25 03:49:18', '2020-06-25 03:49:18'),
(133, 'Demoooooo', 0, 0, 0, 0, 0, 'Demoooooo@gmail.com', NULL, '$2y$10$OmUfHXcuxw4yMP1QW87zoeRxCJP3OsY/RpGR4xvESoi2VVydTHLlO', NULL, 'active', 'member', 'vBOmmew7OPxXXMrneTUBAwsis6A3Gt', NULL, '2020-06-25 10:45:38', '2020-06-25 10:45:38'),
(134, 'Dodimeki', 0, 0, 0, 0, 0, 'michaelkontop@gmail.com', '2020-06-25 19:50:28', '$2y$10$PSeXOd0ddseo6hVMnC/DDegLKZBIuY784fjJFYlZZERAK0TIwmE4.', NULL, 'active', 'member', 'nSWwQI0d0esWdeVSoKYCO3hjtY09EQ', NULL, '2020-06-25 19:49:51', '2020-06-25 19:50:28'),
(135, 'Dodi saputra', 0, 0, 0, 0, 0, 'dodisaputra1424@gmail.com', '2020-06-25 19:51:01', '$2y$10$Av3VOxvQDjbCAvQyKnlhHuN5KgErOzNh./bQm7oVuZapCUdQS6LPa', 'n4w5Eoz2gFwHHbRs7iW4X90rPbzm5ZFls5EDBePIi9ZLlX9j9nLEECSOSfBp', 'active', 'member', '8gM55CEBV4BHaXxLfgNlWYMkj98HDA', NULL, '2020-06-25 19:50:17', '2020-06-25 19:51:01'),
(136, 'Ijall', 0, 0, 0, 0, 0, 'Faizalwijaya85@gmail.com', '2020-06-25 19:55:55', '$2y$10$fyUcMVYlASq85rAd4Pxn8.frNsJbHZa9DlJNBxNpB4dLGU85RFXpy', NULL, 'active', 'member', 'aObiXNWNHmUzcp088V4A0nfeyPCRKz', NULL, '2020-06-25 19:53:57', '2020-06-25 19:55:55'),
(137, 'Retno', 0, 0, 0, 0, 0, 'retnodrachmaningrum@gmail.com', '2020-06-26 00:27:07', '$2y$10$XBGKICmb6jlVpS1jknKbIO3TUf/ozCWMBDWhiN2mb8fWMO2SG7HCa', NULL, 'active', 'member', 'k2eanqD1Cd3BNwZ6fXIOF0O4bSnmpr', NULL, '2020-06-26 00:26:22', '2020-06-26 00:27:07'),
(138, 'Yuda prandita', 0, 0, 0, 0, 0, 'Yudaprandita1313@gmail.com', NULL, '$2y$10$ES25leyWjdhELpKO0cS8UOG0DAig/qerSNNFgL9CCEipY9QUEWDC2', NULL, 'active', 'member', 'P0o07l5pQluFcu5jXGH9tiuyJgWTgw', NULL, '2020-06-26 03:26:04', '2020-06-26 03:26:04'),
(139, 'Ahmad', 0, 0, 0, 0, 0, 'okekirah@gmail.com', '2020-06-26 03:45:07', '$2y$10$HGYn7dSFUic24SrPN1NWieOjZ3VzhejE8i2SaBjVuFVfE2ZARlkEG', NULL, 'active', 'member', 'cMfDdq1SdirEKSMIoVDM65YrhAxxJa', NULL, '2020-06-26 03:44:14', '2020-06-26 03:45:07'),
(140, 'Muhamad fahmi hidayat', 0, 0, 0, 0, 0, 'Fahmibeatz4@gmail.com', '2020-06-26 03:48:32', '$2y$10$G.BYKa/RyYFDgtGJJtYLh.CmvqxJ6.VW.V8W23RqxBRpbhCnSGqMK', 'hn1hDpfYmUHcK8TB1EeztgJU00c7bKFeTJwG1AigXRoXKotb3xtAJkvzXnRW', 'active', 'member', 'fCB7R5XRjrDYr00paSVNLAZRzRdcsc', NULL, '2020-06-26 03:47:20', '2020-06-26 03:48:32'),
(141, 'Muhamad Abdulah', 0, 0, 0, 0, 0, 'abdulahm148@gmail.com', '2020-06-26 04:05:22', '$2y$10$mNh0NaSQjLfZh7NyRu2vsO.jpq3b9RKz3YmnEN7/DqrcpAYTo8shy', NULL, 'active', 'member', '0VHNCG9gryGg1r1b2wewucnOPjvjTB', NULL, '2020-06-26 04:02:31', '2020-06-26 04:05:22'),
(142, 'syahrull wahyudi', 0, 0, 0, 0, 0, 'syahrullwahyudi@gmail.com', '2020-06-26 04:14:34', '$2y$10$Qku4UY0vHnaGjCPh7vT9HuFbbmhmw25RacJywDTNi8FROcffNTjXq', NULL, 'active', 'member', 'uH6FpQZ3jT4Dxr1UBrrdHw0szCiEG7', NULL, '2020-06-26 04:13:35', '2020-06-26 04:14:34'),
(143, 'demoo', 0, 0, 0, 0, 0, 'demoo@gmail.com', NULL, '$2y$10$jXREp8.CTB2x7P2aFLLQkui5pJQV1e9QQfGzctXk.eyIH1XlWk1IC', NULL, 'active', 'member', 'bBo8UWYro53Y8i8K7Svd64saLym2fJ', NULL, '2020-06-26 04:49:33', '2020-06-26 04:49:33'),
(144, 'demo', 0, 0, 0, 0, 0, 'hapewav189@mail-dj.com', '2020-06-26 04:51:55', '$2y$10$kE6xQIyxVfkhdTLMElg/V.tCD34j0zxNDVm8U8OOl2wfKBSYYFoaq', NULL, 'active', 'member', 'PqEg9Ys7YXptwuJXiAAu11YejyJsLR', NULL, '2020-06-26 04:51:33', '2020-06-26 04:51:55'),
(145, 'Raihan', 0, 0, 0, 0, 0, 'pramuktihaniar25@gmail.com', '2020-06-26 09:16:41', '$2y$10$jlPU03lRzie477wVzG6Lu.EjSQ3Z0y3Ok4NasmQUV9Z8m6sQb4.di', NULL, 'active', 'member', 'DCQErD4JgPj3rjApaYG4K4LEceOWwb', NULL, '2020-06-26 09:15:56', '2020-06-26 09:16:41'),
(146, 'Doni Pranata', 0, 0, 0, 0, 0, 'boneksurabaya740@gmail.com', '2020-06-27 00:12:25', '$2y$10$w2YOD1sn0zVazbfPf3cNFe53iCIbbGelgORLfJwKxGzdNbAWrzn2q', 'xhrGm32ve4rc3zbFx55D53bZQrfWvAgNYHOW3TrulgIlbrnuEB5tkRGYJHFQ', 'active', 'member', 'sZnbN8a3zzQp3CMRaWj2IlUrzB8NWQ', NULL, '2020-06-27 00:11:42', '2020-06-27 00:12:25'),
(147, 'tayo', 0, 0, 0, 0, 0, 'donygonzales97@gmail.com', '2020-06-28 16:51:45', '$2y$10$c7ovY9T2TPTtazhuxbG59OtyhK1vkCr49bluDsVCLB0A.99S3s1um', NULL, 'active', 'member', 'ZPu5pLohr6zN3QZ8wtvSUn1ceQ9aWA', NULL, '2020-06-28 16:51:15', '2020-06-28 16:51:45'),
(148, 'DIMITRI FLORENCE', 0, 0, 0, 0, 0, 'florencd9@gmail.com', NULL, '$2y$10$dprfNut1tcsRL11e0NocAuh1rb.7ZzA9CCeoov/ygpAOaqOQwkFOu', NULL, 'active', 'member', 'JLSI6A61hRdNzDrDZgPhr7GfbFJ5ok', NULL, '2020-06-28 18:10:40', '2020-06-28 18:10:40'),
(149, 'FahalCrew', 0, 0, 0, 0, 0, 'fahalcrew06@gmail.com', '2020-06-28 20:36:22', '$2y$10$Drzzc/lOO0Vcw9ai0oN8cumtdK344aIJFFfaWxqa8h6tkyZMexIvq', NULL, 'active', 'member', 'yE7SYj6g2HBDjAUUQERZMxZ223m2Ow', NULL, '2020-06-28 20:35:44', '2020-06-28 20:36:22'),
(150, 'Hatab', 0, 0, 0, 0, 0, 'hatabmakulassy23@gmail.com', '2020-06-28 23:54:33', '$2y$10$1GPWidMY0ZE1TxulYLmHqeE4aMPbl66hchZJVDj8LtxYu1P6L4rWi', NULL, 'active', 'member', 'a2qonGQ8lGF7IuSjo8ljpmP1dQoxMz', NULL, '2020-06-28 23:54:11', '2020-06-28 23:54:33'),
(151, 'Muhamad Alpha', 1, 1700, 0, 0, 553, 'alphamuhamad9@gmail.com', '2020-06-29 05:10:40', '$2y$10$A0ryfKFjIgS30dUtadYZAebAaf0AIBNyg8Ns.mvYRenVmE.6InjZG', NULL, 'active', 'member', 'GkmUFF05AcCXc0JHYVuU7c803ECIwj', NULL, '2020-06-29 05:10:04', '2020-07-12 23:53:01'),
(152, 'David ari wibowo', 20, 0, 19650, 0, 350, 'davidtamvans23@gmail.com', '2020-06-29 06:59:30', '$2y$10$xQ6QkoqFLl3xrxbMIhzz0uevG.RUz1YdpABvDKp5in4BhYcqkUcuG', 'eOzi1QBj5r2UAGpfE6QXB2XeN1uBQwGeFuGtckEjRxIOiK2FF3cUsX5qsgfQ', 'active', 'member', 'kpuYNTZX1gyrw3Fq06KN9LOxPDgii8', NULL, '2020-06-29 06:59:00', '2020-07-15 03:42:08'),
(153, 'satria', 0, 0, 0, 0, 0, 'woykimakyababy@gmail.com', '2020-06-29 19:10:53', '$2y$10$rBm/i475lvgu7Ye3O6pwF.qTbCJwTI11kZzcGsDh.EjL6NsT7uHjO', NULL, 'active', 'member', 'cgAxY2GjXc7yWtFJz5z4NbqL69ezpr', NULL, '2020-06-29 18:50:04', '2020-06-29 19:10:53'),
(154, 'YogiDevelopers', 0, 0, 0, 0, 0, 'yogiprayogijkt22@gmail.com', '2020-06-29 23:38:47', '$2y$10$jxjxmVTAgyU/Xjg1kXWEhePriwTNtZQ657liJSzh5wYu34ekrsS16', '6eAfJo0qwPoih3drQpLpOusQ46p1kS2AzsoCK7efIdBqCu4lmol6OLSWgzPo', 'active', 'member', 'JibuscAyU46cdeRGItnbpG9adJJDkb', NULL, '2020-06-29 23:37:58', '2020-06-29 23:38:47'),
(155, 'Dutta Fachrezy', 0, 0, 0, 0, 0, 'duttafachrezy2002@gmail.com', '2020-06-30 04:39:29', '$2y$10$BMbT2J703IDUXmrR7kww3esgcKh0en65.FP9C7MkUpqXDd/FLiMea', NULL, 'active', 'member', 'pmodNeWjUklujTIkRj5OdQNHEh8miY', NULL, '2020-06-30 04:35:48', '2020-06-30 04:39:29'),
(156, 'Aan Subagja', 0, 0, 0, 0, 0, 'aansubagja@gmail.com', NULL, '$2y$10$4M942r4E7qmb1/vI5BTq5u7MPi4ikaYTFlOKtTPbue9VesjLsQQcC', NULL, 'active', 'member', 'lkoDdvsxPNwP4YfA65Hwj0FeMXU0k8', NULL, '2020-06-30 22:17:48', '2020-06-30 22:17:48'),
(157, 'Putubaladewa', 0, 0, 0, 0, 0, 'putubaladewa@gmail.com', '2020-07-02 05:01:08', '$2y$10$RofBz095JD8gHMM1lkRtJOSEXw30BQMAPjG.49rVejZ6Fvt4qm3Cm', NULL, 'active', 'member', 'N6yZi5dbkkJ981ojyhrvdzw7ckKoJ1', NULL, '2020-07-02 04:57:42', '2020-07-02 05:01:08'),
(158, 'gazahz', 0, 0, 0, 0, 0, 'gazahz@gmail.com', '2020-07-02 06:01:58', '$2y$10$//Ql56Ubkmu7xrcT0a0EOOudQ8yyV1Dd5vCdVmAeToKRtzl5ccRN6', NULL, 'active', 'member', 'W7dW35BhY40XlMRBOBaW97p6P2kxbo', NULL, '2020-07-02 06:01:28', '2020-07-02 06:01:58'),
(159, 'dani12', 0, 0, 0, 0, 0, 'dani12@gmail.com', NULL, '$2y$10$xze3mdxsnBduaRH6.TW5q.xmSq/ZA5lzX6SG8SsO3Pk0jS1cWTSFi', NULL, 'active', 'member', 'LBCPFynOKtvBcp1fDD7FCgUQb66Lzl', NULL, '2020-07-03 09:15:22', '2020-07-03 09:15:22'),
(160, 'Ilham Syahputra', 0, 0, 0, 0, 0, 'tradzilham@gmail.com', '2020-07-03 21:19:13', '$2y$10$BkU6tu.p44fAopMwPNVY6uEvKAbndfMMupi5F0R6DYgOQrd6IvXqS', NULL, 'active', 'member', 'xhM0Xp7gk1DBvVzdDF8K5xC9io8PgK', NULL, '2020-07-03 21:17:32', '2020-07-03 21:19:13'),
(161, 'Andi Setiawan', 0, 0, 0, 0, 0, 'akunkunam@gmail.com', '2020-07-03 23:17:37', '$2y$10$gRRLHkUJ.P8V.fxAbJlI5.a1JX3.U6VOd2TRgXtH7aVDy0RjCF1m2', NULL, 'active', 'member', '2VPUEbe4MM9mWm8csGwC42KM7RQNyE', NULL, '2020-07-03 23:16:35', '2020-07-03 23:17:37'),
(162, 'Andi Alif', 1, 5500, 0, 0, 4149, 'andialiflubis@gmail.com', '2020-07-04 06:13:44', '$2y$10$jTi9ZJR8xBU6uK.tZcQwDeXvZurLpef6rYQ8lN4KLdGLH4yBj25pW', NULL, 'active', 'member', '6uRiuZ9OlFWyxvXg2s8TuG9E1cnUKT', NULL, '2020-07-04 06:13:02', '2020-07-18 05:05:00'),
(163, 'Ahda', 0, 0, 0, 0, 0, 'yaelahda@gmail.com', '2020-07-04 21:17:32', '$2y$10$h3TcRE.oW3lGS4NxisPwyOx9yvL1ojR3KnzpjDhemLdhBXLr1iURW', NULL, 'active', 'member', 'VMy7YapujXVt5s4iCkmHNbiI7UTStJ', NULL, '2020-07-04 21:17:21', '2020-07-04 21:17:32'),
(164, 'Jhondae66', 0, 0, 0, 0, 0, 'jhondae66@gmail.com', '2020-07-05 02:13:29', '$2y$10$ZO0vQ0NXuE1nkdNLqrsFfeAspURFs3MzkuUc.7SVnepxaHuUm9djm', NULL, 'active', 'member', '77DqTo5pOFj4OEUkyS7DhbpfNqKnp2', NULL, '2020-07-05 02:13:08', '2020-07-05 02:13:29'),
(165, 'Khan', 0, 0, 0, 0, 0, 'muhruhkan1@gmail.com', '2020-07-05 22:59:34', '$2y$10$R5jaOvZD6cyrEereSseFoOBV.6FjbPIfsbr9LU7nAEnkUPizRsJca', 'SktSmsR84ZVrCHlrhhPnO4ILavj9HcR9RTjAGgojP1cYG8qE4oyxBg5150Ae', 'active', 'member', '50l8vZWaPz1EmdAyNtUKc3e0H3UHmP', NULL, '2020-07-05 22:57:52', '2020-07-05 22:59:34'),
(166, 'ABANGDEEGT', 0, 0, 0, 0, 0, 'deeherfeld05@gmail.com', '2020-07-05 23:54:58', '$2y$10$wuvs4cZ/KugnxEjIsexz6epEwTGnB/8tko8AKH/r3Sg.XSFZT1i3C', NULL, 'active', 'member', 'dGryZqOOKCJwQsZoL9kZXqFsRdkSCd', NULL, '2020-07-05 23:54:24', '2020-07-05 23:54:58'),
(167, 'Lucky Pay Digital Indonesia', 0, 0, 0, 0, 0, 'suport.pekanbarupedia30@gmail.com', '2020-07-06 01:14:18', '$2y$10$C0Tekye.prUOeUljnQ7.K.L4Vij9Vvyn0L/6BvNUTeLYdxMMZ5KL2', NULL, 'active', 'member', '6R82OOpfnPrKJNcuCS6gewMrDyb54M', NULL, '2020-07-06 01:12:20', '2020-07-06 01:14:18'),
(168, 'Dwi Joko Sasono', 0, 0, 0, 0, 0, 'dwijokosasono@gmail.com', '2020-07-06 02:36:28', '$2y$10$0JOGi.WgbI9FonNDoF4b4ed1tK6f8dbZoBOBJBgyIp4xvEJSUQu9i', NULL, 'active', 'member', 'qWk1ctxnXc9pF6VGk8s6IqkTxXtXMz', NULL, '2020-07-06 02:35:19', '2020-07-06 02:36:28'),
(169, 'Haerul12', 0, 0, 0, 0, 0, 'Khoirulanamm112@gmail.com', '2020-07-06 04:31:15', '$2y$10$HinxE9qB0SOC9ZCravfcYOCCeACYVaCGQQSnY7Ri431aicgWEWqE6', NULL, 'active', 'member', '3hcEE99HzkgmJlrU3QTvfYnhKQTUTo', NULL, '2020-07-06 04:29:54', '2020-07-06 04:31:15'),
(170, 'nexule Gans', 0, 0, 0, 0, 0, 'awangpw213@gmail.com', '2020-07-06 17:38:18', '$2y$10$9wcI5.jSlyZZdX8hLo4PX.n5bVC2QPVdzvQmCy7tbowUxiQLgnFga', NULL, 'active', 'member', 'eJBMPPmSlhcxCFfv7szyhcWg6ZAQiX', NULL, '2020-07-06 17:37:51', '2020-07-06 17:38:18'),
(171, 'iamlucive', 0, 0, 0, 0, 5000, 'mfajarilham13@gmail.com', '2020-07-06 19:43:16', '$2y$10$TzMbyPoQxvecq.7BuQiU1ee11NwsR28FI4KOzUc1RN.j774euL6OC', NULL, 'active', 'member', 'vatqXs1fGGYghDFUdPZwsF0nLQo0nD', NULL, '2020-07-06 19:42:06', '2020-07-07 21:15:24'),
(172, 'ariel septian', 0, 0, 0, 0, 0, 'hackedblack404@gmail.com', '2020-07-08 05:43:23', '$2y$10$uyLk12FPRogAnr.FCgKIHuNVrn87uC6GX6Q4U/RlEkE/UNhUk8Iiy', NULL, 'active', 'member', 'bd8wZpq1oVQdCbktsPsHKng1NrL2SX', NULL, '2020-07-08 05:42:23', '2020-07-08 05:43:23'),
(173, 'alfadli12', 0, 0, 0, 0, 0, 'neofadli@gmail.com', '2020-07-08 10:20:31', '$2y$10$/K1aPQvg40d5ADNzJKYZ7.BlKmArTjL9GBpHa5AnToMegDOkDHNWO', NULL, 'active', 'member', 'eBDG5CgNobildBkZ3QPhedPnUj6E4j', NULL, '2020-07-08 10:19:57', '2020-07-08 10:20:31'),
(174, 'Moch toby', 0, 0, 0, 0, 25000, 'mochtoby12@gmail.com', '2020-07-09 05:04:19', '$2y$10$QaOfE9m0CVDn.1jAE1DMi.jr9ZjT9/Dqt46H8KJ2lRVPL04NV1Vy6', NULL, 'active', 'member', 'ZBkUuDYUT2zZOi0uV89ahjfeQoRjrq', NULL, '2020-07-09 05:04:05', '2020-07-13 05:33:02'),
(175, 'Aditya Akbar', 0, 0, 0, 0, 0, 'aditya.akbar9855@gmail.com', '2020-07-09 23:25:42', '$2y$10$sDCy6WsVU1/N/XVI2X5X.O0gfAh9E0rLn6RqDTlAZjscgFt4n29uq', NULL, 'active', 'member', 'SBtrD5QbHhpA14WcaaLi1uKtxJAqgO', NULL, '2020-07-09 23:25:16', '2020-07-09 23:25:42'),
(176, 'Ruli Aditia', 0, 0, 0, 0, 0, 'ruliaditia16@gmail.com', '2020-07-10 06:13:55', '$2y$10$/rYStfL01REKebZpzXxehuSym7jtPgj0UteN9764G1Trl5RAotOUS', NULL, 'active', 'member', 'hgICVKVunGicoAzfhdhznjNyIeMKBP', NULL, '2020-07-10 06:13:30', '2020-07-10 06:13:55'),
(177, 'java perm', 0, 0, 0, 0, 0, 'javapren@gmail.com', NULL, '$2y$10$q.rKbQiJ5pGA6O8Sj83EZem8Fu0phMve./ueUqLKPP6gB5KQRDKBW', NULL, 'active', 'member', '12ffHB3b1rjIC49WsbR6IlULUahaEx', NULL, '2020-07-10 17:53:28', '2020-07-10 17:53:28'),
(178, 'Tehbotol', 0, 0, 0, 0, 0, 'tehbotolsosrowarnaabang@gmail.com', '2020-07-10 18:20:21', '$2y$10$VynMUDY2WpYDjI/XKfz8i.NgKDHmhopz4qLwUtjI.spcGFHvApf22', 'iVAM8Nyb2QUc1O6m7v6Dx3TnrRkeday7O7nyCQiwgoMktnVqedNEi7oa9Bp5', 'active', 'member', '57SBWoFfzXMGW8C8XIUXIaSUsWzVBs', NULL, '2020-07-10 18:19:43', '2020-07-10 18:20:21'),
(179, 'Rico', 6, 83935, 40500, 0, 6715, 'widyantororico@gmail.com', '2020-07-11 07:22:52', '$2y$10$PJ1CRPqpmmAk5nihIZ0O3.kQUQ8mpZVBEbZQvpqJ/3S8a6C8t2BCC', NULL, 'active', 'member', 'tHmf7kQ42qpalcOb6VEds0NegMac30', NULL, '2020-07-11 07:22:14', '2020-07-16 19:02:01'),
(180, 'keenanifah', 0, 0, 0, 0, 0, 'cretalase@gmail.com', '2020-07-12 17:20:41', '$2y$10$W7T3Ht1UDf3zjtPjQ2zDf.4MHzNL3kzzoEEYTeFfd4kzBfjxF6uge', NULL, 'active', 'member', 'fRY6OzukcY4uF4wxiFJAahd8lSQArL', NULL, '2020-07-12 17:20:03', '2020-07-12 17:20:41'),
(181, 'Rxplus', 0, 0, 0, 0, 0, 'ccboracay@gmail.com', NULL, '$2y$10$dawrhr0FWW0UPQTQIJY7neUV9fD0MIqfHmurxknK/7EI7Y5MUn/mq', NULL, 'active', 'member', 'Qjabt8fRYd4mKlI9JDMVrWao4QK6Ku', NULL, '2020-07-12 17:21:46', '2020-07-12 17:21:46'),
(182, 'Ahmad Dandi Subhani', 10, 0, 6595, 0, 1405, 'dandisubhani22@gmail.com', '2020-07-12 20:37:45', '$2y$10$wHdfHnQH7/dUuaDcFZF0/OkTmsLVEpIuyWtDWzURQYEFn85wM163i', 'RJOCrz8pWmJ3Md4171VvscSiLrnTxPaOOyqOL1afafaAHZyC8HzgA2Q7vbEW', 'active', 'member', 'blNVtypBDZK5R2EXw64GWdbYKdldNb', NULL, '2020-07-12 20:37:11', '2020-07-18 09:39:04'),
(183, 'Alize', 0, 0, 0, 0, 0, 'wizzariefah27@gmail.com', '2020-07-12 21:01:43', '$2y$10$TtffqZPGhWR8REEPqidMvu4sb.2rmrv4NcR2XEQZ.AtCzBjt7fa2C', NULL, 'active', 'member', '8sgEP1uOWmUsebvsncJKK8TbIRUxWp', NULL, '2020-07-12 21:01:01', '2020-07-12 21:01:43'),
(184, 'iqbal rahmatullah', 0, 0, 0, 0, 0, 'iqbal2@mailf5.com', '2020-07-12 22:23:33', '$2y$10$qm9svppjxDZAz.2c0f0nuuOM82hiZ5JixizJpUoGsTrH5ChaTK9ma', NULL, 'active', 'member', 'NrxC0cfTITPwglav7kUzXMZOz7IfGY', NULL, '2020-07-12 22:21:30', '2020-07-12 22:23:33'),
(185, 'maulana18', 0, 0, 0, 0, 0, 'pratinmas12095@gmail.com', '2020-07-14 05:12:17', '$2y$10$jmeqnjyZSYJDYuku12kZJu3r23wmrjEW58feQeckYWbPpcHFp7LKu', 'gyLL1GMVJQthRnMnmfQaESJSyuirp1xi5xyBS8SkJyxOdoDdPama08pb4feW', 'active', 'member', 'zYOhWo4Yzu5MTOQewxCHWKsWACF1yj', NULL, '2020-07-14 05:11:17', '2020-07-14 05:12:17'),
(186, 'John', 0, 0, 0, 0, 0, 'smedoheny@gmail.com', '2020-07-14 07:15:14', '$2y$10$RcL69FRVPqMursBq7YvkGOD3d.0jjf.BiFqZxJXdKB2d6UZBDhv7S', NULL, 'active', 'member', 'Scb9K7g0pZSJKI0QcEshsPlqshekSr', NULL, '2020-07-14 07:14:02', '2020-07-14 07:15:14'),
(187, 'Anjayyy124', 0, 0, 0, 0, 0, 'uhtlm99@hashha.ssks', NULL, '$2y$10$vwEMTu7Ehxd0vuqEAJJwLOtFwLVc/biJ.W5LQurjpSiGMx6v.DBh2', NULL, 'active', 'member', 'OaeKM0am3SfwHl0QuF993XDIQt6sn5', NULL, '2020-07-14 10:02:19', '2020-07-14 10:02:19'),
(188, 'Prastyo', 0, 0, 0, 0, 0, 'jangkungprasetia07@gmail.com', '2020-07-14 10:05:08', '$2y$10$BZa8JYEa59EMeuOT/ccdEeIlogVzsM9DaVISoz5G/d22Zs7eV1SM.', NULL, 'active', 'member', 'AGSiTnwZF4iaJVsCU29eOhPlGhrxae', NULL, '2020-07-14 10:03:37', '2020-07-14 10:05:08'),
(189, 'Riko', 0, 0, 0, 0, 0, 'riko.susanto01@gmail.com', '2020-07-14 10:17:27', '$2y$10$CubHIGl.i6poloENTZkmlOC0UnUOGOgHJXx7t4vAQAR1zP75C1wQm', NULL, 'active', 'member', '8MMiCbOB9udHyOe3RcJpvEiDOstLma', NULL, '2020-07-14 10:16:12', '2020-07-14 10:17:27'),
(190, 'yabes', 0, 0, 0, 0, 15634, 'jebehunchek@gmail.com', '2020-07-14 11:18:04', '$2y$10$zDBcYFmIwHcqbFoKo/7tM.kdP1zJI5od0W.4O0H1dx6XnSQFf2IsK', '4nYAmYHNpJ6kBwmF3iEiA73EUumkDdZhiqIEhZhgTjXpdCzsee3BdXEgrx4W', 'active', 'member', 'pQQF6HlQvhJvuyijB9DKnyJxLkgMFM', NULL, '2020-07-14 11:17:18', '2020-07-14 19:35:34'),
(191, 'WaroengCell', 0, 0, 0, 0, 0, 'rahmatxpvi@gmail.com', '2020-07-14 11:32:50', '$2y$10$0Zj9pAZmueuKxPYcSnd8z.ABztvEGdv3KtuSx83uRhynAB2EKi0Oi', NULL, 'active', 'member', 'qloBlJbkssKl2tKV7O8UPn27UbDjBg', NULL, '2020-07-14 11:24:07', '2020-07-14 11:32:50'),
(192, 'Muhammad Alvin', 0, 0, 0, 0, 0, 'alvin113@gmail.com', NULL, '$2y$10$1Mz/tO.21oB2.iR67lDE7OjQH1ElR7oB.b5ugvKY9.rzrmR9b4QV.', NULL, 'active', 'member', 'ZXb3raLhNj3VaMvwsEFzxemnsLwxZ4', NULL, '2020-07-14 14:51:10', '2020-07-14 14:51:10'),
(193, 'Rohman', 0, 0, 0, 0, 0, 'rohmanreal2@gmail.com', '2020-07-14 15:49:17', '$2y$10$58qcI2EN1nVikkZ7D25/PepUaiIUYNFjxJD0/v6u0XhR/g7WMJOfK', NULL, 'active', 'member', 'U5pnB3zowfmbrwauTeIUtQyMZCFavS', NULL, '2020-07-14 15:47:44', '2020-07-14 15:49:17'),
(194, 'Aldo fernando', 0, 0, 0, 0, 0, 'aldogaming12z@gmail.com', '2020-07-14 16:57:50', '$2y$10$HB2uYBErl0s3.xHCVzINXeiUVjrvcLdUJdtJmAAZJMxZuP/mDzcqG', '10zToxnlo5TORRgYPfYw3rojOCIiuYsVRl203sh720Z2XVXgyjBNwE9rGnsA', 'active', 'member', 'PIERgsx99oIYvyOLcxr4DHIBV2bQ1W', NULL, '2020-07-14 16:55:44', '2020-07-14 16:57:50'),
(195, 'U-PAY!', 0, 0, 0, 0, 0, 'vinding86@gmail.com', NULL, '$2y$10$RwH0sr27p.nswojBkh5/K.m5fdHtXYm.REQ0GRwkE0chhEA9Eb1Oq', NULL, 'active', 'member', 'EiPQPgDXJsgRpOMQJLBidFSZChPZ5x', NULL, '2020-07-14 17:19:23', '2020-07-14 17:19:23');
INSERT INTO `users` (`id`, `name`, `point`, `total_pulsa`, `total_sosmed`, `total_deposit`, `balance`, `email`, `email_verified_at`, `password`, `remember_token`, `status`, `level`, `api_key`, `ip_static`, `created_at`, `updated_at`) VALUES
(196, 'U-PAY!', 0, 0, 0, 0, 0, 'herfelddee3@gmail.com', '2020-07-14 17:21:25', '$2y$10$hWa/wUUu6x50lvKo4kdn/O6.UYECo6uZwBaXxm2g3GkfeE2RtD1vm', NULL, 'active', 'member', 'hOS8rPgi7XVc5XgJLYPqHm9fsYU7ol', NULL, '2020-07-14 17:20:30', '2020-07-14 17:21:25'),
(197, 'Izulmunir', 2, 75200, 2550, 0, 1210, 'izulmunir74@gmail.com', '2020-07-14 22:13:40', '$2y$10$7M8aZnlZQke.DCMT6gOPK.0BUdMn.XYGw83Hko0wdiLG0kqXf6Ovq', 'Ovcl5BhNnKBhwF8zHoQgrQD05Zd7sVKexXLcfVLdIJGkEBdFtLTqBArZkXjd', 'active', 'member', 'DdZXcVHoN5iBjK1mj1QVuay0HxVPam', NULL, '2020-07-14 22:04:11', '2020-07-21 10:46:30'),
(198, 'Izulmunir', 0, 0, 0, 0, 0, 'izulm7300@gmail.com', NULL, '$2y$10$305Hr6E.wikjvTswRW/K9ecJr8tYlK0RwwV4PYiOMwHD4VOx.cPeW', NULL, 'active', 'member', '7ToS2zBUt9tScpCUcYax7NHKCv1OcP', NULL, '2020-07-14 22:10:28', '2020-07-14 22:10:28'),
(199, 'Ahmad fikri', 0, 0, 0, 0, 0, 'guefikri5@gmail.com', '2020-07-14 22:37:38', '$2y$10$i1Q2lddzewflVy9UVc2A/OULidpuzCkuoHLTgDE.qSPfZUQ/GNuMi', 'ifvcXkxpGTTiktvVTWKaKpVICxfurdZITcxU8b1nfvx5jzm4zcZ3DGrgvhEk', 'active', 'member', 'Ic0HPMFYkfOWwVMr0VtSAVL8UsJmCm', NULL, '2020-07-14 22:36:33', '2020-07-14 22:37:38'),
(200, 'Linggom Halomoan Simbolon', 0, 0, 0, 0, 0, 'linggomhalomoansimbolon@gmail.com', '2020-07-15 02:42:08', '$2y$10$FJ7unGH6zIlGq6.aaEVlJuvYgu.YirafXPmh89LmAEGNx65kHedzi', NULL, 'active', 'member', 'fjAazanlKSuxfyAIbBJCvyG7588vz4', NULL, '2020-07-15 02:41:12', '2020-07-15 02:42:08'),
(201, 'Bagus Tri', 0, 0, 0, 0, 0, 'bagus123triga@gmail.com', '2020-07-15 03:48:00', '$2y$10$I6yzmVnpu8uJuKHRflgO9uOTkdtNJaNihM0pP4UkMbkqHj97QyaBm', 'xJo5fELhwR1JRETEBCJIGlR6XsFoapRtZAlNDF5te5KEVrydGa3C579kq5yV', 'active', 'member', 'mYCFdQctljzXswrpDAdMQuOSwspCmY', NULL, '2020-07-15 03:47:00', '2020-07-15 03:48:00'),
(202, 'Okay', 0, 0, 0, 0, 0, 'playrxplus@gmail.com', NULL, '$2y$10$SO/3jUNR1EMchtHMwWHnme4BQ53JSL36NredjZVBAObivUMHaaXCq', NULL, 'active', 'member', 'mGh11E0DtRQLSvx7Dg9tr5vg4i9SNR', NULL, '2020-07-15 05:28:33', '2020-07-15 05:28:33'),
(203, 'nurfitri', 0, 0, 0, 0, 0, 'nurfitridestiani9@gmail.com', NULL, '$2y$10$AdKCiuyz3X75NDjnmxbF1uCRO4cYaCBKHin/bVYGpOmkkBOWRAQeu', NULL, 'active', 'member', 'tNDj4gVRfvwCXA3QnaOmhwtkYJijBK', NULL, '2020-07-15 06:16:11', '2020-07-15 06:16:11'),
(204, 'Muhammad Alvin Faiz', 0, 0, 0, 0, 0, 'cukimaycukimay48@gmail.com', '2020-07-15 07:55:35', '$2y$10$vGze6.1zaqKWm0pQtDYSfeiSIgIsa3jTOy4Nku7n07BECbwK/07Gu', NULL, 'active', 'member', 'VTmN4okRZBOQDcHCpHrraAhp9qmwHk', NULL, '2020-07-15 07:54:38', '2020-07-15 07:55:35'),
(205, 'Asmara Satria Akbar', 0, 0, 0, 0, 0, 'asmara.satria.akbar@gmail.com', '2020-07-15 21:47:59', '$2y$10$I63mCDPRJW27dm.wvqbGLulK2M96s6A.e3udpa9Wc4/bqUKScQn1.', NULL, 'active', 'member', 'zJkCJwR5yrDV7nSmnQiBx3FAXGx6v9', NULL, '2020-07-15 21:45:07', '2020-07-15 21:47:59'),
(206, 'Yenyen Nainggolan', 30, 913000, 0, 0, 79, 'imacrosid@gmail.com', '2020-07-15 22:18:17', '$2y$10$qVWbGtQxQkkO6WqQhaNeSeXWVfCSo2YiX9AeK7Uc1sM0JM5LAwSD2', '3WSm8s84fT5BMvgywnRszhPJ5Jk0z6yHn7lVe8NnkBaye7oO93BpkqczWksV', 'active', 'member', 'aic1WI0NSxBCCWeU7fqAuOuZPxprv7', NULL, '2020-07-15 22:16:49', '2020-07-18 05:05:01'),
(207, 'Erni setianingsih', 0, 0, 0, 0, 0, 'erniitraa78@gmail.com', '2020-07-16 00:59:00', '$2y$10$bjvicXRc5uJ7ngFIisGpdOQ8iWumK9Ck805vL9ZTVeKY1b3Isr.h.', 'BlaMum3QaxMuaPSEmB6VY588PWvF5VzhtrtV7LbUL6DKUKHWQ8zegQjRk7Le', 'active', 'member', 'qKw9zOjh0sssCwvRuCGfeHL3wQ4Apd', NULL, '2020-07-16 00:56:50', '2020-07-16 00:59:00'),
(208, 'Revan', 0, 0, 0, 0, 0, 'bacodkaka@gmail.com', '2020-07-16 07:01:10', '$2y$10$.KV/NK9WgprTBvBSPmHqpu8aAHfgBlCayqFSD8sGfzz31kSUZlVM6', NULL, 'active', 'member', '97Oufwrf9ZfewsjVwQpbFqcGkUxxrd', NULL, '2020-07-16 06:59:06', '2020-07-16 07:01:10'),
(209, 'Rizal100', 0, 0, 0, 0, 0, 'rizalbook28@gmail.com', NULL, '$2y$10$kkEYydjSNHZiRpn6ciHCjOx0PqmuszSgensjXMnvIuCKqlSSWRV2O', NULL, 'active', 'member', 'VxVhJtYe5qaW8CUQVqUiin5pvWNBUZ', NULL, '2020-07-16 07:28:25', '2020-07-16 07:28:25'),
(210, 'NIACELL', 0, 0, 0, 0, 0, 'aryanabeny@gmail.com', '2020-07-16 08:44:35', '$2y$10$t/VufyPSpK1YGINqrtloUebKc.jSZ4iK.G0FgvajGdPdQJkR.dyia', NULL, 'active', 'member', '3g5zdSugkmSRsKOAX16CrttevU8Wdk', NULL, '2020-07-16 08:43:44', '2020-07-16 08:44:35'),
(211, 'Ramad', 0, 0, 0, 0, 0, 'danijrjrjr321@gmail.com', '2020-07-16 18:23:21', '$2y$10$ojL9eBsLqr3TA3jfI8RmVOoW0SlBxKsHSnXtdI2qXagSjtl3/U5UC', 'Wtei6l1U412kegMHR5ZgMF7SurDZTkMqA2C9y9JyKZnfs8AxTtuqsyoTywJc', 'active', 'member', 'orl1UnZRorKgcDV36kJYGNbvHy0D0x', NULL, '2020-07-16 11:43:35', '2020-07-16 18:23:21'),
(212, 'Irpan Ka', 0, 0, 0, 0, 0, 'irpan.ecoms@gmail.com', '2020-07-16 12:03:07', '$2y$10$a5/.7AtEovkb8hxX8C0fNuv9FQ4VtUCcBqsads8/Jmvm2aJ7mjYA6', 'aN1MqUpLIBgMnMgFvCiMd8Ma2QgIIfJHHjKV4Xkvfsc755Lfb6muDEA6sWzm', 'active', 'member', 'i2Y0eAxJdvgtcgBjBIW3KlZNfzIXQs', NULL, '2020-07-16 12:02:08', '2020-07-16 12:03:07'),
(213, 'haniaditya108', 0, 0, 0, 0, 0, 'haniaditya108@gmail.com', NULL, '$2y$10$Hnw3sGaXUaSAu1ISBGA7gufmhnUIHStPhRBl7yCphA/t7RTf5i1sm', NULL, 'active', 'member', 'oShRYKzqQ05yGifg2B0VIvUMUc1qYg', NULL, '2020-07-16 22:48:12', '2020-07-16 22:48:12'),
(214, 'AHMAD ABDILLAH', 1, 0, 600, 0, 48900, 'ahmadabdillah181@gmail.com', '2020-07-17 08:18:55', '$2y$10$qrFlKpR9T6ZFXWLt7Uvni.J4/jO3AmAxAmzoRb89VRvHz1ypvEK4i', NULL, 'active', 'member', '4j4niBo79nBlUrJI9bV4FWZ7kCuEkF', NULL, '2020-07-17 08:17:58', '2020-07-17 15:25:29'),
(215, 'Irfan Najmudin Sidik', 0, 0, 0, 0, 0, 'irfannajmudins123@gmail.com', NULL, '$2y$10$OR1dziR5VgBGIxyARnzR9.fMwxQPkD9nYGOJWxwmowpidjvvwv7ai', NULL, 'active', 'member', 'KwmDzWMDOG6eI8aqzorZitQg7VhB4K', NULL, '2020-07-17 09:32:29', '2020-07-17 09:32:29'),
(216, 'Irfan Najmudin Sidik', 0, 0, 0, 0, 0, 'irfannajmudin123@gmail.com', '2020-07-17 09:34:27', '$2y$10$aFOaym38zMtS6rEObZSL3ehItPLiYOSBePWnrUrzWwNu3ixWfM74W', NULL, 'active', 'member', 'k2cHCRZs28z4ne1aw8PeQ2XzSJUnlz', NULL, '2020-07-17 09:33:35', '2020-07-17 09:34:27'),
(217, 'ibnu', 0, 0, 0, 0, 0, 'benoebulu@gmail.com', '2020-07-17 10:16:06', '$2y$10$/BAeyE3djrB0DzbxRgzZbuVswqmkmMb9LZp/diBWzYCdWDKR6K/wK', NULL, 'active', 'member', 'JFMbDNOOPmr0OyBQ9PoI1sf8ZM67Ce', NULL, '2020-07-17 10:14:59', '2020-07-17 10:16:06'),
(218, 'anandha amru nugroho', 0, 0, 0, 0, 0, 'bangjago094@gmail.com', '2020-07-18 03:17:35', '$2y$10$i03kqvskyQMWlpqTJY4Njeei9cjiVaA/oKwBwA7LD2D97Ol5qFeUG', NULL, 'active', 'member', 'RylPekSEQhhnhXRXaoa5uPJaVOAvKU', NULL, '2020-07-18 03:13:26', '2020-07-18 03:17:35'),
(219, 'Michel', 0, 0, 0, 0, 0, 'Holikpu@gmail.com', '2020-07-18 07:06:14', '$2y$10$Mripnzo1UvTiPkoYqtOZYOcqvG59QvNThf24WF20xC1gyUv6t4odS', NULL, 'active', 'member', '4GHTWZ3GxJplxm6jQ83FjHFgHSScd6', NULL, '2020-07-18 07:05:38', '2020-07-18 07:06:14'),
(220, 'U-PAY! Indonesia', 0, 0, 0, 0, 0, 'cs@u-payindonesia.id', '2020-07-18 07:37:51', '$2y$10$U73yIJJK8z1a0FDGGmmeZ.Rp5uzD42rfs1901SPQv07cWuJRvMsOC', NULL, 'active', 'member', 'lN8atLyYtXsxYNj3nZEBE7cpu5xGc7', NULL, '2020-07-18 07:36:32', '2020-07-18 07:37:51'),
(221, 'Vaan', 0, 0, 0, 0, 0, 'alfandogusrinaldi@gmail.com', '2020-07-18 12:01:40', '$2y$10$PUfJavnA252aLyMUFS4FKunQBe63QLmlou0QzQA66WpEEfte8AQZG', 'nnUWT3dPxG2tkZC7VWBaVgAs1UypHNONbL7lr2PhmwFMK6wnfPv7BPHMjyOT', 'active', 'member', 'TmHxtoHPm3hdWNyPkLp7sQum6ZCzn1', NULL, '2020-07-18 12:00:06', '2020-07-18 12:01:40'),
(224, 'Jayadi', 0, 0, 0, 0, 0, 'omaiduc626@dnawr.com', NULL, '$2y$10$MqUMTMY3C92qlQX.dkLSyO4x8UyA4A8lNsetaU6eqsCGNq7pjPg6.', NULL, 'active', 'member', 'BUejkKoUmKBev4WQ4a09L4TMXnAyyN', NULL, '2020-07-19 00:35:01', '2020-07-19 00:35:01'),
(225, 'Alamiya', 0, 0, 0, 0, 0, 'zqqizx0828@mailer2.net', NULL, '$2y$10$ExsWdPbmyq7DNwRQi/0HFeDjTBQb7W2fi9E9QZhTnPmy5vlU33PrK', NULL, 'active', 'member', 'z0CKA7QEM8vbAOF841aIijQFLpvlUc', NULL, '2020-07-19 00:36:49', '2020-07-19 00:36:49'),
(226, 'qweasd', 0, 0, 0, 0, 0, 'hedora6199@gilfun.com', NULL, '$2y$10$gqsoEJnH/FWhKZJaxEaSAuK/o/yhsBCnp5jvOjuQPzviPwVDiKjgS', NULL, 'active', 'member', 'kG8ctqt0AZZddiLdrlQqj1isQqsUe0', NULL, '2020-07-19 01:45:57', '2020-07-19 01:45:57'),
(227, 'Satya', 0, 0, 0, 0, 0, 'satya.az@gmail.com', NULL, '$2y$10$86BLUtTEjkgdlRD1kvIH8eTLhW6wB7YmNMVccsLFAPrjcL5NSLQ5.', NULL, 'active', 'member', 'eTqaNqfPZ7jKCWJPsnbSTP219VYVLm', NULL, '2020-07-19 03:46:06', '2020-07-19 03:46:06'),
(228, 'Satya', 0, 0, 0, 0, 0, 'satya.azx@gmail.com', '2020-07-19 03:48:56', '$2y$10$WqChTlyk2QjKKEC0ihFLaupN3dDXVona6/xlq3SPcqAmt8snTyRjq', NULL, 'active', 'member', 'IzJq9YzOCPJyOdgJeyuguXZ0DQruwx', NULL, '2020-07-19 03:48:34', '2020-07-19 03:48:56'),
(229, 'demo1', 0, 0, 0, 0, 0, 'demo@demo.com', NULL, '$2y$10$OY0hd/CcQ.MGYmLnQEhDAO13V7XjU4ZT7z4lHOLF9e.oocHg.yitm', NULL, 'active', 'member', 'JOH7st7dM9OtlHzqCg2ntcX7YhbFoW', NULL, '2020-07-19 06:59:02', '2020-07-19 06:59:02'),
(230, 'netflix7800', 0, 0, 0, 0, 0, 'netflix7800-qw2@yahoo.com', '2020-07-19 07:00:19', '$2y$10$RvyusW0XyOcJG0IUApZmaO4B9uPX0RtoLB63lKpZdOFES9Rlhtmbq', NULL, 'active', 'member', 'M3anCDgwcei68vKGh42PXAlmZSOaox', NULL, '2020-07-19 06:59:49', '2020-07-19 07:00:19'),
(231, 'gembezt', 0, 0, 0, 0, 0, 'gembezt001@gmail.com', '2020-07-19 07:10:45', '$2y$10$EiLkz5JrxyP2idsmHp8KkuqKtlyHDKtXmIbeV7aebaAmJHQQG3Io2', NULL, 'active', 'member', 'BMGoxAWDWOuySzd5IFOPm50tLVyRul', NULL, '2020-07-19 07:10:25', '2020-07-19 07:10:45'),
(232, 'Sensee', 0, 0, 0, 0, 0, 'sense2219@gmail.com', '2020-07-19 15:58:57', '$2y$10$GF0GuTx7DHSZIYtWKRddA.XEIhDu20m0IxNOzW9q4lpgbrbQFmaA.', NULL, 'active', 'member', '8UpWon7D7he2zMrhgSH5UuA0f6epUS', NULL, '2020-07-19 15:57:56', '2020-07-19 15:58:57'),
(233, 'Riva Iskandar', 0, 0, 0, 0, 0, 'rivaniskandar99@gmail.com', NULL, '$2y$10$7erlwMH/OABKXh3K3rCyv.ES/3KkUrECKHgTYiBKGULijBB0zWTva', NULL, 'active', 'member', 'RVcI0j1Mh4ExqNC9mxR1DyvGUeWRgf', NULL, '2020-07-19 19:49:15', '2020-07-19 19:49:15'),
(234, 'Rivan Iskandar', 0, 0, 0, 0, 0, 'nagabonang974@gmail.com', '2020-07-19 19:53:33', '$2y$10$42VPEZPevy.Kf3dCUzOwj./ZZGg3/gvoMKaMPMNIObEEWsXnbSagm', 'eAqAfu0m0HopB7EJw4ni1yQxmovsN5viWmgr5AogjFuujPYQSMC3XIVlmUTX', 'active', 'member', 'pvzw49c20zN68k8RB0WWgXxr1AY8RI', NULL, '2020-07-19 19:50:29', '2020-07-19 19:53:33'),
(235, 'q48ai20002qx4o37q3pdr9egmgfm731zip7', 0, 0, 0, 0, 0, 'amirull.corp@gmail.com', '2020-07-19 22:14:46', '$2y$10$PTPiD0armgJ0Z7lYDHRsmu6aR1Y0kXPWyqX17kTXYABSURdMX2nQ2', 'RtbRGh85QzcCcXiXbyJHIKcMbqokN4oQmCgunC5OnV6PxydJnnJeY8ujdp2h', 'active', 'member', 'MryOE1jMFafvHFxDdHqDYEw6rcqOj8', 'x2fig9y7y9o42v1eoankpgcnkndt5az8gy5', '2020-07-19 22:13:59', '2020-07-20 04:28:50'),
(236, 'dziu\'', 0, 0, 0, 0, 0, 'dziunincode69@gmail.com', '2020-07-20 02:52:29', '$2y$10$mbuvwG9VoTNlIThJzg5MUO7Wb6L7rCs2P/4v.NXA0IzUn0E4smYtO', NULL, 'active', 'member', 'QgbjHfAQ0BVJnRdc4vZ4gJLwfnRirl', NULL, '2020-07-20 02:51:22', '2020-07-20 03:28:37'),
(237, 'dziu', 0, 0, 0, 0, 0, 'dziunincode.69@gmail.com', '2020-07-20 02:58:19', '$2y$10$dbl8KBOFn19quJ45XjBNCOEd.X3dZHyYuqTjxw.cDTJ.SxVt8mdoa', NULL, 'active', 'member', 'mvRGe0sSndRD068b7MslegfjatwQiK', NULL, '2020-07-20 02:57:38', '2020-07-20 02:58:19'),
(238, 'Cocoknutz', 0, 0, 0, 0, 0, 'd.ziunincode.69@gmail.com', '2020-07-20 06:37:48', '$2y$10$Mhn1MhsXb7c/i7WtUN8yBODIMEdjVrnuKit8WgZGV/p2wX/QmKtMO', NULL, 'active', 'member', 'wLTkYEQV2HdV7eXU4TA5qe1e3XtdXW', NULL, '2020-07-20 06:37:08', '2020-07-20 06:37:48'),
(239, 'Ricki Agus Setiawan', 0, 0, 0, 0, 0, 'rickiagus20@gmail.com', '2020-07-20 07:22:21', '$2y$10$kh.ZBRWMFTVWYxzgDO11nu5oFX7FepDUVBGepfvag.byjhFiSD7UO', NULL, 'active', 'member', 'PgFcOzp7vBPzpBkhFNvVnOCwfWRI13', NULL, '2020-07-20 07:21:21', '2020-07-20 07:22:21'),
(240, 'MENDUA MART', 0, 0, 0, 0, 0, 'mi.argha@gmail.com', '2020-07-20 10:52:09', '$2y$10$JT8r.l4ebSILGxFUf1eYL.1hhc69BjX2YRcjwdl1HbGhMR7TT9ZRK', NULL, 'active', 'member', '3pFhnU7vBo0HxJNQeMDWyrpk92l089', NULL, '2020-07-20 10:51:25', '2020-07-20 10:52:09'),
(241, 'Annisa Fikry', 0, 0, 0, 0, 0, 'annisa.fikry25@gmail.com', '2020-07-20 16:30:56', '$2y$10$HHZIrHvqVws/eUVVMRMCJewvy5pPtmP9YngKJYFHeqfE/hfC1gOS6', 'tO8EUIYbe48M6o69PzJ2WbbypqrafjqJ10yMDC2YK3lUkwfPDmUIXy2lpKrD', 'active', 'member', '0kQjYNZs1uzJP0BK8gRkhHuQ0PItkz', NULL, '2020-07-20 16:30:06', '2020-07-20 16:30:56'),
(242, 'Kielm2207', 0, 0, 0, 0, 0, 'kielmoneshop@gmail.com', NULL, '$2y$10$LaoY.NlUuEyYUN7DLyjHbe68q1xBHT3VosPox3154zkIldn/CsPw2', NULL, 'active', 'member', 'nLNyHwMGSzdTOLWnTXHNobjFuxJ6a5', NULL, '2020-07-20 23:05:57', '2020-07-20 23:05:57'),
(243, 'dasdasd', 0, 0, 0, 0, 0, 'dziunincode.6.9@gmail.com', '2020-07-21 02:42:35', '$2y$10$72Yfds1kZMvNPn8OH7f2d.tU9f.J4o7tYjHYB1PQZoNOsHU/jhJym', NULL, 'active', 'member', '0Z0BaLP4lDvfk3Wo0gGpe1tzzREa4n', NULL, '2020-07-21 02:41:57', '2020-07-21 02:42:35'),
(244, 'VanExe', 0, 0, 0, 0, 0, 'muhvan19@gmail.com', '2020-07-21 07:39:07', '$2y$10$uyjRqMqWS1L2UttwwkBK7.MH7fr6N7HjAwFOniVGAVGReuPpLkUPm', NULL, 'active', 'member', 'BNeVioJxNZsDyXiJ5bbKLQ8DaK6C6J', NULL, '2020-07-21 07:38:10', '2020-07-21 07:39:07'),
(245, 'Ridwan', 0, 0, 0, 0, 0, 'ermaulana.id@gmail.com', '2020-07-21 09:48:42', '$2y$10$VuMC62d7KIGc0DEBAzTqDeOAlak7y8zf3QK7J9onLoGXVP2IfSJMq', NULL, 'active', 'member', 'J5sxBCL9CqB1UVDRqsxNs28DP1wSse', NULL, '2020-07-21 09:48:12', '2020-07-21 09:48:42'),
(246, 'dandev', 0, 0, 0, 0, 0, 'pguriding@gmail.com', NULL, '$2y$10$zat0hpRGFxEA0c1QkNwfxOAdgm/yaBxg04OgJrgFfg4xoT4SjlJxq', NULL, 'active', 'member', 'guD8K5tWNFp9buBqHTBeY8DezApUIv', NULL, '2020-07-21 18:26:22', '2020-07-21 18:26:22'),
(247, 'Pierre Aji', 0, 0, 0, 0, 0, 'alrofiqy@gmail.com', '2020-07-21 18:34:11', '$2y$10$fv/qxvty8a5qIzFKfpVmrumuOaIlcIgPz3MqlHn0HL9W41HNU2HP.', NULL, 'active', 'member', 'ssE9PhMzbAuIqMCk9YTc9sfUvrS1Dj', NULL, '2020-07-21 18:33:32', '2020-07-21 18:34:11');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `beritas`
--
ALTER TABLE `beritas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `histories`
--
ALTER TABLE `histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `histories_service_id_foreign` (`service_id`),
  ADD KEY `histories_user_id_foreign` (`user_id`);

--
-- Indexes for table `history_deposits`
--
ALTER TABLE `history_deposits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `history_deposits_user_id_foreign` (`user_id`),
  ADD KEY `history_deposits_deposit_id_foreign` (`deposit_id`);

--
-- Indexes for table `history_saldos`
--
ALTER TABLE `history_saldos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `history_saldos_user_id_foreign` (`user_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `operans`
--
ALTER TABLE `operans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `providers`
--
ALTER TABLE `providers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `providers_category_id_foreign` (`category_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `services_provider_id_foreign` (`provider_id`),
  ADD KEY `services_operan_id_foreign` (`operan_id`);

--
-- Indexes for table `sites`
--
ALTER TABLE `sites`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subjects_user_id_foreign` (`user_id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tickets_subject_id_foreign` (`subject_id`) USING BTREE,
  ADD KEY `tickets_users_id_foreign` (`user_id`) USING BTREE;

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `beritas`
--
ALTER TABLE `beritas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `histories`
--
ALTER TABLE `histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=460;

--
-- AUTO_INCREMENT for table `history_deposits`
--
ALTER TABLE `history_deposits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `history_saldos`
--
ALTER TABLE `history_saldos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=548;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `operans`
--
ALTER TABLE `operans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `providers`
--
ALTER TABLE `providers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=532;

--
-- AUTO_INCREMENT for table `sites`
--
ALTER TABLE `sites`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=248;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `histories`
--
ALTER TABLE `histories`
  ADD CONSTRAINT `histories_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `history_deposits`
--
ALTER TABLE `history_deposits`
  ADD CONSTRAINT `history_deposits_deposit_id_foreign` FOREIGN KEY (`deposit_id`) REFERENCES `deposits` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `history_deposits_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `history_saldos`
--
ALTER TABLE `history_saldos`
  ADD CONSTRAINT `history_saldos_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `providers`
--
ALTER TABLE `providers`
  ADD CONSTRAINT `providers_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `services_operan_id_foreign` FOREIGN KEY (`operan_id`) REFERENCES `operans` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `services_provider_id_foreign` FOREIGN KEY (`provider_id`) REFERENCES `providers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subjects`
--
ALTER TABLE `subjects`
  ADD CONSTRAINT `subjects_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tickets_users_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
