-- phpMyAdmin SQL Dump
-- version 5.2.1deb3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 18, 2025 at 07:18 AM
-- Server version: 8.0.43-0ubuntu0.24.04.1
-- PHP Version: 8.3.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `common_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` bigint UNSIGNED NOT NULL,
  `log_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject_id` bigint UNSIGNED DEFAULT NULL,
  `causer_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` bigint UNSIGNED DEFAULT NULL,
  `properties` json DEFAULT NULL,
  `batch_uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `event`, `subject_id`, `causer_type`, `causer_id`, `properties`, `batch_uuid`, `created_at`, `updated_at`) VALUES
(1, 'POST', 'http://127.0.0.1:8000/login', NULL, NULL, NULL, NULL, NULL, '{\"ip\": \"127.0.0.1\", \"url\": \"http://127.0.0.1:8000/login\", \"user\": {\"name\": \"Guest\", \"user_type\": \"n/a\"}, \"agent\": \"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36\", \"method\": \"POST\", \"form_data\": {\"userid\": \"superadmin\"}}', NULL, '2025-09-17 11:00:53', '2025-09-17 11:00:53'),
(2, 'POST', 'http://127.0.0.1:8000/login', NULL, NULL, NULL, 'App\\Models\\User', 1, '{\"ip\": \"127.0.0.1\", \"url\": \"http://127.0.0.1:8000/login\", \"user\": {\"name\": \"Appinion (superadmin)\", \"user_type\": \"n/a\"}, \"agent\": \"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36\", \"method\": \"POST\", \"form_data\": {\"userid\": \"superadmin\"}}', NULL, '2025-09-17 11:01:26', '2025-09-17 11:01:26'),
(3, 'POST', 'http://127.0.0.1:8000/logout', NULL, NULL, NULL, NULL, NULL, '{\"ip\": \"127.0.0.1\", \"url\": \"http://127.0.0.1:8000/logout\", \"user\": {\"name\": \"Guest\", \"user_type\": \"n/a\"}, \"agent\": \"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36\", \"method\": \"POST\", \"form_data\": []}', NULL, '2025-09-17 11:01:58', '2025-09-17 11:01:58'),
(4, 'POST', 'http://127.0.0.1:8000/login', NULL, NULL, NULL, 'App\\Models\\User', 1, '{\"ip\": \"127.0.0.1\", \"url\": \"http://127.0.0.1:8000/login\", \"user\": {\"name\": \"Appinion (superadmin)\", \"user_type\": \"n/a\"}, \"agent\": \"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36\", \"method\": \"POST\", \"form_data\": {\"userid\": \"superadmin\"}}', NULL, '2025-09-17 11:01:59', '2025-09-17 11:01:59'),
(5, 'POST', 'http://127.0.0.1:8000/login', NULL, NULL, NULL, 'App\\Models\\User', 1, '{\"ip\": \"127.0.0.1\", \"url\": \"http://127.0.0.1:8000/login\", \"user\": {\"name\": \"Appinion (superadmin)\", \"user_type\": \"n/a\"}, \"agent\": \"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36\", \"method\": \"POST\", \"form_data\": {\"userid\": \"superadmin\"}}', NULL, '2025-09-18 03:14:05', '2025-09-18 03:14:05'),
(6, 'POST', 'http://127.0.0.1:8000/logout', NULL, NULL, NULL, NULL, NULL, '{\"ip\": \"127.0.0.1\", \"url\": \"http://127.0.0.1:8000/logout\", \"user\": {\"name\": \"Guest\", \"user_type\": \"n/a\"}, \"agent\": \"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36\", \"method\": \"POST\", \"form_data\": []}', NULL, '2025-09-18 03:17:52', '2025-09-18 03:17:52'),
(7, 'POST', 'http://127.0.0.1:8000/login', NULL, NULL, NULL, 'App\\Models\\User', 1, '{\"ip\": \"127.0.0.1\", \"url\": \"http://127.0.0.1:8000/login\", \"user\": {\"name\": \"Appinion (superadmin)\", \"user_type\": \"n/a\"}, \"agent\": \"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36\", \"method\": \"POST\", \"form_data\": {\"userid\": \"superadmin\"}}', NULL, '2025-09-18 03:17:54', '2025-09-18 03:17:54'),
(8, 'POST', 'http://127.0.0.1:8000/users', NULL, NULL, NULL, 'App\\Models\\User', 1, '{\"ip\": \"127.0.0.1\", \"url\": \"http://127.0.0.1:8000/users\", \"user\": {\"name\": \"Appinion (superadmin)\", \"user_type\": \"n/a\"}, \"agent\": \"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36\", \"method\": \"POST\", \"form_data\": {\"dob\": \"2001-01-01\", \"name\": \"test 123\", \"email\": \"yamin@appinionbd.com\", \"phone\": \"01676470802\", \"userid\": \"appinion12\", \"designation\": \"test112\", \"primary_role_id\": \"2\"}}', NULL, '2025-09-18 03:39:28', '2025-09-18 03:39:28'),
(9, 'PUT', 'http://127.0.0.1:8000/users/21', NULL, NULL, NULL, 'App\\Models\\User', 1, '{\"ip\": \"127.0.0.1\", \"url\": \"http://127.0.0.1:8000/users/21\", \"user\": {\"name\": \"Appinion (superadmin)\", \"user_type\": \"n/a\"}, \"agent\": \"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36\", \"method\": \"PUT\", \"form_data\": {\"name\": \"test 123\", \"email\": \"yamin@appinionbd.com\", \"phone\": \"01676470802\", \"designation\": \"test112\"}}', NULL, '2025-09-18 03:45:45', '2025-09-18 03:45:45'),
(10, 'PUT', 'http://127.0.0.1:8000/users/21', NULL, NULL, NULL, 'App\\Models\\User', 1, '{\"ip\": \"127.0.0.1\", \"url\": \"http://127.0.0.1:8000/users/21\", \"user\": {\"name\": \"Appinion (superadmin)\", \"user_type\": \"n/a\"}, \"agent\": \"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36\", \"method\": \"PUT\", \"form_data\": {\"name\": \"test 123\", \"email\": \"yamin@appinionbd.com\", \"phone\": \"01676470802\", \"designation\": \"test112\"}}', NULL, '2025-09-18 03:46:02', '2025-09-18 03:46:02'),
(11, 'PUT', 'http://127.0.0.1:8000/users/21', NULL, NULL, NULL, 'App\\Models\\User', 1, '{\"ip\": \"127.0.0.1\", \"url\": \"http://127.0.0.1:8000/users/21\", \"user\": {\"name\": \"Appinion (superadmin)\", \"user_type\": \"n/a\"}, \"agent\": \"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36\", \"method\": \"PUT\", \"form_data\": {\"name\": \"test 123\", \"email\": \"yamin@appinionbd.com\", \"phone\": \"01676470802\", \"designation\": \"test112\"}}', NULL, '2025-09-18 03:46:02', '2025-09-18 03:46:02'),
(12, 'PUT', 'http://127.0.0.1:8000/users/21', NULL, NULL, NULL, 'App\\Models\\User', 1, '{\"ip\": \"127.0.0.1\", \"url\": \"http://127.0.0.1:8000/users/21\", \"user\": {\"name\": \"Appinion (superadmin)\", \"user_type\": \"n/a\"}, \"agent\": \"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36\", \"method\": \"PUT\", \"form_data\": {\"name\": \"test 123\", \"email\": \"yamin@appinionbd.com\", \"phone\": \"01676470802\", \"designation\": \"test112\"}}', NULL, '2025-09-18 03:46:03', '2025-09-18 03:46:03'),
(13, 'PUT', 'http://127.0.0.1:8000/users/21', NULL, NULL, NULL, 'App\\Models\\User', 1, '{\"ip\": \"127.0.0.1\", \"url\": \"http://127.0.0.1:8000/users/21\", \"user\": {\"name\": \"Appinion (superadmin)\", \"user_type\": \"n/a\"}, \"agent\": \"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36\", \"method\": \"PUT\", \"form_data\": {\"name\": \"test 123\", \"email\": \"yamin@appinionbd.com\", \"phone\": \"01676470802\", \"designation\": \"test112\"}}', NULL, '2025-09-18 03:46:04', '2025-09-18 03:46:04'),
(14, 'PUT', 'http://127.0.0.1:8000/users/21', NULL, NULL, NULL, 'App\\Models\\User', 1, '{\"ip\": \"127.0.0.1\", \"url\": \"http://127.0.0.1:8000/users/21\", \"user\": {\"name\": \"Appinion (superadmin)\", \"user_type\": \"n/a\"}, \"agent\": \"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36\", \"method\": \"PUT\", \"form_data\": {\"name\": \"test 123\", \"email\": \"yamin@appinionbd.com\", \"phone\": \"01676470802\", \"designation\": \"test112\"}}', NULL, '2025-09-18 03:46:36', '2025-09-18 03:46:36'),
(15, 'POST', 'http://127.0.0.1:8000/users', NULL, NULL, NULL, 'App\\Models\\User', 1, '{\"ip\": \"127.0.0.1\", \"url\": \"http://127.0.0.1:8000/users\", \"user\": {\"name\": \"Appinion (superadmin)\", \"user_type\": \"n/a\"}, \"agent\": \"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36\", \"method\": \"POST\", \"form_data\": {\"dob\": \"1999-01-01\", \"name\": \"Mark Peck\", \"email\": \"wamubexava@mailinator.com\", \"phone\": \"46\", \"gender\": \"1\", \"userid\": \"rejuwivuzi\", \"designation\": \"Ipsum labore nulla\", \"primary_role_id\": \"2\"}}', NULL, '2025-09-18 03:53:44', '2025-09-18 03:53:44'),
(16, 'POST', 'http://127.0.0.1:8000/users', NULL, NULL, NULL, 'App\\Models\\User', 1, '{\"ip\": \"127.0.0.1\", \"url\": \"http://127.0.0.1:8000/users\", \"user\": {\"name\": \"Appinion (superadmin)\", \"user_type\": \"n/a\"}, \"agent\": \"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36\", \"method\": \"POST\", \"form_data\": {\"dob\": \"1999-01-01\", \"name\": \"Mark Peck\", \"email\": \"wamubexava@mailinator.com\", \"phone\": \"01676470802\", \"gender\": \"1\", \"userid\": \"rejuwivuzi\", \"designation\": \"Ipsum labore nulla\", \"primary_role_id\": \"2\"}}', NULL, '2025-09-18 03:53:55', '2025-09-18 03:53:55'),
(17, 'PUT', 'http://127.0.0.1:8000/users/22', NULL, NULL, NULL, 'App\\Models\\User', 1, '{\"ip\": \"127.0.0.1\", \"url\": \"http://127.0.0.1:8000/users/22\", \"user\": {\"name\": \"Appinion (superadmin)\", \"user_type\": \"n/a\"}, \"agent\": \"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36\", \"method\": \"PUT\", \"form_data\": {\"name\": \"Mark Peck\", \"email\": \"wamubexava@mailinator.com\", \"phone\": \"01676470802\", \"designation\": \"Ipsum labore nulla\"}}', NULL, '2025-09-18 03:54:05', '2025-09-18 03:54:05'),
(18, 'POST', 'http://127.0.0.1:8000/users-bulk-upload', NULL, NULL, NULL, 'App\\Models\\User', 1, '{\"ip\": \"127.0.0.1\", \"url\": \"http://127.0.0.1:8000/users-bulk-upload\", \"user\": {\"name\": \"Appinion (superadmin)\", \"user_type\": \"n/a\"}, \"agent\": \"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36\", \"method\": \"POST\", \"form_data\": {\"user_bulk_excel\": {}}}', NULL, '2025-09-18 03:54:42', '2025-09-18 03:54:42'),
(19, 'POST', 'http://127.0.0.1:8000/users/update-status/23', NULL, NULL, NULL, 'App\\Models\\User', 1, '{\"ip\": \"127.0.0.1\", \"url\": \"http://127.0.0.1:8000/users/update-status/23\", \"user\": {\"name\": \"Appinion (superadmin)\", \"user_type\": \"n/a\"}, \"agent\": \"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36\", \"method\": \"POST\", \"form_data\": {\"toggle_input\": \"false\"}}', NULL, '2025-09-18 04:16:27', '2025-09-18 04:16:27'),
(20, 'POST', 'http://127.0.0.1:8000/users/update-status/23', NULL, NULL, NULL, 'App\\Models\\User', 1, '{\"ip\": \"127.0.0.1\", \"url\": \"http://127.0.0.1:8000/users/update-status/23\", \"user\": {\"name\": \"Appinion (superadmin)\", \"user_type\": \"n/a\"}, \"agent\": \"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36\", \"method\": \"POST\", \"form_data\": {\"toggle_input\": \"true\"}}', NULL, '2025-09-18 04:16:28', '2025-09-18 04:16:28'),
(21, 'POST', 'http://127.0.0.1:8000/users/update-status/22', NULL, NULL, NULL, 'App\\Models\\User', 1, '{\"ip\": \"127.0.0.1\", \"url\": \"http://127.0.0.1:8000/users/update-status/22\", \"user\": {\"name\": \"Appinion (superadmin)\", \"user_type\": \"n/a\"}, \"agent\": \"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36\", \"method\": \"POST\", \"form_data\": {\"toggle_input\": \"false\"}}', NULL, '2025-09-18 04:18:59', '2025-09-18 04:18:59'),
(22, 'POST', 'http://127.0.0.1:8000/users/update-status/23', NULL, NULL, NULL, 'App\\Models\\User', 1, '{\"ip\": \"127.0.0.1\", \"url\": \"http://127.0.0.1:8000/users/update-status/23\", \"user\": {\"name\": \"Appinion (superadmin)\", \"user_type\": \"n/a\"}, \"agent\": \"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36\", \"method\": \"POST\", \"form_data\": {\"toggle_input\": \"false\"}}', NULL, '2025-09-18 04:19:00', '2025-09-18 04:19:00'),
(23, 'POST', 'http://127.0.0.1:8000/users/update-status/22', NULL, NULL, NULL, 'App\\Models\\User', 1, '{\"ip\": \"127.0.0.1\", \"url\": \"http://127.0.0.1:8000/users/update-status/22\", \"user\": {\"name\": \"Appinion (superadmin)\", \"user_type\": \"n/a\"}, \"agent\": \"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36\", \"method\": \"POST\", \"form_data\": {\"toggle_input\": \"true\"}}', NULL, '2025-09-18 04:20:32', '2025-09-18 04:20:32'),
(24, 'PUT', 'http://127.0.0.1:8000/users/22', NULL, NULL, NULL, 'App\\Models\\User', 1, '{\"ip\": \"127.0.0.1\", \"url\": \"http://127.0.0.1:8000/users/22\", \"user\": {\"name\": \"Appinion (superadmin)\", \"user_type\": \"n/a\"}, \"agent\": \"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36\", \"method\": \"PUT\", \"form_data\": {\"name\": \"Mark Peck\", \"email\": \"wamubexava@mailinator.com\", \"phone\": \"01676470802\", \"photo\": {}, \"designation\": \"Ipsum labore nulla\"}}', NULL, '2025-09-18 04:38:48', '2025-09-18 04:38:48'),
(25, 'PUT', 'http://127.0.0.1:8000/users/22', NULL, NULL, NULL, 'App\\Models\\User', 1, '{\"ip\": \"127.0.0.1\", \"url\": \"http://127.0.0.1:8000/users/22\", \"user\": {\"name\": \"Appinion (superadmin)\", \"user_type\": \"n/a\"}, \"agent\": \"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36\", \"method\": \"PUT\", \"form_data\": {\"name\": \"Mark Peck\", \"email\": \"wamubexava@mailinator.com\", \"phone\": \"01676470802\", \"photo\": {}, \"designation\": \"Ipsum labore nulla\"}}', NULL, '2025-09-18 04:40:30', '2025-09-18 04:40:30'),
(26, 'PUT', 'http://127.0.0.1:8000/users/22', NULL, NULL, NULL, 'App\\Models\\User', 1, '{\"ip\": \"127.0.0.1\", \"url\": \"http://127.0.0.1:8000/users/22\", \"user\": {\"name\": \"Appinion (superadmin)\", \"user_type\": \"n/a\"}, \"agent\": \"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36\", \"method\": \"PUT\", \"form_data\": {\"name\": \"Mark Peck\", \"email\": \"wamubexava@mailinator.com\", \"phone\": \"01676470802\", \"photo\": {}, \"designation\": \"Ipsum labore nulla\"}}', NULL, '2025-09-18 04:43:57', '2025-09-18 04:43:57'),
(27, 'PUT', 'http://127.0.0.1:8000/users/22', NULL, NULL, NULL, 'App\\Models\\User', 1, '{\"ip\": \"127.0.0.1\", \"url\": \"http://127.0.0.1:8000/users/22\", \"user\": {\"name\": \"Appinion (superadmin)\", \"user_type\": \"n/a\"}, \"agent\": \"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36\", \"method\": \"PUT\", \"form_data\": {\"name\": \"Mark Peck\", \"email\": \"wamubexava@mailinator.com\", \"phone\": \"01676470802\", \"photo\": {}, \"designation\": \"Ipsum labore nulla\"}}', NULL, '2025-09-18 04:47:09', '2025-09-18 04:47:09'),
(28, 'PUT', 'http://127.0.0.1:8000/users/22', NULL, NULL, NULL, 'App\\Models\\User', 1, '{\"ip\": \"127.0.0.1\", \"url\": \"http://127.0.0.1:8000/users/22\", \"user\": {\"name\": \"Appinion (superadmin)\", \"user_type\": \"n/a\"}, \"agent\": \"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36\", \"method\": \"PUT\", \"form_data\": {\"name\": \"Mark Peck\", \"email\": \"wamubexava@mailinator.com\", \"phone\": \"01676470802\", \"designation\": \"Ipsum labore nulla\"}}', NULL, '2025-09-18 04:49:47', '2025-09-18 04:49:47'),
(29, 'PUT', 'http://127.0.0.1:8000/users/21', NULL, NULL, NULL, 'App\\Models\\User', 1, '{\"ip\": \"127.0.0.1\", \"url\": \"http://127.0.0.1:8000/users/21\", \"user\": {\"name\": \"Appinion (superadmin)\", \"user_type\": \"n/a\"}, \"agent\": \"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36\", \"method\": \"PUT\", \"form_data\": {\"name\": \"test 123\", \"email\": \"yamin@appinionbd.com\", \"phone\": \"01676470802\", \"photo\": {}, \"designation\": \"test112\"}}', NULL, '2025-09-18 04:49:56', '2025-09-18 04:49:56'),
(30, 'PUT', 'http://127.0.0.1:8000/users/19', NULL, NULL, NULL, 'App\\Models\\User', 1, '{\"ip\": \"127.0.0.1\", \"url\": \"http://127.0.0.1:8000/users/19\", \"user\": {\"name\": \"Appinion (superadmin)\", \"user_type\": \"n/a\"}, \"agent\": \"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36\", \"method\": \"PUT\", \"form_data\": {\"dob\": \"2001-09-02\", \"name\": \"Yamin\", \"email\": \"yamin@appinion.com\", \"phone\": \"01703084338\", \"designation\": \"Engineer\"}}', NULL, '2025-09-18 04:55:08', '2025-09-18 04:55:08'),
(31, 'PUT', 'http://127.0.0.1:8000/users/19', NULL, NULL, NULL, 'App\\Models\\User', 1, '{\"ip\": \"127.0.0.1\", \"url\": \"http://127.0.0.1:8000/users/19\", \"user\": {\"name\": \"Appinion (superadmin)\", \"user_type\": \"n/a\"}, \"agent\": \"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36\", \"method\": \"PUT\", \"form_data\": {\"dob\": \"2001-09-02\", \"name\": \"Yamin\", \"email\": \"yamin@appinion.com\", \"phone\": \"01703084338\", \"photo\": {}, \"designation\": \"Engineer\"}}', NULL, '2025-09-18 04:58:13', '2025-09-18 04:58:13'),
(32, 'PUT', 'http://127.0.0.1:8000/users/23', NULL, NULL, NULL, 'App\\Models\\User', 1, '{\"ip\": \"127.0.0.1\", \"url\": \"http://127.0.0.1:8000/users/23\", \"user\": {\"name\": \"Appinion (superadmin)\", \"user_type\": \"n/a\"}, \"agent\": \"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36\", \"method\": \"PUT\", \"form_data\": {\"dob\": null, \"name\": \"check bulk\", \"email\": \"ab@email.com\", \"phone\": \"123\", \"designation\": \"dshs\"}}', NULL, '2025-09-18 05:05:55', '2025-09-18 05:05:55'),
(33, 'PUT', 'http://127.0.0.1:8000/users/23', NULL, NULL, NULL, 'App\\Models\\User', 1, '{\"ip\": \"127.0.0.1\", \"url\": \"http://127.0.0.1:8000/users/23\", \"user\": {\"name\": \"Appinion (superadmin)\", \"user_type\": \"n/a\"}, \"agent\": \"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36\", \"method\": \"PUT\", \"form_data\": {\"dob\": \"2025-08-31\", \"name\": \"check bulk\", \"email\": \"ab@email.com\", \"phone\": \"01676470802\", \"photo\": {}, \"designation\": \"dshs\"}}', NULL, '2025-09-18 05:07:42', '2025-09-18 05:07:42'),
(34, 'POST', 'http://127.0.0.1:8000/users/update-status/23', NULL, NULL, NULL, 'App\\Models\\User', 1, '{\"ip\": \"127.0.0.1\", \"url\": \"http://127.0.0.1:8000/users/update-status/23\", \"user\": {\"name\": \"Appinion (superadmin)\", \"user_type\": \"n/a\"}, \"agent\": \"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36\", \"method\": \"POST\", \"form_data\": {\"toggle_input\": \"true\"}}', NULL, '2025-09-18 05:07:58', '2025-09-18 05:07:58'),
(35, 'POST', 'http://127.0.0.1:8000/admin-console/menus', NULL, NULL, NULL, 'App\\Models\\User', 1, '{\"ip\": \"127.0.0.1\", \"url\": \"http://127.0.0.1:8000/admin-console/menus\", \"user\": {\"name\": \"Appinion (superadmin)\", \"user_type\": \"n/a\"}, \"agent\": \"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36\", \"method\": \"POST\", \"form_data\": {\"title\": \"Eos vitae aspernatur\", \"is_active\": \"1\", \"menu_icon\": \"Nostrum consectetur\", \"menu_order\": \"89\", \"route_name\": \"users.index\", \"parent_menu_id\": \"1\"}}', NULL, '2025-09-18 05:08:26', '2025-09-18 05:08:26'),
(36, 'POST', 'http://127.0.0.1:8000/logout', NULL, NULL, NULL, NULL, NULL, '{\"ip\": \"127.0.0.1\", \"url\": \"http://127.0.0.1:8000/logout\", \"user\": {\"name\": \"Guest\", \"user_type\": \"n/a\"}, \"agent\": \"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36\", \"method\": \"POST\", \"form_data\": []}', NULL, '2025-09-18 05:08:34', '2025-09-18 05:08:34'),
(37, 'POST', 'http://127.0.0.1:8000/login', NULL, NULL, NULL, 'App\\Models\\User', 1, '{\"ip\": \"127.0.0.1\", \"url\": \"http://127.0.0.1:8000/login\", \"user\": {\"name\": \"Appinion (superadmin)\", \"user_type\": \"n/a\"}, \"agent\": \"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36\", \"method\": \"POST\", \"form_data\": {\"userid\": \"superadmin\"}}', NULL, '2025-09-18 05:08:36', '2025-09-18 05:08:36'),
(38, 'DELETE', 'http://127.0.0.1:8000/admin-console/menus/180', NULL, NULL, NULL, 'App\\Models\\User', 1, '{\"ip\": \"127.0.0.1\", \"url\": \"http://127.0.0.1:8000/admin-console/menus/180\", \"user\": {\"name\": \"Appinion (superadmin)\", \"user_type\": \"n/a\"}, \"agent\": \"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36\", \"method\": \"DELETE\", \"form_data\": []}', NULL, '2025-09-18 05:08:54', '2025-09-18 05:08:54'),
(39, 'POST', 'http://127.0.0.1:8000/logout', NULL, NULL, NULL, NULL, NULL, '{\"ip\": \"127.0.0.1\", \"url\": \"http://127.0.0.1:8000/logout\", \"user\": {\"name\": \"Guest\", \"user_type\": \"n/a\"}, \"agent\": \"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36\", \"method\": \"POST\", \"form_data\": []}', NULL, '2025-09-18 05:18:10', '2025-09-18 05:18:10'),
(40, 'POST', 'http://127.0.0.1:8000/login', NULL, NULL, NULL, 'App\\Models\\User', 1, '{\"ip\": \"127.0.0.1\", \"url\": \"http://127.0.0.1:8000/login\", \"user\": {\"name\": \"Appinion (superadmin)\", \"user_type\": \"n/a\"}, \"agent\": \"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36\", \"method\": \"POST\", \"form_data\": {\"userid\": \"superadmin\"}}', NULL, '2025-09-18 05:21:49', '2025-09-18 05:21:49'),
(41, 'POST', 'http://127.0.0.1:8000/login', NULL, NULL, NULL, 'App\\Models\\User', 1, '{\"ip\": \"127.0.0.1\", \"url\": \"http://127.0.0.1:8000/login\", \"user\": {\"name\": \"Appinion (superadmin)\", \"user_type\": \"n/a\"}, \"agent\": \"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36\", \"method\": \"POST\", \"form_data\": {\"userid\": \"superadmin\"}}', NULL, '2025-09-18 05:42:25', '2025-09-18 05:42:25'),
(42, 'POST', 'http://127.0.0.1:8000/login', NULL, NULL, NULL, 'App\\Models\\User', 1, '{\"ip\": \"127.0.0.1\", \"url\": \"http://127.0.0.1:8000/login\", \"user\": {\"name\": \"Appinion (superadmin)\", \"user_type\": \"n/a\"}, \"agent\": \"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36\", \"method\": \"POST\", \"form_data\": {\"userid\": \"superadmin\"}}', NULL, '2025-09-18 05:46:13', '2025-09-18 05:46:13'),
(43, 'POST', 'http://127.0.0.1:8000/admin-console/user-roles', NULL, NULL, NULL, 'App\\Models\\User', 1, '{\"ip\": \"127.0.0.1\", \"url\": \"http://127.0.0.1:8000/admin-console/user-roles\", \"user\": {\"name\": \"Appinion (superadmin)\", \"user_type\": \"n/a\"}, \"agent\": \"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36\", \"method\": \"POST\", \"form_data\": {\"title\": \"Sit omnis quia cons\", \"is_active\": \"1\"}}', NULL, '2025-09-18 05:48:24', '2025-09-18 05:48:24'),
(44, 'PUT', 'http://127.0.0.1:8000/users/19', NULL, NULL, NULL, 'App\\Models\\User', 1, '{\"ip\": \"127.0.0.1\", \"url\": \"http://127.0.0.1:8000/users/19\", \"user\": {\"name\": \"Appinion (superadmin)\", \"user_type\": \"n/a\"}, \"agent\": \"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36\", \"method\": \"PUT\", \"form_data\": {\"dob\": \"2001-09-02\", \"name\": \"Yamin\", \"email\": \"yamin@appinion.com\", \"phone\": \"01703084338\", \"photo\": {}, \"designation\": \"Engineer\"}}', NULL, '2025-09-18 05:58:32', '2025-09-18 05:58:32'),
(45, 'PUT', 'http://127.0.0.1:8000/users/23', NULL, NULL, NULL, 'App\\Models\\User', 1, '{\"ip\": \"127.0.0.1\", \"url\": \"http://127.0.0.1:8000/users/23\", \"user\": {\"name\": \"Appinion (superadmin)\", \"user_type\": \"n/a\"}, \"agent\": \"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36\", \"method\": \"PUT\", \"form_data\": {\"dob\": \"2025-08-31\", \"name\": \"check bulk\", \"email\": \"ab@email.com\", \"phone\": \"01676470802\", \"photo\": {}, \"designation\": \"dshs\"}}', NULL, '2025-09-18 05:59:01', '2025-09-18 05:59:01'),
(46, 'PUT', 'http://127.0.0.1:8000/users/22', NULL, NULL, NULL, 'App\\Models\\User', 1, '{\"ip\": \"127.0.0.1\", \"url\": \"http://127.0.0.1:8000/users/22\", \"user\": {\"name\": \"Appinion (superadmin)\", \"user_type\": \"n/a\"}, \"agent\": \"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36\", \"method\": \"PUT\", \"form_data\": {\"dob\": \"1999-01-01\", \"name\": \"Mark Peck\", \"email\": \"wamubexava@mailinator.com\", \"phone\": \"01676470802\", \"photo\": {}, \"designation\": \"Ipsum labore nulla\"}}', NULL, '2025-09-18 05:59:13', '2025-09-18 05:59:13'),
(47, 'PUT', 'http://127.0.0.1:8000/users/21', NULL, NULL, NULL, 'App\\Models\\User', 1, '{\"ip\": \"127.0.0.1\", \"url\": \"http://127.0.0.1:8000/users/21\", \"user\": {\"name\": \"Appinion (superadmin)\", \"user_type\": \"n/a\"}, \"agent\": \"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36\", \"method\": \"PUT\", \"form_data\": {\"dob\": \"2001-01-01\", \"name\": \"test 123\", \"email\": \"yamin@appinionbd.com\", \"phone\": \"01676470802\", \"photo\": {}, \"designation\": \"test112\"}}', NULL, '2025-09-18 05:59:21', '2025-09-18 05:59:21'),
(48, 'PUT', 'http://127.0.0.1:8000/users/1', NULL, NULL, NULL, 'App\\Models\\User', 1, '{\"ip\": \"127.0.0.1\", \"url\": \"http://127.0.0.1:8000/users/1\", \"user\": {\"name\": \"Appinion (superadmin)\", \"user_type\": \"n/a\"}, \"agent\": \"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36\", \"method\": \"PUT\", \"form_data\": {\"dob\": \"2025-09-01\", \"name\": \"Appinion\", \"email\": \"yamin@appinionbd.com\", \"phone\": \"01703084338\", \"photo\": {}, \"designation\": \"Super Admin\"}}', NULL, '2025-09-18 06:01:25', '2025-09-18 06:01:25');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `name`, `slug`, `phone`, `address`, `logo`, `is_active`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Appinion', 'appinion', '01676909060', 'Dhaka', NULL, 1, NULL, '2025-06-15 23:57:49', '2025-07-20 03:48:13'),
(2, 'Renata Pharma', 'renata-pharma-1751869013', '01334563889', NULL, NULL, 1, NULL, '2025-07-07 00:16:18', '2025-07-17 05:13:20'),
(3, 'Sajida Foundation', 'sajida-foundation-1752749264', '0199999999', 'Gulshan 1', 'companies/Vpr5a6fR9O8nNXHyWagjzBafU8k7JaZDj5t3MgZr.jpg', 0, NULL, '2025-07-17 04:47:44', '2025-07-17 05:13:16'),
(4, 'Test Company', 'test-company-1752749460', '01676470802', 'Test Address', 'companies/umJwgT9SqlKrkngJ3y5uengwZP9Zyf6CuMpQ5KuR.jpg', 0, '2025-07-17 04:52:41', '2025-07-17 04:51:00', '2025-07-17 04:52:41'),
(5, 'test create', 'test-create-1752749736', '0123456789', 'dhaka bangladesh', 'companies/f3xMWMPa3atSXT92iN0cjyxYF7dejvRxhCPMp5JN.jpg', 1, NULL, '2025-07-17 04:55:36', '2025-07-17 04:55:47');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` smallint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `route_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `menu_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `menu_icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `menu_order` smallint UNSIGNED NOT NULL DEFAULT '1',
  `parent_menu_id` smallint UNSIGNED DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `title`, `route_name`, `menu_url`, `menu_icon`, `menu_order`, `parent_menu_id`, `is_active`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Dashboard', 'dashboard', NULL, 'element-11', 1, NULL, 1, NULL, '2024-04-17 22:54:33', '2024-04-17 22:54:33'),
(12, 'Users', NULL, NULL, 'people', 99, NULL, 1, NULL, '2024-09-21 16:20:52', '2024-09-21 16:20:52'),
(13, 'Manage', 'users.index', NULL, NULL, 1, 12, 1, NULL, '2024-09-21 16:21:21', '2024-09-21 16:21:21'),
(15, 'Admin Console', NULL, NULL, 'security-user', 100, NULL, 1, NULL, '2024-04-17 22:54:33', '2024-04-17 22:54:33'),
(16, 'Menus', 'menus.index', NULL, NULL, 1, 15, 1, NULL, '2024-04-17 22:54:33', '2024-04-17 22:54:33'),
(17, 'Permission', 'permissions.index', NULL, NULL, 2, 15, 1, NULL, '2025-02-22 16:07:18', '2024-04-17 22:54:33'),
(18, 'User Roles', 'user-roles.index', NULL, NULL, 3, 15, 1, NULL, '2024-04-17 22:54:33', '2024-04-17 22:54:33'),
(180, 'Eos vitae aspernatur', 'users.index', NULL, 'Nostrum consectetur', 89, 1, 1, '2025-09-18 05:08:54', '2025-09-18 05:08:26', '2025-09-18 05:08:54');

-- --------------------------------------------------------

--
-- Table structure for table `menu_role`
--

CREATE TABLE `menu_role` (
  `id` int UNSIGNED NOT NULL,
  `role_id` smallint UNSIGNED NOT NULL,
  `menu_id` smallint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_role`
