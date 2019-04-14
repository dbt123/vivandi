-- phpMyAdmin SQL Dump
-- version 4.4.15.7
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 15, 2016 at 04:51 AM
-- Server version: 5.6.31
-- PHP Version: 5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nhatphat`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE IF NOT EXISTS `accounts` (
  `id` int(10) unsigned NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Guest',
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `point` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE IF NOT EXISTS `admins` (
  `id` int(10) unsigned NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `level` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `password`, `phone`, `address`, `level`, `status`, `created_at`, `updated_at`, `email`, `image`) VALUES
(1, 'dev', '21232f297a57a5a743894a0e4a801fc3', '34234234234', 'E5 Quỳnh Mai Hai Bà Trưng Hà Nội', 1, 1, '2016-09-19 08:08:33', '2016-09-19 08:08:33', '', ''),
(2, 'admin', '21232f297a57a5a743894a0e4a801fc3', '34234234234', 'E5 Quỳnh Mai Hai Bà Trưng Hà Nội', 1, 1, '2016-09-19 08:08:33', '2016-09-19 08:08:33', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `admin_log_orders`
--

CREATE TABLE IF NOT EXISTS `admin_log_orders` (
  `id` int(10) unsigned NOT NULL,
  `admin_id` int(10) unsigned NOT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `comment` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin_roles`
--

