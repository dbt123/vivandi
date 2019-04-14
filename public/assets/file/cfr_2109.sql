-- phpMyAdmin SQL Dump
-- version 4.0.10.10
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 03, 2016 at 06:14 AM
-- Server version: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cfr_2109`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE IF NOT EXISTS `accounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Guest',
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `point` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `acc_register`
--

CREATE TABLE IF NOT EXISTS `acc_register` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `des` text COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fb_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `gg_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `person_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `product_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `why` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=22 ;

--
-- Dumping data for table `acc_register`
--

INSERT INTO `acc_register` (`id`, `name`, `username`, `password`, `des`, `phone`, `address`, `email`, `fb_id`, `gg_id`, `status`, `created_at`, `updated_at`, `person_id`, `product_type`, `why`) VALUES
(14, 'cao phong', 'phong', 'fcea920f7412b5da7be0cf42b8c93759', 'ban hang', '543656546', 'nha 2 so 3', 'caophonggtvt@gmail.com', '', '', 1, '2016-09-21 01:52:01', '2016-09-21 01:53:32', '4654646546', 'thoi trang nam', ''),
(15, 'kimduy', 'kimduy', '7caba91e4ed75b8c8a0f5c26f5654713', 'ok', '1234567890', 'Quỳnh Mai - Hai Bà Trưng - Hà Nội', 'vukimduy592@gmail.com', '', '', 1, '2016-09-21 01:52:58', '2016-09-21 01:53:36', '21324354657687', 'sức khỏe & sắcđẹp', ''),
(16, 'Nguyễn Minh Tuấn', 'fabregasarteta4', 'd7986018752e577038f3ee33064cc4b0', 'Thích', '0962837163', 'Hải Dương', 'MinhTuan.ptit.httt1@gmail.com', '', '', 1, '2016-09-21 01:53:00', '2016-09-21 01:53:40', '142640839', 'Điện Tử', ''),
(17, 'kimduy', 'kimduy1', '21232f297a57a5a743894a0e4a801fc3', 'ok', '1234567890', 'Quỳnh Mai - Hai Bà Trưng - Hà Nội', 'vukimduy592@gmail.com', '', '', 1, '2016-09-21 01:53:16', '2016-09-21 07:13:58', '21324354657687', 'sức khỏe & sắcđẹp', ''),
(18, 'Lê Trọng Tấn', 'tanle', '202cb962ac59075b964b07152d234b70', 'minh thích thì mình đăng ký thôi tha thu mà !!!', '09876qwqwq', 'cầu giấy', 'tanle93@yahoo.com', '', '', 1, '2016-09-21 01:53:35', '2016-09-21 01:55:11', '0987654', 'thời trang nữ', ''),
(19, 'Ba Thin Dinh', 'dbt123', 'e10adc3949ba59abbe56e057f20f883e', 'thichs', '989423639', 'tay ho', 'dinh.thin@hotmail.com', '', '', 1, '2016-09-21 01:54:05', '2016-09-21 01:55:16', '241111465', 'do gia dungg', ''),
(20, 'chu phu hai', 'hai333', '0fedd89c12d06b6e262019b467dd9631', 'Test', '01644844811', 'Minh Khai', 'hai3185593@gmail.com', '', '', 1, '2016-09-21 01:55:58', '2016-09-21 02:01:02', '060959567', 'Xe May, Bach Hoa', ''),
(21, 'Nguyễn Văn Duy', 'duynguyen', 'd7c0f8c192e2995e57e49e3fb2ebedaa', 'abc...', '0962095174', 'Nam Định', 'nguyeexnduy@gmail.com', '', '', 1, '2016-09-21 01:58:11', '2016-09-21 02:00:57', '163341239', 'Thể thao & Du lịch', '');

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE IF NOT EXISTS `admins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `level` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `password`, `phone`, `address`, `level`, `status`, `created_at`, `updated_at`, `email`, `image`) VALUES
(1, 'dev', '21232f297a57a5a743894a0e4a801fc3', '34234234234', 'E5 Quỳnh Mai Hai Bà Trưng Hà Nội', 1, 1, '2016-08-23 04:49:19', '2016-08-23 04:49:19', '', ''),
(2, 'admin', '21232f297a57a5a743894a0e4a801fc3', '34234234234', 'E5 Quỳnh Mai Hai Bà Trưng Hà Nội', 1, 1, '2016-08-23 04:49:19', '2016-08-23 04:49:19', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `admin_log_orders`
--

CREATE TABLE IF NOT EXISTS `admin_log_orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `admin_id` int(10) unsigned NOT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `comment` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_log_orders_admin_id_foreign` (`admin_id`),
  KEY `admin_log_orders_order_id_foreign` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `admin_roles`
--

CREATE TABLE IF NOT EXISTS `admin_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE IF NOT EXISTS `attributes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `type` tinyint(4) NOT NULL,
  `create_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `prefix` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `avaiable` int(11) NOT NULL,
  `init` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=38 ;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `name`, `value`, `type`, `create_by`, `created_at`, `updated_at`, `prefix`, `status`, `avaiable`, `init`) VALUES
(1, 'Màu sắc', '', 1, 0, '2016-08-25 01:48:25', '2016-08-25 01:49:24', 'mau-sac', 1, 0, ''),
(2, 'Khối lượng', '', 1, 0, '2016-08-25 01:48:43', '2016-08-25 01:49:24', 'khoi-luong', 1, 0, ''),
(3, 'Kích cỡ', '', 1, 0, '2016-08-25 01:49:00', '2016-08-25 01:49:24', 'kich-co', 1, 0, ''),
(4, 'Màu sắc', 'Vàng', 0, 0, '2016-09-23 07:31:10', '2016-09-23 07:31:10', '', 0, 0, ''),
(5, 'Màu sắc', 'Cam', 0, 0, '2016-09-23 07:31:10', '2016-09-23 07:31:10', '', 0, 0, ''),
(6, 'Khối lượng', '10', 0, 0, '2016-09-23 07:31:10', '2016-09-23 07:31:10', '', 0, 0, ''),
(7, 'Kích cỡ', 'XL', 0, 0, '2016-09-23 07:31:10', '2016-09-23 07:31:10', '', 0, 0, ''),
(8, 'Màu sắc', 'Trắng', 0, 0, '2016-09-23 07:41:57', '2016-09-23 07:41:57', '', 0, 0, ''),
(9, 'Màu sắc', 'Hồng', 0, 0, '2016-09-23 07:41:57', '2016-09-23 07:41:57', '', 0, 0, ''),
(10, 'Màu sắc', 'Xanh', 0, 0, '2016-09-23 07:42:16', '2016-09-23 07:42:16', '', 0, 0, ''),
(11, 'Khối lượng', '13', 0, 0, '2016-09-23 07:42:31', '2016-09-23 07:42:31', '', 0, 0, ''),
(12, 'Chiều cao', '', 1, 0, '2016-09-23 08:13:35', '2016-09-23 08:13:37', 'chieu-cao', 1, 1, 'm'),
(28, 'Chiều cao', '99', 0, 0, '2016-09-26 02:34:44', '2016-09-26 02:34:44', '', 0, 1, 'm'),
(29, 'Chiều cao', '111', 0, 0, '2016-09-26 02:40:41', '2016-09-26 02:40:41', '', 0, 1, 'm'),
(30, 'Màu sắc', 'asad', 0, 0, '2016-09-26 02:46:28', '2016-09-26 02:46:28', '', 0, 0, ''),
(31, 'Khối lượng', 'ád', 0, 0, '2016-09-26 02:46:29', '2016-09-26 02:46:29', '', 0, 0, ''),
(32, 'Kích cỡ', 'ád', 0, 0, '2016-09-26 02:46:29', '2016-09-26 02:46:29', '', 0, 0, ''),
(34, 'Khối lượng', 'Đỏ', 0, 0, '2016-09-26 02:52:03', '2016-09-26 02:52:03', '', 0, 0, ''),
(35, 'Chiều cao', '144', 0, 0, '2016-09-26 03:47:23', '2016-09-26 03:47:23', '', 0, 1, 'm'),
(36, 'Chiều cao', '55', 0, 0, '2016-09-26 03:47:54', '2016-09-26 03:47:54', '', 0, 1, 'm'),
(37, 'Chiều cao', '25', 0, 0, '2016-09-26 04:16:32', '2016-09-26 04:16:32', '', 0, 1, 'm');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `prefix` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `level` smallint(6) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `status` smallint(6) NOT NULL,
  `editable` int(11) NOT NULL,
  `create_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `prefix`, `img`, `description`, `level`, `parent_id`, `status`, `editable`, `create_by`, `created_at`, `updated_at`) VALUES
(1, 'CUSTOMER SERVICE', 'customer-service', '', '', 0, 0, 0, 1, 0, '2016-09-27 07:06:39', '2016-09-27 07:52:17'),
(2, 'CORPORATION', 'corporation', '', '', 0, 0, 0, 1, 0, '2016-09-27 07:06:45', '2016-09-27 07:52:14'),
(3, 'WHY CHOOSE US', 'why-choose-us', '', '', 0, 0, 0, 1, 0, '2016-09-27 07:06:50', '2016-09-27 07:52:17'),
(4, 'LATEST FORM BLOG', 'latest-form-blog', '', '', 0, 0, 0, 1, 0, '2016-09-27 07:49:42', '2016-09-27 07:52:13');

-- --------------------------------------------------------

--
-- Table structure for table `category_products`
--

CREATE TABLE IF NOT EXISTS `category_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `prefix` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `level` smallint(6) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `status` smallint(6) NOT NULL,
  `editable` int(11) NOT NULL,
  `create_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `thumb_images` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=63 ;

--
-- Dumping data for table `category_products`
--

INSERT INTO `category_products` (`id`, `name`, `prefix`, `img`, `description`, `level`, `parent_id`, `status`, `editable`, `create_by`, `created_at`, `updated_at`, `thumb_images`) VALUES
(1, 'HOT DEALS', 'hot-deals', '', 'Danh mục hiển thị ngoài trang chủ không thể xóa ', 0, 0, 0, 1, 0, '2016-08-23 04:51:44', '2016-08-25 01:53:53', ''),
(2, 'SPECIAL OFFER', 'special-offer', '', 'Không thể xóa vì danh mục là danh mục mặc định', 0, 0, 0, 1, 0, '2016-08-23 04:52:25', '2016-08-25 01:54:08', ''),
(3, 'SPECIAL DEALS', 'special-deals', '', 'Không thể xóa vì là danh mục mặc định', 0, 0, 0, 1, 0, '2016-08-23 04:52:48', '2016-08-25 01:54:26', ''),
(4, 'NEW PRODUCTS', 'new-products', '', '', 0, 0, 0, 1, 0, '2016-08-23 05:00:18', '2016-08-25 01:54:42', ''),
(6, 'FEATURED PRODUCTS', 'featured-products', '', '', 0, 0, 0, 1, 0, '2016-08-23 05:01:05', '2016-08-25 01:55:19', ''),
(7, 'BEST SELLER', 'best-seller', '', '', 0, 0, 0, 1, 0, '2016-08-23 05:01:12', '2016-08-25 03:54:13', ''),
(19, 'Điện tử', 'dien-tu', '', '', 0, 0, 0, 0, 0, '2016-09-21 01:57:34', '2016-09-21 01:57:34', ''),
(20, 'Thời trang nữ', 'thoi-trang-nu', '', '', 0, 0, 0, 0, 0, '2016-09-21 01:57:45', '2016-09-21 01:57:45', ''),
(21, 'Thời trang nam', 'thoi-trang-nam', '', '', 0, 0, 0, 0, 0, '2016-09-21 01:57:54', '2016-09-21 01:57:54', ''),
(22, 'Nhà cửa & đời sống', 'nha-cua-doi-song', '', '', 0, 0, 0, 0, 0, '2016-09-21 01:58:28', '2016-09-21 01:58:28', ''),
(23, 'Sức khỏe & sắc đẹp', 'suc-khoe-sac-dep', '', '', 0, 0, 0, 0, 0, '2016-09-21 01:58:43', '2016-09-21 01:58:43', ''),
(24, 'Xe máy & bách hóa', 'xe-may-bach-hoa', '', '', 0, 0, 0, 0, 0, '2016-09-21 02:01:40', '2016-09-21 02:01:40', ''),
(26, 'Túi xách nữ', 'tui-xach-nu', '', 'Túi đẹp cho chị em', 0, 20, 0, 0, 0, '2016-09-21 02:01:58', '2016-09-21 02:01:58', ''),
(28, 'Điện Thoại', 'dien-thoai', '', '', 0, 19, 0, 0, 0, '2016-09-21 02:04:14', '2016-09-21 02:04:14', ''),
(29, 'Trang Điểm', 'trang-diem', '', '', 0, 23, 0, 0, 0, '2016-09-21 02:04:27', '2016-09-21 02:15:36', ''),
(30, 'Đầm nữ', 'dam-nu', '', 'đầm nữ đẹp', 0, 20, 0, 0, 0, '2016-09-21 02:04:31', '2016-09-21 02:04:31', ''),
(31, 'Chăm sóc mặt', 'cham-soc-mat', '', '', 0, 23, 0, 0, 0, '2016-09-21 02:04:44', '2016-09-21 02:18:31', ''),
(32, 'Máy Tính Bảng', 'may-tinh-bang', '', '', 0, 19, 0, 0, 0, '2016-09-21 02:04:56', '2016-09-21 02:04:56', ''),
(33, 'Nước hoa', 'nuoc-hoa', '', '', 0, 23, 0, 0, 0, '2016-09-21 02:05:00', '2016-09-21 02:16:07', ''),
(34, 'Áo thun nữ', 'ao-thun-nu', '', 'Áo thun nữ đẹp', 0, 20, 0, 0, 0, '2016-09-21 02:05:13', '2016-09-21 02:05:13', ''),
(35, 'Chăm sóc tóc', 'cham-soc-toc', '', '', 0, 23, 0, 0, 0, '2016-09-21 02:05:19', '2016-09-21 02:18:51', ''),
(36, 'Laptop', 'laptop', '', '', 0, 19, 0, 0, 0, '2016-09-21 02:05:25', '2016-09-21 02:05:25', ''),
(37, 'Chân váy', 'chan-vay', '', 'chân váy đẹp', 0, 20, 0, 0, 0, '2016-09-21 02:05:43', '2016-09-21 02:05:43', ''),
(38, 'Chăm sóc toàn thân', 'cham-soc-toan-than', '', '', 0, 23, 0, 0, 0, '2016-09-21 02:05:43', '2016-09-21 02:19:13', ''),
(39, 'Phụ kiện & sim thẻ cào', 'phu-kien-sim-the-cao', '', '', 0, 0, 0, 0, 0, '2016-09-21 02:06:05', '2016-09-21 02:06:05', ''),
(40, 'Quần sooc nữ', 'quan-sooc-nu', '', 'sooc nữ đẹp', 0, 20, 0, 0, 0, '2016-09-21 02:06:10', '2016-09-21 02:06:10', ''),
(41, 'Thể thao & du lịch', 'the-thao-du-lich', '', '', 0, 0, 0, 0, 0, '2016-09-21 02:06:26', '2016-09-21 02:06:26', ''),
(42, 'Đồ dùng nhà bếp và văn phòng', 'do-dung-nha-bep-va-van-phong', '', '', 0, 22, 0, 0, 0, '2016-09-21 02:07:59', '2016-09-21 02:07:59', ''),
(43, 'máy ảnh và máy quay phim', 'may-anh-va-may-quay-phim', '', '', 0, 0, 0, 0, 0, '2016-09-21 02:08:38', '2016-09-21 02:08:38', ''),
(44, 'Dụng cụ & Thiết bị gia đình', 'dung-cu-thiet-bi-gia-dinh', '', '', 0, 22, 0, 0, 0, '2016-09-21 02:09:25', '2016-09-21 02:09:25', ''),
(45, 'Chăm sóc ô tô & xe máy', 'cham-soc-o-to-xe-may', '', '', 0, 24, 0, 0, 0, '2016-09-21 02:16:01', '2016-09-21 02:16:01', ''),
(46, 'Phụ kiện bên ngoài', 'phu-kien-ben-ngoai', '', '', 0, 24, 0, 0, 0, '2016-09-21 02:16:59', '2016-09-21 02:18:41', ''),
(48, 'Máy tập thể hình', 'may-tap-the-hinh', '', '', 0, 41, 0, 0, 0, '2016-09-21 02:18:28', '2016-09-21 02:18:28', ''),
(49, 'Máy tập thể lực', 'may-tap-the-luc', '', '', 0, 41, 0, 0, 0, '2016-09-21 02:18:56', '2016-09-21 02:18:56', ''),
(50, 'Phụ kiện', 'phu-kien', '', '', 0, 41, 0, 0, 0, '2016-09-21 02:19:22', '2016-09-21 02:19:22', ''),
(51, 'Phụ kiện bên trong', 'phu-kien-ben-trong', '', '', 0, 24, 0, 0, 0, '2016-09-21 02:19:28', '2016-09-21 02:19:28', ''),
(52, 'Tạ', 'ta', '', '', 0, 41, 0, 0, 0, '2016-09-21 02:19:30', '2016-09-21 02:19:30', ''),
(53, 'Yoga', 'yoga', '', '', 0, 41, 0, 0, 0, '2016-09-21 02:19:42', '2016-09-21 02:19:42', ''),
(54, 'Linh kiện thay thế', 'linh-kien-thay-the', '', '', 0, 24, 0, 0, 0, '2016-09-21 02:21:01', '2016-09-21 02:21:01', ''),
(55, 'Xe mô tô & xe địa hình', 'xe-mo-to-xe-dia-hinh', '', '', 0, 24, 0, 0, 0, '2016-09-21 02:21:26', '2016-09-21 02:21:26', ''),
(56, 'Áo khoác nam', 'ao-khoac-nam', '', '', 0, 21, 0, 0, 0, '2016-09-21 02:27:00', '2016-09-21 02:27:00', ''),
(57, 'Giày công sở', 'giay-cong-so', '', '', 0, 21, 0, 0, 0, '2016-09-21 02:27:16', '2016-09-21 02:27:16', ''),
(58, 'Kính mát nam', 'kinh-mat-nam', '', '', 0, 21, 0, 0, 0, '2016-09-21 02:27:40', '2016-09-21 02:27:40', ''),
(59, 'Túi xách công sở', 'tui-xach-cong-so', '', '', 0, 21, 0, 0, 0, '2016-09-21 02:27:55', '2016-09-21 02:27:55', ''),
(60, 'Vòng tay nam', 'vong-tay-nam', '', '', 0, 21, 0, 0, 0, '2016-09-21 02:28:09', '2016-09-21 02:28:09', ''),
(61, 'MÁY ẢNH & MÁY QUAY PHIM HD', 'may-anh-may-quay-phim-hd', '', '', 0, 19, 0, 0, 0, '2016-09-21 02:51:29', '2016-09-21 02:51:29', ''),
(62, 'Phụ kiện & sim thẻ cào vip', 'phu-kien-sim-the-cao-vip', '', '', 0, 19, 0, 0, 0, '2016-09-21 02:51:55', '2016-09-21 02:51:55', '');

-- --------------------------------------------------------

--
-- Table structure for table `comment_posts`
--

