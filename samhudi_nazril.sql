-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 14, 2026 at 02:58 PM
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
-- Database: `samhudi`
--

-- --------------------------------------------------------

--
-- Table structure for table `families`
--

CREATE TABLE `families` (
  `id` int(11) NOT NULL,
  `family_name` varchar(150) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `families`
--

INSERT INTO `families` (`id`, `family_name`, `description`, `created_at`) VALUES
(1, 'Keluarga H.M Samhudi', 'Keluarga Besar', '2026-07-02 12:31:55');

-- --------------------------------------------------------

--
-- Table structure for table `family_members`
--

CREATE TABLE `family_members` (
  `id` int(11) NOT NULL,
  `family_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `father_id` int(11) DEFAULT NULL,
  `mother_id` int(11) DEFAULT NULL,
  `full_name` varchar(150) NOT NULL,
  `gender` enum('L','P') DEFAULT NULL,
  `birth_place` varchar(100) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `death_date` date DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `occupation` varchar(100) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `is_alive` tinyint(1) DEFAULT 1,
  `status` enum('pending','approved','rejected') DEFAULT 'approved',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `family_members`
--

INSERT INTO `family_members` (`id`, `family_id`, `user_id`, `father_id`, `mother_id`, `full_name`, `gender`, `birth_place`, `birth_date`, `death_date`, `phone`, `email`, `occupation`, `address`, `photo`, `is_alive`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 7, NULL, NULL, 'Siti Aminah', 'P', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'approved', '2026-06-15 07:00:00', '2026-07-02 12:31:55'),
(8, NULL, 18, NULL, 1, 'Pege Store', 'L', NULL, '2026-07-14', NULL, '0895412735876', 'pegestore1110@gmail.com', NULL, NULL, NULL, 1, 'approved', '2026-07-14 10:05:58', '2026-07-14 10:06:50');

-- --------------------------------------------------------

--
-- Table structure for table `forums`
--

CREATE TABLE `forums` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `media_url` varchar(255) DEFAULT NULL,
  `media_type` varchar(50) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `forums`
--

INSERT INTO `forums` (`id`, `title`, `content`, `media_url`, `media_type`, `created_by`, `created_at`, `updated_at`) VALUES
(5, 'Black Hole', 'Black Hole adalah lubang hitam supermasif', 'assets/uploads/forum/forum_1784005813_103.jpg', 'image', 7, '2026-07-13 22:10:13', '2026-07-14 05:10:13'),
(6, 'Black Hole Supermasif', 'Black Hole Supermasif adalah bintang yang meledak', 'assets/uploads/forum/forum_1784008733_524.jpg', 'image', 7, '2026-07-13 22:58:53', '2026-07-14 05:58:53'),
(7, 'kahjdouqwdu', 'akjdhqiwuhdiwqu', NULL, NULL, 8, '2026-07-14 07:46:30', '2026-07-14 12:46:30'),
(8, 'contoh', 'ccontroh', NULL, NULL, 8, '2026-07-14 07:55:21', '2026-07-14 12:55:21');

-- --------------------------------------------------------

--
-- Table structure for table `forum_comments`
--

CREATE TABLE `forum_comments` (
  `id` int(11) NOT NULL,
  `forum_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `forum_comments`
--

INSERT INTO `forum_comments` (`id`, `forum_id`, `user_id`, `parent_id`, `comment`, `created_at`) VALUES
(4, 6, 7, NULL, 'halo pruy', '2026-07-13 22:59:12'),
(5, 6, 7, 4, 'halo juga', '2026-07-13 22:59:24'),
(6, 5, 8, NULL, 'woy', '2026-07-14 07:46:11'),
(7, 5, 8, NULL, 'hey', '2026-07-14 07:55:38');

-- --------------------------------------------------------

--
-- Table structure for table `forum_likes`
--

CREATE TABLE `forum_likes` (
  `id` int(11) NOT NULL,
  `forum_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `forum_likes`
--

INSERT INTO `forum_likes` (`id`, `forum_id`, `user_id`, `created_at`) VALUES
(3, 6, 7, '2026-07-14 05:59:03'),
(5, 6, 8, '2026-07-14 12:45:21');

-- --------------------------------------------------------

--
-- Table structure for table `forum_saves`
--

CREATE TABLE `forum_saves` (
  `id` int(11) NOT NULL,
  `forum_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `forum_saves`
--

INSERT INTO `forum_saves` (`id`, `forum_id`, `user_id`, `created_at`) VALUES
(2, 6, 7, '2026-07-14 05:59:56');

-- --------------------------------------------------------

--
-- Table structure for table `foundations`
--

CREATE TABLE `foundations` (
  `id` int(11) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `address` text DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `marriages`
--

CREATE TABLE `marriages` (
  `id` int(11) NOT NULL,
  `husband_id` int(11) DEFAULT NULL,
  `wife_id` int(11) DEFAULT NULL,
  `marriage_date` date DEFAULT NULL,
  `status` enum('married','divorced','widowed') DEFAULT 'married',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `sender_id`, `receiver_id`, `message`, `is_read`, `created_at`) VALUES
(2, 7, 8, 'woi min', 1, '2026-07-14 03:47:24'),
(3, 8, 7, 'apaan', 1, '2026-07-14 03:54:27'),
(4, 7, 8, 'engga', 1, '2026-07-14 03:54:45'),
(5, 8, 7, 'yg bener', 1, '2026-07-14 03:55:12'),
(6, 8, 7, 'halo', 1, '2026-07-14 05:57:48'),
(7, 7, 8, 'halo juga', 1, '2026-07-14 05:57:57'),
(8, 18, 7, 'hei', 1, '2026-07-14 10:23:22'),
(9, 7, 18, 'what', 1, '2026-07-14 10:23:28'),
(10, 8, 7, 'aewra', 0, '2026-07-14 12:27:42');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `views` int(11) DEFAULT 0,
  `likes` int(11) DEFAULT 0,
  `status` enum('draft','publish') DEFAULT 'draft',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `title`, `slug`, `thumbnail`, `content`, `author_id`, `views`, `likes`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Berita Tes', 'berita-tes-1784024946', 'assets/uploads/news/news_1784024946.jpg', 'Black hole telah tiba di bumi', 8, 4, 2, 'publish', '2026-07-14 10:29:06', '2026-07-14 12:56:09'),
(2, 'AWqaf', 'awqaf-1784033309', 'assets/uploads/news/news_1784033309.png', 'afefesafes', 8, 5, 1, 'publish', '2026-07-14 12:48:29', '2026-07-14 12:56:07');

-- --------------------------------------------------------

--
-- Table structure for table `news_categories`
--

CREATE TABLE `news_categories` (
  `id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `news_category_relation`
--

CREATE TABLE `news_category_relation` (
  `news_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `news_likes`
--

CREATE TABLE `news_likes` (
  `id` int(11) UNSIGNED NOT NULL,
  `news_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `news_likes`
--

INSERT INTO `news_likes` (`id`, `news_id`, `user_id`, `created_at`) VALUES
(1, 1, 8, '2026-07-14 19:54:03');

-- --------------------------------------------------------

--
-- Table structure for table `otp_codes`
--

CREATE TABLE `otp_codes` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `otp_code` varchar(6) NOT NULL,
  `expired_at` datetime NOT NULL,
  `is_used` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `otp_codes`
--

INSERT INTO `otp_codes` (`id`, `user_id`, `otp_code`, `expired_at`, `is_used`, `created_at`) VALUES
(8, 7, '654510', '2026-07-02 07:09:13', 1, '2026-07-02 06:59:13'),
(9, 7, '477909', '2026-07-02 08:06:38', 1, '2026-07-02 07:56:39');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `expired_at` datetime DEFAULT NULL,
  `used` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`id`, `user_id`, `token`, `expired_at`, `used`, `created_at`) VALUES
(1, 7, 'ab73077e714cd2bf8b9d0cad919b1b4575934c86e7754474ed06b4393de54758', '2026-07-02 08:24:21', 1, '2026-07-02 07:54:21');

-- --------------------------------------------------------

--
-- Table structure for table `profile_banners`
--

CREATE TABLE `profile_banners` (
  `id` int(11) UNSIGNED NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `profile_banners`
--

INSERT INTO `profile_banners` (`id`, `image_path`, `created_at`) VALUES
(1, 'assets/images/background.png', '2026-07-14 19:28:50'),
(2, 'assets/images/background2.png', '2026-07-14 19:28:50');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `full_name` varchar(150) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('super_admin','admin','member') DEFAULT 'member',
  `family_id` int(11) DEFAULT NULL,
  `is_verified` tinyint(1) DEFAULT 0,
  `status` enum('active','inactive') DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `bio` varchar(255) DEFAULT NULL,
  `location` varchar(150) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `cover_banner` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `username`, `email`, `phone`, `password`, `role`, `family_id`, `is_verified`, `status`, `created_at`, `updated_at`, `bio`, `location`, `avatar`, `cover_banner`) VALUES
(7, 'Alif', NULL, 'alifmuzakki1110@gmail.com', NULL, '$2y$12$p1Xa7KtNLxBbuAwC5zA0M.9onzWlanm6U0xmGZTw2esQv29r.4hF.', 'member', NULL, 1, 'active', '2026-07-02 06:59:13', '2026-07-02 07:57:00', NULL, NULL, NULL, NULL),
(8, 'Admin Utama', 'admin_samhudi', 'admin@samhudi.com', '081234567890', '$2a$12$qUJSFctXZGQRmgV1vv4Ni.kQtQLVpvcVWtHj252cXFCu/3vMYkltu', 'admin', NULL, 1, 'active', '2026-07-02 10:12:13', '2026-07-14 12:54:55', 'contoh', '', 'assets/uploads/profiles/avatar_8_1784033695.png', 'assets/images/background2.png'),
(18, 'Pege Store', NULL, 'pegestore1110@gmail.com', '0895412735876', '$2y$12$J4UMChXGDTA2PdGrIGXHZOuLX1IKzcEU7lIBGSeNpcTn4NecFojaa', 'member', NULL, 1, 'active', '2026-07-14 10:05:58', '2026-07-14 10:06:50', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wills`
--

CREATE TABLE `wills` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `file_pdf` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `status` enum('private','public') DEFAULT 'private',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wills`
--

INSERT INTO `wills` (`id`, `title`, `content`, `file_pdf`, `created_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Point 1', 'Jagalah selalu hubunganmu dengan Allah SWT. Dirikan shalat lima waktu tepat pada waktunya, tunaikan zakat untuk membersihkan hartamu, dan jadikan Al-Qur\'an sebagai pedoman hidup di setiap langkahmu. Ingatlah bahwa dunia ini hanyalah sementara, sedangkan akhirat adalah tempat kembali yang abadi. Jangan biarkan kesibukan dunia melalaikanmu dari mengingat Sang Pencipta.', NULL, NULL, 'private', '2026-07-14 08:42:30', '2026-07-14 08:42:30'),
(2, 'Point 2', 'Jagalah selalu hubunganmu dengan Allah SWT. Dirikan shalat lima waktu tepat pada waktunya, tunaikan zakat untuk membersihkan hartamu, dan jadikan Al-Qur\'an sebagai pedoman hidup di setiap langkahmu. Ingatlah bahwa dunia ini hanyalah sementara, sedangkan akhirat adalah tempat kembali yang abadi. Jangan biarkan kesibukan dunia melalaikanmu dari mengingat Sang Pencipta.', NULL, NULL, 'private', '2026-07-14 08:42:30', '2026-07-14 08:42:30'),
(3, 'Point 3', 'Jagalah selalu hubunganmu dengan Allah SWT. Dirikan shalat lima waktu tepat pada waktunya, tunaikan zakat untuk membersihkan hartamu, dan jadikan Al-Qur\'an sebagai pedoman hidup di setiap langkahmu. Ingatlah bahwa dunia ini hanyalah sementara, sedangkan akhirat adalah tempat kembali yang abadi. Jangan biarkan kesibukan dunia melalaikanmu dari mengingat Sang Pencipta.', NULL, NULL, 'private', '2026-07-14 08:42:30', '2026-07-14 08:42:30'),
(4, 'Point 4', 'Jagalah selalu hubunganmu dengan Allah SWT. Dirikan shalat lima waktu tepat pada waktunya, tunaikan zakat untuk membersihkan hartamu, dan jadikan Al-Qur\'an sebagai pedoman hidup di setiap langkahmu. Ingatlah bahwa dunia ini hanyalah sementara, sedangkan akhirat adalah tempat kembali yang abadi. Jangan biarkan kesibukan dunia melalaikanmu dari mengingat Sang Pencipta.', NULL, NULL, 'private', '2026-07-14 08:42:30', '2026-07-14 08:42:30'),
(5, 'Point 5', 'Jagalah selalu hubunganmu dengan Allah SWT. Dirikan shalat lima waktu tepat pada waktunya, tunaikan zakat untuk membersihkan hartamu, dan jadikan Al-Qur\'an sebagai pedoman hidup di setiap langkahmu. Ingatlah bahwa dunia ini hanyalah sementara, sedangkan akhirat adalah tempat kembali yang abadi. Jangan biarkan kesibukan dunia melalaikanmu dari mengingat Sang Pencipta.', NULL, NULL, 'private', '2026-07-14 08:42:30', '2026-07-14 08:42:30'),
(6, 'Point 6', 'Jagalah selalu hubunganmu dengan Allah SWT. Dirikan shalat lima waktu tepat pada waktunya, tunaikan zakat untuk membersihkan hartamu, dan jadikan Al-Qur\'an sebagai pedoman hidup di setiap langkahmu. Ingatlah bahwa dunia ini hanyalah sementara, sedangkan akhirat adalah tempat kembali yang abadi. Jangan biarkan kesibukan dunia melalaikanmu dari mengingat Sang Pencipta.', NULL, NULL, 'private', '2026-07-14 08:42:30', '2026-07-14 08:42:30'),
(7, 'Point 7', 'Jagalah selalu hubunganmu dengan Allah SWT. Dirikan shalat lima waktu tepat pada waktunya, tunaikan zakat untuk membersihkan hartamu, dan jadikan Al-Qur\'an sebagai pedoman hidup di setiap langkahmu. Ingatlah bahwa dunia ini hanyalah sementara, sedangkan akhirat adalah tempat kembali yang abadi. Jangan biarkan kesibukan dunia melalaikanmu dari mengingat Sang Pencipta.', NULL, NULL, 'private', '2026-07-14 08:42:30', '2026-07-14 08:42:30'),
(8, 'Point 8', 'Jagalah selalu hubunganmu dengan Allah SWT. Dirikan shalat lima waktu tepat pada waktunya, tunaikan zakat untuk membersihkan hartamu, dan jadikan Al-Qur\'an sebagai pedoman hidup di setiap langkahmu. Ingatlah bahwa dunia ini hanyalah sementara, sedangkan akhirat adalah tempat kembali yang abadi. Jangan biarkan kesibukan dunia melalaikanmu dari mengingat Sang Pencipta.', NULL, NULL, 'private', '2026-07-14 08:42:30', '2026-07-14 08:42:30'),
(9, 'Point 9', 'Jagalah selalu hubunganmu dengan Allah SWT. Dirikan shalat lima waktu tepat pada waktunya, tunaikan zakat untuk membersihkan hartamu, dan jadikan Al-Qur\'an sebagai pedoman hidup di setiap langkahmu. Ingatlah bahwa dunia ini hanyalah sementara, sedangkan akhirat adalah tempat kembali yang abadi. Jangan biarkan kesibukan dunia melalaikanmu dari mengingat Sang Pencipta.', NULL, NULL, 'private', '2026-07-14 08:42:30', '2026-07-14 08:42:30'),
(10, 'Point 10', 'Jagalah selalu hubunganmu dengan Allah SWT. Dirikan shalat lima waktu tepat pada waktunya, tunaikan zakat untuk membersihkan hartamu, dan jadikan Al-Qur\'an sebagai pedoman hidup di setiap langkahmu. Ingatlah bahwa dunia ini hanyalah sementara, sedangkan akhirat adalah tempat kembali yang abadi. Jangan biarkan kesibukan dunia melalaikanmu dari mengingat Sang Pencipta.', NULL, NULL, 'private', '2026-07-14 08:42:30', '2026-07-14 08:42:30'),
(11, 'Point 11', 'Jagalah selalu hubunganmu dengan Allah SWT. Dirikan shalat lima waktu tepat pada waktunya, tunaikan zakat untuk membersihkan hartamu, dan jadikan Al-Qur\'an sebagai pedoman hidup di setiap langkahmu. Ingatlah bahwa dunia ini hanyalah sementara, sedangkan akhirat adalah tempat kembali yang abadi. Jangan biarkan kesibukan dunia melalaikanmu dari mengingat Sang Pencipta.', NULL, NULL, 'private', '2026-07-14 08:42:30', '2026-07-14 08:42:30'),
(12, 'Point 12', 'Jagalah selalu hubunganmu dengan Allah SWT. Dirikan shalat lima waktu tepat pada waktunya, tunaikan zakat untuk membersihkan hartamu, dan jadikan Al-Qur\'an sebagai pedoman hidup di setiap langkahmu. Ingatlah bahwa dunia ini hanyalah sementara, sedangkan akhirat adalah tempat kembali yang abadi. Jangan biarkan kesibukan dunia melalaikanmu dari mengingat Sang Pencipta.', NULL, NULL, 'private', '2026-07-14 08:42:30', '2026-07-14 08:42:30'),
(13, 'Point 13', 'Jagalah selalu hubunganmu dengan Allah SWT. Dirikan shalat lima waktu tepat pada waktunya, tunaikan zakat untuk membersihkan hartamu, dan jadikan Al-Qur\'an sebagai pedoman hidup di setiap langkahmu. Ingatlah bahwa dunia ini hanyalah sementara, sedangkan akhirat adalah tempat kembali yang abadi. Jangan biarkan kesibukan dunia melalaikanmu dari mengingat Sang Pencipta.', NULL, NULL, 'private', '2026-07-14 08:42:30', '2026-07-14 08:42:30'),
(14, 'Point 14', 'Jagalah selalu hubunganmu dengan Allah SWT. Dirikan shalat lima waktu tepat pada waktunya, tunaikan zakat untuk membersihkan hartamu, dan jadikan Al-Qur\'an sebagai pedoman hidup di setiap langkahmu. Ingatlah bahwa dunia ini hanyalah sementara, sedangkan akhirat adalah tempat kembali yang abadi. Jangan biarkan kesibukan dunia melalaikanmu dari mengingat Sang Pencipta.', NULL, NULL, 'private', '2026-07-14 08:42:30', '2026-07-14 08:42:30'),
(15, 'Point 15', 'Jagalah selalu hubunganmu dengan Allah SWT. Dirikan shalat lima waktu tepat pada waktunya, tunaikan zakat untuk membersihkan hartamu, dan jadikan Al-Qur\'an sebagai pedoman hidup di setiap langkahmu. Ingatlah bahwa dunia ini hanyalah sementara, sedangkan akhirat adalah tempat kembali yang abadi. Jangan biarkan kesibukan dunia melalaikanmu dari mengingat Sang Pencipta.', NULL, NULL, 'private', '2026-07-14 08:42:30', '2026-07-14 08:42:30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `families`
--
ALTER TABLE `families`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `family_members`
--
ALTER TABLE `family_members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `family_id` (`family_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `father_id` (`father_id`),
  ADD KEY `mother_id` (`mother_id`);

--
-- Indexes for table `forums`
--
ALTER TABLE `forums`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `forum_comments`
--
ALTER TABLE `forum_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `forum_id` (`forum_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `forum_likes`
--
ALTER TABLE `forum_likes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_like` (`forum_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `forum_saves`
--
ALTER TABLE `forum_saves`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_save` (`forum_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `foundations`
--
ALTER TABLE `foundations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `marriages`
--
ALTER TABLE `marriages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `husband_id` (`husband_id`),
  ADD KEY `wife_id` (`wife_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `receiver_id` (`receiver_id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `author_id` (`author_id`);

--
-- Indexes for table `news_categories`
--
ALTER TABLE `news_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news_category_relation`
--
ALTER TABLE `news_category_relation`
  ADD PRIMARY KEY (`news_id`,`category_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `news_likes`
--
ALTER TABLE `news_likes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_news_like` (`news_id`,`user_id`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_news_id` (`news_id`);

--
-- Indexes for table `otp_codes`
--
ALTER TABLE `otp_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `profile_banners`
--
ALTER TABLE `profile_banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `family_id` (`family_id`);

--
-- Indexes for table `wills`
--
ALTER TABLE `wills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `families`
--
ALTER TABLE `families`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `family_members`
--
ALTER TABLE `family_members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `forums`
--
ALTER TABLE `forums`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `forum_comments`
--
ALTER TABLE `forum_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `forum_likes`
--
ALTER TABLE `forum_likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `forum_saves`
--
ALTER TABLE `forum_saves`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `foundations`
--
ALTER TABLE `foundations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marriages`
--
ALTER TABLE `marriages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `news_categories`
--
ALTER TABLE `news_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `news_likes`
--
ALTER TABLE `news_likes`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `otp_codes`
--
ALTER TABLE `otp_codes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `profile_banners`
--
ALTER TABLE `profile_banners`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `wills`
--
ALTER TABLE `wills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `family_members`
--
ALTER TABLE `family_members`
  ADD CONSTRAINT `family_members_ibfk_1` FOREIGN KEY (`family_id`) REFERENCES `families` (`id`),
  ADD CONSTRAINT `family_members_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `family_members_ibfk_3` FOREIGN KEY (`father_id`) REFERENCES `family_members` (`id`),
  ADD CONSTRAINT `family_members_ibfk_4` FOREIGN KEY (`mother_id`) REFERENCES `family_members` (`id`);

--
-- Constraints for table `forums`
--
ALTER TABLE `forums`
  ADD CONSTRAINT `forums_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `forum_comments`
--
ALTER TABLE `forum_comments`
  ADD CONSTRAINT `forum_comments_ibfk_1` FOREIGN KEY (`forum_id`) REFERENCES `forums` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `forum_comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `forum_comments_ibfk_3` FOREIGN KEY (`parent_id`) REFERENCES `forum_comments` (`id`);

--
-- Constraints for table `forum_likes`
--
ALTER TABLE `forum_likes`
  ADD CONSTRAINT `forum_likes_ibfk_1` FOREIGN KEY (`forum_id`) REFERENCES `forums` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `forum_likes_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `forum_saves`
--
ALTER TABLE `forum_saves`
  ADD CONSTRAINT `forum_saves_ibfk_1` FOREIGN KEY (`forum_id`) REFERENCES `forums` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `forum_saves_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `marriages`
--
ALTER TABLE `marriages`
  ADD CONSTRAINT `marriages_ibfk_1` FOREIGN KEY (`husband_id`) REFERENCES `family_members` (`id`),
  ADD CONSTRAINT `marriages_ibfk_2` FOREIGN KEY (`wife_id`) REFERENCES `family_members` (`id`);

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `news_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `news_category_relation`
--
ALTER TABLE `news_category_relation`
  ADD CONSTRAINT `news_category_relation_ibfk_1` FOREIGN KEY (`news_id`) REFERENCES `news` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `news_category_relation_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `news_categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `otp_codes`
--
ALTER TABLE `otp_codes`
  ADD CONSTRAINT `otp_codes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD CONSTRAINT `password_resets_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`family_id`) REFERENCES `families` (`id`);

--
-- Constraints for table `wills`
--
ALTER TABLE `wills`
  ADD CONSTRAINT `wills_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
