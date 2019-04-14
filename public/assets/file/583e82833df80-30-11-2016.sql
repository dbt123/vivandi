-- phpMyAdmin SQL Dump
-- version 4.4.15.7
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 30, 2016 at 10:10 AM
-- Server version: 5.6.31
-- PHP Version: 5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `demovi`
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
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8_unicode_ci NOT NULL
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
(1, 'dev', '21232f297a57a5a743894a0e4a801fc3', '34234234234', 'E5 Quỳnh Mai Hai Bà Trưng Hà Nội', 1, 1, '2016-11-29 06:47:57', '2016-11-29 06:47:57', '', ''),
(2, 'admin', '21232f297a57a5a743894a0e4a801fc3', '34234234234', 'E5 Quỳnh Mai Hai Bà Trưng Hà Nội', 1, 1, '2016-11-29 06:47:57', '2016-11-29 06:47:57', '', '');

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
  `init` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `isDelete` int(11) NOT NULL DEFAULT '0',
  `prefix` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `avaiable` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
-- Table structure for table `comment_frames`
--

CREATE TABLE IF NOT EXISTS `comment_frames` (
  `id` int(10) unsigned NOT NULL,
  `is_guest` int(11) NOT NULL DEFAULT '1',
  `account_id` int(11) NOT NULL,
  `frame_id` int(11) NOT NULL,
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
-- Table structure for table `configure_discounts`
--

CREATE TABLE IF NOT EXISTS `configure_discounts` (
  `id` int(10) unsigned NOT NULL,
  `targets` int(11) NOT NULL,
  `percent` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `config_districs`
--

CREATE TABLE IF NOT EXISTS `config_districs` (
  `id` int(10) unsigned NOT NULL,
  `province_id` int(11) NOT NULL,
  `district_id` int(11) NOT NULL,
  `min_weigh` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `max_weigh` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `init_weigh` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `init_price` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
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
-- Table structure for table `content_frames`
--

CREATE TABLE IF NOT EXISTS `content_frames` (
  `id` int(10) unsigned NOT NULL,
  `frame_id` int(10) unsigned NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `rank` int(11) NOT NULL,
  `json` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `content_frames`
--

INSERT INTO `content_frames` (`id`, `frame_id`, `description`, `content`, `name`, `rank`, `json`, `created_at`, `updated_at`) VALUES
(1, 1, 'Tab 1', '<p style="margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: "Open Sans", Arial, sans-serif; font-size: 14px;">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean efficitur felis nec bibendum placerat. Curabitur auctor nulla ac velit iaculis, vel porta justo porttitor. Ut volutpat dictum nisi ut pulvinar. Curabitur faucibus, justo at dignissim fringilla, justo massa fermentum augue, eu hendrerit leo dui id felis. Curabitur eget suscipit dui, ultricies tempus lorem. Cras molestie sem pellentesque risus consequat cursus. In hac habitasse platea dictumst. Suspendisse commodo placerat nisl at luctus. Suspendisse id libero elementum, sagittis enim pharetra, congue arcu. Donec ullamcorper molestie tortor, a venenatis neque pretium a. Fusce placerat rhoncus lobortis.</p><p style="margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: "Open Sans", Arial, sans-serif; font-size: 14px;">Mauris vel ligula scelerisque, fringilla ipsum a, consectetur purus. Duis tortor neque, efficitur ut nisi sit amet, ultrices auctor leo. In accumsan pharetra ligula. Aenean sit amet euismod eros. Quisque ultricies bibendum lacus, a porttitor diam ultricies quis. Sed dapibus vel diam et suscipit. Pellentesque quis semper quam, quis ultrices mauris. Nunc semper mi sed ligula rutrum, sit amet sagittis lorem posuere. Ut tempus tempus efficitur. Donec eu efficitur turpis. Phasellus convallis diam velit, sit amet vulputate est vulputate non. Phasellus scelerisque erat rutrum nisl tincidunt dignissim. In feugiat ac libero et feugiat.</p>', 'Tab 1', 1, '', '2016-11-29 08:03:26', '2016-11-29 08:27:19'),
(2, 2, 'Tab 1', '', 'Tab 1', 1, '', '2016-11-29 09:03:29', '2016-11-29 09:03:29'),
(3, 3, 'Tab 1', '', 'Tab 1', 1, '', '2016-11-29 09:21:35', '2016-11-29 09:21:35'),
(4, 4, 'Tab 1', '', 'Tab 1', 1, '', '2016-11-29 09:50:53', '2016-11-29 09:50:53'),
(5, 5, 'Tab 1', '', 'Tab 1', 1, '', '2016-11-30 02:25:16', '2016-11-30 02:25:16'),
(6, 6, 'Tab 1', '', 'Tab 1', 1, '', '2016-11-30 03:12:07', '2016-11-30 03:12:07');

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
  `updated_at` timestamp NULL DEFAULT NULL,
  `json_attr` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE IF NOT EXISTS `customers` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sex` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `creditCard` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `nameCompany` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `points` int(11) NOT NULL,
  `some_purchases` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `district`
--

CREATE TABLE IF NOT EXISTS `district` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `location` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `provinceid` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `price` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_generals`
--

CREATE TABLE IF NOT EXISTS `email_generals` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` int(11) NOT NULL,
  `note` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `config_sku` int(11) NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `add_1` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `add_2` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `add_3` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_out_of_stocks`
--

CREATE TABLE IF NOT EXISTS `email_out_of_stocks` (
  `id` int(10) unsigned NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` int(11) NOT NULL,
  `name_product` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code_product` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `note` text COLLATE utf8_unicode_ci NOT NULL,
  `add_1` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `add_2` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `add_3` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_preferences`
--

CREATE TABLE IF NOT EXISTS `email_preferences` (
  `id` int(10) unsigned NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` int(11) NOT NULL,
  `name_product` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code_product` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `note` text COLLATE utf8_unicode_ci NOT NULL,
  `add_1` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `add_2` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `add_3` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
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
-- Table structure for table `folder_attributes`
--

CREATE TABLE IF NOT EXISTS `folder_attributes` (
  `id` int(10) unsigned NOT NULL,
  `attribute_id` int(10) unsigned NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  `number_item` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` int(11) NOT NULL,
  `number_item_hidden` int(11) NOT NULL
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
-- Table structure for table `frames`
--

CREATE TABLE IF NOT EXISTS `frames` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sku` int(11) NOT NULL,
  `img` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `price_sale` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `code_frame` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `label` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `thumb_images` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `create_by` int(11) NOT NULL,
  `last_edit_by` int(11) NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `weight` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `rating` decimal(3,2) NOT NULL DEFAULT '0.00',
  `number_rate` int(11) NOT NULL DEFAULT '0',
  `youtube_link` text COLLATE utf8_unicode_ci NOT NULL,
  `assurance` int(11) NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `frames`
--

INSERT INTO `frames` (`id`, `name`, `slug`, `sku`, `img`, `description`, `content`, `price`, `price_sale`, `status`, `code_frame`, `label`, `attribute_id`, `thumb_images`, `create_by`, `last_edit_by`, `product_id`, `created_at`, `updated_at`, `weight`, `rating`, `number_rate`, `youtube_link`, `assurance`, `file`) VALUES
(1, 'White shoe', 'white-shoe', 10, '/assets/product/583d364eb177a-29-11-2016.jpg', 'Test TestTestTestTestTest', '', 400000, 0, 0, 'M01', 3, 0, '/assets/frame_thumb/223_181_583d364eb177a-29-11-2016.jpg', 2, 2, 1, '2016-11-29 08:03:26', '2016-11-29 09:22:52', '500', '0.00', 0, '[]', 17, ''),
(2, 'New Product 555', 'new-product-555', 9, '/assets/product/583d446110584-29-11-2016.jpg', 'Mô tả ngắn gọn về sản phẩm', '', 5555555, 0, 0, 'M02', 2, 0, '/assets/frame_thumb/223_181_583d446110584-29-11-2016.jpg', 2, 0, 2, '2016-11-29 09:03:29', '2016-11-29 09:03:29', '45', '0.00', 0, '[]', 22, 'ajax-submit.txt'),
(3, 'New Product abc', 'new-product-abc', 9, '/assets/frame/583d48e13a8e9-29-11-2016.jpg', 'Mô tả ngắn gọn về sản phẩm', '', 5555555, 0, 0, 'M03', 2, 0, '/assets/frame_thumb/223_181_583d48e13a8e9-29-11-2016.jpg', 2, 2, 2, '2016-11-29 09:21:35', '2016-11-29 09:22:41', '45', '0.00', 0, '[]', 40, ''),
(4, 'New Product fgh', 'new-product-fgh', 18, '/assets/product/583d4f7ce17d8-29-11-2016.jpg', 'Mô tả ngắn gọn về sản phẩm', '', 100000, 0, 0, 'M06', 2, 0, '/assets/frame_thumb/223_181_583d4f7ce17d8-29-11-2016.jpg', 2, 0, 3, '2016-11-29 09:50:52', '2016-11-29 09:50:53', '67', '0.00', 0, '[]', 9, '/assets/file/583d4f7cdc5cf-29-11-2016.sql'),
(5, 'abc', 'abc', 11, '/assets/product/583e388c80963-30-11-2016.jpg', 'Mô tả ngắn gọn về sản phẩm', '', 456789, 0, 0, 'M09', 1, 0, '/assets/frame_thumb/223_181_583e388c80963-30-11-2016.jpg', 2, 2, 4, '2016-11-30 02:25:16', '2016-11-30 03:01:21', '67', '0.00', 0, '[]', 6, '/assets/file/583e410170ace-30-11-2016.php'),
(6, 'abcbnbn', 'abcbnbn', 11, '/assets/frame/583e4387b8eec-30-11-2016.jpg', 'Mô tả ngắn gọn về sản phẩm', '', 456789, 0, 0, 'M067', 1, 0, '/assets/frame_thumb/223_181_583e4387b8eec-30-11-2016.jpg', 2, 0, 4, '2016-11-30 03:12:07', '2016-11-30 03:12:07', '67', '0.00', 0, '[]', 6, '/assets/file/583e4387b38fb-30-11-2016.docx');

-- --------------------------------------------------------

--
-- Table structure for table `frame_attributes`
--

CREATE TABLE IF NOT EXISTS `frame_attributes` (
  `id` int(10) unsigned NOT NULL,
  `frame_id` int(10) unsigned NOT NULL,
  `attribute_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `status_frame` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `frame_categorys`
--

CREATE TABLE IF NOT EXISTS `frame_categorys` (
  `id` int(10) unsigned NOT NULL,
  `frame_id` int(11) NOT NULL,
  `cate_pro_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `frame_images`
--

CREATE TABLE IF NOT EXISTS `frame_images` (
  `id` int(10) unsigned NOT NULL,
  `frame_id` int(10) unsigned NOT NULL,
  `img` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `group_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `thumb_images` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `frame_images`
--

INSERT INTO `frame_images` (`id`, `frame_id`, `img`, `group_name`, `type`, `thumb_images`, `created_at`, `updated_at`) VALUES
(1, 1, '/assets/upload/583d359f769fb-29-11-2016-giay-vans-luoi-slip-on-trangjpg.jpg', '', '', '/assets/frame_thumb/101_84_583d359f769fb-29-11-2016-giay-vans-luoi-slip-on-trangjpg.jpg', '2016-11-29 08:03:27', '2016-11-29 08:03:27'),
(2, 1, '/assets/upload/583d359f7bc04-29-11-2016-giay-vans-luoi-slip-on-trang-1-copyjpg.jpg', '', '', '/assets/frame_thumb/101_84_583d359f7bc04-29-11-2016-giay-vans-luoi-slip-on-trang-1-copyjpg.jpg', '2016-11-29 08:03:27', '2016-11-29 08:03:27'),
(3, 1, '/assets/upload/583d359fc6f36-29-11-2016-giay-vans-luoi-slip-on-trang-1jpg.jpg', '', '', '/assets/frame_thumb/101_84_583d359fc6f36-29-11-2016-giay-vans-luoi-slip-on-trang-1jpg.jpg', '2016-11-29 08:03:27', '2016-11-29 08:03:27'),
(4, 1, '/assets/upload/583d359fd6d22-29-11-2016-giay-vans-luoi-slip-on-trang-2jpg.jpg', '', '', '/assets/frame_thumb/101_84_583d359fd6d22-29-11-2016-giay-vans-luoi-slip-on-trang-2jpg.jpg', '2016-11-29 08:03:27', '2016-11-29 08:03:27'),
(5, 2, '/assets/upload/583d435059327-29-11-2016-giay-da-bong-nike-mercurial-tf-cam-4jpg.jpg', '', '', '/assets/frame_thumb/101_84_583d435059327-29-11-2016-giay-da-bong-nike-mercurial-tf-cam-4jpg.jpg', '2016-11-29 09:03:29', '2016-11-29 09:03:29'),
(6, 2, '/assets/upload/583d43506b43b-29-11-2016-giay-da-bong-nike-mercurial-tf-cam-5jpg.jpg', '', '', '/assets/frame_thumb/101_84_583d43506b43b-29-11-2016-giay-da-bong-nike-mercurial-tf-cam-5jpg.jpg', '2016-11-29 09:03:29', '2016-11-29 09:03:29'),
(7, 2, '/assets/upload/583d4350b2504-29-11-2016-giay-da-bong-nike-mercurial-tf-cam-6jpg.jpg', '', '', '/assets/frame_thumb/101_84_583d4350b2504-29-11-2016-giay-da-bong-nike-mercurial-tf-cam-6jpg.jpg', '2016-11-29 09:03:29', '2016-11-29 09:03:29'),
(8, 4, '/assets/upload/583d4f3648678-29-11-2016-mg-0026jpg.jpg', '', '', '/assets/frame_thumb/101_84_583d4f3648678-29-11-2016-mg-0026jpg.jpg', '2016-11-29 09:50:53', '2016-11-29 09:50:53'),
(9, 4, '/assets/upload/583d4f3622cdf-29-11-2016-mg-0028jpg.jpg', '', '', '/assets/frame_thumb/101_84_583d4f3622cdf-29-11-2016-mg-0028jpg.jpg', '2016-11-29 09:50:53', '2016-11-29 09:50:53'),
(10, 4, '/assets/upload/583d4f367803b-29-11-2016-gi-y-da-l-n-c-cao-m-u-n-u-lv-2203-jpg.jpg', '', '', '/assets/frame_thumb/101_84_583d4f367803b-29-11-2016-gi-y-da-l-n-c-cao-m-u-n-u-lv-2203-jpg.jpg', '2016-11-29 09:50:53', '2016-11-29 09:50:53');

-- --------------------------------------------------------

--
-- Table structure for table `frame_raitings`
--

CREATE TABLE IF NOT EXISTS `frame_raitings` (
  `id` int(10) unsigned NOT NULL,
  `frame_id` int(10) unsigned NOT NULL,
  `name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `mumber` tinyint(4) NOT NULL,
  `comment` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `group_attributes`
--

CREATE TABLE IF NOT EXISTS `group_attributes` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `img` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `group_id` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `number_product` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `youtube_links` text COLLATE utf8_unicode_ci NOT NULL,
  `contents` text COLLATE utf8_unicode_ci NOT NULL,
  `image_links` text COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
('2016_09_19_090123_add_json_to_content_products', 1),
('2016_09_19_093736_create_frames_table', 1),
('2016_09_19_093752_create_frame_images_table', 1),
('2016_09_28_110217_create_tagFs_table', 1),
('2016_09_29_090231_create_tag_frame_table', 1),
('2016_10_04_150453_add_img_to_acounts_table', 1),
('2016_10_06_092524_create_ward_table', 1),
('2016_10_06_092606_create_district_table', 1),
('2016_10_06_092632_create_province_table', 1),
('2016_10_06_122222_add_weight_to_product_table', 1),
('2016_10_06_122252_add_weight_to_frame_table', 1),
('2016_10_07_153612_add_total_to_orders_table', 1),
('2016_10_07_153709_add_weight_to_order_items_table', 1),
('2016_10_08_102041_add_traspost_to_order_item_table', 1),
('2016_10_10_144431_add_email_het_hang_to_system_table', 1),
('2016_10_19_113015_create_content_frame_table', 1),
('2016_10_19_113117_add_rating_to_frame_table', 1),
('2016_10_19_113151_add_col_to_attribute', 1),
('2016_10_19_143610_add_youtube_link_to_products', 1),
('2016_10_19_143627_add_youtube_link_to_frames', 1),
('2016_10_26_094301_create_email_out_of_stocks_table', 1),
('2016_10_26_094344_create_email_preferences_table', 1),
('2016_10_26_113909_add_order_logs', 1),
('2016_10_27_094204_create_email_generals_table', 1),
('2016_10_28_093924_create_configure_discounts_table', 1),
('2016_10_29_091736_add_points_to_customers_table', 1),
('2016_10_31_161957_drop_email_to_customers_table', 1),
('2016_11_01_110634_add_percent_to_order_table', 1),
('2016_11_08_101643_create_frame_attribute_table', 1),
('2016_11_08_101736_create_frame_raiting_table', 1),
('2016_11_08_101815_create_comment_frame_table', 1),
('2016_11_08_110221_change_product_colum_11_08_table', 1),
('2016_11_08_110804_create_frame_category_table', 1),
('2016_11_11_173457_create_related_products_table', 1),
('2016_11_12_121146_create_table_group_attribute', 1),
('2016_11_15_111954_change_points_to_custumers_table', 1),
('2016_11_21_101042_add_username_to_permissions_table', 1),
('2016_11_22_091143_change_col_and_drop_group_attribute', 1),
('2016_11_22_105822_create_config_district_table', 1),
('2016_11_23_134859_create_table_relation_product', 1),
('2016_11_23_134936_create_table_relation_frame', 1),
('2016_11_23_141634_create_table_folder_attributes', 1),
('2016_11_25_101345_add_status_to_relationframe', 1),
('2016_11_25_101423_add_status_to_relationproduct', 1),
('2016_11_25_101513_add_status_to_folder_attributes', 1),
('2016_11_25_133902_add_number_hidden_to_folder_attibutes', 1),
('2016_11_25_164145_add_columne_content_to_group_attributes', 1),
('2016_11_29_103436_add_product_id_to_frame_attributes', 1),
('2016_07_20_140025_add_col_to_attribute', 2),
('2016_11_29_145124_add_col_assurance_to_Frame', 3),
('2016_11_29_155543_add_col_file_to_Frame', 4);

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
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `total_weight` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `district_id` int(11) NOT NULL,
  `price_district` int(11) NOT NULL,
  `percent` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `add_1` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `add_2` varchar(255) COLLATE utf8_unicode_ci NOT NULL
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
  `price_sale` int(11) NOT NULL,
  `weight` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `frame_id` int(11) NOT NULL,
  `transpost` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_logs`
--

CREATE TABLE IF NOT EXISTS `order_logs` (
  `id` int(10) unsigned NOT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `status` int(11) NOT NULL,
  `note_stick` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
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
  `updated_at` timestamp NULL DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `key`, `created_at`, `updated_at`, `username`, `status`) VALUES
(1, 'Đăng bài viết', 'dang_bai_viet', '2016-11-29 06:47:57', '2016-11-29 07:10:28', 'Đăng bài viết', 0),
(2, 'Sửa bài viết', 'sua_bai_viet', '2016-11-29 06:47:57', '2016-11-29 07:10:28', 'Sửa bài viết', 0),
(3, 'Lưu bài viết', 'luu_bai_viet', '2016-11-29 06:47:57', '2016-11-29 07:10:28', 'Lưu bài viết', 0),
(4, 'Xóa bài viết', 'xoa_bai_viet', '2016-11-29 06:47:57', '2016-11-29 07:10:28', 'Xóa bài viết', 0),
(5, 'Thêm danh mục bài viết', 'them_danh_muc_bai_viet', '2016-11-29 06:47:57', '2016-11-29 07:10:28', 'Thêm danh mục bài viết', 0),
(6, 'Sửa danh mục bài viết', 'sua_danh_muc_bai_viet', '2016-11-29 06:47:57', '2016-11-29 07:10:28', 'Sửa danh mục bài viết', 0),
(7, 'Xóa danh mục bài viết', 'xoa_danh_muc_bai_viet', '2016-11-29 06:47:57', '2016-11-29 07:10:28', 'Xóa danh mục bài viết', 0),
(8, 'Quản lý tags bài viết', 'quan_ly_tags_bai_viet', '2016-11-29 06:47:57', '2016-11-29 07:10:28', 'Quản lý tags bài viết', 0),
(9, 'Đăng sản phẩm', 'them_san_pham', '2016-11-29 06:47:57', '2016-11-29 07:10:28', 'Đăng sản phẩm', 0),
(10, 'Sửa sản phẩm', 'sua_san_pham', '2016-11-29 06:47:57', '2016-11-29 07:10:28', 'Sửa sản phẩm', 0),
(11, 'Lưu sản phẩm', 'luu_san_pham', '2016-11-29 06:47:57', '2016-11-29 07:10:28', 'Lưu sản phẩm', 0),
(12, 'Xóa sản phẩm', 'xoa_san_pham', '2016-11-29 06:47:57', '2016-11-29 07:10:28', 'Xóa sản phẩm', 0),
(13, 'Thêm danh mục sản phẩm', 'them_danh_muc_san_pham', '2016-11-29 06:47:57', '2016-11-29 07:10:28', 'Thêm danh mục sản phẩm', 0),
(14, 'Sửa danh mục sản phẩm', 'sua_danh_muc_san_pham', '2016-11-29 06:47:57', '2016-11-29 07:10:28', 'Sửa danh mục sản phẩm', 0),
(15, 'Xóa danh mục sản phẩm', 'xoa_danh_muc_san_pham', '2016-11-29 06:47:57', '2016-11-29 07:10:28', 'Xóa danh mục sản phẩm', 0),
(16, 'Quản lý tags sản phẩm', 'quan_ly_tags_san_pham', '2016-11-29 06:47:57', '2016-11-29 07:10:28', 'Quản lý tags sản phẩm', 0),
(17, 'Thêm slide', 'them_slide', '2016-11-29 06:47:57', '2016-11-29 07:10:28', 'Thêm slide', 0),
(18, 'Sửa slide', 'sua_slide', '2016-11-29 06:47:57', '2016-11-29 07:10:28', 'Sửa slide', 0),
(19, 'Xóa slide', 'xoa_slide', '2016-11-29 06:47:57', '2016-11-29 07:10:28', 'Xóa slide', 0),
(20, 'Tạo menu', 'tao_menu', '2016-11-29 06:47:57', '2016-11-29 07:10:28', 'Tạo menu', 0),
(21, 'Sửa menu', 'sua_menu', '2016-11-29 06:47:57', '2016-11-29 07:10:28', 'Sửa menu', 0),
(22, 'Xóa menu', 'xoa_menu', '2016-11-29 06:47:57', '2016-11-29 07:10:28', 'Xóa menu', 0),
(23, 'Thêm layout', 'them_layout', '2016-11-29 06:47:57', '2016-11-29 07:10:28', 'Thêm layout', 0),
(24, 'Sửa layout', 'sua_layout', '2016-11-29 06:47:57', '2016-11-29 07:10:28', 'Sửa layout', 0),
(25, 'Thêm thành viên', 'them_thanh_vien', '2016-11-29 06:47:57', '2016-11-29 07:10:28', 'Thêm thành viên', 0),
(26, 'Sửa thành viên', 'sua_thanh_vien', '2016-11-29 06:47:57', '2016-11-29 07:10:28', 'Sửa thành viên', 0),
(27, 'Xóa thành viên', 'xoa_thanh_vien', '2016-11-29 06:47:57', '2016-11-29 07:10:28', 'Xóa thành viên', 0),
(28, 'Phân quyền thành viên', 'phan_quyen_thanh_vien', '2016-11-29 06:47:57', '2016-11-29 07:10:28', 'Phân quyền thành viên', 0),
(29, 'Xem liên hệ', 'xem_lien_he', '2016-11-29 06:47:57', '2016-11-29 07:10:28', 'Xem liên hệ', 0),
(30, 'Xóa liên hệ', 'xoa_lien_he', '2016-11-29 06:47:57', '2016-11-29 07:10:28', 'Xóa liên hệ', 0),
(31, 'Thêm Đơn Hàng', 'them_don_hang', '2016-11-29 06:47:57', '2016-11-29 07:10:28', 'Thêm Đơn Hàng', 0),
(32, 'Xóa Đơn Hàng', 'xoa_don_hang', '2016-11-29 06:47:57', '2016-11-29 07:10:28', 'Xóa Đơn Hàng', 0),
(33, 'Xem Đơn Hàng', 'xem_don_hang', '2016-11-29 06:47:57', '2016-11-29 07:10:28', 'Xem Đơn Hàng', 0),
(34, 'Xử Lí Đơn Hàng', 'xu_li_don_hang', '2016-11-29 06:47:57', '2016-11-29 07:10:28', 'Xử Lí Đơn Hàng', 0),
(35, 'Quản lý bình luận bài viết', 'quan_ly_binh_luan_bai_viet', '2016-11-29 06:47:58', '2016-11-29 07:10:28', 'Quản lý bình luận bài viết', 0),
(36, 'Quản lý bình luận sản phẩm', 'quan_ly_binh_luan_san_pham', '2016-11-29 06:47:58', '2016-11-29 07:10:28', 'Quản lý bình luận sản phẩm', 0),
(37, 'Thêm Thuộc Tính', 'them_thuoc_tinh', '2016-11-29 06:47:58', '2016-11-29 07:10:28', 'Thêm Thuộc Tính', 0),
(38, 'Sửa Thuộc Tính', 'sua_thuoc_tinh', '2016-11-29 06:47:58', '2016-11-29 07:10:28', 'Sửa Thuộc Tính', 0),
(39, 'Xóa Thuộc Tính', 'xoa_thuoc_tinh', '2016-11-29 06:47:58', '2016-11-29 07:10:28', 'Xóa Thuộc Tính', 0);

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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permission_admin`
--

INSERT INTO `permission_admin` (`id`, `admin_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(10, 2, 10, NULL, NULL),
(11, 2, 11, NULL, NULL),
(12, 2, 12, NULL, NULL),
(13, 2, 13, NULL, NULL),
(14, 2, 14, NULL, NULL),
(15, 2, 15, NULL, NULL),
(31, 2, 37, NULL, NULL),
(32, 2, 38, NULL, NULL),
(33, 2, 39, NULL, NULL);

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
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `sku` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `short_description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` text COLLATE utf8_unicode_ci NOT NULL,
  `price_sale` text COLLATE utf8_unicode_ci NOT NULL,
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
  `weight` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `youtube_link` text COLLATE utf8_unicode_ci NOT NULL,
  `attribute_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `sku`, `img`, `short_description`, `price`, `price_sale`, `description`, `status`, `created_at`, `updated_at`, `code_product`, `label`, `create_by`, `last_edit_by`, `rating`, `number_rate`, `thumb_images`, `weight`, `youtube_link`, `attribute_id`) VALUES
(1, '', '', '', '', '', '[]', '[]', '', '0', '2016-11-29 08:03:26', '2016-11-29 08:03:27', '', '', 2, 2, '0.00', 0, '', '', '', 0),
(2, '', '', '', '', '', '[]', '[]', '', '0', '2016-11-29 09:03:28', '2016-11-29 09:03:29', '', '', 2, 2, '0.00', 0, '', '', '', 0),
(3, '', '', '', '', '', '[]', '[]', '', '0', '2016-11-29 09:50:52', '2016-11-29 09:50:53', '', '', 2, 2, '0.00', 0, '', '', '', 0),
(4, '', '', '', '', '', '[]', '[]', '', '0', '2016-11-30 02:25:15', '2016-11-30 02:25:16', '', '', 2, 2, '0.00', 0, '', '', '', 0);

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
-- Table structure for table `province`
--

CREATE TABLE IF NOT EXISTS `province` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `price` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `related_products`
--

CREATE TABLE IF NOT EXISTS `related_products` (
  `id` int(10) unsigned NOT NULL,
  `frame_id` int(10) unsigned NOT NULL,
  `frame_related` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `relation_frame`
--

CREATE TABLE IF NOT EXISTS `relation_frame` (
  `id` int(10) unsigned NOT NULL,
  `frame_id` int(10) unsigned NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `relation_product`
--

CREATE TABLE IF NOT EXISTS `relation_product` (
  `id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` int(11) NOT NULL
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
  `email_order` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_hethang` varchar(255) COLLATE utf8_unicode_ci NOT NULL
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
-- Table structure for table `tagFs`
--

CREATE TABLE IF NOT EXISTS `tagFs` (
  `id` int(10) unsigned NOT NULL,
  `tag` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
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
-- Table structure for table `tag_Frames`
--

CREATE TABLE IF NOT EXISTS `tag_Frames` (
  `id` int(10) unsigned NOT NULL,
  `tag_id` int(11) NOT NULL,
  `frame_id` int(11) NOT NULL,
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

-- --------------------------------------------------------

--
-- Table structure for table `ward`
--

CREATE TABLE IF NOT EXISTS `ward` (
  `id` int(10) unsigned NOT NULL,
  `wardid` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `location` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `districtid` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
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
-- Indexes for table `comment_frames`
--
ALTER TABLE `comment_frames`
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
-- Indexes for table `configure_discounts`
--
ALTER TABLE `configure_discounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `config_districs`
--
ALTER TABLE `config_districs`
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
-- Indexes for table `content_frames`
--
ALTER TABLE `content_frames`
  ADD PRIMARY KEY (`id`),
  ADD KEY `content_frames_frame_id_foreign` (`frame_id`);

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
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `district`
--
ALTER TABLE `district`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_generals`
--
ALTER TABLE `email_generals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_out_of_stocks`
--
ALTER TABLE `email_out_of_stocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_preferences`
--
ALTER TABLE `email_preferences`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `folder_attributes`
--
ALTER TABLE `folder_attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `folder_attributes_attribute_id_foreign` (`attribute_id`),
  ADD KEY `folder_attributes_group_id_foreign` (`group_id`);

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
-- Indexes for table `frames`
--
ALTER TABLE `frames`
  ADD PRIMARY KEY (`id`),
  ADD KEY `frames_product_id_foreign` (`product_id`);

--
-- Indexes for table `frame_attributes`
--
ALTER TABLE `frame_attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `frame_attributes_frame_id_foreign` (`frame_id`),
  ADD KEY `frame_attributes_attribute_id_foreign` (`attribute_id`);

--
-- Indexes for table `frame_categorys`
--
ALTER TABLE `frame_categorys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `frame_images`
--
ALTER TABLE `frame_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `frame_images_frame_id_foreign` (`frame_id`);

--
-- Indexes for table `frame_raitings`
--
ALTER TABLE `frame_raitings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `frame_raitings_frame_id_foreign` (`frame_id`);

--
-- Indexes for table `group_attributes`
--
ALTER TABLE `group_attributes`
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
-- Indexes for table `order_logs`
--
ALTER TABLE `order_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_logs_order_id_foreign` (`order_id`);

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
-- Indexes for table `province`
--
ALTER TABLE `province`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `related_products`
--
ALTER TABLE `related_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `related_products_frame_id_foreign` (`frame_id`),
  ADD KEY `related_products_frame_related_foreign` (`frame_related`);

--
-- Indexes for table `relation_frame`
--
ALTER TABLE `relation_frame`
  ADD PRIMARY KEY (`id`),
  ADD KEY `relation_frame_frame_id_foreign` (`frame_id`),
  ADD KEY `relation_frame_group_id_foreign` (`group_id`);

--
-- Indexes for table `relation_product`
--
ALTER TABLE `relation_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `relation_product_product_id_foreign` (`product_id`),
  ADD KEY `relation_product_group_id_foreign` (`group_id`);

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
-- Indexes for table `tagFs`
--
ALTER TABLE `tagFs`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `tag_Frames`
--
ALTER TABLE `tag_Frames`
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
-- Indexes for table `ward`
--
ALTER TABLE `ward`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
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
-- AUTO_INCREMENT for table `comment_frames`
--
ALTER TABLE `comment_frames`
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
-- AUTO_INCREMENT for table `configure_discounts`
--
ALTER TABLE `configure_discounts`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `config_districs`
--
ALTER TABLE `config_districs`
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
-- AUTO_INCREMENT for table `content_frames`
--
ALTER TABLE `content_frames`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `content_products`
--
ALTER TABLE `content_products`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `district`
--
ALTER TABLE `district`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `email_generals`
--
ALTER TABLE `email_generals`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `email_out_of_stocks`
--
ALTER TABLE `email_out_of_stocks`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `email_preferences`
--
ALTER TABLE `email_preferences`
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
-- AUTO_INCREMENT for table `folder_attributes`
--
ALTER TABLE `folder_attributes`
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
-- AUTO_INCREMENT for table `frames`
--
ALTER TABLE `frames`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `frame_attributes`
--
ALTER TABLE `frame_attributes`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `frame_categorys`
--
ALTER TABLE `frame_categorys`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `frame_images`
--
ALTER TABLE `frame_images`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `frame_raitings`
--
ALTER TABLE `frame_raitings`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `group_attributes`
--
ALTER TABLE `group_attributes`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `group_layouts`
--
ALTER TABLE `group_layouts`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `layouts`
--
ALTER TABLE `layouts`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
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
-- AUTO_INCREMENT for table `order_logs`
--
ALTER TABLE `order_logs`
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
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=34;
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
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
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
-- AUTO_INCREMENT for table `province`
--
ALTER TABLE `province`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `related_products`
--
ALTER TABLE `related_products`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `relation_frame`
--
ALTER TABLE `relation_frame`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `relation_product`
--
ALTER TABLE `relation_product`
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
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `slide_types`
--
ALTER TABLE `slide_types`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
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
-- AUTO_INCREMENT for table `tagFs`
--
ALTER TABLE `tagFs`
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
-- AUTO_INCREMENT for table `tag_Frames`
--
ALTER TABLE `tag_Frames`
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
-- AUTO_INCREMENT for table `ward`
--
ALTER TABLE `ward`
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
-- Constraints for table `content_frames`
--
ALTER TABLE `content_frames`
  ADD CONSTRAINT `content_frames_frame_id_foreign` FOREIGN KEY (`frame_id`) REFERENCES `frames` (`id`) ON DELETE CASCADE;

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
-- Constraints for table `folder_attributes`
--
ALTER TABLE `folder_attributes`
  ADD CONSTRAINT `folder_attributes_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `folder_attributes_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `group_attributes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `frames`
--
ALTER TABLE `frames`
  ADD CONSTRAINT `frames_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `frame_attributes`
--
ALTER TABLE `frame_attributes`
  ADD CONSTRAINT `frame_attributes_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `frame_attributes_frame_id_foreign` FOREIGN KEY (`frame_id`) REFERENCES `frames` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `frame_images`
--
ALTER TABLE `frame_images`
  ADD CONSTRAINT `frame_images_frame_id_foreign` FOREIGN KEY (`frame_id`) REFERENCES `frames` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `frame_raitings`
--
ALTER TABLE `frame_raitings`
  ADD CONSTRAINT `frame_raitings_frame_id_foreign` FOREIGN KEY (`frame_id`) REFERENCES `frames` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_logs`
--
ALTER TABLE `order_logs`
  ADD CONSTRAINT `order_logs_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

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
-- Constraints for table `related_products`
--
ALTER TABLE `related_products`
  ADD CONSTRAINT `related_products_frame_id_foreign` FOREIGN KEY (`frame_id`) REFERENCES `frames` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `related_products_frame_related_foreign` FOREIGN KEY (`frame_related`) REFERENCES `frames` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `relation_frame`
--
ALTER TABLE `relation_frame`
  ADD CONSTRAINT `relation_frame_frame_id_foreign` FOREIGN KEY (`frame_id`) REFERENCES `frames` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `relation_frame_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `group_attributes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `relation_product`
--
ALTER TABLE `relation_product`
  ADD CONSTRAINT `relation_product_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `group_attributes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `relation_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tab_attributes`
--
ALTER TABLE `tab_attributes`
  ADD CONSTRAINT `tab_attributes_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tab_attributes_content_products_id_foreign` FOREIGN KEY (`content_products_id`) REFERENCES `content_products` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