CREATE TABLE IF NOT EXISTS `comment_posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_guest` int(11) NOT NULL DEFAULT '1',
  `account_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `comment` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `rating` decimal(3,2) NOT NULL,
  `comment_admin` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `comment_products`
--

CREATE TABLE IF NOT EXISTS `comment_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_guest` int(11) NOT NULL DEFAULT '1',
  `account_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `comment` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `rating` decimal(3,2) NOT NULL,
  `comment_admin` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE IF NOT EXISTS `contacts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` tinyint(4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `contents`
--

CREATE TABLE IF NOT EXISTS `contents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `rank` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `contents`
--

INSERT INTO `contents` (`id`, `post_id`, `description`, `content`, `name`, `rank`, `created_at`, `updated_at`) VALUES
(1, 1, '', '', '1', 1, '2016-09-27 07:31:07', '2016-09-27 07:31:35'),
(2, 2, '', '', '', 1, '2016-09-27 07:37:08', '2016-09-27 07:37:08'),
(3, 3, '', '<p>ádfasdfas</p>', '', 1, '2016-09-27 07:53:35', '2016-09-27 09:07:43');

-- --------------------------------------------------------

--
-- Table structure for table `content_products`
--

CREATE TABLE IF NOT EXISTS `content_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `rank` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `json_attr` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `content_products_product_id_foreign` (`product_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=100 ;

--
-- Dumping data for table `content_products`
--

INSERT INTO `content_products` (`id`, `product_id`, `description`, `content`, `name`, `rank`, `created_at`, `updated_at`, `json_attr`) VALUES
(13, 10, '', '<table class="table table-bordered" id="tblGeneralAttribute" style="box-sizing: border-box; background-color: rgb(255, 255, 255); width: 976px; margin-bottom: 20px; border-color: rgb(238, 238, 238); color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 13px;"><tbody style="box-sizing: border-box;"><tr class="row-info" style="box-sizing: border-box;"><td style="box-sizing: border-box; padding: 8px; line-height: 20px; border-color: rgb(238, 238, 238); width: 200px; background-color: rgb(247, 247, 247) !important;"><span style="box-sizing: border-box; font-family: Roboto-Medium, sans-serif;">Khối lượng</span></td><td style="box-sizing: border-box; padding: 8px; line-height: 20px; border-color: rgb(238, 238, 238);">4(g)</td></tr><tr class="row-info" style="box-sizing: border-box;"><td style="box-sizing: border-box; padding: 8px; line-height: 20px; border-color: rgb(238, 238, 238); width: 200px; background-color: rgb(247, 247, 247) !important;"><span style="box-sizing: border-box; font-family: Roboto-Medium, sans-serif;">Hướng dẫn bảo quản</span></td><td style="box-sizing: border-box; padding: 8px; line-height: 20px; border-color: rgb(238, 238, 238);">Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp và nhiệt độ cao</td></tr><tr class="row-info" style="box-sizing: border-box;"><td style="box-sizing: border-box; padding: 8px; line-height: 20px; border-color: rgb(238, 238, 238); width: 200px; background-color: rgb(247, 247, 247) !important;"><span style="box-sizing: border-box; font-family: Roboto-Medium, sans-serif;">Hạn sử dụng</span></td><td style="box-sizing: border-box; padding: 8px; line-height: 20px; border-color: rgb(238, 238, 238);">5 năm từ ngày sản xuất</td></tr><tr class="row-info" style="box-sizing: border-box;"><td style="box-sizing: border-box; padding: 8px; line-height: 20px; border-color: rgb(238, 238, 238); width: 200px; background-color: rgb(247, 247, 247) !important;"><span style="box-sizing: border-box; font-family: Roboto-Medium, sans-serif;">Thành phần</span></td><td style="box-sizing: border-box; padding: 8px; line-height: 20px; border-color: rgb(238, 238, 238);">Hydrogenated Polydecene, Polyglyceryl-2 Triisostearate, Hydrogenated Polyisobutene, Diphenylsiloxy Phenyl Trimethicone, Dipentaerythrityl Hexahydroxystearate</td></tr><tr class="row-info" style="box-sizing: border-box;"><td style="box-sizing: border-box; padding: 8px; line-height: 20px; border-color: rgb(238, 238, 238); width: 200px; background-color: rgb(247, 247, 247) !important;"><span style="box-sizing: border-box; font-family: Roboto-Medium, sans-serif;">Xuất xứ</span></td><td style="box-sizing: border-box; padding: 8px; line-height: 20px; border-color: rgb(238, 238, 238);">Nhật Bản</td></tr><tr class="row-info" style="box-sizing: border-box;"><td style="box-sizing: border-box; padding: 8px; line-height: 20px; border-color: rgb(238, 238, 238); width: 200px; background-color: rgb(247, 247, 247) !important;"><span style="box-sizing: border-box; font-family: Roboto-Medium, sans-serif;">Màu sắc</span></td><td style="box-sizing: border-box; padding: 8px; line-height: 20px; border-color: rgb(238, 238, 238);">Đỏ</td></tr></tbody></table>', '', 1, '2016-09-21 02:25:20', '2016-09-21 02:25:20', ''),
(16, 13, 'Fullbox', '<p><br>Máy tính xách tay mới nhất của HP, Spectre 13 chỉ dày 10,4mm, mỏng hơn cả MacBook của Apple (13,2mm) và XPS của Dell 13 (15,2mm), giữ vị trí mỏng nhất hiện tại. Không chỉ vậy, sản phẩm còn mang nét khác biệt lẫn độc đáo trong thiết kế, tạo được dấu ấn riêng trong thị trường latop vốn đã có nhiều sản phẩm nổi bật hiện nay.<br></p>', 'Fullbox', 1, '2016-09-21 02:29:06', '2016-09-21 02:29:06', ''),
(17, 13, '', '', '', 2, '2016-09-21 02:29:06', '2016-09-21 02:29:06', ''),
(18, 14, '', '<h2 class="product-description__title" style="margin-right: 0px; margin-bottom: 17px; margin-left: 0px; padding: 0px; font-weight: 700; font-size: 16px; line-height: 2.4rem; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif;">iới thiệu sản phẩm Khuôn làm Sushi chuyên dụng Perfect Roll Sushi (Đen)</h2><div class="product-description__webyclip-thumbnails" style="margin: 0px 0px 15px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><div class="webyclip-thumbnails" id="webyclip_thumbnails" style="margin: 0px; padding: 0px;"></div></div><p><span style="color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;">Nhà phân phối cho deal 24h uy tín dành 4 đảm bảo cho quý khách khi mua các sản phẩm của chúng tôi</span><br style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 14.4px;"><span style="color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;">     1. Chọn lọc sản phẩm khắt khe trước khi giao hàng: Chúng tôi muốn đưa tới cho quý khách sản phẩm chất lượng tốt nhất </span><br style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 14.4px;"><span style="color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;">     2. Đóng gói sản phẩm chắc chắn: Nhờ đó sản phẩm sẽ giữ nguyên trạng chất lượng sản phẩm tới tay khách hàng. </span><br style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 14.4px;"><span style="color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;">     3. Cam kết giá rẻ nhất dành cho quý khách hàng: Chúng tôi muốn khách hàng hài lòng nhất với mức chi phí thấp nhất.</span><br style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 14.4px;"><span style="color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;">     4. Miễn phí vận chuyển toàn quốc.</span><br style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 14.4px;"><iframe width="560" height="315" src="http://www.youtube.com/embed/tpAw0VCUgm0" style="margin: 0px; padding: 0px; max-width: 100%; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 14.4px;"></iframe><br style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 14.4px;"></p><div style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 14.4px;"><span style="margin: 0px; padding: 0px; font-weight: 700;">ĐẶC ĐIỂM NỔI BẬT </span></div><p><span style="color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;">- Máy làm sushi giúp bạn dễ dàng tạo ra những miếng sushi hấp dẫn một cách nhanh nhất.- Sử dụng nguyên liệu chế biến đa dạng, đáp ứng nhiều yêu cầu, khẩu vị khác nhau.- Kích thước hộp: 21x11x8 cm- Chất liệu: Nhựa.- Xuất xứ: Trung Quốc.   </span><br style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 14.4px;"><img class="productlazyimage" alt="42325_0_body_5_zps8c4b7620.jpg" data-original="http://i1292.photobucket.com/albums/b567/Hoquangtien90/42325_0_body_5_zps8c4b7620.jpg" src="http://i1292.photobucket.com/albums/b567/Hoquangtien90/42325_0_body_5_zps8c4b7620.jpg" style="margin: 0px; padding: 0px; max-width: 100%; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 14.4px; display: inline;"><br style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 14.4px;"><span style="color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;">- Các bước sử dụng -</span><br style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 14.4px;"><img class="productlazyimage" alt="makis-saumon-avocat-avocado-salmon-sushi" data-original="http://i1292.photobucket.com/albums/b567/Hoquangtien90/makis-saumon-avocat-avocado-salmon-sushi-rolls-1-of-1-2_zps2f942b59.jpg" src="http://i1292.photobucket.com/albums/b567/Hoquangtien90/makis-saumon-avocat-avocado-salmon-sushi-rolls-1-of-1-2_zps2f942b59.jpg" style="margin: 0px; padding: 0px; max-width: 100%; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 14.4px; display: inline;"><br style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 14.4px;"><img class="productlazyimage" alt="khuon-lam-sushi-01_zpsb495d93e.jpg" data-original="http://i1292.photobucket.com/albums/b567/Hoquangtien90/khuon-lam-sushi-01_zpsb495d93e.jpg" src="http://i1292.photobucket.com/albums/b567/Hoquangtien90/khuon-lam-sushi-01_zpsb495d93e.jpg" style="margin: 0px; padding: 0px; max-width: 100%; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 14.4px; display: inline;"><br></p>', '', 1, '2016-09-21 02:29:54', '2016-09-21 02:44:53', ''),
(19, 15, '', '<div class="tab-content active" id="tab_content_product_introduction" style="box-sizing: border-box; padding-top: 8px; padding-bottom: 16px; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 13px;"><h3 style="box-sizing: border-box; font-family: Roboto-Medium, sans-serif; line-height: 1.4; color: rgb(17, 17, 17); margin-bottom: 10px; font-size: 16px;">Phấn mắt Essance Natural Eyes Shadow màu hồng #1</h3><p style="box-sizing: border-box; margin-right: 0px; margin-bottom: 8px; margin-left: 0px;">Phấn mắt Essance Natural Eyes Shadow màu hồng #1 với các hạt phấn mịn có độ bám cao, tăng khả năng giữ màu phấn. Đồng thời, chiết xuất Vitamin E giúp giữ ẩm cho da, mang đến cho bạn đôi mắt đẹp tự nhiên, lôi cuốn và vùng da quanh mắt luôn mịn màng, mềm mại. </p><p style="box-sizing: border-box; margin-right: 0px; margin-bottom: 8px; margin-left: 0px;">Hướng dẫn sử dụng và bảo quản</p><ul style="box-sizing: border-box; margin-bottom: 10px;"><li style="box-sizing: border-box;">Dùng cọ lấy một lượng phấn vừa đủ thoa lên mắt</li><li style="box-sizing: border-box;">Đậy nắp sau khi dùng</li><li style="box-sizing: border-box;">Bảo quản nơi khô ráo, thoáng mát, tránh ánh nhiệt độ cao</li></ul><p style="box-sizing: border-box; margin-right: 0px; margin-bottom: 8px; margin-left: 0px;">Thông tin thương hiệu</p><p style="box-sizing: border-box; margin-right: 0px; margin-bottom: 8px; margin-left: 0px;">Essance là một trong những thương hiệu mỹ phẩm thuộc tập đoàn mỹ phẩm xuyên quốc gia LG Vina. LG Vina ra đời từ sự hợp tác giữa công ty LG Household and Health Care Hàn Quốc và Công ty dầu thực vật hương liệu Mỹ phẩm miền Nam Việt Nam, chuyên sản xuất kinh doanh các loại mỹ phẩm, dầu gội, sản phẩm tẩy rửa gia dụng cao cấp với mục đích chăm sóc sức khỏe và làm đẹp cho người tiêu dùng. Sản phẩm của công ty bao gồm: Sản phẩm dưỡng da, trang điểm, tạo mùi thơm, sản phẩm làm sạch và chăm sóc tóc, sản phẩm làm sạch và chăm sóc răng miệng, xà phòng tắm và một số sản phẩm tẩy rửa gia dụng... thuộc một số thương hiệu nổi tiếng như Essance, E’Z UP, Double Rich, O HUI, Whoo…</p><div><br></div></div>', '', 1, '2016-09-21 02:30:00', '2016-09-21 02:44:47', ''),
(20, 16, 'Bảo hành', '<p><span class="prod-warranty__term" style="margin: 0px; padding: 0px; font-weight: 700; color: rgb(58, 67, 70); font-family: Helvetica, Arial, sans-serif; font-size: 13px;">6 tháng</span><span style="color: rgb(58, 67, 70); font-family: Helvetica, Arial, sans-serif; font-size: 13px;"> </span><span class="prod-warranty__type" style="margin: 0px; padding: 0px; color: rgb(58, 67, 70); font-family: Helvetica, Arial, sans-serif; font-size: 13px;">Bảo hành điện tử</span><br></p>', 'Bảo hành', 1, '2016-09-21 02:30:19', '2016-09-21 02:38:07', ''),
(21, 17, '', '<p><b>THÔNG TIN SẢN PHẨM</b></p><p>\r\n<br></p><p><b>Đặc tính nổi bật:</b><br>\r\n- Giúp hồi phục như mới và bảo vệ nội thất xe hơi.<br>\r\n- Chuyên dùng cho taplo, ghế ngồi, viền cửa, ốp cửa, lốp (vỏ)\r\nxe...<br>\r\n- Tác dụng kéo dài hơn bất kỳ sản phẩm nào tương tự trên thị\r\ntrường.<br>\r\n- Sản phẩm tạo ra lớp bảo vệ đặc biệt, chống tia UV và các điều\r\nkiện thời tiết khắc nghiệt, đồng thời làm sáng bóng như mới.<br>\r\n- Tự khô sau khi xịt do không chứa silicon, nên không bám dính bụi\r\nbẩn sau khi xịt.<br>\r\n- Sử dụng được cho bề mặt là nhựa, nỉ, da, cao su...<br>\r\n- Dễ dàng sử dụng.<br>\r\n- Có thể dùng để hồi phục và bảo vệ các đồ dùng như giày, dép,\r\nvali...</p><p>\r\n<br></p><p><b>Hướng dẫn sử dụng:</b><br>\r\n- Lắc đều bình, xịt lên giẻ sạch và mềm, sau đó lau bề mặt cần bảo\r\nvệ và làm bóng.<br>\r\n- Dung dịch sẽ tự khô.<br>\r\n- Để xa tầm tay trẻ em.</p><p>\r\n<br></p>', 'Giới thiệu sản phẩm Dung dịch bảo vệ & phục hồi sáng bóng nội thất xe hơi Nu Finish Vinyl NV-300 473ml', 1, '2016-09-21 02:30:27', '2016-09-21 02:35:36', ''),
(22, 18, 'Thông tin', '<div style="margin: 0px 0px 10px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 19.2px;">Thiết kế tinh tế với cổ bẻ, tay dài, đính nút bản to nổi bật, cá tính, form dáng khỏe khoắn cho bạn phong cách trẻ trung, chỉnh chu và không kém phần lịch lãm.</div><div style="margin: 0px 0px 10px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 19.2px;">Kiểu dáng thời trang, đường chỉ may tỉ mỉ, tinh tế.</div><div style="margin: 0px 0px 10px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 19.2px;">Màu sắc trang nhã dễ dàng mix cùng các trang phục khác như áo thun, áo sơ mi,...</div><div style="margin: 0px 0px 10px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 19.2px;">Người bạn đồng hành lý tưởng cho bạn phong cách hoàn hảo.</div><div style="margin: 0px 0px 10px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 19.2px;">Chất liệu: Kaki + lớp dù lót</div><div style="margin: 0px 0px 10px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 19.2px;">Size: M: <55kg , L: 56 - 65kg , XL: 65 - 70kg</div>', 'Thông tin', 1, '2016-09-21 02:31:02', '2016-09-21 02:44:33', ''),
(23, 19, '', '<p><br>Máy tính xách tay mới nhất của HP, Spectre 13 chỉ dày 10,4mm, mỏng hơn cả MacBook của Apple (13,2mm) và XPS của Dell 13 (15,2mm), giữ vị trí mỏng nhất hiện tại. Không chỉ vậy, sản phẩm còn mang nét khác biệt lẫn độc đáo trong thiết kế, tạo được dấu ấn riêng trong thị trường latop vốn đã có nhiều sản phẩm nổi bật hiện nay.<br></p>', '', 1, '2016-09-21 02:31:16', '2016-09-21 02:31:16', ''),
(24, 20, '', '<table class="table table-bordered" id="tblGeneralAttribute" style="box-sizing: border-box; background-color: rgb(255, 255, 255); width: 976px; margin-bottom: 20px; border-color: rgb(238, 238, 238); color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 13px;"><tbody style="box-sizing: border-box;"><tr class="row-info" style="box-sizing: border-box;"><td style="box-sizing: border-box; padding: 8px; line-height: 20px; border-color: rgb(238, 238, 238); width: 200px; background-color: rgb(247, 247, 247) !important;"><span style="box-sizing: border-box; font-family: Roboto-Medium, sans-serif;">Thành phần</span></td><td style="box-sizing: border-box; padding: 8px; line-height: 20px; border-color: rgb(238, 238, 238);">Cồn, hương liệu, nước khử ion</td></tr><tr class="row-info" style="box-sizing: border-box;"><td style="box-sizing: border-box; padding: 8px; line-height: 20px; border-color: rgb(238, 238, 238); width: 200px; background-color: rgb(247, 247, 247) !important;"><span style="box-sizing: border-box; font-family: Roboto-Medium, sans-serif;">Kiểu dáng</span></td><td style="box-sizing: border-box; padding: 8px; line-height: 20px; border-color: rgb(238, 238, 238);">Lọ</td></tr><tr class="row-info" style="box-sizing: border-box;"><td style="box-sizing: border-box; padding: 8px; line-height: 20px; border-color: rgb(238, 238, 238); width: 200px; background-color: rgb(247, 247, 247) !important;"><span style="box-sizing: border-box; font-family: Roboto-Medium, sans-serif;">Hạn sử dụng</span></td><td style="box-sizing: border-box; padding: 8px; line-height: 20px; border-color: rgb(238, 238, 238);">4 năm kể từ ngày sản xuất</td></tr><tr class="row-info" style="box-sizing: border-box;"><td style="box-sizing: border-box; padding: 8px; line-height: 20px; border-color: rgb(238, 238, 238); width: 200px; background-color: rgb(247, 247, 247) !important;"><span style="box-sizing: border-box; font-family: Roboto-Medium, sans-serif;">Quy cách đóng gói</span></td><td style="box-sizing: border-box; padding: 8px; line-height: 20px; border-color: rgb(238, 238, 238);">Hộp</td></tr><tr class="row-info" style="box-sizing: border-box;"><td style="box-sizing: border-box; padding: 8px; line-height: 20px; border-color: rgb(238, 238, 238); width: 200px; background-color: rgb(247, 247, 247) !important;"><span style="box-sizing: border-box; font-family: Roboto-Medium, sans-serif;">Màu sắc</span></td><td style="box-sizing: border-box; padding: 8px; line-height: 20px; border-color: rgb(238, 238, 238);">Xanh biển</td></tr><tr class="row-info" style="box-sizing: border-box;"><td style="box-sizing: border-box; padding: 8px; line-height: 20px; border-color: rgb(238, 238, 238); width: 200px; background-color: rgb(247, 247, 247) !important;"><span style="box-sizing: border-box; font-family: Roboto-Medium, sans-serif;">Dung tích</span></td><td style="box-sizing: border-box; padding: 8px; line-height: 20px; border-color: rgb(238, 238, 238);">50 (ml)</td></tr></tbody></table>', '', 1, '2016-09-21 02:31:43', '2016-09-21 02:31:43', ''),
(26, 22, '', '<h2 class="product-description__title" style="margin-right: 0px; margin-bottom: 17px; margin-left: 0px; padding: 0px; font-weight: 700; font-size: 16px; line-height: 2.4rem; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif;">Giới thiệu sản phẩm Bộ nồi Amberline 1.5L và 3L Luminarc LR2050 (Thủy tinh)</h2><div class="product-description__webyclip-thumbnails" style="margin: 0px 0px 15px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><div class="webyclip-thumbnails" id="webyclip_thumbnails" style="margin: 0px; padding: 0px;"></div></div><div style="margin: 0px 0px 10px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><span style="margin: 0px; padding: 0px; font-weight: 700;">GIỚI THIỆU SẢN PHẨM</span></div><p><br style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><span style="color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;">- Bộ nồi thủy tinh Luminarc LR2050 dung tích 1.5 và 3 lít</span><br style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><span style="color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;">- Bạn có thể thoải mái chế biến và nấu các món ăn ưa thích cho gia đình.</span><br style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><span style="color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;">- Thiết kế sang trọng với chất liệu thủy tinh cao cấp, chịu sốc nhiệt và chịu va đập tốt</span><br style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><span style="color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;">- Mang lại tiện ích nấu ăn</span><br style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><span style="color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;">- Đảm bảo tính an toàn khi sử dụng nồi.</span><br style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><span style="color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;">- Việc lau rửa nồi cũng hoàn toàn dễ dàng bởi khả năng chống bám bụi và dễ chùi rửa của chất liệu.</span><br style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><span style="color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;">- Đặc biệt, thân nồi được bảo hành 10 năm để đảm bảo về độ bền và chất lượng của nồi.</span><br style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"></p><div style="margin: 0px 0px 10px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><span style="margin: 0px; padding: 0px; font-weight: 700;">ĐẶC ĐIỂM NỔI BẬT</span></div><p><span style="margin: 0px; padding: 0px; font-weight: 700; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;">Thiết kế tiện lợi</span><br style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><br style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><span style="color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;">- Miệng nồi được thiết kế đặc biệt hạn chế rõ nước theo thành nồi khi nghiêng nồi</span><br style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><span style="color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;">- Tay cầm được thiết kế để cầm nắm dễ dàng và chắc chắn</span><br style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><br style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><span style="margin: 0px; padding: 0px; font-weight: 700; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;">Thủy tinh cao cấp</span><br style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><br style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><span style="color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;">- Nồi được làm từ chất liệu thủy tinh màu hổ phách,</span><br style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><span style="color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;">- Mang tính thẩm mỹ cao</span><br style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><span style="color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;">- Bạn cũng sẽ dễ dàng quan sát thực phẩm bên trong ngay trong khi nấu.</span><br style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><br style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><span style="margin: 0px; padding: 0px; font-weight: 700; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;">Chống bám bẩn</span><br style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><br style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><span style="color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;">- Chất liệu dễ chùi rửa, mang tính an toàn vệ sinh cao.</span><br style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><span style="color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;">- Việc vệ sinh nồi sẽ trở nên dễ dàng và nhanh chóng hơn với ngay cả khi chế biến thực phẩm chứa dầu mỡ, giúp bạn tiết kiệm thời gian cọ rửa nồi mỗi ngày.</span><br style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><br style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><span style="margin: 0px; padding: 0px; font-weight: 700; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;">Khả năng chịu sốc nhiệt</span><br style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><span style="color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;">- Sản phẩm có thể chịu sự sốc nhiệt khi nhiệt độ thay đổi đột ngột (-40 độ C đến +800 độ C).</span><br style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><span style="color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;">- Mang lại độ bền và tính an toàn cao cho người sử dụng.</span><br style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><br style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><span style="margin: 0px; padding: 0px; font-weight: 700; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;">Có thể dùng với bếp ga, bếp điện và lò vi sóng</span><br style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><br style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><span style="color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;">- Nồi thủy tinh cao cấp có thể dùng nấu ăn trên bếp ga, bếp điện hoặc lò vi sóng (lưu ý: không đậy nắp khi dùng lò).</span><br style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><span style="color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;">- Sản phẩm đem lại sự tiện dụng cao khi nấu ăn.</span><br style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><br style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><span style="margin: 0px; padding: 0px; font-weight: 700; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;">Có thể dùng trong máy rửa chén</span><br style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><br style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><span style="color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;">- Sản phẩm có thể dùng với máy rửa chén, giúp việc chùi rửa trở nên dễ dàng hơn.</span><br style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><span style="color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;">Gồm 2 nồi kích thước khác nhau</span><br style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><span style="color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;">- Bộ nồi gồm 2 nồi kích thước cỡ nhỏ (dung tích 1.5 lít) và lớn (dung tích 3 lít)</span><br style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><span style="color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;">- Bạn có thể hầm, nấu nhiều thực phẩm khác nhau để tạo ra những món canh nóng hổi hay món chè ngọt lịm cho gia đình.</span><br style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><br style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><span style="margin: 0px; padding: 0px; font-weight: 700; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;">Mẹo vặt cho bạn</span><br style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><span style="color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;">- Khi đánh rửa cốc chén hay bất cứ đồ dùng gì bằng thủy tinh trong nhà bạn cần phải thật nhẹ nhàng, hạn chế tối đa va chạm, cọ sát nếu không rất dễ bị vỡ, sứt mẻ hay rạn nứt.</span><br style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><span style="color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;">- Sau một thời gian sử dụng, đồ thủy tinh trở nên xỉn màu. Nếu bạn muốn tìm lại sự sáng trong như ban đầu cách tốt nhất là nên dùng vỏ trứng, chanh và giấm.</span><br style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><span style="color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;">o Vò nát khoảng 6 vỏ trứng vào đồ dùng cần làm sạch</span><br style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><span style="color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;">o Vắt hai quả chanh hoặc một nửa cốc giấm.</span><br style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><span style="color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;">o Ngâm qua một đêm đủ thời gian để cho vỏ trứng tan trong nước chanh hoặc giấm.</span><br style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><span style="color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;">o Rửa đồ dùng bằng nước nóng và úp khô.</span><br style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"></p><div style="margin: 0px 0px 10px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><span style="margin: 0px; padding: 0px; font-weight: 700;">THÔNG TIN THƯƠNG HIỆU</span></div><p><span style="color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;">- Thương hiệu Luminarc thuộc tập đoàn ARC International được thành lập năm 1825 tại Pháp, chuyên sản xuất các sản phẩm thuỷ tinh, pha lê gia dụng phục vụ cho các nhu cầu hằng ngày của người tiêu dùng cũng như các nhà hàng và khách sạn lớn.</span><br style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><span style="color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;">- Là một nhãn hàng chủ lực của ARC, Luminarc chuyên về các sản phẩm bằng thủy tinh cao cấp với kiểu dáng và hoa văn sang trọng.</span><br style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><span style="color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;">- Với chất lượng bảo đảm cùng kỹ thuật sản xuất hiện đại, Luminarc luôn làm hài lòng tất cả khách hàng trên thế giới bằng các sản phẩm có độ bền cũng như tính thẩm mỹ cao.</span><br style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><span style="color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;">- Hiện nay, sản phẩm của Luminarc đã được xuất khẩu trên 180 quốc gia khác nhau trên toàn thế giới.</span><br></p>', '', 1, '2016-09-21 02:33:10', '2016-09-21 02:33:10', ''),
(27, 22, '', '', '', 2, '2016-09-21 02:33:10', '2016-09-21 02:33:10', ''),
(28, 23, '', '<table class="table table-bordered" id="tblGeneralAttribute" style="box-sizing: border-box; background-color: rgb(255, 255, 255); width: 976px; margin-bottom: 20px; border-color: rgb(238, 238, 238); color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 13px;"><tbody style="box-sizing: border-box;"><tr class="row-info" style="box-sizing: border-box;"><td style="box-sizing: border-box; padding: 8px; line-height: 20px; border-color: rgb(238, 238, 238); width: 200px; background-color: rgb(247, 247, 247) !important;"><span style="box-sizing: border-box; font-family: Roboto-Medium, sans-serif;">Thành phần</span></td><td style="box-sizing: border-box; padding: 8px; line-height: 20px; border-color: rgb(238, 238, 238);">Cồn, hương liệu, nước khử ion</td></tr><tr class="row-info" style="box-sizing: border-box;"><td style="box-sizing: border-box; padding: 8px; line-height: 20px; border-color: rgb(238, 238, 238); width: 200px; background-color: rgb(247, 247, 247) !important;"><span style="box-sizing: border-box; font-family: Roboto-Medium, sans-serif;">Kiểu dáng</span></td><td style="box-sizing: border-box; padding: 8px; line-height: 20px; border-color: rgb(238, 238, 238);">Lọ</td></tr><tr class="row-info" style="box-sizing: border-box;"><td style="box-sizing: border-box; padding: 8px; line-height: 20px; border-color: rgb(238, 238, 238); width: 200px; background-color: rgb(247, 247, 247) !important;"><span style="box-sizing: border-box; font-family: Roboto-Medium, sans-serif;">Hạn sử dụng</span></td><td style="box-sizing: border-box; padding: 8px; line-height: 20px; border-color: rgb(238, 238, 238);">4 năm kể từ ngày sản xuất</td></tr><tr class="row-info" style="box-sizing: border-box;"><td style="box-sizing: border-box; padding: 8px; line-height: 20px; border-color: rgb(238, 238, 238); width: 200px; background-color: rgb(247, 247, 247) !important;"><span style="box-sizing: border-box; font-family: Roboto-Medium, sans-serif;">Quy cách đóng gói</span></td><td style="box-sizing: border-box; padding: 8px; line-height: 20px; border-color: rgb(238, 238, 238);">Hộp</td></tr><tr class="row-info" style="box-sizing: border-box;"><td style="box-sizing: border-box; padding: 8px; line-height: 20px; border-color: rgb(238, 238, 238); width: 200px; background-color: rgb(247, 247, 247) !important;"><span style="box-sizing: border-box; font-family: Roboto-Medium, sans-serif;">Màu sắc</span></td><td style="box-sizing: border-box; padding: 8px; line-height: 20px; border-color: rgb(238, 238, 238);">Xanh lá cây</td></tr><tr class="row-info" style="box-sizing: border-box;"><td style="box-sizing: border-box; padding: 8px; line-height: 20px; border-color: rgb(238, 238, 238); width: 200px; background-color: rgb(247, 247, 247) !important;"><span style="box-sizing: border-box; font-family: Roboto-Medium, sans-serif;">Dung tích</span></td><td style="box-sizing: border-box; padding: 8px; line-height: 20px; border-color: rgb(238, 238, 238);">100 (ml)</td></tr></tbody></table>', '', 1, '2016-09-21 02:33:20', '2016-09-21 02:33:20', ''),
(29, 24, 'Thông tin', '<div style="margin: 0px 0px 10px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 19.2px;">◉Chất liệu: Da thái cao cấp - Không tróc - Không dộp - bao giặt</div><div style="margin: 0px 0px 10px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 19.2px;">◉Da mềm, chống lạnh ,độ bền cao</div><div style="margin: 0px 0px 10px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 19.2px;">◉ Size : M: 49-55kg, L 55-66kg, XL 67 - 75kg</div><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-family: Helvetica, Arial, sans-serif; -webkit-font-smoothing: antialiased; -webkit-tap-highlight-color: transparent; border: 0px; outline: 0px; font-size: 13px; box-sizing: border-box; color: rgb(0, 0, 0); line-height: normal;">◉ Chất liệu: da cao cấp,lót lông thoáng mát và ấm áp.<br style="margin: 0px; padding: 0px; -webkit-font-smoothing: antialiased; -webkit-tap-highlight-color: transparent; box-sizing: border-box;">◉ Màu : Đen , có lớp lót vải dù bên trong ấm<br style="margin: 0px; padding: 0px; -webkit-font-smoothing: antialiased; -webkit-tap-highlight-color: transparent; box-sizing: border-box;">◉ Mùa phù hợp : Thu Đông và Xuân</p><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-family: Helvetica, Arial, sans-serif; -webkit-font-smoothing: antialiased; -webkit-tap-highlight-color: transparent; border: 0px; outline: 0px; font-size: 13px; box-sizing: border-box; color: rgb(0, 0, 0); line-height: normal;">◉Sản phẩm Made in Vietnam</p>', 'Thông tin', 1, '2016-09-21 02:33:21', '2016-09-21 02:33:21', ''),
(30, 25, '', '', '', 1, '2016-09-21 02:33:57', '2016-09-21 02:33:57', ''),
(31, 26, '', '', '', 1, '2016-09-21 02:34:37', '2016-09-21 02:34:37', ''),
(32, 27, 'Fullbox', '<p><br>Máy tính xách tay mới nhất của HP, Spectre 13 chỉ dày 10,4mm, mỏng hơn cả MacBook của Apple (13,2mm) và XPS của Dell 13 (15,2mm), giữ vị trí mỏng nhất hiện tại. Không chỉ vậy, sản phẩm còn mang nét khác biệt lẫn độc đáo trong thiết kế, tạo được dấu ấn riêng trong thị trường latop vốn đã có nhiều sản phẩm nổi bật hiện nay.<br></p>', 'Fullbox', 1, '2016-09-21 02:35:09', '2016-09-21 02:35:09', '');
INSERT INTO `content_products` (`id`, `product_id`, `description`, `content`, `name`, `rank`, `created_at`, `updated_at`, `json_attr`) VALUES
(33, 28, '', '<h3 style="box-sizing: border-box; font-family: Roboto-Medium, sans-serif; line-height: 1.4; color: rgb(17, 17, 17); margin-bottom: 10px; font-size: 16px;">Bộ sản phẩm chăm sóc da Shiseido - Xả stress cho làn da</h3><p style="box-sizing: border-box; margin-right: 0px; margin-bottom: 8px; margin-left: 0px; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 13px;"><span style="box-sizing: border-box; font-family: Roboto-Medium, sans-serif;">Bộ sản phẩm chăm sóc da Shiseido - Xả stress cho làn da</span> là cứu cánh cho làn da trước những vấn đề do căng thẳng và thói quen sống. Ibuki Multi Solution Gel giúp trả lại làn da mịn màng, rạng rỡ theo thời gian, các sản phẩm khác giúp làm sạch, cân bằng và cung cấp dưỡng chất cho làn da luôn tươi sáng, khỏe mạnh.</p><p style="box-sizing: border-box; margin-right: 0px; margin-bottom: 8px; margin-left: 0px; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 13px;"><span style="box-sizing: border-box; font-family: Roboto-Medium, sans-serif;">Bộ sản phẩm gồm</span></p><ul style="box-sizing: border-box; margin-bottom: 10px; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 13px;"><li style="box-sizing: border-box;">Gel đa năng Shiseido Ibuki Multi Solution Gel 30ml - 950.000 VNĐ</li><li style="box-sizing: border-box;">Sữa rửa mặt Shiseido Ibuki Purifying Cleanser (mini size) 30ml - 153.600 VNĐ</li><li style="box-sizing: border-box;">Kem tẩy tế bào chết Shiseido Purifying Mask Masque Purifiant 15ml (mini size) - 120.000 VNĐ</li><li style="box-sizing: border-box;">Nước cân bằng và dưỡng ẩm da Shiseido Ibuki Softening Concentrate (minisize) 15ml - 140.000 VNĐ</li></ul><p style="box-sizing: border-box; margin-right: 0px; margin-bottom: 8px; margin-left: 0px; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 13px;"><span style="box-sizing: border-box; font-family: Roboto-Medium, sans-serif;">Hướng dẫn sử dụng</span></p><ul style="box-sizing: border-box; margin-bottom: 10px; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 13px;"><li style="box-sizing: border-box;"><p style="box-sizing: border-box; margin-right: 0px; margin-bottom: 8px; margin-left: 0px;"><span style="box-sizing: border-box; font-family: Roboto-Medium, sans-serif;">Sữa rửa mặt Shiseido Ibuki Purifying Cleanser:</span> cho 1 cm sữa rửa mặt ra lòng bàn tay, tạo bọt với nước và massage nhẹ nhàng lên toàn bộ gương mặt, rửa sạch lại với nước, sử dụng ngày 2 lần sáng và tối</p></li><li style="box-sizing: border-box;"><p style="box-sizing: border-box; margin-right: 0px; margin-bottom: 8px; margin-left: 0px;"><span style="box-sizing: border-box; font-family: Roboto-Medium, sans-serif;">Kem tẩy tế bào chết Shiseido Purifying Mask Masque Purifiant: </span>sử dụng<span style="box-sizing: border-box; font-family: Roboto-Medium, sans-serif;"> </span>1 - 2 lần/ tuần. Sau khi rửa mặt, lấy một lượng bằng trái sơ-ri thoa đều (dày) khắp mặt, để 5p rồi rửa sạch bằng nước ấm</p></li><li style="box-sizing: border-box;"><span style="box-sizing: border-box; font-family: Roboto-Medium, sans-serif;">Nước cân bằng và dưỡng ẩm da Shiseido Ibuki Softening Concentrate:</span> sử dụng vào buổi sáng và buổi tối sau bước làm sạch da. Lấy một lượng sản phẩm vừa đủ ra bông Cotton và nhẹ nhàng thoa đều khắp mặt. Lắc đều sản phẩm trước khi sử dụng</li><li style="box-sizing: border-box;"><span style="box-sizing: border-box; font-family: Roboto-Medium, sans-serif;">Gel đa năng Shiseido Ibuki Multi Solution Gel: </span>sử dụng từ 3 - 4 lần mỗi ngày, như bước cuối cùng của quá trình dưỡng da. Lấy một lượng vừa đủ ra ngón tay và thoa, vỗ nhẹ lên những vùng da gặp vấn đề. Có thể thoa ngay trên lớp Makeup mà bạn không phải lo lắng lớp trang điểm bị xô lệch… Mẹo cải thiện vùng da gặp vấn đề một cách nhanh chóng: buổi tối, sau khi đã làm sạch và dưỡng da. Lấy một lượng nhiều hơn Multi Solution Gel và thoa, đắp lên vùng da gặp vấn đề (như mụn, thô ráp, bong tróc, ….) để qua đêm. Bạn sẽ cảm nhận được hiệu quả bất ngờ vào buổi sáng hôm sau</li></ul><p style="box-sizing: border-box; margin-right: 0px; margin-bottom: 8px; margin-left: 0px; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 13px; text-align: center;"><img src="https://cdn02.static-adayroi.com/0/2016/09/06/1473127433131_1389479.png" style="box-sizing: border-box; max-width: 100%; height: 439px; width: 500px;"></p><p style="box-sizing: border-box; margin-right: 0px; margin-bottom: 8px; margin-left: 0px; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 13px; text-align: center;"><em style="box-sizing: border-box;">Phương pháp ấn huyệt để tăng cường hiệu quả cải thiện bã nhờn và mụn: Dùng ngón giữa nhẹ nhàng ấn giữ huyệt vài giây sau đó từ từ nhấc ngón tay ra như hình vẽ</em></p><p style="box-sizing: border-box; margin-right: 0px; margin-bottom: 8px; margin-left: 0px; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 13px;"><span style="box-sizing: border-box; font-family: Roboto-Medium, sans-serif;">Gel đa năng Shiseido Ibuki Multi Solution Gel </span>giải pháp tác động cao cho nhiều vấn đề da như mụn li ti, lỗ chân lông lớn, da gồ ghề và sẹo mụn. Sản phẩm có dạng gel có thể thẩm thấu những thành phần hiệu quả vào da ngay cả khi đang trang điểm, làn da sẽ trở nên mịn màng hơn qua thời gian. Hợp chất PhytoTarget chứa thành phần dưỡng ẩm sẽ khôi phục lớp màng lipid tự nhiên của da để tăng cường hàng rào bảo vệ làn da. Chiết xuất sinh học Glycyrrhizin và Glycylglycine chứa Salicylic Acid ngăn ngừa hiện tượng mụn li ti trên da.</p><p style="box-sizing: border-box; margin-right: 0px; margin-bottom: 8px; margin-left: 0px; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 13px; text-align: center;"><img src="https://cdn02.static-adayroi.com/0/2016/09/06/1473137722023_3327923.png" style="box-sizing: border-box; max-width: 100%; height: 498px; width: 800px;"></p><p style="box-sizing: border-box; margin-right: 0px; margin-bottom: 8px; margin-left: 0px; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 13px; text-align: center;"><em style="box-sizing: border-box;">Gel đa năng Shiseido Ibuki Multi Solution Gel</em></p><p style="box-sizing: border-box; margin-right: 0px; margin-bottom: 8px; margin-left: 0px; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 13px;"><span style="box-sizing: border-box; font-family: Roboto-Medium, sans-serif;">Sữa rửa mặt Shiseido Ibuki Purifying Cleanser</span> với những hạt li ti nhẹ nhàng lấy đi tế bào chết, bụi bẩn trên da. Sản phẩm nhanh chóng tạo bọt để lấy đi bã nhờn và bụi bẩn mà không làm mất độ ẩm tự nhiên của da. Sản phẩm còn cung cấp các dưỡng chất giúp cân bằng da, làm da mềm mại, mịn màng và luôn ẩm mượt.</p><p style="box-sizing: border-box; margin-right: 0px; margin-bottom: 8px; margin-left: 0px; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 13px; text-align: center;"><img src="https://cdn02.static-adayroi.com/0/2016/09/09/147340560481_2438703.jpg" style="box-sizing: border-box; max-width: 100%; height: 859px; width: 800px;"></p><p style="box-sizing: border-box; margin-right: 0px; margin-bottom: 8px; margin-left: 0px; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 13px; text-align: center;"><em style="box-sizing: border-box;">Sữa rửa mặt Shiseido Ibuki Purifying Cleanser </em></p><p style="box-sizing: border-box; margin-right: 0px; margin-bottom: 8px; margin-left: 0px; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 13px;"><span style="box-sizing: border-box; font-family: Roboto-Medium, sans-serif;">Kem tẩy tế bào chết Shiseido Purifying Mask Masque Purifiant </span>nhẹ nhàng làm sạch da, loại bỏ lớp sừng, tế bào chết ngoài bề mặt da, để làn da luôn mềm mại mịn màng, đồng thời giúp da hấp thu tốt hơn các dưỡng chất. Sản phẩm êm dịu làm sạch tận sâu trong lỗ chân lông, giúp da mượt và mịn màng. </p><p style="box-sizing: border-box; margin-right: 0px; margin-bottom: 8px; margin-left: 0px; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 13px; text-align: center;"><img src="https://cdn02.static-adayroi.com/0/2016/08/15/1471233371761_8109289.png" style="box-sizing: border-box; max-width: 100%; height: 520px; width: 800px;"></p><p style="box-sizing: border-box; margin-right: 0px; margin-bottom: 8px; margin-left: 0px; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 13px; text-align: center;"><em style="box-sizing: border-box;">Kem tẩy tế bào chết Shiseido Purifying Mask Masque Purifiant full size</em></p><p style="box-sizing: border-box; margin-right: 0px; margin-bottom: 8px; margin-left: 0px; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 13px;"><span style="box-sizing: border-box; font-family: Roboto-Medium, sans-serif;">Nước cân bằng và dưỡng ẩm da Shiseido Ibuki Softening Concentrate</span> sử dụng công thức độc đáo có khả năng cung cấp độ ẩm cho da, cân bằng và phục hồi trạng thái tự nhiên của da, tăng cường hiệu quả của các bước dưỡng da tiếp theo. Sản phẩm thuộc dòng Ibuki của Shiseido ứng dụng công nghệ độc quyền Shape Memorizing Cell Technology giúp tăng sức đề kháng của làn da và thúc đẩy khả năng chống đỡ của làn da trước mọi căng thẳng. Đồng thời, Shape Memorizing Cell Technology của Shiseido cũng giúp đưa các tế bào da trở lại tình trạng lý tưởng ban đầu và hạn chế sự co rút trong tương lai.</p><p style="box-sizing: border-box; margin-right: 0px; margin-bottom: 8px; margin-left: 0px; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 13px; text-align: center;"><img src="https://cdn02.static-adayroi.com/0/2016/07/13/1468399577442_3732693.jpg" style="box-sizing: border-box; max-width: 100%; height: 600px; width: 800px;"></p><p style="box-sizing: border-box; margin-right: 0px; margin-bottom: 8px; margin-left: 0px; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 13px; text-align: center;"><em style="box-sizing: border-box;">Nước cân bằng và dưỡng ẩm da Shiseido Ibuki trong suốt, thẩm thấu nhanh, giảm bóng nhờn hiệu quả</em></p><p style="box-sizing: border-box; margin-right: 0px; margin-bottom: 8px; margin-left: 0px; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 13px;"><span style="box-sizing: border-box; font-family: Roboto-Medium, sans-serif;">Thông tin thương hiệu</span></p><p style="box-sizing: border-box; margin-right: 0px; margin-bottom: 8px; margin-left: 0px; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 13px;">Shiseido là một trong những thương hiệu lâu đời nhất trên thế giới, ra đời vào năm 1872 với tiền thân là cửa hàng dược phẩm mang phong cách phương Tây đầu tiên tại quận Ginza, Nhật Bản. Ban đầu, Shiseido tập trung phát triển dòng mỹ phẩm làm trắng da và phấn nền với sản phẩm đầu tiên là Eudermine - hiện tại vẫn còn được sản xuất. Hiện nay, Shiseido có 25.000 cửa hàng trên toàn thế giới và sở hữu 11 thương hiệu nhỏ với các sản phẩm mỹ phẩm, chăm sóc tóc dành cho mọi lứa tuổi. Shiseido là một trong những thương hiệu mỹ phẩm Nhật Bản được phái đẹp tin dùng tại nhiều nước trên thế giới. Với những nghiên cứu đặc biệt dành riêng cho việc chăm sóc làn da phụ nữ bằng chiết xuất từ thiên nhiên, các sản phẩm của Shiseido đặc biệt an toàn cho mọi làn da, chăm sóc và phục hồi sức sống da hiệu quả.</p>', '', 1, '2016-09-21 02:35:18', '2016-09-21 02:37:12', ''),
(34, 29, '', '<h2 class="product-description__title" style="margin-right: 0px; margin-bottom: 17px; margin-left: 0px; padding: 0px; font-weight: 700; font-size: 16px; line-height: 2.4rem; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif;">Giới thiệu sản phẩm Chảo siêu bền đá hợp kim nhôm phủ đá Sunhouse SBD-28 (Đen)</h2><div class="product-description__webyclip-thumbnails" style="margin: 0px 0px 15px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><div class="webyclip-thumbnails" id="webyclip_thumbnails" style="margin: 0px; padding: 0px;"></div></div><p><span style="color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;">Không chỉ đáp ứng các tiêu chuẩn phù hợp của một chiếc chảo có thể thực hiện các thao tác chiên, xào, nấu một cách tiện lợi và hiệu quả, chảo siêu bền đá</span><span style="margin: 0px; padding: 0px; font-weight: 700; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;">Sunhouse SBD-28</span><span style="color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"> còn làm đẹp thêm nhà bếp của bạn với dáng vẻ sang trọng, hiện đại. Chảo được làm từ hợp kim nhôm, sử dụng công nghệ đúc Hàn Quốc giúp sản phẩm bền và chắc chắn hơn, giúp chảo có độ cứng cao, dẫn nhiệt nhanh và tỏa nhiệt đều. Ngoài ra, với lớp đá kháng khuẩn được tráng đặc biệt, các bà nội trợ sẽ không còn lo về việc vệ sinh chảo sau khi dùng như trước, sẽ yên tâm hơn khi chế biến các món ăn ngon và đầy dinh dưỡng mỗi ngày cho các thành viên trong gia đình.</span></p><div style="margin: 0px 0px 10px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><span style="margin: 0px; padding: 0px; font-weight: 700;">ĐẶC ĐIỂM NỔI BẬT</span></div><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><span style="margin: 0px; padding: 0px; font-weight: 700;">Chảo được làm bằng kim nhôm và có tráng lớp đá đặc biệt</span><br style="margin: 0px; padding: 0px;">Nhờ có bề mặt tráng lớp chống dính siêu bền, bạn có thể dễ dàng đảo, khuấy, dịch chuyển đồ chiên rán trong lòng chảo. Được tráng lớp đá marble nên dù bạn chỉ sử dụng một lượng dầu chiên rất nhỏ thì cũng có thể đảm bảo được các vitamin, dưỡng chất từ thức ăn được giữ lại nguyên vẹn và không hề bị bám nhiễm bất cứ mùi khó chịu nào. Với chất liệu sản xuất từ thiên nhiên nên khi đun nóng, bề mặt chảo không giải phóng ra chất PTFE và PFOA - 2 hóa chất hữu cơ có hại cho sức khỏe.</p><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><span style="margin: 0px; padding: 0px; font-weight: 700;">3 lớp chống dính và lớp sơn ngoài chịu nhiệt</span><br style="margin: 0px; padding: 0px;">Với 3 lớp chống dính và phủ lớp sơn bên ngoài chịu nhiệt đồng thời chống bám bẩn, chảo tiện dụng cho các món chiên xào mà không lo thức ăn bám trên chảo sẽ khó chùi rửa.</p><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><span style="margin: 0px; padding: 0px; font-weight: 700;">Thiết kế tiện dụng</span><br style="margin: 0px; padding: 0px;">Chảo <span style="margin: 0px; padding: 0px; font-weight: 700;">Sunhouse SBD-28</span> có đường kính 28cm, cán cầm nhựa cao cấp có độ dài tiêu chuẩn, dễ thao tác mà không gây nóng tay. Bề mặt trong của chảo được tráng lớp đá vừa giúp chống dính, kháng khuẩn, vừa tạo tính thẩm mỹ cao cho sản phẩm. Đầu cán chảo được thiết kế tiện lợi để bạn dễ dàng treo sản phẩm lên giá khi không sử dụng, tiết kiệm không gian và làm gọn khu vực bếp.</p><div style="margin: 0px 0px 10px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><span style="margin: 0px; padding: 0px; font-weight: 700;">THÔNG TIN THƯƠNG HIỆU</span></div><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;">Sunhouse là thương hiệu thuộc tập đoàn Sunhouse, một doanh nghiệp đi tiên phong trong lĩnh vực sản xuất và kinh doanh đồ gia dụng tại Việt Nam. Sunhouse có nhà máy với diện tích hơn 12.000 m2 tại Việt Nam và 1 nhà máy đặt tại Hàn Quốc, dây chuyền sản xuất nhập khẩu từ Hàn Quốc và đội ngũ nhân viên lành nghề được đào tạo bởi các chuyên gia nước ngoài. Sản phẩm của Sunhouse được sản xuất trên dây chuyền và công nghệ hiện đại và kênh phân phối sản phẩm rộng khắp, đáp ứng tối đa nhu cầu về tính thẩm mỹ và sự tiện dụng so với các loại sản phẩm gia dụng hiện có trên thị trường.</p>', '', 1, '2016-09-21 02:36:19', '2016-09-21 02:44:04', ''),
(35, 30, 'Thông tin', '<p><span style="color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 19.2px;">- Nhiều màu sắc, mẫu để lựa chọn làm mới phong cách hàng ngày.</span><br style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 19.2px;"><span style="color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 19.2px;">- Không chỉ phụ nữ, hiện nay, thời trang dành cho nam giới ngày càng phong phú, đa dạng và được nhiều người quan tâm. Để thể hiện mình là người lịch sự, các bạn nam đều phải để ý để vẻ ngoài của mình mỗi khi đi ra ngoài. Đặc biệt, kết hợp trang phục với cá phụ kiện thời trang là vô cùng quan trong. Một đôi giày sẽ giúp bạn thể hiện phong cách của riêng mình. Giày tây da nam Zapas là sản phẩm đang được phái nam ưa chuộng.</span><br></p>', 'Thông tin', 1, '2016-09-21 02:36:23', '2016-09-21 02:36:23', ''),
(36, 31, '', '<table class="table table-bordered" id="tblGeneralAttribute" style="box-sizing: border-box; background-color: rgb(255, 255, 255); width: 976px; margin-bottom: 20px; border-color: rgb(238, 238, 238); color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 13px;"><tbody style="box-sizing: border-box;"><tr class="row-info" style="box-sizing: border-box;"><td style="box-sizing: border-box; padding: 8px; line-height: 20px; border-color: rgb(238, 238, 238); width: 200px; background-color: rgb(247, 247, 247) !important;"><span style="box-sizing: border-box; font-family: Roboto-Medium, sans-serif;">Hạn sử dụng</span></td><td style="box-sizing: border-box; padding: 8px; line-height: 20px; border-color: rgb(238, 238, 238);">3 năm kể từ ngày sản xuất</td></tr><tr class="row-info" style="box-sizing: border-box;"><td style="box-sizing: border-box; padding: 8px; line-height: 20px; border-color: rgb(238, 238, 238); width: 200px; background-color: rgb(247, 247, 247) !important;"><span style="box-sizing: border-box; font-family: Roboto-Medium, sans-serif;">Thành phần</span></td><td style="box-sizing: border-box; padding: 8px; line-height: 20px; border-color: rgb(238, 238, 238);">Water, Octocrylene 50 mg/g, C 12 – 15 Alkyl Benzoate, Glyceryl Stearate, Phenylbenzimidazole Sulfonic Acid 20 mg/g, Propylene Glycol, Cetearyl Alcohol, DEA Cetyl Phosphate, Oxybenzone 15 mg/g, Butyl Methoxydibenzoylmethane 10 mg/g, Isopropyl Myristate, Phenoxyethanol, Sodium Hydroxide, Methylparaben, Carbomer, Tocopheryl Acetate, Fragrance, Propylparaben, Disodium EDTA Contains phenoxyethanol and hydroxybenzoates as preservatives.</td></tr><tr class="row-info" style="box-sizing: border-box;"><td style="box-sizing: border-box; padding: 8px; line-height: 20px; border-color: rgb(238, 238, 238); width: 200px; background-color: rgb(247, 247, 247) !important;"><span style="box-sizing: border-box; font-family: Roboto-Medium, sans-serif;">Chỉ số chống nắng</span></td><td style="box-sizing: border-box; padding: 8px; line-height: 20px; border-color: rgb(238, 238, 238);">SPF30+</td></tr><tr class="row-info" style="box-sizing: border-box;"><td style="box-sizing: border-box; padding: 8px; line-height: 20px; border-color: rgb(238, 238, 238); width: 200px; background-color: rgb(247, 247, 247) !important;"><span style="box-sizing: border-box; font-family: Roboto-Medium, sans-serif;">Công dụng</span></td><td style="box-sizing: border-box; padding: 8px; line-height: 20px; border-color: rgb(238, 238, 238);">Chống nắng, bảo vệ da, chống lão hóa, cân bằng da</td></tr><tr class="row-info" style="box-sizing: border-box;"><td style="box-sizing: border-box; padding: 8px; line-height: 20px; border-color: rgb(238, 238, 238); width: 200px; background-color: rgb(247, 247, 247) !important;"><span style="box-sizing: border-box; font-family: Roboto-Medium, sans-serif;">Loại da</span></td><td style="box-sizing: border-box; padding: 8px; line-height: 20px; border-color: rgb(238, 238, 238);">Mọi loại da</td></tr><tr class="row-info" style="box-sizing: border-box;"><td style="box-sizing: border-box; padding: 8px; line-height: 20px; border-color: rgb(238, 238, 238); width: 200px; background-color: rgb(247, 247, 247) !important;"><span style="box-sizing: border-box; font-family: Roboto-Medium, sans-serif;">Xuất xứ</span></td><td style="box-sizing: border-box; padding: 8px; line-height: 20px; border-color: rgb(238, 238, 238);">Úc</td></tr><tr class="row-info" style="box-sizing: border-box;"><td style="box-sizing: border-box; padding: 8px; line-height: 20px; border-color: rgb(238, 238, 238); width: 200px; background-color: rgb(247, 247, 247) !important;"><span style="box-sizing: border-box; font-family: Roboto-Medium, sans-serif;">Quy cách đóng gói</span></td><td style="box-sizing: border-box; padding: 8px; line-height: 20px; border-color: rgb(238, 238, 238);">Hộp</td></tr><tr class="row-info" style="box-sizing: border-box;"><td style="box-sizing: border-box; padding: 8px; line-height: 20px; border-color: rgb(238, 238, 238); width: 200px; background-color: rgb(247, 247, 247) !important;"><span style="box-sizing: border-box; font-family: Roboto-Medium, sans-serif;">Dung tích</span></td><td style="box-sizing: border-box; padding: 8px; line-height: 20px; border-color: rgb(238, 238, 238);">75 (ml)</td></tr></tbody></table>', '', 1, '2016-09-21 02:37:05', '2016-09-21 02:37:05', ''),
(37, 32, '', '<p><br>Máy tính xách tay mới nhất của HP, Spectre 13 chỉ dày 10,4mm, mỏng hơn cả MacBook của Apple (13,2mm) và XPS của Dell 13 (15,2mm), giữ vị trí mỏng nhất hiện tại. Không chỉ vậy, sản phẩm còn mang nét khác biệt lẫn độc đáo trong thiết kế, tạo được dấu ấn riêng trong thị trường latop vốn đã có nhiều sản phẩm nổi bật hiện nay.<br></p>', '', 1, '2016-09-21 02:37:54', '2016-09-21 02:37:54', ''),
(38, 33, '', '', '', 1, '2016-09-21 02:38:14', '2016-09-21 02:38:14', ''),
(39, 34, 'Thông tin', '<p><span style="color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 19.2px;">- Nhiều màu sắc, mẫu để lựa chọn làm mới phong cách hàng ngày.</span><br style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 19.2px;"><span style="color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 19.2px;">- Không chỉ phụ nữ, hiện nay, thời trang dành cho nam giới ngày càng phong phú, đa dạng và được nhiều người quan tâm. Để thể hiện mình là người lịch sự, các bạn nam đều phải để ý để vẻ ngoài của mình mỗi khi đi ra ngoài. Đặc biệt, kết hợp trang phục với cá phụ kiện thời trang là vô cùng quan trong. Một đôi giày sẽ giúp bạn thể hiện phong cách của riêng mình. Giày tây da nam Zapas là sản phẩm đang được phái nam ưa chuộng.</span><br></p>', 'Thông tin', 1, '2016-09-21 02:38:55', '2016-09-21 02:38:55', ''),
(40, 35, '', '<h3 style="box-sizing: border-box; font-family: Roboto-Medium, sans-serif; line-height: 1.4; color: rgb(17, 17, 17); margin-bottom: 10px; font-size: 16px;">Thuốc nhuộm tóc L''Oreal Majirel 7.3 50ml</h3><p style="box-sizing: border-box; margin-right: 0px; margin-bottom: 8px; margin-left: 0px; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 13px;">Thuốc nhuộm tóc L''Oreal Majirel với công nghệ tiên tiến lonene G và Incell giúp cho màu tuyệt đối, chăm sóc tóc tuyệt đối, giữ màu lâu và tóc luôn bóng khỏe. Đây là thuốc nhuộm đầu tiên điều trị cả 3 vùng bề mặt, biểu bì và lõi tóc. Majirel giúp tái tạo và phục hồi tóc gấp hai lần, cho độ lên màu chuẩn, độ phủ bạc hoàn hảo, màu nhuộm phản ánh xác thực, sáng bóng, giữ màu lâu đồng thời được nuôi dưỡng và chăm sóc tối ưu. Dòng sản phẩm có các tông màu từ cơ bản đến thời trang.</p><p style="box-sizing: border-box; margin-right: 0px; margin-bottom: 8px; margin-left: 0px; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 13px;">​Hướng dẫn sử dụng và bảo quản</p><ul style="box-sizing: border-box; margin-bottom: 10px; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 13px;"><li style="box-sizing: border-box;">Nên thoa dưỡng chất bảo vệ lên tóc khô và chưa gội trước khi nhuộm</li><li style="box-sizing: border-box;">Pha thuốc nhuộm theo tỉ lệ</li><li style="box-sizing: border-box;">Bôi đều thuốc lên tóc khô từ chân đến ngọn</li><li style="box-sizing: border-box;">Giữ thuốc trong 50 phút để đạt được đúng độ sáng</li><li style="box-sizing: border-box;">Muốn tóc bóng hơn, thêm 15ml nước ấm lên suốt chiều dài tóc và để 5 phút</li><li style="box-sizing: border-box;">Xả tóc với nước đến khi màu nhuộm không còn phai ra</li><li style="box-sizing: border-box;">Gội sạch tóc với dầu gội</li><li style="box-sizing: border-box;">Đeo găng tay khi pha thuốc và nhuộm màu</li><li style="box-sizing: border-box;">Bảo quản nơi khô ráo, thoáng mát, tránh xa tầm tay trẻ em</li></ul><p style="box-sizing: border-box; margin-right: 0px; margin-bottom: 8px; margin-left: 0px; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 13px;">Thông tin thương hiệu</p><p style="box-sizing: border-box; margin-right: 0px; margin-bottom: 8px; margin-left: 0px; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 13px;">Tập đoàn mỹ phẩm L’Oreal Paris bắt nguồn từ thương hiệu Auréole bởi một kỹ sư hóa người Pháp, Eugene Schueller, với sản phẩm đầu tiên là thuốc nhuộm tóc nhân tạo. Sau hơn 100 năm thành lập, L’Oréal là tập đoàn chuyên về mỹ phẩm và chăm sóc sắc đẹp lớn nhất thế giới với các dòng sản phẩm về chăm sóc tóc, chăm sóc da, mỹ phẩm. Có mặt tại 120 quốc gia, L’Oreal Paris phát triển dựa trên nguyên lý: Sáng tạo và đem đến sản phẩm hàng đầu với mức giá tốt nhất cho người tiêu dùng. Nguyên lý này khởi nguồn từ các nghiên cứu trong phòng thí nghiệm nơi sản sinh ra những bí quyết làm đẹp chuyên nghiệp và gần gũi với tất cả mọi người. </p>', '', 1, '2016-09-21 02:39:12', '2016-09-21 02:42:32', ''),
(41, 36, '', '<h2 class="product-description__title" style="margin-right: 0px; margin-bottom: 17px; margin-left: 0px; padding: 0px; font-weight: 700; font-size: 16px; line-height: 2.4rem; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif;">Giới thiệu sản phẩm Bộ nồi nấu bếp Inox Sunhouse SH333</h2><div class="product-description__webyclip-thumbnails" style="margin: 0px 0px 15px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><div class="webyclip-thumbnails" id="webyclip_thumbnails" style="margin: 0px; padding: 0px;"></div></div><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;">Bộ sản phẩm 3 nồi inox <span style="margin: 0px; padding: 0px; font-weight: 700;">Sunhouse SH333</span> với 3 nồi có kích thước khác nhau giúp bạn linh hoạt trong việc nấu nướng, vừa góp phần tô điểm thêm nội thất gian bếp nhà bạn. <span style="margin: 0px; padding: 0px; font-weight: 700;">Sunhouse SH333</span> được làm từ chất liệu inox cao cấp an toàn cho sức khỏe người sử dụng, đồng thời bền bỉ, đảm bảo cho bạn sử dụng trong thời gian dài. Bộ 3 nồi <span style="margin: 0px; padding: 0px; font-weight: 700;">Sunhouse SH333</span> sẽ là người bạn đồng hành đáng tin cậy cho các bà nội trợ đảm đang.</p><div style="margin: 0px 0px 10px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><span style="margin: 0px; padding: 0px; font-weight: 700;">ĐẶC ĐIỂM NỔI BẬT</span></div><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><span style="margin: 0px; padding: 0px; font-weight: 700;">Chất liệu cao cấp</span><br style="margin: 0px; padding: 0px;">Nồi làm từ nguyên liệu inox cao cấp không bị oxy hoá, có thể sử dụng lâu dài an toàn cho sức khoẻ, thu nhiệt nhanh, toả nhiệt đều giúp đun nấu nhanh, tiết kiệm nhiên liệu (gas, điện,…), duy trì độ sáng bóng một cách lâu bền và luôn đẹp như mới.</p><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><span style="margin: 0px; padding: 0px; font-weight: 700;">Thiết kế sang trọng</span><br style="margin: 0px; padding: 0px;">Kiểu dáng của <span style="margin: 0px; padding: 0px; font-weight: 700;">Sunhouse SH333</span> được thiết kế theo phong cách châu Âu sang trọng, hiện đại, phù hợp với mọi không gian nhà bếp, giúp gian bếp của bạn thêm phần chuyên nghiệp hơn. Quai nồi dạng ống tròn cho phép bạn linh hoạt trong việc di chuyển, dễ cầm nắm, sử dụng.</p><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><span style="margin: 0px; padding: 0px; font-weight: 700;">Tính năng tiện dụng</span><br style="margin: 0px; padding: 0px;">Bộ 3 nồi với 3 kích thước khác nhau cho bạn dễ dàng nấu nướng tùy mục đích, số lượng. Nồi 3 đáy hấp thu và truyền nhiệt nhanh, giúp thức ăn nhanh chín hơn so với nồi thông thường giúp tiết kiệm thời gian và gas, điện năng. Nắp nồi làm băng inox dày dặn đảm bảo an toàn tuyệt đối cho bạn khi sử dụng. Sản phẩm còn có ưu điểm là không kén bếp, dùng được cho nhiều loại bếp: bếp than, bếp gas, bếp điện, bếp từ,...</p><div style="margin: 0px 0px 10px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><span style="margin: 0px; padding: 0px; font-weight: 700;">THÔNG TIN CHI TIẾT</span></div><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;">Model: SH333<br style="margin: 0px; padding: 0px;">Kích thước: 16 cm, 20 cm, 24 cm<br style="margin: 0px; padding: 0px;">Trọng lượng: 2kg<br style="margin: 0px; padding: 0px;">Màu: Trắng<br style="margin: 0px; padding: 0px;">Chất liệu inox<br style="margin: 0px; padding: 0px;">Bộ gồm 3 nồi<br style="margin: 0px; padding: 0px;">Chất liệu inox<br style="margin: 0px; padding: 0px;">Bảo hành 12 tháng<br style="margin: 0px; padding: 0px;">Xuất xứ Việt Nam</p>', '', 1, '2016-09-21 02:39:17', '2016-09-21 02:42:29', ''),
(42, 37, 'Giới thiệu sản phẩm Bình xịt phủ nano chống nước đa năng Eykosi 250ml', '<p>Bình Xịt Phủ Nano Chống Nước Đa Năng Dùng Cho Mọi Chất LiệuBình xịt\r\nsẽ tạo một lớp mỏng trong suốt có tác dụng như hiệu ứng cánh sen,\r\ngiúp ngăn nước bám vào các đồ vật được xitBình dung tích 250ml, mỗi\r\nlần xịt có tác dụng 6 thángXịt lớp càng dày khả năng chống nước\r\ncàng cao, xịt mỗi lớp cách nhau 15pKhông nên xịt quá 3 lớp, có thể\r\nsẽ làm màu của đồ vật tối hơn so với ban đầu.<br></p>', 'Giới thiệu sản phẩm Bình xịt phủ nano chống nước đa năng Eykosi 250ml', 1, '2016-09-21 02:40:31', '2016-09-21 02:40:31', ''),
(43, 38, '', '<div class="tab-content active" id="tab_content_product_specifications" style="box-sizing: border-box; padding-top: 8px; padding-bottom: 16px; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 13px;"><table class="table table-bordered" id="tblGeneralAttribute" style="box-sizing: border-box; width: 976px; margin-bottom: 20px; border-color: rgb(238, 238, 238);"><tbody style="box-sizing: border-box;"><tr class="row-info" style="box-sizing: border-box;"><td style="box-sizing: border-box; padding: 8px; line-height: 20px; border-color: rgb(238, 238, 238); width: 200px; background-color: rgb(247, 247, 247) !important;"><span style="box-sizing: border-box; font-family: Roboto-Medium, sans-serif;">Hạn sử dụng</span></td><td style="box-sizing: border-box; padding: 8px; line-height: 20px; border-color: rgb(238, 238, 238);">5 năm kể từ ngày sản xuất</td></tr><tr class="row-info" style="box-sizing: border-box;"><td style="box-sizing: border-box; padding: 8px; line-height: 20px; border-color: rgb(238, 238, 238); width: 200px; background-color: rgb(247, 247, 247) !important;"><span style="box-sizing: border-box; font-family: Roboto-Medium, sans-serif;">Thành phần</span></td><td style="box-sizing: border-box; padding: 8px; line-height: 20px; border-color: rgb(238, 238, 238);">Eruca Sativa Leaf Extract, Juglans Regia (Walnut) Seed Extract, Vitis Vinifera (Grape) Fruit Extract, Glycerin, Prunus Persica (Peach) Leaf Extract, Linum Usitatissimum Seed Extract...</td></tr><tr class="row-info" style="box-sizing: border-box;"><td style="box-sizing: border-box; padding: 8px; line-height: 20px; border-color: rgb(238, 238, 238); width: 200px; background-color: rgb(247, 247, 247) !important;"><span style="box-sizing: border-box; font-family: Roboto-Medium, sans-serif;">Công dụng</span></td><td style="box-sizing: border-box; padding: 8px; line-height: 20px; border-color: rgb(238, 238, 238);">Cân bằng và tái tạo da đầu, ngăn rụng tóc, làm sạch gàu, kiểm soát dầu nhờn, tóc bóng sáng, khỏe mạnh</td></tr><tr class="row-info" style="box-sizing: border-box;"><td style="box-sizing: border-box; padding: 8px; line-height: 20px; border-color: rgb(238, 238, 238); width: 200px; background-color: rgb(247, 247, 247) !important;"><span style="box-sizing: border-box; font-family: Roboto-Medium, sans-serif;">Loại da</span></td><td style="box-sizing: border-box; padding: 8px; line-height: 20px; border-color: rgb(238, 238, 238);">Da đầu lão hóa</td></tr><tr class="row-info" style="box-sizing: border-box;"><td style="box-sizing: border-box; padding: 8px; line-height: 20px; border-color: rgb(238, 238, 238); width: 200px; background-color: rgb(247, 247, 247) !important;"><span style="box-sizing: border-box; font-family: Roboto-Medium, sans-serif;">Xuất xứ</span></td><td style="box-sizing: border-box; padding: 8px; line-height: 20px; border-color: rgb(238, 238, 238);">Italy</td></tr><tr class="row-info" style="box-sizing: border-box;"><td style="box-sizing: border-box; padding: 8px; line-height: 20px; border-color: rgb(238, 238, 238); width: 200px; background-color: rgb(247, 247, 247) !important;"><span style="box-sizing: border-box; font-family: Roboto-Medium, sans-serif;">Quy cách đóng gói</span></td><td style="box-sizing: border-box; padding: 8px; line-height: 20px; border-color: rgb(238, 238, 238);">Chai</td></tr><tr class="row-info" style="box-sizing: border-box;"><td style="box-sizing: border-box; padding: 8px; line-height: 20px; border-color: rgb(238, 238, 238); width: 200px; background-color: rgb(247, 247, 247) !important;"><span style="box-sizing: border-box; font-family: Roboto-Medium, sans-serif;">Dung tích</span></td><td style="box-sizing: border-box; padding: 8px; line-height: 20px; border-color: rgb(238, 238, 238);">250 (ml)</td></tr></tbody></table></div><div class="tab-content active" id="tab_content_product_introduction" style="box-sizing: border-box; padding-top: 8px; padding-bottom: 16px; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 13px;"><h2 style="box-sizing: border-box; font-family: Roboto-Light, sans-serif; line-height: 1.4; color: rgb(17, 17, 17); margin-bottom: 10px; font-size: 32px;">Thông tin sản phẩm</h2><h3 style="box-sizing: border-box; font-family: Roboto-Medium, sans-serif; line-height: 1.4; color: rgb(17, 17, 17); margin-bottom: 10px; font-size: 16px;">Dầu gội chống rụng tóc Alfaparf Milano Semi Di Lino Scalp Care Energizing Shampoo 250ml</h3><p style="box-sizing: border-box; margin-right: 0px; margin-bottom: 8px; margin-left: 0px;">Dầu gội chống rụng tóc Alfaparf Milano Semi Di Lino Scalp Care Energizing Shampoo là sản phẩm thuộc dòng Scalp Care chuyên chăm sóc các vấn đề của da đầu với liệu trình chuyên biệt không làm ảnh hưởng đến độ sáng bóng, mượt mà của tóc, mang đến mái tóc đẹp hoàn hảo từ mọi góc nhìn. Tương tự các dòng sản phẩm khác của thương hiệu mỹ phẩm tóc Alfaparf Milano, dòng Scalp Care cũng sử dụng 2 thế hệ chăm sóc tóc chuyên biệt.</p><p style="box-sizing: border-box; margin-right: 0px; margin-bottom: 8px; margin-left: 0px;">Hệ làm bóng tóc</p><ul style="box-sizing: border-box; margin-bottom: 10px;"><li style="box-sizing: border-box;">Shine Fix Complex chứa chiết xuất từ hạt lanh với cấu trúc mạng tinh thể ba chiều, tăng hiệu quả làm bóng tóc và giúp tóc bóng suốt 24 giờ với độ sáng tuyệt đối từ gốc đến ngọn</li><li style="box-sizing: border-box;">Color Fix Complex là sự pha trộn sáng tạo của màng che UVA/UVB cùng chất chống oxy hóa giúp, tăng cường sắc độ của màu nhuộm, giữ màu 91% sau 9 lần gội</li></ul><p style="box-sizing: border-box; margin-right: 0px; margin-bottom: 8px; margin-left: 0px;">Hệ chăm sóc da đầu</p><ul style="box-sizing: border-box; margin-bottom: 10px;"><li style="box-sizing: border-box;">Chiết xuất từ lá đào với các hoạt chất tác động kép sẽ giúp cân bằng, tái tạo, duy trì môi trường nang tóc - môi trường thiết yếu của da đầu và tạo ra điều kiện hoàn hảo nhất giúp tóc tăng trưởng mạnh mẽ, khỏe đẹp, sáng bóng tự nhiên</li><li style="box-sizing: border-box;">Hỗn hợp dưỡng chất chiết xuất từ nho, quả óc chó và Rocket Extracts giúp chống và ngăn ngừa rụng tóc, bảo vệ nang tóc khỏi tác động của các gốc tự do</li><li style="box-sizing: border-box;">Chiết xuất hạt lựu tái cân bằng và làm sạch gàu, giảm và loại bỏ cảm giác khó chịu, ngứa ngáy trên da đầu do gàu</li><li style="box-sizing: border-box;">Chiết xuất cây Buchu giúp da đầu trở lại trạng thái bình thường, đồng thời kiểm soát và giảm thiểu tình trạng da đầu tiết dầu</li></ul><p style="box-sizing: border-box; margin-right: 0px; margin-bottom: 8px; margin-left: 0px;">Alfaparf Milano Semi Di Lino Scalp Care Energizing Shampoo được dùng cho da đầu bị lão hóa dẫn đến rụng tóc. Các thành phần dưỡng chất từ 2 thế hệ chăm sóc tóc mới nhất sẽ cân bằng trạng thái của da đầu, ngăn ngừa lão hóa, giảm rụng tóc hiệu quả đồng thời vẫn nhẹ nhàng làm sạch, loại bỏ bụi bẩn, bã nhờn và giúp bạn có được mái tóc bóng sáng, óng ả và mượt mà hơn hẳn. Sản phẩm không chứa Sulfate, Paraffin, dầu khoáng và các chất gây dị ứng, an toàn cho da, thân thiện với môi trường. </p><p style="box-sizing: border-box; margin-right: 0px; margin-bottom: 8px; margin-left: 0px;">Hướng dẫn sử dụng và bảo quản</p><ul style="box-sizing: border-box; margin-bottom: 10px;"><li style="box-sizing: border-box;">Làm ướt tóc</li><li style="box-sizing: border-box;">Lấy một lượng vừa đủ, tạo bọt và massage nhẹ nhàng lên tóc</li><li style="box-sizing: border-box;">Xả sạch với nước</li><li style="box-sizing: border-box;">Bảo quản nơi khô ráo, thoáng mát tránh ánh nắng trực tiếp và nhiệt độ cao</li><li style="box-sizing: border-box;">Để xa tầm tay trẻ em</li></ul><p style="box-sizing: border-box; margin-right: 0px; margin-bottom: 8px; margin-left: 0px;">Thông tin thương hiệu</p><p style="box-sizing: border-box; margin-right: 0px; margin-bottom: 8px; margin-left: 0px;">Alfaparf Milano là thương hiệu mỹ phẩm tóc gắn liền với dòng thời trang cao cấp thừa kế những tinh hoa của nước Ý. Với đầy đủ các dòng sản phẩm chăm sóc, tái tạo và tạo kiểu làm tăng thêm vẻ đẹp quyến rũ, sang trọng cho người phụ nữ dù họ ở bất cứ độ tuổi nào, hay bất cứ nơi đâu, Alfaparf Milano đã có mặt tại tất cả các salon tóc hàng đầu trên thế giới, được các nhà tạo mẫu tóc chuyên nghiệp và người dùng cao cấp ưa chuộng và sử dụng. Các sản phẩm của Alfaparf Milano đều được chứng nhận chất lượng, được thử nghiệm nhiều lần để đảm bảo hiệu quả sản phẩm, đáp ứng tối đa nhu cầu và mong đợi của khách hàng. </p></div>', '', 1, '2016-09-21 02:40:34', '2016-09-21 02:42:14', ''),
(44, 39, '', '<h3 style="box-sizing: border-box; font-family: Roboto-Medium, sans-serif; line-height: 1.4; color: rgb(17, 17, 17); margin-bottom: 10px; font-size: 16px;">Kem chống nắng Tonymoly My Sunny Powder Finish Sun Milk SPF47 PA++ 45ml</h3><p style="box-sizing: border-box; margin-right: 0px; margin-bottom: 8px; margin-left: 0px; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 13px;">Kem chống nắng Tonymoly My Sunny Powder Finish Sun Milk chứa chất chống nắng SPF47 PA++ có khả năng bảo vệ da khỏi tác động của tia UVA, UVB. Sản phẩm có dạng sữa nhẹ, thẩm thấu nhanh mà không gây nhờn dính, khó chịu trên da. Thành phần chiết xuất từ cây giọt băng, hoa lily, bột vàng trắng và chiết xuất lô hội sẽ làm dịu kích ứng, cân bằng da, kiểm soát độ ẩm, duy trì lượng nước cần thiết để da luôn mịn màng, mềm mại. </p><p style="box-sizing: border-box; margin-right: 0px; margin-bottom: 8px; margin-left: 0px; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 13px;">Hướng dẫn sử dụng và bảo quản</p><ul style="box-sizing: border-box; margin-bottom: 10px; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 13px;"><li style="box-sizing: border-box;">Lắc đều 3 - 5 lần trước khi dùng</li><li style="box-sizing: border-box;">Lấy một lượng vừa đủ thoa đều lên vùng da tiếp xúc trực tiếp với ánh nắng</li><li style="box-sizing: border-box;">Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp và nhiệt độ cao</li><li style="box-sizing: border-box;">Để xa tầm tay trẻ em</li></ul><p style="box-sizing: border-box; margin-right: 0px; margin-bottom: 8px; margin-left: 0px; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 13px;">Thông tin thương hiệu</p><p style="box-sizing: border-box; margin-right: 0px; margin-bottom: 8px; margin-left: 0px; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 13px;">Tonymoly là thương hiệu Hàn Quốc được thành lập năm 2006. Đến nay, sau mười năm phát triển, Tonymoly đã có hàng trăm cửa hàng bán lẻ tại Hàn Quốc và nhiều đại lý ở Nhật Bản, Đài Loan, Hồng Kông, Trung Quốc, Việt Nam... Mỹ phẩm Tonymoly chú trọng cung cấp các bí quyết trang điểm để các chị em phụ nữ có thể tự quyết định phương pháp làm đẹp phù hợp và tự khám phá vẻ điềm tiềm ẩn của bản thân. Thương hiệu Tonymoly được ghép lại từ "Tony" nghĩa là "vẻ đẹp quyến rũ" trong tiếng Anh và "Moly" nghĩa là "ẩn chứa" trong tiếng Nhật. Hai từ này ghép lại tạo nên đặc trưng của mỹ phẩm Tonymoly đó chính là giúp chị em phụ nữ khám phá vẻ đẹp quyến rũ ẩn chứa trong bản thân mình để luôn trẻ đẹp, rạng ngời. </p>', '', 1, '2016-09-21 02:41:44', '2016-09-21 02:42:10', '');
INSERT INTO `content_products` (`id`, `product_id`, `description`, `content`, `name`, `rank`, `created_at`, `updated_at`, `json_attr`) VALUES
(45, 40, '', '<h2 class="product-description__title" style="margin-right: 0px; margin-bottom: 17px; margin-left: 0px; padding: 0px; font-weight: 700; font-size: 16px; line-height: 2.4rem; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif;">Giới thiệu sản phẩm Nồi kho cá Fujika FJ-KC25 vung kính 2.5L (xanh lá)</h2><div class="product-description__webyclip-thumbnails" style="margin: 0px 0px 15px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><div class="webyclip-thumbnails" id="webyclip_thumbnails" style="margin: 0px; padding: 0px;"></div></div><p><span style="color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;">Cuộc sống với bao bộn bề, lo toan làm chúng ta không có nhiều thời gian để nấu được những món ăn ngon như ý cho gia đình. Hơn nữa, vật giá leo thang, thời gian là vàng, thật không tưởng nếu chúng ta phải “ngồi canh” cả tiếng đồng hồ với một nồi cá kho, nấu trên bếp ga lửu liu diu, sẽ thật mất thời gian và tốn kém. </span></p><div style="margin: 0px 0px 10px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;">Hôm nay, chúng tôi giới thiệu đến bạn một giải pháp nhanh gọn cho những món ăn vốn phức tạp và mất nhiều thời gian nấu nướng, đó chính là chiếc Nồi kho cá nấu cháo đa năng Fujika lõi sứ 2,5l, giúp bạn kho cá, kho thịt lợn, thịt bò, nấu cháo... mà hoàn toàn không phải đổ thêm nước. Nồi ở bên trong được làm từ nồi gốm nên có thể giữ gìn trọn vẹn hương vị các món kho giống như bạn kho trên nồi đất cổ truyền. </div><div style="margin: 0px 0px 10px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;">Với nồi kho, bạn sẽ dễ dàng có được ăn món ăn ngon và bổ dưỡng mà lại không phải mất nhiều thời gian. Khi nào bạn muốn làm món kho, bạn chỉ cần ướp đầy đủ gia vị khoảng 15 – 30 phút rồi cắm điện, để thời gian khoảng 1h hoặc hơn tuỳ vào khẩu vị và món ăn bạn nấu. Bạn có thể hoàn toàn yên tâm là bạn sẽ có một món kho ngon tuyệt.</div>', '', 1, '2016-09-21 02:41:50', '2016-09-21 02:42:07', ''),
(46, 41, '', '<p><span style="color: rgb(17, 17, 17); font-family: arial; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; line-height: 19px; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(255, 255, 255);">Vi xử lý core i7 - 6700HQ, 4 lõi 8 luồng tốc độ 2.6 GHz, RAM 16GB, ổ cứng HDD 1TB + SSD 128GB. Card đồ họa rời Nvidia GeForce GTX 970M 6GB xử lý tốt và nhanh chóng các tác vụ.</span><br></p>', '', 1, '2016-09-21 02:41:55', '2016-09-21 02:41:55', ''),
(47, 42, '', '', '', 1, '2016-09-21 02:42:29', '2016-09-21 02:42:29', ''),
(48, 43, 'thiết kế', '<ul><li style="margin: 0px; padding: 0px; list-style: none; line-height: 16px; font-size: 13px; break-inside: initial; overflow: hidden;"><span style="text-align: justify; margin: 0px 0px 0px 10px; padding: 0px; display: block; color: rgb(84, 83, 81);">hiết kế thanh lịch</span></li><li style="margin: 0px; padding: 0px; list-style: none; line-height: 16px; font-size: 13px; break-inside: initial; overflow: hidden;"><span style="text-align: justify; margin: 0px 0px 0px 10px; padding: 0px; display: block; color: rgb(84, 83, 81);">Màu sắc sang trọng</span></li><li style="margin: 0px; padding: 0px; list-style: none; line-height: 16px; font-size: 13px; break-inside: initial; overflow: hidden;"><span style="text-align: justify; margin: 0px 0px 0px 10px; padding: 0px; display: block; color: rgb(84, 83, 81);">Chất liệu cao cấp</span></li></ul>', 'thiết kế', 1, '2016-09-21 02:42:43', '2016-09-21 02:42:43', ''),
(49, 44, '', '<div id="product_description" style="box-sizing: border-box; width: 984px; min-height: 1px; float: left; border-radius: 4px; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 13px;"><div class="adr tabs-content" style="box-sizing: border-box; padding: 16px 4px;"><div class="tab-content active" id="tab_content_product_introduction" style="box-sizing: border-box; padding-top: 8px; padding-bottom: 16px;"><h3 style="box-sizing: border-box; font-family: Roboto-Medium, sans-serif; line-height: 1.4; color: rgb(17, 17, 17); margin-bottom: 10px; font-size: 16px;">Sữa dưỡng thể Mades Recipes Herbal Happiness Body Lotion 350ml</h3><p style="box-sizing: border-box; margin-right: 0px; margin-bottom: 8px; margin-left: 0px;">Sữa dưỡng thể Mades Recipes Herbal Happiness Body Lotion với thành phần chiết xuất từ tinh chất trà đỏ và các loại thảo dược giúp giữ ẩm, làm mềm da, mang lại cho bạn làn da mịn màng, tươi sáng. Sản phẩm nhẹ nhàng hấp thụ vào da mà không gây cảm giác nhờn dính khó chịu. </p><p style="box-sizing: border-box; margin-right: 0px; margin-bottom: 8px; margin-left: 0px;">Hướng dẫn sử dụng</p><ul style="box-sizing: border-box; margin-bottom: 10px;"><li style="box-sizing: border-box;">Thoa đều khắp cơ thể, massage nhẹ nhàng cho đến khi thẩm thấu hoàn toàn</li></ul><p style="box-sizing: border-box; margin-right: 0px; margin-bottom: 8px; margin-left: 0px;">Thông tin thương hiệu</p><p style="box-sizing: border-box; margin-right: 0px; margin-bottom: 8px; margin-left: 0px;">Recipes là một dòng sản phẩm của Mades. Thương hiệu mỹ phẩm Mades được thành lập bởi ông Joel E. Desensy vào năm 1990, tại Hà Lan. Vào năm 2003, Mades xây dựng một nhà máy mới tại Drachten nằm ở phía bắc Hà Lan và đến năm 2010, nhà máy của Mades là cơ sở đầu tiên ở Hà Lan được cấp chứng nhận GMP. Được sản xuất trên dây chuyền hiện đại cùng công thức độc đáo với nhiều dòng sản phẩm nhỏ như Stackable, Recipes, Body Resort, Chapter,... các sản phẩm của Mades đã mang lại kết quả tốt sau khi sử dụng và được người tiêu dùng nhiều nước ưa chuộng.</p></div><div class="tab-content active" id="tab_content_related_recipes" style="box-sizing: border-box; padding-top: 8px; padding-bottom: 16px;"></div><div class="tab-content active" id="tab_content_related_combos" style="box-sizing: border-box; padding-top: 8px; padding-bottom: 16px;"></div><div class="tab-content active" id="tab_content_related_products_bottom" style="box-sizing: border-box; padding-top: 8px; padding-bottom: 16px;"></div></div></div>', 'Tab 1', 1, '2016-09-21 02:42:51', '2016-09-21 07:48:36', '[{"key":"Màu sắc","value":"Tím than"},{"key":"Kích thước","value":"12x12cm"}]'),
(50, 45, 'Thông tin', '<div style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 19.2px;">Sản phẩm kính phân cực chống tia UV giúp bảo vệ mắt một cách tốt nhất.</div><div style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 19.2px;">Mắt kính có chỉ số UV 400 (100%UV), là chỉ số chống lại tia cực tím cao nên sẽ bảo vệ tối đa đôi mắt của các bạn.</div><div style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 19.2px;">Phù hợp với tiêu chuẩn và yêu cầu an toàn của ECC Châu Âu và Mỹ.</div><div style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 19.2px;">Bảo vệ mắt chống lại các tia UVA và tia UVB.</div><div style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 19.2px;">Cấu tạo mắt kính có bộ lọc loại 3 và lớp quang học loại 1.</div><div style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 19.2px;">Có ống kính phân cực giúp lọc và loại bỏ những ánh sáng phân cực phản xạ lại.</div><div style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 19.2px;">Cải thiện độ tương phản lớn.</div><div style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 19.2px;">Tập trung hình ảnh tốt hơn cho bạn.</div><div style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 19.2px;">Cấu trúc gọng kính được làm bằng nhựa, phù hợp mọi khuôn mặt.</div><div style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 19.2px;">Gọng kính đen sang trọng, lịch lãm. Kiểu dáng vừa giúp bạn tránh khỏi bụi bẩn, khói xe khi ra đường vừa rất thời trang và sành điệu</div><div style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 19.2px;">Không độc hại, không gây dị ứng</div><div style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 19.2px;">Phù hợp cho nam và nữ</div>', 'Thông tin', 1, '2016-09-21 02:43:13', '2016-09-21 02:43:13', ''),
(51, 46, '', '<p><span style="color: rgb(17, 17, 17); font-family: arial; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; line-height: 19px; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(255, 255, 255);">Vi xử lý core i7 - 6700HQ, 4 lõi 8 luồng tốc độ 2.6 GHz, RAM 16GB, ổ cứng HDD 1TB + SSD 128GB. Card đồ họa rời Nvidia GeForce GTX 970M 6GB xử lý tốt và nhanh chóng các tác vụ.</span><span style="color: rgb(17, 17, 17); font-family: arial; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; line-height: 19px; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(255, 255, 255);">Vi xử lý core i7 - 6700HQ, 4 lõi 8 luồng tốc độ 2.6 GHz, RAM 16GB, ổ cứng HDD 1TB + SSD 128GB. Card đồ họa rời Nvidia GeForce GTX 970M 6GB xử lý tốt và nhanh chóng các tác vụ.</span><br></p>', '', 1, '2016-09-21 02:43:36', '2016-09-21 02:43:36', ''),
(52, 47, 'Thông tin', '<p><span style="color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 19.2px;">Kính nhìn xuyên đêm là sáng chế đoạt giải USA Technology Awards danh giá của Mỹ. Với công nghệ Night Coated Protection Kính xuyên đêm dễ dàng loại bỏ 100% tia UVA & UVB – Chặn ánh sáng chói lóa của ánh đèn pha xe ngược chiều giúp bạn có tầm nhìn tốt hơn khi lưu thông trên đường dù bạn đang sử dụng bât cứ phương tiện lưu thông nào như xe đạp, xe máy, ô tô….</span><br></p>', 'Thông tin', 1, '2016-09-21 02:44:57', '2016-09-21 02:45:07', ''),
(53, 48, '', '<h2 class="product-description__title" style="margin-right: 0px; margin-bottom: 17px; margin-left: 0px; padding: 0px; font-weight: 700; font-size: 16px; line-height: 2.4rem; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif;">Giới thiệu sản phẩm Máy hút bụi cầm tay Omi Nanny  V1 (Xanh lá)</h2><div class="product-description__webyclip-thumbnails" style="margin: 0px 0px 15px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><div class="webyclip-thumbnails" id="webyclip_thumbnails" style="margin: 0px; padding: 0px;"></div></div><p><span style="margin: 0px; padding: 0px; font-weight: 700; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;">OMI Nanny Handheld Vacuum Cleaner V1 (HVC-HF003)</span><span style="color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"> là chiếc máy hút bụi cầm tay nhỏ gọn, mạnh mẽ và hoạt động hiệu quả mà mọi gia đình hiện đại đều cần đến. Sản phẩm là giải pháp thông minh cho công việc dọn dẹp hằng ngày, tiết kiệm nhiều thời gian thao tác, giữ mọi ngóc ngách dù là nhỏ nhất luôn được sạch sẽ. </span><span style="margin: 0px; padding: 0px; font-weight: 700; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;">OMI HVC-HF003</span><span style="color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"> có thiết kế cầm tay nhỏ gọn, được trang bị bộ lọc HEPA tiên tiến, dung tích chứa bụi đến 0.5L cùng nhiều đầu hút khác nhau cho hiệu quả hoạt động cao.</span></p><div style="margin: 0px 0px 10px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><span style="margin: 0px; padding: 0px; font-weight: 700;">TÍNH NĂNG NỔI BẬT</span></div><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><span style="margin: 0px; padding: 0px; font-weight: 700;">Nhỏ gọn, tiện dụng</span><br style="margin: 0px; padding: 0px;">Máy có thiết kế vừa vặn tay cầm, trọng lượng chỉ 3kg. Dây nối của máy dài đến 5m cho phép bạn linh hoạt di chuyển máy đến những góc nhỏ nhất trong nhà.</p><p><span style="color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;">></span></p><p align="center" style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><img class="productlazyimage" data-original="http://hcm.lazada.vn/static/content/Home-Appliances/may-hut-bui-omi-HVC-HF003-01.jpg" alt="" src="http://hcm.lazada.vn/static/content/Home-Appliances/may-hut-bui-omi-HVC-HF003-01.jpg" style="margin: 0px; padding: 0px; max-width: 100%; display: inline;"></p><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><span style="margin: 0px; padding: 0px; font-weight: 700;">Làm sạch hiệu quả</span><br style="margin: 0px; padding: 0px;">Với công suất hoạt động bình thường là 800W (công suất tối đa 900W), máy hút bụi <span style="margin: 0px; padding: 0px; font-weight: 700;">OMI HVC-HF003</span> có khả năng hút sạch bụi bẩn một cách hiệu quả và nhanh chóng. Máy có thể chứa đến 0.5L bụi, giúp bạn tiết kiệm được nhiều thời gian hơn trong việc làm sạch nhà cửa lẫn làm sạch máy sau khi dùng. Sản phẩm được trang bị nhiều đầu hút với kích thước khác nhau, cho phép bạn linh hoạt hút bụi ở nhiều bề mặt sàn nhà và vật dụng.</p><p align="center" style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><img class="productlazyimage" data-original="http://hcm.lazada.vn/static/content/Home-Appliances/may-hut-bui-omi-HVC-HF003-02.jpg" alt="" src="http://hcm.lazada.vn/static/content/Home-Appliances/may-hut-bui-omi-HVC-HF003-02.jpg" style="margin: 0px; padding: 0px; max-width: 100%; display: inline;"></p><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><span style="margin: 0px; padding: 0px; font-weight: 700;">Bộ lọc HEPA - lọc sạch ngay cả những hạt bụi nhỏ nhất</span><br style="margin: 0px; padding: 0px;">Bộ lọc HEPA được chứng nhận cho hiệu quả lọc tối thiểu là 99,97% ở kích thước 0.3 micron. Như vậy, những hạt bụi cực nhỏ, có kích thước 0.3 micron cũng được máy lọc sạch, trả lại không khí trong lành cho không gian nhà ở.</p><p align="center" style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><img class="productlazyimage" data-original="http://hcm.lazada.vn/static/content/Home-Appliances/may-hut-bui-omi-HVC-HF003-03.jpg" alt="" src="http://hcm.lazada.vn/static/content/Home-Appliances/may-hut-bui-omi-HVC-HF003-03.jpg" style="margin: 0px; padding: 0px; max-width: 100%; display: inline;"></p>', '', 1, '2016-09-21 02:45:37', '2016-09-21 02:46:33', ''),
(54, 49, 'thiết kế', '<ul class="prd-attributesList ui-listBulleted js-short-description" style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; list-style-position: initial; list-style-image: initial; column-count: 2; color: rgb(58, 67, 70); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><li class="" style="margin: 0px; padding: 0px; list-style: none; line-height: 16px; font-size: 13px; break-inside: initial; overflow: hidden;"><span style="margin: 0px 0px 0px 10px; padding: 0px; display: block; color: rgb(84, 83, 81);">Thiết kế thời trang thanh lịch</span></li><li class="" style="margin: 0px; padding: 0px; list-style: none; line-height: 16px; font-size: 13px; break-inside: initial; overflow: hidden;"><span style="margin: 0px 0px 0px 10px; padding: 0px; display: block; color: rgb(84, 83, 81);">Đường may tinh tế</span></li></ul>', 'thiết kế', 1, '2016-09-21 02:46:18', '2016-09-21 02:46:18', ''),
(55, 50, '', '', '', 1, '2016-09-21 02:47:01', '2016-09-21 02:47:01', ''),
(56, 51, '', '<h2 class="product-description__title" style="margin-right: 0px; margin-bottom: 17px; margin-left: 0px; padding: 0px; font-weight: 700; font-size: 16px; line-height: 2.4rem; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif;">Giới thiệu sản phẩm Kéo cắt gà vịt</h2><div class="product-description__webyclip-thumbnails" style="margin: 0px 0px 15px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><div class="webyclip-thumbnails" id="webyclip_thumbnails" style="margin: 0px; padding: 0px;"></div></div><p><span style="color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;">- Kéo cắt gà  tiện lợi, hiện đại cắt gà, vịt dễ dàng, sạch sẽ. </span><br style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><span style="color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;">- Thiết kế đặt biệt giúp cắt được thịt và xương gà vịt nhanh chóng. </span><br style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><span style="color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;">- Chất thép siêu bền, chống gỉ, sạch sẽ, tiện lợi an toàn cho sức khỏe. </span><br style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><span style="color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;">- Cán êm ái, độc đáo, tiện dụng. </span><br style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><span style="color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;">- Có khóa an toàn giúp hạn chế tối đa các thương tích khi sử dụng kéo. </span><br style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><span style="color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;">- Kéo có thể cắt được xương, mổ cá, cắt vây cá, mang cá, đầu cá, vịt, ngan. </span><br style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><span style="color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;">- Kích thước: dài 23cm  </span><br style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><span style="color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;">- Cán êm ái, độc đáo, tiện dụng. </span><br style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><span style="color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;">- Kéo cắt gà giúp bạn sẽ cắt được các loại gà, vịt thành những miếng theo ý muốn.</span><br></p>', '', 1, '2016-09-21 02:47:53', '2016-09-21 02:56:45', ''),
(57, 52, 'Thông tin', '<p><span style="color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 19.2px;">Trong mọi thời đại, túi xách luôn được xem là một phụ kiện cần thiết đối với cả nam giới và nữ giới. Chiếc cặp nam </span><span style="margin: 0px; padding: 0px; font-weight: 700; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 19.2px;">RHINOS LIFE</span><span style="color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 19.2px;"> sở hữu kiểu dáng hợp thời trang và nam tính, đồng thời chiếc cặp còn làm nổi bật lên phong cách mạnh mẽ và gu thẩm mỹ cao cho phái nam mỗi khi bước xuống phố. Được trang bị màu nâu da bò kết hợp với chất liệu da PU cao cấp, chiếc cặp mang tới vẻ đẹp sang trọng và độ bền cao, giúp gắn kết lâu dài giữa bạn và món đồ gần gũi này. Với chiếc cặp nam </span><span style="margin: 0px; padding: 0px; font-weight: 700; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 19.2px;">RHINOS LIFE</span><span style="color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 19.2px;"> , các chàng trai có thể tự tin bước xuống phố, đựng tài liệu khi tới trường hoặc nơi làm việc, và cũng có thể đựng bất kể những món đồ bạn muốn mang theo mỗi khi ra khỏi nhà,… Ngoài ra, cặp nam </span><span style="margin: 0px; padding: 0px; font-weight: 700; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 19.2px;">RHINOS LIFE</span><span style="color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 19.2px;"> sẽ trở thành những món quà ý nghĩa cho người thân, bạn bè, hay người yêu,… của bạn vào những dịp quan trọng. Hãy để chiếc cặp </span><span style="margin: 0px; padding: 0px; font-weight: 700; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 19.2px;">RHINOS LIFE</span><span style="color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 19.2px;"> luôn sánh bước cùng bạn hay những người thân yêu của bạn mỗi khi bước xuống phố nhé!</span><br></p>', 'Thông tin', 1, '2016-09-21 02:48:01', '2016-09-21 02:56:41', ''),
(58, 53, 'Giới thiệu sản phẩm Bạt phủ ô tô 2 lớp oto 7 chỗ siêu nhẹ SU7', '<p style="margin-bottom: 0.0001pt; line-height: 18pt; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;"><b>Size YL (Hatchback) 4.9 x 1.9 x 1.75m</b></p><p style="margin-bottom: 0.0001pt; line-height: 18pt; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;"><b><br></b></p><p style="margin-bottom: 0.0001pt; line-height: 18pt; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;">\r\n</p><p style="margin-bottom: 0.0001pt; text-align: justify; line-height: 13.5pt; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;">\r\n<b>1. Ưu điểm </b><b style="line-height: 13.5pt;">Bạt phủ ô tô 2\r\nlớp oto 7 chỗ siêu nhẹ SU7</b></p><p style="margin-bottom: 0.0001pt; text-align: justify; line-height: 13.5pt; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;"><b style="line-height: 13.5pt;"><br></b></p><p style="margin-bottom: 0.0001pt; text-align: justify; line-height: 13.5pt; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;">\r\n</p><p style="margin-bottom: 0.0001pt; text-align: justify; line-height: 13.5pt; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;">\r\nBạt phủ xe có  mặt ngoài là lớp vải tráng PEVA chịu\r\nnhiệt, chống thấm, dai & chắc giúp chống nắng, chống thấm nước,\r\nchống bám bụi hiệu quả lớp trong lót bông mềm mại không làm trầy\r\nxước khi chà xát với sơn xe. </p>\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: 13.5pt; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;">\r\nBạt được thiết kế có tai gương, bo chun 2 đầu cùng các dây\r\nđai, giúp bạt luôn ôm sát vào thân xe vừa gọn gàng vừa không lo bạt\r\nbị xô lật khi để lâu ngoài trời.</p>\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: 13.5pt; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;">\r\nCác dải phản quang giúp xe khác có thể nhận thấy xe của bạn\r\ntrong đêm, tránh được các va quệt đáng tiếc.</p>\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: 13.5pt; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;">\r\nTrọng lượng  nhẹ & dễ dàng sử dụng & gấp\r\ngọn </p>\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: 13.5pt; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;">\r\nChất liệu: vải New PEVA lót bông</p>\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: 13.5pt; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;">\r\nMàu: bạc</p>\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: 13.5pt; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;">\r\nTrọng lượng: 2.5-3kg</p><p><br></p><p style="margin-bottom: 0.0001pt; text-align: justify; line-height: 13.5pt; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;">\r\n<b style="line-height: normal;">Thông tin chi tiết</b></p><p style="margin-bottom: 0.0001pt; text-align: justify; line-height: 13.5pt; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;"><b style="line-height: normal;"><br></b></p><p style="margin-bottom: 0.0001pt; text-align: justify; line-height: 18pt; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;">\r\nChiếc Ôtô là tài sản đắt tiền và quý giá, chắc hẳn bạn sẽ cảm\r\nthấy thật đau lòng khi chiếc xe yêu quý của mình phải chịu bao mưa\r\nnắng, gió bụi, lá cây, xây xước khi phải để ngoài trời, hay khi đặt\r\nbên cạnh các xe khác... Bạt phủ ô tô 2 lớp oto 7 chỗ\r\nsiêu nhẹ <b>SU7</b> với chất liệu cao cấp - giải\r\npháp tốt nhất cho bạn bảo vệ "xế yêu" của mình.</p><p style="margin-bottom: 0.0001pt; text-align: justify; line-height: 18pt; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;"><br></p><p>Bạt phủ xe có  mặt ngoài là lớp vải\r\n<b>PEVA</b> chịu nhiệt, chống thấm, dai & chắc giúp chống nắng,\r\nchống thấm nước, chống bám bụi hiệu quả lớp trong lót bông mềm mại\r\nkhông làm trầy xước khi chà xát với sơn xe. Khi phủ bạt bạn sẽ\r\nkhông còn phải lo lắng bụi bẩn, lá cây, thậm chí là phân chim hay\r\ntrẻ nhỏ vẽ, nghịch bẩn... trời mưa hay nắng cũng có thể yên tâm\r\nrằng lớp vỏ xe đã được bảo vệ tốt nhất khỏi những tác động bên\r\nngoài.</p><p style="margin-bottom: 0.0001pt; text-align: justify; line-height: 18pt; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;">\r\nBạt phủ xe được thiết kế có tai gương, bo\r\nchun 2 đầu cùng các dây đai, giúp bạt luôn ôm sát vào thân xe vừa\r\ngọn gàng vừa không lo bạt bị xô lật khi để lâu ngoài\r\ntrời.</p><p style="margin-bottom: 0.0001pt; text-align: justify; line-height: 18pt; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;"><br></p><p style="margin-bottom: 0.0001pt; text-align: justify; line-height: 18pt; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;">\r\nCác dải phản quang giúp xe khác có thể nhận thấy xe của bạn\r\ntrong đêm, tránh được các va chạm đáng tiếc</p><p style="margin-bottom: 0.0001pt; text-align: justify; line-height: 18pt; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;"><br></p><p style="margin-bottom: 0.0001pt; text-align: justify; line-height: 18pt; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;">\r\nVới trọng lượng nhẹ & dễ dàng sử dụng và gấp gọn chiếc\r\nbạt sẽ là người bạn đồng hành không thể thiếu cho mỗi chiếc xế\r\nhộp. <br></p><p style="margin-bottom: 0.0001pt; text-align: justify; line-height: 18pt; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;"><br></p><p><br></p>', 'Giới thiệu sản phẩm Bạt phủ ô tô 2 lớp oto 7 chỗ siêu nhẹ SU7', 1, '2016-09-21 02:48:20', '2016-09-21 02:48:44', ''),
(59, 54, 'Thông tin', '<ul class="prd-attributesList ui-listBulleted js-short-description" style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; list-style-position: initial; list-style-image: initial; column-count: 2; color: rgb(58, 67, 70); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><li class="" style="margin: 0px; padding: 0px; list-style: none; line-height: 16px; font-size: 13px; break-inside: initial; overflow: hidden;"><span style="margin: 0px 0px 0px 10px; padding: 0px; display: block; color: rgb(84, 83, 81);">Thiết kế thanh lịch</span></li><li class="" style="margin: 0px; padding: 0px; list-style: none; line-height: 16px; font-size: 13px; break-inside: initial; overflow: hidden;"><span style="margin: 0px 0px 0px 10px; padding: 0px; display: block; color: rgb(84, 83, 81);">Dễ dàng phối hợp với các trang phục và phụ kiện khác</span></li><li class="" style="margin: 0px; padding: 0px; list-style: none; line-height: 16px; font-size: 13px; break-inside: initial; overflow: hidden;"><span style="margin: 0px 0px 0px 10px; padding: 0px; display: block; color: rgb(84, 83, 81);">Giúp phái đẹp tăng thêm vẻ nữ tính; dịu dàng</span></li></ul>', 'Thông tin', 1, '2016-09-21 02:48:42', '2016-09-21 02:48:42', ''),
(60, 55, '', '', '', 1, '2016-09-21 02:49:22', '2016-09-21 02:49:22', ''),
(61, 56, 'Thông tin', '<p><span style="margin: 0px; padding: 0px; font-weight: 700; color: rgb(0, 0, 0); font-family: Tahoma, Geneva, sans-serif; font-size: 12px; line-height: 24px;">Thiết kế sang trọng và nam tính</span><br style="margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Tahoma, Geneva, sans-serif; font-size: 12px; line-height: 24px;"><span style="color: rgb(0, 0, 0); font-family: Tahoma, Geneva, sans-serif; font-size: 12px; line-height: 24px;">Với thiết kế tiện dụng, Túi đeo chéo Polo Videng mang tới cho bạn sự tiên dụng hơn cả nhờ thiết kế quai xách tay và được trang bị thêm quai đeo chéo tạo sự linh hoạt hơn trong khi sử dụng. Cùng với kiểu dáng gọn gàng và hiện đại, chiếc Túi đeo chéo Polo Videng tạo nên vẻ đẹp sang trọng và cá tính mạnh mẽ, mang tới cho bạn sự tự tin mỗi khi bước xuống phố.</span><br></p>', 'Thông tin', 1, '2016-09-21 02:50:09', '2016-09-21 02:50:09', ''),
(62, 57, '', '<h2 class="product-description__title" style="margin-right: 0px; margin-bottom: 17px; margin-left: 0px; padding: 0px; font-weight: 700; font-size: 16px; line-height: 2.4rem; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif;">Giới thiệu sản phẩm Bộ vá muỗng làm bếp 6 món Tashuan TS-3455 (Đen)</h2><div class="product-description__webyclip-thumbnails" style="margin: 0px 0px 15px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><div class="webyclip-thumbnails" id="webyclip_thumbnails" style="margin: 0px; padding: 0px;"></div></div><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;">Là sản phẩm chính hãng của công ty nhựa Tashuan hàng đầu Việt Nam, sản xuất theo công nghệ Đài Loan và tiêu chuẩn Quốc tế, Sản phẩm chế tạo tỉ mỉ và chỉn chu trong từng đường nét kết cấu và kiểu dáng tạo hình, Kiểu dáng sẽ là trợ thủ đắc lực cho các bà nội trợ trong căn bếp yêu thương của gia đình mình. Với thiết kế sang trọng, chất lượng đảm bảo, <span style="margin: 0px; padding: 0px; font-weight: 700;">Bộ vá muỗng làm bếp 6 món Tashuan TS-3455</span> vừa dùng để phục vụ việc nấu ăn vừa làm cho gian bếp nhà bạn trở nên chuyên nghiệp, bắt mắt hơn rất nhiều. Hãy sở hữu bộ sản phẩm này để làm ra những bữa ăn thật ngon cho gia đình bạn. <br style="margin: 0px; padding: 0px;"></p><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><br style="margin: 0px; padding: 0px;"></p><div style="margin: 0px 0px 10px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; text-align: center;"><img class="productlazyimage" data-original="http://static-01.lazada.vn/p/tashuan-9330-113872-1-zoom.jpg" alt="tashuan-9330-113872-1-zoom.jpg" src="http://static-01.lazada.vn/p/tashuan-9330-113872-1-zoom.jpg" style="margin: 0px; padding: 0px; max-width: 100%; display: inline;"></div><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><br style="margin: 0px; padding: 0px;"><span style="margin: 0px; padding: 0px; font-weight: 700;">Ưu điểm:</span> Sản phẩm Chất liệu nhựa PP an toàn, không làm ảnh hưởng đến chất lượng món ăn khi nấu. Sản phẩm giúp bạn nấu nướng 1 cách nhanh, gọn và đẹp mắt hơn rất nhiều.</p><div><br></div>', '', 1, '2016-09-21 02:50:15', '2016-09-21 02:56:04', ''),
(63, 58, 'Thông tin', '<ul class="prd-attributesList ui-listBulleted js-short-description" style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; list-style-position: initial; list-style-image: initial; column-count: 2; color: rgb(58, 67, 70); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><li class="" style="margin: 0px; padding: 0px; list-style: none; line-height: 16px; font-size: 13px; break-inside: initial; overflow: hidden;"><span style="margin: 0px 0px 0px 10px; padding: 0px; display: block; color: rgb(84, 83, 81);">Thiết kế 2 dây dạng mảnh, giúp nâng đỡ và bảo vệ vòng 1 hiệu quả, mang đến phong cách trẻ trung, sành điệu</span></li><li class="" style="margin: 0px; padding: 0px; list-style: none; line-height: 16px; font-size: 13px; break-inside: initial; overflow: hidden;"><span style="margin: 0px 0px 0px 10px; padding: 0px; display: block; color: rgb(84, 83, 81);">Áo không có gọng giúp tạo cảm giác nhẹ nhàng, không bị gò bó, khó chịu</span></li><li class="" style="margin: 0px; padding: 0px; list-style: none; line-height: 16px; font-size: 13px; break-inside: initial; overflow: hidden;"><span style="margin: 0px 0px 0px 10px; padding: 0px; display: block; color: rgb(84, 83, 81);">Phối ren tinh tế, điệu đà tạo nên sự năng động, tự tin cho bạn gái trong các hoạt động hằng ngày</span></li></ul>', 'Thông tin', 1, '2016-09-21 02:50:50', '2016-09-21 02:50:50', ''),
(64, 59, 'Thông tin', '<p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 19.2px;">Vòng Tay Nam VT69</p><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 19.2px;">* Màu sắc: Như hình</p><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 19.2px;">* Chất liệu : dây da đính họa tiết kim loại</p><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 19.2px;">* Sản xuất : ViệtNam</p><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 19.2px;">* Chiều dài : 25-27cm</p><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 19.2px;">* Trọng lượng : 50g</p><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 19.2px;">Ưu điểm: có thểthao ra dễ dàng</p>', 'Thông tin', 1, '2016-09-21 02:52:06', '2016-09-21 02:52:06', ''),
(65, 60, '', '', '', 1, '2016-09-21 02:52:32', '2016-09-21 02:52:32', ''),
(66, 61, 'Thông tin', '<p><span style="margin: 0px; padding: 0px; font-weight: 700; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 19.2px;">Mô tả sản phẩm:</span><br style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 19.2px;"></p><ul style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; list-style: none; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 19.2px;"><li style="margin: 0px 0px 0px 14px; padding: 0px; list-style: disc;">Vòng đeo tay nam hình cung hoàng đạo</li><li style="margin: 0px 0px 0px 14px; padding: 0px; list-style: disc;">Kiểu: Punk / Retro</li><li style="margin: 0px 0px 0px 14px; padding: 0px; list-style: disc;">Chất liệu: da tổng hợp phối kim loại</li><li style="margin: 0px 0px 0px 14px; padding: 0px; list-style: disc;">Kích thước vòng: 20 cm</li><li style="margin: 0px 0px 0px 14px; padding: 0px; list-style: disc;">Màu sắc: Nâu</li><li style="margin: 0px 0px 0px 14px; padding: 0px; list-style: disc;">Lưu ý: tránh nhiệt và nước có thể gây ra sự đổi màu hoặc vết bẩn</li></ul>', 'Thông tin', 1, '2016-09-21 02:53:29', '2016-09-21 02:53:29', ''),
(67, 62, 'Thông tin', '<p><span style="color: rgb(84, 83, 81); font-family: Helvetica, Arial, sans-serif; font-size: 13px;">Thiết kế váy ngắn vừa, tôn lên đôi chân thon gọn</span><br></p>', 'Thông tin', 1, '2016-09-21 02:54:23', '2016-09-21 02:54:23', ''),
(68, 63, '', '', '', 1, '2016-09-21 02:55:02', '2016-09-21 02:55:02', ''),
(69, 64, '', '<p><br></p><p style="box-sizing: border-box; margin: 0px 0px 10px; padding: 0px; list-style: none; color: rgb(51, 51, 51); font-family: "Helvetica Neue", Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; line-height: 26px; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">Máy tính xách tay mới nhất của HP, Spectre 13 chỉ dày 10,4mm, mỏng hơn cả MacBook của Apple (13,2mm) và XPS của Dell 13 (15,2mm), giữ vị trí mỏng nhất hiện tại. Không chỉ vậy, sản phẩm còn mang nét khác biệt lẫn độc đáo trong thiết kế, tạo được dấu ấn riêng trong thị trường latop vốn đã có nhiều sản phẩm nổi bật hiện nay.</p><p><br class="Apple-interchange-newline"><br></p>', '', 1, '2016-09-21 02:55:17', '2016-09-21 02:55:46', ''),
(70, 65, 'Giới thiệu sản phẩm Bộ 06 miếng che nắng cho ô tô', '<p><br></p><p style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 19.2px;">\r\nMàu Sắc: Bạc</p><p>\r\n<br></p><p style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 19.2px;">\r\nKích thước:Tấm lớn 150 x 70cm, Che kính lớn 150 x\r\n50cm, Che kính bé 44 x 36cm, Che kính dài 65 x\r\n38cm             \r\n  </p><p>\r\n<br></p><p style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 19.2px;">\r\nChất liệu: Cao cấp</p><p>\r\n<br></p><p style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 19.2px;">\r\n ĐẶC ĐIỂM NỔI BẬT</p><p>\r\n<br></p><p style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 19.2px;">\r\n- Chế tạo từ chất liệu chịu nhiệt</p><p>\r\n<br></p><p style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 19.2px;">\r\n- Tráng bạc 100%, phản ánh sáng cao và ngăn ngừa 99% ánh sáng\r\nvà các tia có hại</p><p>\r\n<br></p><p style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 19.2px;">\r\n- Tạo ánh sáng dịu mắt</p><p>\r\n<br></p><p style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 19.2px;">\r\n- Có nút hút chân không</p><p>\r\n<br></p><p style="margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 19.2px;">\r\n- Mỗi bộ sản phẩm có 6 mảnh cho các cửa kính của ô tô 4 chỗ,\r\ncó thể gấp lại gọn gàng sau khi sử dụng</p><p><br></p>', 'Giới thiệu sản phẩm Bộ 06 miếng che nắng cho ô tô', 1, '2016-09-21 02:55:29', '2016-09-21 02:55:42', ''),
(71, 65, 'Minh họa cách sử dụng sản phẩm', '<p><img title="mieng-che-nang-cho-o-to-1_zpsfdn4ud8c" alt="mieng-che-nang-cho-o-to-1_zpsfdn4ud8c" src="http://cfr.com.vn/assets/post/57e1f65ccb28c-21-09-2016-mieng-che-nang-cho-o-to-1-zpsfdn4ud8cjpg.jpg"><img title="mieng-che-nang-cho-o-to-2_zpshkrwdzwe" alt="mieng-che-nang-cho-o-to-2_zpshkrwdzwe" src="http://cfr.com.vn/assets/post/57e1f675394fc-21-09-2016-mieng-che-nang-cho-o-to-2-zpshkrwdzwejpg.jpg"><img title="mieng-che-nang-cho-o-to-3_zps0d2vsuun" alt="mieng-che-nang-cho-o-to-3_zps0d2vsuun" src="http://cfr.com.vn/assets/post/57e1f67b07daa-21-09-2016-mieng-che-nang-cho-o-to-3-zps0d2vsuunjpg.jpg"><img title="mieng-che-nang-cho-o-to-4_zpsgfiys1ef" alt="mieng-che-nang-cho-o-to-4_zpsgfiys1ef" src="http://cfr.com.vn/assets/post/57e1f6802c22b-21-09-2016-mieng-che-nang-cho-o-to-4-zpsgfiys1efjpg.jpg"><br></p>', 'Minh họa cách sử dụng sản phẩm', 2, '2016-09-21 02:55:29', '2016-09-21 02:55:29', '');
INSERT INTO `content_products` (`id`, `product_id`, `description`, `content`, `name`, `rank`, `created_at`, `updated_at`, `json_attr`) VALUES
(72, 66, '', '<p><br></p><p style="box-sizing: border-box; margin: 0px 0px 10px; padding: 0px; list-style: none; color: rgb(51, 51, 51); font-family: "Helvetica Neue", Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; line-height: 26px; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">Máy tính xách tay mới nhất của HP, Spectre 13 chỉ dày 10,4mm, mỏng hơn cả MacBook của Apple (13,2mm) và XPS của Dell 13 (15,2mm), giữ vị trí mỏng nhất hiện tại. Không chỉ vậy, sản phẩm còn mang nét khác biệt lẫn độc đáo trong thiết kế, tạo được dấu ấn riêng trong thị trường latop vốn đã có nhiều sản phẩm nổi bật hiện nay.</p><p><br class="Apple-interchange-newline"><br></p>', '', 1, '2016-09-21 02:56:17', '2016-09-21 02:56:28', ''),
(73, 67, '', '', '', 1, '2016-09-21 02:57:08', '2016-09-21 02:57:08', ''),
(74, 68, 'Thông tin', '<ul class="prd-attributesList ui-listBulleted js-short-description" style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; list-style-position: initial; list-style-image: initial; column-count: 2; color: rgb(58, 67, 70); font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><li class="" style="margin: 0px; padding: 0px; list-style: none; line-height: 16px; font-size: 13px; break-inside: initial; overflow: hidden;"><span style="margin: 0px 0px 0px 10px; padding: 0px; display: block; color: rgb(84, 83, 81);">Thiết kế thời trang</span></li><li class="" style="margin: 0px; padding: 0px; list-style: none; line-height: 16px; font-size: 13px; break-inside: initial; overflow: hidden;"><span style="margin: 0px 0px 0px 10px; padding: 0px; display: block; color: rgb(84, 83, 81);">Chất liệu cao cấp</span></li><li class="" style="margin: 0px; padding: 0px; list-style: none; line-height: 16px; font-size: 13px; break-inside: initial; overflow: hidden;"><span style="margin: 0px 0px 0px 10px; padding: 0px; display: block; color: rgb(84, 83, 81);">Dễ dàng phối trang phục</span></li></ul>', 'Thông tin', 1, '2016-09-21 02:57:34', '2016-09-21 02:57:34', ''),
(75, 69, '', '<p><br></p><p style="box-sizing: border-box; margin: 0px 0px 10px; padding: 0px; list-style: none; color: rgb(51, 51, 51); font-family: "Helvetica Neue", Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; line-height: 26px; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">Máy tính xách tay mới nhất của HP, Spectre 13 chỉ dày 10,4mm, mỏng hơn cả MacBook của Apple (13,2mm) và XPS của Dell 13 (15,2mm), giữ vị trí mỏng nhất hiện tại. Không chỉ vậy, sản phẩm còn mang nét khác biệt lẫn độc đáo trong thiết kế, tạo được dấu ấn riêng trong thị trường latop vốn đã có nhiều sản phẩm nổi bật hiện nay.</p><p><br class="Apple-interchange-newline"><br></p>', '', 1, '2016-09-21 02:57:42', '2016-09-21 02:58:04', ''),
(76, 70, '', '<p><br></p><p style="box-sizing: border-box; margin: 0px 0px 10px; padding: 0px; list-style: none; color: rgb(51, 51, 51); font-family: "Helvetica Neue", Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; line-height: 26px; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">Máy tính xách tay mới nhất của HP, Spectre 13 chỉ dày 10,4mm, mỏng hơn cả MacBook của Apple (13,2mm) và XPS của Dell 13 (15,2mm), giữ vị trí mỏng nhất hiện tại. Không chỉ vậy, sản phẩm còn mang nét khác biệt lẫn độc đáo trong thiết kế, tạo được dấu ấn riêng trong thị trường latop vốn đã có nhiều sản phẩm nổi bật hiện nay.</p><p><br></p><p style="box-sizing: border-box; margin: 0px 0px 10px; padding: 0px; list-style: none; color: rgb(51, 51, 51); font-family: "Helvetica Neue", Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; line-height: 26px; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">Máy tính xách tay mới nhất của HP, Spectre 13 chỉ dày 10,4mm, mỏng hơn cả MacBook của Apple (13,2mm) và XPS của Dell 13 (15,2mm), giữ vị trí mỏng nhất hiện tại. Không chỉ vậy, sản phẩm còn mang nét khác biệt lẫn độc đáo trong thiết kế, tạo được dấu ấn riêng trong thị trường latop vốn đã có nhiều sản phẩm nổi bật hiện nay.</p><p><br class="Apple-interchange-newline"><br class="Apple-interchange-newline"><br></p>', '', 1, '2016-09-21 02:58:32', '2016-09-21 03:03:41', ''),
(77, 71, '', '', '', 1, '2016-09-21 02:59:13', '2016-09-21 02:59:13', ''),
(78, 72, 'Giới thiệu sản phẩm Khóa thắng đĩa Z-con', '<p><br></p><h2 style="text-align: left;">CHỨC NĂNG CHÍNH </h2><p>\r\n<br></p><h4> Ổ khóa chống trộm dùng cho thắng đĩa Z-con với kết cầu\r\nchắc chắn, thiết kế hình chiếc giày nhỏ gọn và thời trang, chất\r\nliệu thép tổng hợp chống cắt, chống ăn mòn,.. giúp bạn bảo vệ an\r\ntoàn tất cả các loại xe có thắng đĩa. </h4><p>\r\n<br></p><h4>• Lắp ráp: khóa đĩa rời, không gắn cố định, tự động khóa\r\nkhi thấy lỗ ở phanh. • Cốt khóa 100% Inox, có khả năng\r\nchịu lực cao và không bị rỉ, sét. <br>\r\n• Ổ khóa gồm 1 bộ sản phẩm khóa Z- con thắng đĩa và 2 chìa khóa đặc\r\nbiệt chống chìa khóa vạn năng phá khóa và các thủ thuật phá khóa,\r\nbẻ khóa. <br>\r\n• Kết cấu bên trong ổ khóa theo công nghệ Đài Loan, không sử dụng\r\nruột bi. <br>\r\n• Có khả năng tự động tìm lỗ trên phanh đĩa.<img title="khoazc6" alt="khoazc6" src="http://cfr.com.vn/assets/post/57e1f7709068a-21-09-2016-khoazc6jpg.jpg"></h4><p><br></p>', 'Giới thiệu sản phẩm Khóa thắng đĩa Z-con', 1, '2016-09-21 02:59:32', '2016-09-21 03:03:34', ''),
(79, 73, '', '', '', 1, '2016-09-21 03:01:27', '2016-09-21 03:01:27', ''),
(80, 74, 'Giới thiệu sản phẩm Bugi Bosch WR8DP Típ lớn (Bạc trắng) ', '<p>Đặc tính: điện cực trung tâm bằng bạch kim (platinum) nguyên\r\nchát, được nung nóng và hàn kín theo công nghệ đặc biết, điện cực\r\nâm tiết diện chữ V thon dần được tăng cường bằng Yttrium, yêu cầu\r\nvề điện áp đánh lửa thấp hơn. Lợi ích: giảm ô nhiễm, tránh hiện\r\ntượng mất lửa, tối ưu hóa tiết kiệm nhiên liệuk và tăng tốc động\r\ncơ, đốt cháy tốt hơn, khởi động nhanh hơn, quá trình tăng tốc êm\r\nhơn, tăng hiệu quả sử dụng nhiên liêu, tuổi tho cao hơn 25% so với\r\nbugi đánh lửa tiêu chuẩn công nghệ Platinum, khở động tin cậy, bảo\r\nvệ động cơ tốt hơn<br></p>', 'Giới thiệu sản phẩm Bugi Bosch WR8DP Típ lớn (Bạc trắng) ', 1, '2016-09-21 03:01:35', '2016-09-21 03:01:35', ''),
(81, 75, 'Thông tin', '<p><span style="color: rgb(84, 83, 81); font-family: Helvetica, Arial, sans-serif; font-size: 13px;">Quần short cạp cao tôn dáng</span><br></p>', 'Thông tin', 1, '2016-09-21 03:02:23', '2016-09-21 03:02:23', ''),
(82, 76, '', '', '', 1, '2016-09-21 03:03:33', '2016-09-21 03:03:33', ''),
(83, 77, 'Giới thiệu sản phẩm Bộ 2 bóng led chớp nhiều màu cho xe máy OEM', '<p>Bóng led gồm 3 màu chính : xanh lá , xanh dương , đỏ. Chớp chậm và\r\nliên tục , phối hợp ra nhiều màu.\r\n<br></p><div>Thay thế cho 2 bóng đèn sương mù phía trước , đèn nền trong\r\nmặt đồng hồ kilomet , đèn báo số N-1-2-3-4-5 (dành cho xe số)\r\n<div>Không thay thế cho đèn xinhan , đèn hậu và đèn chiếu sáng\r\nfa-cos<br>\r\n<div>Lưu ý : phần chân ghim , tùy đợt hàng có màu sắc khác nhau.\r\nChân ghim không ký hiệu cho màu sắc chính của bóng led.</div>\r\n</div>\r\n</div><p><br></p>', 'Giới thiệu sản phẩm Bộ 2 bóng led chớp nhiều màu cho xe máy OEM', 1, '2016-09-21 03:04:55', '2016-09-21 03:04:55', ''),
(84, 78, 'Thông tin', '', 'Thông tin', 1, '2016-09-21 03:05:52', '2016-09-21 03:05:52', ''),
(85, 79, 'Giới thiệu sản phẩm Đèn led chạy chữ gắn van xe (Xanh)', '<p>- <b>Giới thiệu đèn led chạy chữ gắn van xe </b>\r\n<br></p><div><b><br></b></div><p>\r\n\r\n<br></p><div><b style="margin: 0px 0px 5px; padding: 0px; outline: none; font-size: 16px; font-family: Arial, Helvetica, sans-serif; line-height: 20px; color: rgb(0, 0, 0);">\r\nHướng dẫn lắp <a title="Đèn van xe tạo chữ" target="_blank" style="margin: 0px; padding: 0px; outline: none; font-size: 13px; text-decoration: none;">đèn\r\nvan xe tạo chữ</a> cho xe máy, xe đạp:</b></div><p>\r\n<br></p><p style="margin: 0px 0px 10px; padding: 0px; outline: none; font-size: 13px; font-family: Arial, Helvetica, sans-serif; line-height: 20px; min-height: 1px; color: rgb(0, 0, 0);">\r\n– Đầu tiên vặn thân đèn ngược chiều kim đồng hồ lấy lớp giấy cách\r\npin trong đèn ra, sau đó vặn đèn lại như cũ</p><p>\r\n<br></p><p style="margin: 0px 0px 10px; padding: 0px; outline: none; font-size: 13px; font-family: Arial, Helvetica, sans-serif; line-height: 20px; min-height: 1px; color: rgb(0, 0, 0);">\r\n– Tiếp theo đối với xe máy vặn chân màu bạc của đèn vào vòi bơm hơi\r\ncủa xe</p><p>\r\n<br></p><p style="margin: 0px 0px 10px; padding: 0px; outline: none; font-size: 13px; font-family: Arial, Helvetica, sans-serif; line-height: 20px; min-height: 1px; color: rgb(0, 0, 0);">\r\n– Đối với xe đạp anh em vặn thêm ốc đen vào chân đèn rồi vặn vào\r\nvòi bơm hơi xe đạp</p><p>\r\n<br></p><p style="margin: 0px 0px 10px; padding: 0px; outline: none; font-size: 13px; font-family: Arial, Helvetica, sans-serif; line-height: 20px; min-height: 1px; color: rgb(0, 0, 0);">\r\n– Cơ chế của <strong style="margin: 0px; padding: 0px; outline: none; font-size: inherit; color: inherit;">đèn\r\nvan</strong> khi <strong style="margin: 0px; padding: 0px; outline: none; font-size: inherit; color: inherit;">xe</strong> quay\r\nđèn cảm ứng rung động và <strong style="margin: 0px; padding: 0px; outline: none; font-size: inherit; color: inherit;">tạo\r\nchữ</strong> và hiệu ứng ngay quanh bánh xe.</p><p style="margin: 0px 0px 10px; padding: 0px; outline: none; font-size: 13px; font-family: Arial, Helvetica, sans-serif; line-height: 20px; min-height: 1px; color: rgb(0, 0, 0);"><img title="den-led-chay-chu-gan-van-xe-xanh-1850-8237272-edf48815f434eb3f93f704f834af9b6d-zoom" alt="den-led-chay-chu-gan-van-xe-xanh-1850-8237272-edf48815f434eb3f93f704f834af9b6d-zoom" src="http://cfr.com.vn/assets/post/57e1f942ba80e-21-09-2016-den-led-chay-chu-gan-van-xe-xanh-1850-8237272-edf48815f434eb3f93f704f834af9b6d-zoomjpg.jpg"><br></p><p><br></p>', 'Giới thiệu sản phẩm Đèn led chạy chữ gắn van xe (Xanh)', 1, '2016-09-21 03:07:22', '2016-09-21 03:08:49', ''),
(86, 80, 'Giới thiệu sản phẩm Xe tay ga Honda Air Blade 2016 Phiên bản thể thao ( Đỏ Đen )', '<p><img title="4479" alt="4479" src="http://cfr.com.vn/assets/post/57e1fa29dce49-21-09-2016-4479jpg.jpg"><img title="4480" alt="4480" src="http://cfr.com.vn/assets/post/57e1fa2f3a1d0-21-09-2016-4480jpg.jpg"><img title="4481" alt="4481" src="http://cfr.com.vn/assets/post/57e1fa340c32f-21-09-2016-4481jpg.jpg"><br></p>', 'Giới thiệu sản phẩm Xe tay ga Honda Air Blade 2016 Phiên bản thể thao ( Đỏ Đen )', 1, '2016-09-21 03:11:16', '2016-09-21 03:11:16', ''),
(87, 81, 'Giới thiệu sản phẩm Xe máy Yamaha Acruzo Deluxe 125i (Xanh)', '<p><img title="matdongho-20151005-11100329" alt="matdongho-20151005-11100329" src="http://cfr.com.vn/assets/post/57e1fbce48cac-21-09-2016-matdongho-20151005-11100329jpg.jpg"></p><div><b>MẶT ĐỒNG HỒ ĐIỆN TỬ</b></div><p>\r\n</p><p>Thiết kế cao cấp với màn hình LCD thông minh hiển thị đầy đủ các\r\nthông tin cần thiết cho người sử dụng. Đặc biệt đèn báo Eco lần đầu\r\ntiên xuất hiện tại Việt Nam sẽ bật sáng để báo hiệu tình trạng vận\r\nhành xe ổn định.</p><p><img title="Matsau-20151005-11104065" alt="Matsau-20151005-11104065" src="http://cfr.com.vn/assets/post/57e1fbdebfee9-21-09-2016-matsau-20151005-11104065jpg.jpg"><br></p><p><br></p><div><b>THIẾT KẾ ĐUÔI XE ẤN TƯỢNG</b></div><p>\r\n<br></p><p>Cụm đèn hậu bao gồm đèn phanh và đèn xi nhan được thiết kế một\r\ncách tỉ mỉ và tinh tế, kết hợp hài hòa với tay nắm sau kiểu dáng\r\nnhô cao, làm tăng sự thanh thoát và sang trọng theo phong cách\r\nthiết kế của các dòng xe hơi cao cấp.</p><p><img title="Mattruocxe-20151005-11105596" alt="Mattruocxe-20151005-11105596" src="http://cfr.com.vn/assets/post/57e1fc76b582d-21-09-2016-mattruocxe-20151005-11105596jpg.jpg"></p><div><b>THIẾT KẾ MẶT TRƯỚC SANG TRỌNG</b></div><p>\r\n</p><p>Mặt nạ phía trước tạo hình chữ V đầy tinh tế và được viền chrome\r\ncho dáng vẻ sắc sảo. Cụm đèn LED định vị hiện đại kết hợp hoàn hảo\r\nvới tấm ốp cao cấp cho mặt trước xe vẻ tinh tế và trang nhã.</p><p><img title="napbinhxang-20151005-11102460" alt="napbinhxang-20151005-11102460" src="http://cfr.com.vn/assets/post/57e1fc911c2f8-21-09-2016-napbinhxang-20151005-11102460jpg.jpg"><br></p><p><br></p><div><b>NẮP BÌNH XĂNG</b></div><p>\r\n<br></p><p>Nắp bình xăng được đặt đối xứng với cụm khóa điện, mở dễ dàng\r\nbằng một thao tác trên ổ khóa chính, nhờ vậy có thể đổ xăng một\r\ncách đơn giản nhẹ nhàng mà không phải xuống xe hay mở yên xe.</p><p><img title="Napcheokhoa-20151005-11104778" alt="Napcheokhoa-20151005-11104778" src="http://cfr.com.vn/assets/post/57e1fc9ba5c8f-21-09-2016-napcheokhoa-20151005-11104778jpg.jpg"><br></p><p><br></p><div><b>NẮP CHE Ổ KHÓA</b></div><p>\r\n<br></p><p>Ổ khóa có trang bị nắp che, giúp bảo vệ xe an toàn hơn.</p><p><br></p>', 'Giới thiệu sản phẩm Xe máy Yamaha Acruzo Deluxe 125i (Xanh)', 1, '2016-09-21 03:21:22', '2016-09-21 03:21:22', ''),
(91, 44, '', '', 'Tab 2', 2, '2016-09-21 07:47:47', '2016-09-21 07:47:47', ''),
(92, 82, 'Tab 1', '', 'Tab 1', 1, '2016-09-24 03:04:02', '2016-09-24 03:04:02', ''),
(93, 83, 'Tab 1', '', 'Tab 1', 1, '2016-09-24 03:35:09', '2016-09-24 03:35:09', ''),
(94, 84, 'Tab 1', '', 'Tab 1', 1, '2016-09-24 03:36:19', '2016-09-24 03:36:19', ''),
(97, 87, 'Tab 1', '', 'Tab 1', 1, '2016-09-26 02:34:44', '2016-09-26 02:34:44', ''),
(99, 89, '', '', '', 1, '2016-09-26 02:52:03', '2016-09-26 02:52:03', '[{"key":"1","value":"2"},{"key":"2","value":"3"},{"key":"4","value":"5"},{"key":"2","value":"3"}]');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE IF NOT EXISTS `customers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sex` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `creditCard` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `nameCompany` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customers_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `filters`
--

CREATE TABLE IF NOT EXISTS `filters` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `min` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `max` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `create_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `attribute_id` int(10) unsigned NOT NULL,
  `type` int(11) NOT NULL,
  `config_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `filters_attribute_id_foreign` (`attribute_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=25 ;

--
-- Dumping data for table `filters`
--

INSERT INTO `filters` (`id`, `value`, `min`, `max`, `status`, `create_by`, `created_at`, `updated_at`, `name`, `img`, `attribute_id`, `type`, `config_name`) VALUES
(1, 'Vàng', '', '', 0, 0, '2016-09-23 07:31:10', '2016-09-23 07:31:10', 'Màu sắc', '', 4, 0, ''),
(2, 'Cam', '', '', 0, 0, '2016-09-23 07:31:10', '2016-09-23 07:31:10', 'Màu sắc', '', 5, 0, ''),
(3, '10', '', '', 0, 0, '2016-09-23 07:31:10', '2016-09-23 07:31:10', 'Khối lượng', '', 6, 0, ''),
(4, 'XL', '', '', 0, 0, '2016-09-23 07:31:10', '2016-09-23 07:31:10', 'Kích cỡ', '', 7, 0, ''),
(5, 'Trắng', '', '', 0, 0, '2016-09-23 07:41:57', '2016-09-23 07:41:57', 'Màu sắc', '', 8, 0, ''),
(6, 'Hồng', '', '', 0, 0, '2016-09-23 07:41:57', '2016-09-23 07:41:57', 'Màu sắc', '', 9, 0, ''),
(7, 'Xanh', '', '', 0, 0, '2016-09-23 07:42:17', '2016-09-23 07:42:17', 'Màu sắc', '', 10, 0, ''),
(8, '13', '', '', 0, 0, '2016-09-23 07:42:31', '2016-09-23 07:42:31', 'Khối lượng', '', 11, 0, ''),
(10, '', '12', '50', 0, 0, '2016-09-23 08:15:04', '2016-09-23 08:15:04', 'Chiều cao', '', 12, 1, ''),
(11, '', '51', '166', 0, 0, '2016-09-23 08:15:13', '2016-09-23 08:15:13', 'Chiều cao', '', 12, 1, ''),
(21, 'asad', '', '', 0, 0, '2016-09-26 02:46:29', '2016-09-26 02:46:29', 'Màu sắc', '', 30, 0, ''),
(22, 'ád', '', '', 0, 0, '2016-09-26 02:46:29', '2016-09-26 02:46:29', 'Khối lượng', '', 31, 0, ''),
(23, 'ád', '', '', 0, 0, '2016-09-26 02:46:29', '2016-09-26 02:46:29', 'Kích cỡ', '', 32, 0, ''),
(24, 'Đỏ', '', '', 0, 0, '2016-09-26 02:52:03', '2016-09-26 02:52:03', 'Khối lượng', '', 34, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `filter_prices`
--

CREATE TABLE IF NOT EXISTS `filter_prices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `min` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `max` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `config_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `create_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `forms`
--

CREATE TABLE IF NOT EXISTS `forms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `text_1` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `text_2` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `text_3` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `text_4` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `text_5` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `text_6` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `text_7` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `text_8` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `text_9` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `text_10` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `forms`
--

INSERT INTO `forms` (`id`, `text_1`, `text_2`, `text_3`, `text_4`, `text_5`, `text_6`, `text_7`, `text_8`, `text_9`, `text_10`, `type`, `status`, `created_at`, `updated_at`) VALUES
(3, 'nguyentruongson93@gmail.com', 'adfasdf', '', '', '', '', '', '', '', '', 'Form Đăng kí', 1, '2016-09-29 09:07:51', '2016-09-29 09:07:51'),
(4, 'nguyentruongson93.10@gmail.com', '1234567ádf', '', '', '', '', '', '', '', '', 'Form Đăng kí', 1, '2016-09-29 09:10:40', '2016-09-29 09:10:40'),
(5, 'dev@mastercus.com', '', '', '', '', '', '', '', '', '', 'Form Đăng kí', 1, '2016-09-29 09:11:17', '2016-09-29 09:11:17'),
(6, 'dev@mastercus.coma', 'ádf', '', '', '', '', '', '', '', '', 'Form Đăng kí', 1, '2016-09-29 09:11:49', '2016-09-29 09:11:49');

-- --------------------------------------------------------

--
-- Table structure for table `form_types`
--

CREATE TABLE IF NOT EXISTS `form_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `count` tinyint(4) NOT NULL,
  `note` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `form_types`
--

INSERT INTO `form_types` (`id`, `name`, `count`, `note`, `created_at`, `updated_at`) VALUES
(1, 'Form Đăng kí', 3, 'Email,Số điện thoại,Giới tính', '2016-09-29 08:02:38', '2016-09-29 08:02:38');

-- --------------------------------------------------------

--
-- Table structure for table `group_layouts`
--

CREATE TABLE IF NOT EXISTS `group_layouts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE IF NOT EXISTS `items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key_layout` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `key_item` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `num` int(11) NOT NULL,
  `pin` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `key_layout`, `key_item`, `value`, `link`, `type`, `num`, `pin`, `created_at`, `updated_at`) VALUES
(1, 'config_thumb_product', 'config_thumb_product_preview', '250x250', '', '', 0, 0, '2016-09-21 07:09:36', '2016-09-21 07:09:36'),
(2, 'config_thumb_product', 'config_thumb_product_detail', '450x450', '', '', 0, 0, '2016-09-21 07:09:36', '2016-09-21 07:09:36'),
(3, 'config_thumb_product', 'config_thumb_product_category', '1366x360', '', '', 0, 0, '2016-09-21 07:09:36', '2016-09-21 07:09:36'),
(4, 'config_thumb_post', 'config_thumb_post_preview', '390x200', '', '', 0, 0, '2016-09-21 07:09:36', '2016-09-27 08:07:39'),
(5, 'config_thumb_post', 'config_thumb_post_detail', '500x250', '', '', 0, 0, '2016-09-21 07:09:36', '2016-09-27 08:07:39'),
(6, 'config_thumb_post', 'config_thumb_post_category', '1366x360', '', '', 0, 0, '2016-09-21 07:09:36', '2016-09-21 07:09:36');

-- --------------------------------------------------------

--
-- Table structure for table `layouts`
--

CREATE TABLE IF NOT EXISTS `layouts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contribute_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE IF NOT EXISTS `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `level` smallint(6) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `status` smallint(6) NOT NULL,
  `order` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=25 ;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `link`, `img`, `level`, `parent_id`, `status`, `order`, `created_at`, `updated_at`) VALUES
(1, 'Clothing', '', '', 0, 0, 1, 0, '2016-08-23 04:53:45', '2016-08-23 04:53:45'),
(2, 'Electronics', '', '', 0, 0, 1, 0, '2016-08-23 04:53:58', '2016-08-23 04:53:58'),
(3, 'Health & Beauty', '', '', 0, 0, 1, 0, '2016-08-23 04:54:10', '2016-08-23 04:54:10'),
(4, 'Watches', '', '', 0, 0, 1, 0, '2016-08-23 04:54:17', '2016-08-23 04:54:17'),
(5, 'Jewellery', '', '', 0, 0, 1, 0, '2016-08-23 04:54:24', '2016-08-23 04:54:24'),
(6, 'Shoes', '', '', 0, 0, 1, 0, '2016-08-23 04:54:29', '2016-08-23 04:54:29'),
(7, 'Kids & Girls', '', '', 0, 0, 1, 0, '2016-08-23 04:54:37', '2016-08-23 04:54:37'),
(8, 'Men', '', '', 0, 1, 1, 0, '2016-08-23 04:55:01', '2016-08-23 04:55:01'),
(9, 'Women', '', '', 0, 1, 1, 0, '2016-08-23 04:55:08', '2016-08-23 04:55:08'),
(10, 'Boys', '', '', 0, 1, 1, 0, '2016-08-23 04:55:16', '2016-08-23 04:55:16'),
(11, 'Girls', '', '', 0, 1, 1, 0, '2016-08-23 04:55:24', '2016-08-23 04:55:24'),
(12, 'Điện Thoại', 'danh-muc-san-pham/dien-thoai-28.html', '', 0, 8, 1, 0, '2016-08-23 04:56:28', '2016-09-22 07:15:27'),
(13, 'Shoes', '', '', 0, 8, 1, 0, '2016-08-23 04:56:38', '2016-08-23 04:56:38'),
(14, 'Jackets', '', '', 0, 8, 1, 0, '2016-08-23 04:56:45', '2016-08-23 04:56:45'),
(15, 'Sunglasses', '', '', 0, 8, 1, 0, '2016-08-23 04:56:55', '2016-08-23 04:56:55'),
(16, 'Sport Wear', '', '', 0, 8, 1, 0, '2016-08-23 04:57:07', '2016-08-23 04:57:07'),
(17, 'Blazers', '', '', 0, 8, 1, 0, '2016-08-23 04:57:13', '2016-08-23 04:57:13'),
(18, 'Handbags', '', '', 0, 9, 1, 0, '2016-08-23 04:57:21', '2016-08-23 04:57:21'),
(19, 'Jwellery', '', '', 0, 9, 1, 0, '2016-08-23 04:57:30', '2016-08-23 04:57:30'),
(20, 'Swimwear', '', '', 0, 9, 1, 0, '2016-08-23 04:57:36', '2016-08-23 04:57:36'),
(21, 'Flats', '', '', 0, 9, 1, 0, '2016-08-23 04:57:43', '2016-08-23 04:57:43'),
(22, 'Toys & Games', '', '', 0, 9, 1, 0, '2016-08-23 04:57:53', '2016-08-23 04:57:53'),
(23, 'Jeans', '', '', 0, 10, 1, 0, '2016-08-23 04:58:00', '2016-08-23 04:58:00'),
(24, 'Sandals', '', '', 0, 11, 1, 0, '2016-08-23 04:58:08', '2016-08-23 04:58:08');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1),
('2016_06_20_011431_create_admins_table', 1),
('2016_06_20_012741_create_roles_table', 1),
('2016_06_20_012759_create_admin_roles_table', 1),
('2016_06_20_025556_create_posts_table', 1),
('2016_06_20_025846_create_contents_table', 1),
('2016_06_20_110115_create_category_table', 1),
('2016_06_20_110947_create_menu_table', 1),
('2016_06_23_044952_create_post_category_table', 1),
('2016_06_23_073448_create_slides_table', 1),
('2016_06_23_073806_create_slide_types_table', 1),
('2016_06_27_020726_create_tags_table', 1),
('2016_06_27_020921_create_tags_posts_table', 1),
('2016_06_29_013422_create_layout_table', 1),
('2016_06_29_014600_create_group_layout_table', 1),
('2016_06_29_074746_create_items_table', 1),
('2016_07_05_070007_create_contacts_table', 1),
('2016_07_09_092226_add_table_system', 1),
('2016_07_11_100830_create_customers_table', 1),
('2016_07_11_101037_create_table_products', 1),
('2016_07_11_101227_create_table_attributes', 1),
('2016_07_11_101330_create_table_product_attribute', 1),
('2016_07_11_101917_create_table_product_images', 1),
('2016_07_11_103447_create_table_product_ratings', 1),
('2016_07_12_094827_create_permissions_table', 1),
('2016_07_12_094910_create_permission_admin_table', 1),
('2016_07_12_105653_create_filter_group_table', 1),
('2016_07_12_105720_create_filter_table', 1),
('2016_07_12_111007_create_category_products_table', 1),
('2016_07_12_145208_create_product_category_table', 1),
('2016_07_15_085515_create_content_tab_product', 1),
('2016_07_15_140329_add_colume_to_product', 1),
('2016_07_15_140804_add_colume_to_images', 1),
('2016_07_18_092012_add_cloumn_slug_products', 1),
('2016_07_20_140025_add_col_to_attribute', 1),
('2016_07_21_143321_create_table_form_types', 1),
('2016_07_21_143409_create_table_forms', 1),
('2016_07_21_163324_add_cloumn_forms', 1),
('2016_07_23_103301_create_orders_table', 1),
('2016_07_23_104935_create_admin_log_orders_table', 1),
('2016_07_23_125049_create_order_items_table', 1),
('2016_07_23_150127_change_col_filter', 1),
('2016_07_23_152319_add_column_filter', 1),
('2016_07_23_153509_add_cloumn_email_table_order', 1),
('2016_07_23_164923_drop_filter_group', 1),
('2016_07_23_171843_add_cloumn_status_table_admin_log_orders', 1),
('2016_07_25_113316_add_column_to_filter', 1),
('2016_07_27_135051_create_filter_prices', 1),
('2016_07_30_084318_add_col_to_attributes', 1),
('2016_08_02_090957_create_content_product_attributes', 1),
('2016_08_03_171043_add_col_to_order_items', 1),
('2016_08_05_140304_add_col_to_order', 1),
('2016_08_06_135931_add_col_to_systems', 1),
('2016_08_08_093918_add_col_email_to_admins', 1),
('2016_08_08_110708_add_col_image_admins_table', 1),
('2016_08_08_220208_add_user_create_edit_to_products', 1),
('2016_08_08_220218_add_user_create_edit_to_posts', 1),
('2016_08_08_234109_add_note_stick_to_orders', 1),
('2016_08_09_215022_create_table_tags_product', 1),
('2016_08_09_215100_create_table_tag_p', 1),
('2016_08_09_234822_create_table_post_images', 1),
('2016_08_13_151225_add_address_to_orders', 1),
('2016_08_19_113744_change_table_product_ratings', 1),
('2016_08_19_114848_create_table_post_comments', 1),
('2016_08_20_093757_create_table_register_account', 1),
('2016_08_24_113045_add_col_to_shop_acc', 2),
('2016_09_05_133458_create_table_account', 3),
('2016_09_05_133619_create_table_comment_post', 3),
('2016_09_05_133644_create_table_comment_product', 3),
('2016_09_07_090838_add_rating_to_products', 3),
('2016_09_08_100118_add_col_to_accounts', 3),
('2016_09_09_100328_add_rating_to_post', 3),
('2016_09_09_112832_create_thumbs_config', 3),
('2016_09_12_095503_add_col_to_products', 3),
('2016_09_12_095537_add_col_to_product_images', 3),
('2016_09_12_095623_add_col_to_category_products', 3),
('2016_09_12_095734_add_col_to_post', 3),
('2016_09_12_095754_add_col_to_post_image', 3),
('2016_09_12_095808_add_col_to_post_category', 3),
('2016_09_19_090123_add_json_to_content_products', 4);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fullname` varchar(75) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `total` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `create_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `note` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `note_stick` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE IF NOT EXISTS `order_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `quantity` tinyint(1) unsigned NOT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `price` int(11) NOT NULL,
  `price_sale` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_items_order_id_foreign` (`order_id`),
  KEY `order_items_product_id_foreign` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=40 ;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `key`, `created_at`, `updated_at`) VALUES
