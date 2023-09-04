-- phpMyAdmin SQL Dump
-- version 5.2.0-rc1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 04, 2023 at 01:52 AM
-- Server version: 5.7.33
-- PHP Version: 8.1.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `weather-app`
--

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lat` double DEFAULT NULL,
  `lon` double DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `lat`, `lon`, `country`, `created_at`, `updated_at`) VALUES
(5, 'Dubai', 25.2582, 55.3047, 'AE', '2023-09-03 14:17:30', '2023-09-03 14:17:30'),
(6, 'Abu Dhabi', 24.4667, 54.3667, 'AE', '2023-09-03 14:17:51', '2023-09-03 14:17:51'),
(7, 'Sharjah', 25.3573, 55.4033, 'AE', '2023-09-03 14:31:18', '2023-09-03 14:31:18'),
(8, 'London', 51.5085, -0.1257, 'GB', '2023-09-03 14:31:24', '2023-09-03 14:31:24'),
(9, 'New York', 40.7143, -74.006, 'US', '2023-09-03 14:31:32', '2023-09-03 14:31:32'),
(10, 'Tokyo', 35.6895, 139.6917, 'JP', '2023-09-03 14:31:38', '2023-09-03 14:31:38');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_08_30_140228_create_cities_table', 1),
(6, '2023_08_30_141900_create_weather_reports_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `weather_reports`
--

CREATE TABLE `weather_reports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `city_id` bigint(20) UNSIGNED NOT NULL,
  `weather_condition` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weather_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weather_icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weather_icon_svg` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `temp_cel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feels_like_cel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pressure` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `humidity` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wind_speed_km` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wind_speed_deg` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `temp_min` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `temp_max` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `weather_reports`
--

INSERT INTO `weather_reports` (`id`, `city_id`, `weather_condition`, `weather_description`, `weather_icon`, `weather_icon_svg`, `temp_cel`, `feels_like_cel`, `pressure`, `humidity`, `wind_speed_km`, `wind_speed_deg`, `temp_min`, `temp_max`, `created_at`, `updated_at`) VALUES
(1, 5, 'Clear', 'clear sky', '01n', 'clear.svg', '36', '40', '1002', '46', '11.12', '40', '306.29', '309.11', '2023-09-03 13:29:01', '2023-09-03 14:29:01'),
(2, 6, 'Clear', 'clear sky', '01n', 'clear.svg', '35', '42', '1002', '60', '11.12', '10', '307.16', '308.68', '2023-09-03 13:29:01', '2023-09-03 14:29:01'),
(3, 5, 'Clear', 'clear sky', '01n', 'clear.svg', '36', '40', '1002', '46', '11.12', '40', '306.29', '309.11', '2023-09-03 14:30:02', '2023-09-03 14:30:02'),
(4, 6, 'Clear', 'clear sky', '01n', 'clear.svg', '35', '42', '1002', '60', '11.12', '10', '307.16', '308.68', '2023-09-03 14:30:03', '2023-09-03 14:30:03'),
(5, 5, 'Clear', 'clear sky', '01n', 'clear.svg', '36', '40', '1002', '46', '11.12', '40', '306.29', '309.11', '2023-09-03 14:40:01', '2023-09-03 14:40:01'),
(6, 6, 'Clear', 'clear sky', '01n', 'clear.svg', '35', '42', '1002', '59', '11.12', '10', '307.16', '308.68', '2023-09-03 14:40:01', '2023-09-03 14:40:01'),
(7, 7, 'Clear', 'clear sky', '01n', 'clear.svg', '34', '39', '1002', '55', '11.12', '40', '306.31', '309.14', '2023-09-03 14:40:01', '2023-09-03 14:40:01'),
(8, 8, 'Clouds', 'overcast clouds', '04n', NULL, '20', '20', '1025', '83', '14.83', '90', '290.64', '294.27', '2023-09-03 14:40:01', '2023-09-03 14:40:01'),
(9, 9, 'Clouds', 'scattered clouds', '03d', 'cloudy.svg', '32', '33', '1012', '46', '16.67', '310', '302.85', '306.64', '2023-09-03 14:40:02', '2023-09-03 14:40:02'),
(10, 10, 'Clouds', 'broken clouds', '04d', 'cloudy.svg', '25', '27', '1010', '97', '24.08', '10', '296.9', '300.12', '2023-09-03 14:40:02', '2023-09-03 14:40:02'),
(11, 5, 'Clear', 'clear sky', '01n', 'clear.svg', '36', '40', '1002', '46', '11.12', '40', '306.29', '309.11', '2023-09-03 14:50:00', '2023-09-03 14:50:00'),
(12, 6, 'Clear', 'clear sky', '01n', 'clear.svg', '35', '42', '1002', '59', '11.12', '10', '307.16', '308.68', '2023-09-03 14:50:01', '2023-09-03 14:50:01'),
(13, 7, 'Clear', 'clear sky', '01n', 'clear.svg', '34', '39', '1002', '55', '11.12', '40', '306.31', '309.14', '2023-09-03 14:50:01', '2023-09-03 14:50:01'),
(14, 8, 'Clouds', 'overcast clouds', '04n', NULL, '20', '20', '1025', '84', '12.96', '100', '290.62', '293.98', '2023-09-03 14:50:01', '2023-09-03 14:50:01'),
(15, 9, 'Clouds', 'scattered clouds', '03d', 'cloudy.svg', '32', '33', '1012', '47', '20.92', '314', '302.29', '306.63', '2023-09-03 14:50:02', '2023-09-03 14:50:02'),
(16, 10, 'Clouds', 'broken clouds', '04d', 'cloudy.svg', '25', '26', '1010', '97', '24.08', '10', '296.9', '300.12', '2023-09-03 14:50:02', '2023-09-03 14:50:02'),
(17, 5, 'Clear', 'clear sky', '01n', 'clear.svg', '36', '40', '1002', '46', '11.12', '40', '306.29', '309.11', '2023-09-03 15:00:01', '2023-09-03 15:00:01'),
(18, 6, 'Clear', 'clear sky', '01n', 'clear.svg', '35', '42', '1002', '58', '11.12', '10', '307.16', '308.68', '2023-09-03 15:00:01', '2023-09-03 15:00:01'),
(19, 7, 'Clear', 'clear sky', '01n', 'clear.svg', '32', '39', '1002', '70', '10.08', '34', '304.88', '304.88', '2023-09-03 15:00:01', '2023-09-03 15:00:01'),
(20, 8, 'Clouds', 'overcast clouds', '04n', NULL, '20', '20', '1025', '85', '12.96', '100', '290.03', '293.98', '2023-09-03 15:00:01', '2023-09-03 15:00:01'),
(21, 9, 'Clouds', 'scattered clouds', '03d', 'cloudy.svg', '32', '34', '1012', '48', '12.96', '260', '302.03', '306.63', '2023-09-03 15:00:02', '2023-09-03 15:00:02'),
(22, 10, 'Clouds', 'broken clouds', '04d', 'cloudy.svg', '25', '26', '1010', '97', '24.08', '20', '296.9', '298.94', '2023-09-03 15:00:02', '2023-09-03 15:00:02'),
(23, 5, 'Clear', 'clear sky', '01n', 'clear.svg', '36', '40', '1002', '46', '11.12', '40', '306.29', '309.11', '2023-09-03 15:10:01', '2023-09-03 15:10:01'),
(24, 6, 'Clear', 'clear sky', '01n', 'clear.svg', '35', '42', '1002', '58', '11.12', '10', '307.16', '308.68', '2023-09-03 15:10:01', '2023-09-03 15:10:01'),
(25, 7, 'Clear', 'clear sky', '01n', 'clear.svg', '32', '39', '1002', '70', '10.08', '34', '304.88', '304.88', '2023-09-03 15:10:01', '2023-09-03 15:10:01'),
(26, 8, 'Clouds', 'overcast clouds', '04n', NULL, '20', '20', '1025', '85', '12.96', '100', '290.03', '293.98', '2023-09-03 15:10:01', '2023-09-03 15:10:01'),
(27, 9, 'Clouds', 'few clouds', '02d', 'cloudy_rainny.svg', '32', '33', '1012', '48', '22.21', '270', '301.47', '307.09', '2023-09-03 15:10:02', '2023-09-03 15:10:02'),
(28, 10, 'Rain', 'light intensity shower rain', '09d', NULL, '25', '26', '1010', '97', '24.08', '20', '296.82', '298.94', '2023-09-03 15:10:02', '2023-09-03 15:10:02'),
(29, 5, 'Clear', 'clear sky', '01n', 'clear.svg', '35', '41', '1001', '55', '11.12', '60', '305.29', '308.11', '2023-09-03 15:20:01', '2023-09-03 15:20:01'),
(30, 6, 'Clear', 'clear sky', '01n', 'clear.svg', '35', '42', '1002', '56', '11.12', '10', '307.16', '308.68', '2023-09-03 15:20:01', '2023-09-03 15:20:01'),
(31, 7, 'Clear', 'clear sky', '01n', 'clear.svg', '33', '37', '1002', '58', '11.12', '60', '305.31', '308.14', '2023-09-03 15:20:01', '2023-09-03 15:20:01'),
(32, 8, 'Clouds', 'overcast clouds', '04n', NULL, '19', '20', '1025', '85', '9.25', '80', '290.03', '293.98', '2023-09-03 15:20:01', '2023-09-03 15:20:01'),
(33, 9, 'Clouds', 'few clouds', '02d', 'cloudy_rainny.svg', '32', '33', '1012', '48', '22.21', '270', '301.47', '307.09', '2023-09-03 15:20:02', '2023-09-03 15:20:02'),
(34, 10, 'Rain', 'light intensity shower rain', '09d', NULL, '25', '26', '1010', '97', '25.92', '30', '296.82', '298.94', '2023-09-03 15:20:02', '2023-09-03 15:20:02'),
(35, 5, 'Clear', 'clear sky', '01n', 'clear.svg', '35', '41', '1001', '55', '11.12', '60', '305.29', '308.11', '2023-09-03 15:30:01', '2023-09-03 15:30:01'),
(36, 6, 'Clear', 'clear sky', '01n', 'clear.svg', '35', '42', '1002', '57', '11.12', '10', '307.16', '308.68', '2023-09-03 15:30:01', '2023-09-03 15:30:01'),
(37, 7, 'Clear', 'clear sky', '01n', 'clear.svg', '33', '37', '1002', '58', '11.12', '60', '305.31', '308.14', '2023-09-03 15:30:01', '2023-09-03 15:30:01'),
(38, 8, 'Clouds', 'overcast clouds', '04n', NULL, '19', '20', '1025', '85', '9.25', '80', '290.03', '293.98', '2023-09-03 15:30:02', '2023-09-03 15:30:02'),
(39, 9, 'Clouds', 'few clouds', '02d', 'cloudy_rainny.svg', '32', '34', '1012', '49', '22.21', '270', '301.74', '306.09', '2023-09-03 15:30:02', '2023-09-03 15:30:02'),
(40, 10, 'Rain', 'light intensity shower rain', '09d', NULL, '25', '26', '1010', '97', '25.92', '30', '296.9', '300.12', '2023-09-03 15:30:02', '2023-09-03 15:30:02'),
(41, 5, 'Clear', 'clear sky', '01n', 'clear.svg', '35', '41', '1001', '55', '11.12', '60', '305.29', '308.11', '2023-09-03 15:40:01', '2023-09-03 15:40:01'),
(42, 6, 'Clear', 'clear sky', '01n', 'clear.svg', '35', '42', '1002', '57', '11.12', '10', '307.16', '308.68', '2023-09-03 15:40:01', '2023-09-03 15:40:01'),
(43, 7, 'Clear', 'clear sky', '01n', 'clear.svg', '33', '37', '1002', '58', '11.12', '60', '305.31', '308.14', '2023-09-03 15:40:01', '2023-09-03 15:40:01'),
(44, 8, 'Clouds', 'overcast clouds', '04n', NULL, '19', '19', '1025', '86', '7.42', '60', '289.49', '293.32', '2023-09-03 15:40:01', '2023-09-03 15:40:01'),
(45, 9, 'Clouds', 'few clouds', '02d', 'cloudy_rainny.svg', '32', '34', '1012', '49', '22.21', '270', '301.74', '306.09', '2023-09-03 15:40:02', '2023-09-03 15:40:02'),
(46, 10, 'Rain', 'light intensity shower rain', '09d', NULL, '25', '26', '1010', '97', '25.92', '30', '296.9', '300.12', '2023-09-03 15:40:02', '2023-09-03 15:40:02'),
(47, 5, 'Clear', 'clear sky', '01n', 'clear.svg', '35', '41', '1001', '55', '11.12', '60', '305.29', '308.11', '2023-09-03 15:50:01', '2023-09-03 15:50:01'),
(48, 6, 'Clear', 'clear sky', '01n', 'clear.svg', '35', '42', '1002', '57', '11.12', '10', '307.16', '308.68', '2023-09-03 15:50:01', '2023-09-03 15:50:01'),
(49, 7, 'Clear', 'clear sky', '01n', 'clear.svg', '33', '37', '1002', '58', '11.12', '60', '305.31', '308.14', '2023-09-03 15:50:01', '2023-09-03 15:50:01'),
(50, 8, 'Clouds', 'overcast clouds', '04n', NULL, '19', '19', '1025', '87', '7.42', '60', '289.47', '293.3', '2023-09-03 15:50:01', '2023-09-03 15:50:01'),
(51, 9, 'Clouds', 'few clouds', '02d', 'cloudy_rainny.svg', '32', '33', '1012', '49', '22.21', '270', '301.46', '306.09', '2023-09-03 15:50:02', '2023-09-03 15:50:02'),
(52, 10, 'Rain', 'light intensity shower rain', '09d', NULL, '25', '27', '1010', '97', '22.21', '20', '296.9', '300.12', '2023-09-03 15:50:02', '2023-09-03 15:50:02'),
(53, 5, 'Clear', 'clear sky', '01n', 'clear.svg', '33', '38', '1001', '58', '11.12', '90', '304.29', '306.11', '2023-09-03 17:50:01', '2023-09-03 17:50:01'),
(54, 6, 'Clear', 'clear sky', '01n', 'clear.svg', '34', '41', '1001', '66', '9.25', '40', '306.16', '308.12', '2023-09-03 17:50:01', '2023-09-03 17:50:01'),
(55, 7, 'Clear', 'clear sky', '01n', 'clear.svg', '32', '36', '1002', '62', '11.12', '90', '304.31', '306.14', '2023-09-03 17:50:01', '2023-09-03 17:50:01'),
(56, 8, 'Haze', 'haze', '50n', NULL, '18', '18', '1026', '90', '7.42', '80', '288.02', '291.75', '2023-09-03 17:50:01', '2023-09-03 17:50:01'),
(57, 9, 'Clear', 'clear sky', '01n', 'clear.svg', '30', '31', '1012', '54', '12.96', '310', '297.73', '304.46', '2023-09-03 17:50:02', '2023-09-03 17:50:02'),
(58, 10, 'Rain', 'light intensity shower rain', '09d', NULL, '26', '27', '1010', '97', '18.5', '360', '297.38', '300.68', '2023-09-03 17:50:02', '2023-09-03 17:50:02'),
(59, 5, 'Clear', 'clear sky', '01n', 'clear.svg', '33', '38', '1001', '58', '11.12', '90', '304.29', '306.11', '2023-09-03 18:00:01', '2023-09-03 18:00:01'),
(60, 6, 'Clear', 'clear sky', '01n', 'clear.svg', '34', '41', '1001', '66', '9.25', '40', '306.16', '308.12', '2023-09-03 18:00:01', '2023-09-03 18:00:01'),
(61, 7, 'Clear', 'clear sky', '01n', 'clear.svg', '32', '36', '1002', '62', '11.12', '90', '304.31', '306.14', '2023-09-03 18:00:01', '2023-09-03 18:00:01'),
(62, 8, 'Haze', 'haze', '50n', NULL, '18', '18', '1026', '90', '7.42', '80', '288.02', '291.75', '2023-09-03 18:00:01', '2023-09-03 18:00:01'),
(63, 9, 'Clear', 'clear sky', '01n', 'clear.svg', '29', '30', '1012', '55', '12.96', '310', '297.56', '304.12', '2023-09-03 18:00:02', '2023-09-03 18:00:02'),
(64, 10, 'Rain', 'light intensity shower rain', '09d', NULL, '26', '27', '1010', '97', '18.5', '360', '297.38', '299.14', '2023-09-03 18:00:05', '2023-09-03 18:00:05'),
(65, 5, 'Clear', 'clear sky', '01n', 'clear.svg', '33', '38', '1001', '58', '14.83', '110', '303.31', '306.11', '2023-09-03 18:10:01', '2023-09-03 18:10:01'),
(66, 6, 'Clear', 'clear sky', '01n', 'clear.svg', '34', '41', '1001', '66', '9.25', '40', '306.16', '307.56', '2023-09-03 18:10:01', '2023-09-03 18:10:01'),
(67, 7, 'Clear', 'clear sky', '01n', 'clear.svg', '32', '36', '1002', '62', '11.12', '90', '304.31', '306.14', '2023-09-03 18:10:01', '2023-09-03 18:10:01'),
(68, 8, 'Haze', 'haze', '50n', NULL, '17', '18', '1026', '91', '7.42', '80', '288.02', '291.4', '2023-09-03 18:10:01', '2023-09-03 18:10:01'),
(69, 9, 'Clear', 'clear sky', '01n', 'clear.svg', '29', '30', '1012', '55', '14.83', '330', '297.01', '303.69', '2023-09-03 18:10:01', '2023-09-03 18:10:01'),
(70, 10, 'Rain', 'light intensity shower rain', '09d', NULL, '26', '27', '1010', '97', '18.5', '360', '297.46', '299.7', '2023-09-03 18:10:02', '2023-09-03 18:10:02'),
(71, 5, 'Clear', 'clear sky', '01n', 'clear.svg', '33', '38', '1001', '58', '14.83', '110', '303.31', '306.11', '2023-09-03 18:20:01', '2023-09-03 18:20:01'),
(72, 6, 'Clear', 'clear sky', '01n', 'clear.svg', '34', '41', '1002', '66', '9.25', '60', '306.16', '307.56', '2023-09-03 18:20:01', '2023-09-03 18:20:01'),
(73, 7, 'Clear', 'clear sky', '01n', 'clear.svg', '32', '36', '1002', '62', '14.83', '110', '304.31', '306.14', '2023-09-03 18:20:01', '2023-09-03 18:20:01'),
(74, 8, 'Haze', 'haze', '50n', NULL, '17', '18', '1025', '91', '7.42', '60', '288.02', '291.4', '2023-09-03 18:20:01', '2023-09-03 18:20:01'),
(75, 9, 'Clear', 'clear sky', '01n', 'clear.svg', '29', '30', '1012', '55', '14.83', '330', '296.74', '303.69', '2023-09-03 18:20:02', '2023-09-03 18:20:02'),
(76, 10, 'Clouds', 'broken clouds', '04d', 'cloudy.svg', '26', '27', '1010', '97', '18.5', '360', '297.48', '299.7', '2023-09-03 18:20:02', '2023-09-03 18:20:02'),
(77, 5, 'Clear', 'clear sky', '01n', 'clear.svg', '33', '38', '1001', '58', '14.83', '110', '303.31', '306.11', '2023-09-03 18:30:01', '2023-09-03 18:30:01'),
(78, 6, 'Clear', 'clear sky', '01n', 'clear.svg', '34', '41', '1002', '66', '9.25', '60', '306.16', '307.56', '2023-09-03 18:30:02', '2023-09-03 18:30:02'),
(79, 7, 'Clear', 'clear sky', '01n', 'clear.svg', '32', '36', '1002', '62', '14.83', '110', '304.31', '306.14', '2023-09-03 18:30:02', '2023-09-03 18:30:02'),
(80, 8, 'Haze', 'haze', '50n', NULL, '17', '18', '1025', '91', '7.42', '60', '288.02', '291.4', '2023-09-03 18:30:02', '2023-09-03 18:30:02'),
(81, 9, 'Clear', 'clear sky', '01n', 'clear.svg', '29', '30', '1012', '56', '14.83', '330', '296.22', '303.69', '2023-09-03 18:30:03', '2023-09-03 18:30:03'),
(82, 10, 'Clouds', 'broken clouds', '04d', 'cloudy.svg', '26', '27', '1010', '97', '18.5', '360', '297.62', '299.7', '2023-09-03 18:30:04', '2023-09-03 18:30:04'),
(83, 5, 'Clear', 'clear sky', '01n', 'clear.svg', '33', '38', '1001', '58', '14.83', '110', '303.31', '306.11', '2023-09-03 18:40:01', '2023-09-03 18:40:01'),
(84, 6, 'Clear', 'clear sky', '01n', 'clear.svg', '34', '41', '1002', '67', '9.25', '60', '306.16', '307.56', '2023-09-03 18:40:01', '2023-09-03 18:40:01'),
(85, 7, 'Clear', 'clear sky', '01n', 'clear.svg', '32', '36', '1002', '62', '14.83', '110', '304.31', '306.14', '2023-09-03 18:40:01', '2023-09-03 18:40:01'),
(86, 8, 'Haze', 'haze', '50n', NULL, '17', '17', '1025', '91', '9.25', '70', '287.84', '291.22', '2023-09-03 18:40:02', '2023-09-03 18:40:02'),
(87, 9, 'Clear', 'clear sky', '01n', 'clear.svg', '29', '30', '1012', '56', '14.83', '330', '296.22', '303.69', '2023-09-03 18:40:02', '2023-09-03 18:40:02'),
(88, 10, 'Clouds', 'broken clouds', '04d', 'cloudy.svg', '26', '27', '1010', '96', '18.5', '350', '297.62', '299.03', '2023-09-03 18:40:03', '2023-09-03 18:40:03'),
(89, 5, 'Clear', 'clear sky', '01n', 'clear.svg', '33', '38', '1001', '58', '14.83', '110', '303.31', '306.11', '2023-09-03 18:50:01', '2023-09-03 18:50:01'),
(90, 6, 'Clear', 'clear sky', '01n', 'clear.svg', '34', '41', '1002', '67', '9.25', '60', '306.16', '307.56', '2023-09-03 18:50:01', '2023-09-03 18:50:01'),
(91, 7, 'Clear', 'clear sky', '01n', 'clear.svg', '32', '36', '1002', '62', '14.83', '110', '304.31', '306.14', '2023-09-03 18:50:01', '2023-09-03 18:50:01'),
(92, 8, 'Haze', 'haze', '50n', NULL, '17', '17', '1025', '91', '9.25', '70', '287.84', '291.22', '2023-09-03 18:50:02', '2023-09-03 18:50:02'),
(93, 9, 'Clear', 'clear sky', '01n', 'clear.svg', '28', '29', '1012', '57', '14.83', '330', '296.22', '303.24', '2023-09-03 18:50:02', '2023-09-03 18:50:02'),
(94, 10, 'Clouds', 'broken clouds', '04d', 'cloudy.svg', '26', '27', '1010', '96', '18.5', '350', '297.62', '299.03', '2023-09-03 18:50:02', '2023-09-03 18:50:02'),
(95, 5, 'Clear', 'clear sky', '01n', 'clear.svg', '33', '38', '1001', '58', '14.83', '110', '303.31', '306.11', '2023-09-03 19:00:01', '2023-09-03 19:00:01'),
(96, 6, 'Clear', 'clear sky', '01n', 'clear.svg', '34', '41', '1002', '67', '9.25', '60', '306.16', '307.56', '2023-09-03 19:00:01', '2023-09-03 19:00:01'),
(97, 7, 'Clear', 'clear sky', '01n', 'clear.svg', '32', '36', '1002', '62', '14.83', '110', '304.31', '306.14', '2023-09-03 19:00:01', '2023-09-03 19:00:01'),
(98, 8, 'Haze', 'haze', '50n', NULL, '17', '17', '1025', '91', '9.25', '70', '287.84', '291.4', '2023-09-03 19:00:01', '2023-09-03 19:00:01'),
(99, 9, 'Clear', 'clear sky', '01n', 'clear.svg', '28', '29', '1012', '57', '14.83', '330', '296.22', '303.24', '2023-09-03 19:00:02', '2023-09-03 19:00:02'),
(100, 10, 'Clouds', 'broken clouds', '04d', 'cloudy.svg', '26', '27', '1010', '94', '16.67', '360', '297.62', '299.94', '2023-09-03 19:00:02', '2023-09-03 19:00:02'),
(101, 5, 'Clear', 'clear sky', '01n', 'clear.svg', '33', '38', '1002', '58', '12.96', '110', '303.31', '306.11', '2023-09-03 19:10:01', '2023-09-03 19:10:01'),
(102, 6, 'Clear', 'clear sky', '01n', 'clear.svg', '34', '41', '1002', '67', '9.25', '60', '306.16', '307.56', '2023-09-03 19:10:01', '2023-09-03 19:10:01'),
(103, 7, 'Clear', 'clear sky', '01n', 'clear.svg', '32', '36', '1002', '62', '12.96', '110', '304.31', '306.14', '2023-09-03 19:10:02', '2023-09-03 19:10:02'),
(104, 8, 'Haze', 'haze', '50n', NULL, '17', '17', '1025', '91', '9.25', '70', '287.84', '291.4', '2023-09-03 19:10:02', '2023-09-03 19:10:02'),
(105, 9, 'Clear', 'clear sky', '01n', 'clear.svg', '28', '29', '1012', '59', '14.83', '300', '295.63', '303.13', '2023-09-03 19:10:02', '2023-09-03 19:10:02'),
(106, 10, 'Clouds', 'broken clouds', '04d', 'cloudy.svg', '26', '28', '1010', '94', '16.67', '360', '298.03', '300.81', '2023-09-03 19:10:03', '2023-09-03 19:10:03'),
(107, 5, 'Clear', 'clear sky', '01n', 'clear.svg', '33', '38', '1002', '58', '12.96', '110', '303.31', '306.11', '2023-09-03 19:20:01', '2023-09-03 19:20:01'),
(108, 6, 'Clear', 'clear sky', '01n', 'clear.svg', '34', '41', '1002', '63', '12.96', '70', '305.21', '307.56', '2023-09-03 19:20:01', '2023-09-03 19:20:01'),
(109, 7, 'Clear', 'clear sky', '01n', 'clear.svg', '32', '36', '1002', '62', '12.96', '110', '304.31', '306.14', '2023-09-03 19:20:01', '2023-09-03 19:20:01'),
(110, 8, 'Haze', 'haze', '50n', NULL, '17', '17', '1025', '92', '11.12', '80', '288.02', '291.13', '2023-09-03 19:20:01', '2023-09-03 19:20:01'),
(111, 9, 'Clear', 'clear sky', '01n', 'clear.svg', '28', '29', '1012', '59', '14.83', '300', '295.63', '303.13', '2023-09-03 19:20:02', '2023-09-03 19:20:02'),
(112, 10, 'Clouds', 'broken clouds', '04d', 'cloudy.svg', '27', '27', '1009', '95', '18.5', '340', '298.02', '300.81', '2023-09-03 19:20:02', '2023-09-03 19:20:02'),
(113, 5, 'Clear', 'clear sky', '01n', 'clear.svg', '33', '38', '1002', '58', '12.96', '110', '303.31', '306.11', '2023-09-03 19:30:01', '2023-09-03 19:30:01'),
(114, 6, 'Clear', 'clear sky', '01n', 'clear.svg', '34', '41', '1002', '63', '12.96', '70', '305.21', '307.56', '2023-09-03 19:30:01', '2023-09-03 19:30:01'),
(115, 7, 'Clear', 'clear sky', '01n', 'clear.svg', '32', '36', '1002', '62', '12.96', '110', '304.31', '306.14', '2023-09-03 19:30:01', '2023-09-03 19:30:01'),
(116, 8, 'Haze', 'haze', '50n', NULL, '17', '17', '1025', '92', '11.12', '80', '288.02', '291.13', '2023-09-03 19:30:02', '2023-09-03 19:30:02'),
(117, 9, 'Clear', 'clear sky', '01n', 'clear.svg', '28', '29', '1012', '60', '14.83', '300', '295.07', '302.71', '2023-09-03 19:30:02', '2023-09-03 19:30:02'),
(118, 10, 'Clouds', 'broken clouds', '04d', 'cloudy.svg', '27', '27', '1009', '95', '18.5', '340', '298.03', '300.81', '2023-09-03 19:30:02', '2023-09-03 19:30:02'),
(119, 5, 'Clear', 'clear sky', '01n', 'clear.svg', '33', '38', '1002', '58', '12.96', '110', '303.31', '306.11', '2023-09-03 19:40:01', '2023-09-03 19:40:01'),
(120, 6, 'Clear', 'clear sky', '01n', 'clear.svg', '34', '41', '1002', '63', '12.96', '70', '305.21', '307.56', '2023-09-03 19:40:01', '2023-09-03 19:40:01'),
(121, 7, 'Clear', 'clear sky', '01n', 'clear.svg', '32', '36', '1002', '62', '12.96', '110', '304.31', '306.14', '2023-09-03 19:40:01', '2023-09-03 19:40:01'),
(122, 8, 'Haze', 'haze', '50n', NULL, '17', '17', '1025', '92', '11.12', '80', '288.09', '291.15', '2023-09-03 19:40:01', '2023-09-03 19:40:01'),
(123, 9, 'Clear', 'clear sky', '01n', 'clear.svg', '28', '29', '1012', '60', '14.83', '300', '295.07', '302.71', '2023-09-03 19:40:02', '2023-09-03 19:40:02'),
(124, 10, 'Clouds', 'broken clouds', '04d', 'cloudy.svg', '27', '27', '1009', '94', '18.5', '340', '298.27', '300.66', '2023-09-03 19:40:02', '2023-09-03 19:40:02'),
(125, 5, 'Clear', 'clear sky', '01n', 'clear.svg', '33', '38', '1002', '58', '12.96', '110', '303.31', '306.11', '2023-09-03 19:50:01', '2023-09-03 19:50:01'),
(126, 6, 'Clear', 'clear sky', '01n', 'clear.svg', '34', '41', '1002', '63', '12.96', '70', '305.21', '307.56', '2023-09-03 19:50:01', '2023-09-03 19:50:01'),
(127, 7, 'Clear', 'clear sky', '01n', 'clear.svg', '32', '36', '1002', '62', '12.96', '110', '304.31', '306.14', '2023-09-03 19:50:01', '2023-09-03 19:50:01'),
(128, 8, 'Haze', 'haze', '50n', NULL, '17', '17', '1025', '93', '9.25', '80', '287.86', '290.85', '2023-09-03 19:50:02', '2023-09-03 19:50:02'),
(129, 9, 'Clear', 'clear sky', '01n', 'clear.svg', '28', '29', '1012', '61', '14.83', '300', '294.9', '302.68', '2023-09-03 19:50:02', '2023-09-03 19:50:02'),
(130, 10, 'Clouds', 'broken clouds', '04d', 'cloudy.svg', '27', '31', '1009', '90', '16.67', '330', '298.29', '301.25', '2023-09-03 19:50:02', '2023-09-03 19:50:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `weather_reports`
--
ALTER TABLE `weather_reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `weather_reports_city_id_foreign` (`city_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `weather_reports`
--
ALTER TABLE `weather_reports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `weather_reports`
--
ALTER TABLE `weather_reports`
  ADD CONSTRAINT `weather_reports_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