--

INSERT INTO `menu_role` (`id`, `role_id`, `menu_id`, `created_at`, `updated_at`) VALUES
(23, 2, 1, '2025-09-17 11:09:17', '2025-09-17 11:09:17'),
(24, 2, 12, '2025-09-17 11:09:17', '2025-09-17 11:09:17'),
(25, 2, 13, '2025-09-17 11:09:17', '2025-09-17 11:09:17'),
(26, 2, 15, '2025-09-17 11:09:17', '2025-09-17 11:09:17'),
(27, 2, 17, '2025-09-17 11:09:17', '2025-09-17 11:09:17');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2019_09_01_084715_create_districts_table', 1),
(5, '2024_04_16_101852_create_personal_access_tokens_table', 1),
(6, '2024_04_18_164158_create_roles_table', 1),
(7, '2024_04_18_164429_create_permissions_table', 1),
(8, '2024_04_18_164637_create_role_user_table', 1),
(9, '2024_04_18_164918_create_permission_role_table', 1),
(10, '2024_04_18_165047_create_menus_table', 1),
(11, '2024_04_18_165243_create_menu_role_table', 1),
(12, '2024_05_05_120734_create_otp_table', 1),
(13, '2024_12_19_120311_create_activity_log_table', 1),
(14, '2024_12_19_120312_add_event_column_to_activity_log_table', 1),
(15, '2024_12_19_120313_add_batch_uuid_column_to_activity_log_table', 1),
(16, '2025_06_16_114626_create_companies_table', 1),
(17, '2025_06_16_124052_add_company_id_and_territory_id_to_users_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `otps`
--

CREATE TABLE `otps` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `otp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expire_ts` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `slug`, `controller`, `description`, `is_active`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'UserController@index', 'user_controller@index', 'UserController', NULL, 1, NULL, '2025-09-18 03:56:35', '2025-09-18 03:56:35'),
(2, 'UserController@create', 'user_controller@create', 'UserController', NULL, 1, NULL, '2025-09-18 03:56:35', '2025-09-18 03:56:35'),
(3, 'UserController@store', 'user_controller@store', 'UserController', NULL, 1, NULL, '2025-09-18 03:56:35', '2025-09-18 03:56:35'),
(4, 'UserController@show', 'user_controller@show', 'UserController', NULL, 1, NULL, '2025-09-18 03:56:35', '2025-09-18 03:56:35'),
(5, 'UserController@edit', 'user_controller@edit', 'UserController', NULL, 1, NULL, '2025-09-18 03:56:35', '2025-09-18 03:56:35'),
(6, 'UserController@update', 'user_controller@update', 'UserController', NULL, 1, NULL, '2025-09-18 03:56:35', '2025-09-18 03:56:35'),
(7, 'UserController@destroy', 'user_controller@destroy', 'UserController', NULL, 1, NULL, '2025-09-18 03:56:35', '2025-09-18 03:56:35'),
(8, 'UserController@updateStatus', 'user_controller@update_status', 'UserController', NULL, 1, NULL, '2025-09-18 03:56:35', '2025-09-18 03:56:35'),
(9, 'UserController@passwordReset', 'user_controller@password_reset', 'UserController', NULL, 1, NULL, '2025-09-18 03:56:35', '2025-09-18 03:56:35'),
(10, 'UserController@bulkUpload', 'user_controller@bulk_upload', 'UserController', NULL, 1, NULL, '2025-09-18 03:56:35', '2025-09-18 03:56:35'),
(11, 'UserController@sync_user_roles', 'user_controller@sync_user_roles', 'UserController', NULL, 1, NULL, '2025-09-18 05:47:51', '2025-09-18 05:47:51');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `id` int UNSIGNED NOT NULL,
  `permission_id` int UNSIGNED NOT NULL,
  `role_id` smallint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
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
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` smallint UNSIGNED NOT NULL,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `title`, `slug`, `is_active`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin', 1, NULL, '2025-07-16 22:06:44', '2025-07-16 22:06:44'),
(2, 'User', 'user', 1, NULL, '2025-07-16 22:07:19', '2025-07-16 22:07:19'),
(3, 'Sit omnis quia cons', 'sit-omnis-quia-cons', 1, NULL, '2025-09-18 05:48:24', '2025-09-18 05:48:24');

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `role_id` smallint UNSIGNED NOT NULL,
  `is_primary` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `released_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`id`, `user_id`, `role_id`, `is_primary`, `is_active`, `released_at`, `created_at`, `updated_at`) VALUES