(1, 'Đăng bài viết', 'dang_bai_viet', '2016-08-23 04:49:19', '2016-08-23 04:49:19'),
(2, 'Sửa bài viết', 'sua_bai_viet', '2016-08-23 04:49:19', '2016-08-23 04:49:19'),
(3, 'Lưu bài viết', 'luu_bai_viet', '2016-08-23 04:49:19', '2016-08-23 04:49:19'),
(4, 'Xóa bài viết', 'xoa_bai_viet', '2016-08-23 04:49:19', '2016-08-23 04:49:19'),
(5, 'Thêm danh mục bài viết', 'them_danh_muc_bai_viet', '2016-08-23 04:49:19', '2016-08-23 04:49:19'),
(6, 'Sửa danh mục bài viết', 'sua_danh_muc_bai_viet', '2016-08-23 04:49:19', '2016-08-23 04:49:19'),
(7, 'Xóa danh mục bài viết', 'xoa_danh_muc_bai_viet', '2016-08-23 04:49:19', '2016-08-23 04:49:19'),
(8, 'Quản lý tags bài viết', 'quan_ly_tags_bai_viet', '2016-08-23 04:49:19', '2016-08-23 04:49:19'),
(9, 'Đăng sản phẩm', 'them_san_pham', '2016-08-23 04:49:19', '2016-08-23 04:49:19'),
(10, 'Sửa sản phẩm', 'sua_san_pham', '2016-08-23 04:49:19', '2016-08-23 04:49:19'),
(11, 'Lưu sản phẩm', 'luu_san_pham', '2016-08-23 04:49:19', '2016-08-23 04:49:19'),
(12, 'Xóa sản phẩm', 'xoa_san_pham', '2016-08-23 04:49:19', '2016-08-23 04:49:19'),
(13, 'Thêm danh mục sản phẩm', 'them_danh_muc_san_pham', '2016-08-23 04:49:19', '2016-08-23 04:49:19'),
(14, 'Sửa danh mục sản phẩm', 'sua_danh_muc_san_pham', '2016-08-23 04:49:19', '2016-08-23 04:49:19'),
(15, 'Xóa danh mục sản phẩm', 'xoa_danh_muc_san_pham', '2016-08-23 04:49:19', '2016-08-23 04:49:19'),
(16, 'Quản lý tags sản phẩm', 'quan_ly_tags_san_pham', '2016-08-23 04:49:19', '2016-08-23 04:49:19'),
(17, 'Thêm slide', 'them_slide', '2016-08-23 04:49:19', '2016-08-23 04:49:19'),
(18, 'Sửa slide', 'sua_slide', '2016-08-23 04:49:19', '2016-08-23 04:49:19'),
(19, 'Xóa slide', 'xoa_slide', '2016-08-23 04:49:19', '2016-08-23 04:49:19'),
(20, 'Tạo menu', 'tao_menu', '2016-08-23 04:49:19', '2016-08-23 04:49:19'),
(21, 'Sửa menu', 'sua_menu', '2016-08-23 04:49:19', '2016-08-23 04:49:19'),
(22, 'Xóa menu', 'xoa_menu', '2016-08-23 04:49:19', '2016-08-23 04:49:19'),
(23, 'Thêm layout', 'them_layout', '2016-08-23 04:49:19', '2016-08-23 04:49:19'),
(24, 'Sửa layout', 'sua_layout', '2016-08-23 04:49:19', '2016-08-23 04:49:19'),
(25, 'Thêm thành viên', 'them_thanh_vien', '2016-08-23 04:49:19', '2016-08-23 04:49:19'),
(26, 'Sửa thành viên', 'sua_thanh_vien', '2016-08-23 04:49:19', '2016-08-23 04:49:19'),
(27, 'Xóa thành viên', 'xoa_thanh_vien', '2016-08-23 04:49:19', '2016-08-23 04:49:19'),
(28, 'Phân quyền thành viên', 'phan_quyen_thanh_vien', '2016-08-23 04:49:19', '2016-08-23 04:49:19'),
(29, 'Xem liên hệ', 'xem_lien_he', '2016-08-23 04:49:19', '2016-08-23 04:49:19'),
(30, 'Xóa liên hệ', 'xoa_lien_he', '2016-08-23 04:49:19', '2016-08-23 04:49:19'),
(31, 'Thêm Đơn Hàng', 'them_don_hang', '2016-08-23 04:49:19', '2016-08-23 04:49:19'),
(32, 'Xóa Đơn Hàng', 'xoa_don_hang', '2016-08-23 04:49:19', '2016-08-23 04:49:19'),
(33, 'Xem Đơn Hàng', 'xem_don_hang', '2016-08-23 04:49:19', '2016-08-23 04:49:19'),
(34, 'Xử Lí Đơn Hàng', 'xu_li_don_hang', '2016-08-23 04:49:19', '2016-08-23 04:49:19'),
(35, 'Thêm Thuộc Tính', 'them_thuoc_tinh', '2016-08-23 04:50:52', '2016-08-23 04:50:52'),
(36, 'Sửa Thuộc Tính', 'sua_thuoc_tinh', '2016-08-23 04:50:52', '2016-08-23 04:50:52'),
(37, 'Xóa Thuộc Tính', 'xoa_thuoc_tinh', '2016-08-23 04:50:52', '2016-08-23 04:50:52'),
(38, 'Quản lý bình luận bài viết', 'quan_ly_binh_luan_bai_viet', '2016-09-21 07:05:18', '2016-09-21 07:05:18'),
(39, 'Quản lý bình luận sản phẩm', 'quan_ly_binh_luan_san_pham', '2016-09-21 07:05:18', '2016-09-21 07:05:18');