CREATE TABLE IF NOT EXISTS `admin_roles` (
  `id` int(10) unsigned NOT NULL,
  `admin_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE IF NOT EXISTS `attributes` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `type` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `prefix` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `avaiable` int(11) NOT NULL,
  `init` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `name`, `value`, `type`, `created_at`, `updated_at`, `prefix`, `status`, `avaiable`, `init`) VALUES
(1, 'efg', '', 1, '2016-09-24 02:21:05', '2016-09-27 04:23:06', 'efg', 1, 0, ''),
(2, 'ewgfe', '', 1, '2016-09-24 02:21:11', '2016-09-27 04:23:08', 'ewgfe', 1, 0, ''),
(3, 'test', '', 1, '2016-10-14 09:10:54', '2016-10-14 09:12:00', 'test', 1, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `prefix` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `level` smallint(6) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `status` smallint(6) NOT NULL,
  `editable` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category_products`
--

CREATE TABLE IF NOT EXISTS `category_products` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `prefix` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `level` smallint(6) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `status` smallint(6) NOT NULL,
  `editable` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `thumb_images` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comment_posts`
--

CREATE TABLE IF NOT EXISTS `comment_posts` (
  `id` int(10) unsigned NOT NULL,
  `is_guest` int(11) NOT NULL DEFAULT '1',
  `account_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `comment` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `rating` decimal(3,2) NOT NULL,
  `comment_admin` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comment_products`
--

CREATE TABLE IF NOT EXISTS `comment_products` (
  `id` int(10) unsigned NOT NULL,
  `is_guest` int(11) NOT NULL DEFAULT '1',
  `account_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `comment` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `rating` decimal(3,2) NOT NULL,
  `comment_admin` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE IF NOT EXISTS `contacts` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` tinyint(4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contents`
--

CREATE TABLE IF NOT EXISTS `contents` (
  `id` int(10) unsigned NOT NULL,
  `post_id` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `rank` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `content_products`
--

CREATE TABLE IF NOT EXISTS `content_products` (
  `id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `rank` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `content_products`
--

INSERT INTO `content_products` (`id`, `product_id`, `description`, `content`, `name`, `rank`, `created_at`, `updated_at`) VALUES
(1, 1, 'Tab 1', '', 'Tab 1', 1, '2016-09-28 09:21:39', '2016-09-28 09:21:39');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE IF NOT EXISTS `customers` (
  `id` int(10) unsigned NOT NULL,
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
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `filters`
--

CREATE TABLE IF NOT EXISTS `filters` (
  `id` int(10) unsigned NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `min` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `max` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `attribute_id` int(10) unsigned NOT NULL,
  `type` int(11) NOT NULL,
  `config_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `filter_prices`
--

CREATE TABLE IF NOT EXISTS `filter_prices` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `min` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `max` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `config_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `forms`
--

CREATE TABLE IF NOT EXISTS `forms` (
  `id` int(10) unsigned NOT NULL,
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
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `form_types`
--

CREATE TABLE IF NOT EXISTS `form_types` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `count` tinyint(4) NOT NULL,
  `note` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `group_layouts`
--

CREATE TABLE IF NOT EXISTS `group_layouts` (
  `id` int(10) unsigned NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `group_layouts`
--

INSERT INTO `group_layouts` (`id`, `key`, `name`, `created_at`, `updated_at`) VALUES
(2, 'Banner video footer', 'Banner video footer', '2016-10-14 07:24:10', '2016-10-14 07:24:10'),
(3, 'Right bar', 'Right bar', '2016-10-14 07:24:55', '2016-10-14 07:24:55'),
(4, 'Footer language', 'Footer language', '2016-10-14 07:26:17', '2016-10-14 07:26:17'),
(5, 'Pic head', 'Pic head', '2016-10-14 07:27:58', '2016-10-14 07:27:58');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE IF NOT EXISTS `items` (
  `id` int(10) unsigned NOT NULL,
  `key_layout` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `key_item` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `num` int(11) NOT NULL,
  `pin` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `key_layout`, `key_item`, `value`, `link`, `type`, `num`, `pin`, `created_at`, `updated_at`) VALUES
(3, 'Banner video footer', 'pic 1', '/assets/post/video-background.jpg', 'https://www.youtube.com/embed/xrUUDKxTYrA', 'img', 0, 1, '2016-10-14 07:24:26', '2016-10-14 07:34:41'),
(4, 'Right bar', 'Ảnh 1', '/assets/post/bruxzir-polishing-kit-480x400.jpg', 'https://www.youtube.com/watch?v=xrUUDKxTYrA', 'img', 0, 1, '2016-10-14 07:25:54', '2016-10-14 07:34:14'),
(5, 'Right bar', 'Ảnh 2', '/assets/post/bruxzir-ts150-480x400.jpg', 'https://www.youtube.com/watch?v=xrUUDKxTYrA', 'img', 0, 1, '2016-10-14 07:25:54', '2016-10-14 07:34:14'),
(6, 'Right bar', 'Ảnh 3', '/assets/post/clinical-scientific-doc-480x400.jpg', 'https://www.youtube.com/watch?v=xrUUDKxTYrA', 'img', 0, 1, '2016-10-14 07:25:54', '2016-10-14 07:34:14'),
(7, 'Footer language', 'text 1', 'English', 'http://nhatphatbh1.io/', 'des', 0, 1, '2016-10-14 07:27:36', '2016-10-14 07:31:46'),
(8, 'Footer language', 'text 2', 'Spain', 'http://nhatphatbh1.io/', 'des', 0, 1, '2016-10-14 07:27:36', '2016-10-14 07:31:46'),
(9, 'Footer language', 'text 3', 'Japan', 'http://nhatphatbh1.io/', 'des', 0, 1, '2016-10-14 07:27:36', '2016-10-14 07:31:46'),
(10, 'Footer language', 'text 4', 'Koria', 'http://nhatphatbh1.io/', 'des', 0, 1, '2016-10-14 07:27:36', '2016-10-14 07:31:46'),
(11, 'Footer language', 'text 5', 'Việt Nam', 'http://nhatphatbh1.io/', 'des', 0, 1, '2016-10-14 07:27:36', '2016-10-14 07:31:46'),
(12, 'Pic head', 'ảnh 1', '/assets/post/header-banner.jpg', '', 'img', 0, 1, '2016-10-14 07:28:33', '2016-10-14 07:32:39');

-- --------------------------------------------------------

--
-- Table structure for table `layouts`
--

CREATE TABLE IF NOT EXISTS `layouts` (
  `id` int(10) unsigned NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contribute_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `layouts`
--

INSERT INTO `layouts` (`id`, `key`, `name`, `type`, `contribute_id`, `created_at`, `updated_at`) VALUES
(2, 'Banner video footer', 'Banner video footer', 'Hỗn hợp', 2, '2016-10-14 07:24:26', '2016-10-14 07:24:26'),
(3, 'Right bar', 'Right bar', 'Hỗn hợp', 3, '2016-10-14 07:25:54', '2016-10-14 07:25:54'),
(4, 'Footer language', 'Footer language', 'Hỗn hợp', 4, '2016-10-14 07:27:36', '2016-10-14 07:27:36'),
(5, 'Pic head', 'Pic head', 'Hỗn hợp', 5, '2016-10-14 07:28:33', '2016-10-14 07:28:33');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE IF NOT EXISTS `menus` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `level` smallint(6) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `status` smallint(6) NOT NULL,
  `order` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
('2016_09_05_133458_create_table_account', 1),
('2016_09_05_133619_create_table_comment_post', 1),
('2016_09_05_133644_create_table_comment_product', 1),
('2016_09_07_090838_add_rating_to_products', 1),
('2016_09_08_100118_add_col_to_accounts', 1),
('2016_09_09_100328_add_rating_to_post', 1),
('2016_09_09_112832_create_thumbs_config', 1),
('2016_09_12_095503_add_col_to_products', 1),
('2016_09_12_095537_add_col_to_product_images', 1),
('2016_09_12_095623_add_col_to_category_products', 1),
('2016_09_12_095734_add_col_to_post', 1),
('2016_09_12_095754_add_col_to_post_image', 1),
('2016_09_12_095808_add_col_to_post_category', 1),
('2016_09_16_162021_create_np_embryos', 1),
('2016_09_16_162458_create_np_centers', 1),
('2016_09_16_162620_create_np_dentist', 1),
('2016_09_16_162738_create_np_patient', 1),
('2016_09_16_163117_create_np_card', 1),
('2016_09_16_163458_create_np_card_tooth', 1),
('2016_09_16_163630_create_np_tooth', 1),
('2016_09_16_164044_create_np_teeth_used', 1),
('2016_09_22_103229_add_dentist_id_to_np_dentist_table', 2),
('2016_09_22_103448_add_dentist_id_to_np_tooth_table', 3),
('2016_09_22_103635_add_np_center_id_to_np_Center_table', 4),
('2016_09_23_085422_add_col_to_np_cards', 5),
('2016_09_23_085609_add_col_to_np_patients', 5),
('2016_09_23_091906_add_col_to_np_card_tooths', 6),
('2016_09_27_101937_add_col_to_NP_Tooths_v2', 7),
('2016_09_27_144010_add_col_to_NP_Embryos_v2', 7),
('2016_09_30_150512_add_col_to_table_Tooth_v3', 8),
('2016_09_30_163115_add_col_to_table_Tooth_v4', 9),
('2016_09_30_163710_create_np_tooth_app', 10),
('2016_09_30_174521_add_col_to_table_Tooth_ap', 11),
('2016_10_03_094150_add_col_gender_to_patients', 12),
('2016_10_03_103146_add_col_dentist_id_to_card', 12),
('2016_10_03_144028_add_col_reason_to_Cards', 13),
('2016_10_14_124706_add_col_table_NP_Dentist_fix', 14);

-- --------------------------------------------------------

--
-- Table structure for table `NP_Cards`
--

CREATE TABLE IF NOT EXISTS `NP_Cards` (
  `id` int(10) unsigned NOT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `patient_id` int(11) NOT NULL,
  `range_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` int(11) NOT NULL,
  `dentist_id` int(11) NOT NULL,
  `reason` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `NP_Cards`
--

INSERT INTO `NP_Cards` (`id`, `alias`, `patient_id`, `range_date`, `created_at`, `updated_at`, `status`, `dentist_id`, `reason`) VALUES
(1, 'ABC', 1, '0000-00-00', '2016-10-04 07:37:16', '2016-10-04 08:23:31', 1, 1, ''),
(2, '', 2, '0000-00-00', '2016-10-04 08:35:36', '2016-10-04 08:35:59', 2, 1, 'dádadsdsa'),
(3, '111111111', 3, '0000-00-00', '2016-10-04 08:40:29', '2016-10-04 08:41:20', 1, 1, ''),
(4, '', 4, '0000-00-00', '2016-10-05 03:52:17', '2016-10-05 03:52:17', 0, 1, ''),
(5, '', 5, '0000-00-00', '2016-10-06 10:16:24', '2016-10-06 10:16:24', 0, 1, ''),
(6, '', 6, '0000-00-00', '2016-10-14 06:41:25', '2016-10-14 06:41:25', 0, 3, '');

-- --------------------------------------------------------

--
-- Table structure for table `NP_Card_Tooths`
--

CREATE TABLE IF NOT EXISTS `NP_Card_Tooths` (
  `id` int(10) unsigned NOT NULL,
  `card_id` int(11) NOT NULL,
  `teeth_used_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `NP_Card_Tooths`
--

INSERT INTO `NP_Card_Tooths` (`id`, `card_id`, `teeth_used_id`, `created_at`, `updated_at`, `status`) VALUES
(1, 1, 1, '2016-10-04 07:37:16', '2016-10-04 07:37:16', 0),
(2, 1, 2, '2016-10-04 07:37:16', '2016-10-04 07:37:16', 0),
(3, 1, 3, '2016-10-04 07:37:16', '2016-10-04 07:37:16', 0),
(4, 1, 4, '2016-10-04 07:37:16', '2016-10-04 07:37:16', 0),
(5, 1, 5, '2016-10-04 07:37:16', '2016-10-04 07:37:16', 0),
(6, 1, 6, '2016-10-04 07:40:29', '2016-10-04 07:40:29', 0),
(7, 1, 7, '2016-10-04 07:40:29', '2016-10-04 07:40:29', 0),
(8, 2, 8, '2016-10-04 08:35:36', '2016-10-04 08:35:36', 0),
(9, 2, 9, '2016-10-04 08:38:33', '2016-10-04 08:38:33', 0),
(10, 2, 10, '2016-10-04 08:38:33', '2016-10-04 08:38:33', 0),
(11, 1, 11, '2016-10-04 08:39:38', '2016-10-04 08:39:38', 0),
(12, 1, 12, '2016-10-04 08:39:38', '2016-10-04 08:39:38', 0),
(13, 3, 13, '2016-10-04 08:40:29', '2016-10-04 08:40:29', 0),
(14, 3, 14, '2016-10-04 08:40:29', '2016-10-04 08:40:29', 0),
(15, 3, 15, '2016-10-04 08:40:29', '2016-10-04 08:40:29', 0),
(16, 1, 16, '2016-10-05 03:39:30', '2016-10-05 03:39:30', 0),
(17, 4, 17, '2016-10-05 03:52:17', '2016-10-05 03:52:17', 0),
(18, 4, 18, '2016-10-05 03:53:12', '2016-10-05 03:53:12', 0),
(19, 5, 19, '2016-10-06 10:16:24', '2016-10-06 10:16:24', 0),
(20, 5, 20, '2016-10-06 10:16:24', '2016-10-06 10:16:24', 0),
(21, 5, 21, '2016-10-06 10:16:24', '2016-10-06 10:16:24', 0),
(22, 2, 22, '2016-10-14 06:28:00', '2016-10-14 06:28:00', 0),
(23, 2, 23, '2016-10-14 06:28:00', '2016-10-14 06:28:00', 0),
(24, 2, 24, '2016-10-14 06:28:00', '2016-10-14 06:28:00', 0),
(25, 6, 25, '2016-10-14 06:41:25', '2016-10-14 06:41:25', 0),
(26, 6, 26, '2016-10-14 06:41:25', '2016-10-14 06:41:25', 0),
(27, 6, 27, '2016-10-14 06:41:25', '2016-10-14 06:41:25', 0);

-- --------------------------------------------------------

--
-- Table structure for table `NP_Centers`
--

CREATE TABLE IF NOT EXISTS `NP_Centers` (
  `id` int(10) unsigned NOT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `kind` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `np_id` int(11) NOT NULL,
  `center_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `NP_Centers`
--

INSERT INTO `NP_Centers` (`id`, `alias`, `username`, `password`, `name`, `email`, `address`, `phone`, `status`, `kind`, `created_at`, `updated_at`, `np_id`, `center_id`) VALUES
(1, 'cat-tien-1', 'cattien1', 'fcea920f7412b5da7be0cf42b8c93759', 'Cắt tiện 1', 'c@gmail.com', 'Hà Nội', '654646', 1, 0, '2016-09-28 03:07:19', '2016-09-28 03:07:19', 1, 0),
(2, 'hct1', 'lab1', 'fcea920f7412b5da7be0cf42b8c93759', 'HCT1', 'lab@gmail.com', 'Đà Nẵng', '57473', 1, 1, '2016-09-28 03:49:05', '2016-10-04 01:45:22', 1, 0),
(3, 'lab-567', 'lab2', 'fcea920f7412b5da7be0cf42b8c93759', 'Lab 567', 'lab2@gmail.com', 'nha 2 so 3', '5346546546', 1, 1, '2016-09-28 07:31:32', '2016-10-05 02:59:23', 0, 1),
(4, 'trung-tam-ncp14', 'ttphong', '202cb962ac59075b964b07152d234b70', 'Trung tâm NCP14', '', '', '', 1, 0, '2016-10-14 04:57:12', '2016-10-14 05:03:28', 2, 0),
(5, 'phongs-lab', 'labphong', '202cb962ac59075b964b07152d234b70', 'Phong''s Lab', '', '', '', 1, 1, '2016-10-14 05:24:15', '2016-10-14 05:31:19', 0, 4);

-- --------------------------------------------------------

--
-- Table structure for table `NP_Dentists`
--

CREATE TABLE IF NOT EXISTS `NP_Dentists` (
  `id` int(10) unsigned NOT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `clinic` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_center` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `NP_Dentists`
--

INSERT INTO `NP_Dentists` (`id`, `alias`, `username`, `password`, `name`, `address`, `email`, `phone`, `clinic`, `id_center`, `created_at`, `updated_at`, `status`) VALUES
(1, 'tan', 'bacsi1', 'fcea920f7412b5da7be0cf42b8c93759', 'Tấn', 'nhà 2 số 3', 'caophonggtvt@gmail.com', '576567567567', 'Phong''s Clinic', 1, '2016-09-28 03:36:56', '2016-09-28 03:36:56', '1'),
(2, 'tan-le', 'bacsitan', 'fcea920f7412b5da7be0cf42b8c93759', 'tan le', 'nhà 2 số 3', 'tan@gmail.com', 'g6565654656', 'Phong''s Clinic', 1, '2016-09-29 03:16:31', '2016-10-03 02:45:44', '1'),
(3, 'nguyen-van-phong', 'denphong', '202cb962ac59075b964b07152d234b70', 'Nguyễn Văn Phong', '', '', '', 'Phong''s Clinic', 4, '2016-10-14 05:52:35', '2016-10-14 06:03:40', '1');

-- --------------------------------------------------------

--
-- Table structure for table `NP_Embryos`
--

CREATE TABLE IF NOT EXISTS `NP_Embryos` (
  `id` int(10) unsigned NOT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `customer_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `buy_date` date NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `xuatxu` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `loai` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `NP_Embryos`
--

INSERT INTO `NP_Embryos` (`id`, `alias`, `customer_id`, `name`, `buy_date`, `status`, `created_at`, `updated_at`, `xuatxu`, `loai`) VALUES
(1, 'PN12345', 1, 'Phôi nhựa', '0000-00-00', 0, '2016-10-04 07:03:16', '2016-10-04 07:03:37', '', ''),
(2, 'PN607', 1, '', '0000-00-00', 0, '2016-10-05 02:41:13', '2016-10-05 02:41:22', '', ''),
(3, 'PN77778', 1, '', '0000-00-00', 0, '2016-10-05 07:53:58', '2016-10-07 04:44:46', '', ''),
(4, 'NCP14', 4, 'Phôi nhựa NCP', '0000-00-00', 1, '2016-10-14 05:04:44', '2016-10-14 05:10:44', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `NP_Patients`
--

CREATE TABLE IF NOT EXISTS `NP_Patients` (
  `id` int(10) unsigned NOT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `age` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `dentist_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `gender` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `NP_Patients`
--

INSERT INTO `NP_Patients` (`id`, `alias`, `name`, `address`, `email`, `phone`, `age`, `created_at`, `updated_at`, `dentist_id`, `status`, `gender`) VALUES
(1, 'phong14', 'Phong14', 'Ha Noi', 'c@gmail.cim', '756765756', 56, '2016-10-04 07:37:16', '2016-10-04 07:37:16', 1, 0, 1),
(2, 'duy', 'duy', '', '', '234', 0, '2016-10-04 08:35:36', '2016-10-04 08:35:36', 1, 0, 1),
(3, 'tuan', 'tuấn', '', '', '156', 10, '2016-10-04 08:40:29', '2016-10-07 03:03:46', 1, 0, 2),
(4, 'john', 'john', '', '', '667', 0, '2016-10-05 03:52:17', '2016-10-05 03:52:17', 1, 0, 1),
(5, 'linh', 'linh', '', '', '', 0, '2016-10-06 10:16:24', '2016-10-06 10:16:24', 1, 0, 2),
(6, 'nguyen-le-phong', 'Nguyễn Lê Phong', '', '', '6678', 0, '2016-10-14 06:41:25', '2016-10-14 09:06:25', 3, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `NP_Teeth_useds`
--

CREATE TABLE IF NOT EXISTS `NP_Teeth_useds` (
  `id` int(10) unsigned NOT NULL,
  `patient_id` int(11) NOT NULL,
  `dentist_id` int(11) NOT NULL,
  `teeth_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `NP_Teeth_useds`
--

INSERT INTO `NP_Teeth_useds` (`id`, `patient_id`, `dentist_id`, `teeth_id`, `date`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 5, '0000-00-00', 0, '2016-10-04 07:37:16', '2016-10-04 07:37:16'),
(2, 1, 1, 4, '0000-00-00', 0, '2016-10-04 07:37:16', '2016-10-04 07:37:16'),
(3, 1, 1, 3, '0000-00-00', 0, '2016-10-04 07:37:16', '2016-10-04 07:37:16'),
(4, 1, 1, 2, '0000-00-00', 0, '2016-10-04 07:37:16', '2016-10-04 07:37:16'),
(5, 1, 1, 1, '0000-00-00', 0, '2016-10-04 07:37:16', '2016-10-04 07:37:16'),
(6, 1, 1, 7, '0000-00-00', 0, '2016-10-04 07:40:29', '2016-10-04 07:40:29'),
(7, 1, 1, 6, '0000-00-00', 0, '2016-10-04 07:40:29', '2016-10-04 07:40:29'),
(8, 2, 1, 15, '0000-00-00', 0, '2016-10-04 08:35:36', '2016-10-04 08:35:36'),
(9, 2, 1, 14, '0000-00-00', 0, '2016-10-04 08:38:33', '2016-10-04 08:38:33'),
(10, 2, 1, 13, '0000-00-00', 0, '2016-10-04 08:38:33', '2016-10-04 08:38:33'),
(11, 1, 1, 12, '0000-00-00', 0, '2016-10-04 08:39:38', '2016-10-04 08:39:38'),
(12, 1, 1, 11, '0000-00-00', 0, '2016-10-04 08:39:38', '2016-10-04 08:39:38'),
(13, 3, 1, 10, '0000-00-00', 0, '2016-10-04 08:40:29', '2016-10-04 08:40:29'),
(14, 3, 1, 9, '0000-00-00', 0, '2016-10-04 08:40:29', '2016-10-04 08:40:29'),
(15, 3, 1, 8, '0000-00-00', 0, '2016-10-04 08:40:29', '2016-10-04 08:40:29'),
(16, 1, 1, 31, '0000-00-00', 0, '2016-10-05 03:39:30', '2016-10-05 03:39:30'),
(17, 4, 1, 30, '0000-00-00', 0, '2016-10-05 03:52:17', '2016-10-05 03:52:17'),
(18, 4, 1, 29, '0000-00-00', 0, '2016-10-05 03:53:12', '2016-10-05 03:53:12'),
(19, 5, 1, 28, '0000-00-00', 0, '2016-10-06 10:16:24', '2016-10-06 10:16:24'),
(20, 5, 1, 27, '0000-00-00', 0, '2016-10-06 10:16:24', '2016-10-06 10:16:24'),
(21, 5, 1, 26, '0000-00-00', 0, '2016-10-06 10:16:24', '2016-10-06 10:16:24'),
(22, 2, 3, 67, '0000-00-00', 0, '2016-10-14 06:28:00', '2016-10-14 06:28:00'),
(23, 2, 3, 66, '0000-00-00', 0, '2016-10-14 06:28:00', '2016-10-14 06:28:00'),
(24, 2, 3, 65, '0000-00-00', 0, '2016-10-14 06:28:00', '2016-10-14 06:28:00'),
(25, 6, 3, 61, '0000-00-00', 0, '2016-10-14 06:41:25', '2016-10-14 06:41:25'),
(26, 6, 3, 60, '0000-00-00', 0, '2016-10-14 06:41:25', '2016-10-14 06:41:25'),
(27, 6, 3, 59, '0000-00-00', 0, '2016-10-14 06:41:25', '2016-10-14 06:41:25');

-- --------------------------------------------------------

--
-- Table structure for table `NP_Tooths`
--

CREATE TABLE IF NOT EXISTS `NP_Tooths` (
  `id` int(10) unsigned NOT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `em_id` int(11) NOT NULL,
  `made_id` int(11) NOT NULL,
  `own_id` int(11) NOT NULL,
  `img` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` int(11) NOT NULL,
  `own_stt` int(11) NOT NULL,
  `np_stt` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `made_day` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `dentist_id` int(11) NOT NULL,
  `chisorang` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `noidung` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `app_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `NP_Tooths`
--

INSERT INTO `NP_Tooths` (`id`, `alias`, `em_id`, `made_id`, `own_id`, `img`, `value`, `own_stt`, `np_stt`, `status`, `name`, `made_day`, `created_at`, `updated_at`, `dentist_id`, `chisorang`, `noidung`, `app_id`) VALUES
(1, '', 1, 1, 1, '', 0, 1, 1, 0, '', '2016-10-04', '2016-10-04 07:36:06', '2016-10-04 07:37:16', 1, '1', '', 0),
(2, '', 1, 1, 1, '', 0, 1, 1, 0, '', '2016-10-04', '2016-10-04 07:36:07', '2016-10-04 07:37:16', 1, '2', '', 0),
(3, '', 1, 1, 1, '', 0, 1, 1, 0, '', '2016-10-04', '2016-10-04 07:36:07', '2016-10-04 07:37:16', 1, '3', '', 0),
(4, '', 1, 1, 1, '', 0, 1, 1, 0, '', '2016-10-04', '2016-10-04 07:36:07', '2016-10-04 07:37:16', 1, '4', '', 0),
(5, '', 1, 1, 1, '', 0, 1, 1, 0, '', '2016-10-04', '2016-10-04 07:36:07', '2016-10-04 07:37:16', 1, '5', '', 0),
(6, '', 1, 1, 1, '', 0, 1, 1, 0, '', '2016-10-04', '2016-10-04 07:36:07', '2016-10-04 07:40:29', 1, '26', '', 0),
(7, '', 1, 1, 1, '', 0, 1, 1, 0, '', '2016-10-04', '2016-10-04 07:36:07', '2016-10-04 07:40:29', 1, '27', '', 0),
(8, '', 1, 1, 1, '', 0, 1, 1, 0, '', '2016-10-04', '2016-10-04 08:34:37', '2016-10-04 08:40:29', 1, '11', '', 0),
(9, '', 1, 1, 1, '', 0, 1, 1, 0, '', '2016-10-04', '2016-10-04 08:34:37', '2016-10-04 08:40:29', 1, '33', '', 0),
(10, '', 1, 1, 1, '', 0, 1, 1, 0, '', '2016-10-04', '2016-10-04 08:34:37', '2016-10-04 08:40:29', 1, '44', '', 0),
(11, '', 1, 1, 1, '', 0, 1, 1, 0, '', '2016-10-04', '2016-10-04 08:34:37', '2016-10-04 08:39:38', 1, '55', '', 0),
(12, '', 1, 1, 1, '', 0, 1, 1, 0, '', '2016-10-04', '2016-10-04 08:34:37', '2016-10-04 08:39:38', 1, '66', '', 0),
(13, '', 1, 1, 1, '', 0, 1, 1, 0, '', '2016-10-04', '2016-10-04 08:34:37', '2016-10-04 08:38:33', 1, '77', '', 0),
(14, '', 1, 1, 1, '', 0, 1, 1, 0, '', '2016-10-04', '2016-10-04 08:34:37', '2016-10-04 08:38:33', 1, '88', '', 0),
(15, '', 1, 1, 1, '', 0, 1, 1, 0, '', '2016-10-04', '2016-10-04 08:34:37', '2016-10-04 08:35:36', 1, '99', '', 0),
(16, '', 1, 1, 1, '', 0, 1, 1, 1, '', '2016-10-04', '2016-10-04 08:42:51', '2016-10-04 08:55:21', 1, '22', '', 0),
(17, '', 1, 1, 1, '', 0, 1, 1, 1, '', '2016-10-04', '2016-10-04 08:48:57', '2016-10-04 08:55:21', 1, '6', '', 0),
(18, '', 1, 1, 1, '', 0, 1, 1, 1, '', '2016-10-04', '2016-10-04 08:53:44', '2016-10-04 08:55:21', 1, '1', '', 0),
(19, '', 1, 1, 1, '', 0, 1, 1, 1, '', '2016-10-04', '2016-10-04 08:54:28', '2016-10-04 08:55:21', 1, '11', '', 0),
(20, '', 1, 1, 1, '', 0, 1, 1, 1, '', '2016-10-04', '2016-10-04 08:54:28', '2016-10-04 08:55:21', 1, '12', '', 0),
(21, '', 1, 1, 1, '', 0, 1, 1, 1, '', '2016-10-04', '2016-10-04 08:54:28', '2016-10-04 08:55:21', 1, '12', '', 0),
(22, '', 1, 1, 1, '', 0, 1, 1, 1, '', '2016-10-04', '2016-10-04 08:54:28', '2016-10-04 08:55:21', 1, '3', '', 0),
(23, '', 1, 1, 1, '', 0, 1, 1, 1, '', '2016-10-04', '2016-10-04 08:54:28', '2016-10-04 08:55:21', 1, '44', '', 0),
(24, '', 1, 1, 1, '', 0, 1, 1, 1, '', '2016-10-04', '2016-10-04 08:54:28', '2016-10-04 08:55:21', 1, '44', '', 0),
(25, '', 1, 1, 1, '', 0, 1, 1, 1, '', '2016-10-04', '2016-10-04 08:54:28', '2016-10-04 08:55:21', 1, '55', '', 0),
(26, '', 1, 1, 1, '1.jpg', 0, 1, 1, 0, '', '2016-10-05', '2016-10-05 02:04:20', '2016-10-06 10:16:24', 1, '12', '', 1),
(27, '', 1, 1, 1, '1.jpg', 0, 1, 1, 0, '', '2016-10-05', '2016-10-05 02:04:20', '2016-10-06 10:16:24', 1, '89', '', 1),
(28, '', 1, 1, 1, '1.jpg', 0, 1, 1, 0, '', '2016-10-05', '2016-10-05 02:04:20', '2016-10-06 10:16:24', 1, '09', '', 1),
(29, '', 2, 1, 1, '', 0, 1, 1, 0, '', '2016-10-05', '2016-10-05 02:49:25', '2016-10-05 03:53:12', 1, '26', '', 0),
(30, '', 2, 1, 1, '', 0, 1, 1, 0, '', '2016-10-05', '2016-10-05 02:49:25', '2016-10-05 03:52:17', 1, '27', '', 0),
(31, '', 2, 1, 1, '', 0, 1, 1, 0, '', '2016-10-05', '2016-10-05 02:49:25', '2016-10-05 03:39:30', 1, '28', '', 0),
(32, '', 2, 1, 2, '', 0, 1, 1, 1, '', '0000-00-00', '2016-10-05 03:59:32', '2016-10-06 02:25:07', 0, '5', '', 0),
(33, '', 2, 1, 2, '', 0, 1, 1, 1, '', '0000-00-00', '2016-10-05 03:59:32', '2016-10-06 02:25:07', 0, '6', '', 0),
(34, '', 2, 1, 2, '', 0, 1, 1, 1, '', '0000-00-00', '2016-10-05 03:59:32', '2016-10-06 02:25:07', 0, '7', '', 0),
(35, '', 1, 1, 1, '1.jpg', 0, 1, 0, 1, '', '0000-00-00', '2016-10-06 02:13:23', '2016-10-06 02:13:23', 0, '67', '', 2),
(36, '', 2, 1, 1, '', 0, 1, 1, 1, '', '0000-00-00', '2016-10-07 08:13:33', '2016-10-07 08:13:33', 0, '66', '', 0),
(37, '', 2, 1, 1, '', 0, 1, 1, 1, '', '0000-00-00', '2016-10-07 08:13:33', '2016-10-07 08:13:33', 0, '67', '', 0),
(38, '', 2, 1, 1, '', 0, 1, 1, 1, '', '0000-00-00', '2016-10-07 08:13:34', '2016-10-07 08:13:34', 0, '66', '', 0),
(39, '', 2, 1, 1, '', 0, 1, 1, 1, '', '0000-00-00', '2016-10-07 08:13:34', '2016-10-07 08:13:34', 0, '67', '', 0),
(40, '', 4, 4, 4, '', 0, 1, 1, 1, '', '0000-00-00', '2016-10-14 06:04:49', '2016-10-14 06:04:49', 0, '1', '', 0),
(41, '', 4, 4, 4, '', 0, 1, 1, 1, '', '0000-00-00', '2016-10-14 06:04:49', '2016-10-14 06:04:49', 0, '2', '', 0),
(42, '', 4, 4, 4, '', 0, 1, 1, 1, '', '0000-00-00', '2016-10-14 06:04:49', '2016-10-14 06:04:49', 0, '3', '', 0),
(43, '', 4, 4, 4, '', 0, 1, 1, 1, '', '0000-00-00', '2016-10-14 06:04:49', '2016-10-14 06:04:49', 0, '4', '', 0),
(44, '', 4, 4, 4, '', 0, 1, 1, 1, '', '0000-00-00', '2016-10-14 06:04:49', '2016-10-14 06:04:49', 0, '5', '', 0),
(45, '', 4, 4, 4, '', 0, 1, 1, 1, '', '0000-00-00', '2016-10-14 06:04:49', '2016-10-14 06:04:49', 0, '6', '', 0),
(46, '', 4, 4, 4, '', 0, 1, 1, 1, '', '0000-00-00', '2016-10-14 06:04:49', '2016-10-14 06:04:49', 0, '7', '', 0),
(47, '', 4, 4, 4, '', 0, 1, 1, 1, '', '0000-00-00', '2016-10-14 06:04:49', '2016-10-14 06:04:49', 0, '8', '', 0),
(48, '', 4, 4, 4, '', 0, 1, 1, 1, '', '0000-00-00', '2016-10-14 06:04:49', '2016-10-14 06:04:49', 0, '9', '', 0),
(49, '', 4, 4, 4, '', 0, 1, 1, 1, '', '0000-00-00', '2016-10-14 06:04:49', '2016-10-14 06:04:49', 0, '10', '', 0),
(50, '', 4, 4, 4, '', 0, 1, 1, 1, '', '0000-00-00', '2016-10-14 06:04:49', '2016-10-14 06:04:49', 0, '1', '', 0),
(51, '', 4, 4, 4, '', 0, 1, 1, 1, '', '0000-00-00', '2016-10-14 06:04:49', '2016-10-14 06:04:49', 0, '2', '', 0),
(52, '', 4, 4, 4, '', 0, 1, 1, 1, '', '0000-00-00', '2016-10-14 06:04:49', '2016-10-14 06:04:49', 0, '3', '', 0),
(53, '', 4, 4, 4, '', 0, 1, 1, 1, '', '0000-00-00', '2016-10-14 06:04:49', '2016-10-14 06:04:49', 0, '4', '', 0),
(54, '', 4, 4, 4, '', 0, 1, 1, 1, '', '0000-00-00', '2016-10-14 06:04:49', '2016-10-14 06:04:49', 0, '5', '', 0),
(55, '', 4, 4, 4, '', 0, 1, 1, 1, '', '0000-00-00', '2016-10-14 06:04:49', '2016-10-14 06:04:49', 0, '6', '', 0),
(56, '', 4, 4, 4, '', 0, 1, 1, 1, '', '0000-00-00', '2016-10-14 06:04:49', '2016-10-14 06:04:49', 0, '7', '', 0),
(57, '', 4, 4, 4, '', 0, 1, 1, 1, '', '0000-00-00', '2016-10-14 06:04:49', '2016-10-14 06:04:49', 0, '8', '', 0),
(58, '', 4, 4, 4, '', 0, 1, 1, 1, '', '0000-00-00', '2016-10-14 06:04:49', '2016-10-14 06:04:49', 0, '9', '', 0),
(59, '', 4, 4, 4, '', 0, 1, 1, 0, '', '2016-10-14', '2016-10-14 06:04:49', '2016-10-14 06:41:25', 3, '10', '', 0),
(60, '', 4, 4, 4, '', 0, 1, 1, 0, '', '2016-10-14', '2016-10-14 06:05:27', '2016-10-14 06:41:25', 3, '11', '', 0),
(61, '', 4, 4, 4, '', 0, 1, 1, 0, '', '2016-10-14', '2016-10-14 06:05:27', '2016-10-14 06:41:25', 3, '12', '', 0),
(62, '', 4, 4, 5, '', 0, 1, 1, 1, '', '0000-00-00', '2016-10-14 06:05:27', '2016-10-14 06:12:57', 0, '13', '', 0),
(63, '', 4, 4, 5, '', 0, 1, 1, 1, '', '0000-00-00', '2016-10-14 06:05:27', '2016-10-14 06:12:57', 0, '14', '', 0),
(64, '', 4, 4, 5, '', 0, 1, 1, 1, '', '0000-00-00', '2016-10-14 06:05:27', '2016-10-14 06:12:57', 0, '15', '', 0),
(65, '', 4, 4, 4, '1.jpg', 0, 1, 1, 0, '', '2016-10-14', '2016-10-14 06:06:45', '2016-10-14 06:28:00', 3, '25', '', 3),
(66, '', 4, 4, 4, '1.jpg', 0, 1, 1, 0, '', '2016-10-14', '2016-10-14 06:06:45', '2016-10-14 06:28:00', 3, '26', '', 3),
(67, '', 4, 4, 4, '1.jpg', 0, 1, 1, 0, '', '2016-10-14', '2016-10-14 06:06:45', '2016-10-14 06:28:00', 3, '27', '', 3);

-- --------------------------------------------------------

--
-- Table structure for table `NP_Tooth_Apps`
--

CREATE TABLE IF NOT EXISTS `NP_Tooth_Apps` (
  `id` int(10) unsigned NOT NULL,
  `noidung` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `center_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stt` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `NP_Tooth_Apps`
--

INSERT INTO `NP_Tooth_Apps` (`id`, `noidung`, `img`, `center_id`, `created_at`, `updated_at`, `stt`) VALUES
(1, 'qwerty \r\n                                    ', '1.jpg', 1, '2016-10-05 02:04:20', '2016-10-05 02:04:49', 1),
(2, 'duyet di \r\n                                    ', '1.jpg', 1, '2016-10-06 02:13:23', '2016-10-06 02:13:23', 0),
(3, ' Duyệt đi\r\n                                    ', '1.jpg', 4, '2016-10-14 06:06:45', '2016-10-14 06:07:15', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(10) unsigned NOT NULL,
  `fullname` varchar(75) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `total` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `note` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `note_stick` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE IF NOT EXISTS `order_items` (
  `id` int(10) unsigned NOT NULL,
  `quantity` tinyint(1) unsigned NOT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `price` int(11) NOT NULL,
  `price_sale` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `key`, `created_at`, `updated_at`) VALUES
(1, 'Đăng bài viết', 'dang_bai_viet', '2016-09-19 08:08:33', '2016-09-19 08:08:33'),
(2, 'Sửa bài viết', 'sua_bai_viet', '2016-09-19 08:08:33', '2016-09-19 08:08:33'),
(3, 'Lưu bài viết', 'luu_bai_viet', '2016-09-19 08:08:33', '2016-09-19 08:08:33'),
(4, 'Xóa bài viết', 'xoa_bai_viet', '2016-09-19 08:08:33', '2016-09-19 08:08:33'),
(5, 'Thêm danh mục bài viết', 'them_danh_muc_bai_viet', '2016-09-19 08:08:33', '2016-09-19 08:08:33'),
(6, 'Sửa danh mục bài viết', 'sua_danh_muc_bai_viet', '2016-09-19 08:08:33', '2016-09-19 08:08:33'),
(7, 'Xóa danh mục bài viết', 'xoa_danh_muc_bai_viet', '2016-09-19 08:08:33', '2016-09-19 08:08:33'),
(8, 'Quản lý tags bài viết', 'quan_ly_tags_bai_viet', '2016-09-19 08:08:33', '2016-09-19 08:08:33'),
(9, 'Đăng sản phẩm', 'them_san_pham', '2016-09-19 08:08:33', '2016-09-19 08:08:33'),
(10, 'Sửa sản phẩm', 'sua_san_pham', '2016-09-19 08:08:33', '2016-09-19 08:08:33'),
(11, 'Lưu sản phẩm', 'luu_san_pham', '2016-09-19 08:08:33', '2016-09-19 08:08:33'),
(12, 'Xóa sản phẩm', 'xoa_san_pham', '2016-09-19 08:08:33', '2016-09-19 08:08:33'),
(13, 'Thêm danh mục sản phẩm', 'them_danh_muc_san_pham', '2016-09-19 08:08:33', '2016-09-19 08:08:33'),
(14, 'Sửa danh mục sản phẩm', 'sua_danh_muc_san_pham', '2016-09-19 08:08:33', '2016-09-19 08:08:33'),
(15, 'Xóa danh mục sản phẩm', 'xoa_danh_muc_san_pham', '2016-09-19 08:08:33', '2016-09-19 08:08:33'),
(16, 'Quản lý tags sản phẩm', 'quan_ly_tags_san_pham', '2016-09-19 08:08:33', '2016-09-19 08:08:33'),
(17, 'Thêm slide', 'them_slide', '2016-09-19 08:08:33', '2016-09-19 08:08:33'),
(18, 'Sửa slide', 'sua_slide', '2016-09-19 08:08:33', '2016-09-19 08:08:33'),
(19, 'Xóa slide', 'xoa_slide', '2016-09-19 08:08:33', '2016-09-19 08:08:33'),
(20, 'Tạo menu', 'tao_menu', '2016-09-19 08:08:33', '2016-09-19 08:08:33'),
(21, 'Sửa menu', 'sua_menu', '2016-09-19 08:08:33', '2016-09-19 08:08:33'),
(22, 'Xóa menu', 'xoa_menu', '2016-09-19 08:08:33', '2016-09-19 08:08:33'),
(23, 'Thêm layout', 'them_layout', '2016-09-19 08:08:33', '2016-09-19 08:08:33'),
(24, 'Sửa layout', 'sua_layout', '2016-09-19 08:08:33', '2016-09-19 08:08:33'),
(25, 'Thêm thành viên', 'them_thanh_vien', '2016-09-19 08:08:33', '2016-09-19 08:08:33'),
(26, 'Sửa thành viên', 'sua_thanh_vien', '2016-09-19 08:08:33', '2016-09-19 08:08:33'),
(27, 'Xóa thành viên', 'xoa_thanh_vien', '2016-09-19 08:08:33', '2016-09-19 08:08:33'),
(28, 'Phân quyền thành viên', 'phan_quyen_thanh_vien', '2016-09-19 08:08:33', '2016-09-19 08:08:33'),
(29, 'Xem liên hệ', 'xem_lien_he', '2016-09-19 08:08:33', '2016-09-19 08:08:33'),
(30, 'Xóa liên hệ', 'xoa_lien_he', '2016-09-19 08:08:33', '2016-09-19 08:08:33'),
(31, 'Thêm Đơn Hàng', 'them_don_hang', '2016-09-19 08:08:33', '2016-09-19 08:08:33'),
(32, 'Xóa Đơn Hàng', 'xoa_don_hang', '2016-09-19 08:08:33', '2016-09-19 08:08:33'),
(33, 'Xem Đơn Hàng', 'xem_don_hang', '2016-09-19 08:08:33', '2016-09-19 08:08:33'),
(34, 'Xử Lí Đơn Hàng', 'xu_li_don_hang', '2016-09-19 08:08:33', '2016-09-19 08:08:33'),
(35, 'Thêm Thuộc Tính', 'them_thuoc_tinh', '2016-09-19 08:08:42', '2016-09-19 08:08:42'),
(36, 'Sửa Thuộc Tính', 'sua_thuoc_tinh', '2016-09-19 08:08:42', '2016-09-19 08:08:42'),
(37, 'Xóa Thuộc Tính', 'xoa_thuoc_tinh', '2016-09-19 08:08:42', '2016-09-19 08:08:42'),
(38, 'Quản lý bình luận bài viết', 'quan_ly_binh_luan_bai_viet', '2016-09-19 08:08:46', '2016-09-19 08:08:46'),
(39, 'Quản lý bình luận sản phẩm', 'quan_ly_binh_luan_san_pham', '2016-09-19 08:08:46', '2016-09-19 08:08:46');

-- --------------------------------------------------------

--
-- Table structure for table `permission_admin`
--

CREATE TABLE IF NOT EXISTS `permission_admin` (
  `id` int(10) unsigned NOT NULL,
  `admin_id` int(10) unsigned NOT NULL,
  `permission_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permission_admin`
--

INSERT INTO `permission_admin` (`id`, `admin_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(25, 2, 25, NULL, NULL),
(26, 2, 26, NULL, NULL),
(27, 2, 27, NULL, NULL),
(28, 2, 28, NULL, NULL),
(31, 2, 1, NULL, NULL),
(32, 2, 2, NULL, NULL),
(33, 2, 3, NULL, NULL),
(34, 2, 4, NULL, NULL),
(35, 2, 5, NULL, NULL),
(36, 2, 6, NULL, NULL),
(37, 2, 7, NULL, NULL),
(38, 2, 8, NULL, NULL),
(39, 2, 38, NULL, NULL),
(40, 2, 17, NULL, NULL),
(41, 2, 18, NULL, NULL),
(42, 2, 19, NULL, NULL),
(43, 2, 24, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(10) unsigned NOT NULL,
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
  `thumb_images` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_category`
--

CREATE TABLE IF NOT EXISTS `post_category` (
  `id` int(10) unsigned NOT NULL,
  `post_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `thumb_images` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_images`
--

CREATE TABLE IF NOT EXISTS `post_images` (
  `id` int(10) unsigned NOT NULL,
  `post_id` int(10) unsigned NOT NULL,
  `img` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `group_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `thumb_images` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `id` int(10) unsigned NOT NULL,
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
  `thumb_images` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `sku`, `img`, `short_description`, `price`, `price_sale`, `description`, `status`, `created_at`, `updated_at`, `code_product`, `label`, `create_by`, `last_edit_by`, `rating`, `number_rate`, `thumb_images`) VALUES
(1, '', '', '0', '', '', '0', '0', '', '1', '2016-09-28 09:21:39', '2016-09-28 09:21:39', '', '0', 2, 2, '0.00', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `product_attribute`
--

CREATE TABLE IF NOT EXISTS `product_attribute` (
  `id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `attribute_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_category`
--

CREATE TABLE IF NOT EXISTS `product_category` (
  `id` int(10) unsigned NOT NULL,
  `product_id` int(11) NOT NULL,
  `cate_pro_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE IF NOT EXISTS `product_images` (
  `id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `img` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `group_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `thumb_images` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_ratings`
--

CREATE TABLE IF NOT EXISTS `product_ratings` (
  `id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `mumber` tinyint(4) NOT NULL,
  `comment` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) unsigned NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `slides`
--

CREATE TABLE IF NOT EXISTS `slides` (
  `id` int(10) unsigned NOT NULL,
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
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `slides`
--

INSERT INTO `slides` (`id`, `img_1`, `img_2`, `img_3`, `text_1`, `text_2`, `text_3`, `text_4`, `des_1`, `des_2`, `link_1`, `link_2`, `type`, `status`, `created_at`, `updated_at`) VALUES
(1, '/assets/slide/58008969e2234-14-10-2016.bruxzir-now-banner-revised.jpg', '/assets/slide/58008969eb2be-14-10-2016.banner-1800-full-arch.jpg', '/assets/slide/58008969ec25e-14-10-2016.anteriorbanner.jpg', 'Nhật phát', 'Bảo hành', '', '', '', '', '', '', 'Trang chủ', 0, '2016-10-14 07:29:45', '2016-10-14 07:29:45');

-- --------------------------------------------------------

--
-- Table structure for table `slide_types`
--

CREATE TABLE IF NOT EXISTS `slide_types` (
  `id` int(10) unsigned NOT NULL,
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
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `slide_types`
--

INSERT INTO `slide_types` (`id`, `name`, `img_1`, `img_2`, `img_3`, `text_1`, `text_2`, `text_3`, `text_4`, `des_1`, `des_2`, `link_1`, `link_2`, `created_at`, `updated_at`) VALUES
(1, 'Trang chủ', 'banner1', 'banner2', 'banner3', 'Nhật phát', 'Bảo hành', '', '', '', '', '', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `systems`
--

CREATE TABLE IF NOT EXISTS `systems` (
  `id` int(10) unsigned NOT NULL,
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
  `email_order` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tab_attributes`
--

CREATE TABLE IF NOT EXISTS `tab_attributes` (
  `id` int(10) unsigned NOT NULL,
  `content_products_id` int(10) unsigned NOT NULL,
  `attribute_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tagPs`
--

CREATE TABLE IF NOT EXISTS `tagPs` (
  `id` int(10) unsigned NOT NULL,
  `tag` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE IF NOT EXISTS `tags` (
  `id` int(10) unsigned NOT NULL,
  `tag` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tag_post`
--

CREATE TABLE IF NOT EXISTS `tag_post` (
  `id` int(10) unsigned NOT NULL,
  `tag_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tag_products`
--

CREATE TABLE IF NOT EXISTS `tag_products` (
  `id` int(10) unsigned NOT NULL,
  `tag_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `category_product_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `thumbs_config`
--

CREATE TABLE IF NOT EXISTS `thumbs_config` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_log_orders`
--
ALTER TABLE `admin_log_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_log_orders_admin_id_foreign` (`admin_id`),
  ADD KEY `admin_log_orders_order_id_foreign` (`order_id`);

--
-- Indexes for table `admin_roles`
--
ALTER TABLE `admin_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_products`
--
ALTER TABLE `category_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment_posts`
--
ALTER TABLE `comment_posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment_products`
--
ALTER TABLE `comment_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contents`
--
ALTER TABLE `contents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `content_products`
--
ALTER TABLE `content_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `content_products_product_id_foreign` (`product_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customers_email_unique` (`email`);

--
-- Indexes for table `filters`
--
ALTER TABLE `filters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `filters_attribute_id_foreign` (`attribute_id`);

--
-- Indexes for table `filter_prices`
--
ALTER TABLE `filter_prices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `forms`
--
ALTER TABLE `forms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `form_types`
--
ALTER TABLE `form_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `group_layouts`
--
ALTER TABLE `group_layouts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `layouts`
--
ALTER TABLE `layouts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `NP_Cards`
--
ALTER TABLE `NP_Cards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `NP_Card_Tooths`
--
ALTER TABLE `NP_Card_Tooths`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `NP_Centers`
--
ALTER TABLE `NP_Centers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `NP_Dentists`
--
ALTER TABLE `NP_Dentists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `NP_Embryos`
--
ALTER TABLE `NP_Embryos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `NP_Patients`
--
ALTER TABLE `NP_Patients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `NP_Teeth_useds`
--
ALTER TABLE `NP_Teeth_useds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `NP_Tooths`
--
ALTER TABLE `NP_Tooths`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `NP_Tooth_Apps`
--
ALTER TABLE `NP_Tooth_Apps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `order_items_product_id_foreign` (`product_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission_admin`
--
ALTER TABLE `permission_admin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permission_admin_admin_id_foreign` (`admin_id`),
  ADD KEY `permission_admin_permission_id_foreign` (`permission_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_category`
--
ALTER TABLE `post_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_images`
--
ALTER TABLE `post_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_images_post_id_foreign` (`post_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_attribute`
--
ALTER TABLE `product_attribute`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_attribute_product_id_foreign` (`product_id`),
  ADD KEY `product_attribute_attribute_id_foreign` (`attribute_id`);

--
-- Indexes for table `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_ratings`
--
ALTER TABLE `product_ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_ratings_product_id_foreign` (`product_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slides`
--
ALTER TABLE `slides`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slide_types`
--
ALTER TABLE `slide_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `systems`
--
ALTER TABLE `systems`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tab_attributes`
--
ALTER TABLE `tab_attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tab_attributes_content_products_id_foreign` (`content_products_id`),
  ADD KEY `tab_attributes_attribute_id_foreign` (`attribute_id`);

--
-- Indexes for table `tagPs`
--
ALTER TABLE `tagPs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tag_post`
--
ALTER TABLE `tag_post`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tag_products`
--
ALTER TABLE `tag_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `thumbs_config`
--
ALTER TABLE `thumbs_config`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `admin_log_orders`
--
ALTER TABLE `admin_log_orders`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `admin_roles`
--
ALTER TABLE `admin_roles`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `category_products`
--
ALTER TABLE `category_products`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `comment_posts`
--
ALTER TABLE `comment_posts`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `comment_products`
--
ALTER TABLE `comment_products`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `contents`
--
ALTER TABLE `contents`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `content_products`
--
ALTER TABLE `content_products`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `filters`
--
ALTER TABLE `filters`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `filter_prices`
--
ALTER TABLE `filter_prices`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `forms`
--
ALTER TABLE `forms`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `form_types`
--
ALTER TABLE `form_types`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `group_layouts`
--
ALTER TABLE `group_layouts`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `layouts`
--
ALTER TABLE `layouts`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `NP_Cards`
--
ALTER TABLE `NP_Cards`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `NP_Card_Tooths`
--
ALTER TABLE `NP_Card_Tooths`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `NP_Centers`
--
ALTER TABLE `NP_Centers`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `NP_Dentists`
--
ALTER TABLE `NP_Dentists`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `NP_Embryos`
--
ALTER TABLE `NP_Embryos`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `NP_Patients`
--
ALTER TABLE `NP_Patients`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `NP_Teeth_useds`
--
ALTER TABLE `NP_Teeth_useds`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `NP_Tooths`
--
ALTER TABLE `NP_Tooths`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=68;
--
-- AUTO_INCREMENT for table `NP_Tooth_Apps`
--
ALTER TABLE `NP_Tooth_Apps`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT for table `permission_admin`
--
ALTER TABLE `permission_admin`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `post_category`
--
ALTER TABLE `post_category`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `post_images`
--
ALTER TABLE `post_images`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `product_attribute`
--
ALTER TABLE `product_attribute`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `product_category`
--
ALTER TABLE `product_category`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `product_ratings`
--
ALTER TABLE `product_ratings`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `slides`
--
ALTER TABLE `slides`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `slide_types`
--
ALTER TABLE `slide_types`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `systems`
--
ALTER TABLE `systems`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tab_attributes`
--
ALTER TABLE `tab_attributes`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tagPs`
--
ALTER TABLE `tagPs`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tag_post`
--
ALTER TABLE `tag_post`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tag_products`
--
ALTER TABLE `tag_products`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `thumbs_config`
--
ALTER TABLE `thumbs_config`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
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