(1, 21, 2, 1, 1, NULL, '2025-09-18 03:39:28', '2025-09-18 03:39:28'),
(2, 22, 2, 1, 1, NULL, '2025-09-18 03:53:55', '2025-09-18 03:53:55'),
(3, 23, 2, 1, 1, NULL, '2025-09-18 03:54:42', '2025-09-18 03:54:42');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userid` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primary_role_id` smallint UNSIGNED DEFAULT NULL COMMENT 'FK: roles - id',
  `updated_by` int UNSIGNED NOT NULL,
  `is_password_changed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 - Not changed, 1 - Changed',
  `gender` tinyint UNSIGNED DEFAULT NULL COMMENT '1 - male, 2 - female, 3 - other',
  `dob` date DEFAULT NULL,
  `designation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `phone` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` text COLLATE utf8mb4_unicode_ci,
  `address` text COLLATE utf8mb4_unicode_ci,
  `is_superuser` tinyint(1) NOT NULL DEFAULT '0',
  `can_access_admin_panel` tinyint(1) NOT NULL DEFAULT '0',
  `last_login` timestamp NULL DEFAULT NULL,
  `last_update_state` text COLLATE utf8mb4_unicode_ci COMMENT 'Data difference for last update',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `userid`, `email`, `email_verified_at`, `password`, `remember_token`, `primary_role_id`, `updated_by`, `is_password_changed`, `gender`, `dob`, `designation`, `is_active`, `phone`, `photo`, `address`, `is_superuser`, `can_access_admin_panel`, `last_login`, `last_update_state`, `deleted_at`, `created_at`, `updated_at`, `company_id`) VALUES
(1, 'Appinion', 'superadmin', 'yamin@appinionbd.com', NULL, '$2y$12$cnXk.KxHSXCDecIQhCkb8.f2YJHnaL1KqvP88VGYcV.zuNEccGCoy', NULL, 2, 1, 0, NULL, '2025-09-01', 'Super Admin', 1, '01703084338', 'user/YA7nZiBjmyo1uxaK9euMvO5HzWRxT5mU16q0bDss.jpg', NULL, 1, 1, '2025-09-18 05:46:13', NULL, NULL, '2024-04-16 20:27:31', '2025-09-18 06:01:25', 1),
(2, 'Admin', 'admin', '', NULL, '$2y$12$cnXk.KxHSXCDecIQhCkb8.f2YJHnaL1KqvP88VGYcV.zuNEccGCoy', NULL, 1, 1, 0, NULL, NULL, 'Engineer', 1, NULL, NULL, NULL, 0, 1, '2025-05-21 00:43:08', NULL, NULL, '2024-04-16 20:27:31', '2025-05-21 00:43:08', 0),
(3, 'Test', '123', NULL, NULL, '$2y$12$mr2El3V0XrZt6heubcSCrevc/Ch1VeHMNFybpAanmDh3HSP6X233K', NULL, 2, 1, 1, NULL, NULL, 'Engineer', 1, '01676909099', NULL, NULL, 0, 0, NULL, NULL, NULL, '2025-07-16 22:38:36', '2025-07-16 23:55:15', 0),
(18, 'Yamin', 'ap1_deleted_1752745219', 'yamin@appinion.com', NULL, '$2y$12$5p7CcBaZGjfsI8QTAE5Ux.Gvbw60dTn7C3JWX7IqHEYJDOIS4ye8O', NULL, 2, 1, 0, 1, NULL, 'Engineer', 1, '01703084338', NULL, 'Mirpur', 0, 0, NULL, NULL, '2025-07-17 03:40:20', '2025-07-17 03:26:57', '2025-07-17 03:40:20', 0),
(19, 'Yamin', 'ap1', 'yamin@appinion.com', NULL, '$2y$12$/T2dHM/Z/m03rvAfnMJvpeLT9IBzNaarT32sHTzBItn7uvjcbkJOS', NULL, 2, 1, 0, 1, '2001-09-02', 'Engineer', 1, '01703084338', 'user/Cq8ibCZ7HEzzR3x5vzGy6D2pTMZWkuaChApG0Bhu.jpg', 'Mirpur', 0, 0, NULL, NULL, NULL, '2025-07-17 03:40:26', '2025-09-18 05:58:32', 0),
(20, 'Test User', 'admin123', NULL, NULL, '$2y$12$3j96LyRS2tVVxKzdwJPxKu2qg.C.ARWUKm5aprjzjy9IxXqhYqJtO', NULL, 2, 1, 0, NULL, NULL, 'Engineer', 1, '01234567897', NULL, NULL, 0, 0, '2025-09-08 00:35:01', NULL, NULL, '2025-08-26 22:21:19', '2025-09-08 00:35:01', 0),
(21, 'test 123', 'appinion12', 'yamin@appinionbd.com', NULL, '$2y$12$DCw18l.o3xPbyKtRzNEyuef5Z5.tUnnLinBZ6QzDm3dPEI0DaQk6K', NULL, 2, 1, 0, NULL, '2001-01-01', 'test112', 1, '01676470802', 'user/RFjZSNJ7AVgCUy9nYTjFD6dntjukB5m6xPml2TtY.jpg', NULL, 0, 0, NULL, NULL, NULL, '2025-09-18 03:39:28', '2025-09-18 05:59:21', 1),
(22, 'Mark Peck', 'rejuwivuzi', 'wamubexava@mailinator.com', NULL, '$2y$12$9GC57.45U9iXV7v/R75PJehSwfJ48qJurK6flsS5BxZQNawf9rnHC', NULL, 2, 1, 0, 1, '1999-01-01', 'Ipsum labore nulla', 1, '01676470802', 'user/rizOFcVMZRCdHsLENzqcurYUUn8KFOJS4ySmJRgu.jpg', NULL, 0, 0, NULL, NULL, NULL, '2025-09-18 03:53:55', '2025-09-18 05:59:13', 1),
(23, 'check bulk', '1awa1', 'ab@email.com', NULL, '$2y$12$81VhoscgxziqFFazidQHCufyzobihIDPmwEK/Ep1bRAj8BIC2fXOO', NULL, 2, 1, 0, NULL, '2025-08-31', 'dshs', 1, '01676470802', 'user/ol8uOBElizxXuhVI3q1Emd4dvbARJXbafx3xBsTV.jpg', 'assss', 0, 0, NULL, NULL, NULL, '2025-09-18 03:54:42', '2025-09-18 05:59:01', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject` (`subject_type`,`subject_id`),
  ADD KEY `causer` (`causer_type`,`causer_id`),
  ADD KEY `activity_log_log_name_index` (`log_name`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_role`
--
ALTER TABLE `menu_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_role_role_id_foreign` (`role_id`),
  ADD KEY `menu_role_menu_id_foreign` (`menu_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `otps`
--
ALTER TABLE `otps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_slug_unique` (`slug`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permission_role_permission_id_foreign` (`permission_id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_slug_unique` (`slug`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_user_user_id_foreign` (`user_id`),
  ADD KEY `role_user_role_id_foreign` (`role_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_userid_unique` (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` smallint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=181;

--
-- AUTO_INCREMENT for table `menu_role`
--
ALTER TABLE `menu_role`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `otps`
--
ALTER TABLE `otps`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `permission_role`
--
ALTER TABLE `permission_role`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` smallint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `menu_role`
--
ALTER TABLE `menu_role`
  ADD CONSTRAINT `menu_role_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`),
  ADD CONSTRAINT `menu_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`),
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