-- --------------------------------------------------------

--
-- Table structure for table `permission_admin`
--

CREATE TABLE IF NOT EXISTS `permission_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `admin_id` int(10) unsigned NOT NULL,
  `permission_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permission_admin_admin_id_foreign` (`admin_id`),
  KEY `permission_admin_permission_id_foreign` (`permission_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=38 ;

--
-- Dumping data for table `permission_admin`
--

INSERT INTO `permission_admin` (`id`, `admin_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(1, 2, 1, NULL, NULL),
(2, 2, 2, NULL, NULL),
(3, 2, 3, NULL, NULL),
(4, 2, 4, NULL, NULL),
(5, 2, 5, NULL, NULL),
(6, 2, 6, NULL, NULL),
(7, 2, 7, NULL, NULL),
(8, 2, 16, NULL, NULL),
(9, 2, 9, NULL, NULL),
(10, 2, 10, NULL, NULL),
(11, 2, 11, NULL, NULL),
(12, 2, 12, NULL, NULL),
(13, 2, 13, NULL, NULL),
(14, 2, 14, NULL, NULL),
(15, 2, 15, NULL, NULL),
(16, 2, 16, NULL, NULL),
(17, 2, 17, NULL, NULL),
(18, 2, 18, NULL, NULL),
(19, 2, 19, NULL, NULL),
(20, 2, 20, NULL, NULL),
(21, 2, 21, NULL, NULL),
(22, 2, 22, NULL, NULL),
(24, 2, 24, NULL, NULL),
(25, 2, 25, NULL, NULL),
(26, 2, 26, NULL, NULL),
(27, 2, 27, NULL, NULL),
(28, 2, 28, NULL, NULL),
(29, 2, 29, NULL, NULL),
(30, 2, 30, NULL, NULL),
(31, 2, 35, NULL, NULL),
(32, 2, 36, NULL, NULL),
(33, 2, 37, NULL, NULL),
(34, 2, 31, NULL, NULL),
(35, 2, 32, NULL, NULL),
(36, 2, 33, NULL, NULL),
(37, 2, 34, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `has_tab` int(11) NOT NULL,
  `SEO_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SEO_des` text COLLATE utf8_unicode_ci NOT NULL,
  `SEO_img` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `struct_data` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `create_by` int(11) NOT NULL DEFAULT '2',
  `last_edit_by` int(11) NOT NULL DEFAULT '2',
  `rating` decimal(3,2) NOT NULL DEFAULT '0.00',
  `number_rate` int(11) NOT NULL DEFAULT '0',
  `thumb_images` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `img`, `description`, `slug`, `status`, `has_tab`, `SEO_title`, `SEO_des`, `SEO_img`, `struct_data`, `created_at`, `updated_at`, `create_by`, `last_edit_by`, `rating`, `number_rate`, `thumb_images`) VALUES
(1, 'About', '', '', 'about', 1, 0, '', '', '', '', '2016-09-27 07:31:07', '2016-09-27 07:31:35', 1, 1, '0.00', 0, ''),
(2, 'Contact', '', '', 'contact', 1, 0, '', '', '', '', '2016-09-27 07:37:08', '2016-09-27 07:37:08', 1, 1, '0.00', 0, ''),
(3, 'Dolorem eum fugiat quo voluptas nulla pariatur', '/assets/post/post1.jpg', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium', 'dolorem-eum-fugiat-quo-voluptas-nulla-pariatur', 1, 0, '', '', '', '', '2016-09-27 07:53:35', '2016-09-27 08:07:48', 1, 1, '0.00', 0, '/assets/post_thumb/390_200_post1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `post_category`
--

CREATE TABLE IF NOT EXISTS `post_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `thumb_images` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `post_category`
--

INSERT INTO `post_category` (`id`, `post_id`, `category_id`, `created_at`, `updated_at`, `thumb_images`) VALUES
(1, 1, 1, '2016-09-27 07:31:08', '2016-09-27 07:31:08', ''),
(2, 1, 2, '2016-09-27 07:31:08', '2016-09-27 07:31:08', ''),
(3, 1, 3, '2016-09-27 07:31:08', '2016-09-27 07:31:08', ''),
(4, 2, 3, '2016-09-27 07:37:08', '2016-09-27 07:37:08', ''),
(5, 3, 4, NULL, NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `post_comments`
--

CREATE TABLE IF NOT EXISTS `post_comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(10) unsigned NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `number` tinyint(4) NOT NULL,
  `comment` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  `post_comments_id` int(11) NOT NULL,
  `img` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `customer_id` int(11) NOT NULL,
  `guest` int(11) NOT NULL DEFAULT '0',
  `create_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_comments_post_id_foreign` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `post_images`
--

CREATE TABLE IF NOT EXISTS `post_images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(10) unsigned NOT NULL,
  `img` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `group_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `thumb_images` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `post_images_post_id_foreign` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `sku` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `short_description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` varchar(14) COLLATE utf8_unicode_ci NOT NULL,
  `price_sale` varchar(14) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'publish',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code_product` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `create_by` int(11) NOT NULL DEFAULT '2',
  `last_edit_by` int(11) NOT NULL DEFAULT '2',
  `rating` decimal(3,2) NOT NULL DEFAULT '0.00',
  `number_rate` int(11) NOT NULL DEFAULT '0',
  `thumb_images` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=90 ;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `sku`, `img`, `short_description`, `price`, `price_sale`, `description`, `status`, `created_at`, `updated_at`, `code_product`, `label`, `create_by`, `last_edit_by`, `rating`, `number_rate`, `thumb_images`) VALUES
(10, 'Son môi giữ ẩm Shiseido Perfect Rouge #RD553 Showg', 'son-moi-giu-am-shiseido-perfect-rouge-rd553-showg', '0', '/assets/product/57e1ef8f92b84-21-09-2016-1469087491467-2025367jpg.jpg', '', '750000', '750000', '', '1', '2016-09-21 02:25:19', '2016-09-21 02:27:00', 'RD553 Showgir', '0', 17, 17, '0.00', 0, '/assets/product_thumb/250_250_57e1ef8f92b84-21-09-2016-1469087491467-2025367jpg.jpg'),
(13, 'Iphone 7 hồng', 'iphone-7-hong', '0', '/assets/product/57e1f0711cac0-21-09-2016-dien-thoai-apple-iphone-6s-plus-rose-gold-64gb-a1687jpg.jpg', 'Máy tính xách tay mới nhất của HP, Spectre 13 chỉ dày 10,4mm, mỏng hơn cả MacBook của Apple (13,2mm) và XPS của Dell 13 (15,2mm), giữ vị trí mỏng nhất hiện tại. Không chỉ vậy, sản phẩm còn mang nét khác biệt lẫn độc đáo trong thiết kế, tạo được dấu ấn r', '21000000', '21000000', '', '1', '2016-09-21 02:29:05', '2016-09-21 02:44:58', 'Hồng', '1', 16, 16, '0.00', 0, '/assets/product_thumb/250_250_57e1f0711cac0-21-09-2016-dien-thoai-apple-iphone-6s-plus-rose-gold-64gb-a1687jpg.jpg'),
(14, ' Khuôn làm Sushi chuyên dụng Perfect Roll Sushi', 'khuon-lam-sushi-chuyen-dung-perfect-roll-sushi', '0', '/assets/product/57e1f0a20bcef-21-09-2016-c14191-simg-ab1f47-350x350-maxbjpg.jpg', '', '160', '61', '', '1', '2016-09-21 02:29:54', '2016-09-21 02:44:53', 'abc', '0', 19, 19, '0.00', 0, '/assets/product_thumb/250_250_57e1f0a20bcef-21-09-2016-c14191-simg-ab1f47-350x350-maxbjpg.jpg'),
(15, 'Phấn mắt Essance Natural Eyes Shadow màu hồng #1', 'phan-mat-essance-natural-eyes-shadow-mau-hong-1', '0', '/assets/product/57e1f0a7dd400-21-09-2016-154943-cns-8935030232225-2-chonjpg.jpg', '', '60000', '60000', '', '1', '2016-09-21 02:29:59', '2016-09-21 02:44:46', '#1', '1', 17, 17, '0.00', 0, '/assets/product_thumb/250_250_57e1f0a7dd400-21-09-2016-154943-cns-8935030232225-2-chonjpg.jpg'),
(16, ' Túi đeo chéo LAZAShop TX260 (Đen)  ', 'tui-deo-cheo-lazashop-tx260-den', '0', '/assets/product/57e1f28ef3b36-21-09-2016-tuiisuajpg.jpg', 'túi đẹp', '299', '299', '', '1', '2016-09-21 02:30:19', '2016-09-21 02:44:43', '001', '0', 18, 18, '0.00', 0, '/assets/product_thumb/250_250_57e1f28ef3b36-21-09-2016-tuiisuajpg.jpg'),
(17, 'Dung dịch bảo vệ & phục hồi sáng bóng nội thất xe ', 'dung-dich-bao-ve-phuc-hoi-sang-bong-noi-that-xe', '0', '/assets/product/57e1f0c20db9b-21-09-2016-dung-dich-bao-ve-andamp-phuc-hoi-sang-bong-noi-that-xe-hoi-nu-finish-vinyl-nv-300-473ml-1849-650643-d0319412f3ca73a9d9c0a66d7eb14c43-zoomjpg.jpg', '', '395000', '318000', '', '1', '2016-09-21 02:30:26', '2016-09-21 02:58:12', 'NV-300', '3', 20, 20, '0.00', 0, '/assets/product_thumb/250_250_57e1f0c20db9b-21-09-2016-dung-dich-bao-ve-andamp-phuc-hoi-sang-bong-noi-that-xe-hoi-nu-finish-vinyl-nv-300-473ml-1849-650643-d0319412f3ca73a9d9c0a66d7eb14c43-zoomjpg.jpg'),
(18, 'Áo khoác kaki nam phối nút hàn quốc (Nâu nhạt)  ', 'ao-khoac-kaki-nam-phoi-nut-han-quoc-nau-nhat', '0', '/assets/product/57e1f0e568f5e-21-09-2016-4jpg.jpg', 'Thiết kế tinh tế với cổ bẻ, tay dài, đính nút bản to nổi bật, cá tính, form dáng khỏe khoắn cho bạn phong cách trẻ trung, chỉnh chu và không kém phần lịch lãm.\r\n', '450000', '299000', '', '1', '2016-09-21 02:31:01', '2016-09-21 02:57:35', 'kakinau', '1', 14, 14, '0.00', 0, '/assets/product_thumb/250_250_57e1f0e568f5e-21-09-2016-4jpg.jpg'),
(19, 'Iphone 7 Grey', 'iphone-7-grey', '0', '/assets/product/57e1f0f3053af-21-09-2016-dien-thoai-apple-iphone-7-plus-gold-256gb-mn4y2-vnjpg.jpg', 'Máy tính xách tay mới nhất của HP, Spectre 13 chỉ dày 10,4mm, mỏng hơn cả MacBook của Apple (13,2mm) và XPS của Dell 13 (15,2mm), giữ vị trí mỏng nhất hiện tại. Không chỉ vậy, sản phẩm còn mang nét khác biệt lẫn độc đáo trong thiết kế, tạo được dấu ấn r', '23000000', '23000000', '', '1', '2016-09-21 02:31:15', '2016-09-21 02:44:26', '3243', '1', 16, 16, '0.00', 0, '/assets/product_thumb/250_250_57e1f0f3053af-21-09-2016-dien-thoai-apple-iphone-7-plus-gold-256gb-mn4y2-vnjpg.jpg'),
(20, 'Nước hoa nữ Carnival N.03 50ml', 'nuoc-hoa-nu-carnival-n03-50ml', '0', '/assets/product/57e1f10faeeee-21-09-2016-67625-62298-bp7003-139-20150418-8936029335033-4jpg.jpg', '', '0', '89000', '', '1', '2016-09-21 02:31:43', '2016-09-21 02:44:19', 'Carnival N.03', '1', 17, 17, '0.00', 0, '/assets/product_thumb/250_250_57e1f10faeeee-21-09-2016-67625-62298-bp7003-139-20150418-8936029335033-4jpg.jpg'),
(22, ' Bộ nồi Amberline 1.5L và 3L Luminarc', 'bo-noi-amberline-15l-va-3l-luminarc', '0', '/assets/product/57e1f166c2740-21-09-2016-bo-noi-amberline-1-5l-va-5l-luminarc-a1505-thuy-tinh-9993-227503-1-productjpg.jpg', '', '1', '869', '', '1', '2016-09-21 02:33:10', '2016-09-21 02:44:14', 'LR2050', '0', 19, 19, '0.00', 0, '/assets/product_thumb/250_250_57e1f166c2740-21-09-2016-bo-noi-amberline-1-5l-va-5l-luminarc-a1505-thuy-tinh-9993-227503-1-productjpg.jpg'),
(23, 'Nước hoa nữ Latino N.92 100ml', 'nuoc-hoa-nu-latino-n92-100ml', '0', '/assets/product/57e1f16f9c2cd-21-09-2016-69045-58899-bp7003-139-20150418-8936029330922-3jpg.jpg', '', '0', '80000', '', '1', '2016-09-21 02:33:19', '2016-09-21 02:37:54', 'Latino N.92', '1', 17, 17, '0.00', 0, '/assets/product_thumb/250_250_57e1f16f9c2cd-21-09-2016-69045-58899-bp7003-139-20150418-8936029330922-3jpg.jpg'),
(24, ' Áo khoác da nam lót lông AK75  ', 'ao-khoac-da-nam-lot-long-ak75', '0', '/assets/product/57e1f17105c93-21-09-2016-mat-saujpg.jpg', 'Sản phẩm Made in Vietnam', '919000', '499000', '', '1', '2016-09-21 02:33:21', '2016-09-21 02:57:28', 'AK75', '1', 14, 14, '0.00', 0, '/assets/product_thumb/250_250_57e1f17105c93-21-09-2016-mat-saujpg.jpg'),
(25, 'Túi xách thời trang nữ LAZAShop TX260 (Hồng phấn) ', 'tui-xach-thoi-trang-nu-lazashop-tx260-hong-phan', '0', '/assets/product/57e1f23127a30-21-09-2016-tuisuajpg.jpg', 'túi đẹp', '0', '299', '', '1', '2016-09-21 02:33:57', '2016-09-21 02:37:40', '002', '0', 18, 18, '0.00', 0, '/assets/product_thumb/250_250_57e1f23127a30-21-09-2016-tuisuajpg.jpg'),
(26, ' Găng Tạ SportsLink', 'gang-ta-sportslink', '0', '', 'Găng Tạ SportsLink MO.0606', '69', '69', '', '1', '2016-09-21 02:34:36', '2016-09-21 02:44:08', 'MO.0606', '0', 21, 21, '0.00', 0, ''),
(27, 'Asus ', 'asus', '0', '/assets/product/57e1f1dc50138-21-09-2016-asus-g752vy-gc245d-xamjpg.jpg', 'FULL Mới 100% asus', '50000000', '50000000', '', '1', '2016-09-21 02:35:08', '2016-09-21 02:37:23', 'iron man', '1', 16, 16, '0.00', 0, '/assets/product_thumb/250_250_57e1f1dc50138-21-09-2016-asus-g752vy-gc245d-xamjpg.jpg'),
(28, 'Bộ sản phẩm chăm sóc da Shiseido - Xả stress cho l', 'bo-san-pham-cham-soc-da-shiseido-xa-stress-cho-l', '0', '/assets/product/57e1f1e639ee8-21-09-2016-1473161081947-4929221jpg.jpg', '', '0', '950000', '', '1', '2016-09-21 02:35:18', '2016-09-21 02:37:10', '#213', '1', 17, 17, '0.00', 0, '/assets/product_thumb/250_250_57e1f1e639ee8-21-09-2016-1473161081947-4929221jpg.jpg'),
(29, ' Chảo siêu bền đá hợp kim nhôm phủ đá Sunhouse', 'chao-sieu-ben-da-hop-kim-nhom-phu-da-sunhouse', '0', '/assets/product/57e1f2238b0ee-21-09-2016-sunhouse-sbd-28-chao-sieu-ben-da-hop-kim-nhom-phu-dajpg.jpg', '', '288', '175', '', '1', '2016-09-21 02:36:19', '2016-09-21 02:44:03', 'SBD-28', '3', 19, 19, '0.00', 0, '/assets/product_thumb/250_250_57e1f2238b0ee-21-09-2016-sunhouse-sbd-28-chao-sieu-ben-da-hop-kim-nhom-phu-dajpg.jpg'),
(30, 'Giày Tây Công Sở Thời Trang Zapas - GT023 (Đen)', 'giay-tay-cong-so-thoi-trang-zapas-gt023-den', '0', '/assets/product/57e1f226c5f20-21-09-2016-giay-tay-thoi-trang-zapasvn-3jpg.jpg', 'Chất liệu cao cấp\r\nKiểu dáng thời trang\r\nDễ dàng phối với nhiều trang phục', '450000', '349000', '', '1', '2016-09-21 02:36:22', '2016-09-21 02:57:08', 'GT023', '1', 14, 14, '0.00', 0, '/assets/product_thumb/250_250_57e1f226c5f20-21-09-2016-giay-tay-thoi-trang-zapasvn-3jpg.jpg'),
(31, 'Kem chống nắng Lanopearl Bondi Sun Australian Dail', 'kem-chong-nang-lanopearl-bondi-sun-australian-dail', '0', '/assets/product/57e1f2518f8c0-21-09-2016-1468214441096-8116857jpg.jpg', '', '0', '690000', '', '1', '2016-09-21 02:37:05', '2016-09-21 02:43:33', 'SPF30+ ', '1', 17, 17, '0.00', 0, '/assets/product_thumb/250_250_57e1f2518f8c0-21-09-2016-1468214441096-8116857jpg.jpg'),
(32, 'Máy tính bảng Asus', 'may-tinh-bang-asus', '0', '/assets/product/57e1f281ce160-21-09-2016-may-tinh-bang-alcatel-one-touch-p320x-1jpg.jpg', 'Máy tính xách tay mới nhất của HP, Spectre 13 chỉ dày 10,4mm, mỏng hơn cả MacBook của Apple (13,2mm) và XPS của Dell 13 (15,2mm), giữ vị trí mỏng nhất hiện tại. Không chỉ vậy, sản phẩm còn ', '1200000', '12000000', '', '1', '2016-09-21 02:37:53', '2016-09-21 02:43:27', '324234', '1', 16, 16, '0.00', 0, '/assets/product_thumb/250_250_57e1f281ce160-21-09-2016-may-tinh-bang-alcatel-one-touch-p320x-1jpg.jpg'),
(33, 'Găng Tạ SportLink MO.0606', 'gang-ta-sportlink-mo0606', '0', '/assets/product/57e1f29578b66-21-09-2016-2jpg.jpg', 'Găng Tạ SportLink MO.0606', '69', '69', '', '1', '2016-09-21 02:38:13', '2016-09-21 02:40:40', 'MO.0606', '0', 21, 21, '0.00', 0, '/assets/product_thumb/250_250_57e1f29578b66-21-09-2016-2jpg.jpg'),
(34, 'Giày tây nam Zapas dáng xỏ - GT03 (Màu Nâu)  ', 'giay-tay-nam-zapas-dang-xo-gt03-mau-nau', '0', '/assets/product/57e1f2bda640e-21-09-2016-giay-tay-da-nam-dang-xo-1png.png', 'Bảo hành: 12 tháng Bằng Hóa đơn mua hàng', '450000', '249000', '', '1', '2016-09-21 02:38:53', '2016-09-21 02:57:04', 'GT03', '1', 14, 14, '0.00', 0, '/assets/product_thumb/250_250_57e1f2bda640e-21-09-2016-giay-tay-da-nam-dang-xo-1png.png'),
(35, 'Thuốc nhuộm tóc L''Oreal Majirel 7.3 50ml', 'thuoc-nhuom-toc-loreal-majirel-73-50ml', '0', '/assets/product/57e1f2cfed99e-21-09-2016-90018-86808-f4q-139-20150804-6946537094072-1-chonjpg.jpg', '', '0', '140000', '', '1', '2016-09-21 02:39:12', '2016-09-21 02:42:32', '#1234546546', '1', 17, 17, '0.00', 0, '/assets/product_thumb/250_250_57e1f2cfed99e-21-09-2016-90018-86808-f4q-139-20150804-6946537094072-1-chonjpg.jpg'),
(36, 'New product', 'new-product', '0', '/assets/product/57e1f2d4d18f2-21-09-2016-bo-3-noi-inox-sunhouse-sh333-1444635888jpg.jpg', '', '290', '290', '', '1', '2016-09-21 02:39:16', '2016-09-21 02:42:28', '', '0', 19, 19, '0.00', 0, '/assets/product_thumb/250_250_57e1f2d4d18f2-21-09-2016-bo-3-noi-inox-sunhouse-sh333-1444635888jpg.jpg'),
(37, ' Bình xịt phủ nano chống nước đa năng Eykosi 250ml', 'binh-xit-phu-nano-chong-nuoc-da-nang-eykosi-250ml', '0', '/assets/product/57e1f31faa2de-21-09-2016-binh-xit-phu-nano-chong-nuoc-da-nang-eykosi-250ml-2351-0691112-3eb3dabb50e6980ffcdba2e3e5400364-zoomjpg.jpg', '', '100000', '47000', '', '1', '2016-09-21 02:40:31', '2016-09-21 02:57:00', 'EYK541', '3', 20, 20, '0.00', 0, '/assets/product_thumb/250_250_57e1f31faa2de-21-09-2016-binh-xit-phu-nano-chong-nuoc-da-nang-eykosi-250ml-2351-0691112-3eb3dabb50e6980ffcdba2e3e5400364-zoomjpg.jpg'),
(38, 'Dầu gội chống rụng tóc Alfaparf Milano Semi Di Lin', 'dau-goi-chong-rung-toc-alfaparf-milano-semi-di-lin', '0', '/assets/product/57e1f3229b381-21-09-2016-146588841079-6924772jpg.jpg', '', '0', '279000', '', '1', '2016-09-21 02:40:34', '2016-09-21 02:42:14', '#56789', '1', 17, 17, '0.00', 0, '/assets/product_thumb/250_250_57e1f3229b381-21-09-2016-146588841079-6924772jpg.jpg'),
(39, 'Kem chống nắng Tonymoly My Sunny Powder Finish Sun', 'kem-chong-nang-tonymoly-my-sunny-powder-finish-sun', '0', '/assets/product/57e1f3681c2ba-21-09-2016-1471940438927-8444252jpg.jpg', '', '0', '340000', '', '1', '2016-09-21 02:41:44', '2016-09-21 02:42:09', '', '1', 17, 17, '0.00', 0, '/assets/product_thumb/250_250_57e1f3681c2ba-21-09-2016-1471940438927-8444252jpg.jpg'),
(40, ' Nồi kho cá Fujika FJ-KC25 vung kính 2.5L', 'noi-kho-ca-fujika-fj-kc25-vung-kinh-25l', '0', '/assets/product/57e1f36cc707b-21-09-2016-noi-kho-ca-zpsf1bf1553jpg.jpg', '', '290', '219', '', '1', '2016-09-21 02:41:48', '2016-09-21 02:42:07', 'abc', '0', 19, 19, '0.00', 0, '/assets/product_thumb/250_250_57e1f36cc707b-21-09-2016-noi-kho-ca-zpsf1bf1553jpg.jpg'),
(41, 'Acer 123', 'acer-123', '0', '/assets/product/57e1f372cd22d-21-09-2016-may-tinh-xach-tay-acer-predator-nh-q0ssv-001-g9-592-win-10jpg.jpg', 'Acer PREDATOR-NH.Q0SSV.001-G9-592 thiết kế hầm hố đặc trưng của dòng laptop chơi game với các đường cắt dứt khoát, gam màu tương phản đen-đỏ cùng cụm loa và hệ thống tản nhiệt tinh vi khẳng định cá tính người sử dụng.\r\n\r\n 	\r\n', '43233312312', '21312323432', '', '1', '2016-09-21 02:41:54', '2016-09-21 02:42:03', '12413413', '1', 16, 16, '0.00', 0, '/assets/product_thumb/250_250_57e1f372cd22d-21-09-2016-may-tinh-xach-tay-acer-predator-nh-q0ssv-001-g9-592-win-10jpg.jpg'),
(42, ' Máy tập cơ bụng AB', 'may-tap-co-bung-ab', '0', '/assets/product/57e1f39330c95-21-09-2016-1jpg.jpg', 'Máy tập cơ bụng AB thiên trường', '189', '189', '', '1', '2016-09-21 02:42:27', '2016-09-21 02:42:43', 'M0.0707', '0', 21, 21, '0.00', 0, '/assets/product_thumb/250_250_57e1f39330c95-21-09-2016-1jpg.jpg'),
(43, ' Đầm voan xòe xếp ly ngực Beyeu1688 BY2039  ', 'dam-voan-xoe-xep-ly-nguc-beyeu1688-by2039', '0', '/assets/product/57e1f3a35b81f-21-09-2016-damnu11jpg.jpg', '', '175', '175', '', '1', '2016-09-21 02:42:43', '2016-09-21 02:43:13', 'BY2039  ', '0', 18, 18, '0.00', 0, '/assets/product_thumb/250_250_57e1f3a35b81f-21-09-2016-damnu11jpg.jpg'),
(44, 'Sữa dưỡng thể Mades Recipes Herbal Happiness Body ', 'sua-duong-the-mades-recipes-herbal-happiness-body', '0', '/assets/product/57e1f3ab2024f-21-09-2016-1447986469299-3929007jpg.jpg', '', '0', '650000', '', '0', '2016-09-21 02:42:51', '2016-09-21 07:45:45', '#HG65645', '2', 17, 17, '0.00', 0, '/assets/product_thumb/250_250_57e1f3ab2024f-21-09-2016-1447986469299-3929007jpg.jpg'),
(45, 'Kính mát phân cực kiểu dáng phi công gọng hợp kim ', 'kinh-mat-phan-cuc-kieu-dang-phi-cong-gong-hop-kim', '0', '/assets/product/57e1f3c0ac4cb-21-09-2016-k77-1ajpg.jpg', 'Sản phẩm kính phân cực chống tia UV giúp bảo vệ mắt một cách tốt nhất.', '669000', '329000', '', '1', '2016-09-21 02:43:12', '2016-09-21 02:57:22', 'K77', '1', 14, 14, '0.00', 0, '/assets/product_thumb/250_250_57e1f3c0ac4cb-21-09-2016-k77-1ajpg.jpg'),
(46, 'Máy tính bảng acer', 'may-tinh-bang-acer', '0', '/assets/product/57e1f3d86b7f6-21-09-2016-may-tinh-bang-alcatel-one-touch-p320xjpg.jpg', 'Vi xử lý core i7 - 6700HQ, 4 lõi 8 luồng tốc độ 2.6 GHz, RAM 16GB, ổ cứng HDD 1TB + SSD 128GB. Card đồ họa rời Nvidia GeForce GTX 970M 6GB xử lý tốt và nhanh chóng các tác vụ.', '32898239329', '23423432433', '', '1', '2016-09-21 02:43:36', '2016-09-21 02:43:57', 'er2343', '1', 16, 16, '0.00', 0, '/assets/product_thumb/250_250_57e1f3d86b7f6-21-09-2016-may-tinh-bang-alcatel-one-touch-p320xjpg.jpg'),
(47, ' Kính đi đường ban đên Night View Glasses (Vàng) ', 'kinh-di-duong-ban-den-night-view-glasses-vang', '0', '/assets/product/57e1f42919c97-21-09-2016-kinh-nhin-xuyen-dem-night-view-glassespng.png', 'Kính nhìn xuyên đêm Night View Glass kỳ diệu công dụng 3 trong 1 không thể tin được. Không chỉ là cặp kính có thể giúp bạn nhìn xuyên màn đêm, chống ánh sáng chói mắt từ ánh đèn xe đối diện bảo vệ sự anh toàn cho bạn khi lưu thông trên đường, chiếc kính n', '89000', '14000', '', '1', '2016-09-21 02:44:57', '2016-09-21 02:58:07', 'vbn', '1', 14, 14, '0.00', 0, '/assets/product_thumb/250_250_57e1f42919c97-21-09-2016-kinh-nhin-xuyen-dem-night-view-glassespng.png'),
(48, ' Máy hút bụi cầm tay Omi Nanny ', 'may-hut-bui-cam-tay-omi-nanny', '0', '/assets/product/57e1f451c1c2d-21-09-2016-may-hut-bui-omi-hvc-hf003-01jpg.jpg', '', '426', '719', '', '1', '2016-09-21 02:45:37', '2016-09-21 02:46:33', 'V1', '0', 19, 19, '0.00', 0, '/assets/product_thumb/250_250_57e1f451c1c2d-21-09-2016-may-hut-bui-omi-hvc-hf003-01jpg.jpg'),
(49, ' Đầm jean xếp ly eo thời trang BeYeu1688 BY3070  ', 'dam-jean-xep-ly-eo-thoi-trang-beyeu1688-by3070', '0', '/assets/product/57e1f479793bb-21-09-2016-damnu21jpg.jpg', '', '169', '169', '', '1', '2016-09-21 02:46:17', '2016-09-21 02:46:29', 'BY3070  ', '0', 18, 18, '0.00', 0, '/assets/product_thumb/250_250_57e1f479793bb-21-09-2016-damnu21jpg.jpg'),
(50, ' Máy tập đa năng Buheung', 'may-tap-da-nang-buheung', '0', '/assets/product/57e1f4a490998-21-09-2016-3jpg.jpg', 'Máy tập đa năng Buheung MK-412', '1', '1', '', '1', '2016-09-21 02:47:00', '2016-09-21 02:56:54', 'MK-412', '0', 21, 21, '0.00', 0, '/assets/product_thumb/250_250_57e1f4a490998-21-09-2016-3jpg.jpg'),
(51, ' Kéo cắt gà vịt  ', 'keo-cat-ga-vit', '0', '/assets/product/57e1f4d88e5eb-21-09-2016-anh-4042jpg.jpg', '', '37', '0', '', '1', '2016-09-21 02:47:52', '2016-09-21 02:56:45', '', '0', 19, 19, '0.00', 0, '/assets/product_thumb/250_250_57e1f4d88e5eb-21-09-2016-anh-4042jpg.jpg'),
(52, ' Túi xách công sở Rhinos Life (Nâu cafe)  ', 'tui-xach-cong-so-rhinos-life-nau-cafe', '0', '/assets/product/57e1f4e040d79-21-09-2016-1467252084dsc04207jpg.jpg', 'Bảo hành: 3 tháng Bằng Hóa đơn mua hàng', '900000', '549000', '', '1', '2016-09-21 02:48:00', '2016-09-21 03:04:05', 'vbnxc', '1', 14, 14, '0.00', 0, '/assets/product_thumb/250_250_57e1f4e040d79-21-09-2016-1467252084dsc04207jpg.jpg'),
(53, ' Bạt phủ ô tô 2 lớp oto 7 chỗ siêu nhẹ SU7 ', 'bat-phu-o-to-2-lop-oto-7-cho-sieu-nhe-su7', '0', '/assets/product/57e1f4f2ea091-21-09-2016-bat-phu-o-to-2-lop-oto-7-cho-sieu-nhe-su7-9781-7253362-3923c087c8f38bdebe13a6c8fa299389-zoomjpg.jpg', '', '950000', '513000', '', '1', '2016-09-21 02:48:19', '2016-09-21 02:56:35', 'SU7', '3', 20, 20, '0.00', 0, '/assets/product_thumb/250_250_57e1f4f2ea091-21-09-2016-bat-phu-o-to-2-lop-oto-7-cho-sieu-nhe-su7-9781-7253362-3923c087c8f38bdebe13a6c8fa299389-zoomjpg.jpg'),
(54, 'Áo cánh dơi phối ren tròn BY1002 (Trắng)  ', 'ao-canh-doi-phoi-ren-tron-by1002-trang', '0', '/assets/product/57e1f509cd72c-21-09-2016-aothun11jpg.jpg', '', '147', '147', '', '1', '2016-09-21 02:48:41', '2016-09-21 02:56:17', 'BY1002 ', '0', 18, 18, '0.00', 0, '/assets/product_thumb/250_250_57e1f509cd72c-21-09-2016-aothun11jpg.jpg'),
(55, ' Xe đạp tại chỗ - MO.2060 - HANG SPORTS', 'xe-dap-tai-cho-mo2060-hang-sports', '0', '/assets/product/57e1f53237b53-21-09-2016-4jpg.jpg', 'Xe đạp tại chỗ - MO.2060 - HANG SPORTS', '2', '2', '', '1', '2016-09-21 02:49:22', '2016-09-21 02:56:13', 'MO.0404', '0', 21, 21, '0.00', 0, '/assets/product_thumb/250_250_57e1f53237b53-21-09-2016-4jpg.jpg'),
(56, 'Túi đeo chéo Polo Videng Đồ da Thành Long TLG 2058', 'tui-deo-cheo-polo-videng-do-da-thanh-long-tlg-2058', '0', '/assets/product/57e1f55ff3a98-21-09-2016-14593299975227jpg.jpg', 'Trong cuộc sống công nghiệp hiện đại, một chiếc túi xách đa năng thông minh và hợp thời trang là vật dụng cần thiết đối với mỗi người. Chiếc Túi đeo chéo Polo Videng 205867-2 không chỉ giúp quản lý và lưu giữ vật dụng cá nhân một cách gọn gàng mà còn giúp', '304000', '152000', '', '1', '2016-09-21 02:50:08', '2016-09-21 03:04:00', 'TLG 205867-2', '1', 14, 14, '0.00', 0, '/assets/product_thumb/250_250_57e1f55ff3a98-21-09-2016-14593299975227jpg.jpg'),
(57, ' Bộ vá muỗng làm bếp 6 món Tashuan', 'bo-va-muong-lam-bep-6-mon-tashuan', '0', '/assets/product/57e1f566c587f-21-09-2016-bo-va-muong-lam-bep-6-mon-tashuan-ts-3455-den-1479-113872-1-productjpg.jpg', '', '59', '49', '', '1', '2016-09-21 02:50:14', '2016-09-21 02:56:04', '', '0', 19, 19, '0.00', 0, '/assets/product_thumb/250_250_57e1f566c587f-21-09-2016-bo-va-muong-lam-bep-6-mon-tashuan-ts-3455-den-1479-113872-1-productjpg.jpg'),
(58, 'Áo croptop ren - áo lót hai dây 2 in 1 có đệm ngực', 'ao-croptop-ren-ao-lot-hai-day-2-in-1-co-dem-nguc', '0', '/assets/product/57e1f58a38a2b-21-09-2016-aothun21jpg.jpg', '', '68', '68', '', '1', '2016-09-21 02:50:50', '2016-09-21 02:55:58', 'GT 247', '1', 18, 18, '0.00', 0, '/assets/product_thumb/250_250_57e1f58a38a2b-21-09-2016-aothun21jpg.jpg'),
(59, 'Vòng tay nam VT69 ', 'vong-tay-nam-vt69', '0', '/assets/product/57e1f5d5ab50e-21-09-2016-12jpg.jpg', 'Vòng Tay Nam VT69\r\n\r\n* Màu sắc: Như hình\r\n\r\n* Chất liệu : dây da đính họa tiết kim loại\r\n\r\n* Sản xuất : ViệtNam\r\n\r\n* Chiều dài : 25-27cm\r\n\r\n* Trọng lượng : 50g\r\n\r\nƯu điểm: có thểthao ra dễ dàng', '250000', '160000', '', '1', '2016-09-21 02:52:05', '2016-09-21 03:03:49', 'VT69 ', '1', 14, 14, '0.00', 0, '/assets/product_thumb/250_250_57e1f5d5ab50e-21-09-2016-12jpg.jpg'),
(60, ' Bóp tay mouse cao cấp', 'bop-tay-mouse-cao-cap', '0', '/assets/product/57e1f5f06ed56-21-09-2016-5jpg.jpg', 'Bóp tay mouse cao cấp (đen)', '80000', '70000', '', '1', '2016-09-21 02:52:32', '2016-09-21 03:11:56', 'M0.0808', '0', 21, 21, '0.00', 0, '/assets/product_thumb/250_250_57e1f5f06ed56-21-09-2016-5jpg.jpg'),
(61, 'òng đeo tay Nam hình 12 chòm sao hoàng đạo cung ', 'ong-deo-tay-nam-hinh-12-chom-sao-hoang-dao-cung', '0', '/assets/product/57e1f6284270f-21-09-2016-1465881523951-9070jpg.jpg', 'Nếu như các bạn nghĩ những set đồ phụ kiện thời trang của mình chỉ có thể là những chiếc nhẫn hay sợi dây chuyền thì thật sai lầm!\r\nHãy để những chiếc vòng đeo tay đẹp trở thành style thêm nổi bật và tôn lên phong cách c', '269000', '107000', '', '1', '2016-09-21 02:53:28', '2016-09-21 03:03:45', 'VĐT03 ', '1', 14, 14, '0.00', 0, '/assets/product_thumb/250_250_57e1f6284270f-21-09-2016-1465881523951-9070jpg.jpg'),
(62, 'Chân váy công sở phối lưng vạt xéo Đen - V05323060', 'chan-vay-cong-so-phoi-lung-vat-xeo-den-v05323060', '0', '/assets/product/57e1f65c93c37-21-09-2016-chanvay11jpg.jpg', '', '115', '115', '', '1', '2016-09-21 02:54:20', '2016-09-21 02:55:22', ' V05323060  ', '3', 18, 18, '0.00', 0, '/assets/product_thumb/250_250_57e1f65c93c37-21-09-2016-chanvay11jpg.jpg'),
(63, ' Kìm bóp tay chữ A có lò xo điều chỉnh lực', 'kim-bop-tay-chu-a-co-lo-xo-dieu-chinh-luc', '0', '/assets/product/57e1f6863f1bd-21-09-2016-6jpg.jpg', 'Kìm bóp tay chữ A có lò xo điều chỉnh lực (xám phối đen)', '82', '82', '', '1', '2016-09-21 02:55:02', '2016-09-21 02:55:15', 'M0.0909', '0', 21, 21, '0.00', 0, '/assets/product_thumb/250_250_57e1f6863f1bd-21-09-2016-6jpg.jpg'),
(64, 'Cannon123', 'cannon123', '0', '/assets/product/57e1f694ec6e1-21-09-2016-may-anh-canon-eos-m-w-18-55-22-90ex-bk-denjpg.jpg', 'MÁY ẢNH & MÁY QUAY PHIM Máy tính xách tay mới nhất của HP, Spectre 13 chỉ dày 10,4mm, mỏng hơn cả MacBook của Apple (13,2mm) và XPS của Dell 13 (15,2mm), giữ vị trí mỏng nhất hiện tại. Không chỉ vậy, sản phẩm còn mang nét khác biệt lẫn độc đáo trong thiết', '45235234', '523423523523', '', '1', '2016-09-21 02:55:17', '2016-09-21 02:55:46', '32523523', '1', 16, 16, '0.00', 0, '/assets/product_thumb/250_250_57e1f694ec6e1-21-09-2016-may-anh-canon-eos-m-w-18-55-22-90ex-bk-denjpg.jpg'),
(65, ' Bộ 06 miếng che nắng cho ô tô  BN003', 'bo-06-mieng-che-nang-cho-o-to-bn003', '0', '/assets/product/57e1f6a16fa25-21-09-2016-bo-06-mieng-che-nang-cho-o-to-2799-7094762-35365805d94d77e16e670e33b1db4b5a-zoomjpg.jpg', '', '218000', '82000', '', '1', '2016-09-21 02:55:29', '2016-09-21 02:55:42', 'BN003', '3', 20, 20, '0.00', 0, '/assets/product_thumb/250_250_57e1f6a16fa25-21-09-2016-bo-06-mieng-che-nang-cho-o-to-2799-7094762-35365805d94d77e16e670e33b1db4b5a-zoomjpg.jpg'),
(66, 'canon2342354', 'canon2342354', '0', '/assets/product/57e1f6d0ccfa6-21-09-2016-may-anh-canon-eos-70d-kit-18-55-stmjpg.jpg', 'Máy tính xách tay mới nhất của HP, Spectre 13 chỉ dày 10,4mm, mỏng hơn cả MacBook của Apple (13,2mm) và XPS của Dell 13 (15,2mm), giữ vị trí mỏng nhất hiện tại. Không chỉ vậy, sản phẩm còn mang nét khác biệt lẫn độc đáo trong thiết kế, tạo được dấu ấn riê', '12000000', '11000000', '', '1', '2016-09-21 02:56:16', '2016-09-21 03:10:12', 'sdfsdfsdf', '2', 16, 16, '0.00', 0, '/assets/product_thumb/250_250_57e1f6d0ccfa6-21-09-2016-may-anh-canon-eos-70d-kit-18-55-stmjpg.jpg'),
(67, 'Bộ 2 tạ tay VN', 'bo-2-ta-tay-vn', '0', '/assets/product/57e1f703bdc13-21-09-2016-7jpg.jpg', 'Bộ 2 tạ tay VN 2kg', '49', '49', '', '1', '2016-09-21 02:57:07', '2016-09-21 02:57:19', 'M0.1010', '0', 21, 21, '0.00', 0, '/assets/product_thumb/250_250_57e1f703bdc13-21-09-2016-7jpg.jpg'),
(68, 'Quần váy nữ mặc trong dáng cách điệu lạ mắt (màu đ', 'quan-vay-nu-mac-trong-dang-cach-dieu-la-mat-mau-d', '0', '/assets/product/57e1f71ede7a2-21-09-2016-chanvay21jpg.jpg', '', '72', '72', '', '1', '2016-09-21 02:57:34', '2016-09-21 02:57:43', 'by123231', '0', 18, 18, '0.00', 0, '/assets/product_thumb/250_250_57e1f71ede7a2-21-09-2016-chanvay21jpg.jpg'),
(69, 'sim tứ quý', 'sim-tu-quy', '0', '/assets/product/57e1f7256cc92-21-09-2016-dien-thoai-apple-iphone-6s-plus-rose-gold-64gb-a16877jpg.jpg', 'Máy tính xách tay mới nhất của HP, Spectre 13 chỉ dày 10,4mm, mỏng hơn cả MacBook của Apple (13,2mm) và XPS của Dell 13 (15,2mm), giữ vị trí mỏng nhất hiện tại. Không chỉ vậy, sản phẩm còn mang nét khác biệt lẫn độc đáo trong thiết kế, tạo được dấu ấn riê', '7587345', '12435687', '', '1', '2016-09-21 02:57:41', '2016-09-21 02:58:03', '2342342', '1', 16, 16, '0.00', 0, '/assets/product_thumb/250_250_57e1f7256cc92-21-09-2016-dien-thoai-apple-iphone-6s-plus-rose-gold-64gb-a16877jpg.jpg'),
(70, 'sim lộc phát', 'sim-loc-phat', '0', '/assets/product/57e1f757ec2ea-21-09-2016-dien-thoai-apple-iphone-6s-plus-rose-gold-64gb-a16877jpg.jpg', 'Máy tính xách tay mới nhất của HP, Spectre 13 chỉ dày 10,4mm, mỏng hơn cả MacBook của Apple (13,2mm) và XPS của Dell 13 (15,2mm), giữ vị trí mỏng nhất hiện tại. Không chỉ vậy, sản phẩm còn mang nét khác biệt lẫn độc đáo trong thiết kế, tạo được dấu ấn riê', '7864532345634', '9087654321', '', '1', '2016-09-21 02:58:32', '2016-09-21 03:03:41', '23457689', '1', 16, 16, '0.00', 0, '/assets/product_thumb/250_250_57e1f757ec2ea-21-09-2016-dien-thoai-apple-iphone-6s-plus-rose-gold-64gb-a16877jpg.jpg'),
(71, 'Tạ đeo chân Nguyên Đăng', 'ta-deo-chan-nguyen-dang', '0', '/assets/product/57e1f78049501-21-09-2016-8jpg.jpg', 'Tạ đeo chân Nguyên Đăng (Đen)', '369', '369', '', '1', '2016-09-21 02:59:12', '2016-09-21 03:03:37', 'M0.1212', '0', 21, 21, '0.00', 0, '/assets/product_thumb/250_250_57e1f78049501-21-09-2016-8jpg.jpg'),
(72, 'Khóa thắng đĩa Z-con   D200', 'khoa-thang-dia-z-con-d200', '0', '/assets/product/57e1f79429f89-21-09-2016-khoa-thang-dia-z-con-8167-4199971-555988424c75d02e07feab7f5c9b80f6-zoomjpg.jpg', '', '150000', '109000', '', '1', '2016-09-21 02:59:32', '2016-09-21 03:03:33', 'D200', '3', 20, 20, '0.00', 0, '/assets/product_thumb/250_250_57e1f79429f89-21-09-2016-khoa-thang-dia-z-con-8167-4199971-555988424c75d02e07feab7f5c9b80f6-zoomjpg.jpg'),
(73, ' Thảm tập yoga siêu cao cấp 6mm', 'tham-tap-yoga-sieu-cao-cap-6mm', '0', '/assets/product/57e1f806b3d23-21-09-2016-9jpg.jpg', 'Thảm tập yoga siêu cao cấp 6mm (Tím)', '100', '100', '', '1', '2016-09-21 03:01:26', '2016-09-21 03:03:28', 'M0.1111', '0', 21, 21, '0.00', 0, '/assets/product_thumb/250_250_57e1f806b3d23-21-09-2016-9jpg.jpg'),
(74, 'Bugi Bosch WR8DP Típ lớn (Bạc trắng)    ', 'bugi-bosch-wr8dp-tip-lon-bac-trang', '0', '/assets/product/57e1f80f8a1e6-21-09-2016-bugi-bosch-wr8dp-tip-lon-bac-trang-andnbsp-9161-2515852-59f0f917ba50875346f1e3df3ab0ce3e-zoomjpg.jpg', 'Bảo hành: 12 tháng Bằng Hóa đơn mua hàng', '149000', '94000', '', '1', '2016-09-21 03:01:35', '2016-09-21 03:03:24', 'MK4000', '3', 20, 20, '0.00', 0, '/assets/product_thumb/250_250_57e1f80f8a1e6-21-09-2016-bugi-bosch-wr8dp-tip-lon-bac-trang-andnbsp-9161-2515852-59f0f917ba50875346f1e3df3ab0ce3e-zoomjpg.jpg'),
(75, ' Quần short katun cao ', 'quan-short-katun-cao', '0', '/assets/product/57e1f83eaf005-21-09-2016-socnu11jpg.jpg', '', '339', '339', '', '1', '2016-09-21 03:02:22', '2016-09-21 03:03:11', 'by1213412', '0', 18, 18, '0.00', 0, '/assets/product_thumb/250_250_57e1f83eaf005-21-09-2016-socnu11jpg.jpg'),
(76, ' Khăn trải thảm tập yoga', 'khan-trai-tham-tap-yoga', '0', '/assets/product/57e1f884f1546-21-09-2016-10jpg.jpg', 'Khăn trải thảm tập yoga', '199', '199', '', '1', '2016-09-21 03:03:33', '2016-09-21 03:03:56', 'M0.1313', '0', 21, 21, '0.00', 0, '/assets/product_thumb/250_250_57e1f884f1546-21-09-2016-10jpg.jpg'),
(77, 'Bộ 2 bóng led chớp nhiều màu cho xe máy OEM   ', 'bo-2-bong-led-chop-nhieu-mau-cho-xe-may-oem', '0', '/assets/product/57e1f8d70ec9f-21-09-2016-bo-2-bong-led-chop-nhieu-mau-cho-xe-may-oem-3127-1923271-7b4df561a93a3b807d8e693d8c1b8f9f-zoomjpg.jpg', 'Bảo hành: 1 tháng Bằng Hóa đơn mua hàng', '99000', '57000', '', '1', '2016-09-21 03:04:55', '2016-09-21 03:06:04', 'OEM420', '3', 20, 20, '0.00', 0, '/assets/product_thumb/250_250_57e1f8d70ec9f-21-09-2016-bo-2-bong-led-chop-nhieu-mau-cho-xe-may-oem-3127-1923271-7b4df561a93a3b807d8e693d8c1b8f9f-zoomjpg.jpg'),
(78, 'sooc nữ đẹp', 'sooc-nu-dep', '0', '/assets/product/57e1f9100d409-21-09-2016-soocnu33jpg.jpg', '', '339', '339', '', '1', '2016-09-21 03:05:52', '2016-09-21 03:05:59', 'by432432', '0', 18, 18, '0.00', 0, '/assets/product_thumb/250_250_57e1f9100d409-21-09-2016-soocnu33jpg.jpg'),
(79, 'Đèn led chạy chữ gắn van xe (Xanh)   ', 'den-led-chay-chu-gan-van-xe-xanh', '0', '/assets/product/57e1f968dbdb7-21-09-2016-den-led-chay-chu-gan-van-xe-xanh-1850-8237272-af8b2e91f23dc7dcfc38c818de7a62e0-zoomjpg.jpg', 'Bảo hành: 10 tháng Bằng Hóa đơn mua hàng', '150000', '90000', '', '1', '2016-09-21 03:07:20', '2016-09-21 03:08:47', 'FF500', '3', 20, 20, '0.00', 0, '/assets/product_thumb/250_250_57e1f968dbdb7-21-09-2016-den-led-chay-chu-gan-van-xe-xanh-1850-8237272-af8b2e91f23dc7dcfc38c818de7a62e0-zoomjpg.jpg'),
(80, ' Xe tay ga Honda Air Blade 2016 Phiên bản thể thao', 'xe-tay-ga-honda-air-blade-2016-phien-ban-the-thao', '0', '/assets/product/57e1fa53c98ff-21-09-2016-xe-tay-ga-honda-air-blade-2016-phien-ban-the-thao-cam-den-1965-3216681-1-zoomjpgpng.png', 'Bảo hành: 3 năm Bằng Hóa đơn mua hàng\r\nGiá đã bao gồm Vat nhưng chưa bao gồm chi phí làm biển số', '40000000', '38888888', '', '1', '2016-09-21 03:11:15', '2016-09-28 07:15:03', '', '1', 20, 20, '0.00', 0, '/assets/product_thumb/250_250_57e1fa53c98ff-21-09-2016-xe-tay-ga-honda-air-blade-2016-phien-ban-the-thao-cam-den-1965-3216681-1-zoomjpgpng.png'),
(81, 'Xe tay ga Yamaha Acruzo Deluxe (Đen)   ', 'xe-tay-ga-yamaha-acruzo-deluxe-den', '0', '/assets/product/57e1fcb2384dd-21-09-2016-xe-may-yamaha-acruzo-deluxe-125i-trang-6095-8679871-1-zoomjpg.jpg', 'Bảo hành: 3 năm Bằng Hóa đơn mua hàng \r\nGiá đã bao gồm VAT nhưng chưa bao gồm chi phí làm biển số.', '34990000', '33240500', '', '1', '2016-09-21 03:21:22', '2016-09-21 08:54:49', '', '1', 20, 20, '0.00', 0, '/assets/product_thumb/250_250_57e1fcb2384dd-21-09-2016-xe-may-yamaha-acruzo-deluxe-125i-trang-6095-8679871-1-zoomjpg.jpg'),
(82, 'New product', 'new-product', '0', '/assets/product/57e5ed2213068-24-09-2016-ban-haijpg.jpg', '', '0', '0', '', '0', '2016-09-24 03:04:02', '2016-09-24 03:04:02', '', '0', 17, 17, '0.00', 0, '/assets/product_thumb/250_250_57e5ed2213068-24-09-2016-ban-haijpg.jpg'),
(83, 'New product', 'new-product', '0', '/assets/product/57e5f46d66714-24-09-2016-anh-bossjpg.jpg', '', '0', '0', '', '0', '2016-09-24 03:35:09', '2016-09-24 03:35:09', '', '0', 17, 17, '0.00', 0, '/assets/product_thumb/250_250_57e5f46d66714-24-09-2016-anh-bossjpg.jpg'),
(84, 'New product', 'new-product', '0', '/assets/product/57e5f4b3a08e6-24-09-2016-anh-boss-1jpg.jpg', '', '0', '0', '', '0', '2016-09-24 03:36:19', '2016-09-26 02:22:33', '', '0', 17, 17, '0.00', 0, '/assets/product_thumb/250_250_57e5f4b3a08e6-24-09-2016-anh-boss-1jpg.jpg'),
(87, 'New product', 'new-product', '0', '/assets/product/57e8894402b9b-26-09-2016-anh-bossjpg.jpg', '', '0', '0', '', '1', '2016-09-26 02:34:44', '2016-09-26 02:45:24', '', '0', 17, 17, '0.00', 0, '/assets/product_thumb/250_250_57e8894402b9b-26-09-2016-anh-bossjpg.jpg'),
(89, '', '', '0', '/assets/product/57e88d536ae64-26-09-2016-anh-bossjpg.jpg', '', '0', '0', '', '1', '2016-09-26 02:52:03', '2016-09-26 02:52:03', '', '0', 1, 1, '0.00', 0, '/assets/product_thumb/250_250_57e88d536ae64-26-09-2016-anh-bossjpg.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `product_attribute`
--

CREATE TABLE IF NOT EXISTS `product_attribute` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `attribute_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_attribute_product_id_foreign` (`product_id`),
  KEY `product_attribute_attribute_id_foreign` (`attribute_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=90 ;

--
-- Dumping data for table `product_attribute`
--

INSERT INTO `product_attribute` (`id`, `product_id`, `attribute_id`, `created_at`, `updated_at`) VALUES
(3, 81, 6, NULL, NULL),
(4, 81, 7, NULL, NULL),
(9, 13, 7, NULL, NULL),
(12, 13, 11, NULL, NULL),
(15, 19, 11, NULL, NULL),
(65, 87, 29, NULL, NULL),
(68, 87, 4, NULL, NULL),
(69, 87, 5, NULL, NULL),
(74, 89, 10, NULL, NULL),
(75, 89, 34, NULL, NULL),
(81, 13, 36, NULL, NULL),
(82, 19, 8, NULL, NULL),
(83, 19, 9, NULL, NULL),
(84, 19, 37, NULL, NULL),
(85, 13, 10, NULL, NULL),
(86, 13, 9, NULL, NULL),
(87, 13, 4, NULL, NULL),
(88, 81, 4, NULL, NULL),
(89, 81, 5, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_category`
--

CREATE TABLE IF NOT EXISTS `product_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `cate_pro_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=148 ;

--
-- Dumping data for table `product_category`
--

INSERT INTO `product_category` (`id`, `product_id`, `cate_pro_id`, `created_at`, `updated_at`) VALUES
(46, 10, 29, NULL, NULL),
(49, 13, 28, NULL, NULL),
(50, 14, 44, NULL, NULL),
(51, 15, 29, NULL, NULL),
(52, 16, 26, NULL, NULL),
(53, 17, 45, NULL, NULL),
(54, 18, 56, NULL, NULL),
(55, 19, 28, NULL, NULL),
(56, 20, 33, NULL, NULL),
(58, 22, 42, NULL, NULL),
(59, 23, 33, NULL, NULL),
(60, 24, 56, NULL, NULL),
(61, 25, 26, NULL, NULL),
(62, 26, 50, NULL, NULL),
(63, 27, 36, NULL, NULL),
(64, 28, 31, NULL, NULL),
(65, 29, 42, NULL, NULL),
(66, 30, 57, NULL, NULL),
(67, 31, 31, NULL, NULL),
(68, 32, 32, NULL, NULL),
(69, 33, 50, NULL, NULL),
(70, 34, 57, NULL, NULL),
(71, 35, 35, NULL, NULL),
(72, 37, 45, NULL, NULL),
(73, 38, 35, NULL, NULL),
(74, 39, 38, NULL, NULL),
(75, 40, 42, NULL, NULL),
(76, 41, 36, NULL, NULL),
(77, 42, 50, NULL, NULL),
(78, 43, 30, NULL, NULL),
(79, 44, 38, NULL, NULL),
(80, 45, 58, NULL, NULL),
(81, 46, 32, NULL, NULL),
(82, 47, 58, NULL, NULL),
(83, 48, 44, NULL, NULL),
(84, 49, 30, NULL, NULL),
(85, 50, 48, NULL, NULL),
(86, 51, 44, NULL, NULL),
(87, 52, 59, NULL, NULL),
(88, 53, 46, NULL, NULL),
(89, 54, 34, NULL, NULL),
(90, 55, 48, NULL, NULL),
(91, 56, 59, NULL, NULL),
(92, 57, 44, NULL, NULL),
(93, 58, 34, NULL, NULL),
(94, 59, 60, NULL, NULL),
(95, 60, 49, NULL, NULL),
(96, 61, 60, NULL, NULL),
(97, 62, 37, NULL, NULL),
(98, 63, 49, NULL, NULL),
(99, 64, 61, NULL, NULL),
(100, 65, 46, NULL, NULL),
(101, 66, 61, NULL, NULL),
(102, 67, 52, NULL, NULL),
(103, 68, 37, NULL, NULL),
(104, 69, 62, NULL, NULL),
(105, 70, 62, NULL, NULL),
(106, 71, 52, NULL, NULL),
(107, 72, 51, NULL, NULL),
(108, 73, 53, NULL, NULL),
(109, 74, 51, NULL, NULL),
(110, 75, 40, NULL, NULL),
(111, 76, 53, NULL, NULL),
(112, 77, 54, NULL, NULL),
(113, 78, 40, NULL, NULL),
(114, 79, 54, NULL, NULL),
(117, 80, 55, NULL, NULL),
(122, 81, 55, NULL, NULL),
(129, 55, 3, '2016-09-21 03:23:39', '2016-09-21 03:23:39'),
(130, 55, 6, '2016-09-21 03:23:39', '2016-09-21 03:23:39'),
(131, 60, 1, '2016-09-21 03:25:30', '2016-09-21 03:25:30'),
(132, 60, 2, '2016-09-21 03:25:30', '2016-09-21 03:25:30'),
(133, 60, 4, '2016-09-21 03:25:30', '2016-09-21 03:25:30'),
(134, 60, 7, '2016-09-21 03:25:30', '2016-09-21 03:25:30'),
(135, 52, 4, '2016-09-21 03:25:50', '2016-09-21 03:25:50'),
(136, 51, 4, '2016-09-21 03:26:10', '2016-09-21 03:26:10'),
(137, 34, 6, '2016-09-21 03:26:22', '2016-09-21 03:26:22'),
(138, 34, 7, '2016-09-21 03:26:23', '2016-09-21 03:26:23'),
(139, 36, 2, '2016-09-21 03:26:53', '2016-09-21 03:26:53'),
(140, 32, 4, '2016-09-21 03:27:03', '2016-09-21 03:27:03'),
(141, 31, 7, '2016-09-21 03:27:14', '2016-09-21 03:27:14'),
(142, 33, 6, '2016-09-21 03:27:23', '2016-09-21 03:27:23'),
(143, 40, 7, '2016-09-21 03:27:41', '2016-09-21 03:27:41'),
(144, 81, 28, '2016-09-28 07:14:48', '2016-09-28 07:14:48'),
(145, 80, 28, '2016-09-28 07:15:04', '2016-09-28 07:15:04'),
(146, 78, 28, '2016-09-28 07:15:16', '2016-09-28 07:15:16'),
(147, 79, 28, '2016-09-28 07:15:25', '2016-09-28 07:15:25');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE IF NOT EXISTS `product_images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `img` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `group_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `thumb_images` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_images_product_id_foreign` (`product_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=161 ;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `img`, `created_at`, `updated_at`, `group_name`, `type`, `thumb_images`) VALUES
(14, 10, '/assets/upload/57e1ef65cb976-21-09-2016-1468576855141-8509016jpg.jpg', '2016-09-21 02:25:19', '2016-09-22 08:55:43', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1ef65cb976-21-09-2016-1468576855141-8509016jpg.jpg'),
(15, 10, '/assets/upload/57e1ef65cbb14-21-09-2016-1468576855275-5249581jpg.jpg', '2016-09-21 02:25:20', '2016-09-22 08:55:43', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1ef65cbb14-21-09-2016-1468576855275-5249581jpg.jpg'),
(16, 10, '/assets/upload/57e1ef65e66ca-21-09-2016-1468576855667-6790343jpg.jpg', '2016-09-21 02:25:20', '2016-09-22 08:55:43', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1ef65e66ca-21-09-2016-1468576855667-6790343jpg.jpg'),
(17, 10, '/assets/upload/57e1ef65ed054-21-09-2016-1473073040521-2282474jpg.jpg', '2016-09-21 02:25:20', '2016-09-22 08:55:43', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1ef65ed054-21-09-2016-1473073040521-2282474jpg.jpg'),
(22, 13, '/assets/upload/57e1efd810812-21-09-2016-dien-thoai-apple-iphone-6s-plus-rose-gold-64gb-a16878jpg.jpg', '2016-09-21 02:29:06', '2016-09-22 08:55:43', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1efd810812-21-09-2016-dien-thoai-apple-iphone-6s-plus-rose-gold-64gb-a16878jpg.jpg'),
(23, 13, '/assets/upload/57e1efdd1c170-21-09-2016-dien-thoai-apple-iphone-6s-plus-rose-gold-64gb-a16877jpg.jpg', '2016-09-21 02:29:06', '2016-09-22 08:55:43', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1efdd1c170-21-09-2016-dien-thoai-apple-iphone-6s-plus-rose-gold-64gb-a16877jpg.jpg'),
(24, 15, '/assets/upload/57e1f07953c88-21-09-2016-98190-8935030232034-3-chonjpg.jpg', '2016-09-21 02:29:59', '2016-09-22 08:55:44', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f07953c88-21-09-2016-98190-8935030232034-3-chonjpg.jpg'),
(25, 15, '/assets/upload/57e1f07952d76-21-09-2016-154943-cns-8935030232225-3-chonjpg.jpg', '2016-09-21 02:30:00', '2016-09-22 08:55:44', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f07952d76-21-09-2016-154943-cns-8935030232225-3-chonjpg.jpg'),
(26, 15, '/assets/upload/57e1f07966ecf-21-09-2016-154944-cns-8935030232225-4-chonjpg.jpg', '2016-09-21 02:30:00', '2016-09-22 08:55:44', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f07966ecf-21-09-2016-154944-cns-8935030232225-4-chonjpg.jpg'),
(27, 16, '/assets/upload/57e1f06cec594-21-09-2016-tuijpg.jpg', '2016-09-21 02:30:19', '2016-09-21 02:30:19', 'Mặc định', 'Nhóm', ''),
(28, 16, '/assets/upload/57e1f06cf01bb-21-09-2016-tui1jpg.jpg', '2016-09-21 02:30:19', '2016-09-21 02:30:19', 'Mặc định', 'Nhóm', ''),
(29, 17, '/assets/upload/57e1f06852051-21-09-2016-dung-dich-bao-ve-andamp-phuc-hoi-sang-bong-noi-that-xe-hoi-nu-finish-vinyl-nv-300-473ml-1849-650643-d0319412f3ca73a9d9c0a66d7eb14c43-zoomjpg.jpg', '2016-09-21 02:30:27', '2016-09-22 08:55:47', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f06852051-21-09-2016-dung-dich-bao-ve-andamp-phuc-hoi-sang-bong-noi-that-xe-hoi-nu-finish-vinyl-nv-300-473ml-1849-650643-d0319412f3ca73a9d9c0a66d7eb14c43-zoomjpg.jpg'),
(30, 18, '/assets/upload/57e1f05734d8a-21-09-2016-4jpg.jpg', '2016-09-21 02:31:01', '2016-09-22 08:55:47', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f05734d8a-21-09-2016-4jpg.jpg'),
(31, 18, '/assets/upload/57e1f057346f7-21-09-2016-5jpg.jpg', '2016-09-21 02:31:02', '2016-09-22 08:55:47', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f057346f7-21-09-2016-5jpg.jpg'),
(32, 19, '/assets/upload/57e1f093c3271-21-09-2016-dien-thoai-apple-iphone-7-plus-gold-256gb-mn4y2-vn1jpg.jpg', '2016-09-21 02:31:15', '2016-09-22 08:55:47', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f093c3271-21-09-2016-dien-thoai-apple-iphone-7-plus-gold-256gb-mn4y2-vn1jpg.jpg'),
(33, 19, '/assets/upload/57e1f09848043-21-09-2016-dien-thoai-apple-iphone-7-plus-gold-256gb-mn4y2-vn2jpg.jpg', '2016-09-21 02:31:16', '2016-09-22 08:55:47', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f09848043-21-09-2016-dien-thoai-apple-iphone-7-plus-gold-256gb-mn4y2-vn2jpg.jpg'),
(34, 20, '/assets/upload/57e1f0e732f1a-21-09-2016-55854-62379-bp7003-139-20150418-8936029335033-5jpg.jpg', '2016-09-21 02:31:43', '2016-09-22 08:55:50', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f0e732f1a-21-09-2016-55854-62379-bp7003-139-20150418-8936029335033-5jpg.jpg'),
(35, 20, '/assets/upload/57e1f0e733cf2-21-09-2016-72331-61974-bp7003-139-20150418-8936029335033-1jpg.jpg', '2016-09-21 02:31:43', '2016-09-22 08:55:50', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f0e733cf2-21-09-2016-72331-61974-bp7003-139-20150418-8936029335033-1jpg.jpg'),
(39, 23, '/assets/upload/57e1f16256977-21-09-2016-55898-59098-bp7003-139-20150418-8936029330922-5jpg.jpg', '2016-09-21 02:33:19', '2016-09-22 08:55:50', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f16256977-21-09-2016-55898-59098-bp7003-139-20150418-8936029330922-5jpg.jpg'),
(40, 23, '/assets/upload/57e1f16259e1a-21-09-2016-69045-58899-bp7003-139-20150418-8936029330922-3-1jpg.jpg', '2016-09-21 02:33:19', '2016-09-22 08:55:50', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f16259e1a-21-09-2016-69045-58899-bp7003-139-20150418-8936029330922-3-1jpg.jpg'),
(41, 23, '/assets/upload/57e1f1626ba1f-21-09-2016-78321-58623-bp7003-139-20150418-8936029330922-1jpg.jpg', '2016-09-21 02:33:19', '2016-09-22 08:55:50', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f1626ba1f-21-09-2016-78321-58623-bp7003-139-20150418-8936029330922-1jpg.jpg'),
(42, 24, '/assets/upload/57e1f0f2a8290-21-09-2016-ao-khoac-da-nam-lot-du-ak89-1jpg.jpg', '2016-09-21 02:33:21', '2016-09-22 08:55:51', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f0f2a8290-21-09-2016-ao-khoac-da-nam-lot-du-ak89-1jpg.jpg'),
(43, 24, '/assets/upload/57e1f0f2c0291-21-09-2016-mat-saujpg.jpg', '2016-09-21 02:33:21', '2016-09-22 08:55:51', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f0f2c0291-21-09-2016-mat-saujpg.jpg'),
(44, 25, '/assets/upload/57e1f0f2bf50e-21-09-2016-tuiijpg.jpg', '2016-09-21 02:33:57', '2016-09-21 02:33:57', 'Mặc định', 'Nhóm', ''),
(45, 25, '/assets/upload/57e1f0f2ccd06-21-09-2016-tuii1jpg.jpg', '2016-09-21 02:33:57', '2016-09-21 02:33:57', 'Mặc định', 'Nhóm', ''),
(46, 25, '/assets/upload/57e1f0f370465-21-09-2016-tuii2jpg.jpg', '2016-09-21 02:33:57', '2016-09-21 02:33:57', 'Mặc định', 'Nhóm', ''),
(47, 26, '/assets/upload/57e1f16421023-21-09-2016-2jpg.jpg', '2016-09-21 02:34:37', '2016-09-21 02:34:37', 'Mặc định', 'Nhóm', ''),
(48, 26, '/assets/upload/57e1f1690768d-21-09-2016-21jpg.jpg', '2016-09-21 02:34:37', '2016-09-21 02:34:37', 'Mặc định', 'Nhóm', ''),
(49, 26, '/assets/upload/57e1f16910fac-21-09-2016-22jpg.jpg', '2016-09-21 02:34:37', '2016-09-21 02:34:37', 'Mặc định', 'Nhóm', ''),
(50, 27, '/assets/upload/57e1f1806a253-21-09-2016-asus-g752vy-gc245d-xam9jpg.jpg', '2016-09-21 02:35:08', '2016-09-22 08:55:54', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f1806a253-21-09-2016-asus-g752vy-gc245d-xam9jpg.jpg'),
(51, 28, '/assets/upload/57e1f1c0f0fd1-21-09-2016-1473161015119-4685697jpg.jpg', '2016-09-21 02:35:18', '2016-09-22 08:55:54', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f1c0f0fd1-21-09-2016-1473161015119-4685697jpg.jpg'),
(52, 28, '/assets/upload/57e1f1c0cf508-21-09-2016-1473161063695-1182373jpg.jpg', '2016-09-21 02:35:18', '2016-09-22 08:55:54', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f1c0cf508-21-09-2016-1473161063695-1182373jpg.jpg'),
(53, 28, '/assets/upload/57e1f1c0e6416-21-09-2016-1473161080299-2058435jpg.jpg', '2016-09-21 02:35:18', '2016-09-22 08:55:54', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f1c0e6416-21-09-2016-1473161080299-2058435jpg.jpg'),
(54, 30, '/assets/upload/57e1f1d60bf68-21-09-2016-giay-tay-thoi-trang-zapasvn-1jpg.jpg', '2016-09-21 02:36:23', '2016-09-22 08:55:57', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f1d60bf68-21-09-2016-giay-tay-thoi-trang-zapasvn-1jpg.jpg'),
(55, 30, '/assets/upload/57e1f1d60ba2b-21-09-2016-giay-tay-thoi-trang-zapasvn-2jpg.jpg', '2016-09-21 02:36:23', '2016-09-22 08:55:57', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f1d60ba2b-21-09-2016-giay-tay-thoi-trang-zapasvn-2jpg.jpg'),
(56, 30, '/assets/upload/57e1f1d6294f2-21-09-2016-giay-tay-thoi-trang-zapasvn-3jpg.jpg', '2016-09-21 02:36:23', '2016-09-22 08:55:57', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f1d6294f2-21-09-2016-giay-tay-thoi-trang-zapasvn-3jpg.jpg'),
(57, 30, '/assets/upload/57e1f1d635b99-21-09-2016-giay-tay-thoi-trang-zapasvn-6jpg.jpg', '2016-09-21 02:36:23', '2016-09-22 08:55:57', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f1d635b99-21-09-2016-giay-tay-thoi-trang-zapasvn-6jpg.jpg'),
(58, 31, '/assets/upload/57e1f20ca3dd8-21-09-2016-1468214440696-5612170jpg.jpg', '2016-09-21 02:37:05', '2016-09-22 08:55:57', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f20ca3dd8-21-09-2016-1468214440696-5612170jpg.jpg'),
(59, 31, '/assets/upload/57e1f20ca6edc-21-09-2016-1468214441096-8116857-1jpg.jpg', '2016-09-21 02:37:05', '2016-09-22 08:55:57', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f20ca6edc-21-09-2016-1468214441096-8116857-1jpg.jpg'),
(60, 32, '/assets/upload/57e1f21c192e7-21-09-2016-may-tinh-bang-alcatel-one-touch-p320x1jpg.jpg', '2016-09-21 02:37:54', '2016-09-22 08:55:57', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f21c192e7-21-09-2016-may-tinh-bang-alcatel-one-touch-p320x1jpg.jpg'),
(61, 32, '/assets/upload/57e1f221a6ee3-21-09-2016-may-tinh-bang-asus-z370cg-den4jpg.jpg', '2016-09-21 02:37:54', '2016-09-22 08:55:58', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f221a6ee3-21-09-2016-may-tinh-bang-asus-z370cg-den4jpg.jpg'),
(62, 33, '/assets/upload/57e1f25c60302-21-09-2016-2jpg.jpg', '2016-09-21 02:38:14', '2016-09-22 08:56:00', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f25c60302-21-09-2016-2jpg.jpg'),
(63, 33, '/assets/upload/57e1f26030089-21-09-2016-21jpg.jpg', '2016-09-21 02:38:14', '2016-09-21 02:38:14', 'Mặc định', 'Nhóm', ''),
(64, 33, '/assets/upload/57e1f2603bff7-21-09-2016-22jpg.jpg', '2016-09-21 02:38:14', '2016-09-21 02:38:14', 'Mặc định', 'Nhóm', ''),
(65, 34, '/assets/upload/57e1f2528d8c0-21-09-2016-giay-tay-da-nam-dang-xo-1png.png', '2016-09-21 02:38:54', '2016-09-22 08:56:01', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f2528d8c0-21-09-2016-giay-tay-da-nam-dang-xo-1png.png'),
(66, 34, '/assets/upload/57e1f2528bfd4-21-09-2016-giay-tay-da-nam-dang-xo-5png.png', '2016-09-21 02:38:54', '2016-09-22 08:56:02', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f2528bfd4-21-09-2016-giay-tay-da-nam-dang-xo-5png.png'),
(67, 34, '/assets/upload/57e1f252b0f5c-21-09-2016-giay-tay-da-nam-dang-xo-6png.png', '2016-09-21 02:38:55', '2016-09-22 08:56:02', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f252b0f5c-21-09-2016-giay-tay-da-nam-dang-xo-6png.png'),
(68, 34, '/assets/upload/57e1f252cb871-21-09-2016-giay-tay-da-nam-dang-xo-7png.png', '2016-09-21 02:38:55', '2016-09-22 08:56:03', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f252cb871-21-09-2016-giay-tay-da-nam-dang-xo-7png.png'),
(69, 35, '/assets/upload/57e1f29ca8d29-21-09-2016-88511-f4q-139-20150804-6946537094249-2-chonjpg.jpg', '2016-09-21 02:39:12', '2016-09-22 08:56:03', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f29ca8d29-21-09-2016-88511-f4q-139-20150804-6946537094249-2-chonjpg.jpg'),
(70, 35, '/assets/upload/57e1f29c9f2cc-21-09-2016-90508-f4q-139-20150804-6946537094072-3-chonjpg.jpg', '2016-09-21 02:39:12', '2016-09-22 08:56:03', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f29c9f2cc-21-09-2016-90508-f4q-139-20150804-6946537094072-3-chonjpg.jpg'),
(71, 36, '/assets/upload/57e1f2a5eef9e-21-09-2016-618-bo-noi-inox-sunhouse-sh782-2jpg.jpg', '2016-09-21 02:39:17', '2016-09-22 08:56:04', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f2a5eef9e-21-09-2016-618-bo-noi-inox-sunhouse-sh782-2jpg.jpg'),
(72, 36, '/assets/upload/57e1f2a5e5ab6-21-09-2016-bo-noi-inox-3-day-sunhouse-sh768-vung-kinh-quai-dem-chi-20-chiec-duy-nhat-11476975584884324-360jpg.jpg', '2016-09-21 02:39:17', '2016-09-22 08:56:04', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f2a5e5ab6-21-09-2016-bo-noi-inox-3-day-sunhouse-sh768-vung-kinh-quai-dem-chi-20-chiec-duy-nhat-11476975584884324-360jpg.jpg'),
(73, 38, '/assets/upload/57e1f2f633f7d-21-09-2016-146588841079-6924772-1jpg.jpg', '2016-09-21 02:40:34', '2016-09-22 08:56:06', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f2f633f7d-21-09-2016-146588841079-6924772-1jpg.jpg'),
(74, 39, '/assets/upload/57e1f34d958f0-21-09-2016-1471940438382-5513380jpg.jpg', '2016-09-21 02:41:44', '2016-09-22 08:56:07', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f34d958f0-21-09-2016-1471940438382-5513380jpg.jpg'),
(75, 39, '/assets/upload/57e1f34da614c-21-09-2016-1471940438927-8444252jpg.jpg', '2016-09-21 02:41:44', '2016-09-22 08:56:07', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f34da614c-21-09-2016-1471940438927-8444252jpg.jpg'),
(76, 40, '/assets/upload/57e1f32ff3031-21-09-2016-noi-kho-ca-zpsf1bf1553jpg.jpg', '2016-09-21 02:41:50', '2016-09-22 08:56:07', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f32ff3031-21-09-2016-noi-kho-ca-zpsf1bf1553jpg.jpg'),
(77, 40, '/assets/upload/57e1f3300142c-21-09-2016-noi-kho-ca-fujika-fj-kc25-vung-kinh-2-5ljpg.jpg', '2016-09-21 02:41:50', '2016-09-22 08:56:07', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f3300142c-21-09-2016-noi-kho-ca-fujika-fj-kc25-vung-kinh-2-5ljpg.jpg'),
(78, 41, '/assets/upload/57e1f31790bc8-21-09-2016-may-tinh-xach-tay-acer-predator-nh-q0ssv-001-g9-592-win-107jpg.jpg', '2016-09-21 02:41:55', '2016-09-22 08:56:09', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f31790bc8-21-09-2016-may-tinh-xach-tay-acer-predator-nh-q0ssv-001-g9-592-win-107jpg.jpg'),
(79, 41, '/assets/upload/57e1f31c7bf24-21-09-2016-may-tinh-xach-tay-acer-predator-nh-q0ssv-001-g9-592-win-106jpg.jpg', '2016-09-21 02:41:55', '2016-09-22 08:56:09', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f31c7bf24-21-09-2016-may-tinh-xach-tay-acer-predator-nh-q0ssv-001-g9-592-win-106jpg.jpg'),
(80, 42, '/assets/upload/57e1f357a4fa4-21-09-2016-1jpg.jpg', '2016-09-21 02:42:27', '2016-09-22 08:56:10', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f357a4fa4-21-09-2016-1jpg.jpg'),
(81, 42, '/assets/upload/57e1f35c1e4a8-21-09-2016-11jpg.jpg', '2016-09-21 02:42:28', '2016-09-21 02:42:28', 'Mặc định', 'Nhóm', ''),
(82, 42, '/assets/upload/57e1f35c28660-21-09-2016-12jpg.jpg', '2016-09-21 02:42:28', '2016-09-21 02:42:28', 'Mặc định', 'Nhóm', ''),
(83, 43, '/assets/upload/57e1f3459ac3f-21-09-2016-damnu12jpg.jpg', '2016-09-21 02:42:43', '2016-09-22 08:56:11', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f3459ac3f-21-09-2016-damnu12jpg.jpg'),
(84, 43, '/assets/upload/57e1f3459c05a-21-09-2016-damnu13jpg.jpg', '2016-09-21 02:42:43', '2016-09-22 08:56:11', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f3459c05a-21-09-2016-damnu13jpg.jpg'),
(85, 44, '/assets/upload/57e1f38737d08-21-09-2016-1447986469299-3929007jpg.jpg', '2016-09-21 02:42:51', '2016-09-21 07:45:47', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f38737d08-21-09-2016-1447986469299-3929007jpg.jpg'),
(86, 44, '/assets/upload/57e1f38737f9f-21-09-2016-1447986484937-5460189jpg.jpg', '2016-09-21 02:42:51', '2016-09-21 07:45:47', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f38737f9f-21-09-2016-1447986484937-5460189jpg.jpg'),
(87, 45, '/assets/upload/57e1f37c1fb88-21-09-2016-k77-1ajpg.jpg', '2016-09-21 02:43:13', '2016-09-22 08:56:13', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f37c1fb88-21-09-2016-k77-1ajpg.jpg'),
(88, 45, '/assets/upload/57e1f37c24ccc-21-09-2016-k77-2ajpg.jpg', '2016-09-21 02:43:13', '2016-09-22 08:56:13', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f37c24ccc-21-09-2016-k77-2ajpg.jpg'),
(89, 45, '/assets/upload/57e1f37c3a731-21-09-2016-k77-3ajpg.jpg', '2016-09-21 02:43:13', '2016-09-22 08:56:14', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f37c3a731-21-09-2016-k77-3ajpg.jpg'),
(90, 47, '/assets/upload/57e1f3cbc125e-21-09-2016-kinh-nhin-xuyen-dem-night-view-glassespng.png', '2016-09-21 02:44:57', '2016-09-22 08:56:14', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f3cbc125e-21-09-2016-kinh-nhin-xuyen-dem-night-view-glassespng.png'),
(91, 47, '/assets/upload/57e1f3cbc44d4-21-09-2016-kinh-nhin-xuyen-dem-night-view-glasses-1png.png', '2016-09-21 02:44:57', '2016-09-22 08:56:14', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f3cbc44d4-21-09-2016-kinh-nhin-xuyen-dem-night-view-glasses-1png.png'),
(92, 47, '/assets/upload/57e1f3cc16701-21-09-2016-kinh-nhin-xuyen-dem-night-view-glasses-5jpg.jpg', '2016-09-21 02:44:57', '2016-09-22 08:56:14', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f3cc16701-21-09-2016-kinh-nhin-xuyen-dem-night-view-glasses-5jpg.jpg'),
(93, 48, '/assets/upload/57e1f3fdce954-21-09-2016-zxk1415935586jpg.jpg', '2016-09-21 02:45:37', '2016-09-22 08:56:14', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f3fdce954-21-09-2016-zxk1415935586jpg.jpg'),
(94, 48, '/assets/upload/57e1f3fdc9e8b-21-09-2016-nanny-hvc-hf003-2jpg.jpg', '2016-09-21 02:45:37', '2016-09-22 08:56:15', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f3fdc9e8b-21-09-2016-nanny-hvc-hf003-2jpg.jpg'),
(95, 49, '/assets/upload/57e1f432f24f8-21-09-2016-damnu22jpg.jpg', '2016-09-21 02:46:18', '2016-09-22 08:56:17', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f432f24f8-21-09-2016-damnu22jpg.jpg'),
(96, 49, '/assets/upload/57e1f432f17f0-21-09-2016-damnu23jpg.jpg', '2016-09-21 02:46:18', '2016-09-22 08:56:17', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f432f17f0-21-09-2016-damnu23jpg.jpg'),
(97, 50, '/assets/upload/57e1f46ae26ab-21-09-2016-3jpg.jpg', '2016-09-21 02:47:01', '2016-09-22 08:56:17', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f46ae26ab-21-09-2016-3jpg.jpg'),
(98, 50, '/assets/upload/57e1f46e175ff-21-09-2016-31jpg.jpg', '2016-09-21 02:47:01', '2016-09-21 02:47:01', 'Mặc định', 'Nhóm', ''),
(99, 50, '/assets/upload/57e1f46e28d33-21-09-2016-32jpg.jpg', '2016-09-21 02:47:01', '2016-09-21 02:47:01', 'Mặc định', 'Nhóm', ''),
(100, 51, '/assets/upload/57e1f4a31aee1-21-09-2016-anh-4042jpg.jpg', '2016-09-21 02:47:53', '2016-09-22 08:56:18', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f4a31aee1-21-09-2016-anh-4042jpg.jpg'),
(101, 52, '/assets/upload/57e1f47fb96ab-21-09-2016-1467252084dsc04207jpg.jpg', '2016-09-21 02:48:01', '2016-09-22 08:56:18', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f47fb96ab-21-09-2016-1467252084dsc04207jpg.jpg'),
(102, 52, '/assets/upload/57e1f47fb7ac1-21-09-2016-1467257301dsc042061jpg.jpg', '2016-09-21 02:48:01', '2016-09-22 08:56:18', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f47fb7ac1-21-09-2016-1467257301dsc042061jpg.jpg'),
(103, 52, '/assets/upload/57e1f47fed72f-21-09-2016-14593299975112jpg.jpg', '2016-09-21 02:48:01', '2016-09-22 08:56:19', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f47fed72f-21-09-2016-14593299975112jpg.jpg'),
(104, 53, '/assets/upload/57e1f4ceaebe9-21-09-2016-bat-phu-o-to-2-lop-oto-7-cho-sieu-nhe-su7-9781-7253362-13250ca92a926ecf04c59ccf791138f3-zoomjpg.jpg', '2016-09-21 02:48:19', '2016-09-22 08:56:21', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f4ceaebe9-21-09-2016-bat-phu-o-to-2-lop-oto-7-cho-sieu-nhe-su7-9781-7253362-13250ca92a926ecf04c59ccf791138f3-zoomjpg.jpg'),
(105, 53, '/assets/upload/57e1f4d1449d7-21-09-2016-bat-phu-o-to-2-lop-oto-7-cho-sieu-nhe-su7-9781-7253362-e20ec5fb2f70789bab004b1c70663841-zoomjpg.jpg', '2016-09-21 02:48:20', '2016-09-22 08:56:21', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f4d1449d7-21-09-2016-bat-phu-o-to-2-lop-oto-7-cho-sieu-nhe-su7-9781-7253362-e20ec5fb2f70789bab004b1c70663841-zoomjpg.jpg'),
(106, 53, '/assets/upload/57e1f4d52bdca-21-09-2016-bat-phu-o-to-2-lop-oto-7-cho-sieu-nhe-su7-9781-7253362-f31332f29891353ddd678f0a77636315-zoomjpg.jpg', '2016-09-21 02:48:20', '2016-09-22 08:56:22', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f4d52bdca-21-09-2016-bat-phu-o-to-2-lop-oto-7-cho-sieu-nhe-su7-9781-7253362-f31332f29891353ddd678f0a77636315-zoomjpg.jpg'),
(107, 54, '/assets/upload/57e1f4bc24bde-21-09-2016-aothun12jpg.jpg', '2016-09-21 02:48:42', '2016-09-22 08:56:22', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f4bc24bde-21-09-2016-aothun12jpg.jpg'),
(108, 54, '/assets/upload/57e1f4bdf2926-21-09-2016-aothun13jpg.jpg', '2016-09-21 02:48:42', '2016-09-22 08:56:22', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f4bdf2926-21-09-2016-aothun13jpg.jpg'),
(109, 55, '/assets/upload/57e1f4f5e3242-21-09-2016-4jpg.jpg', '2016-09-21 02:49:22', '2016-09-22 08:56:22', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f4f5e3242-21-09-2016-4jpg.jpg'),
(110, 55, '/assets/upload/57e1f4f8e8dfc-21-09-2016-41jpg.jpg', '2016-09-21 02:49:22', '2016-09-21 02:49:22', 'Mặc định', 'Nhóm', ''),
(111, 55, '/assets/upload/57e1f4f913d50-21-09-2016-42jpg.jpg', '2016-09-21 02:49:22', '2016-09-21 02:49:22', 'Mặc định', 'Nhóm', ''),
(112, 56, '/assets/upload/57e1f4fa1ec3a-21-09-2016-14593299971276jpg.jpg', '2016-09-21 02:50:08', '2016-09-22 08:56:23', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f4fa1ec3a-21-09-2016-14593299971276jpg.jpg'),
(113, 56, '/assets/upload/57e1f4fa21d32-21-09-2016-14593299973527jpg.jpg', '2016-09-21 02:50:08', '2016-09-22 08:56:24', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f4fa21d32-21-09-2016-14593299973527jpg.jpg'),
(114, 56, '/assets/upload/57e1f4fa77e42-21-09-2016-14593299975227jpg.jpg', '2016-09-21 02:50:09', '2016-09-22 08:56:25', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f4fa77e42-21-09-2016-14593299975227jpg.jpg'),
(115, 57, '/assets/upload/57e1f5169aac4-21-09-2016-bo-va-muong-lam-bep-6-mon-tashuan-ts-3455-den-1479-113872-1-productjpg.jpg', '2016-09-21 02:50:15', '2016-09-22 08:56:27', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f5169aac4-21-09-2016-bo-va-muong-lam-bep-6-mon-tashuan-ts-3455-den-1479-113872-1-productjpg.jpg'),
(116, 58, '/assets/upload/57e1f54baf29a-21-09-2016-aothun22jpg.jpg', '2016-09-21 02:50:50', '2016-09-22 08:56:27', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f54baf29a-21-09-2016-aothun22jpg.jpg'),
(117, 58, '/assets/upload/57e1f54dd24f3-21-09-2016-aothun23jpg.jpg', '2016-09-21 02:50:50', '2016-09-22 08:56:27', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f54dd24f3-21-09-2016-aothun23jpg.jpg'),
(118, 59, '/assets/upload/57e1f58f874e2-21-09-2016-12jpg.jpg', '2016-09-21 02:52:06', '2016-09-22 08:56:27', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f58f874e2-21-09-2016-12jpg.jpg'),
(119, 59, '/assets/upload/57e1f58f8811c-21-09-2016-13jpg.jpg', '2016-09-21 02:52:06', '2016-09-22 08:56:27', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f58f8811c-21-09-2016-13jpg.jpg'),
(120, 60, '/assets/upload/57e1f5a6a5aa9-21-09-2016-5jpg.jpg', '2016-09-21 02:52:32', '2016-09-22 08:56:28', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f5a6a5aa9-21-09-2016-5jpg.jpg'),
(121, 60, '/assets/upload/57e1f5a992ad4-21-09-2016-51jpg.jpg', '2016-09-21 02:52:32', '2016-09-21 02:52:32', 'Mặc định', 'Nhóm', ''),
(122, 61, '/assets/upload/57e1f5e05d4bc-21-09-2016-1465881523951-9070jpg.jpg', '2016-09-21 02:53:28', '2016-09-22 08:56:30', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f5e05d4bc-21-09-2016-1465881523951-9070jpg.jpg'),
(123, 61, '/assets/upload/57e1f5e09aa3d-21-09-2016-1465961726003-9173png.png', '2016-09-21 02:53:28', '2016-09-22 08:56:30', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f5e09aa3d-21-09-2016-1465961726003-9173png.png'),
(124, 61, '/assets/upload/57e1f5e0b0047-21-09-2016-1465961751434-9174png.png', '2016-09-21 02:53:29', '2016-09-22 08:56:32', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f5e0b0047-21-09-2016-1465961751434-9174png.png'),
(125, 62, '/assets/upload/57e1f60b56d06-21-09-2016-chanvay12jpg.jpg', '2016-09-21 02:54:23', '2016-09-21 02:54:23', 'Mặc định', 'Nhóm', ''),
(126, 62, '/assets/upload/57e1f60b54724-21-09-2016-chanvay13jpg.jpg', '2016-09-21 02:54:23', '2016-09-21 02:54:23', 'Mặc định', 'Nhóm', ''),
(127, 63, '/assets/upload/57e1f651d7002-21-09-2016-6jpg.jpg', '2016-09-21 02:55:02', '2016-09-22 08:56:32', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f651d7002-21-09-2016-6jpg.jpg'),
(128, 64, '/assets/upload/57e1f6574fff4-21-09-2016-may-anh-canon-eos-m-w-18-55-22-90ex-bk-den-1jpg.jpg', '2016-09-21 02:55:17', '2016-09-22 08:56:32', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f6574fff4-21-09-2016-may-anh-canon-eos-m-w-18-55-22-90ex-bk-den-1jpg.jpg'),
(129, 65, '/assets/upload/57e1f68382e82-21-09-2016-bo-06-mieng-che-nang-cho-o-to-2799-7094762-35365805d94d77e16e670e33b1db4b5a-zoomjpg.jpg', '2016-09-21 02:55:29', '2016-09-22 08:56:35', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f68382e82-21-09-2016-bo-06-mieng-che-nang-cho-o-to-2799-7094762-35365805d94d77e16e670e33b1db4b5a-zoomjpg.jpg'),
(130, 37, '/assets/upload/57e1f6bb34a9b-21-09-2016-binh-xit-phu-nano-chong-nuoc-da-nang-eykosi-250ml-2351-0691112-3eb3dabb50e6980ffcdba2e3e5400364-zoomjpg.jpg', '2016-09-21 02:56:04', '2016-09-22 08:56:06', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f6bb34a9b-21-09-2016-binh-xit-phu-nano-chong-nuoc-da-nang-eykosi-250ml-2351-0691112-3eb3dabb50e6980ffcdba2e3e5400364-zoomjpg.jpg'),
(131, 66, '/assets/upload/57e1f6ad1991d-21-09-2016-may-anh-canon-eos-70d-kit-18-55-stm3jpg.jpg', '2016-09-21 02:56:17', '2016-09-22 08:56:35', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f6ad1991d-21-09-2016-may-anh-canon-eos-70d-kit-18-55-stm3jpg.jpg'),
(132, 67, '/assets/upload/57e1f6da6ff8b-21-09-2016-7jpg.jpg', '2016-09-21 02:57:08', '2016-09-22 08:56:35', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f6da6ff8b-21-09-2016-7jpg.jpg'),
(133, 68, '/assets/upload/57e1f6e4e8080-21-09-2016-chanvay22jpg.jpg', '2016-09-21 02:57:34', '2016-09-21 02:57:34', 'Mặc định', 'Nhóm', ''),
(134, 68, '/assets/upload/57e1f6f020d40-21-09-2016-chanvay23jpg.jpg', '2016-09-21 02:57:34', '2016-09-21 02:57:34', 'Mặc định', 'Nhóm', ''),
(135, 69, '/assets/upload/57e1f6fa01c9d-21-09-2016-dien-thoai-apple-iphone-7-plus-gold-256gb-mn4y2-vn1jpg.jpg', '2016-09-21 02:57:42', '2016-09-22 08:56:38', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f6fa01c9d-21-09-2016-dien-thoai-apple-iphone-7-plus-gold-256gb-mn4y2-vn1jpg.jpg'),
(136, 70, '/assets/upload/57e1f735bc4ef-21-09-2016-dien-thoai-apple-iphone-6s-plus-rose-gold-64gb-a16878jpg.jpg', '2016-09-21 02:58:32', '2016-09-22 08:56:38', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f735bc4ef-21-09-2016-dien-thoai-apple-iphone-6s-plus-rose-gold-64gb-a16878jpg.jpg'),
(137, 71, '/assets/upload/57e1f753ec2c4-21-09-2016-8jpg.jpg', '2016-09-21 02:59:12', '2016-09-22 08:56:38', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f753ec2c4-21-09-2016-8jpg.jpg'),
(138, 72, '/assets/upload/57e1f77f459f8-21-09-2016-khoa-thang-dia-z-con-8167-4199971-2c3c3afc4515ae2607dbddc1e53c497b-zoomjpg.jpg', '2016-09-21 02:59:32', '2016-09-22 08:56:38', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f77f459f8-21-09-2016-khoa-thang-dia-z-con-8167-4199971-2c3c3afc4515ae2607dbddc1e53c497b-zoomjpg.jpg'),
(139, 72, '/assets/upload/57e1f78152ce4-21-09-2016-khoa-thang-dia-z-con-8167-4199971-41b6305f45fe3905dca7e5efd4a9c253-zoomjpg.jpg', '2016-09-21 02:59:32', '2016-09-22 08:56:38', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f78152ce4-21-09-2016-khoa-thang-dia-z-con-8167-4199971-41b6305f45fe3905dca7e5efd4a9c253-zoomjpg.jpg'),
(140, 72, '/assets/upload/57e1f782f2ffa-21-09-2016-khoa-thang-dia-z-con-9865-4199971-cf80bbc0b8a1aead080d716992bc4395-zoomjpg.jpg', '2016-09-21 02:59:32', '2016-09-22 08:56:38', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f782f2ffa-21-09-2016-khoa-thang-dia-z-con-9865-4199971-cf80bbc0b8a1aead080d716992bc4395-zoomjpg.jpg'),
(141, 73, '/assets/upload/57e1f7d4b9252-21-09-2016-9jpg.jpg', '2016-09-21 03:01:27', '2016-09-22 08:56:41', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f7d4b9252-21-09-2016-9jpg.jpg'),
(142, 73, '/assets/upload/57e1f7d8a0ae8-21-09-2016-91jpg.jpg', '2016-09-21 03:01:27', '2016-09-21 03:01:27', 'Mặc định', 'Nhóm', ''),
(143, 73, '/assets/upload/57e1f7d8a2d43-21-09-2016-92jpg.jpg', '2016-09-21 03:01:27', '2016-09-21 03:01:27', 'Mặc định', 'Nhóm', ''),
(144, 74, '/assets/upload/57e1f7fccd4fc-21-09-2016-bugi-bosch-wr8dp-tip-lon-bac-trang-andnbsp-9161-2515852-59f0f917ba50875346f1e3df3ab0ce3e-zoomjpg.jpg', '2016-09-21 03:01:35', '2016-09-22 08:56:41', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f7fccd4fc-21-09-2016-bugi-bosch-wr8dp-tip-lon-bac-trang-andnbsp-9161-2515852-59f0f917ba50875346f1e3df3ab0ce3e-zoomjpg.jpg'),
(145, 75, '/assets/upload/57e1f7f0446b7-21-09-2016-socnu12jpg.jpg', '2016-09-21 03:02:22', '2016-09-22 08:56:41', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f7f0446b7-21-09-2016-socnu12jpg.jpg'),
(146, 75, '/assets/upload/57e1f7f2f29bd-21-09-2016-socnu13jpg.jpg', '2016-09-21 03:02:23', '2016-09-22 08:56:41', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f7f2f29bd-21-09-2016-socnu13jpg.jpg'),
(147, 76, '/assets/upload/57e1f85bc4809-21-09-2016-10jpg.jpg', '2016-09-21 03:03:33', '2016-09-22 08:56:42', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f85bc4809-21-09-2016-10jpg.jpg'),
(148, 76, '/assets/upload/57e1f860176f6-21-09-2016-101jpg.jpg', '2016-09-21 03:03:33', '2016-09-21 03:03:33', 'Mặc định', 'Nhóm', ''),
(149, 76, '/assets/upload/57e1f86096932-21-09-2016-102jpg.jpg', '2016-09-21 03:03:33', '2016-09-21 03:03:33', 'Mặc định', 'Nhóm', ''),
(150, 77, '/assets/upload/57e1f8cb14256-21-09-2016-bo-2-bong-led-chop-nhieu-mau-cho-xe-may-oem-3127-1923271-3d744bc2fc98e5ba7fa588a5940c133b-zoomjpg.jpg', '2016-09-21 03:04:55', '2016-09-22 08:56:44', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f8cb14256-21-09-2016-bo-2-bong-led-chop-nhieu-mau-cho-xe-may-oem-3127-1923271-3d744bc2fc98e5ba7fa588a5940c133b-zoomjpg.jpg'),
(151, 77, '/assets/upload/57e1f8ce18690-21-09-2016-bo-2-bong-led-chop-nhieu-mau-cho-xe-may-oem-3127-1923271-0886e33a18805ee47d3920d1ce4ab4f3-zoomjpg.jpg', '2016-09-21 03:04:55', '2016-09-22 08:56:44', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f8ce18690-21-09-2016-bo-2-bong-led-chop-nhieu-mau-cho-xe-may-oem-3127-1923271-0886e33a18805ee47d3920d1ce4ab4f3-zoomjpg.jpg'),
(152, 78, '/assets/upload/57e1f8f31180f-21-09-2016-soocnu34jpg.jpg', '2016-09-21 03:05:52', '2016-09-22 08:56:44', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f8f31180f-21-09-2016-soocnu34jpg.jpg'),
(153, 79, '/assets/upload/57e1f951e6d0a-21-09-2016-den-led-chay-chu-gan-van-xe-xanh-1850-8237272-46094c00185c7b776cbe66cbc72d233b-zoomjpg.jpg', '2016-09-21 03:07:21', '2016-09-22 08:56:45', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f951e6d0a-21-09-2016-den-led-chay-chu-gan-van-xe-xanh-1850-8237272-46094c00185c7b776cbe66cbc72d233b-zoomjpg.jpg'),
(154, 79, '/assets/upload/57e1f955d1b64-21-09-2016-den-led-chay-chu-gan-van-xe-xanh-1850-8237272-af3417b9d83e1eea1abc630a02a064d3-zoomjpg.jpg', '2016-09-21 03:07:21', '2016-09-22 08:56:45', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f955d1b64-21-09-2016-den-led-chay-chu-gan-van-xe-xanh-1850-8237272-af3417b9d83e1eea1abc630a02a064d3-zoomjpg.jpg'),
(155, 79, '/assets/upload/57e1f9573d505-21-09-2016-den-led-chay-chu-gan-van-xe-xanh-1850-8237272-d71b97a1fe3ca7e46406f8d06dd6651c-zoomjpg.jpg', '2016-09-21 03:07:21', '2016-09-22 08:56:45', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f9573d505-21-09-2016-den-led-chay-chu-gan-van-xe-xanh-1850-8237272-d71b97a1fe3ca7e46406f8d06dd6651c-zoomjpg.jpg'),
(156, 80, '/assets/upload/57e1f9ff20979-21-09-2016-xe-tay-ga-honda-air-blade-2016-phien-ban-the-thao-do-den-4467-9979681-1-zoomjpgpng.png', '2016-09-21 03:11:16', '2016-09-21 03:11:16', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1f9ff20979-21-09-2016-xe-tay-ga-honda-air-blade-2016-phien-ban-the-thao-do-den-4467-9979681-1-zoomjpgpng.png'),
(157, 80, '/assets/upload/57e1fa00695eb-21-09-2016-xe-tay-ga-honda-air-blade-2016-phien-ban-the-thao-trang-den-1965-4216681-1-zoomjpgpng.png', '2016-09-21 03:11:16', '2016-09-21 03:11:16', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1fa00695eb-21-09-2016-xe-tay-ga-honda-air-blade-2016-phien-ban-the-thao-trang-den-1965-4216681-1-zoomjpgpng.png'),
(158, 81, '/assets/upload/57e1fad3831e9-21-09-2016-xe-may-yamaha-acruzo-deluxe-125i-xanh-6094-2099871-1-zoomjpg.jpg', '2016-09-21 03:21:22', '2016-09-21 03:21:22', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1fad3831e9-21-09-2016-xe-may-yamaha-acruzo-deluxe-125i-xanh-6094-2099871-1-zoomjpg.jpg'),
(159, 81, '/assets/upload/57e1fad47ee7b-21-09-2016-xe-tay-ga-yamaha-acruzo-deluxe-den-5108-6233531-1-zoomjpg.jpg', '2016-09-21 03:21:22', '2016-09-21 03:21:22', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e1fad47ee7b-21-09-2016-xe-tay-ga-yamaha-acruzo-deluxe-den-5108-6233531-1-zoomjpg.jpg'),
(160, 89, '/assets/upload/57e88d4f803bd-26-09-2016-anh-bossjpg.jpg', '2016-09-26 02:52:03', '2016-09-26 02:52:03', 'Mặc định', 'Nhóm', '/assets/upload_thumb/450_450_57e88d4f803bd-26-09-2016-anh-bossjpg.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `product_ratings`
--

CREATE TABLE IF NOT EXISTS `product_ratings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `number` tinyint(1) NOT NULL,
  `comment` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `create_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `product_ratings_id` int(11) NOT NULL,
  `img` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `customer_id` int(11) NOT NULL,
  `guest` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `product_ratings_product_id_foreign` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `slides`
--

CREATE TABLE IF NOT EXISTS `slides` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `img_1` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `img_2` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `img_3` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `text_1` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `text_2` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `text_3` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `text_4` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `des_1` text COLLATE utf8_unicode_ci NOT NULL,
  `des_2` text COLLATE utf8_unicode_ci NOT NULL,
  `link_1` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `link_2` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=11 ;

--
-- Dumping data for table `slides`
--

INSERT INTO `slides` (`id`, `img_1`, `img_2`, `img_3`, `text_1`, `text_2`, `text_3`, `text_4`, `des_1`, `des_2`, `link_1`, `link_2`, `type`, `status`, `created_at`, `updated_at`) VALUES
(1, '/assets/slide/57e352d38a0e5-22-09-2016.02.jpg', '', '', 'Thời trang hè', 'Women', 'Fashion', '', 'Gian hàng thời trang nữ hè 2016, các sản phẩm hot nhất hiện nay', '', 'http://cfr.com.vn/', '', 'Banner Trang chủ', 1, '2016-09-22 03:41:07', '2016-09-22 03:42:09'),
(2, '/assets/slide/57e3530dae92d-22-09-2016.02.jpg', '', '', 'Top sản phẩm', 'Xu hướng', '', '', 'Các sản phẩm bán chạy học theo xu hướng mới hiện nay', '', '', '', 'Banner Trang chủ', 1, '2016-09-22 03:42:05', '2016-09-22 03:42:08'),
(3, '/assets/slide/57e35fa540e2a-22-09-2016.anh-tuan.jpg', '', '', 'Nguyễn Minh Tuấn', 'Võ sĩ', '', '', 'Mình đã mua sản phẩm tại đây, cảm thấy rất hài lòng về chất lượng.', '', '', '', 'Khách hàng - Trang chủ', 1, '2016-09-22 04:35:49', '2016-09-22 04:48:25'),
(4, '/assets/slide/57e360004d2d7-22-09-2016.em-trang.jpg', '', '', 'Nguyễn Thu Trang ', 'Nhân viên văn phòng', '', '', 'Tìm kiếm sản phẩm nhanh, đa dạng về mặt hàng, phản hồi của chủ shop rất nhanh. Chất lượng tốt như quảng cáo', '', '', '', 'Khách hàng - Trang chủ', 1, '2016-09-22 04:37:20', '2016-09-22 04:37:41'),
(5, '/assets/slide/57e365d3f0a5f-22-09-2016.brand1.png', '', '', '', '', '', '', '', '', '', '', 'Logo Đối tác', 1, '2016-09-22 05:02:11', '2016-09-22 05:02:38'),
(6, '/assets/slide/57e365da0feaa-22-09-2016.brand2.png', '', '', '', '', '', '', '', '', '', '', 'Logo Đối tác', 1, '2016-09-22 05:02:13', '2016-09-22 05:02:37'),
(7, '/assets/slide/57e365ddc6097-22-09-2016.brand3.png', '', '', '', '', '', '', '', '', '', '', 'Logo Đối tác', 1, '2016-09-22 05:02:21', '2016-09-22 05:02:35'),
(8, '/assets/slide/57e365e1017ad-22-09-2016.brand4.png', '', '', '', '', '', '', '', '', '', '', 'Logo Đối tác', 1, '2016-09-22 05:02:25', '2016-09-22 05:02:36'),
(9, '/assets/slide/57e365e46cca5-22-09-2016.brand5.png', '', '', '', '', '', '', '', '', '', '', 'Logo Đối tác', 1, '2016-09-22 05:02:28', '2016-09-22 05:02:33'),
(10, '/assets/slide/57e365e7524af-22-09-2016.brand6.png', '', '', '', '', '', '', '', '', '', '', 'Logo Đối tác', 1, '2016-09-22 05:02:31', '2016-09-22 05:02:32');

-- --------------------------------------------------------

--
-- Table structure for table `slide_types`
--

CREATE TABLE IF NOT EXISTS `slide_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `img_1` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `img_2` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `img_3` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `text_1` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `text_2` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `text_3` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `text_4` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `des_1` text COLLATE utf8_unicode_ci NOT NULL,
  `des_2` text COLLATE utf8_unicode_ci NOT NULL,
  `link_1` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `link_2` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `slide_types`
--

INSERT INTO `slide_types` (`id`, `name`, `img_1`, `img_2`, `img_3`, `text_1`, `text_2`, `text_3`, `text_4`, `des_1`, `des_2`, `link_1`, `link_2`, `created_at`, `updated_at`) VALUES
(1, 'Banner Trang chủ', 'Ảnh banner', '', '', 'Tiêu đề nhỏ', 'Tiêu đề lớn (chữ đen)', 'Tiêu đề lớn (chữ vàng cam)', '', 'Mô tả ngắn', '', 'Đường dẫn (nếu cần)', '', NULL, '2016-09-22 03:37:37'),
(2, 'Khách hàng - Trang chủ', 'Ảnh khách hàng', '', '', 'Tên khách hàng', 'Nghề nghiệp', '', '', 'Nhận xét', '', '', '', NULL, NULL),
(3, 'Logo Đối tác', 'Ảnh logo', '', '', '', '', '', '', '', '', '', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `systems`
--

CREATE TABLE IF NOT EXISTS `systems` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `domain` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `full_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `img_logo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_send` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_form` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_order` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `systems`
--

INSERT INTO `systems` (`id`, `domain`, `full_name`, `email`, `phone`, `address`, `status`, `created_at`, `updated_at`, `img_logo`, `email_send`, `email_password`, `email_form`, `email_order`) VALUES
(1, '', '', '', '', '', 0, '2016-10-04 09:08:31', '2016-10-04 09:15:03', '', 'nguyentruongson93@gmail.com', '1234', 'nguyentruongson93@gmail.com', 'nguyentruongson93@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `tab_attributes`
--

CREATE TABLE IF NOT EXISTS `tab_attributes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content_products_id` int(10) unsigned NOT NULL,
  `attribute_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tab_attributes_content_products_id_foreign` (`content_products_id`),
  KEY `tab_attributes_attribute_id_foreign` (`attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tagPs`
--

CREATE TABLE IF NOT EXISTS `tagPs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `create_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=15 ;

--
-- Dumping data for table `tagPs`
--

INSERT INTO `tagPs` (`id`, `tag`, `create_by`, `created_at`, `updated_at`) VALUES
(1, 'túi nữ', 0, '2016-09-21 02:14:12', '2016-09-21 02:14:12'),
(2, 'túi đẹp', 0, '2016-09-21 02:14:12', '2016-09-21 02:14:12'),
(3, 'Máy tập thể hình', 0, '2016-09-21 02:24:32', '2016-09-21 02:24:32'),
(4, 'Xe đạp tại chỗ', 0, '2016-09-21 02:27:57', '2016-09-21 02:27:57'),
(5, 'tui', 0, '2016-09-21 02:30:19', '2016-09-21 02:30:19'),
(6, 'Phụ kiện', 0, '2016-09-21 02:31:44', '2016-09-21 02:31:44'),
(7, 'đầm', 0, '2016-09-21 02:42:43', '2016-09-21 02:42:43'),
(8, 'ao thun', 0, '2016-09-21 02:48:41', '2016-09-21 02:48:41'),
(9, 'crop', 0, '2016-09-21 02:50:50', '2016-09-21 02:50:50'),
(10, 'Máy tập thể lực', 0, '2016-09-21 02:52:32', '2016-09-21 02:52:32'),
(11, 'chanvay', 0, '2016-09-21 02:54:22', '2016-09-21 02:54:22'),
(12, 'Tạ', 0, '2016-09-21 02:57:08', '2016-09-21 02:57:08'),
(13, 'Yoga', 0, '2016-09-21 03:01:27', '2016-09-21 03:01:27'),
(14, 'sooc', 0, '2016-09-21 03:02:22', '2016-09-21 03:02:22');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE IF NOT EXISTS `tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `create_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tag_post`
--

CREATE TABLE IF NOT EXISTS `tag_post` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tag_products`
--

CREATE TABLE IF NOT EXISTS `tag_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `category_product_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=26 ;

--
-- Dumping data for table `tag_products`
--

INSERT INTO `tag_products` (`id`, `tag_id`, `product_id`, `category_product_id`, `created_at`, `updated_at`) VALUES
(1, 1, 8, 0, NULL, NULL),
(2, 2, 8, 0, NULL, NULL),
(3, 3, 9, 0, NULL, NULL),
(4, 4, 12, 0, NULL, NULL),
(5, 5, 16, 0, NULL, NULL),
(6, 6, 21, 0, NULL, NULL),
(7, 5, 25, 0, NULL, NULL),
(8, 6, 26, 0, NULL, NULL),
(9, 6, 33, 0, NULL, NULL),
(10, 6, 42, 0, NULL, NULL),
(11, 7, 43, 0, NULL, NULL),
(12, 7, 49, 0, NULL, NULL),
(13, 3, 50, 0, NULL, NULL),
(14, 8, 54, 0, NULL, NULL),
(15, 3, 55, 0, NULL, NULL),
(16, 9, 58, 0, NULL, NULL),
(17, 10, 60, 0, NULL, NULL),
(18, 11, 62, 0, NULL, NULL),
(19, 10, 63, 0, NULL, NULL),
(20, 12, 67, 0, NULL, NULL),
(21, 11, 68, 0, NULL, NULL),
(22, 12, 71, 0, NULL, NULL),
(23, 13, 73, 0, NULL, NULL),
(24, 14, 75, 0, NULL, NULL),
(25, 13, 76, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `thumbs_config`
--

CREATE TABLE IF NOT EXISTS `thumbs_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin_log_orders`
--
ALTER TABLE `admin_log_orders`
  ADD CONSTRAINT `admin_log_orders_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `admin_log_orders_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `content_products`
--
ALTER TABLE `content_products`
  ADD CONSTRAINT `content_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `filters`
--
ALTER TABLE `filters`
  ADD CONSTRAINT `filters_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_admin`
--
ALTER TABLE `permission_admin`
  ADD CONSTRAINT `permission_admin_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_admin_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `post_comments`
--
ALTER TABLE `post_comments`
  ADD CONSTRAINT `post_comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `post_images`
--
ALTER TABLE `post_images`
  ADD CONSTRAINT `post_images_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_attribute`
--
ALTER TABLE `product_attribute`
  ADD CONSTRAINT `product_attribute_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_attribute_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_ratings`
--
ALTER TABLE `product_ratings`
  ADD CONSTRAINT `product_ratings_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tab_attributes`
--
ALTER TABLE `tab_attributes`
  ADD CONSTRAINT `tab_attributes_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tab_attributes_content_products_id_foreign` FOREIGN KEY (`content_products_id`) REFERENCES `content_products` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
