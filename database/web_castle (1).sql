-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 07, 2025 at 05:34 PM
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
-- Database: `web_castle`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `doc_id` bigint(20) UNSIGNED NOT NULL,
  `conslt_id` bigint(20) UNSIGNED NOT NULL,
  `Booked_at` date DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `doc_id`, `conslt_id`, `Booked_at`, `token`, `created_at`, `updated_at`) VALUES
(1, 4, 3, '2025-05-19', 'BKD3', '2025-05-07 09:55:22', '2025-05-07 09:55:22'),
(2, 5, 4, '2025-05-26', 'BKD6', '2025-05-07 09:55:52', '2025-05-07 09:55:52'),
(3, 13, 12, '2025-05-30', 'BKD8', '2025-05-07 10:03:06', '2025-05-07 10:03:06');

-- --------------------------------------------------------

--
-- Table structure for table `consultations`
--

CREATE TABLE `consultations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `consult_days` varchar(255) NOT NULL,
  `time_frame` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `consultations`
--

INSERT INTO `consultations` (`id`, `user_id`, `consult_days`, `time_frame`, `created_at`, `updated_at`) VALUES
(1, 2, 'WednesDay', '9.30AM-12.30PM', '2025-05-07 09:40:22', '2025-05-07 09:40:22'),
(2, 3, 'WednesDay', '12.30PM-1.30PM', '2025-05-07 09:40:22', '2025-05-07 09:40:22'),
(3, 4, 'WednesDay', '1.30PM-3.30PM', '2025-05-07 09:40:22', '2025-05-07 09:40:22'),
(4, 5, 'WednesDay', '3.30PM-5.30PM', '2025-05-07 09:40:22', '2025-05-07 09:40:22'),
(5, 6, 'WednesDay', '9.30AM-12.30PM', '2025-05-07 09:42:36', '2025-05-07 09:42:36'),
(6, 7, 'WednesDay', '1.30PM-3.30PM', '2025-05-07 09:42:36', '2025-05-07 09:42:36'),
(7, 8, 'WednesDay', '1.30PM-3.30PM', '2025-05-07 09:42:36', '2025-05-07 09:42:36'),
(8, 9, 'WednesDay', '1.30PM-3.30PM', '2025-05-07 09:42:36', '2025-05-07 09:42:36'),
(9, 10, 'friday', '9.30AM-12.30PM', '2025-05-07 09:59:33', '2025-05-07 09:59:33'),
(10, 11, 'friday', '12.30PM-1.30PM', '2025-05-07 09:59:33', '2025-05-07 09:59:33'),
(11, 12, 'friday', '1.30PM-3.30PM', '2025-05-07 09:59:33', '2025-05-07 09:59:33'),
(12, 13, 'friday', '3.30PM-5.30PM', '2025-05-07 09:59:33', '2025-05-07 09:59:33');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2025_05_06_133025_create_consultations_table', 1),
(7, '2025_15_06_133026_add_date_to_users_table', 1),
(8, '2025_15_07_133027_create_bookings_table ', 1),
(9, '2025_15_07_133028_add_doc_id_bookings_table', 1),
(10, '2025_15_07_133029_add_token_bookings_table', 1),
(11, '2025_15_07_133334_change_date_to_string_in_users_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
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
  `name` varchar(255) NOT NULL,
  `specialization` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `specialization`, `date`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Midhun Chacko', NULL, NULL, 'midhun@gmail.com', NULL, '$2y$10$8X0jPKHKI.tXDn2foORjnOO5WiX29MMU6uR5oA2d2E0q.SCXxA8DC', NULL, '2025-05-07 09:39:51', '2025-05-07 09:39:51'),
(2, 'JOSEPH', 'MBBS', '2025-05-05', NULL, NULL, NULL, NULL, '2025-05-07 09:40:22', '2025-05-07 09:40:22'),
(3, 'JOSEPH', 'MBBS', ' 2025-05-12', NULL, NULL, NULL, NULL, '2025-05-07 09:40:22', '2025-05-07 09:40:22'),
(4, 'JOSEPH', 'MBBS', ' 2025-05-19', NULL, NULL, NULL, NULL, '2025-05-07 09:40:22', '2025-05-07 09:40:22'),
(5, 'JOSEPH', 'MBBS', ' 2025-05-26', NULL, NULL, NULL, NULL, '2025-05-07 09:40:22', '2025-05-07 09:40:22'),
(6, 'NIMMY', 'MBBS,SKIN', '2025-05-07', NULL, NULL, NULL, NULL, '2025-05-07 09:42:36', '2025-05-07 09:42:36'),
(7, 'NIMMY', 'MBBS,SKIN', ' 2025-05-14', NULL, NULL, NULL, NULL, '2025-05-07 09:42:36', '2025-05-07 09:42:36'),
(8, 'NIMMY', 'MBBS,SKIN', ' 2025-05-21', NULL, NULL, NULL, NULL, '2025-05-07 09:42:36', '2025-05-07 09:42:36'),
(9, 'NIMMY', 'MBBS,SKIN', ' 2025-05-28', NULL, NULL, NULL, NULL, '2025-05-07 09:42:36', '2025-05-07 09:42:36'),
(10, 'ABHI MATHU', 'MBBS', '2025-05-09', NULL, NULL, NULL, NULL, '2025-05-07 09:59:33', '2025-05-07 09:59:33'),
(11, 'ABHI MATHU', 'MBBS', ' 2025-05-16', NULL, NULL, NULL, NULL, '2025-05-07 09:59:33', '2025-05-07 09:59:33'),
(12, 'ABHI MATHU', 'MBBS', ' 2025-05-23', NULL, NULL, NULL, NULL, '2025-05-07 09:59:33', '2025-05-07 09:59:33'),
(13, 'ABHI MATHU', 'MBBS', ' 2025-05-30', NULL, NULL, NULL, NULL, '2025-05-07 09:59:33', '2025-05-07 09:59:33');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookings_conslt_id_foreign` (`conslt_id`),
  ADD KEY `bookings_doc_id_foreign` (`doc_id`);

--
-- Indexes for table `consultations`
--
ALTER TABLE `consultations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `consultations_id_index` (`id`),
  ADD KEY `consultations_user_id_foreign` (`user_id`);

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
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

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
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_id_index` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `consultations`
--
ALTER TABLE `consultations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_conslt_id_foreign` FOREIGN KEY (`conslt_id`) REFERENCES `consultations` (`id`),
  ADD CONSTRAINT `bookings_doc_id_foreign` FOREIGN KEY (`doc_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `consultations`
--
ALTER TABLE `consultations`
  ADD CONSTRAINT `consultations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
