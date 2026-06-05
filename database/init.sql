-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 05, 2026 at 06:37 PM
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
-- Database: `driveguard_blackspots`
--

-- --------------------------------------------------------

--
-- Table structure for table `accident_reports`
--

CREATE TABLE `accident_reports` (
  `id` int(11) NOT NULL,
  `latitude` float NOT NULL,
  `longitude` float NOT NULL,
  `reported_at` datetime DEFAULT NULL,
  `severity` int(11) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blackspot_reports`
--

CREATE TABLE `blackspot_reports` (
  `id` int(11) NOT NULL,
  `user_id` varchar(36) NOT NULL,
  `latitude` float NOT NULL,
  `longitude` float NOT NULL,
  `description` text DEFAULT NULL,
  `report_type` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blackspot_reports`
--

INSERT INTO `blackspot_reports` (`id`, `user_id`, `latitude`, `longitude`, `description`, `report_type`, `created_at`, `expires_at`) VALUES
(3, 'demo-user-001', 6.87374, 79.8702, 'Flood', 'FLOOD', '2026-03-18 14:41:39', '2026-03-18 16:41:39');

-- --------------------------------------------------------

--
-- Table structure for table `community_posts`
--

CREATE TABLE `community_posts` (
  `id` int(11) NOT NULL,
  `user_id` varchar(36) NOT NULL,
  `post_type` varchar(30) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `extra_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`extra_data`)),
  `like_count` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `crowdsourced_signs`
--

CREATE TABLE `crowdsourced_signs` (
  `id` int(11) NOT NULL,
  `latitude` float NOT NULL,
  `longitude` float NOT NULL,
  `class_id` int(11) NOT NULL,
  `class_name` varchar(100) NOT NULL,
  `confidence` float DEFAULT NULL,
  `report_count` int(11) DEFAULT NULL,
  `first_seen` datetime DEFAULT NULL,
  `last_seen` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `driving_challenges`
--

CREATE TABLE `driving_challenges` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `challenge_type` varchar(30) NOT NULL,
  `target_value` int(11) DEFAULT NULL,
  `xp_reward` int(11) DEFAULT NULL,
  `period` varchar(20) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `driving_challenges`
--

INSERT INTO `driving_challenges` (`id`, `title`, `description`, `icon`, `challenge_type`, `target_value`, `xp_reward`, `period`, `is_active`) VALUES
(1, 'First Safe Trip', 'Complete a trip with safety score above 80', '🛡️', 'score', 80, 20, 'alltime', 1),
(2, '7-Day Streak', 'Drive safely for 7 consecutive days', '🔥', 'streak', 7, 50, 'weekly', 1),
(3, 'Marathon Driver', 'Drive 100km total distance', '🏔️', 'distance', 100, 40, 'monthly', 1),
(4, 'Zen Mode', 'Complete a trip with safety score above 95', '🧘', 'score', 95, 60, 'weekly', 1),
(5, 'Route Explorer', 'Complete 20 trips', '🗺️', 'trips', 20, 80, 'monthly', 1),
(6, 'Speed Demon Tamed', 'Complete a trip with score above 90 at avg speed > 40kph', '⚡', 'score', 90, 30, 'weekly', 1),
(7, 'Community Helper', 'Share 5 trips to the community', '🌍', 'trips', 5, 25, 'alltime', 1);

-- --------------------------------------------------------

--
-- Table structure for table `emergency_profiles`
--

CREATE TABLE `emergency_profiles` (
  `id` int(11) NOT NULL,
  `user_id` varchar(36) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `blood_type` varchar(5) DEFAULT NULL,
  `allergies` text DEFAULT NULL,
  `medical_conditions` text DEFAULT NULL,
  `medications` text DEFAULT NULL,
  `emergency_contact_1_name` varchar(255) DEFAULT NULL,
  `emergency_contact_1_phone` varchar(20) DEFAULT NULL,
  `emergency_contact_2_name` varchar(255) DEFAULT NULL,
  `emergency_contact_2_phone` varchar(20) DEFAULT NULL,
  `insurance_provider` varchar(255) DEFAULT NULL,
  `insurance_policy_no` varchar(100) DEFAULT NULL,
  `is_public` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `group_members`
--

CREATE TABLE `group_members` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `user_id` varchar(36) NOT NULL,
  `role` varchar(20) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `joined_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `insurance_claims`
--

CREATE TABLE `insurance_claims` (
  `id` varchar(36) NOT NULL,
  `user_id` varchar(36) NOT NULL,
  `vehicle_id` varchar(36) NOT NULL,
  `trip_id` varchar(36) DEFAULT NULL,
  `latitude` float NOT NULL,
  `longitude` float NOT NULL,
  `pre_crash_speed_kph` float DEFAULT NULL,
  `pre_crash_risk_score` float DEFAULT NULL,
  `weather_condition` varchar(50) DEFAULT NULL,
  `statement` text DEFAULT NULL,
  `photo_urls` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`photo_urls`)),
  `status` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `submitted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `live_trip_sessions`
--

CREATE TABLE `live_trip_sessions` (
  `id` int(11) NOT NULL,
  `user_id` varchar(36) NOT NULL,
  `trip_id` varchar(36) NOT NULL,
  `share_code` varchar(8) NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `speed_kph` float DEFAULT NULL,
  `risk_level` varchar(10) DEFAULT NULL,
  `alert_level` varchar(10) DEFAULT NULL,
  `watcher_count` int(11) DEFAULT NULL,
  `last_updated` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `live_trip_sessions`
--

INSERT INTO `live_trip_sessions` (`id`, `user_id`, `trip_id`, `share_code`, `is_active`, `latitude`, `longitude`, `speed_kph`, `risk_level`, `alert_level`, `watcher_count`, `last_updated`, `created_at`) VALUES
(1, 'demo-user-001', 'f87c03ec-6921-41f8-bcea-286638aeaba1', 'DG-KVR4', 1, 0, 0, 0, 'LOW', 'GREEN', 0, '2026-05-10 23:08:06', '2026-05-10 23:08:06');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_id` varchar(36) NOT NULL,
  `type` varchar(50) NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` text DEFAULT NULL,
  `extra_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`extra_data`)),
  `is_read` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `type`, `title`, `message`, `extra_data`, `is_read`, `created_at`) VALUES
(1, 'demo-user-001', 'reaction', 'Good Drive!', 'DriveGuard User reacted \'Good Drive\' to your trip', '{\"trip_id\": \"dc0cc52b-b4e4-4fdc-a4cd-59ef871e7858\"}', 1, '2026-04-28 23:23:23'),
(2, 'demo-user-001', 'system', 'Emergency SOS Triggered!', 'Crash detected at 6.8739057, 79.8701802. Emergency contacts notified.', '{\"latitude\": 6.8739057, \"longitude\": 79.8701802, \"event_id\": \"624515\"}', 0, '2026-05-10 23:14:44');

-- --------------------------------------------------------

--
-- Table structure for table `permanent_hotspots`
--

CREATE TABLE `permanent_hotspots` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `latitude` float NOT NULL,
  `longitude` float NOT NULL,
  `report_count` int(11) DEFAULT NULL,
  `risk_boost` float DEFAULT NULL,
  `first_reported` datetime DEFAULT NULL,
  `last_reported` datetime DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `permanent_hotspots`
--

INSERT INTO `permanent_hotspots` (`id`, `name`, `latitude`, `longitude`, `report_count`, `risk_boost`, `first_reported`, `last_reported`, `is_active`) VALUES
(1, 'Borella Junction', 6.9147, 79.8775, 8, 0.25, '2026-02-18 03:53:47', '2026-02-18 03:53:47', 1),
(2, 'Lipton Circus', 6.9073, 79.8638, 6, 0.25, '2026-02-18 03:53:47', '2026-02-18 03:53:47', 1),
(3, 'Baseline Road Junction', 6.9191, 79.8819, 7, 0.25, '2026-02-18 03:53:47', '2026-02-18 03:53:47', 1),
(4, 'Maradana Junction', 6.9289, 79.8664, 5, 0.25, '2026-02-18 03:53:47', '2026-02-18 03:53:47', 1),
(5, 'Bambalapitiya Junction', 6.908, 79.8535, 5, 0.25, '2026-02-18 03:53:47', '2026-02-18 03:53:47', 1),
(6, 'Dehiwala Junction', 6.8537, 79.8658, 6, 0.25, '2026-02-18 03:53:47', '2026-02-18 03:53:47', 1),
(7, 'Nugegoda Junction', 6.8722, 79.8883, 5, 0.25, '2026-02-18 03:53:47', '2026-02-18 03:53:47', 1),
(8, 'Rajagiriya Junction', 6.9067, 79.8956, 4, 0.15, '2026-02-18 03:53:47', '2026-02-18 03:53:47', 1);

-- --------------------------------------------------------

--
-- Table structure for table `quick_hazard_alerts`
--

CREATE TABLE `quick_hazard_alerts` (
  `id` int(11) NOT NULL,
  `user_id` varchar(36) NOT NULL,
  `alert_type` varchar(30) NOT NULL,
  `latitude` float NOT NULL,
  `longitude` float NOT NULL,
  `speed_at_report` float DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `upvote_count` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ride_groups`
--

CREATE TABLE `ride_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `invite_code` varchar(6) NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shared_routes`
--

CREATE TABLE `shared_routes` (
  `id` int(11) NOT NULL,
  `user_id` varchar(36) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `start_lat` float NOT NULL,
  `start_lon` float NOT NULL,
  `end_lat` float NOT NULL,
  `end_lon` float NOT NULL,
  `route_polyline` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`route_polyline`)),
  `safety_score` int(11) DEFAULT NULL,
  `distance_km` float DEFAULT NULL,
  `follower_count` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shared_trips`
--

CREATE TABLE `shared_trips` (
  `id` int(11) NOT NULL,
  `user_id` varchar(36) NOT NULL,
  `trip_id` varchar(36) NOT NULL,
  `caption` text DEFAULT NULL,
  `safety_score` int(11) DEFAULT NULL,
  `distance_km` float DEFAULT NULL,
  `duration_seconds` int(11) DEFAULT NULL,
  `route_polyline` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`route_polyline`)),
  `like_count` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shared_trips`
--

INSERT INTO `shared_trips` (`id`, `user_id`, `trip_id`, `caption`, `safety_score`, `distance_km`, `duration_seconds`, `route_polyline`, `like_count`, `created_at`) VALUES
(1, 'demo-user-001', 'dc0cc52b-b4e4-4fdc-a4cd-59ef871e7858', NULL, 100, 0, 0, '[{\"lat\": 6.87375, \"lon\": 79.8702}]', 0, '2026-04-28 23:22:22');

-- --------------------------------------------------------

--
-- Table structure for table `telemetry_points`
--

CREATE TABLE `telemetry_points` (
  `id` int(11) NOT NULL,
  `trip_id` varchar(36) NOT NULL,
  `timestamp` datetime DEFAULT NULL,
  `latitude` float NOT NULL,
  `longitude` float NOT NULL,
  `speed_kph` float DEFAULT NULL,
  `heading` float DEFAULT NULL,
  `risk_score` float DEFAULT NULL,
  `risk_level` varchar(10) DEFAULT NULL,
  `alert_level` varchar(10) DEFAULT NULL,
  `detected_signs` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`detected_signs`)),
  `belief_dangerous` float DEFAULT NULL,
  `conflict_measure` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `telemetry_points`
--

INSERT INTO `telemetry_points` (`id`, `trip_id`, `timestamp`, `latitude`, `longitude`, `speed_kph`, `heading`, `risk_score`, `risk_level`, `alert_level`, `detected_signs`, `belief_dangerous`, `conflict_measure`) VALUES
(1, 'b70c8697-d513-4934-9838-48f45ac5afa1', '2026-03-11 00:21:17', 6.9, 79.8, 30, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(2, '61a73467-d698-4419-8caf-35f2b3562252', '2026-03-11 00:21:47', 6.87389, 79.8702, 0.894695, 115.929, 0, 'LOW', 'GREEN', '[]', 0, 0),
(3, 'e86a586e-3e7f-4751-b36a-2a83db1a833e', '2026-03-11 00:21:47', 6.87389, 79.8702, 0.894695, 115.929, 0, 'LOW', 'GREEN', '[]', 0, 0),
(4, '81cdff91-6038-4920-9dc2-12c9fd9c584b', '2026-03-11 00:21:47', 6.87385, 79.8702, 1.58442, 161.969, 0, 'LOW', 'GREEN', '[]', 0, 0),
(5, 'e187f9c7-e70b-4ca8-817b-208fe0ab2a6d', '2026-03-11 00:21:47', 6.87389, 79.8702, 0.791388, 291.999, 0, 'LOW', 'GREEN', '[]', 0, 0),
(6, 'a9c7956c-1ba0-4684-9eee-f1464c871521', '2026-03-11 00:21:47', 6.87389, 79.8702, 0.791388, 291.999, 0, 'LOW', 'GREEN', '[]', 0, 0),
(7, '74f965ff-dff9-4e1f-86d1-f4539ed360e2', '2026-03-11 00:21:48', 6.87383, 79.8702, 0.537984, 352.879, 0, 'LOW', 'GREEN', '[]', 0, 0),
(8, 'b5c1d848-0636-44f5-9a76-3ce0b7efdb74', '2026-03-11 00:21:49', 6.87389, 79.8702, 0.894695, 115.929, 0, 'LOW', 'GREEN', '[]', 0, 0),
(9, '23c79849-5f05-4573-a744-d05f52dddb7b', '2026-03-11 00:21:49', 6.8739, 79.8702, 0.755879, 36.2744, 0, 'LOW', 'GREEN', '[]', 0, 0),
(10, 'a9e6105f-82a5-488d-b89f-7d8f02761ac4', '2026-03-11 00:21:49', 6.87385, 79.8702, 1.58442, 161.969, 0, 'LOW', 'GREEN', '[]', 0, 0),
(11, '2ced1465-d0c6-4472-9703-28b4ae5e2f96', '2026-03-11 00:21:49', 6.8739, 79.8702, 0.755879, 36.2744, 0, 'LOW', 'GREEN', '[]', 0, 0),
(12, '74f965ff-dff9-4e1f-86d1-f4539ed360e2', '2026-03-11 00:21:49', 6.87389, 79.8702, 0.791208, 292, 0, 'LOW', 'GREEN', '[]', 0, 0),
(13, 'c89196f2-83a2-47d6-b06c-1c868f52acb4', '2026-03-11 00:21:51', 6.8739, 79.8702, 0.755512, 36.3019, 0, 'LOW', 'GREEN', '[]', 0, 0),
(14, '74f965ff-dff9-4e1f-86d1-f4539ed360e2', '2026-03-11 00:21:51', 6.87389, 79.8702, 0.791208, 292, 0, 'LOW', 'GREEN', '[]', 0, 0),
(15, '69ef18b4-99db-46c1-a101-c5ebdf182afc', '2026-03-11 00:21:53', 6.87384, 79.8702, 0.503835, 0.0669586, 0, 'LOW', 'GREEN', '[]', 0, 0),
(16, 'f7410cf4-c3bc-4546-b630-b37efd9bb97e', '2026-03-11 00:21:53', 6.87384, 79.8702, 0.503835, 0.0669586, 0, 'LOW', 'GREEN', '[]', 0, 0),
(17, '14550ade-cd5c-43bf-aef6-d323ad373d8e', '2026-03-11 00:21:53', 6.87389, 79.8702, 0.895895, 115.952, 0, 'LOW', 'GREEN', '[]', 0, 0),
(18, '9b4f24b2-9cce-40b1-97ff-1f5718f46adf', '2026-03-11 00:21:53', 6.87389, 79.8702, 0.895895, 115.952, 0, 'LOW', 'GREEN', '[]', 0, 0),
(19, '0547ef2f-684b-4b79-9a0b-720527d41584', '2026-03-11 00:21:53', 6.8739, 79.8702, 0.755512, 36.3019, 0, 'LOW', 'GREEN', '[]', 0, 0),
(20, '74f965ff-dff9-4e1f-86d1-f4539ed360e2', '2026-03-11 00:21:53', 6.87389, 79.8702, 0.791208, 292, 0, 'LOW', 'GREEN', '[]', 0, 0),
(21, 'ce2d79f9-1732-421c-bca8-1a98edfd9fca', '2026-03-11 00:21:53', 6.87384, 79.8702, 0.503422, 0.0744998, 0, 'LOW', 'GREEN', '[]', 0, 0),
(22, '25d5b0e9-7ed5-45dd-a3a5-b1aa8f9a8e47', '2026-03-11 00:21:54', 6.8739, 79.8702, 0.755512, 36.3019, 0, 'LOW', 'GREEN', '[]', 0, 0),
(23, 'bb396d5b-0646-4148-9a50-21b2090c5112', '2026-03-11 00:21:56', 6.87384, 79.8702, 0.503422, 0.0744998, 0, 'LOW', 'GREEN', '[]', 0, 0),
(24, '25d5b0e9-7ed5-45dd-a3a5-b1aa8f9a8e47', '2026-03-11 00:21:57', 6.87395, 79.8702, 0.649108, 6.20129, 0, 'LOW', 'GREEN', '[]', 0, 0),
(25, 'bb396d5b-0646-4148-9a50-21b2090c5112', '2026-03-11 00:21:57', 6.87395, 79.8702, 0.649108, 6.20129, 0, 'LOW', 'GREEN', '[]', 0, 0),
(26, 'e7ca2fa8-9da6-48d8-bfa4-50b52d755a8d', '2026-03-11 00:21:58', 6.87384, 79.8702, 0.503422, 0.0744998, 0, 'LOW', 'GREEN', '[]', 0, 0),
(27, '39a6e7bf-4dec-4d68-bd86-3e7d67430023', '2026-03-11 00:21:59', 6.87386, 79.8702, 1.58487, 161.95, 0, 'LOW', 'GREEN', '[]', 0, 0),
(28, 'aeaf3464-3f28-4ae9-92d2-60c4b260abd1', '2026-03-11 00:21:59', 6.87386, 79.8702, 1.58487, 161.95, 0, 'LOW', 'GREEN', '[]', 0, 0),
(29, 'e7ca2fa8-9da6-48d8-bfa4-50b52d755a8d', '2026-03-11 00:21:59', 6.87395, 79.8702, 0.649035, 6.23296, 0, 'LOW', 'GREEN', '[]', 0, 0),
(30, '4de02bd2-351b-4f7f-8864-efcba396c10e', '2026-03-11 00:22:01', 6.87386, 79.8702, 1.58487, 161.95, 0, 'LOW', 'GREEN', '[]', 0, 0),
(31, 'e7ca2fa8-9da6-48d8-bfa4-50b52d755a8d', '2026-03-11 00:22:02', 6.87395, 79.8702, 0.649035, 6.23296, 0, 'LOW', 'GREEN', '[]', 0, 0),
(32, '52546221-a6db-4315-8064-c7f2fff12fb6', '2026-03-11 00:22:02', 6.87388, 79.8702, 0.720609, 3.03528, 0, 'LOW', 'GREEN', '[]', 0, 0),
(33, 'aaadb59b-9828-45de-a716-37c0c2a1fc4b', '2026-03-11 00:22:02', 6.87388, 79.8702, 0.720609, 3.03528, 0, 'LOW', 'GREEN', '[]', 0, 0),
(34, 'f4580f74-a316-45c7-967e-c19ff2113ca5', '2026-03-11 00:22:21', 6.87374, 79.8702, 0, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(35, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:22:21', 6.87374, 79.8702, 0, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(36, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:22:23', 6.87374, 79.8702, 0, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(37, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:22:25', 6.87374, 79.8702, 0, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(38, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:22:29', 6.87387, 79.8702, 0.432932, 359.993, 0, 'LOW', 'GREEN', '[]', 0, 0),
(39, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:22:29', 6.87387, 79.8702, 0.432932, 359.993, 0, 'LOW', 'GREEN', '[]', 0, 0),
(40, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:22:31', 6.87387, 79.8702, 0.433024, 359.992, 0, 'LOW', 'GREEN', '[]', 0, 0),
(41, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:22:33', 6.87387, 79.8702, 0.433024, 359.992, 0, 'LOW', 'GREEN', '[]', 0, 0),
(42, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:22:35', 6.87387, 79.8702, 0.433024, 359.992, 0, 'LOW', 'GREEN', '[]', 0, 0),
(43, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:22:39', 6.8739, 79.8702, 0.144243, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(44, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:22:40', 6.8739, 79.8702, 0.144243, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(45, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:22:41', 6.8739, 79.8702, 0.144204, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(46, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:22:43', 6.8739, 79.8702, 0.144204, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(47, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:22:45', 6.8739, 79.8702, 0.144204, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(48, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:22:49', 6.87385, 79.8702, 0.251431, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(49, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:22:49', 6.87385, 79.8702, 0.251431, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(50, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:22:51', 6.87385, 79.8702, 0.251314, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(51, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:22:53', 6.87385, 79.8702, 0.251314, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(52, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:22:55', 6.87385, 79.8702, 0.251314, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(53, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:22:59', 6.87391, 79.8702, 0.756456, 355.109, 0, 'LOW', 'GREEN', '[]', 0, 0),
(54, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:22:59', 6.87391, 79.8702, 0.756456, 355.109, 0, 'LOW', 'GREEN', '[]', 0, 0),
(55, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:23:01', 6.87391, 79.8702, 0.756194, 355.122, 0, 'LOW', 'GREEN', '[]', 0, 0),
(56, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:23:03', 6.87391, 79.8702, 0.756194, 355.122, 0, 'LOW', 'GREEN', '[]', 0, 0),
(57, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:23:05', 6.87391, 79.8702, 0.756194, 355.122, 0, 'LOW', 'GREEN', '[]', 0, 0),
(58, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:23:09', 6.87391, 79.8702, 0.540007, 307.977, 0, 'LOW', 'GREEN', '[]', 0, 0),
(59, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:23:10', 6.87391, 79.8702, 0.540007, 307.977, 0, 'LOW', 'GREEN', '[]', 0, 0),
(60, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:23:11', 6.87391, 79.8702, 0.539811, 307.971, 0, 'LOW', 'GREEN', '[]', 0, 0),
(61, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:23:13', 6.87391, 79.8702, 0.539811, 307.971, 0, 'LOW', 'GREEN', '[]', 0, 0),
(62, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:23:15', 6.87391, 79.8702, 0.539811, 307.971, 0, 'LOW', 'GREEN', '[]', 0, 0),
(63, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:23:19', 6.87386, 79.8702, 1.11589, 245.929, 0, 'LOW', 'GREEN', '[]', 0, 0),
(64, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:23:19', 6.87386, 79.8702, 1.11589, 245.929, 0, 'LOW', 'GREEN', '[]', 0, 0),
(65, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:23:21', 6.87386, 79.8702, 1.11538, 245.925, 0, 'LOW', 'GREEN', '[]', 0, 0),
(66, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:23:23', 6.87386, 79.8702, 1.11538, 245.925, 0, 'LOW', 'GREEN', '[]', 0, 0),
(67, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:23:25', 6.87386, 79.8702, 1.11538, 245.925, 0, 'LOW', 'GREEN', '[]', 0, 0),
(68, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:23:29', 6.87378, 79.8702, 0.358412, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(69, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:23:29', 6.87378, 79.8702, 0.358412, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(70, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:23:31', 6.87378, 79.8702, 0.358142, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(71, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:23:33', 6.87378, 79.8702, 0.358142, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(72, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:23:37', 6.87385, 79.8702, 0.217476, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(73, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:23:37', 6.87385, 79.8702, 0.217476, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(74, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:23:39', 6.87385, 79.8702, 0.217607, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(75, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:23:41', 6.87385, 79.8702, 0.217607, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(76, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:23:43', 6.87385, 79.8702, 0.217607, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(77, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:23:47', 6.87381, 79.8702, 0.899476, 267.93, 0, 'LOW', 'GREEN', '[]', 0, 0),
(78, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:23:47', 6.87381, 79.8702, 0.899476, 267.93, 0, 'LOW', 'GREEN', '[]', 0, 0),
(79, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:23:49', 6.87381, 79.8702, 0.899196, 267.922, 0, 'LOW', 'GREEN', '[]', 0, 0),
(80, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:23:51', 6.87381, 79.8702, 0.899196, 267.922, 0, 'LOW', 'GREEN', '[]', 0, 0),
(81, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:23:53', 6.87381, 79.8702, 0.899196, 267.922, 0, 'LOW', 'GREEN', '[]', 0, 0),
(82, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:23:56', 6.87374, 79.8702, 3.05683, 163.544, 0, 'LOW', 'GREEN', '[]', 0, 0),
(83, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:23:57', 6.87374, 79.8702, 3.05683, 163.544, 0, 'LOW', 'GREEN', '[]', 0, 0),
(84, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:23:59', 6.87374, 79.8702, 3.05683, 163.544, 0, 'LOW', 'GREEN', '[]', 0, 0),
(85, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:24:03', 6.87393, 79.8702, 0.869759, 336.209, 0, 'LOW', 'GREEN', '[]', 0, 0),
(86, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:24:03', 6.87393, 79.8702, 0.869759, 336.209, 0, 'LOW', 'GREEN', '[]', 0, 0),
(87, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:24:05', 6.87394, 79.8702, 0.869879, 336.228, 0, 'LOW', 'GREEN', '[]', 0, 0),
(88, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:24:07', 6.87394, 79.8702, 0.869879, 336.228, 0, 'LOW', 'GREEN', '[]', 0, 0),
(89, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:24:09', 6.87394, 79.8702, 0.869879, 336.228, 0, 'LOW', 'GREEN', '[]', 0, 0),
(90, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:24:13', 6.87375, 79.8702, 7.95221, 179.832, 0, 'LOW', 'GREEN', '[]', 0, 0),
(91, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:24:13', 6.87375, 79.8702, 7.95221, 179.832, 0, 'LOW', 'GREEN', '[]', 0, 0),
(92, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:24:15', 6.87375, 79.8702, 7.95221, 179.832, 0, 'LOW', 'GREEN', '[]', 0, 0),
(93, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:24:17', 6.87375, 79.8702, 7.95221, 179.832, 0, 'LOW', 'GREEN', '[]', 0, 0),
(94, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:24:21', 6.87399, 79.8702, 1.10906, 199.258, 0, 'LOW', 'GREEN', '[]', 0, 0),
(95, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:24:21', 6.87399, 79.8702, 1.10906, 199.258, 0, 'LOW', 'GREEN', '[]', 0, 0),
(96, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:24:23', 6.87398, 79.8702, 1.10784, 199.26, 0, 'LOW', 'GREEN', '[]', 0, 0),
(97, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:24:25', 6.87398, 79.8702, 1.10784, 199.26, 0, 'LOW', 'GREEN', '[]', 0, 0),
(98, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:24:27', 6.87398, 79.8702, 1.10784, 199.26, 0, 'LOW', 'GREEN', '[]', 0, 0),
(99, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:24:31', 6.87391, 79.8702, 1.1166, 87.2093, 0, 'LOW', 'GREEN', '[]', 0, 0),
(100, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:24:31', 6.87391, 79.8702, 1.1166, 87.2093, 0, 'LOW', 'GREEN', '[]', 0, 0),
(101, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:24:33', 6.87391, 79.8702, 1.11627, 87.2358, 0, 'LOW', 'GREEN', '[]', 0, 0),
(102, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:24:35', 6.87391, 79.8702, 1.11627, 87.2358, 0, 'LOW', 'GREEN', '[]', 0, 0),
(103, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:24:37', 6.87391, 79.8702, 1.11627, 87.2358, 0, 'LOW', 'GREEN', '[]', 0, 0),
(104, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:24:41', 6.87386, 79.8702, 0.5747, 302.945, 0, 'LOW', 'GREEN', '[]', 0, 0),
(105, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:24:41', 6.87386, 79.8702, 0.5747, 302.945, 0, 'LOW', 'GREEN', '[]', 0, 0),
(106, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:24:43', 6.87386, 79.8702, 0.574357, 302.928, 0, 'LOW', 'GREEN', '[]', 0, 0),
(107, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:24:45', 6.87386, 79.8702, 0.574357, 302.928, 0, 'LOW', 'GREEN', '[]', 0, 0),
(108, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:24:47', 6.87386, 79.8702, 0.574357, 302.928, 0, 'LOW', 'GREEN', '[]', 0, 0),
(109, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:24:51', 6.87385, 79.8702, 0.829008, 203.16, 0, 'LOW', 'GREEN', '[]', 0, 0),
(110, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:24:52', 6.87385, 79.8702, 0.829008, 203.16, 0, 'LOW', 'GREEN', '[]', 0, 0),
(111, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:24:53', 6.87384, 79.8702, 0.828519, 203.168, 0, 'LOW', 'GREEN', '[]', 0, 0),
(112, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:24:55', 6.87384, 79.8702, 0.828519, 203.168, 0, 'LOW', 'GREEN', '[]', 0, 0),
(113, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:24:57', 6.87384, 79.8702, 0.828519, 203.168, 0, 'LOW', 'GREEN', '[]', 0, 0),
(114, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:25:01', 6.87383, 79.8702, 0.14373, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(115, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:25:01', 6.87383, 79.8702, 0.14373, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(116, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:25:03', 6.87383, 79.8702, 0.143673, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(117, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:25:05', 6.87383, 79.8702, 0.143673, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(118, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:25:07', 6.87383, 79.8702, 0.143673, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(119, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:25:11', 6.87378, 79.8702, 0.575388, 276.874, 0, 'LOW', 'GREEN', '[]', 0, 0),
(120, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:25:11', 6.87378, 79.8702, 0.575388, 276.874, 0, 'LOW', 'GREEN', '[]', 0, 0),
(121, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:25:13', 6.87378, 79.8702, 0.575175, 276.856, 0, 'LOW', 'GREEN', '[]', 0, 0),
(122, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:25:15', 6.87378, 79.8702, 0.575175, 276.856, 0, 'LOW', 'GREEN', '[]', 0, 0),
(123, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:25:17', 6.87378, 79.8702, 0.575175, 276.856, 0, 'LOW', 'GREEN', '[]', 0, 0),
(124, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:25:21', 6.87388, 79.8702, 0.720203, 53.7853, 0, 'LOW', 'GREEN', '[]', 0, 0),
(125, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:25:21', 6.87388, 79.8702, 0.720203, 53.7853, 0, 'LOW', 'GREEN', '[]', 0, 0),
(126, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:25:23', 6.87388, 79.8702, 0.719919, 53.7617, 0, 'LOW', 'GREEN', '[]', 0, 0),
(127, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:25:25', 6.87388, 79.8702, 0.719919, 53.7617, 0, 'LOW', 'GREEN', '[]', 0, 0),
(128, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:25:27', 6.87388, 79.8702, 0.719919, 53.7617, 0, 'LOW', 'GREEN', '[]', 0, 0),
(129, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:25:31', 6.87386, 79.8703, 1.65658, 74.0383, 0, 'LOW', 'GREEN', '[]', 0, 0),
(130, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:25:31', 6.87386, 79.8703, 1.65658, 74.0383, 0, 'LOW', 'GREEN', '[]', 0, 0),
(131, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:25:33', 6.87387, 79.8703, 1.65618, 74.0494, 0, 'LOW', 'GREEN', '[]', 0, 0),
(132, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:25:35', 6.87387, 79.8703, 1.65618, 74.0494, 0, 'LOW', 'GREEN', '[]', 0, 0),
(133, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:25:37', 6.87387, 79.8703, 1.65618, 74.0494, 0, 'LOW', 'GREEN', '[]', 0, 0),
(134, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:25:41', 6.87384, 79.8702, 1.04181, 46.9896, 0, 'LOW', 'GREEN', '[]', 0, 0),
(135, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:25:41', 6.87384, 79.8702, 1.04181, 46.9896, 0, 'LOW', 'GREEN', '[]', 0, 0),
(136, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:25:43', 6.87384, 79.8702, 1.04088, 46.9879, 0, 'LOW', 'GREEN', '[]', 0, 0),
(137, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:25:45', 6.87384, 79.8702, 1.04088, 46.9879, 0, 'LOW', 'GREEN', '[]', 0, 0),
(138, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:25:47', 6.87384, 79.8702, 1.04088, 46.9879, 0, 'LOW', 'GREEN', '[]', 0, 0),
(139, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:25:51', 6.87388, 79.8702, 0.432512, 0.0352195, 0, 'LOW', 'GREEN', '[]', 0, 0),
(140, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:25:51', 6.87388, 79.8702, 0.432512, 0.0352195, 0, 'LOW', 'GREEN', '[]', 0, 0),
(141, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:25:53', 6.87388, 79.8702, 0.432512, 0.0352195, 0, 'LOW', 'GREEN', '[]', 0, 0),
(142, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:25:55', 6.87388, 79.8702, 0.432512, 0.0352195, 0, 'LOW', 'GREEN', '[]', 0, 0),
(143, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:25:59', 6.87387, 79.8702, 0.752232, 62.2654, 0, 'LOW', 'GREEN', '[]', 0, 0),
(144, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:25:59', 6.87387, 79.8702, 0.752232, 62.2654, 0, 'LOW', 'GREEN', '[]', 0, 0),
(145, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:26:01', 6.87387, 79.8702, 0.752232, 62.2654, 0, 'LOW', 'GREEN', '[]', 0, 0),
(146, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:26:03', 6.87387, 79.8702, 0.752232, 62.2654, 0, 'LOW', 'GREEN', '[]', 0, 0),
(147, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:26:07', 6.87388, 79.8702, 0.216285, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(148, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:26:07', 6.87388, 79.8702, 0.216285, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(149, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:26:09', 6.87388, 79.8702, 0.216285, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(150, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:26:11', 6.87388, 79.8702, 0.216285, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(151, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:26:15', 6.87393, 79.8702, 1.04335, 322.013, 0, 'LOW', 'GREEN', '[]', 0, 0),
(152, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:26:15', 6.87393, 79.8702, 1.04335, 322.013, 0, 'LOW', 'GREEN', '[]', 0, 0),
(153, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:26:17', 6.87393, 79.8702, 1.04332, 322.134, 0, 'LOW', 'GREEN', '[]', 0, 0),
(154, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:26:19', 6.87393, 79.8702, 1.04332, 322.134, 0, 'LOW', 'GREEN', '[]', 0, 0),
(155, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:26:21', 6.87393, 79.8702, 1.04332, 322.134, 0, 'LOW', 'GREEN', '[]', 0, 0),
(156, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:26:25', 6.8739, 79.8702, 0.540141, 166.041, 0, 'LOW', 'GREEN', '[]', 0, 0),
(157, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:26:25', 6.8739, 79.8702, 0.540141, 166.041, 0, 'LOW', 'GREEN', '[]', 0, 0),
(158, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:26:27', 6.8739, 79.8702, 0.540141, 166.041, 0, 'LOW', 'GREEN', '[]', 0, 0),
(159, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:26:29', 6.8739, 79.8702, 0.540141, 166.041, 0, 'LOW', 'GREEN', '[]', 0, 0),
(160, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:26:33', 6.87387, 79.8703, 1.22841, 20.1569, 0, 'LOW', 'GREEN', '[]', 0, 0),
(161, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:26:33', 6.87387, 79.8703, 1.22841, 20.1569, 0, 'LOW', 'GREEN', '[]', 0, 0),
(162, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:26:35', 6.87387, 79.8703, 1.22841, 20.1569, 0, 'LOW', 'GREEN', '[]', 0, 0),
(163, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:26:37', 6.87387, 79.8703, 1.22841, 20.1569, 0, 'LOW', 'GREEN', '[]', 0, 0),
(164, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:26:41', 6.87385, 79.8702, 0.284957, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(165, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:26:41', 6.87385, 79.8702, 0.284957, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(166, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:26:43', 6.87385, 79.8702, 0.284957, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(167, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:26:45', 6.87385, 79.8702, 0.284957, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(168, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:26:49', 6.87386, 79.8702, 0.252537, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(169, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:26:49', 6.87386, 79.8702, 0.252537, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(170, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:26:51', 6.87386, 79.8702, 0.252537, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(171, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:26:53', 6.87386, 79.8702, 0.252537, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(172, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:26:57', 6.87383, 79.8702, 0.863202, 281.559, 0, 'LOW', 'GREEN', '[]', 0, 0),
(173, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:26:57', 6.87383, 79.8702, 0.863202, 281.559, 0, 'LOW', 'GREEN', '[]', 0, 0),
(174, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:26:59', 6.87383, 79.8702, 0.863202, 281.559, 0, 'LOW', 'GREEN', '[]', 0, 0),
(175, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:27:01', 6.87383, 79.8702, 0.863202, 281.559, 0, 'LOW', 'GREEN', '[]', 0, 0),
(176, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:27:05', 6.87385, 79.8702, 1.1163, 173.052, 0, 'LOW', 'GREEN', '[]', 0, 0),
(177, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:27:05', 6.87385, 79.8702, 1.1163, 173.052, 0, 'LOW', 'GREEN', '[]', 0, 0),
(178, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:27:07', 6.87385, 79.8702, 1.1163, 173.052, 0, 'LOW', 'GREEN', '[]', 0, 0),
(179, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:27:09', 6.87385, 79.8702, 1.1163, 173.052, 0, 'LOW', 'GREEN', '[]', 0, 0),
(180, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:27:13', 6.87382, 79.8702, 0.827074, 51.0477, 0, 'LOW', 'GREEN', '[]', 0, 0),
(181, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:27:13', 6.87382, 79.8702, 0.827074, 51.0477, 0, 'LOW', 'GREEN', '[]', 0, 0),
(182, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:27:15', 6.87382, 79.8702, 0.826171, 51.076, 0, 'LOW', 'GREEN', '[]', 0, 0),
(183, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:27:17', 6.87382, 79.8702, 0.826171, 51.076, 0, 'LOW', 'GREEN', '[]', 0, 0),
(184, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:27:19', 6.87382, 79.8702, 0.826171, 51.076, 0, 'LOW', 'GREEN', '[]', 0, 0),
(185, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:27:23', 6.87381, 79.8702, 1.04265, 10.7476, 0, 'LOW', 'GREEN', '[]', 0, 0),
(186, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:27:23', 6.87381, 79.8702, 1.04265, 10.7476, 0, 'LOW', 'GREEN', '[]', 0, 0),
(187, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:27:25', 6.87381, 79.8702, 1.04265, 10.7476, 0, 'LOW', 'GREEN', '[]', 0, 0),
(188, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:27:27', 6.87381, 79.8702, 1.04265, 10.7476, 0, 'LOW', 'GREEN', '[]', 0, 0),
(189, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:27:31', 6.87388, 79.8701, 1.01798, 336.663, 0, 'LOW', 'GREEN', '[]', 0, 0),
(190, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:27:31', 6.87388, 79.8701, 1.01798, 336.663, 0, 'LOW', 'GREEN', '[]', 0, 0),
(191, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:27:33', 6.87388, 79.8701, 1.01798, 336.663, 0, 'LOW', 'GREEN', '[]', 0, 0),
(192, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:27:35', 6.87388, 79.8701, 1.01798, 336.663, 0, 'LOW', 'GREEN', '[]', 0, 0),
(193, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:27:39', 6.87391, 79.8701, 1.18429, 250.086, 0, 'LOW', 'GREEN', '[]', 0, 0),
(194, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:27:39', 6.87391, 79.8701, 1.18429, 250.086, 0, 'LOW', 'GREEN', '[]', 0, 0),
(195, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:27:41', 6.87391, 79.8701, 1.18429, 250.086, 0, 'LOW', 'GREEN', '[]', 0, 0),
(196, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:27:43', 6.87391, 79.8701, 1.18429, 250.086, 0, 'LOW', 'GREEN', '[]', 0, 0),
(197, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:27:47', 6.87392, 79.8702, 0.360613, 0.5845, 0, 'LOW', 'GREEN', '[]', 0, 0),
(198, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:27:47', 6.87392, 79.8702, 0.360613, 0.5845, 0, 'LOW', 'GREEN', '[]', 0, 0),
(199, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:27:49', 6.87392, 79.8702, 0.360613, 0.5845, 0, 'LOW', 'GREEN', '[]', 0, 0),
(200, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:27:51', 6.87392, 79.8702, 0.360613, 0.5845, 0, 'LOW', 'GREEN', '[]', 0, 0),
(201, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:27:55', 6.87387, 79.8702, 1.21799, 55.2723, 0, 'LOW', 'GREEN', '[]', 0, 0),
(202, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:27:55', 6.87387, 79.8702, 1.21799, 55.2723, 0, 'LOW', 'GREEN', '[]', 0, 0),
(203, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:27:57', 6.87387, 79.8702, 1.21799, 55.2723, 0, 'LOW', 'GREEN', '[]', 0, 0),
(204, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:27:59', 6.87387, 79.8702, 1.21799, 55.2723, 0, 'LOW', 'GREEN', '[]', 0, 0),
(205, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:28:03', 6.87388, 79.8702, 0.288094, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(206, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:28:03', 6.87388, 79.8702, 0.288094, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(207, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:28:05', 6.87388, 79.8702, 0.288036, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(208, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:28:07', 6.87388, 79.8702, 0.288036, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(209, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:28:09', 6.87388, 79.8702, 0.288036, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(210, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:28:12', 6.87375, 79.8702, 5.97505, 176.952, 0, 'LOW', 'GREEN', '[]', 0, 0),
(211, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:28:13', 6.87375, 79.8702, 5.97505, 176.952, 0, 'LOW', 'GREEN', '[]', 0, 0),
(212, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:28:15', 6.87375, 79.8702, 5.97505, 176.952, 0, 'LOW', 'GREEN', '[]', 0, 0),
(213, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:28:17', 6.87375, 79.8702, 5.97505, 176.952, 0, 'LOW', 'GREEN', '[]', 0, 0),
(214, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:28:21', 6.87393, 79.8702, 0.54011, 274.397, 0, 'LOW', 'GREEN', '[]', 0, 0),
(215, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:28:21', 6.87393, 79.8702, 0.54011, 274.397, 0, 'LOW', 'GREEN', '[]', 0, 0),
(216, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:28:23', 6.87393, 79.8702, 0.54011, 274.397, 0, 'LOW', 'GREEN', '[]', 0, 0),
(217, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:28:25', 6.87393, 79.8702, 0.54011, 274.397, 0, 'LOW', 'GREEN', '[]', 0, 0),
(218, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:28:29', 6.87392, 79.8702, 0.142343, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(219, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:28:29', 6.87392, 79.8702, 0.142343, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(220, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:28:31', 6.87392, 79.8702, 0.142343, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(221, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:28:33', 6.87392, 79.8702, 0.142343, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(222, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:28:37', 6.87385, 79.8702, 0.212403, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(223, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:28:37', 6.87385, 79.8702, 0.212403, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(224, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:28:39', 6.87385, 79.8702, 0.212403, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(225, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:28:41', 6.87385, 79.8702, 0.212403, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(226, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:28:45', 6.8739, 79.8702, 0.575721, 160.001, 0, 'LOW', 'GREEN', '[]', 0, 0),
(227, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:28:45', 6.8739, 79.8702, 0.575721, 160.001, 0, 'LOW', 'GREEN', '[]', 0, 0),
(228, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:28:47', 6.8739, 79.8702, 0.575721, 160.001, 0, 'LOW', 'GREEN', '[]', 0, 0),
(229, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:28:49', 6.8739, 79.8702, 0.575721, 160.001, 0, 'LOW', 'GREEN', '[]', 0, 0),
(230, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:28:53', 6.8739, 79.8702, 1.54244, 150.11, 0, 'LOW', 'GREEN', '[]', 0, 0),
(231, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:28:53', 6.8739, 79.8702, 1.54244, 150.11, 0, 'LOW', 'GREEN', '[]', 0, 0),
(232, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:28:55', 6.8739, 79.8702, 1.54244, 150.11, 0, 'LOW', 'GREEN', '[]', 0, 0),
(233, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:28:57', 6.8739, 79.8702, 1.54244, 150.11, 0, 'LOW', 'GREEN', '[]', 0, 0),
(234, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:29:01', 6.87386, 79.8702, 1.26895, 196.101, 0, 'LOW', 'GREEN', '[]', 0, 0),
(235, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:29:01', 6.87386, 79.8702, 1.26895, 196.101, 0, 'LOW', 'GREEN', '[]', 0, 0),
(236, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:29:03', 6.87386, 79.8702, 1.26895, 196.101, 0, 'LOW', 'GREEN', '[]', 0, 0),
(237, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:29:05', 6.87386, 79.8702, 1.26895, 196.101, 0, 'LOW', 'GREEN', '[]', 0, 0),
(238, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:29:09', 6.87388, 79.8702, 0.434986, 359.947, 0, 'LOW', 'GREEN', '[]', 0, 0),
(239, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:29:09', 6.87388, 79.8702, 0.434986, 359.947, 0, 'LOW', 'GREEN', '[]', 0, 0),
(240, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:29:11', 6.87388, 79.8702, 0.434986, 359.947, 0, 'LOW', 'GREEN', '[]', 0, 0),
(241, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:29:13', 6.87388, 79.8702, 0.434986, 359.947, 0, 'LOW', 'GREEN', '[]', 0, 0),
(242, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:29:17', 6.8739, 79.8702, 0.713133, 207.264, 0, 'LOW', 'GREEN', '[]', 0, 0),
(243, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:29:17', 6.8739, 79.8702, 0.713133, 207.264, 0, 'LOW', 'GREEN', '[]', 0, 0),
(244, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:29:19', 6.8739, 79.8702, 0.713133, 207.264, 0, 'LOW', 'GREEN', '[]', 0, 0),
(245, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:29:21', 6.8739, 79.8702, 0.713133, 207.264, 0, 'LOW', 'GREEN', '[]', 0, 0),
(246, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:29:25', 6.87389, 79.8702, 1.00697, 82.002, 0, 'LOW', 'GREEN', '[]', 0, 0),
(247, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:29:25', 6.87389, 79.8702, 1.00697, 82.002, 0, 'LOW', 'GREEN', '[]', 0, 0),
(248, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:29:27', 6.87389, 79.8702, 1.00697, 82.002, 0, 'LOW', 'GREEN', '[]', 0, 0),
(249, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:29:29', 6.87389, 79.8702, 1.00697, 82.002, 0, 'LOW', 'GREEN', '[]', 0, 0),
(250, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:29:33', 6.87388, 79.8702, 0.502678, 359.893, 0, 'LOW', 'GREEN', '[]', 0, 0),
(251, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:29:33', 6.87388, 79.8702, 0.502678, 359.893, 0, 'LOW', 'GREEN', '[]', 0, 0),
(252, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:29:35', 6.87388, 79.8702, 0.502678, 359.893, 0, 'LOW', 'GREEN', '[]', 0, 0),
(253, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:29:37', 6.87388, 79.8702, 0.502678, 359.893, 0, 'LOW', 'GREEN', '[]', 0, 0),
(254, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:29:41', 6.87388, 79.8702, 1.33114, 110.975, 0, 'LOW', 'GREEN', '[]', 0, 0),
(255, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:29:41', 6.87388, 79.8702, 1.33114, 110.975, 0, 'LOW', 'GREEN', '[]', 0, 0),
(256, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:29:43', 6.87388, 79.8702, 1.33071, 110.98, 0, 'LOW', 'GREEN', '[]', 0, 0),
(257, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:29:45', 6.87388, 79.8702, 1.33071, 110.98, 0, 'LOW', 'GREEN', '[]', 0, 0),
(258, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:29:49', 6.87386, 79.8702, 0.756346, 222.007, 0, 'LOW', 'GREEN', '[]', 0, 0),
(259, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:29:50', 6.87386, 79.8702, 0.756346, 222.007, 0, 'LOW', 'GREEN', '[]', 0, 0),
(260, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:29:51', 6.87386, 79.8702, 0.756376, 222.022, 0, 'LOW', 'GREEN', '[]', 0, 0),
(261, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:29:53', 6.87386, 79.8702, 0.756376, 222.022, 0, 'LOW', 'GREEN', '[]', 0, 0),
(262, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:29:57', 6.87393, 79.8702, 0.865326, 339.942, 0, 'LOW', 'GREEN', '[]', 0, 0),
(263, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:29:57', 6.87393, 79.8702, 0.865326, 339.942, 0, 'LOW', 'GREEN', '[]', 0, 0),
(264, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:29:59', 6.87393, 79.8702, 0.865538, 339.943, 0, 'LOW', 'GREEN', '[]', 0, 0),
(265, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:30:01', 6.87393, 79.8702, 0.865538, 339.943, 0, 'LOW', 'GREEN', '[]', 0, 0),
(266, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:30:03', 6.87393, 79.8702, 0.865538, 339.943, 0, 'LOW', 'GREEN', '[]', 0, 0),
(267, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:30:07', 6.87381, 79.8701, 1.08182, 189.04, 0, 'LOW', 'GREEN', '[]', 0, 0),
(268, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:30:07', 6.87381, 79.8701, 1.08182, 189.04, 0, 'LOW', 'GREEN', '[]', 0, 0),
(269, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:30:09', 6.87381, 79.8701, 1.08182, 189.04, 0, 'LOW', 'GREEN', '[]', 0, 0),
(270, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:30:11', 6.87381, 79.8701, 1.08182, 189.04, 0, 'LOW', 'GREEN', '[]', 0, 0),
(271, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:30:15', 6.87376, 79.8701, 0.357832, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(272, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:30:15', 6.87376, 79.8701, 0.357832, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(273, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:30:17', 6.87376, 79.8701, 0.357832, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(274, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:30:19', 6.87376, 79.8701, 0.357832, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(275, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:30:23', 6.87386, 79.8701, 0.431994, 0.000814003, 0, 'LOW', 'GREEN', '[]', 0, 0),
(276, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:30:23', 6.87386, 79.8701, 0.431994, 0.000814003, 0, 'LOW', 'GREEN', '[]', 0, 0),
(277, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:30:25', 6.87386, 79.8701, 0.431994, 0.000814003, 0, 'LOW', 'GREEN', '[]', 0, 0),
(278, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:30:27', 6.87387, 79.8701, 0.43408, 0.198218, 0, 'LOW', 'GREEN', '[]', 0, 0),
(279, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:30:29', 6.87387, 79.8701, 0.43408, 0.198218, 0, 'LOW', 'GREEN', '[]', 0, 0),
(280, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:30:33', 6.87392, 79.8702, 0.610369, 195.928, 0, 'LOW', 'GREEN', '[]', 0, 0),
(281, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:30:33', 6.87392, 79.8702, 0.610369, 195.928, 0, 'LOW', 'GREEN', '[]', 0, 0),
(282, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:30:35', 6.87392, 79.8702, 0.610063, 195.918, 0, 'LOW', 'GREEN', '[]', 0, 0),
(283, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:30:37', 6.87392, 79.8702, 0.610063, 195.918, 0, 'LOW', 'GREEN', '[]', 0, 0),
(284, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:30:39', 6.87392, 79.8702, 0.610063, 195.918, 0, 'LOW', 'GREEN', '[]', 0, 0),
(285, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:30:43', 6.87393, 79.8702, 0.288096, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(286, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:30:43', 6.87393, 79.8702, 0.288096, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(287, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:30:45', 6.87393, 79.8702, 0.288124, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(288, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:30:47', 6.87393, 79.8702, 0.288124, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(289, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:30:49', 6.87393, 79.8702, 0.288124, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(290, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:30:53', 6.87382, 79.8702, 0.281482, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(291, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:30:53', 6.87382, 79.8702, 0.281482, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(292, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:30:55', 6.87382, 79.8702, 0.281482, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(293, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:30:57', 6.87382, 79.8702, 0.281482, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(294, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:31:01', 6.87378, 79.8702, 0.139787, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(295, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:31:01', 6.87378, 79.8702, 0.139787, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(296, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:31:03', 6.87378, 79.8702, 0.139787, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(297, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:31:05', 6.87378, 79.8702, 0.139787, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(298, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:31:09', 6.87391, 79.8702, 2.20482, 342.9, 0, 'LOW', 'GREEN', '[]', 0, 0),
(299, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:31:09', 6.87391, 79.8702, 2.20482, 342.9, 0, 'LOW', 'GREEN', '[]', 0, 0),
(300, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:31:11', 6.87391, 79.8702, 2.20482, 342.9, 0, 'LOW', 'GREEN', '[]', 0, 0),
(301, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:31:13', 6.87391, 79.8702, 2.20482, 342.9, 0, 'LOW', 'GREEN', '[]', 0, 0),
(302, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:31:17', 6.87392, 79.8702, 0.251217, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(303, '7672c604-d00d-46ae-b06e-3e58f7436950', '2026-03-11 00:31:17', 6.87392, 79.8702, 0.251217, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(304, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:04:59', 6.87374, 79.8702, 0, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(305, '5bb3f648-e3a7-4db3-bae6-f66293473563', '2026-03-16 23:05:01', 6.87374, 79.8702, 0, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(306, '86aebb16-9b26-40a3-96ad-633911093050', '2026-03-16 23:05:02', 6.87374, 79.8702, 0, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(307, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:05:05', 6.87374, 79.8702, 0, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(308, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:05:07', 6.87375, 79.8702, 0.113605, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(309, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:05:08', 6.87375, 79.8702, 0.113605, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(310, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:05:11', 6.87375, 79.8702, 0.113605, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(311, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:05:11', 6.87375, 79.8702, 0.113605, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(312, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:05:14', 6.87375, 79.8702, 0.113605, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(313, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:05:17', 6.87375, 79.8702, 0.236861, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(314, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:05:17', 6.87375, 79.8702, 0.236861, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(315, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:05:21', 6.87375, 79.8702, 0.236861, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(316, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:05:21', 6.87375, 79.8702, 0.236861, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(317, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:05:24', 6.87375, 79.8702, 0.236861, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(318, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:05:26', 6.87375, 79.8702, 0.184008, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(319, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:05:28', 6.87375, 79.8702, 0.184008, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(320, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:05:29', 6.87375, 79.8702, 0.184008, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(321, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:05:31', 6.87375, 79.8702, 0.184008, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(322, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:05:34', 6.87375, 79.8702, 0.456391, 94.8087, 0, 'LOW', 'GREEN', '[]', 0, 0),
(323, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:05:36', 6.87375, 79.8702, 0.456391, 94.8087, 0, 'LOW', 'GREEN', '[]', 0, 0),
(324, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:05:37', 6.87375, 79.8702, 0.456391, 94.8087, 0, 'LOW', 'GREEN', '[]', 0, 0),
(325, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:05:39', 6.87375, 79.8702, 0.456391, 94.8087, 0, 'LOW', 'GREEN', '[]', 0, 0),
(326, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:05:41', 6.87375, 79.8702, 0.456391, 94.8087, 0, 'LOW', 'GREEN', '[]', 0, 0),
(327, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:05:43', 6.87375, 79.8702, 0.124499, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(328, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:05:45', 6.87375, 79.8702, 0.124499, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(329, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:05:47', 6.87375, 79.8702, 0.124499, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(330, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:05:49', 6.87375, 79.8702, 0.124499, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(331, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:05:52', 6.87375, 79.8702, 0.289295, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(332, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:05:54', 6.87375, 79.8702, 0.289295, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(333, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:05:55', 6.87375, 79.8702, 0.289295, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(334, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:05:57', 6.87375, 79.8702, 0.289295, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(335, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:05:59', 6.87375, 79.8702, 0.289295, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(336, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:06:03', 6.87375, 79.8702, 0.224808, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(337, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:06:03', 6.87375, 79.8702, 0.224808, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(338, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:06:06', 6.87375, 79.8702, 0.224808, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(339, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:06:07', 6.87375, 79.8702, 0.224808, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(340, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:06:09', 6.87375, 79.8702, 0.224808, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(341, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:06:12', 6.87375, 79.8702, 0.100202, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(342, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:06:14', 6.87375, 79.8702, 0.100202, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(343, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:06:15', 6.87375, 79.8702, 0.100202, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(344, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:06:17', 6.87375, 79.8702, 0.100202, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(345, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:06:19', 6.87375, 79.8702, 0.100202, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(346, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:06:21', 6.87375, 79.8702, 0.245163, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(347, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:06:23', 6.87375, 79.8702, 0.245163, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(348, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:06:25', 6.87375, 79.8702, 0.245163, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(349, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:06:28', 6.87375, 79.8702, 0.245163, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(350, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:06:31', 6.87374, 79.8702, 0.360584, 122.439, 0, 'LOW', 'GREEN', '[]', 0, 0),
(351, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:06:31', 6.87374, 79.8702, 0.360584, 122.439, 0, 'LOW', 'GREEN', '[]', 0, 0),
(352, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:06:33', 6.87374, 79.8702, 0.360584, 122.439, 0, 'LOW', 'GREEN', '[]', 0, 0),
(353, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:06:35', 6.87374, 79.8702, 0.360584, 122.439, 0, 'LOW', 'GREEN', '[]', 0, 0),
(354, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:06:38', 6.87374, 79.8702, 0.360584, 122.439, 0, 'LOW', 'GREEN', '[]', 0, 0),
(355, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:06:40', 6.87375, 79.8702, 0.372074, 286.629, 0, 'LOW', 'GREEN', '[]', 0, 0),
(356, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:06:42', 6.87375, 79.8702, 0.372074, 286.629, 0, 'LOW', 'GREEN', '[]', 0, 0),
(357, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:06:43', 6.87375, 79.8702, 0.372074, 286.629, 0, 'LOW', 'GREEN', '[]', 0, 0),
(358, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:06:45', 6.87375, 79.8702, 0.372074, 286.629, 0, 'LOW', 'GREEN', '[]', 0, 0),
(359, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:06:49', 6.87375, 79.8702, 0.372074, 286.629, 0, 'LOW', 'GREEN', '[]', 0, 0),
(360, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:06:49', 6.87374, 79.8702, 0.464745, 105.703, 0, 'LOW', 'GREEN', '[]', 0, 0),
(361, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:06:52', 6.87374, 79.8702, 0.464745, 105.703, 0, 'LOW', 'GREEN', '[]', 0, 0),
(362, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:06:54', 6.87374, 79.8702, 0.464745, 105.703, 0, 'LOW', 'GREEN', '[]', 0, 0),
(363, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:06:55', 6.87374, 79.8702, 0.464745, 105.703, 0, 'LOW', 'GREEN', '[]', 0, 0),
(364, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:06:58', 6.87375, 79.8702, 0.362266, 350.21, 0, 'LOW', 'GREEN', '[]', 0, 0),
(365, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:07:01', 6.87375, 79.8702, 0.362266, 350.21, 0, 'LOW', 'GREEN', '[]', 0, 0),
(366, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:07:01', 6.87375, 79.8702, 0.362266, 350.21, 0, 'LOW', 'GREEN', '[]', 0, 0),
(367, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:07:04', 6.87375, 79.8702, 0.362266, 350.21, 0, 'LOW', 'GREEN', '[]', 0, 0),
(368, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:07:05', 6.87375, 79.8702, 0.362266, 350.21, 0, 'LOW', 'GREEN', '[]', 0, 0),
(369, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:07:07', 6.87375, 79.8702, 0.464712, 235.23, 0, 'LOW', 'GREEN', '[]', 0, 0),
(370, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:07:11', 6.87375, 79.8702, 0.464712, 235.23, 0, 'LOW', 'GREEN', '[]', 0, 0),
(371, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:07:11', 6.87375, 79.8702, 0.464712, 235.23, 0, 'LOW', 'GREEN', '[]', 0, 0),
(372, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:07:14', 6.87375, 79.8702, 0.464712, 235.23, 0, 'LOW', 'GREEN', '[]', 0, 0),
(373, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:07:17', 6.87375, 79.8702, 0.354159, 0, 0, 'LOW', 'GREEN', '[]', 0, 0);
INSERT INTO `telemetry_points` (`id`, `trip_id`, `timestamp`, `latitude`, `longitude`, `speed_kph`, `heading`, `risk_score`, `risk_level`, `alert_level`, `detected_signs`, `belief_dangerous`, `conflict_measure`) VALUES
(374, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:07:22', 6.87375, 79.8702, 0.354159, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(375, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:07:26', 6.87374, 79.8702, 0.211626, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(376, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:07:29', 6.87374, 79.8702, 0.211626, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(377, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:07:32', 6.87374, 79.8702, 0.211626, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(378, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:07:35', 6.87375, 79.8702, 0.0992057, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(379, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:07:38', 6.87375, 79.8702, 0.0992057, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(380, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:07:42', 6.87375, 79.8702, 0.0992057, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(381, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:07:44', 6.87375, 79.8702, 0.293351, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(382, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:07:49', 6.87375, 79.8702, 0.293351, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(383, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:07:54', 6.87375, 79.8702, 0.147563, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(384, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:07:55', 6.87375, 79.8702, 0.147563, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(385, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:07:59', 6.87375, 79.8702, 0.147563, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(386, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:08:04', 6.87375, 79.8702, 0.324488, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(387, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:08:07', 6.87375, 79.8702, 0.324488, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(388, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:08:10', 6.87375, 79.8702, 0.324488, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(389, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:08:13', 6.87375, 79.8702, 0.173939, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(390, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:08:16', 6.87375, 79.8702, 0.173939, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(391, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:08:19', 6.87375, 79.8702, 0.173939, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(392, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:08:22', 6.87375, 79.8702, 0.121467, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(393, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:08:25', 6.87375, 79.8702, 0.121467, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(394, '3cd74236-58f5-4459-84db-2438def2e319', '2026-03-16 23:08:29', 6.87375, 79.8702, 0.121467, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(395, '2c865369-8b4f-48dc-b31f-82ee8aed5db4', '2026-03-16 23:29:28', 6.87374, 79.8702, 0, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(396, 'dc7080a4-a498-4631-81a0-3a54ce13d348', '2026-03-16 23:29:29', 6.87374, 79.8702, 0, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(397, 'dc7080a4-a498-4631-81a0-3a54ce13d348', '2026-03-16 23:29:30', 6.87374, 79.8702, 0, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(398, 'dc7080a4-a498-4631-81a0-3a54ce13d348', '2026-03-16 23:29:34', 6.87375, 79.8702, 2.90272, 287.063, 0, 'LOW', 'GREEN', '[]', 0, 0),
(399, 'dc7080a4-a498-4631-81a0-3a54ce13d348', '2026-03-16 23:29:35', 6.87375, 79.8702, 2.90272, 287.063, 0, 'LOW', 'GREEN', '[]', 0, 0),
(400, 'dc7080a4-a498-4631-81a0-3a54ce13d348', '2026-03-16 23:29:36', 6.87375, 79.8702, 2.91381, 287.013, 0, 'LOW', 'GREEN', '[]', 0, 0),
(401, 'dc7080a4-a498-4631-81a0-3a54ce13d348', '2026-03-16 23:29:38', 6.87375, 79.8702, 2.91381, 287.013, 0, 'LOW', 'GREEN', '[]', 0, 0),
(402, 'dc7080a4-a498-4631-81a0-3a54ce13d348', '2026-03-16 23:29:43', 6.87376, 79.8702, 2.91384, 287.012, 0, 'LOW', 'GREEN', '[]', 0, 0),
(403, 'dc7080a4-a498-4631-81a0-3a54ce13d348', '2026-03-16 23:29:43', 6.87376, 79.8702, 2.91384, 287.012, 0, 'LOW', 'GREEN', '[]', 0, 0),
(404, 'dc7080a4-a498-4631-81a0-3a54ce13d348', '2026-03-16 23:29:45', 6.87376, 79.8702, 2.91384, 287.012, 0, 'LOW', 'GREEN', '[]', 0, 0),
(405, 'dc7080a4-a498-4631-81a0-3a54ce13d348', '2026-03-16 23:29:46', 6.87376, 79.8702, 2.91384, 287.012, 0, 'LOW', 'GREEN', '[]', 0, 0),
(406, 'dc7080a4-a498-4631-81a0-3a54ce13d348', '2026-03-16 23:29:51', 6.87376, 79.8702, 4.18807, 58.8656, 0, 'LOW', 'GREEN', '[]', 0, 0),
(407, 'dc7080a4-a498-4631-81a0-3a54ce13d348', '2026-03-16 23:29:51', 6.87376, 79.8702, 4.18807, 58.8656, 0, 'LOW', 'GREEN', '[]', 0, 0),
(408, 'dc7080a4-a498-4631-81a0-3a54ce13d348', '2026-03-16 23:29:52', 6.87376, 79.8702, 4.2116, 59.0052, 0, 'LOW', 'GREEN', '[]', 0, 0),
(409, 'dc7080a4-a498-4631-81a0-3a54ce13d348', '2026-03-16 23:29:54', 6.87376, 79.8702, 4.2116, 59.0052, 0, 'LOW', 'GREEN', '[]', 0, 0),
(410, 'dc7080a4-a498-4631-81a0-3a54ce13d348', '2026-03-16 23:29:56', 6.87376, 79.8702, 4.2116, 59.0052, 0, 'LOW', 'GREEN', '[]', 0, 0),
(411, 'dc7080a4-a498-4631-81a0-3a54ce13d348', '2026-03-16 23:30:01', 6.87376, 79.8702, 3.51945, 58.5134, 0, 'LOW', 'GREEN', '[]', 0, 0),
(412, 'dc7080a4-a498-4631-81a0-3a54ce13d348', '2026-03-16 23:30:01', 6.87376, 79.8702, 3.51945, 58.5134, 0, 'LOW', 'GREEN', '[]', 0, 0),
(413, 'dc7080a4-a498-4631-81a0-3a54ce13d348', '2026-03-16 23:30:03', 6.87376, 79.8702, 3.51945, 58.5134, 0, 'LOW', 'GREEN', '[]', 0, 0),
(414, 'dc7080a4-a498-4631-81a0-3a54ce13d348', '2026-03-16 23:30:04', 6.87376, 79.8702, 3.51945, 58.5134, 0, 'LOW', 'GREEN', '[]', 0, 0),
(415, 'dc7080a4-a498-4631-81a0-3a54ce13d348', '2026-03-16 23:30:09', 6.87376, 79.8702, 3.72651, 62.9357, 0, 'LOW', 'GREEN', '[]', 0, 0),
(416, 'dc7080a4-a498-4631-81a0-3a54ce13d348', '2026-03-16 23:30:09', 6.87376, 79.8702, 3.72651, 62.9357, 0, 'LOW', 'GREEN', '[]', 0, 0),
(417, 'dc7080a4-a498-4631-81a0-3a54ce13d348', '2026-03-16 23:30:10', 6.87376, 79.8702, 3.74271, 62.9932, 0, 'LOW', 'GREEN', '[]', 0, 0),
(418, 'dc7080a4-a498-4631-81a0-3a54ce13d348', '2026-03-16 23:30:12', 6.87376, 79.8702, 3.74271, 62.9932, 0, 'LOW', 'GREEN', '[]', 0, 0),
(419, 'dc7080a4-a498-4631-81a0-3a54ce13d348', '2026-03-16 23:30:17', 6.87376, 79.8702, 3.74144, 62.9863, 0, 'LOW', 'GREEN', '[]', 0, 0),
(420, 'dc7080a4-a498-4631-81a0-3a54ce13d348', '2026-03-16 23:30:17', 6.87376, 79.8702, 3.74144, 62.9863, 0, 'LOW', 'GREEN', '[]', 0, 0),
(421, 'dc7080a4-a498-4631-81a0-3a54ce13d348', '2026-03-16 23:30:19', 6.87376, 79.8702, 3.74144, 62.9863, 0, 'LOW', 'GREEN', '[]', 0, 0),
(422, 'dc7080a4-a498-4631-81a0-3a54ce13d348', '2026-03-16 23:30:20', 6.87376, 79.8702, 3.74144, 62.9863, 0, 'LOW', 'GREEN', '[]', 0, 0),
(423, 'd53c466c-fde3-475c-a48b-6b62e938739a', '2026-03-16 23:47:39', 6.87375, 79.8702, 0.17818, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(424, '5bcbb54c-cb74-4b7f-8337-4e297beaebe7', '2026-03-16 23:47:39', 6.87375, 79.8702, 0.17818, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(425, '0ca8e543-6381-4965-98d8-3fe1f9c0ce3b', '2026-03-16 23:47:41', 6.87375, 79.8702, 0.17818, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(426, '4a9c8369-f883-463e-90c9-192d43431515', '2026-03-16 23:47:42', 6.87375, 79.8702, 0.17818, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(427, '4a9c8369-f883-463e-90c9-192d43431515', '2026-03-16 23:47:45', 6.87375, 79.8702, 0.190621, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(428, '4a9c8369-f883-463e-90c9-192d43431515', '2026-03-16 23:47:45', 6.87375, 79.8702, 0.190621, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(429, '4a9c8369-f883-463e-90c9-192d43431515', '2026-03-16 23:47:47', 6.87375, 79.8702, 0.190621, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(430, '4a9c8369-f883-463e-90c9-192d43431515', '2026-03-16 23:47:48', 6.87375, 79.8702, 0.190621, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(431, '4a9c8369-f883-463e-90c9-192d43431515', '2026-03-16 23:47:54', 6.87375, 79.8702, 0.433841, 70.7057, 0, 'LOW', 'GREEN', '[]', 0, 0),
(432, '4a9c8369-f883-463e-90c9-192d43431515', '2026-03-16 23:47:54', 6.87375, 79.8702, 0.433841, 70.7057, 0, 'LOW', 'GREEN', '[]', 0, 0),
(433, '4a9c8369-f883-463e-90c9-192d43431515', '2026-03-16 23:47:57', 6.87375, 79.8702, 0.433841, 70.7057, 0, 'LOW', 'GREEN', '[]', 0, 0),
(434, '4a9c8369-f883-463e-90c9-192d43431515', '2026-03-16 23:47:57', 6.87375, 79.8702, 0.433841, 70.7057, 0, 'LOW', 'GREEN', '[]', 0, 0),
(435, '4a9c8369-f883-463e-90c9-192d43431515', '2026-03-16 23:47:58', 6.87375, 79.8702, 0.433841, 70.7057, 0, 'LOW', 'GREEN', '[]', 0, 0),
(436, '4a9c8369-f883-463e-90c9-192d43431515', '2026-03-16 23:48:03', 6.87375, 79.8702, 0.127979, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(437, '4a9c8369-f883-463e-90c9-192d43431515', '2026-03-16 23:48:04', 6.87375, 79.8702, 0.127979, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(438, '4a9c8369-f883-463e-90c9-192d43431515', '2026-03-16 23:48:05', 6.87375, 79.8702, 0.127979, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(439, '4a9c8369-f883-463e-90c9-192d43431515', '2026-03-16 23:48:06', 6.87375, 79.8702, 0.127979, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(440, '4a9c8369-f883-463e-90c9-192d43431515', '2026-03-16 23:48:11', 6.87375, 79.8702, 0.105308, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(441, '4a9c8369-f883-463e-90c9-192d43431515', '2026-03-16 23:48:12', 6.87375, 79.8702, 0.105308, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(442, '4a9c8369-f883-463e-90c9-192d43431515', '2026-03-16 23:48:14', 6.87375, 79.8702, 0.105308, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(443, '875b48cf-bc1f-42b5-aec4-7c0323bc1a92', '2026-03-16 23:48:19', 6.87375, 79.8702, 0.00801206, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(444, 'c8211b06-b433-43cc-b804-9ae26c1b479f', '2026-03-16 23:49:27', 6.87375, 79.8702, 0, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(445, 'c8211b06-b433-43cc-b804-9ae26c1b479f', '2026-03-16 23:49:29', 6.87375, 79.8702, 0, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(446, 'c8211b06-b433-43cc-b804-9ae26c1b479f', '2026-03-16 23:49:34', 6.87376, 79.8702, 1.0776, 51.9316, 0, 'LOW', 'GREEN', '[]', 0, 0),
(447, 'c8211b06-b433-43cc-b804-9ae26c1b479f', '2026-03-16 23:49:37', 6.87376, 79.8702, 1.07966, 51.99, 0, 'LOW', 'GREEN', '[]', 0, 0),
(448, 'c8211b06-b433-43cc-b804-9ae26c1b479f', '2026-03-16 23:49:39', 6.87376, 79.8702, 1.07966, 51.99, 0, 'LOW', 'GREEN', '[]', 0, 0),
(449, 'c8211b06-b433-43cc-b804-9ae26c1b479f', '2026-03-16 23:49:43', 6.87376, 79.8702, 1.07965, 51.9936, 0, 'LOW', 'GREEN', '[]', 0, 0),
(450, 'c8211b06-b433-43cc-b804-9ae26c1b479f', '2026-03-16 23:49:45', 6.87376, 79.8702, 1.07965, 51.9936, 0, 'LOW', 'GREEN', '[]', 0, 0),
(451, 'c8211b06-b433-43cc-b804-9ae26c1b479f', '2026-03-16 23:49:47', 6.87376, 79.8702, 1.07965, 51.9936, 0, 'LOW', 'GREEN', '[]', 0, 0),
(452, 'c8211b06-b433-43cc-b804-9ae26c1b479f', '2026-03-16 23:49:51', 6.87375, 79.8702, 0.934009, 53.8115, 0, 'LOW', 'GREEN', '[]', 0, 0),
(453, 'c8211b06-b433-43cc-b804-9ae26c1b479f', '2026-03-16 23:49:53', 6.87375, 79.8702, 0.934009, 53.8115, 0, 'LOW', 'GREEN', '[]', 0, 0),
(454, 'c8211b06-b433-43cc-b804-9ae26c1b479f', '2026-03-16 23:49:55', 6.87375, 79.8702, 0.934009, 53.8115, 0, 'LOW', 'GREEN', '[]', 0, 0),
(455, 'c8211b06-b433-43cc-b804-9ae26c1b479f', '2026-03-16 23:49:59', 6.87375, 79.8702, 0.41299, 214.515, 0, 'LOW', 'GREEN', '[]', 0, 0),
(456, 'c8211b06-b433-43cc-b804-9ae26c1b479f', '2026-03-16 23:50:01', 6.87375, 79.8702, 0.41299, 214.515, 0, 'LOW', 'GREEN', '[]', 0, 0),
(457, 'c8211b06-b433-43cc-b804-9ae26c1b479f', '2026-03-16 23:50:03', 6.87375, 79.8702, 0.41299, 214.515, 0, 'LOW', 'GREEN', '[]', 0, 0),
(458, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:50:06', 6.87375, 79.8702, 0, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(459, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:50:09', 6.87375, 79.8702, 0.286589, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(460, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:50:11', 6.87375, 79.8702, 0.286589, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(461, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:50:15', 6.87375, 79.8702, 0.299358, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(462, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:50:17', 6.87375, 79.8702, 0.299358, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(463, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:50:19', 6.87375, 79.8702, 0.299358, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(464, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:50:23', 6.87375, 79.8702, 0.168899, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(465, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:50:25', 6.87375, 79.8702, 0.168899, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(466, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:50:27', 6.87375, 79.8702, 0.168899, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(467, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:50:31', 6.87375, 79.8702, 0.0817252, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(468, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:50:33', 6.87375, 79.8702, 0.0817252, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(469, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:50:35', 6.87375, 79.8702, 0.0817252, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(470, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:50:39', 6.87374, 79.8702, 0.310039, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(471, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:50:41', 6.87376, 79.8702, 1.60701, 244.877, 0, 'LOW', 'GREEN', '[]', 0, 0),
(472, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:50:43', 6.87376, 79.8702, 1.60701, 244.877, 0, 'LOW', 'GREEN', '[]', 0, 0),
(473, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:50:47', 6.87376, 79.8702, 1.61917, 244.989, 0, 'LOW', 'GREEN', '[]', 0, 0),
(474, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:50:49', 6.87376, 79.8702, 1.61917, 244.989, 0, 'LOW', 'GREEN', '[]', 0, 0),
(475, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:50:51', 6.87376, 79.8702, 1.61917, 244.989, 0, 'LOW', 'GREEN', '[]', 0, 0),
(476, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:50:55', 6.87375, 79.8702, 1.45807, 242.779, 0, 'LOW', 'GREEN', '[]', 0, 0),
(477, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:50:57', 6.87375, 79.8702, 1.45807, 242.779, 0, 'LOW', 'GREEN', '[]', 0, 0),
(478, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:50:59', 6.87375, 79.8702, 1.45807, 242.779, 0, 'LOW', 'GREEN', '[]', 0, 0),
(479, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:51:03', 6.87374, 79.8702, 0.713012, 116.39, 0, 'LOW', 'GREEN', '[]', 0, 0),
(480, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:51:05', 6.87374, 79.8702, 0.713012, 116.39, 0, 'LOW', 'GREEN', '[]', 0, 0),
(481, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:51:07', 6.87374, 79.8702, 0.713012, 116.39, 0, 'LOW', 'GREEN', '[]', 0, 0),
(482, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:51:11', 6.87374, 79.8702, 0.109285, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(483, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:51:13', 6.87375, 79.8702, 0.323646, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(484, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:51:15', 6.87375, 79.8702, 0.323646, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(485, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:51:19', 6.87375, 79.8702, 0.324015, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(486, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:51:21', 6.87375, 79.8702, 0.324015, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(487, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:51:23', 6.87375, 79.8702, 0.324015, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(488, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:51:28', 6.87375, 79.8702, 0.235999, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(489, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:51:29', 6.87375, 79.8702, 0.235999, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(490, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:51:31', 6.87375, 79.8702, 0.235999, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(491, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:51:35', 6.87375, 79.8702, 0.423539, 126.478, 0, 'LOW', 'GREEN', '[]', 0, 0),
(492, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:51:37', 6.87375, 79.8702, 0.423539, 126.478, 0, 'LOW', 'GREEN', '[]', 0, 0),
(493, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:51:39', 6.87375, 79.8702, 0.423539, 126.478, 0, 'LOW', 'GREEN', '[]', 0, 0),
(494, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:51:43', 6.87375, 79.8702, 0.224754, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(495, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:51:45', 6.87375, 79.8702, 1.36447, 294.038, 0, 'LOW', 'GREEN', '[]', 0, 0),
(496, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:51:47', 6.87375, 79.8702, 1.36447, 294.038, 0, 'LOW', 'GREEN', '[]', 0, 0),
(497, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:51:51', 6.87375, 79.8702, 1.36727, 294.012, 0, 'LOW', 'GREEN', '[]', 0, 0),
(498, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:51:53', 6.87375, 79.8702, 1.36727, 294.012, 0, 'LOW', 'GREEN', '[]', 0, 0),
(499, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:51:55', 6.87375, 79.8702, 1.36727, 294.012, 0, 'LOW', 'GREEN', '[]', 0, 0),
(500, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:51:59', 6.87375, 79.8702, 1.12772, 298.011, 0, 'LOW', 'GREEN', '[]', 0, 0),
(501, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:52:02', 6.87375, 79.8702, 0.397437, 359.998, 0, 'LOW', 'GREEN', '[]', 0, 0),
(502, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:52:03', 6.87375, 79.8702, 0.397437, 359.998, 0, 'LOW', 'GREEN', '[]', 0, 0),
(503, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:52:07', 6.87376, 79.8702, 0.395854, 0.000000165675, 0, 'LOW', 'GREEN', '[]', 0, 0),
(504, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:52:09', 6.87376, 79.8702, 0.395854, 0.000000165675, 0, 'LOW', 'GREEN', '[]', 0, 0),
(505, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:52:11', 6.87376, 79.8702, 0.395854, 0.000000165675, 0, 'LOW', 'GREEN', '[]', 0, 0),
(506, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:52:15', 6.87375, 79.8702, 0.232986, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(507, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:52:17', 6.87375, 79.8702, 0.232986, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(508, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:52:19', 6.87375, 79.8702, 0.232986, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(509, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:52:23', 6.87375, 79.8702, 0.117558, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(510, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:52:25', 6.87375, 79.8702, 0.117558, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(511, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:52:27', 6.87375, 79.8702, 0.117558, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(512, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:52:31', 6.87375, 79.8702, 0.304721, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(513, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:52:33', 6.87375, 79.8702, 0.304721, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(514, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:52:35', 6.87375, 79.8702, 0.304721, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(515, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:52:39', 6.87375, 79.8702, 0.232187, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(516, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:52:41', 6.87375, 79.8702, 0.232187, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(517, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:52:43', 6.87375, 79.8702, 0.232187, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(518, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:52:47', 6.87375, 79.8702, 0.0160184, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(519, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:52:49', 6.87375, 79.8702, 0.0160184, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(520, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:52:51', 6.87375, 79.8702, 0.0160184, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(521, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:52:55', 6.87375, 79.8702, 0.493625, 289.705, 0, 'LOW', 'GREEN', '[]', 0, 0),
(522, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:52:57', 6.87375, 79.8702, 0.493625, 289.705, 0, 'LOW', 'GREEN', '[]', 0, 0),
(523, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:52:59', 6.87375, 79.8702, 0.493625, 289.705, 0, 'LOW', 'GREEN', '[]', 0, 0),
(524, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:53:03', 6.87375, 79.8702, 0.292106, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(525, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:53:05', 6.87375, 79.8702, 0.292106, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(526, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:53:07', 6.87375, 79.8702, 0.292106, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(527, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:53:11', 6.87375, 79.8702, 0.0413977, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(528, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:53:13', 6.87375, 79.8702, 0.0413977, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(529, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:53:15', 6.87375, 79.8702, 0.0413977, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(530, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:53:19', 6.87375, 79.8702, 0.204832, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(531, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:53:21', 6.87375, 79.8702, 0.204832, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(532, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:53:23', 6.87375, 79.8702, 0.204832, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(533, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:53:27', 6.87375, 79.8702, 0.191082, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(534, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:53:29', 6.87375, 79.8702, 0.191082, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(535, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:53:31', 6.87375, 79.8702, 0.191082, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(536, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:53:35', 6.87375, 79.8702, 0.242102, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(537, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:53:38', 6.87375, 79.8702, 0.242102, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(538, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:53:39', 6.87375, 79.8702, 0.242102, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(539, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:53:43', 6.87375, 79.8702, 0.52924, 78.9266, 0, 'LOW', 'GREEN', '[]', 0, 0),
(540, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:53:45', 6.87375, 79.8702, 0.52924, 78.9266, 0, 'LOW', 'GREEN', '[]', 0, 0),
(541, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:53:47', 6.87375, 79.8702, 0.52924, 78.9266, 0, 'LOW', 'GREEN', '[]', 0, 0),
(542, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:53:51', 6.87375, 79.8702, 0.334243, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(543, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:53:53', 6.87375, 79.8702, 1.36257, 355.975, 0, 'LOW', 'GREEN', '[]', 0, 0),
(544, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:53:55', 6.87375, 79.8702, 1.36257, 355.975, 0, 'LOW', 'GREEN', '[]', 0, 0),
(545, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:53:59', 6.87376, 79.8702, 1.36687, 355.997, 0, 'LOW', 'GREEN', '[]', 0, 0),
(546, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:54:01', 6.87376, 79.8702, 1.36687, 355.997, 0, 'LOW', 'GREEN', '[]', 0, 0),
(547, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:54:03', 6.87376, 79.8702, 1.36687, 355.997, 0, 'LOW', 'GREEN', '[]', 0, 0),
(548, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:54:07', 6.87375, 79.8702, 1.05169, 355.204, 0, 'LOW', 'GREEN', '[]', 0, 0),
(549, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:54:09', 6.87375, 79.8702, 1.05169, 355.204, 0, 'LOW', 'GREEN', '[]', 0, 0),
(550, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:54:11', 6.87375, 79.8702, 1.05169, 355.204, 0, 'LOW', 'GREEN', '[]', 0, 0),
(551, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:54:15', 6.87374, 79.8702, 0.564942, 150.126, 0, 'LOW', 'GREEN', '[]', 0, 0),
(552, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:54:17', 6.87374, 79.8702, 0.564942, 150.126, 0, 'LOW', 'GREEN', '[]', 0, 0),
(553, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:54:19', 6.87374, 79.8702, 0.564942, 150.126, 0, 'LOW', 'GREEN', '[]', 0, 0),
(554, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:54:23', 6.87374, 79.8702, 0.0473977, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(555, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:54:25', 6.87374, 79.8702, 0.0473977, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(556, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:54:27', 6.87374, 79.8702, 0.0473977, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(557, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:54:31', 6.87375, 79.8702, 0.553211, 316.997, 0, 'LOW', 'GREEN', '[]', 0, 0),
(558, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:54:33', 6.87375, 79.8702, 0.553211, 316.997, 0, 'LOW', 'GREEN', '[]', 0, 0),
(559, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:54:35', 6.87375, 79.8702, 0.553211, 316.997, 0, 'LOW', 'GREEN', '[]', 0, 0),
(560, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:54:39', 6.87375, 79.8702, 0.377419, 118.589, 0, 'LOW', 'GREEN', '[]', 0, 0),
(561, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:54:41', 6.87375, 79.8702, 0.377419, 118.589, 0, 'LOW', 'GREEN', '[]', 0, 0),
(562, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:54:43', 6.87375, 79.8702, 0.377419, 118.589, 0, 'LOW', 'GREEN', '[]', 0, 0),
(563, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:54:47', 6.87375, 79.8702, 0.426676, 291.566, 0, 'LOW', 'GREEN', '[]', 0, 0),
(564, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:54:49', 6.87375, 79.8702, 0.426676, 291.566, 0, 'LOW', 'GREEN', '[]', 0, 0),
(565, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:54:51', 6.87375, 79.8702, 0.426676, 291.566, 0, 'LOW', 'GREEN', '[]', 0, 0),
(566, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:54:55', 6.87375, 79.8702, 0.185024, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(567, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:54:57', 6.87375, 79.8702, 1.47272, 211.056, 0, 'LOW', 'GREEN', '[]', 0, 0),
(568, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:54:59', 6.87375, 79.8702, 1.47272, 211.056, 0, 'LOW', 'GREEN', '[]', 0, 0),
(569, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:55:03', 6.87374, 79.8702, 1.47551, 211.008, 0, 'LOW', 'GREEN', '[]', 0, 0),
(570, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:55:05', 6.87374, 79.8702, 1.47551, 211.008, 0, 'LOW', 'GREEN', '[]', 0, 0),
(571, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:55:07', 6.87374, 79.8702, 1.47551, 211.008, 0, 'LOW', 'GREEN', '[]', 0, 0),
(572, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:55:11', 6.87374, 79.8702, 1.23351, 213.463, 0, 'LOW', 'GREEN', '[]', 0, 0),
(573, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:55:14', 6.87374, 79.8702, 1.23351, 213.463, 0, 'LOW', 'GREEN', '[]', 0, 0),
(574, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:55:16', 6.87374, 79.8702, 1.23351, 213.463, 0, 'LOW', 'GREEN', '[]', 0, 0),
(575, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:55:19', 6.87375, 79.8702, 0.295473, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(576, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:55:21', 6.87375, 79.8702, 0.295473, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(577, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:55:23', 6.87375, 79.8702, 0.295473, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(578, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:55:27', 6.87375, 79.8702, 0.116385, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(579, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:55:29', 6.87375, 79.8702, 0.116385, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(580, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:55:31', 6.87375, 79.8702, 0.116385, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(581, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:55:35', 6.87375, 79.8702, 0.330538, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(582, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:55:37', 6.87375, 79.8702, 0.330538, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(583, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:55:39', 6.87375, 79.8702, 0.330538, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(584, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:55:43', 6.87375, 79.8702, 0.182669, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(585, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:55:45', 6.87375, 79.8702, 0.182669, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(586, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:55:47', 6.87375, 79.8702, 0.182669, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(587, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:55:51', 6.87375, 79.8702, 0.346554, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(588, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:55:53', 6.87375, 79.8702, 0.346554, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(589, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:55:55', 6.87375, 79.8702, 0.346554, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(590, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:55:59', 6.87375, 79.8702, 0.271056, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(591, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:56:02', 6.87375, 79.8702, 0.271056, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(592, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:56:03', 6.87375, 79.8702, 0.271056, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(593, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:56:08', 6.87377, 79.8702, 0.219865, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(594, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:56:09', 6.87377, 79.8702, 0.215768, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(595, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:56:11', 6.87377, 79.8702, 0.215768, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(596, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:56:13', 6.87377, 79.8702, 0.215768, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(597, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:56:17', 6.87377, 79.8702, 0.216064, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(598, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:56:19', 6.87377, 79.8702, 0.74404, 229.645, 0, 'LOW', 'GREEN', '[]', 0, 0),
(599, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:56:21', 6.87377, 79.8702, 0.74404, 229.645, 0, 'LOW', 'GREEN', '[]', 0, 0),
(600, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:56:25', 6.87376, 79.8702, 1.00688, 234.967, 0, 'LOW', 'GREEN', '[]', 0, 0),
(601, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:56:27', 6.87376, 79.8702, 1.00688, 234.967, 0, 'LOW', 'GREEN', '[]', 0, 0),
(602, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:56:29', 6.87376, 79.8702, 1.00688, 234.967, 0, 'LOW', 'GREEN', '[]', 0, 0),
(603, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:56:33', 6.87375, 79.8702, 0.899168, 230.014, 0, 'LOW', 'GREEN', '[]', 0, 0),
(604, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:56:35', 6.87375, 79.8702, 0.899168, 230.014, 0, 'LOW', 'GREEN', '[]', 0, 0),
(605, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:56:37', 6.87375, 79.8702, 0.899168, 230.014, 0, 'LOW', 'GREEN', '[]', 0, 0),
(606, 'c8211b06-b433-43cc-b804-9ae26c1b479f', '2026-03-16 23:56:45', 6.87376, 79.8702, 1.0776, 51.9316, 0, 'LOW', 'GREEN', '[]', 0, 0),
(607, 'c8211b06-b433-43cc-b804-9ae26c1b479f', '2026-03-16 23:56:52', 6.87376, 79.8702, 1.07966, 51.99, 0, 'LOW', 'GREEN', '[]', 0, 0),
(608, 'c8211b06-b433-43cc-b804-9ae26c1b479f', '2026-03-16 23:56:58', 6.87376, 79.8702, 1.07965, 51.9936, 0, 'LOW', 'GREEN', '[]', 0, 0),
(609, 'c8211b06-b433-43cc-b804-9ae26c1b479f', '2026-03-16 23:57:05', 6.87375, 79.8702, 0.934009, 53.8115, 0, 'LOW', 'GREEN', '[]', 0, 0),
(610, 'c8211b06-b433-43cc-b804-9ae26c1b479f', '2026-03-16 23:57:11', 6.87375, 79.8702, 0.41299, 214.515, 0, 'LOW', 'GREEN', '[]', 0, 0),
(611, 'c8211b06-b433-43cc-b804-9ae26c1b479f', '2026-03-16 23:57:18', 6.87375, 79.8702, 0.286589, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(612, 'c8211b06-b433-43cc-b804-9ae26c1b479f', '2026-03-16 23:57:24', 6.87375, 79.8702, 0.286589, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(613, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:57:31', 6.87375, 79.8702, 0.299358, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(614, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:57:37', 6.87375, 79.8702, 0.168899, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(615, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:57:44', 6.87375, 79.8702, 0.0817252, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(616, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:57:51', 6.87374, 79.8702, 0.310039, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(617, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:57:57', 6.87376, 79.8702, 1.61917, 244.989, 0, 'LOW', 'GREEN', '[]', 0, 0),
(618, '49afd69c-edc6-490f-a0ed-ca439718541e', '2026-03-16 23:58:03', 6.87375, 79.8702, 1.45807, 242.779, 0, 'LOW', 'GREEN', '[]', 0, 0),
(619, '9e2c81d0-f647-41be-af1a-392e999c0c54', '2026-03-17 00:02:02', 6.87375, 79.8702, 0.285895, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(620, '6287328e-bf20-4cf2-8524-c0c1780ec020', '2026-03-17 00:02:02', 6.87375, 79.8702, 0.285895, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(621, '8d4ad289-8eb6-4e8c-895b-46fd827990ca', '2026-03-17 00:02:05', 6.87375, 79.8702, 0.285895, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(622, '9e2c81d0-f647-41be-af1a-392e999c0c54', '2026-03-17 00:02:06', 6.87375, 79.8702, 0.285895, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(623, '9e2c81d0-f647-41be-af1a-392e999c0c54', '2026-03-17 00:02:10', 6.87375, 79.8702, 0.336685, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(624, '9e2c81d0-f647-41be-af1a-392e999c0c54', '2026-03-17 00:02:10', 6.87375, 79.8702, 0.336685, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(625, '9e2c81d0-f647-41be-af1a-392e999c0c54', '2026-03-17 00:02:12', 6.87375, 79.8702, 0.336685, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(626, '9e2c81d0-f647-41be-af1a-392e999c0c54', '2026-03-17 00:02:14', 6.87375, 79.8702, 0.336685, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(627, '9e2c81d0-f647-41be-af1a-392e999c0c54', '2026-03-17 00:02:18', 6.87375, 79.8702, 0.100499, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(628, '9e2c81d0-f647-41be-af1a-392e999c0c54', '2026-03-17 00:02:19', 6.87375, 79.8702, 0.100499, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(629, '9e2c81d0-f647-41be-af1a-392e999c0c54', '2026-03-17 00:02:20', 6.87375, 79.8702, 0.100499, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(630, '9e2c81d0-f647-41be-af1a-392e999c0c54', '2026-03-17 00:02:22', 6.87375, 79.8702, 0.100499, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(631, '9e2c81d0-f647-41be-af1a-392e999c0c54', '2026-03-17 00:02:27', 6.87375, 79.8702, 0.173547, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(632, '9e2c81d0-f647-41be-af1a-392e999c0c54', '2026-03-17 00:02:27', 6.87375, 79.8702, 0.173547, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(633, '9e2c81d0-f647-41be-af1a-392e999c0c54', '2026-03-17 00:02:28', 6.87375, 79.8702, 0.173547, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(634, '9e2c81d0-f647-41be-af1a-392e999c0c54', '2026-03-17 00:02:30', 6.87375, 79.8702, 0.173547, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(635, 'f63069be-e613-4b03-8b4e-47a290293de3', '2026-03-17 00:04:20', 6.87375, 79.8702, 0, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(636, '603950c9-9c6a-42e7-b08f-3b5a80c6fa61', '2026-03-17 00:04:20', 6.87375, 79.8702, 0, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(637, '603950c9-9c6a-42e7-b08f-3b5a80c6fa61', '2026-03-17 00:04:22', 6.87375, 79.8702, 0, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(638, '603950c9-9c6a-42e7-b08f-3b5a80c6fa61', '2026-03-17 00:04:24', 6.87375, 79.8702, 0, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(639, '603950c9-9c6a-42e7-b08f-3b5a80c6fa61', '2026-03-17 00:04:26', 6.87375, 79.8702, 0.364153, 75.3456, 0, 'LOW', 'GREEN', '[]', 0, 0),
(640, '603950c9-9c6a-42e7-b08f-3b5a80c6fa61', '2026-03-17 00:04:28', 6.87375, 79.8702, 0.364153, 75.3456, 0, 'LOW', 'GREEN', '[]', 0, 0),
(641, '603950c9-9c6a-42e7-b08f-3b5a80c6fa61', '2026-03-17 00:04:30', 6.87375, 79.8702, 0.364153, 75.3456, 0, 'LOW', 'GREEN', '[]', 0, 0),
(642, '603950c9-9c6a-42e7-b08f-3b5a80c6fa61', '2026-03-17 00:04:34', 6.87375, 79.8702, 0.414201, 290.441, 0, 'LOW', 'GREEN', '[]', 0, 0),
(643, '603950c9-9c6a-42e7-b08f-3b5a80c6fa61', '2026-03-17 00:04:35', 6.87375, 79.8702, 0.414201, 290.441, 0, 'LOW', 'GREEN', '[]', 0, 0),
(644, '603950c9-9c6a-42e7-b08f-3b5a80c6fa61', '2026-03-17 00:04:37', 6.87375, 79.8702, 0.414201, 290.441, 0, 'LOW', 'GREEN', '[]', 0, 0),
(645, '603950c9-9c6a-42e7-b08f-3b5a80c6fa61', '2026-03-17 00:04:38', 6.87375, 79.8702, 0.414201, 290.441, 0, 'LOW', 'GREEN', '[]', 0, 0),
(646, '603950c9-9c6a-42e7-b08f-3b5a80c6fa61', '2026-03-17 00:04:42', 6.87375, 79.8702, 0.32439, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(647, '603950c9-9c6a-42e7-b08f-3b5a80c6fa61', '2026-03-17 00:04:42', 6.87375, 79.8702, 0.32439, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(648, '603950c9-9c6a-42e7-b08f-3b5a80c6fa61', '2026-03-17 00:04:44', 6.87375, 79.8702, 0.32439, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(649, '603950c9-9c6a-42e7-b08f-3b5a80c6fa61', '2026-03-17 00:04:46', 6.87375, 79.8702, 0.32439, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(650, '603950c9-9c6a-42e7-b08f-3b5a80c6fa61', '2026-03-17 00:04:50', 6.87375, 79.8702, 0.189547, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(651, '603950c9-9c6a-42e7-b08f-3b5a80c6fa61', '2026-03-17 00:04:50', 6.87375, 79.8702, 0.189547, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(652, '603950c9-9c6a-42e7-b08f-3b5a80c6fa61', '2026-03-17 00:04:52', 6.87375, 79.8702, 0.189547, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(653, '603950c9-9c6a-42e7-b08f-3b5a80c6fa61', '2026-03-17 00:04:54', 6.87375, 79.8702, 0.189547, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(654, '603950c9-9c6a-42e7-b08f-3b5a80c6fa61', '2026-03-17 00:04:58', 6.87375, 79.8702, 0.0937102, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(655, '603950c9-9c6a-42e7-b08f-3b5a80c6fa61', '2026-03-17 00:04:58', 6.87375, 79.8702, 0.0937102, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(656, '603950c9-9c6a-42e7-b08f-3b5a80c6fa61', '2026-03-17 00:05:00', 6.87375, 79.8702, 0.0937102, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(657, '603950c9-9c6a-42e7-b08f-3b5a80c6fa61', '2026-03-17 00:05:02', 6.87375, 79.8702, 0.0937102, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(658, '603950c9-9c6a-42e7-b08f-3b5a80c6fa61', '2026-03-17 00:05:06', 6.87375, 79.8702, 0.385825, 314.222, 0, 'LOW', 'GREEN', '[]', 0, 0),
(659, '603950c9-9c6a-42e7-b08f-3b5a80c6fa61', '2026-03-17 00:05:06', 6.87375, 79.8702, 0.385825, 314.222, 0, 'LOW', 'GREEN', '[]', 0, 0),
(660, '603950c9-9c6a-42e7-b08f-3b5a80c6fa61', '2026-03-17 00:05:08', 6.87375, 79.8702, 0.385825, 314.222, 0, 'LOW', 'GREEN', '[]', 0, 0),
(661, '603950c9-9c6a-42e7-b08f-3b5a80c6fa61', '2026-03-17 00:05:10', 6.87375, 79.8702, 0.385825, 314.222, 0, 'LOW', 'GREEN', '[]', 0, 0),
(662, '603950c9-9c6a-42e7-b08f-3b5a80c6fa61', '2026-03-17 00:05:14', 6.87375, 79.8702, 0.271241, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(663, '603950c9-9c6a-42e7-b08f-3b5a80c6fa61', '2026-03-17 00:05:14', 6.87375, 79.8702, 0.271241, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(664, '603950c9-9c6a-42e7-b08f-3b5a80c6fa61', '2026-03-17 00:05:16', 6.87375, 79.8702, 0.271241, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(665, '603950c9-9c6a-42e7-b08f-3b5a80c6fa61', '2026-03-17 00:05:18', 6.87375, 79.8702, 0.271241, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(666, '603950c9-9c6a-42e7-b08f-3b5a80c6fa61', '2026-03-17 00:05:22', 6.87375, 79.8702, 0.358315, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(667, '603950c9-9c6a-42e7-b08f-3b5a80c6fa61', '2026-03-17 00:05:22', 6.87375, 79.8702, 0.358315, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(668, '603950c9-9c6a-42e7-b08f-3b5a80c6fa61', '2026-03-17 00:05:24', 6.87375, 79.8702, 0.358315, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(669, '603950c9-9c6a-42e7-b08f-3b5a80c6fa61', '2026-03-17 00:05:26', 6.87375, 79.8702, 0.358315, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(670, '603950c9-9c6a-42e7-b08f-3b5a80c6fa61', '2026-03-17 00:05:30', 6.87375, 79.8702, 0.360718, 27.176, 0, 'LOW', 'GREEN', '[]', 0, 0),
(671, '603950c9-9c6a-42e7-b08f-3b5a80c6fa61', '2026-03-17 00:05:30', 6.87375, 79.8702, 0.360718, 27.176, 0, 'LOW', 'GREEN', '[]', 0, 0),
(672, '603950c9-9c6a-42e7-b08f-3b5a80c6fa61', '2026-03-17 00:05:32', 6.87375, 79.8702, 0.360718, 27.176, 0, 'LOW', 'GREEN', '[]', 0, 0),
(673, '603950c9-9c6a-42e7-b08f-3b5a80c6fa61', '2026-03-17 00:05:34', 6.87375, 79.8702, 0.360718, 27.176, 0, 'LOW', 'GREEN', '[]', 0, 0),
(674, 'ab87c838-0e3b-4c61-b986-ec64e2b1d9a3', '2026-03-17 23:35:09', 6.87376, 79.8702, 0.790241, 325.977, 0, 'LOW', 'GREEN', '[]', 0, 0),
(675, 'cae358de-3cc0-47d9-ab4c-55df55979d91', '2026-03-17 23:35:12', 6.87376, 79.8702, 0.790241, 325.977, 0, 'LOW', 'GREEN', '[]', 0, 0),
(676, 'ab87c838-0e3b-4c61-b986-ec64e2b1d9a3', '2026-03-17 23:35:13', 6.87376, 79.8702, 0.791558, 325.97, 0, 'LOW', 'GREEN', '[]', 0, 0),
(677, 'ab87c838-0e3b-4c61-b986-ec64e2b1d9a3', '2026-03-17 23:35:15', 6.87376, 79.8702, 0.791558, 325.97, 0, 'LOW', 'GREEN', '[]', 0, 0),
(678, 'ab87c838-0e3b-4c61-b986-ec64e2b1d9a3', '2026-03-17 23:35:17', 6.87376, 79.8702, 0.573932, 226.203, 0, 'LOW', 'GREEN', '[]', 0, 0),
(679, 'e2ce66f8-13c7-408f-b768-f4a7e67e3430', '2026-03-17 23:36:34', 6.87375, 79.8702, 0, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(680, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:36:35', 6.87375, 79.8702, 0, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(681, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:36:37', 6.87375, 79.8702, 0, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(682, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:36:42', 6.87375, 79.8702, 0.0350125, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(683, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:36:42', 6.87375, 79.8702, 0.0350125, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(684, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:36:43', 6.87375, 79.8702, 3.51541, 35.9786, 0, 'LOW', 'GREEN', '[]', 0, 0),
(685, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:36:45', 6.87375, 79.8702, 3.51541, 35.9786, 0, 'LOW', 'GREEN', '[]', 0, 0),
(686, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:36:50', 6.87386, 79.8701, 1.37026, 32.8302, 0, 'LOW', 'GREEN', '[]', 0, 0),
(687, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:36:50', 6.87386, 79.8701, 1.37026, 32.8302, 0, 'LOW', 'GREEN', '[]', 0, 0),
(688, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:36:52', 6.87386, 79.8701, 1.37026, 32.8302, 0, 'LOW', 'GREEN', '[]', 0, 0),
(689, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:36:53', 6.87386, 79.8701, 1.37026, 32.8302, 0, 'LOW', 'GREEN', '[]', 0, 0),
(690, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:36:58', 6.87384, 79.8701, 0.395833, 0.0184618, 0, 'LOW', 'GREEN', '[]', 0, 0),
(691, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:36:58', 6.87384, 79.8701, 0.395833, 0.0184618, 0, 'LOW', 'GREEN', '[]', 0, 0),
(692, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:37:00', 6.87384, 79.8701, 0.395833, 0.0184618, 0, 'LOW', 'GREEN', '[]', 0, 0),
(693, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:37:01', 6.87384, 79.8701, 0.395833, 0.0184618, 0, 'LOW', 'GREEN', '[]', 0, 0),
(694, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:37:06', 6.87397, 79.8701, 0.610039, 227.15, 0, 'LOW', 'GREEN', '[]', 0, 0),
(695, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:37:06', 6.87397, 79.8701, 0.610039, 227.15, 0, 'LOW', 'GREEN', '[]', 0, 0),
(696, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:37:08', 6.87397, 79.8701, 0.610039, 227.15, 0, 'LOW', 'GREEN', '[]', 0, 0),
(697, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:37:09', 6.87397, 79.8701, 0.610039, 227.15, 0, 'LOW', 'GREEN', '[]', 0, 0),
(698, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:37:14', 6.87385, 79.8701, 0.823292, 37.2767, 0, 'LOW', 'GREEN', '[]', 0, 0),
(699, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:37:14', 6.87385, 79.8701, 0.823292, 37.2767, 0, 'LOW', 'GREEN', '[]', 0, 0),
(700, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:37:16', 6.87385, 79.8701, 0.823292, 37.2767, 0, 'LOW', 'GREEN', '[]', 0, 0),
(701, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:37:17', 6.87385, 79.8701, 0.823292, 37.2767, 0, 'LOW', 'GREEN', '[]', 0, 0),
(702, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:37:22', 6.87376, 79.8702, 0.760584, 52.6071, 0, 'LOW', 'GREEN', '[]', 0, 0),
(703, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:37:22', 6.87376, 79.8702, 0.760584, 52.6071, 0, 'LOW', 'GREEN', '[]', 0, 0),
(704, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:37:24', 6.87376, 79.8702, 0.760584, 52.6071, 0, 'LOW', 'GREEN', '[]', 0, 0),
(705, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:37:25', 6.87376, 79.8702, 0.760584, 52.6071, 0, 'LOW', 'GREEN', '[]', 0, 0),
(706, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:37:30', 6.87375, 79.8702, 0.785706, 144.064, 0, 'LOW', 'GREEN', '[]', 0, 0),
(707, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:37:31', 6.87375, 79.8702, 0.785706, 144.064, 0, 'LOW', 'GREEN', '[]', 0, 0),
(708, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:37:33', 6.87375, 79.8702, 0.785706, 144.064, 0, 'LOW', 'GREEN', '[]', 0, 0),
(709, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:37:38', 6.87375, 79.8702, 0.292526, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(710, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:37:39', 6.87375, 79.8702, 0.292526, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(711, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:37:41', 6.87375, 79.8702, 0.292526, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(712, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:37:46', 6.87375, 79.8702, 0.260731, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(713, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:37:49', 6.87375, 79.8702, 1.36523, 44.9567, 0, 'LOW', 'GREEN', '[]', 0, 0),
(714, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:37:54', 6.87376, 79.8702, 1.36763, 44.9969, 0, 'LOW', 'GREEN', '[]', 0, 0),
(715, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:37:55', 6.87376, 79.8702, 1.36763, 44.9969, 0, 'LOW', 'GREEN', '[]', 0, 0),
(716, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:37:57', 6.87376, 79.8702, 1.36763, 44.9969, 0, 'LOW', 'GREEN', '[]', 0, 0),
(717, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:37:59', 6.87376, 79.8702, 1.36763, 44.9969, 0, 'LOW', 'GREEN', '[]', 0, 0),
(718, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:38:02', 6.87376, 79.8702, 1.20454, 46.7452, 0, 'LOW', 'GREEN', '[]', 0, 0),
(719, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:38:03', 6.87376, 79.8702, 1.20454, 46.7452, 0, 'LOW', 'GREEN', '[]', 0, 0),
(720, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:38:05', 6.87376, 79.8702, 1.20454, 46.7452, 0, 'LOW', 'GREEN', '[]', 0, 0),
(721, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:38:10', 6.87378, 79.8702, 1.17763, 187.065, 0, 'LOW', 'GREEN', '[]', 0, 0),
(722, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:38:12', 6.87378, 79.8702, 1.17763, 187.065, 0, 'LOW', 'GREEN', '[]', 0, 0),
(723, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:38:13', 6.87378, 79.8702, 1.17763, 187.065, 0, 'LOW', 'GREEN', '[]', 0, 0),
(724, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:38:18', 6.87377, 79.8702, 1.18699, 187.006, 0, 'LOW', 'GREEN', '[]', 0, 0),
(725, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:38:20', 6.87377, 79.8702, 0.501508, 317.172, 0, 'LOW', 'GREEN', '[]', 0, 0),
(726, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:38:21', 6.87377, 79.8702, 0.501508, 317.172, 0, 'LOW', 'GREEN', '[]', 0, 0),
(727, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:38:26', 6.87376, 79.8702, 0.968345, 7.02193, 0, 'LOW', 'GREEN', '[]', 0, 0),
(728, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:38:27', 6.87376, 79.8702, 0.970321, 7.01203, 0, 'LOW', 'GREEN', '[]', 0, 0),
(729, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:38:29', 6.87376, 79.8702, 0.970321, 7.01203, 0, 'LOW', 'GREEN', '[]', 0, 0),
(730, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:38:34', 6.87376, 79.8702, 0.971352, 7.00468, 0, 'LOW', 'GREEN', '[]', 0, 0),
(731, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:38:35', 6.87376, 79.8702, 0.971352, 7.00468, 0, 'LOW', 'GREEN', '[]', 0, 0),
(732, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:38:37', 6.87376, 79.8702, 0.971352, 7.00468, 0, 'LOW', 'GREEN', '[]', 0, 0),
(733, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:38:42', 6.87376, 79.8702, 0.699655, 10.0125, 0, 'LOW', 'GREEN', '[]', 0, 0),
(734, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:38:44', 6.87375, 79.8702, 0.467273, 360, 0, 'LOW', 'GREEN', '[]', 0, 0),
(735, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:38:50', 6.87375, 79.8702, 0.292526, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(736, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:38:57', 6.87375, 79.8702, 0.260731, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(737, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:39:03', 6.87375, 79.8702, 1.36523, 44.9567, 0, 'LOW', 'GREEN', '[]', 0, 0),
(738, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:39:09', 6.87376, 79.8702, 1.36763, 44.9969, 0, 'LOW', 'GREEN', '[]', 0, 0),
(739, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:39:16', 6.87378, 79.8702, 1.17763, 187.065, 0, 'LOW', 'GREEN', '[]', 0, 0),
(740, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:39:22', 6.87377, 79.8702, 1.18699, 187.006, 0, 'LOW', 'GREEN', '[]', 0, 0),
(741, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:39:29', 6.87376, 79.8702, 0.968345, 7.02193, 0, 'LOW', 'GREEN', '[]', 0, 0),
(742, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:39:35', 6.87376, 79.8702, 0.971352, 7.00468, 0, 'LOW', 'GREEN', '[]', 0, 0),
(743, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:39:42', 6.87376, 79.8702, 0.699655, 10.0125, 0, 'LOW', 'GREEN', '[]', 0, 0),
(744, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:39:48', 6.87375, 79.8702, 0.467273, 360, 0, 'LOW', 'GREEN', '[]', 0, 0),
(745, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:39:55', 6.87375, 79.8702, 0.467512, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(746, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:40:01', 6.87375, 79.8702, 0.467512, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(747, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:40:08', 6.87375, 79.8702, 0.467512, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(748, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:40:14', 6.87375, 79.8702, 0.467512, 0, 0, 'LOW', 'GREEN', '[]', 0, 0);
INSERT INTO `telemetry_points` (`id`, `trip_id`, `timestamp`, `latitude`, `longitude`, `speed_kph`, `heading`, `risk_score`, `risk_level`, `alert_level`, `detected_signs`, `belief_dangerous`, `conflict_measure`) VALUES
(749, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:40:21', 6.87375, 79.8702, 0.308517, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(750, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:40:27', 6.87375, 79.8702, 0.308517, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(751, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:40:34', 6.87375, 79.8702, 0.308517, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(752, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:40:40', 6.87375, 79.8702, 0.308517, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(753, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:40:47', 6.87375, 79.8702, 0.0711391, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(754, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:40:53', 6.87375, 79.8702, 0.0711391, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(755, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:40:59', 6.87375, 79.8702, 0.0711391, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(756, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:41:06', 6.87375, 79.8702, 0.0711391, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(757, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:41:12', 6.87375, 79.8702, 0.0463762, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(758, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:41:18', 6.87375, 79.8702, 0.0463762, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(759, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:41:25', 6.87375, 79.8702, 0.0463762, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(760, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:41:31', 6.87375, 79.8702, 0.0463762, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(761, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:41:38', 6.87375, 79.8702, 0.0448347, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(762, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:41:44', 6.87375, 79.8702, 0.0448347, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(763, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:41:51', 6.87375, 79.8702, 0.0448347, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(764, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:41:57', 6.87375, 79.8702, 0.0448347, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(765, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:42:04', 6.87375, 79.8702, 0.0440077, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(766, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:42:10', 6.87375, 79.8702, 0.0440077, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(767, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:42:17', 6.87375, 79.8702, 0.0440077, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(768, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:42:23', 6.87375, 79.8702, 0.0440077, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(769, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:42:30', 6.87375, 79.8702, 0.0436582, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(770, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:42:36', 6.87375, 79.8702, 0.0436582, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(771, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:42:43', 6.87375, 79.8702, 0.0436582, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(772, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:42:49', 6.87375, 79.8702, 0.0436582, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(773, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:42:56', 6.87375, 79.8702, 0.0441188, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(774, '310ee60d-2dcd-470a-99a6-5d99aab34584', '2026-03-17 23:43:02', 6.87375, 79.8702, 0.0441188, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(775, 'd7eeaa47-4969-4afa-830c-26abad21553a', '2026-03-18 14:27:19', 6.87375, 79.8702, 0, 0, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(776, 'bd959b02-9035-40de-bf9f-e4c2c982f885', '2026-03-18 14:27:19', 6.87375, 79.8702, 0, 0, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(777, 'de4f145f-ceb8-491f-afb9-f1dbee8cbf06', '2026-03-18 14:27:20', 6.87375, 79.8702, 0, 0, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(778, 'de4f145f-ceb8-491f-afb9-f1dbee8cbf06', '2026-03-18 14:27:24', 6.87388, 79.8702, 1.64619, 118.701, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(779, 'de4f145f-ceb8-491f-afb9-f1dbee8cbf06', '2026-03-18 14:27:25', 6.87388, 79.8702, 1.64619, 118.701, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(780, 'de4f145f-ceb8-491f-afb9-f1dbee8cbf06', '2026-03-18 14:27:26', 6.87389, 79.8702, 1.63333, 118.271, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(781, 'de4f145f-ceb8-491f-afb9-f1dbee8cbf06', '2026-03-18 14:27:28', 6.87389, 79.8702, 1.63333, 118.271, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(782, 'de4f145f-ceb8-491f-afb9-f1dbee8cbf06', '2026-03-18 14:27:30', 6.87389, 79.8702, 1.63333, 118.271, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(783, 'de4f145f-ceb8-491f-afb9-f1dbee8cbf06', '2026-03-18 14:27:34', 6.8739, 79.8702, 0.389215, 358.758, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(784, 'de4f145f-ceb8-491f-afb9-f1dbee8cbf06', '2026-03-18 14:27:34', 6.8739, 79.8702, 0.389215, 358.758, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(785, 'de4f145f-ceb8-491f-afb9-f1dbee8cbf06', '2026-03-18 14:27:37', 6.8739, 79.8702, 0.389215, 358.758, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(786, 'de4f145f-ceb8-491f-afb9-f1dbee8cbf06', '2026-03-18 14:27:38', 6.8739, 79.8702, 0.389215, 358.758, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(787, 'de4f145f-ceb8-491f-afb9-f1dbee8cbf06', '2026-03-18 14:27:42', 6.87399, 79.8702, 2.15995, 343.382, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(788, 'de4f145f-ceb8-491f-afb9-f1dbee8cbf06', '2026-03-18 14:27:42', 6.87399, 79.8702, 2.15995, 343.382, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(789, 'de4f145f-ceb8-491f-afb9-f1dbee8cbf06', '2026-03-18 14:27:44', 6.874, 79.8702, 2.15808, 343.48, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(790, 'de4f145f-ceb8-491f-afb9-f1dbee8cbf06', '2026-03-18 14:27:46', 6.874, 79.8702, 2.15808, 343.48, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(791, 'de4f145f-ceb8-491f-afb9-f1dbee8cbf06', '2026-03-18 14:27:48', 6.874, 79.8702, 2.15808, 343.48, 6.1, 'LOW', 'GREEN', '[]', 0.0638, 0.06),
(792, 'de4f145f-ceb8-491f-afb9-f1dbee8cbf06', '2026-03-18 14:27:51', 6.87401, 79.8702, 0.684257, 348.338, 8.2, 'LOW', 'GREEN', '[]', 0.0638, 0.06),
(793, 'de4f145f-ceb8-491f-afb9-f1dbee8cbf06', '2026-03-18 14:27:52', 6.87401, 79.8702, 0.684257, 348.338, 9.5, 'LOW', 'GREEN', '[]', 0.0638, 0.06),
(794, 'de4f145f-ceb8-491f-afb9-f1dbee8cbf06', '2026-03-18 14:27:54', 6.87401, 79.8702, 0.684257, 348.338, 10.4, 'LOW', 'GREEN', '[]', 0.0638, 0.06),
(795, 'de4f145f-ceb8-491f-afb9-f1dbee8cbf06', '2026-03-18 14:27:56', 6.87401, 79.8702, 0.684257, 348.338, 11, 'LOW', 'GREEN', '[]', 0.0638, 0.06),
(796, 'de4f145f-ceb8-491f-afb9-f1dbee8cbf06', '2026-03-18 14:28:00', 6.87394, 79.8701, 2.70272, 215.03, 11.3, 'LOW', 'GREEN', '[]', 0.0638, 0.06),
(797, 'de4f145f-ceb8-491f-afb9-f1dbee8cbf06', '2026-03-18 14:28:02', 6.87394, 79.8701, 2.7016, 215.024, 11.6, 'LOW', 'GREEN', '[]', 0.0638, 0.06),
(798, 'de4f145f-ceb8-491f-afb9-f1dbee8cbf06', '2026-03-18 14:28:04', 6.87394, 79.8701, 2.70272, 215.03, 11.7, 'LOW', 'GREEN', '[]', 0.0638, 0.06),
(799, 'de4f145f-ceb8-491f-afb9-f1dbee8cbf06', '2026-03-18 14:28:04', 6.87394, 79.8701, 2.7016, 215.024, 11.8, 'LOW', 'GREEN', '[]', 0.0638, 0.06),
(800, 'de4f145f-ceb8-491f-afb9-f1dbee8cbf06', '2026-03-18 14:28:08', 6.87385, 79.8701, 1.26269, 187.99, 11.9, 'LOW', 'GREEN', '[]', 0.0638, 0.06),
(801, 'de4f145f-ceb8-491f-afb9-f1dbee8cbf06', '2026-03-18 14:28:08', 6.87385, 79.8701, 1.26269, 187.99, 11.9, 'LOW', 'GREEN', '[]', 0.0638, 0.06),
(802, 'de4f145f-ceb8-491f-afb9-f1dbee8cbf06', '2026-03-18 14:28:10', 6.87385, 79.8701, 1.26368, 187.718, 11.9, 'LOW', 'GREEN', '[]', 0.0638, 0.06),
(803, 'de4f145f-ceb8-491f-afb9-f1dbee8cbf06', '2026-03-18 14:28:12', 6.87385, 79.8701, 1.26368, 187.718, 12, 'LOW', 'GREEN', '[]', 0.0638, 0.06),
(804, 'de4f145f-ceb8-491f-afb9-f1dbee8cbf06', '2026-03-18 14:28:17', 6.87387, 79.8701, 0.396487, 359.982, 12, 'LOW', 'GREEN', '[]', 0.0638, 0.06),
(805, 'de4f145f-ceb8-491f-afb9-f1dbee8cbf06', '2026-03-18 14:28:17', 6.87387, 79.8701, 0.396487, 359.982, 12, 'LOW', 'GREEN', '[]', 0.0638, 0.06),
(806, 'de4f145f-ceb8-491f-afb9-f1dbee8cbf06', '2026-03-18 14:28:19', 6.87387, 79.8701, 0.396618, 359.975, 12, 'LOW', 'GREEN', '[]', 0.0638, 0.06),
(807, 'de4f145f-ceb8-491f-afb9-f1dbee8cbf06', '2026-03-18 14:28:21', 6.87387, 79.8701, 0.396618, 359.975, 12, 'LOW', 'GREEN', '[]', 0.0638, 0.06),
(808, 'de4f145f-ceb8-491f-afb9-f1dbee8cbf06', '2026-03-18 14:28:22', 6.87387, 79.8701, 0.396618, 359.975, 12, 'LOW', 'GREEN', '[]', 0.0638, 0.06),
(809, 'de4f145f-ceb8-491f-afb9-f1dbee8cbf06', '2026-03-18 14:28:27', 6.8738, 79.8701, 0.938582, 229.869, 12, 'LOW', 'GREEN', '[]', 0.0638, 0.06),
(810, 'de4f145f-ceb8-491f-afb9-f1dbee8cbf06', '2026-03-18 14:28:27', 6.8738, 79.8701, 0.938582, 229.869, 12, 'LOW', 'GREEN', '[]', 0.0638, 0.06),
(811, 'de4f145f-ceb8-491f-afb9-f1dbee8cbf06', '2026-03-18 14:28:28', 6.87379, 79.8701, 0.938555, 229.813, 12, 'LOW', 'GREEN', '[]', 0.0638, 0.06),
(812, 'de4f145f-ceb8-491f-afb9-f1dbee8cbf06', '2026-03-18 14:28:30', 6.87379, 79.8701, 0.938555, 229.813, 12, 'LOW', 'GREEN', '[]', 0.0638, 0.06),
(813, 'de4f145f-ceb8-491f-afb9-f1dbee8cbf06', '2026-03-18 14:28:35', 6.87379, 79.8701, 0.190628, 0, 12, 'LOW', 'GREEN', '[]', 0.0638, 0.06),
(814, 'de4f145f-ceb8-491f-afb9-f1dbee8cbf06', '2026-03-18 14:28:38', 6.87379, 79.8701, 0.190628, 0, 12, 'LOW', 'GREEN', '[]', 0.0638, 0.06),
(815, 'de4f145f-ceb8-491f-afb9-f1dbee8cbf06', '2026-03-18 14:28:42', 6.8738, 79.8702, 0.645257, 294.134, 12, 'LOW', 'GREEN', '[]', 0.0638, 0.06),
(816, 'de4f145f-ceb8-491f-afb9-f1dbee8cbf06', '2026-03-18 14:28:45', 6.8738, 79.8702, 0.644321, 294.15, 12, 'LOW', 'GREEN', '[]', 0.0638, 0.06),
(817, 'de4f145f-ceb8-491f-afb9-f1dbee8cbf06', '2026-03-18 14:28:46', 6.8738, 79.8702, 0.644321, 294.15, 12, 'LOW', 'GREEN', '[]', 0.0638, 0.06),
(818, 'de4f145f-ceb8-491f-afb9-f1dbee8cbf06', '2026-03-18 14:28:48', 6.8738, 79.8702, 0.644321, 294.15, 12, 'LOW', 'GREEN', '[]', 0.0638, 0.06),
(819, 'de4f145f-ceb8-491f-afb9-f1dbee8cbf06', '2026-03-18 14:28:51', 6.87375, 79.8702, 2.66154, 155.802, 12, 'LOW', 'GREEN', '[]', 0.0638, 0.06),
(820, 'de4f145f-ceb8-491f-afb9-f1dbee8cbf06', '2026-03-18 14:28:54', 6.87375, 79.8702, 2.66154, 155.802, 12, 'LOW', 'GREEN', '[]', 0.0638, 0.06),
(821, 'de4f145f-ceb8-491f-afb9-f1dbee8cbf06', '2026-03-18 14:28:56', 6.87375, 79.8702, 2.66154, 155.802, 12, 'LOW', 'GREEN', '[]', 0.0638, 0.06),
(822, 'de4f145f-ceb8-491f-afb9-f1dbee8cbf06', '2026-03-18 14:28:59', 6.87375, 79.8702, 0.252627, 0, 12, 'LOW', 'GREEN', '[]', 0.0638, 0.06),
(823, 'de4f145f-ceb8-491f-afb9-f1dbee8cbf06', '2026-03-18 14:29:03', 6.87375, 79.8702, 0.252627, 0, 12, 'LOW', 'GREEN', '[]', 0.0638, 0.06),
(824, 'de4f145f-ceb8-491f-afb9-f1dbee8cbf06', '2026-03-18 14:29:08', 6.87384, 79.8702, 0.900042, 268.358, 7.8, 'LOW', 'GREEN', '[]', 0, 0),
(825, 'de4f145f-ceb8-491f-afb9-f1dbee8cbf06', '2026-03-18 14:29:09', 6.87384, 79.8702, 0.900042, 268.358, 5.1, 'LOW', 'GREEN', '[]', 0, 0),
(826, 'de4f145f-ceb8-491f-afb9-f1dbee8cbf06', '2026-03-18 14:29:17', 6.87375, 79.8702, 4.00843, 164.609, 3.3, 'LOW', 'GREEN', '[]', 0, 0),
(827, 'de4f145f-ceb8-491f-afb9-f1dbee8cbf06', '2026-03-18 14:29:20', 6.87375, 79.8702, 4.00843, 164.609, 2.1, 'LOW', 'GREEN', '[]', 0, 0),
(828, 'de4f145f-ceb8-491f-afb9-f1dbee8cbf06', '2026-03-18 14:29:23', 6.87375, 79.8702, 4.00843, 164.609, 1.4, 'LOW', 'GREEN', '[]', 0, 0),
(829, 'de4f145f-ceb8-491f-afb9-f1dbee8cbf06', '2026-03-18 14:29:26', 6.87392, 79.8701, 1.24758, 163.5, 0.9, 'LOW', 'GREEN', '[]', 0, 0),
(830, 'de4f145f-ceb8-491f-afb9-f1dbee8cbf06', '2026-03-18 14:29:28', 6.87392, 79.8701, 1.2436, 163.614, 0.6, 'LOW', 'GREEN', '[]', 0, 0),
(831, 'de4f145f-ceb8-491f-afb9-f1dbee8cbf06', '2026-03-18 14:29:31', 6.87392, 79.8701, 1.2436, 163.614, 0.4, 'LOW', 'GREEN', '[]', 0, 0),
(832, 'dc0cc52b-b4e4-4fdc-a4cd-59ef871e7858', '2026-03-18 14:37:44', 6.87375, 79.8702, 0.290877, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(833, 'fd920da0-8f00-4e2d-b922-427757feecef', '2026-03-18 14:37:47', 6.87375, 79.8702, 0.366644, 117.158, 0, 'LOW', 'GREEN', '[]', 0, 0),
(834, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:37:51', 6.87375, 79.8702, 0.366644, 117.158, 0, 'LOW', 'GREEN', '[]', 0, 0),
(835, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:37:57', 6.87374, 79.8702, 0.285665, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(836, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:37:57', 6.87374, 79.8702, 0.285665, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(837, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:38:00', 6.87374, 79.8702, 0.285665, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(838, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:38:00', 6.87374, 79.8702, 0.285665, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(839, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:38:01', 6.87374, 79.8702, 0.285665, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(840, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:38:07', 6.87375, 79.8702, 0.110994, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(841, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:38:07', 6.87375, 79.8702, 0.110994, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(842, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:38:09', 6.87375, 79.8702, 0.110994, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(843, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:38:09', 6.87375, 79.8702, 0.110994, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(844, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:38:11', 6.87375, 79.8702, 0.110994, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(845, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:38:16', 6.87375, 79.8702, 0.172396, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(846, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:38:17', 6.87375, 79.8702, 0.172396, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(847, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:38:18', 6.87376, 79.8702, 1.58261, 53.9292, 0, 'LOW', 'GREEN', '[]', 0, 0),
(848, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:38:19', 6.87376, 79.8702, 1.58261, 53.9292, 0, 'LOW', 'GREEN', '[]', 0, 0),
(849, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:38:21', 6.87376, 79.8702, 1.58261, 53.9292, 0, 'LOW', 'GREEN', '[]', 0, 0),
(850, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:38:24', 6.87376, 79.8702, 1.58327, 53.986, 0, 'LOW', 'GREEN', '[]', 0, 0),
(851, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:38:25', 6.87376, 79.8702, 1.58327, 53.986, 0, 'LOW', 'GREEN', '[]', 0, 0),
(852, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:38:27', 6.87376, 79.8702, 1.58327, 53.986, 0, 'LOW', 'GREEN', '[]', 0, 0),
(853, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:38:29', 6.87376, 79.8702, 1.58327, 53.986, 0, 'LOW', 'GREEN', '[]', 0, 0),
(854, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:38:32', 6.87376, 79.8702, 1.30528, 52.5704, 0, 'LOW', 'GREEN', '[]', 0, 0),
(855, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:38:33', 6.87376, 79.8702, 1.30528, 52.5704, 0, 'LOW', 'GREEN', '[]', 0, 0),
(856, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:38:35', 6.87376, 79.8702, 1.30528, 52.5704, 0, 'LOW', 'GREEN', '[]', 0, 0),
(857, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:38:37', 6.87376, 79.8702, 1.30528, 52.5704, 0, 'LOW', 'GREEN', '[]', 0, 0),
(858, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:38:40', 6.87374, 79.8702, 0.633217, 182.668, 0, 'LOW', 'GREEN', '[]', 0, 0),
(859, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:38:41', 6.87374, 79.8702, 0.633217, 182.668, 0, 'LOW', 'GREEN', '[]', 0, 0),
(860, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:38:43', 6.87374, 79.8702, 0.633217, 182.668, 0, 'LOW', 'GREEN', '[]', 0, 0),
(861, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:38:45', 6.87374, 79.8702, 0.633217, 182.668, 0, 'LOW', 'GREEN', '[]', 0, 0),
(862, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:38:48', 6.87375, 79.8702, 0.431982, 333.26, 0, 'LOW', 'GREEN', '[]', 0, 0),
(863, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:38:49', 6.87375, 79.8702, 0.431982, 333.26, 0, 'LOW', 'GREEN', '[]', 0, 0),
(864, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:38:51', 6.87375, 79.8702, 0.431982, 333.26, 0, 'LOW', 'GREEN', '[]', 0, 0),
(865, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:38:56', 6.87375, 79.8702, 0.325088, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(866, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:38:56', 6.87375, 79.8702, 0.325088, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(867, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:38:57', 6.87375, 79.8702, 0.325088, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(868, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:38:59', 6.87375, 79.8702, 0.325088, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(869, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:39:04', 6.87374, 79.8702, 0.0926859, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(870, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:39:04', 6.87374, 79.8702, 0.0926859, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(871, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:39:06', 6.87374, 79.8702, 0.0926859, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(872, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:39:07', 6.87374, 79.8702, 0.0926859, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(873, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:39:12', 6.87375, 79.8702, 0.215432, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(874, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:39:12', 6.87375, 79.8702, 0.215432, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(875, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:39:14', 6.87375, 79.8702, 0.215432, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(876, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:39:15', 6.87375, 79.8702, 0.215432, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(877, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:39:20', 6.87375, 79.8702, 0.48569, 312.23, 0, 'LOW', 'GREEN', '[]', 0, 0),
(878, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:39:20', 6.87375, 79.8702, 0.48569, 312.23, 0, 'LOW', 'GREEN', '[]', 0, 0),
(879, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:39:22', 6.87375, 79.8702, 0.48569, 312.23, 0, 'LOW', 'GREEN', '[]', 0, 0),
(880, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:39:23', 6.87375, 79.8702, 0.48569, 312.23, 0, 'LOW', 'GREEN', '[]', 0, 0),
(881, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:39:25', 6.87375, 79.8702, 0.48569, 312.23, 0, 'LOW', 'GREEN', '[]', 0, 0),
(882, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:39:28', 6.87375, 79.8702, 0.396671, 136.362, 0, 'LOW', 'GREEN', '[]', 0, 0),
(883, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:39:29', 6.87375, 79.8702, 0.396671, 136.362, 0, 'LOW', 'GREEN', '[]', 0, 0),
(884, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:39:31', 6.87375, 79.8702, 0.396671, 136.362, 0, 'LOW', 'GREEN', '[]', 0, 0),
(885, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:39:33', 6.87375, 79.8702, 0.396671, 136.362, 0, 'LOW', 'GREEN', '[]', 0, 0),
(886, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:39:36', 6.87375, 79.8702, 0.400822, 316.176, 0, 'LOW', 'GREEN', '[]', 0, 0),
(887, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:39:37', 6.87375, 79.8702, 0.400822, 316.176, 0, 'LOW', 'GREEN', '[]', 0, 0),
(888, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:39:39', 6.87375, 79.8702, 0.400822, 316.176, 0, 'LOW', 'GREEN', '[]', 0, 0),
(889, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:39:41', 6.87375, 79.8702, 0.400822, 316.176, 0, 'LOW', 'GREEN', '[]', 0, 0),
(890, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:39:45', 6.87375, 79.8702, 0.468134, 112.905, 0, 'LOW', 'GREEN', '[]', 0, 0),
(891, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:39:45', 6.87375, 79.8702, 0.468134, 112.905, 0, 'LOW', 'GREEN', '[]', 0, 0),
(892, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:39:47', 6.87375, 79.8702, 0.468134, 112.905, 0, 'LOW', 'GREEN', '[]', 0, 0),
(893, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:39:51', 6.87377, 79.8702, 0.472027, 359.997, 0, 'LOW', 'GREEN', '[]', 0, 0),
(894, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:39:51', 6.87377, 79.8702, 0.472027, 359.997, 0, 'LOW', 'GREEN', '[]', 0, 0),
(895, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:39:53', 6.87377, 79.8702, 0.468367, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(896, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:39:55', 6.87377, 79.8702, 0.468367, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(897, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:39:59', 6.87377, 79.8702, 1.25705, 43.9691, 0, 'LOW', 'GREEN', '[]', 0, 0),
(898, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:39:59', 6.87377, 79.8702, 1.25705, 43.9691, 0, 'LOW', 'GREEN', '[]', 0, 0),
(899, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:40:01', 6.87377, 79.8702, 1.25959, 44.0085, 0, 'LOW', 'GREEN', '[]', 0, 0),
(900, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:40:03', 6.87377, 79.8702, 1.25959, 44.0085, 0, 'LOW', 'GREEN', '[]', 0, 0),
(901, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:40:05', 6.87377, 79.8702, 1.25959, 44.0085, 0, 'LOW', 'GREEN', '[]', 0, 0),
(902, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:40:08', 6.87376, 79.8702, 1.25955, 44.0035, 0, 'LOW', 'GREEN', '[]', 0, 0),
(903, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:40:09', 6.87376, 79.8702, 1.25955, 44.0035, 0, 'LOW', 'GREEN', '[]', 0, 0),
(904, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:40:11', 6.87376, 79.8702, 1.25955, 44.0035, 0, 'LOW', 'GREEN', '[]', 0, 0),
(905, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:40:15', 6.87377, 79.8702, 0.362554, 0.00209801, 0, 'LOW', 'GREEN', '[]', 0, 0),
(906, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:40:15', 6.87377, 79.8702, 0.362554, 0.00209801, 0, 'LOW', 'GREEN', '[]', 0, 0),
(907, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:40:17', 6.87376, 79.8702, 0.35962, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(908, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:40:19', 6.87376, 79.8702, 0.35962, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(909, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:40:21', 6.87376, 79.8702, 0.35962, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(910, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:40:25', 6.87376, 79.8702, 0.75281, 154.911, 0, 'LOW', 'GREEN', '[]', 0, 0),
(911, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:40:25', 6.87376, 79.8702, 0.75281, 154.911, 0, 'LOW', 'GREEN', '[]', 0, 0),
(912, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:40:27', 6.87375, 79.8702, 0.756292, 155.012, 0, 'LOW', 'GREEN', '[]', 0, 0),
(913, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:40:29', 6.87375, 79.8702, 0.756292, 155.012, 0, 'LOW', 'GREEN', '[]', 0, 0),
(914, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:40:31', 6.87375, 79.8702, 0.756292, 155.012, 0, 'LOW', 'GREEN', '[]', 0, 0),
(915, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:40:34', 6.87375, 79.8702, 0.755428, 154.982, 0, 'LOW', 'GREEN', '[]', 0, 0),
(916, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:40:35', 6.87375, 79.8702, 0.755428, 154.982, 0, 'LOW', 'GREEN', '[]', 0, 0),
(917, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:40:37', 6.87375, 79.8702, 0.755428, 154.982, 0, 'LOW', 'GREEN', '[]', 0, 0),
(918, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:40:39', 6.87375, 79.8702, 0.755428, 154.982, 0, 'LOW', 'GREEN', '[]', 0, 0),
(919, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:40:42', 6.87375, 79.8702, 0.72086, 152.9, 0, 'LOW', 'GREEN', '[]', 0, 0),
(920, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:40:43', 6.87375, 79.8702, 0.72086, 152.9, 0, 'LOW', 'GREEN', '[]', 0, 0),
(921, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:40:45', 6.87375, 79.8702, 0.72086, 152.9, 0, 'LOW', 'GREEN', '[]', 0, 0),
(922, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:40:47', 6.87375, 79.8702, 0.72086, 152.9, 0, 'LOW', 'GREEN', '[]', 0, 0),
(923, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:40:50', 6.87374, 79.8702, 0.088245, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(924, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:40:51', 6.87374, 79.8702, 0.088245, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(925, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:40:53', 6.87374, 79.8702, 0.088245, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(926, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:40:56', 6.87374, 79.8702, 0.088245, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(927, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:40:59', 6.87375, 79.8702, 0.145169, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(928, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:40:59', 6.87375, 79.8702, 0.145169, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(929, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:41:01', 6.87375, 79.8702, 0.143965, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(930, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:41:03', 6.87375, 79.8702, 0.143965, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(931, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:41:05', 6.87375, 79.8702, 0.143965, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(932, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:41:09', 6.87376, 79.8702, 0.895256, 170.954, 0, 'LOW', 'GREEN', '[]', 0, 0),
(933, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:41:09', 6.87376, 79.8702, 0.895256, 170.954, 0, 'LOW', 'GREEN', '[]', 0, 0),
(934, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:41:11', 6.87376, 79.8702, 0.898507, 170.985, 0, 'LOW', 'GREEN', '[]', 0, 0),
(935, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:41:13', 6.87376, 79.8702, 0.898507, 170.985, 0, 'LOW', 'GREEN', '[]', 0, 0),
(936, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:41:17', 6.87376, 79.8702, 0.282242, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(937, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:41:17', 6.87376, 79.8702, 0.282242, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(938, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:41:19', 6.87376, 79.8702, 0.288013, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(939, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:41:21', 6.87376, 79.8702, 0.288013, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(940, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:41:23', 6.87376, 79.8702, 0.288013, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(941, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:41:26', 6.87376, 79.8702, 0.287752, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(942, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:41:27', 6.87376, 79.8702, 0.287752, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(943, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:41:29', 6.87376, 79.8702, 0.287752, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(944, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:41:33', 6.87376, 79.8702, 0.323487, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(945, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:41:33', 6.87376, 79.8702, 0.323487, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(946, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:41:35', 6.87376, 79.8702, 0.323212, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(947, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:41:37', 6.87376, 79.8702, 0.323212, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(948, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:41:39', 6.87376, 79.8702, 0.323212, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(949, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:41:43', 6.87377, 79.8702, 1.29001, 272.011, 1, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(950, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:41:43', 6.87377, 79.8702, 1.29001, 272.011, 1.7, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(951, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:41:45', 6.87377, 79.8702, 1.29574, 272, 2.2, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(952, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:41:47', 6.87377, 79.8702, 1.29574, 272, 2.5, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(953, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:41:49', 6.87377, 79.8702, 1.29574, 272, 2.7, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(954, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:41:53', 6.87377, 79.8702, 0.322716, 0, 2.8, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(955, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:41:53', 6.87377, 79.8702, 0.322716, 0, 2.9, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(956, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:41:55', 6.87377, 79.8702, 0.323723, 0, 2.9, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(957, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:41:57', 6.87377, 79.8702, 0.323723, 0, 2.9, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(958, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:41:59', 6.87377, 79.8702, 0.323723, 0, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(959, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:42:03', 6.87377, 79.8702, 0.826198, 333.966, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(960, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:42:03', 6.87377, 79.8702, 0.826198, 333.966, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(961, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:42:05', 6.87377, 79.8702, 0.827629, 333.987, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(962, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:42:07', 6.87377, 79.8702, 0.827629, 333.987, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(963, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:42:09', 6.87377, 79.8702, 0.827629, 333.987, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(964, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:42:13', 6.87376, 79.8702, 0.898067, 236.034, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(965, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:42:14', 6.87376, 79.8702, 0.898067, 236.034, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(966, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:42:16', 6.87376, 79.8702, 0.899905, 235.995, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(967, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:42:17', 6.87376, 79.8702, 0.899905, 235.995, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(968, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:42:19', 6.87376, 79.8702, 0.899905, 235.995, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(969, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:42:22', 6.87375, 79.8702, 0.899664, 235.988, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(970, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:42:23', 6.87375, 79.8702, 0.899664, 235.988, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(971, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:42:25', 6.87375, 79.8702, 0.899664, 235.988, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(972, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:42:29', 6.87377, 79.8702, 0.212371, 0, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(973, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:42:30', 6.87377, 79.8702, 0.212371, 0, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(974, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:42:31', 6.87377, 79.8702, 0.212371, 0, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(975, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:42:33', 6.87377, 79.8702, 0.216556, 0, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(976, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:42:35', 6.87377, 79.8702, 0.216556, 0, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(977, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:42:39', 6.87379, 79.8702, 0.288606, 0, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(978, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:42:39', 6.87379, 79.8702, 0.288606, 0, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(979, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:42:41', 6.87379, 79.8702, 0.287236, 0, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(980, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:42:43', 6.87379, 79.8702, 0.287236, 0, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(981, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:42:45', 6.87379, 79.8702, 0.287236, 0, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(982, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:42:49', 6.87376, 79.8702, 0.968112, 177.992, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(983, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:42:49', 6.87376, 79.8702, 0.968112, 177.992, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(984, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:42:52', 6.87375, 79.8702, 0.972155, 178, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(985, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:42:53', 6.87375, 79.8702, 0.972155, 178, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(986, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:42:55', 6.87375, 79.8702, 0.972155, 178, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(987, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:42:59', 6.87375, 79.8702, 0.971086, 177.998, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(988, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:42:59', 6.87375, 79.8702, 0.971086, 177.998, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(989, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:43:01', 6.87375, 79.8702, 0.971086, 177.998, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(990, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:43:03', 6.87375, 79.8702, 0.971086, 177.998, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(991, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:43:07', 6.87376, 79.8702, 0.82724, 135.073, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(992, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:43:07', 6.87376, 79.8702, 0.82724, 135.073, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(993, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:43:10', 6.87376, 79.8702, 0.827818, 134.993, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(994, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:43:12', 6.87376, 79.8702, 0.827818, 134.993, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(995, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:43:15', 6.87377, 79.8702, 0.539493, 173.99, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(996, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:43:15', 6.87377, 79.8702, 0.539493, 173.99, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(997, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:43:17', 6.87377, 79.8702, 0.539857, 173.998, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(998, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:43:19', 6.87377, 79.8702, 0.539857, 173.998, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(999, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:43:21', 6.87377, 79.8702, 0.539857, 173.998, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1000, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:43:25', 6.87376, 79.8702, 0.608783, 268.993, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1001, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:43:26', 6.87376, 79.8702, 0.608783, 268.993, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1002, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:43:28', 6.87376, 79.8702, 0.611786, 269, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1003, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:43:29', 6.87376, 79.8702, 0.611786, 269, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1004, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:43:31', 6.87376, 79.8702, 0.611786, 269, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1005, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:43:35', 6.87381, 79.8702, 1.68534, 90.0008, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1006, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:43:35', 6.87381, 79.8702, 1.68534, 90.0008, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1007, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:43:37', 6.87381, 79.8702, 1.68534, 90.0008, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1008, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:43:39', 6.87381, 79.8702, 1.68534, 90.0008, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1009, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:43:43', 6.87377, 79.8702, 0.822667, 353.976, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1010, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:43:43', 6.87377, 79.8702, 0.822667, 353.976, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1011, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:43:45', 6.87377, 79.8702, 0.827517, 353.997, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1012, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:43:47', 6.87377, 79.8702, 0.827517, 353.997, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1013, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:43:49', 6.87377, 79.8702, 0.827517, 353.997, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1014, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:43:53', 6.87377, 79.8702, 0.826869, 353.992, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1015, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:43:53', 6.87377, 79.8702, 0.826869, 353.992, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1016, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:43:55', 6.87377, 79.8702, 0.826869, 353.992, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1017, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:43:57', 6.87377, 79.8702, 0.826869, 353.992, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1018, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:44:01', 6.87378, 79.8702, 0.290164, 0, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1019, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:44:01', 6.87378, 79.8702, 0.290164, 0, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1020, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:44:03', 6.87378, 79.8702, 0.288231, 0, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1021, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:44:05', 6.87378, 79.8702, 0.288231, 0, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1022, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:44:07', 6.87378, 79.8702, 0.288231, 0, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1023, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:44:11', 6.87376, 79.8702, 0.143498, 0, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1024, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:44:12', 6.87376, 79.8702, 0.143498, 0, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1025, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:44:13', 6.87376, 79.8702, 0.143332, 0, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1026, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:44:15', 6.87376, 79.8702, 0.143332, 0, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1027, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:44:17', 6.87376, 79.8702, 0.143332, 0, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1028, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:44:21', 6.8739, 79.8702, 0.576145, 293.077, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1029, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:44:21', 6.8739, 79.8702, 0.576145, 293.077, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1030, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:44:24', 6.87391, 79.8702, 0.577178, 293.314, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1031, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:44:25', 6.87391, 79.8702, 0.577178, 293.314, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1032, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:44:27', 6.87391, 79.8702, 0.577178, 293.314, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1033, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:44:31', 6.87387, 79.8701, 0.538913, 19.9489, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1034, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:44:32', 6.87387, 79.8701, 0.538913, 19.9489, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1035, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:44:35', 6.87387, 79.8701, 0.538482, 19.9464, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1036, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:44:37', 6.87387, 79.8701, 0.538482, 19.9464, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1037, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:44:41', 6.87391, 79.8702, 0.936395, 2.0668, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1038, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:44:42', 6.87391, 79.8702, 0.936395, 2.0668, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1039, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:44:43', 6.87391, 79.8702, 0.936082, 2.06848, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1040, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:44:45', 6.87391, 79.8702, 0.936082, 2.06848, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1041, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:44:47', 6.87391, 79.8702, 0.936082, 2.06848, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1042, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:44:51', 6.87375, 79.8702, 7.64009, 158.867, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1043, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:44:51', 6.87375, 79.8702, 7.64009, 158.867, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1044, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:44:53', 6.87375, 79.8702, 7.64009, 158.867, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1045, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:44:55', 6.87375, 79.8702, 7.64009, 158.867, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1046, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:45:00', 6.87389, 79.8702, 0.469411, 359.876, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1047, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:45:00', 6.87389, 79.8702, 0.469411, 359.876, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1048, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:45:02', 6.87389, 79.8702, 0.469425, 359.871, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1049, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:45:03', 6.87389, 79.8702, 0.469425, 359.871, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1050, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:45:07', 6.8739, 79.8701, 0.431961, 359.967, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1051, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:45:08', 6.8739, 79.8701, 0.431961, 359.967, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1052, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:45:11', 6.8739, 79.8701, 0.431961, 359.967, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1053, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:45:11', 6.8739, 79.8701, 0.431667, 359.959, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1054, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:45:13', 6.8739, 79.8701, 0.431667, 359.959, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1055, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:45:17', 6.87389, 79.8702, 0.323762, 0, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1056, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:45:17', 6.87389, 79.8702, 0.323762, 0, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1057, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:45:19', 6.87389, 79.8702, 0.323617, 0, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1058, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:45:21', 6.87389, 79.8702, 0.323617, 0, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1059, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:45:23', 6.87389, 79.8702, 0.323617, 0, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1060, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:45:27', 6.87393, 79.8702, 0.646951, 49.8284, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1061, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:45:27', 6.87393, 79.8702, 0.646951, 49.8284, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1062, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:45:29', 6.87393, 79.8702, 0.646548, 49.8082, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1063, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:45:31', 6.87393, 79.8702, 0.646548, 49.8082, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1064, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:45:33', 6.87393, 79.8702, 0.646548, 49.8082, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1065, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:45:38', 6.87393, 79.8702, 0.755247, 160.02, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1066, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:45:38', 6.87393, 79.8702, 0.755247, 160.02, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1067, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:45:40', 6.87393, 79.8702, 0.754857, 160.032, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1068, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:45:41', 6.87393, 79.8702, 0.754857, 160.032, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1069, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:45:44', 6.87393, 79.8702, 0.754857, 160.032, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1070, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:45:48', 6.87391, 79.8702, 1.2925, 331.102, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1071, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:45:48', 6.87391, 79.8702, 1.2925, 331.102, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1072, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:45:50', 6.87392, 79.8702, 1.29098, 331.136, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1073, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:45:52', 6.87392, 79.8702, 1.29098, 331.136, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1074, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:45:53', 6.87392, 79.8702, 1.29098, 331.136, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1075, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:45:57', 6.87386, 79.8702, 0.72105, 237.913, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1076, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:45:58', 6.87386, 79.8702, 0.72105, 237.913, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1077, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:45:59', 6.87385, 79.8702, 0.721133, 237.881, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1078, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:46:01', 6.87385, 79.8702, 0.721133, 237.881, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1079, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:46:03', 6.87385, 79.8702, 0.721133, 237.881, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1080, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:46:07', 6.8738, 79.8702, 2.44466, 246.91, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1081, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:46:08', 6.8738, 79.8702, 2.44466, 246.91, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1082, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:46:10', 6.87379, 79.8702, 2.44283, 246.885, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1083, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:46:11', 6.87379, 79.8702, 2.44283, 246.885, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1084, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:46:13', 6.87379, 79.8702, 2.44283, 246.885, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1085, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:46:18', 6.87385, 79.8702, 1.29487, 236.249, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1086, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:46:18', 6.87385, 79.8702, 1.29487, 236.249, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1087, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:46:19', 6.87387, 79.8701, 1.39387, 114.119, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1088, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:46:21', 6.87392, 79.8702, 0.684662, 228.292, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1089, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:46:23', 6.87392, 79.8702, 0.684662, 228.292, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1090, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:46:25', 6.87392, 79.8702, 0.684662, 228.292, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1091, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:46:29', 6.8739, 79.8701, 1.41991, 250.015, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1092, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:46:29', 6.8739, 79.8701, 1.41991, 250.015, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1093, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:46:31', 6.8739, 79.8701, 1.41991, 250.015, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1094, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:46:33', 6.8739, 79.8701, 1.41991, 250.015, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1095, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:46:37', 6.87381, 79.8702, 1.83473, 197.551, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1096, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:46:37', 6.87381, 79.8702, 1.83473, 197.551, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1097, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:46:40', 6.87381, 79.8702, 1.83473, 197.551, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1098, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:46:41', 6.87381, 79.8702, 1.83473, 197.551, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1099, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:46:45', 6.87376, 79.8702, 0.900574, 238.911, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1100, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:46:47', 6.87376, 79.8702, 0.900574, 238.911, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1101, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:46:47', 6.87376, 79.8702, 0.89973, 238.803, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1102, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:46:50', 6.87376, 79.8702, 0.89973, 238.803, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1103, '053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', '2026-03-18 14:46:51', 6.87376, 79.8702, 0.89973, 238.803, 3, 'LOW', 'GREEN', '[]', 0.0152, 0.015),
(1104, '5894be82-0134-42ae-b457-b8f137f0e7f1', '2026-03-20 23:16:02', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1105, 'c1eb0f32-f8bc-48fd-969a-fd5d4a97c111', '2026-03-20 23:16:03', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1106, '91d8a407-fa3d-43a6-8016-7a46905d4c5b', '2026-03-20 23:16:03', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0);
INSERT INTO `telemetry_points` (`id`, `trip_id`, `timestamp`, `latitude`, `longitude`, `speed_kph`, `heading`, `risk_score`, `risk_level`, `alert_level`, `detected_signs`, `belief_dangerous`, `conflict_measure`) VALUES
(1107, 'caa7efc6-a32b-4280-8459-cfc6fa48d1d0', '2026-03-20 23:16:04', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1108, '8eaa91fd-e899-40e0-8dfa-8f3a2e96ebb6', '2026-03-20 23:16:05', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1109, '9466a172-451e-4776-b859-4f9b1d27182f', '2026-03-20 23:16:06', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1110, '57d1916c-8454-450e-837a-9fa8d166ed51', '2026-03-20 23:16:06', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1111, '779dbd0b-cbc5-4f76-910f-df1cee611e9e', '2026-03-20 23:16:07', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1112, 'e221a31b-0809-4aef-8b7f-8b6ebce4b2d8', '2026-03-20 23:16:08', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1113, 'f02210d2-c099-4e9b-9bcb-088f6b8c3d5a', '2026-03-20 23:16:09', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1114, 'c065b120-d06d-4d35-a204-44017fd9ff45', '2026-03-20 23:16:09', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1115, '89bea81c-d9da-413b-aaff-e5e52aff2545', '2026-03-20 23:16:10', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1116, 'e70c700b-3b83-4e92-aa6f-3a64e73b9b8e', '2026-03-20 23:16:11', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1117, '6b286c1a-64f4-4c6a-9132-7275292f7c3b', '2026-03-20 23:16:12', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1118, '6437a07d-1cf1-453f-99b9-5e13f781fb9e', '2026-03-20 23:16:12', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1119, '8f031f39-5d93-40e5-a1d1-a398a8db158c', '2026-03-20 23:16:13', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1120, 'cbda6fa4-647e-4928-ade0-8570df23b513', '2026-03-20 23:16:14', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1121, '69858f53-e13a-47ff-b1b8-45026213cd09', '2026-03-20 23:16:15', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1122, 'c834fcc7-7367-430a-8497-d852bf4d5257', '2026-03-20 23:16:15', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1123, '241d54c7-11c9-43f4-ad01-bcc9d9ff5a83', '2026-03-20 23:16:16', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1124, 'b24905a0-5dc6-4d2a-bb24-173a56fd3592', '2026-03-20 23:16:17', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1125, 'a3e9c199-9587-4409-91b4-943f4b6b1d3b', '2026-03-20 23:16:18', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1126, '72c8c67c-6678-4dbb-bba2-338451f8f2ac', '2026-03-20 23:16:19', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1127, '459425ef-0a21-4aa6-b22a-358e5fdd6602', '2026-03-20 23:16:19', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1128, 'ceb0a840-02c0-4e90-ab66-d533dcd4567e', '2026-03-20 23:16:20', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1129, '4dd9507d-4c9a-4a8a-867f-78ac8a84bf81', '2026-03-20 23:16:21', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1130, '3c9a2dca-b661-4600-8f30-7ffc0bd16d98', '2026-03-20 23:16:22', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1131, 'a7969bea-d1cd-48e8-b44b-e1fead994a80', '2026-03-20 23:16:22', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1132, 'e0981ba4-a828-4e42-80a4-37b3ed081098', '2026-03-20 23:16:23', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1133, '1e9b583b-619a-40fd-8d32-8970ef59feaa', '2026-03-20 23:16:24', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1134, 'f80ae115-9dbd-473e-a577-9cb1659109aa', '2026-03-20 23:16:25', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1135, '442aee1d-6f3f-427c-8555-861f51a0fc48', '2026-03-20 23:16:25', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1136, '56bd6319-bcab-445b-b909-a477a4a7cf70', '2026-03-20 23:16:26', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1137, 'a6206040-e23c-4dbe-940e-dfe84f082d33', '2026-03-20 23:16:27', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1138, '3be6be54-907d-4fd6-a30c-34eb226101c6', '2026-03-20 23:16:28', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1139, 'a3c1c941-3172-470a-86f2-ca2959d95e80', '2026-03-20 23:16:28', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1140, '2f12b72b-4c01-4a8a-bc09-11ee1e96556d', '2026-03-20 23:16:29', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1141, 'd4df342b-8dbb-466e-a5ab-653df46232b0', '2026-03-20 23:16:30', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1142, '072e7f4d-eae7-4410-8afb-938a5feb2983', '2026-03-20 23:16:31', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1143, 'fe76ab56-880a-4158-a162-9ea77329f953', '2026-03-20 23:16:31', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1144, '9273d0d0-ff4c-471d-b45f-6975cda26746', '2026-03-20 23:16:32', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1145, '7ec8ce03-61cc-42e4-a5d6-515dacf5ffdb', '2026-03-20 23:16:33', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1146, '7cc2e04a-fa3b-4df7-86fb-9fbc04b4c4fd', '2026-03-20 23:16:34', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1147, 'c45278d8-0b8c-4340-a04b-8640391e56eb', '2026-03-20 23:16:34', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1148, '1a2ea3d8-e372-44e8-9071-8d69faad30fc', '2026-03-20 23:16:35', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1149, '2c9f4ea8-e90e-469b-91c7-67c18101b757', '2026-03-20 23:16:36', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1150, '01b93829-e5e3-412f-ace3-fbfc2fedafac', '2026-03-20 23:16:37', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1151, '7f94e21d-f7d9-4273-8646-c44b52f88fdc', '2026-03-20 23:16:37', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1152, '306a1abf-3674-4447-b62d-050b4a1ef1da', '2026-03-20 23:16:38', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1153, '3dc56d0c-b1df-4279-8c16-9021d9e36b93', '2026-03-20 23:16:39', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1154, '6a4054f6-8f23-4a26-9125-5db90cf18d63', '2026-03-20 23:16:48', 6.92, 79.86, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1155, '60ab49bf-ed91-44af-bfb1-9d3376e947ca', '2026-03-20 23:16:50', 6.92075, 79.8605, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1156, '6f65deb5-70ab-4c67-ba72-4091d4a5f5d9', '2026-03-20 23:16:52', 6.9215, 79.861, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1157, 'a237a2ac-3819-422e-856d-02e2707eb4c0', '2026-03-20 23:16:53', 6.92225, 79.8615, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1158, 'f7eb7560-d3ec-4725-b0dd-9d6917224d2f', '2026-03-20 23:16:55', 6.923, 79.862, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1159, 'c33f7be6-05bc-42ba-9d03-ff14c0b26e4e', '2026-03-20 23:16:57', 6.92375, 79.8625, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1160, '4352216d-79e7-4cfe-aa4a-427f09e7c2a4', '2026-03-20 23:16:59', 6.92006, 79.86, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1161, '1f82eb6c-aef3-4b76-8197-e2a6e91f0bce', '2026-03-20 23:16:59', 6.9245, 79.863, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1162, '3b4dc889-5a20-45d1-a90b-693ee84a29a5', '2026-03-20 23:17:01', 6.92066, 79.8605, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1163, '0f3da4d9-e33f-4c88-9137-eba115787d8b', '2026-03-20 23:17:01', 6.92525, 79.8635, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1164, '6cce1e08-e95a-49d2-a3ef-552c2f9606d0', '2026-03-20 23:17:03', 6.92144, 79.8611, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1165, 'e719ed15-5523-4052-b533-cbc39ccc95be', '2026-03-20 23:17:03', 6.926, 79.864, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1166, 'b263f272-1890-425d-be83-2f10f9882315', '2026-03-20 23:17:05', 6.92232, 79.8614, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1167, 'ee9a515c-75cb-4059-81ca-75ca2f022e86', '2026-03-20 23:17:05', 6.92675, 79.8645, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1168, '7da5d4da-9d90-436a-9984-b4ac1021ca00', '2026-03-20 23:17:07', 6.92292, 79.8621, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1169, '247ca116-0394-4c84-bd0b-3a19d0bfcd79', '2026-03-20 23:17:07', 6.9275, 79.865, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1170, 'ffa76c66-1e20-446c-9921-9248dea5684c', '2026-03-20 23:17:09', 6.92373, 79.8625, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1171, '4e084776-b55f-4ca9-88c8-7a8538c7f536', '2026-03-20 23:17:09', 6.92825, 79.8655, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1172, '940bdec1-d9ed-4409-ae20-00bb7d1af423', '2026-03-20 23:17:11', 6.92455, 79.8629, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1173, 'bcbc6557-2f4e-4a78-980c-a0509e3fe584', '2026-03-20 23:17:11', 6.929, 79.866, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1174, 'de202f5f-4298-4f36-bf05-803e525502ce', '2026-03-20 23:17:13', 6.92527, 79.8635, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1175, '92c6b94e-7066-4f28-a3d8-6b6e25669136', '2026-03-20 23:17:13', 6.92975, 79.8665, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1176, '0ebf1720-94f9-48cd-8cfa-face5e5270e9', '2026-03-20 23:17:15', 6.92599, 79.864, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1177, '1e67b5f9-0b3f-4f8c-9c9b-f014bb721d22', '2026-03-20 23:17:15', 6.9305, 79.867, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1178, '2041f250-d15c-498c-a356-696b652e6550', '2026-03-20 23:17:17', 6.92666, 79.8644, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1179, 'ba39a2b4-fc40-40e0-91b6-0a0313e45ae1', '2026-03-20 23:17:17', 6.93125, 79.8675, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1180, 'e9a6aa57-e038-4d47-8b56-e7f7bc80d8ff', '2026-03-20 23:17:19', 6.92756, 79.865, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1181, 'caebc216-944b-47dc-b322-a738fb010c83', '2026-03-20 23:17:19', 6.932, 79.868, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1182, '5d266f42-7f0c-4741-ba0c-f1733ed7b028', '2026-03-20 23:17:21', 6.92831, 79.8654, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1183, 'f38f7c46-8608-49b0-8a2e-11f9afd783ae', '2026-03-20 23:17:22', 6.93275, 79.8685, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1184, 'a0a55789-4e6e-4363-9a6e-7724c3f944a7', '2026-03-20 23:17:23', 6.92894, 79.8661, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1185, 'bd6c8e8d-76ec-4015-9887-0eeea79e09e1', '2026-03-20 23:17:24', 6.9335, 79.869, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1186, '990a88ff-dbeb-4523-aaec-504bbbc9b658', '2026-03-20 23:17:26', 6.92975, 79.8664, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1187, '4cf1f6c3-a14a-4c36-a51c-9541835e4e15', '2026-03-20 23:17:26', 6.93425, 79.8695, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1188, '84344175-983e-4f49-b1a2-1a420b784597', '2026-03-20 23:17:28', 6.93044, 79.867, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1189, 'c7c569ff-01f9-4eba-b5f5-0cc93966c3aa', '2026-03-20 23:17:29', 6.93117, 79.8674, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1190, '2f3e27b9-c739-4a0a-bc74-6f3ae5a76913', '2026-03-20 23:17:31', 6.93208, 79.8679, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1191, 'f4fca559-baf9-4e0b-9622-26cb0409664c', '2026-03-20 23:17:33', 6.93283, 79.8686, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1192, 'ce6a6759-0e02-4c0b-8a0d-0123aab1183e', '2026-03-20 23:17:35', 6.93346, 79.869, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1193, 'e363c428-12f0-4ff9-811d-ead4709debb9', '2026-03-20 23:17:36', 6.93422, 79.8694, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1194, '0f36803b-86fa-4577-bc09-216a8245e1bf', '2026-03-20 23:17:48', 6.91, 79.8775, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1195, 'ff79fdf9-03c0-47fc-8052-b5647a31a17d', '2026-03-20 23:17:50', 6.91067, 79.8775, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1196, '8d59a4fe-ee5e-4c89-a69e-b21dca12ad1e', '2026-03-20 23:17:52', 6.91133, 79.8775, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1197, '652d4ab7-e9a2-4482-b3b6-3ab10b05169b', '2026-03-20 23:17:54', 6.912, 79.8775, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1198, '9dd1221e-c90c-4585-b944-ae78aeefa624', '2026-03-20 23:17:55', 6.91267, 79.8775, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1199, '56bc29a2-f269-4a8e-9d94-36bfdd42853d', '2026-03-20 23:17:57', 6.91333, 79.8775, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1200, 'dcc31ebc-6a63-4747-aab5-d35d72b966ae', '2026-03-20 23:17:59', 6.914, 79.8775, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1201, 'd7c761ee-1bf4-43ab-aa29-2c710badf1c7', '2026-03-20 23:18:01', 6.91467, 79.8775, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1202, 'f5641b1a-7b02-4ce3-bdbd-87955b76662f', '2026-03-20 23:18:02', 6.91533, 79.8775, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1203, '09734dbe-ddb1-4eda-abb1-30f2ab398253', '2026-03-20 23:18:04', 6.916, 79.8775, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1204, '51f071db-b1bd-45bb-b171-1de2a0d68613', '2026-03-20 23:18:06', 6.91667, 79.8775, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1205, '89b516f2-2c79-4248-8d34-e6938dfa231b', '2026-03-20 23:18:08', 6.91733, 79.8775, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1206, 'c233838f-a354-4581-8705-73b297cde5b5', '2026-03-20 23:18:10', 6.918, 79.8775, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1207, 'fc7f5eb5-6eb4-4775-a901-360e95ba4c1b', '2026-03-20 23:18:11', 6.91867, 79.8775, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1208, '8cf24a66-2cdf-4808-8822-6772cf4e8ddb', '2026-03-20 23:18:13', 6.91933, 79.8775, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1209, '0f07a151-55b9-4869-8b7c-46d201078856', '2026-03-20 23:20:52', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1210, '6d4bdd1f-2e88-4538-a35e-5ec093cdf3fb', '2026-03-20 23:20:53', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1211, '712a18df-4f2a-4cf8-bc8b-79faa28e85e2', '2026-03-20 23:20:53', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1212, '15899c41-dc43-48d2-8e13-50f004bc69a9', '2026-03-20 23:20:54', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1213, 'd3a41716-ddc7-415b-99af-deb7a5be3f43', '2026-03-20 23:20:55', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1214, 'b930e7ab-f34f-4971-a3c0-26d1aaba8120', '2026-03-20 23:20:56', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1215, '05e4a167-ec65-477b-928a-1defca82333b', '2026-03-20 23:20:56', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1216, '96fa1620-6f5b-434c-9234-99d267c58783', '2026-03-20 23:20:57', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1217, '326aae7b-cf42-4f70-aadb-358231a047de', '2026-03-20 23:20:58', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1218, 'be55fffa-0b0a-4f08-9a9a-266aee9320f8', '2026-03-20 23:20:59', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1219, '0daa91a2-6b8d-4a6b-8e72-8e23701b9fcb', '2026-03-20 23:21:00', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1220, 'edcabd8a-4f45-482f-90e3-587b55dd779c', '2026-03-20 23:21:00', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1221, '234a766f-9e59-42bf-826e-816947d5041e', '2026-03-20 23:21:01', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1222, 'ba92b7d9-2aa8-4671-9f01-df8c7aa5f41c', '2026-03-20 23:21:02', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1223, 'a19e977c-ae72-4c07-8188-7498da06d682', '2026-03-20 23:21:03', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1224, 'da19619c-afbf-4ccf-adbe-aead982a3111', '2026-03-20 23:21:04', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1225, '7d3c0fd1-fada-4b36-8a65-f1dcac0a3a08', '2026-03-20 23:21:04', 6.91, 79.8775, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1226, 'f471df5e-b251-49e9-9454-fcb4111ce35f', '2026-03-20 23:21:05', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1227, '75cf12f6-a689-4f1a-ac6c-6bf6b4d5ad3f', '2026-03-20 23:21:06', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1228, '542fe8ca-e7ec-41a5-8687-ee08547d5fff', '2026-03-20 23:21:07', 6.91067, 79.8775, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1229, 'a7f63d86-fcfb-4407-8387-675cdf3ce65c', '2026-03-20 23:21:07', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1230, '8c3f0e4c-03fd-4abb-9111-aa6dbc5da16b', '2026-03-20 23:21:08', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1231, 'd528eade-0c6b-4628-9d86-244fa7b61139', '2026-03-20 23:21:09', 6.91133, 79.8775, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1232, '3b022ee4-bbde-4e79-9bb7-7a4be90cf14e', '2026-03-20 23:21:09', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1233, '3efb0fbb-1bea-4cc1-8948-c02895581286', '2026-03-20 23:21:10', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1234, '9af53534-006e-4dc1-b956-f75a261b636f', '2026-03-20 23:21:11', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1235, '3601c178-5b4c-4695-b87c-7b25930ed24a', '2026-03-20 23:21:11', 6.912, 79.8775, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1236, '495caca8-d952-44cc-8963-497aeb69f611', '2026-03-20 23:21:11', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1237, '59af2877-f077-40c1-9901-20575a30e848', '2026-03-20 23:21:12', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1238, '7ed637d9-8d30-4618-8652-6da8a9834261', '2026-03-20 23:21:13', 6.91267, 79.8775, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1239, '16f3cd94-9759-4200-9ca6-a4165682ffa7', '2026-03-20 23:21:14', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1240, 'd33ad057-d3a4-4efc-9dec-42b866df719b', '2026-03-20 23:21:14', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1241, 'ae67327e-cf63-423b-bd30-83ccdfdade6b', '2026-03-20 23:21:15', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1242, '14d1f055-15a2-4044-a952-1a2f3b9c75ea', '2026-03-20 23:21:16', 6.91333, 79.8775, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1243, '6d429c2c-ca39-4974-9130-e03352152a6f', '2026-03-20 23:21:16', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1244, '98ee8d9a-c0ef-42d1-9e9e-e1e9ebbf9a91', '2026-03-20 23:21:17', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1245, '91226360-97e3-4192-8306-710601b76458', '2026-03-20 23:21:18', 6.914, 79.8775, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1246, '633dc694-ed81-4da7-a2f6-1933ae4f3a64', '2026-03-20 23:21:18', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1247, '1b4e2bcf-e346-4d5e-843e-9233b7caf5c2', '2026-03-20 23:21:19', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1248, '41e4ea02-1d4d-45b7-9fb2-0de1d446f4cf', '2026-03-20 23:21:20', 6.91467, 79.8775, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1249, '57337d9e-9f61-4ee2-9625-0307b3dd37ff', '2026-03-20 23:21:20', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1250, '92563786-8b14-492f-8dd1-5418a4d8cc0e', '2026-03-20 23:21:21', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1251, 'f26320fd-2105-49a9-b6a3-1bea62cf49a5', '2026-03-20 23:21:22', 6.91533, 79.8775, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1252, '16a761ca-9c56-4a28-9967-25a8a7185203', '2026-03-20 23:21:22', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1253, 'a4c1d902-0487-4b2f-a353-cb3edecea158', '2026-03-20 23:21:23', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1254, 'fa76aa60-f1ed-44bb-bb19-1616680dcedb', '2026-03-20 23:21:24', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1255, 'c1edb566-bdb7-46b7-825e-13c5f860dcf4', '2026-03-20 23:21:24', 6.916, 79.8775, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1256, 'b413f493-e008-4226-bc6a-8128abe7c873', '2026-03-20 23:21:25', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1257, 'd155a1e2-5cfc-48f2-8764-55ac0446b97e', '2026-03-20 23:21:25', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1258, 'b1c174c2-a5b8-4b99-ac95-d5129f4614a5', '2026-03-20 23:21:26', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1259, '0ab866e3-194c-4f29-a7fd-21c3818ef9b8', '2026-03-20 23:21:27', 6.91667, 79.8775, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1260, '9bb80a1d-1163-48a1-9461-71b0364c0ae1', '2026-03-20 23:21:27', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1261, '1cfa6f95-c511-4158-b3ea-81aa0694753c', '2026-03-20 23:21:28', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1262, '933915a1-46a3-49f7-9beb-37b86c2da809', '2026-03-20 23:21:29', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1263, '8c7144e7-3572-4411-9e0e-4924edcfcfa5', '2026-03-20 23:21:29', 6.91733, 79.8775, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1264, '5b8a3cde-cbb5-4e59-8113-b68abca439e0', '2026-03-20 23:21:30', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1265, 'c763e8d7-7bf2-426f-9eed-fea0f691def9', '2026-03-20 23:21:30', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1266, 'db46bdac-cf79-490c-8faf-1ca0763557ae', '2026-03-20 23:21:31', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1267, '088f6475-9d30-4a60-92df-bdc341f59100', '2026-03-20 23:21:32', 6.918, 79.8775, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1268, '95fbc40d-ec45-4198-8386-9030c92fc124', '2026-03-20 23:21:32', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1269, '8b1c7027-042a-466d-a916-6e09c85d3786', '2026-03-20 23:21:33', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1270, 'e168189c-330d-453e-8b33-1365b91989fc', '2026-03-20 23:21:34', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1271, '565e60be-6569-4d6a-9a9d-d23825139daf', '2026-03-20 23:21:34', 6.91867, 79.8775, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1272, '1e69ce57-9442-40f1-81f3-e51505b729f9', '2026-03-20 23:21:34', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1273, 'f04d1343-e872-4386-91e0-12a6099e0157', '2026-03-20 23:21:36', 6.91933, 79.8775, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1274, 'f17a923e-6ee6-4907-b6ea-1d9141765b93', '2026-04-01 13:06:14', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1275, '876d04da-492b-4965-8422-368fdf320829', '2026-04-01 13:06:15', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1276, '1a3114e5-7728-4dac-b789-ca62aa0b71a4', '2026-04-01 13:06:16', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1277, '0241072a-123a-4ed6-89fa-0d90f5ce88af', '2026-04-01 13:06:17', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1278, '8be2b93a-d62e-4657-9ebb-bd0d2c542818', '2026-04-01 13:06:17', 6.9271, 79.8612, 60, 90, 9.8, 'LOW', 'GREEN', '[]', 0, 0),
(1279, '345cfd0b-dd4a-4165-a023-50c4b252ed61', '2026-04-01 13:06:18', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1280, '523f1de8-f976-4371-91ea-bd22b7a8c9b0', '2026-04-01 13:06:19', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1281, '45a7f99b-0ad1-4e33-9627-4811554ca874', '2026-04-01 13:06:19', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1282, 'ee18eb14-9dea-4fbc-a217-3309a72d428e', '2026-04-01 13:06:20', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1283, 'f8631845-29fa-44a1-8c63-5cc78174ea68', '2026-04-01 13:06:20', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1284, '15dbea9c-15bf-42f5-a549-f8ef7f58bb30', '2026-04-01 13:06:21', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1285, '199a7d97-3363-4052-b863-06ab050ad8f0', '2026-04-01 13:06:22', 6.9271, 79.8612, 60, 90, 29.3, 'LOW', 'GREEN', '[\"stop\"]', 0.224, 0.183),
(1286, '72bd1d51-56f1-4508-8ea8-06f35c0a116b', '2026-04-01 13:06:22', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1287, '7f27a121-5e07-4c10-a8db-5e6dc50b78ad', '2026-04-01 13:06:23', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1288, 'b27eadde-245a-4a2a-8140-6afbddeb288f', '2026-04-01 13:06:24', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1289, '4ed304c4-602b-42c1-a6d2-9f663ed4ba39', '2026-04-01 13:06:24', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1290, 'f105b389-d1ca-45e8-b6a9-7cd590fbd3a2', '2026-04-01 13:06:25', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1291, '1502970f-36c4-4b46-aacb-b5fb14f32f17', '2026-04-01 13:06:26', 6.9271, 79.8612, 60, 90, 9.8, 'LOW', 'GREEN', '[]', 0, 0),
(1292, '1741063a-aac4-49ce-8793-38164ac4d285', '2026-04-01 13:06:26', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1293, 'e4030936-ef8f-403d-901b-7e96500b6906', '2026-04-01 13:06:27', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1294, '84e8b7f7-a169-4572-a4c7-30a1bdafb064', '2026-04-01 13:06:28', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1295, '2b80678d-0ce1-44d4-aea3-13f6bd37457b', '2026-04-01 13:06:28', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1296, '25dc2eab-854f-430c-9d37-d482fcf75bb4', '2026-04-01 13:06:29', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1297, 'b549172e-b7f1-43f0-9908-1c7f39496353', '2026-04-01 13:06:30', 6.9271, 79.8612, 60, 90, 9.8, 'LOW', 'GREEN', '[]', 0, 0),
(1298, '0cddd6f0-0b91-41f5-82d8-2f1e18775410', '2026-04-01 13:06:30', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1299, '55c9fc00-6cd3-4084-bee6-d944e006503b', '2026-04-01 13:06:31', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1300, '4c0a510b-0f9e-46dc-a4bc-2a6dc952fa57', '2026-04-01 13:06:32', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1301, 'f48df6ce-ea0c-4ac3-a225-b359ab8ddc5e', '2026-04-01 13:06:32', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1302, '5e5d1905-08df-4656-a80d-9c036ef5342c', '2026-04-01 13:06:33', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1303, 'b95691fc-37b0-494c-9a32-744c5ed5e753', '2026-04-01 13:06:34', 6.9271, 79.8612, 60, 90, 10.2, 'LOW', 'GREEN', '[\"living_street\"]', 0.0164, 0.0162),
(1304, '07722293-c93b-439e-9c46-d645376f1180', '2026-04-01 13:06:34', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1305, '35b452dc-f746-4635-9b5b-fa1b81426e68', '2026-04-01 13:06:35', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1306, '762f124f-b736-47c5-9bb1-4d8aa0933f21', '2026-04-01 13:06:36', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1307, '49a47754-c9db-48e3-80fc-a0b8eb8790be', '2026-04-01 13:06:36', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1308, 'a4c1c7f0-23e4-4f6a-833f-b758e93a5b08', '2026-04-01 13:06:37', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1309, '7307dd43-d7d0-4d0d-9fc9-45583195dbdd', '2026-04-01 13:06:38', 6.9271, 79.8612, 60, 90, 9.8, 'LOW', 'GREEN', '[]', 0, 0),
(1310, '3aba0119-34dd-4572-8c8f-56609d47abcd', '2026-04-01 13:06:38', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1311, '7f27858e-9e27-4b8e-931b-e71958d902d1', '2026-04-01 13:06:39', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1312, '2312813c-0b58-4426-a270-999b39869de6', '2026-04-01 13:06:40', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1313, '79e3bf8c-0068-4c7b-83e6-e3866508678d', '2026-04-01 13:06:41', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1314, '27252478-6687-4997-862f-30249759a75a', '2026-04-01 13:06:41', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1315, 'b3694db7-88a6-488a-a79e-4aadcb471712', '2026-04-01 13:06:42', 6.9271, 79.8612, 60, 90, 39, 'MEDIUM', 'YELLOW', '[\"stop\"]', 0.3535, 0.2612),
(1316, '21661c60-1136-45a8-ab63-5f0338e6bb0f', '2026-04-01 13:06:42', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1317, '108b104d-ce03-49df-af86-b0f1045b56fe', '2026-04-01 13:06:43', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1318, 'f545cb48-437f-4a51-94f4-bbf80cf0af0a', '2026-04-01 13:06:44', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1319, '824c1c76-012d-4398-a523-1764c9077d93', '2026-04-01 13:06:44', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1320, '56d30f80-f14c-4a25-b627-c06607f7eadc', '2026-04-01 13:06:45', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1321, 'b6efda9f-1c4f-4ec4-8ff6-b07c3af6bf1f', '2026-04-01 13:06:46', 6.9271, 79.8612, 60, 90, 9.8, 'LOW', 'GREEN', '[]', 0, 0),
(1322, '5fb6c7b1-f5fc-4728-b1d4-4b72ab9d3f85', '2026-04-01 13:06:46', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1323, '9929cc64-4b35-4cfc-9eea-f151be1a9dd7', '2026-04-01 13:06:47', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1324, '95105dae-559c-408a-96ae-d7a1bc095e48', '2026-04-02 13:43:18', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1325, '9f587fb1-9a85-4e15-9e3b-f24b3605582f', '2026-04-02 13:43:18', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1326, '6d4754a5-d7f1-4b1c-ab5a-de210cc8974b', '2026-04-02 13:43:19', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1327, 'cd266621-1be6-47af-915b-0f9e2ca117b9', '2026-04-02 13:43:19', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1328, 'aef19717-7b78-4780-8b2f-6a9eae722e7e', '2026-04-02 13:43:20', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1329, '70d78a46-58cc-4469-9b79-73e44499a269', '2026-04-02 13:43:21', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1330, '845308de-6d02-442d-9b10-ca9a1773ab2d', '2026-04-02 13:43:21', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1331, 'f30c9b49-3062-4020-a831-0257d1c1909f', '2026-04-02 13:43:22', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1332, '028d884f-ceb1-4f6e-8666-03bfc23156ab', '2026-04-02 13:43:22', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1333, '565eb241-d1e8-438e-9236-f16b30a1a012', '2026-04-02 13:43:23', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1334, '13a57403-0f84-42ab-9f09-0ca15404b049', '2026-04-02 13:43:24', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1335, '0872a12b-2d99-4501-b027-88590113fd74', '2026-04-02 13:43:24', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1336, 'c887227c-3511-40e6-9b54-2ef8905035b2', '2026-04-02 13:43:25', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1337, '13a4adbe-9038-47fd-b7d7-520f5f6a238a', '2026-04-02 13:43:25', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1338, 'a38cdd50-17d3-458b-91da-edc745366f76', '2026-04-02 13:43:26', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1339, '1e8beb46-392c-4975-98c3-0ba22e444fe2', '2026-04-02 13:43:26', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1340, '1bca36d5-b06d-4140-86dd-a17f0a0fa190', '2026-04-02 13:43:27', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1341, 'b02424f5-d95d-4bb4-9b64-94aa84f7f764', '2026-04-02 13:43:28', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1342, '10f99b18-0444-44ea-a93a-81da7104ebe5', '2026-04-02 13:43:28', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1343, '711a0bce-9178-4acb-a973-9905c89e92ba', '2026-04-02 13:43:29', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1344, '75679dc8-c082-401d-87b1-19935517a1c1', '2026-04-02 13:43:30', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1345, '87b4f3db-5494-4b20-9677-4db4973511c0', '2026-04-02 13:43:30', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1346, '06d5e938-8887-40af-876e-202d7ce55cca', '2026-04-02 13:43:31', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1347, '8dd427f8-b57a-4482-a495-3e4f531de7c1', '2026-04-02 13:43:31', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1348, '1ca0b315-8f38-499e-a7fb-cc94307ba800', '2026-04-02 13:43:32', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1349, '86f033af-d738-435b-819f-edac609f26cb', '2026-04-02 13:43:33', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1350, '83f12bce-7670-455e-ad3f-83aafa8bc49f', '2026-04-02 13:43:33', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1351, 'd194b8de-c4da-4297-827f-0a8528729dc3', '2026-04-02 13:43:34', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1352, '33e8d978-f535-4572-8176-0a0a42058e93', '2026-04-02 13:43:34', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1353, '42dd4396-2184-4afa-a3e6-603233e536a8', '2026-04-02 13:43:35', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1354, '69319624-c2cb-4267-be81-6c6e684615fb', '2026-04-02 13:43:35', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1355, '6c1ff999-7814-46a4-93a1-235741892385', '2026-04-02 13:43:36', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1356, '4a9b0923-6fcd-4ba5-91f1-6dc49bf7a82c', '2026-04-02 13:43:37', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1357, '7ef65b02-5a2d-4184-9f9b-3edafa6721ac', '2026-04-02 13:43:37', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1358, 'b29f968c-6d7e-407c-aab8-1d2ad027679b', '2026-04-02 13:43:38', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1359, '34fce98c-8f1c-4089-89fb-19bd20a393f5', '2026-04-02 13:43:38', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1360, 'cbfa745b-3686-4368-b1f2-a88c96effcb7', '2026-04-02 13:43:39', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1361, 'e84684b5-ffa2-4131-945f-267f3de996e4', '2026-04-02 13:43:39', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1362, '3d9b644c-9ebd-4dad-81ce-a9013330f54f', '2026-04-02 13:43:40', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1363, '35f7ad69-b687-473b-8c63-f76ba2c9bb08', '2026-04-02 13:43:41', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1364, '26efa5e1-ec93-417e-a2e5-609660495d7b', '2026-04-02 13:43:41', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1365, 'f9591b4b-f583-434b-a11c-3cc27aa9a75a', '2026-04-02 13:43:42', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1366, '98d083e3-4878-4c2c-93b7-982251f7db41', '2026-04-02 13:43:42', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1367, '7a0585d3-6e06-4f66-a4f4-59b81bbbca0c', '2026-04-02 13:43:43', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1368, '6cf4529e-2152-4ae0-a49e-1b5d5f175adc', '2026-04-02 13:43:43', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1369, 'd8650ef4-9676-4630-88ca-994690fc5d5b', '2026-04-02 13:43:44', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1370, 'd126f41c-cc14-4d41-9025-1e8dd4df6ed6', '2026-04-02 13:43:44', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1371, 'd7fc8635-f455-4fb9-b11d-08e28d693a69', '2026-04-02 13:43:45', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1372, '21b6846f-336a-4862-ba5f-886d6ffe4b6c', '2026-04-02 13:43:45', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1373, '44e150db-1136-4ca2-9b49-cedd446a8a8c', '2026-04-02 13:43:46', 6.9271, 79.8612, 60, 90, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1374, 'e09c04b3-2db0-451f-8990-457fca317ef3', '2026-04-02 13:44:00', 6.91, 79.8775, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1375, 'b513f9b3-8900-4783-b076-583424a1914b', '2026-04-02 13:44:01', 6.91067, 79.8775, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1376, 'd13ea526-d191-4deb-b387-ccf8ac99c2d4', '2026-04-02 13:44:03', 6.91133, 79.8775, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1377, '20f6a942-d687-437c-9749-5c5b671d70f2', '2026-04-02 13:44:04', 6.912, 79.8775, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1378, '8c1faee9-0b33-4cca-8967-0d903ba78cb0', '2026-04-02 13:44:06', 6.91267, 79.8775, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1379, '20cd4eeb-8de2-45f3-8383-074a03506936', '2026-04-02 13:44:07', 6.91333, 79.8775, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1380, 'cd35288d-3e99-49da-94dc-b2664a26e271', '2026-04-02 13:44:09', 6.914, 79.8775, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1381, '050b3509-23ea-4c42-833b-e064cf855b71', '2026-04-02 13:44:10', 6.91467, 79.8775, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1382, '17660e31-be52-4db7-ac7f-35680892942f', '2026-04-02 13:44:12', 6.91533, 79.8775, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1383, '87f3a4f6-1b2d-4de9-b8bf-12c69007a2c2', '2026-04-02 13:44:13', 6.916, 79.8775, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1384, 'fc7a1ac3-7f25-4cf7-ae57-89e393c67f66', '2026-04-02 13:44:15', 6.91667, 79.8775, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1385, '04eb9221-03b3-42fb-a36f-e295e04122a3', '2026-04-02 13:44:16', 6.91733, 79.8775, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1386, 'e3fadd13-8ec0-4dc0-a446-f53db2686df0', '2026-04-02 13:44:18', 6.918, 79.8775, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1387, '72a46070-5a60-4784-8097-68a5b7b15c2d', '2026-04-02 13:44:19', 6.91867, 79.8775, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1388, 'd2d25486-c9bf-44e2-847f-20e15c889e76', '2026-04-02 13:44:21', 6.91933, 79.8775, 40, 45, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1389, '0a848c82-ea37-40c6-81b5-3020edfc938c', '2026-04-02 23:15:12', 6.8738, 79.8702, 0.330474, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1390, 'de2fdb36-da99-45b9-b22d-46493f39641b', '2026-04-02 23:15:13', 6.8738, 79.8702, 0.330474, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1391, '0a848c82-ea37-40c6-81b5-3020edfc938c', '2026-04-02 23:15:14', 6.8738, 79.8702, 0.330474, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1392, '649b4d86-af00-4416-9ca8-ad49a91ce9fd', '2026-04-02 23:15:15', 6.8738, 79.8702, 0.330474, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1393, '649b4d86-af00-4416-9ca8-ad49a91ce9fd', '2026-04-02 23:15:19', 6.87379, 79.8702, 0.14377, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1394, '649b4d86-af00-4416-9ca8-ad49a91ce9fd', '2026-04-02 23:15:20', 6.87379, 79.8702, 0.14377, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1395, '649b4d86-af00-4416-9ca8-ad49a91ce9fd', '2026-04-02 23:15:22', 6.87379, 79.8702, 0.14377, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1396, '649b4d86-af00-4416-9ca8-ad49a91ce9fd', '2026-04-02 23:15:27', 6.87379, 79.8702, 0.0036108, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1397, '649b4d86-af00-4416-9ca8-ad49a91ce9fd', '2026-04-02 23:15:28', 6.87379, 79.8702, 0.0036108, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1398, '649b4d86-af00-4416-9ca8-ad49a91ce9fd', '2026-04-02 23:15:30', 6.87379, 79.8702, 0.0036108, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1399, '649b4d86-af00-4416-9ca8-ad49a91ce9fd', '2026-04-02 23:15:32', 6.87379, 79.8702, 0.0036108, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1400, '649b4d86-af00-4416-9ca8-ad49a91ce9fd', '2026-04-02 23:15:35', 6.87379, 79.8702, 0.0178766, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1401, '649b4d86-af00-4416-9ca8-ad49a91ce9fd', '2026-04-02 23:15:38', 6.87379, 79.8702, 0.0178766, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1402, '649b4d86-af00-4416-9ca8-ad49a91ce9fd', '2026-04-02 23:15:43', 6.87379, 79.8702, 0.000296452, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1403, '649b4d86-af00-4416-9ca8-ad49a91ce9fd', '2026-04-02 23:15:44', 6.87379, 79.8702, 0.000296452, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1404, '649b4d86-af00-4416-9ca8-ad49a91ce9fd', '2026-04-02 23:15:46', 6.87379, 79.8702, 0.000296452, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1405, '649b4d86-af00-4416-9ca8-ad49a91ce9fd', '2026-04-02 23:15:48', 6.87379, 79.8702, 0.000296452, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1406, '649b4d86-af00-4416-9ca8-ad49a91ce9fd', '2026-04-02 23:15:51', 6.87379, 79.8702, 0.0642041, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1407, '649b4d86-af00-4416-9ca8-ad49a91ce9fd', '2026-04-02 23:15:52', 6.87379, 79.8702, 0.0642041, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1408, '649b4d86-af00-4416-9ca8-ad49a91ce9fd', '2026-04-02 23:15:54', 6.87379, 79.8702, 0.0642041, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1409, '649b4d86-af00-4416-9ca8-ad49a91ce9fd', '2026-04-02 23:15:59', 6.87379, 79.8702, 0.0244541, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1410, '649b4d86-af00-4416-9ca8-ad49a91ce9fd', '2026-04-02 23:16:02', 6.87379, 79.8702, 0.0244541, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1411, '649b4d86-af00-4416-9ca8-ad49a91ce9fd', '2026-04-02 23:16:04', 6.87379, 79.8702, 0.0244541, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1412, '649b4d86-af00-4416-9ca8-ad49a91ce9fd', '2026-04-02 23:16:09', 6.87379, 79.8702, 0.00856384, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1413, '649b4d86-af00-4416-9ca8-ad49a91ce9fd', '2026-04-02 23:16:10', 6.87379, 79.8702, 0.00856384, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1414, '649b4d86-af00-4416-9ca8-ad49a91ce9fd', '2026-04-02 23:16:12', 6.87379, 79.8702, 0.00856384, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1415, '649b4d86-af00-4416-9ca8-ad49a91ce9fd', '2026-04-02 23:16:17', 6.87379, 79.8702, 0.0107319, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1416, '649b4d86-af00-4416-9ca8-ad49a91ce9fd', '2026-04-02 23:16:19', 6.87379, 79.8702, 0.0107319, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1417, '649b4d86-af00-4416-9ca8-ad49a91ce9fd', '2026-04-02 23:16:20', 6.87379, 79.8702, 0.0107319, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1418, '649b4d86-af00-4416-9ca8-ad49a91ce9fd', '2026-04-02 23:16:25', 6.87379, 79.8702, 0.0176335, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1419, '649b4d86-af00-4416-9ca8-ad49a91ce9fd', '2026-04-02 23:16:28', 6.87379, 79.8702, 0.0176335, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1420, '649b4d86-af00-4416-9ca8-ad49a91ce9fd', '2026-04-02 23:16:33', 6.87379, 79.8702, 0.000249764, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1421, '649b4d86-af00-4416-9ca8-ad49a91ce9fd', '2026-04-02 23:16:35', 6.87379, 79.8702, 0.000249764, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1422, '649b4d86-af00-4416-9ca8-ad49a91ce9fd', '2026-04-02 23:16:36', 6.87379, 79.8702, 0.000249764, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1423, '649b4d86-af00-4416-9ca8-ad49a91ce9fd', '2026-04-02 23:16:38', 6.87379, 79.8702, 0.000249764, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1424, '649b4d86-af00-4416-9ca8-ad49a91ce9fd', '2026-04-02 23:16:41', 6.87379, 79.8702, 0.00996599, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1425, '649b4d86-af00-4416-9ca8-ad49a91ce9fd', '2026-04-02 23:16:44', 6.87379, 79.8702, 0.00996599, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1426, '649b4d86-af00-4416-9ca8-ad49a91ce9fd', '2026-04-02 23:16:50', 6.87379, 79.8702, 0.00466347, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1427, '649b4d86-af00-4416-9ca8-ad49a91ce9fd', '2026-04-02 23:16:52', 6.87379, 79.8702, 0.00466347, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1428, '649b4d86-af00-4416-9ca8-ad49a91ce9fd', '2026-04-02 23:16:54', 6.87379, 79.8702, 0.00466347, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1429, '649b4d86-af00-4416-9ca8-ad49a91ce9fd', '2026-04-02 23:16:59', 6.87379, 79.8702, 0.016764, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1430, '649b4d86-af00-4416-9ca8-ad49a91ce9fd', '2026-04-02 23:17:00', 6.87379, 79.8702, 0.016764, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1431, '649b4d86-af00-4416-9ca8-ad49a91ce9fd', '2026-04-02 23:17:02', 6.87379, 79.8702, 0.016764, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1432, '649b4d86-af00-4416-9ca8-ad49a91ce9fd', '2026-04-02 23:17:07', 6.87379, 79.8702, 0.00489475, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1433, '649b4d86-af00-4416-9ca8-ad49a91ce9fd', '2026-04-02 23:17:10', 6.87379, 79.8702, 0.00489475, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1434, '649b4d86-af00-4416-9ca8-ad49a91ce9fd', '2026-04-02 23:17:15', 6.87379, 79.8702, 0.004833, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1435, '649b4d86-af00-4416-9ca8-ad49a91ce9fd', '2026-04-02 23:17:17', 6.87379, 79.8702, 0.004833, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1436, '649b4d86-af00-4416-9ca8-ad49a91ce9fd', '2026-04-02 23:17:19', 6.87379, 79.8702, 0.004833, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1437, '649b4d86-af00-4416-9ca8-ad49a91ce9fd', '2026-04-02 23:17:20', 6.87379, 79.8702, 0.004833, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1438, '649b4d86-af00-4416-9ca8-ad49a91ce9fd', '2026-04-02 23:17:23', 6.87379, 79.8702, 0.00486607, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1439, '649b4d86-af00-4416-9ca8-ad49a91ce9fd', '2026-04-02 23:17:26', 6.87379, 79.8702, 0.00486607, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1440, '649b4d86-af00-4416-9ca8-ad49a91ce9fd', '2026-04-02 23:17:28', 6.87379, 79.8702, 0.00486607, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1441, '649b4d86-af00-4416-9ca8-ad49a91ce9fd', '2026-04-02 23:17:31', 6.87379, 79.8702, 0.0000711181, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1442, '649b4d86-af00-4416-9ca8-ad49a91ce9fd', '2026-04-02 23:17:34', 6.87379, 79.8702, 0.0000711181, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1443, '649b4d86-af00-4416-9ca8-ad49a91ce9fd', '2026-04-02 23:17:36', 6.87379, 79.8702, 0.0000711181, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1444, '649b4d86-af00-4416-9ca8-ad49a91ce9fd', '2026-04-02 23:17:39', 6.87379, 79.8702, 0.00509257, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1445, '649b4d86-af00-4416-9ca8-ad49a91ce9fd', '2026-04-02 23:17:43', 6.87379, 79.8702, 0.00509257, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1446, '649b4d86-af00-4416-9ca8-ad49a91ce9fd', '2026-04-02 23:17:47', 6.8738, 79.8702, 0.00974929, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1447, '649b4d86-af00-4416-9ca8-ad49a91ce9fd', '2026-04-02 23:17:49', 6.8738, 79.8702, 0.00974929, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1448, '649b4d86-af00-4416-9ca8-ad49a91ce9fd', '2026-04-02 23:17:50', 6.8738, 79.8702, 0.00974929, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1449, '649b4d86-af00-4416-9ca8-ad49a91ce9fd', '2026-04-02 23:17:55', 6.8738, 79.8702, 0.000143661, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1450, '649b4d86-af00-4416-9ca8-ad49a91ce9fd', '2026-04-02 23:17:56', 6.8738, 79.8702, 0.000143661, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1451, '649b4d86-af00-4416-9ca8-ad49a91ce9fd', '2026-04-02 23:17:58', 6.8738, 79.8702, 0.000143661, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1452, '649b4d86-af00-4416-9ca8-ad49a91ce9fd', '2026-04-02 23:18:03', 6.8738, 79.8702, 0.00691362, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1453, '649b4d86-af00-4416-9ca8-ad49a91ce9fd', '2026-04-02 23:18:06', 6.8738, 79.8702, 0.00691362, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1454, '649b4d86-af00-4416-9ca8-ad49a91ce9fd', '2026-04-02 23:18:11', 6.8738, 79.8702, 0.0000976797, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1455, '649b4d86-af00-4416-9ca8-ad49a91ce9fd', '2026-04-02 23:18:13', 6.8738, 79.8702, 0.0000976797, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1456, '649b4d86-af00-4416-9ca8-ad49a91ce9fd', '2026-04-02 23:18:14', 6.8738, 79.8702, 0.0000976797, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1457, '649b4d86-af00-4416-9ca8-ad49a91ce9fd', '2026-04-02 23:18:19', 6.8738, 79.8702, 0.0100103, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1458, '649b4d86-af00-4416-9ca8-ad49a91ce9fd', '2026-04-02 23:18:22', 6.8738, 79.8702, 0.0100103, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1459, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:26:38', 6.87379, 79.8702, 0, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1460, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:26:42', 6.8738, 79.8702, 0.0461923, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1461, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:26:43', 6.8738, 79.8702, 0.0461923, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1462, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:26:44', 6.8738, 79.8702, 0.0461923, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1463, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:26:45', 6.8738, 79.8702, 0.0461923, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1464, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:26:47', 6.8738, 79.8702, 0.0461923, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1465, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:26:50', 6.8738, 79.8702, 0.71075, 282.316, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1466, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:26:51', 6.8738, 79.8702, 0.71075, 282.316, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1467, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:26:53', 6.8738, 79.8702, 0.71075, 282.316, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1468, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:26:55', 6.8738, 79.8702, 0.71075, 282.316, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1469, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:27:00', 6.87379, 79.8702, 0.478967, 123.144, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1470, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:27:00', 6.87379, 79.8702, 0.478967, 123.144, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1471, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:27:01', 6.87379, 79.8702, 0.478967, 123.144, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1472, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:27:03', 6.87379, 79.8702, 0.478967, 123.144, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1473, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:27:08', 6.87379, 79.8702, 0.0510099, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1474, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:27:08', 6.87379, 79.8702, 0.0510099, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1475, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:27:10', 6.87379, 79.8702, 0.0510099, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1476, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:27:11', 6.87379, 79.8702, 0.0510099, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1477, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:27:17', 6.87379, 79.8702, 0.070954, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1478, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:27:17', 6.87379, 79.8702, 0.070954, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1479, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:27:18', 6.87379, 79.8702, 0.070954, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1480, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:27:19', 6.87379, 79.8702, 0.070954, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1481, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:27:21', 6.87379, 79.8702, 0.070954, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1482, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:27:26', 6.8738, 79.8702, 0.0171854, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1483, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:27:27', 6.8738, 79.8702, 0.0171854, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1484, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:27:28', 6.8738, 79.8702, 0.0171854, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1485, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:27:29', 6.8738, 79.8702, 0.0171854, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1486, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:27:34', 6.87379, 79.8702, 0.00678443, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1487, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:27:35', 6.87379, 79.8702, 0.00678443, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1488, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:27:36', 6.87379, 79.8702, 0.00678443, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1489, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:27:37', 6.87379, 79.8702, 0.00678443, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1490, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:27:43', 6.87379, 79.8702, 0.0143134, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1491, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:27:43', 6.87379, 79.8702, 0.0143134, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1492, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:27:45', 6.87379, 79.8702, 0.0143134, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1493, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:27:46', 6.87379, 79.8702, 0.0143134, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1494, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:27:50', 6.8738, 79.8702, 0.0291839, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1495, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:27:51', 6.8738, 79.8702, 0.0291839, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1496, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:27:54', 6.8738, 79.8702, 0.0291839, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1497, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:27:59', 6.8738, 79.8702, 0.00516444, 0, 0, 'LOW', 'GREEN', '[]', 0, 0);
INSERT INTO `telemetry_points` (`id`, `trip_id`, `timestamp`, `latitude`, `longitude`, `speed_kph`, `heading`, `risk_score`, `risk_level`, `alert_level`, `detected_signs`, `belief_dangerous`, `conflict_measure`) VALUES
(1498, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:28:00', 6.8738, 79.8702, 0.00516444, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1499, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:28:02', 6.8738, 79.8702, 0.00516444, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1500, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:28:07', 6.8738, 79.8702, 0.00494958, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1501, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:28:08', 6.8738, 79.8702, 0.00494958, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1502, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:28:10', 6.8738, 79.8702, 0.00494958, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1503, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:28:14', 6.8738, 79.8702, 0.0000761283, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1504, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:28:15', 6.8738, 79.8702, 0.0000761283, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1505, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:28:17', 6.8738, 79.8702, 0.0000761283, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1506, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:28:22', 6.8738, 79.8702, 0.00477383, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1507, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:28:26', 6.8738, 79.8702, 0.00477383, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1508, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:28:30', 6.8738, 79.8702, 0.0000692053, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1509, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:28:32', 6.8738, 79.8702, 0.0000692053, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1510, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:28:33', 6.8738, 79.8702, 0.0000692053, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1511, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:28:39', 6.8738, 79.8702, 0.00481745, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1512, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:28:41', 6.8738, 79.8702, 0.00481745, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1513, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:28:44', 6.8738, 79.8702, 0.00481745, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1514, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:28:47', 6.8738, 79.8702, 0.00498396, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1515, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:28:50', 6.8738, 79.8702, 0.00498396, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1516, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:28:55', 6.8738, 79.8702, 0.0000726169, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1517, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:28:58', 6.8738, 79.8702, 0.0000726169, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1518, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:28:59', 6.8738, 79.8702, 0.0000726169, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1519, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:29:02', 6.8738, 79.8702, 0.00495953, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1520, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:29:04', 6.8738, 79.8702, 0.00495953, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1521, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:29:05', 6.8738, 79.8702, 0.00495953, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1522, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:29:10', 6.8738, 79.8702, 0.0000755964, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1523, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:29:11', 6.8738, 79.8702, 0.0000755964, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1524, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:29:14', 6.8738, 79.8702, 0.0000755964, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1525, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:29:19', 6.8738, 79.8702, 0.00673096, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1526, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:29:20', 6.8738, 79.8702, 0.00673096, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1527, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:29:22', 6.8738, 79.8702, 0.00673096, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1528, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:29:24', 6.8738, 79.8702, 0.00673096, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1529, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:29:27', 6.8738, 79.8702, 0.00472105, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1530, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:29:30', 6.8738, 79.8702, 0.00472105, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1531, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:29:32', 6.8738, 79.8702, 0.00472105, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1532, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:29:34', 6.87379, 79.8702, 0.0183788, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1533, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:29:38', 6.87379, 79.8702, 0.0183788, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1534, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:29:42', 6.87379, 79.8702, 0.00520312, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1535, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:29:44', 6.87379, 79.8702, 0.00520312, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1536, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:29:45', 6.87379, 79.8702, 0.00520312, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1537, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:29:51', 6.87379, 79.8702, 0.00960222, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1538, 'ea212e60-cb01-49cf-9a80-9e2f87aa872e', '2026-04-02 23:29:53', 6.87379, 79.8702, 0.00960222, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1539, 'c4d3c3bb-7e13-48da-a0c2-e1ab1ac8933f', '2026-04-04 11:23:52', 6.87379, 79.8702, 0.127148, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1540, 'ed374e68-0d9d-45d9-b531-c84c3c33808d', '2026-04-04 11:23:52', 6.87379, 79.8702, 0.127148, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1541, '4e1aaf41-f714-406b-b4c6-db81f1299b99', '2026-04-04 11:23:53', 6.87379, 79.8702, 0.127148, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1542, 'ffda2e48-90f6-4974-8ad5-a5944d39884f', '2026-04-04 11:23:54', 6.87379, 79.8702, 0.127148, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1543, 'ed374e68-0d9d-45d9-b531-c84c3c33808d', '2026-04-04 11:23:55', 6.87379, 79.8702, 0.127148, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1544, 'ed374e68-0d9d-45d9-b531-c84c3c33808d', '2026-04-04 11:23:57', 6.87379, 79.8702, 0.296981, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1545, '0a53ee32-d252-4e58-ba8d-0ac019e7ae07', '2026-04-23 05:35:22', 6.87378, 79.8702, 0, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1546, '01943eec-20ea-418b-87f9-f3f7366b2366', '2026-04-23 05:35:24', 6.87378, 79.8702, 0, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1547, 'f2cef211-c625-40bf-a0eb-94e44e1d0c7d', '2026-04-23 05:35:25', 6.87378, 79.8702, 0, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1548, '0a53ee32-d252-4e58-ba8d-0ac019e7ae07', '2026-04-23 05:35:26', 6.87378, 79.8702, 0, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1549, '0a53ee32-d252-4e58-ba8d-0ac019e7ae07', '2026-04-23 05:35:28', 6.87378, 79.8702, 0.250743, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1550, '0a53ee32-d252-4e58-ba8d-0ac019e7ae07', '2026-04-23 05:35:30', 6.87378, 79.8702, 0.250743, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1551, '0a53ee32-d252-4e58-ba8d-0ac019e7ae07', '2026-04-23 05:35:31', 6.87378, 79.8702, 0.250743, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1552, '0a53ee32-d252-4e58-ba8d-0ac019e7ae07', '2026-04-23 05:35:33', 6.87378, 79.8702, 0.250743, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1553, '0a53ee32-d252-4e58-ba8d-0ac019e7ae07', '2026-04-23 05:35:39', 6.87378, 79.8702, 0.0139152, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1554, '0a53ee32-d252-4e58-ba8d-0ac019e7ae07', '2026-04-23 05:35:42', 6.87378, 79.8702, 0.0139152, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1555, '0a53ee32-d252-4e58-ba8d-0ac019e7ae07', '2026-04-23 05:35:42', 6.87378, 79.8702, 0.0139152, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1556, '0a53ee32-d252-4e58-ba8d-0ac019e7ae07', '2026-04-23 05:35:43', 6.87378, 79.8702, 0.0139152, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1557, '3de3d699-90ea-41e4-b9a4-d59e95670112', '2026-04-23 05:55:57', 6.87378, 79.8702, 0, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1558, '9ed7a1c1-b7f2-4f8e-a910-cd297b3ccc6b', '2026-04-23 05:55:57', 6.87378, 79.8702, 0, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1559, '2797adbd-5175-406c-9841-546f91bc4b65', '2026-04-23 05:55:59', 6.87378, 79.8702, 0, 0, 9.8, 'LOW', 'GREEN', '[]', 0, 0),
(1560, '3de3d699-90ea-41e4-b9a4-d59e95670112', '2026-04-23 05:56:00', 6.87378, 79.8702, 0, 0, 6.3, 'LOW', 'GREEN', '[]', 0, 0),
(1561, '3de3d699-90ea-41e4-b9a4-d59e95670112', '2026-04-23 05:56:09', 6.87393, 79.8701, 0.828564, 45.8764, 7.4, 'LOW', 'GREEN', '[]', 0, 0),
(1562, '3de3d699-90ea-41e4-b9a4-d59e95670112', '2026-04-23 05:56:09', 6.87393, 79.8701, 0.828564, 45.8764, 4.8, 'LOW', 'GREEN', '[]', 0, 0),
(1563, '3de3d699-90ea-41e4-b9a4-d59e95670112', '2026-04-23 05:56:11', 6.87393, 79.8701, 0.828882, 45.8187, 5.4, 'LOW', 'GREEN', '[]', 0, 0),
(1564, '3de3d699-90ea-41e4-b9a4-d59e95670112', '2026-04-23 05:56:12', 6.87393, 79.8701, 0.828564, 45.8764, 3.5, 'LOW', 'GREEN', '[]', 0, 0),
(1565, '3de3d699-90ea-41e4-b9a4-d59e95670112', '2026-04-23 05:56:13', 6.87393, 79.8701, 0.828882, 45.8187, 2.3, 'LOW', 'GREEN', '[]', 0, 0),
(1566, '3de3d699-90ea-41e4-b9a4-d59e95670112', '2026-04-23 05:56:16', 6.87391, 79.8701, 0.361448, 90.0311, 4.4, 'LOW', 'GREEN', '[]', 0, 0),
(1567, '3de3d699-90ea-41e4-b9a4-d59e95670112', '2026-04-23 05:56:17', 6.87391, 79.8701, 0.361448, 90.0311, 2.8, 'LOW', 'GREEN', '[]', 0, 0),
(1568, '3de3d699-90ea-41e4-b9a4-d59e95670112', '2026-04-23 05:56:18', 6.87388, 79.8702, 0.363063, 90.5454, 4.6, 'LOW', 'GREEN', '[]', 0, 0),
(1569, '3de3d699-90ea-41e4-b9a4-d59e95670112', '2026-04-23 05:56:22', 6.87388, 79.8702, 0.363063, 90.5454, 5.4, 'LOW', 'GREEN', '[]', 0, 0),
(1570, '3de3d699-90ea-41e4-b9a4-d59e95670112', '2026-04-23 05:56:23', 6.87388, 79.8702, 0.363063, 90.5454, 3.5, 'LOW', 'GREEN', '[]', 0, 0),
(1571, '3de3d699-90ea-41e4-b9a4-d59e95670112', '2026-04-23 05:56:25', 6.8739, 79.8701, 1.00803, 89.9161, 2.3, 'LOW', 'GREEN', '[]', 0, 0),
(1572, '3de3d699-90ea-41e4-b9a4-d59e95670112', '2026-04-23 05:56:26', 6.8739, 79.8701, 1.00803, 89.9161, 4.4, 'LOW', 'GREEN', '[]', 0, 0),
(1573, '3de3d699-90ea-41e4-b9a4-d59e95670112', '2026-04-23 05:56:29', 6.8739, 79.8701, 1.00803, 89.9161, 2.8, 'LOW', 'GREEN', '[]', 0, 0),
(1574, '3de3d699-90ea-41e4-b9a4-d59e95670112', '2026-04-23 05:56:33', 6.87384, 79.8702, 1.01524, 90.0163, 4.6, 'LOW', 'GREEN', '[]', 0, 0),
(1575, '3de3d699-90ea-41e4-b9a4-d59e95670112', '2026-04-23 05:56:34', 6.8739, 79.8701, 1.00803, 89.9161, 3, 'LOW', 'GREEN', '[]', 0, 0),
(1576, '3de3d699-90ea-41e4-b9a4-d59e95670112', '2026-04-23 05:56:35', 6.87384, 79.8702, 1.01524, 90.0163, 4.7, 'LOW', 'GREEN', '[]', 0, 0),
(1577, '3de3d699-90ea-41e4-b9a4-d59e95670112', '2026-04-23 05:56:36', 6.87384, 79.8702, 1.01524, 90.0163, 3, 'LOW', 'GREEN', '[]', 0, 0),
(1578, '3de3d699-90ea-41e4-b9a4-d59e95670112', '2026-04-23 05:56:40', 6.87382, 79.8702, 0.986515, 90.0109, 4.7, 'LOW', 'GREEN', '[]', 0, 0),
(1579, '3de3d699-90ea-41e4-b9a4-d59e95670112', '2026-04-23 05:56:41', 6.87382, 79.8702, 0.986515, 90.0109, 3.1, 'LOW', 'GREEN', '[]', 0, 0),
(1580, '3de3d699-90ea-41e4-b9a4-d59e95670112', '2026-04-23 05:56:42', 6.87383, 79.8702, 0.984993, 88.9248, 4.7, 'LOW', 'GREEN', '[]', 0, 0),
(1581, '3de3d699-90ea-41e4-b9a4-d59e95670112', '2026-04-23 05:56:44', 6.87383, 79.8702, 0.984993, 88.9248, 3.1, 'LOW', 'GREEN', '[]', 0, 0),
(1582, '3de3d699-90ea-41e4-b9a4-d59e95670112', '2026-04-23 05:56:50', 6.87383, 79.8702, 0.984993, 88.9248, 4.7, 'LOW', 'GREEN', '[]', 0, 0),
(1583, '3de3d699-90ea-41e4-b9a4-d59e95670112', '2026-04-23 05:56:51', 6.87392, 79.8702, 1.58543, 38.9527, 5.4, 'LOW', 'GREEN', '[]', 0, 0),
(1584, '3de3d699-90ea-41e4-b9a4-d59e95670112', '2026-04-23 05:56:51', 6.87392, 79.8702, 1.58543, 38.9527, 3.5, 'LOW', 'GREEN', '[]', 0, 0),
(1585, '3de3d699-90ea-41e4-b9a4-d59e95670112', '2026-04-23 05:56:53', 6.87392, 79.8702, 1.58545, 38.9464, 2.3, 'LOW', 'GREEN', '[]', 0, 0),
(1586, '3de3d699-90ea-41e4-b9a4-d59e95670112', '2026-04-23 05:56:54', 6.87392, 79.8702, 1.58545, 38.9464, 1.5, 'LOW', 'GREEN', '[]', 0, 0),
(1587, '3de3d699-90ea-41e4-b9a4-d59e95670112', '2026-04-23 05:56:58', 6.87393, 79.8702, 0.993887, 89.9091, 4, 'LOW', 'GREEN', '[]', 0, 0),
(1588, '3de3d699-90ea-41e4-b9a4-d59e95670112', '2026-04-23 05:56:58', 6.87393, 79.8702, 0.993887, 89.9091, 5.1, 'LOW', 'GREEN', '[]', 0, 0),
(1589, '3de3d699-90ea-41e4-b9a4-d59e95670112', '2026-04-23 05:57:02', 6.87391, 79.8702, 0.992168, 91.1973, 5.6, 'LOW', 'GREEN', '[]', 0, 0),
(1590, '3de3d699-90ea-41e4-b9a4-d59e95670112', '2026-04-23 05:57:04', 6.87391, 79.8702, 0.992168, 91.1973, 3.6, 'LOW', 'GREEN', '[]', 0, 0),
(1591, '3de3d699-90ea-41e4-b9a4-d59e95670112', '2026-04-23 05:57:06', 6.8739, 79.8702, 1.62159, 90.0138, 4.9, 'LOW', 'GREEN', '[]', 0, 0),
(1592, '3de3d699-90ea-41e4-b9a4-d59e95670112', '2026-04-23 05:57:09', 6.8739, 79.8702, 1.62111, 90.0123, 3.2, 'LOW', 'GREEN', '[]', 0, 0),
(1593, '3de3d699-90ea-41e4-b9a4-d59e95670112', '2026-04-23 05:57:09', 6.8739, 79.8702, 1.62159, 90.0138, 2.1, 'LOW', 'GREEN', '[]', 0, 0),
(1594, '3de3d699-90ea-41e4-b9a4-d59e95670112', '2026-04-23 05:57:14', 6.8739, 79.8702, 1.62111, 90.0123, 6.2, 'LOW', 'GREEN', '[]', 0, 0),
(1595, '3de3d699-90ea-41e4-b9a4-d59e95670112', '2026-04-23 05:57:16', 6.8739, 79.8702, 1.62111, 90.0123, 4, 'LOW', 'GREEN', '[]', 0, 0),
(1596, '3de3d699-90ea-41e4-b9a4-d59e95670112', '2026-04-23 05:57:16', 6.87391, 79.8702, 0.431913, 0.0177051, 2.6, 'LOW', 'GREEN', '[]', 0, 0),
(1597, '3de3d699-90ea-41e4-b9a4-d59e95670112', '2026-04-23 05:57:18', 6.87391, 79.8702, 0.431913, 0.0177051, 1.7, 'LOW', 'GREEN', '[]', 0, 0),
(1598, '3de3d699-90ea-41e4-b9a4-d59e95670112', '2026-04-23 05:57:18', 6.87391, 79.8702, 0.431913, 0.0177051, 1.1, 'LOW', 'GREEN', '[]', 0, 0),
(1599, '3de3d699-90ea-41e4-b9a4-d59e95670112', '2026-04-23 05:57:20', 6.87391, 79.8702, 0.431913, 0.0177051, 3.9, 'LOW', 'GREEN', '[]', 0, 0),
(1600, '3de3d699-90ea-41e4-b9a4-d59e95670112', '2026-04-23 05:57:24', 6.87392, 79.8702, 1.61409, 89.9556, 5.1, 'LOW', 'GREEN', '[]', 0, 0),
(1601, '3de3d699-90ea-41e4-b9a4-d59e95670112', '2026-04-23 05:57:26', 6.87392, 79.8702, 1.61409, 89.9556, 5.5, 'LOW', 'GREEN', '[]', 0, 0),
(1602, '3de3d699-90ea-41e4-b9a4-d59e95670112', '2026-04-23 05:57:27', 6.87392, 79.8702, 1.61409, 89.9556, 3.6, 'LOW', 'GREEN', '[]', 0, 0),
(1603, '3de3d699-90ea-41e4-b9a4-d59e95670112', '2026-04-23 05:57:28', 6.87392, 79.8702, 1.61409, 89.9556, 2.3, 'LOW', 'GREEN', '[]', 0, 0),
(1604, '3de3d699-90ea-41e4-b9a4-d59e95670112', '2026-04-23 05:57:32', 6.87393, 79.8702, 0.878163, 89.8667, 4.4, 'LOW', 'GREEN', '[]', 0, 0),
(1605, '3de3d699-90ea-41e4-b9a4-d59e95670112', '2026-04-23 05:57:33', 6.87393, 79.8702, 0.878163, 89.8667, 2.9, 'LOW', 'GREEN', '[]', 0, 0),
(1606, '3de3d699-90ea-41e4-b9a4-d59e95670112', '2026-04-23 05:57:34', 6.87393, 79.8702, 0.878163, 89.8667, 1.9, 'LOW', 'GREEN', '[]', 0, 0),
(1607, '3de3d699-90ea-41e4-b9a4-d59e95670112', '2026-04-23 05:57:39', 6.87393, 79.8702, 0.878163, 89.8667, 6.1, 'LOW', 'GREEN', '[]', 0, 0),
(1608, '3de3d699-90ea-41e4-b9a4-d59e95670112', '2026-04-23 05:57:41', 6.87393, 79.8702, 0.882747, 90.0458, 4, 'LOW', 'GREEN', '[]', 0, 0),
(1609, '3de3d699-90ea-41e4-b9a4-d59e95670112', '2026-04-23 05:57:42', 6.87393, 79.8702, 0.882747, 90.0458, 2.6, 'LOW', 'GREEN', '[]', 0, 0),
(1610, '3de3d699-90ea-41e4-b9a4-d59e95670112', '2026-04-23 05:57:42', 6.87393, 79.8702, 0.882747, 90.0458, 1.7, 'LOW', 'GREEN', '[]', 0, 0),
(1611, '3de3d699-90ea-41e4-b9a4-d59e95670112', '2026-04-23 05:57:47', 6.87393, 79.8702, 0.882747, 90.0458, 6.1, 'LOW', 'GREEN', '[]', 0, 0),
(1612, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:36:48', 6.87386, 79.8702, 0.828, 70, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1613, '0df9d65e-dd0d-479c-a7ea-48e9da77fff7', '2026-04-25 19:36:48', 6.87386, 79.8702, 0.828, 70, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1614, '61df8f57-1f39-4790-a732-c76f216f67c2', '2026-04-25 19:36:50', 6.87386, 79.8702, 0.828, 70, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1615, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:36:50', 6.87386, 79.8702, 0.828, 70, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1616, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:36:54', 6.8739, 79.8702, 1.22187, 307.069, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1617, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:36:54', 6.8739, 79.8702, 1.22187, 307.069, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1618, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:36:56', 6.87391, 79.8702, 1.22354, 307.272, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1619, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:36:58', 6.87391, 79.8702, 1.22354, 307.272, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1620, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:37:00', 6.87391, 79.8702, 1.22354, 307.272, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1621, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:37:04', 6.87405, 79.8702, 0.78845, 229.384, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1622, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:37:05', 6.87405, 79.8702, 0.78845, 229.384, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1623, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:37:08', 6.87405, 79.8702, 0.787351, 229.443, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1624, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:37:11', 6.87405, 79.8702, 0.787351, 229.443, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1625, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:37:14', 6.87391, 79.8702, 0.833428, 189.951, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1626, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:37:15', 6.87405, 79.8702, 0.787351, 229.443, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1627, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:37:16', 6.87391, 79.8702, 0.833542, 189.94, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1628, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:37:18', 6.87391, 79.8702, 0.833542, 189.94, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1629, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:37:20', 6.87391, 79.8702, 0.833428, 189.951, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1630, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:37:22', 6.87405, 79.8702, 2.70591, 41.7356, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1631, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:37:23', 6.87405, 79.8702, 2.70591, 41.7356, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1632, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:37:24', 6.87406, 79.8702, 2.7057, 41.6453, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1633, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:37:26', 6.87406, 79.8702, 2.7057, 41.6453, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1634, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:37:28', 6.87406, 79.8702, 2.7057, 41.6453, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1635, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:37:37', 6.87381, 79.8702, 1.23273, 204.817, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1636, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:37:37', 6.87381, 79.8702, 1.23334, 204.848, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1637, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:37:39', 6.87381, 79.8702, 1.23334, 204.848, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1638, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:37:39', 6.87381, 79.8702, 1.23273, 204.817, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1639, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:37:42', 6.87381, 79.8702, 1.23273, 204.817, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1640, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:37:42', 6.87391, 79.8701, 2.1607, 43.4375, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1641, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:37:44', 6.87391, 79.8701, 2.1607, 43.4375, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1642, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:37:45', 6.87391, 79.8701, 2.15485, 43.327, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1643, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:37:46', 6.87391, 79.8701, 2.15485, 43.327, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1644, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:37:48', 6.87391, 79.8701, 2.15485, 43.327, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1645, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:37:52', 6.87381, 79.8702, 4.58791, 33.4515, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1646, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:37:52', 6.87381, 79.8702, 4.58791, 33.4515, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1647, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:38:00', 6.87383, 79.8702, 4.55588, 33.3458, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1648, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:38:02', 6.87381, 79.8702, 0.611825, 334.882, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1649, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:38:04', 6.87381, 79.8702, 0.611825, 334.882, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1650, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:38:06', 6.87382, 79.8702, 0.611286, 334.849, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1651, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:38:08', 6.87382, 79.8702, 0.611286, 334.849, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1652, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:38:12', 6.87397, 79.8701, 0.551037, 6.67453, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1653, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:38:14', 6.87397, 79.8701, 0.551037, 6.67453, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1654, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:38:17', 6.87397, 79.8701, 0.551037, 6.67453, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1655, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:38:20', 6.87391, 79.8702, 0.952931, 274.189, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1656, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:38:22', 6.87397, 79.8701, 0.551037, 6.67453, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1657, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:38:24', 6.87391, 79.8702, 0.952931, 274.189, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1658, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:38:28', 6.87389, 79.8702, 1.54392, 38.2089, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1659, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:38:30', 6.87389, 79.8702, 1.54392, 38.2089, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1660, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:38:33', 6.87389, 79.8702, 1.54392, 38.2089, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1661, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:38:36', 6.87398, 79.8702, 2.72576, 221, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1662, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:38:38', 6.87398, 79.8702, 2.71692, 221.225, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1663, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:38:41', 6.87398, 79.8702, 2.72576, 221, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1664, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:38:51', 6.87397, 79.8702, 1.11322, 29.9314, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1665, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:38:54', 6.87392, 79.8702, 1.08527, 262.66, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1666, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:38:59', 6.87392, 79.8702, 1.08527, 262.66, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1667, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:39:01', 6.87392, 79.8702, 1.08527, 262.66, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1668, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:39:02', 6.87394, 79.8702, 1.61727, 203.095, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1669, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:39:06', 6.87394, 79.8702, 1.60771, 202.725, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1670, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:39:09', 6.87394, 79.8702, 1.60771, 202.725, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1671, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:39:10', 6.87395, 79.8702, 0.180093, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1672, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:39:19', 6.87395, 79.8702, 0.180093, 0, 0.1, 'LOW', 'GREEN', '[]', 0.0004, 0),
(1673, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:39:23', 6.87396, 79.8702, 0.180966, 0, 0.1, 'LOW', 'GREEN', '[]', 0.0004, 0),
(1674, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:39:27', 6.8739, 79.8702, 0.613422, 247.864, 0.2, 'LOW', 'GREEN', '[]', 0.0015, 0),
(1675, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:39:29', 6.8739, 79.8702, 0.613422, 247.864, 0.3, 'LOW', 'GREEN', '[]', 0.0015, 0),
(1676, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:39:32', 6.87383, 79.8701, 1.33127, 117.206, 0.6, 'LOW', 'GREEN', '[]', 0.0032, 0),
(1677, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:39:34', 6.87383, 79.8701, 1.33127, 117.206, 0.7, 'LOW', 'GREEN', '[]', 0.0032, 0),
(1678, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:39:38', 6.87396, 79.8702, 1.55583, 47.7564, 0.9, 'LOW', 'GREEN', '[]', 0.0037, 0),
(1679, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:39:40', 6.87396, 79.8702, 1.55411, 47.7184, 1, 'LOW', 'GREEN', '[]', 0.0037, 0),
(1680, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:39:43', 6.87396, 79.8702, 1.55583, 47.7564, 1.1, 'LOW', 'GREEN', '[]', 0.0037, 0),
(1681, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:39:44', 6.87396, 79.8702, 1.55411, 47.7184, 1.2, 'LOW', 'GREEN', '[]', 0.0037, 0),
(1682, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:39:47', 6.87396, 79.8702, 1.55411, 47.7184, 1.2, 'LOW', 'GREEN', '[]', 0.0037, 0),
(1683, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:39:50', 6.87379, 79.8702, 7.81994, 174.957, 3, 'LOW', 'GREEN', '[]', 0.0188, 0),
(1684, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:39:52', 6.87379, 79.8702, 7.81994, 174.957, 4.1, 'LOW', 'GREEN', '[]', 0.0188, 0),
(1685, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:39:53', 6.87379, 79.8702, 7.81994, 174.957, 4.9, 'LOW', 'GREEN', '[]', 0.0188, 0),
(1686, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:41:29', 6.87393, 79.8702, 0.179569, 0, 3.2, 'LOW', 'GREEN', '[]', 0, 0),
(1687, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:41:30', 6.87385, 79.8702, 0.658056, 179.905, 2.1, 'LOW', 'GREEN', '[]', 0, 0),
(1688, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:41:31', 6.87385, 79.8702, 0.658056, 179.905, 1.3, 'LOW', 'GREEN', '[]', 0, 0),
(1689, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:41:33', 6.87385, 79.8702, 0.658056, 179.905, 0.9, 'LOW', 'GREEN', '[]', 0, 0),
(1690, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:41:33', 6.87393, 79.8702, 0.179569, 0, 0.6, 'LOW', 'GREEN', '[]', 0, 0),
(1691, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:41:34', 6.87385, 79.8702, 0.658056, 179.905, 0.4, 'LOW', 'GREEN', '[]', 0, 0),
(1692, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:41:38', 6.87384, 79.8702, 0.143572, 0, 0.2, 'LOW', 'GREEN', '[]', 0, 0),
(1693, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:41:38', 6.87384, 79.8702, 0.143572, 0, 0.2, 'LOW', 'GREEN', '[]', 0, 0),
(1694, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:41:40', 6.87384, 79.8702, 0.143572, 0, 0.1, 'LOW', 'GREEN', '[]', 0, 0),
(1695, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:41:44', 6.87396, 79.8702, 1.14481, 107.667, 0.1, 'LOW', 'GREEN', '[]', 0, 0),
(1696, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:41:45', 6.87396, 79.8702, 1.14481, 107.667, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1697, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:41:46', 6.87396, 79.8702, 1.14481, 107.667, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1698, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:41:48', 6.87396, 79.8702, 1.14481, 107.667, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1699, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:41:52', 6.87389, 79.8702, 0.939036, 259.982, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1700, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:41:53', 6.87389, 79.8702, 0.939036, 259.982, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1701, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:41:59', 6.87389, 79.8702, 0.939036, 259.982, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1702, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:42:01', 6.87392, 79.8702, 2.59714, 71.8598, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1703, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:42:03', 6.87392, 79.8702, 2.59714, 71.8598, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1704, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:42:04', 6.87392, 79.8702, 2.59714, 71.8598, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1705, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:42:08', 6.87392, 79.8702, 2.04697, 136.103, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1706, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:42:10', 6.87392, 79.8702, 2.04697, 136.103, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1707, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:42:12', 6.87392, 79.8702, 2.04697, 136.103, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1708, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:42:16', 6.8739, 79.8702, 0.864066, 185.895, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1709, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:42:18', 6.8739, 79.8702, 0.864223, 186.106, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1710, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:42:20', 6.8739, 79.8702, 0.864223, 186.106, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1711, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:42:22', 6.8739, 79.8702, 0.864223, 186.106, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1712, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:42:24', 6.8739, 79.8702, 0.864066, 185.895, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1713, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:42:26', 6.87392, 79.8701, 1.36753, 198.129, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1714, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:42:26', 6.87392, 79.8701, 1.36753, 198.129, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1715, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:42:28', 6.87392, 79.8701, 1.36753, 198.129, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1716, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:42:30', 6.87392, 79.8701, 1.36753, 198.129, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1717, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:42:34', 6.87394, 79.8701, 1.18205, 240.485, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1718, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:42:35', 6.87394, 79.8701, 1.18205, 240.485, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1719, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:42:36', 6.87394, 79.8701, 1.18205, 240.485, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1720, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:42:43', 6.87389, 79.8701, 1.43421, 299.721, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1721, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:42:49', 6.87394, 79.8701, 1.18205, 240.485, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1722, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:42:51', 6.87391, 79.8701, 0.613691, 98.8697, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1723, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:42:53', 6.87389, 79.8701, 1.43421, 299.721, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1724, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:42:57', 6.87391, 79.8701, 0.613691, 98.8697, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1725, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:42:59', 6.87391, 79.8701, 0.613691, 98.8697, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1726, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:43:01', 6.8739, 79.8702, 1.25774, 278.991, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1727, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:43:03', 6.8739, 79.8702, 1.25774, 278.991, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1728, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:43:06', 6.87387, 79.8703, 0.638896, 252.136, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1729, '61a9bdc4-889a-4218-8f4c-4747de192d9b', '2026-04-25 19:43:11', 6.87387, 79.8703, 0.638896, 252.136, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1730, '9b3aaa88-d57a-453a-803e-664afbd5586e', '2026-04-25 19:45:08', 6.87378, 79.8702, 0, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1731, '46686828-8ea5-4693-86a6-de9d5007169b', '2026-04-25 19:45:10', 6.87378, 79.8702, 0, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1732, '46686828-8ea5-4693-86a6-de9d5007169b', '2026-04-25 19:45:14', 6.87378, 79.8702, 0.0663611, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1733, '46686828-8ea5-4693-86a6-de9d5007169b', '2026-04-25 19:45:16', 6.87378, 79.8702, 0.0663611, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1734, '46686828-8ea5-4693-86a6-de9d5007169b', '2026-04-25 19:45:18', 6.87378, 79.8702, 0.0663611, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1735, '46686828-8ea5-4693-86a6-de9d5007169b', '2026-04-25 19:45:23', 6.8738, 79.8702, 0.574713, 254.029, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1736, '46686828-8ea5-4693-86a6-de9d5007169b', '2026-04-25 19:45:24', 6.8738, 79.8702, 0.574679, 254.029, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1737, '46686828-8ea5-4693-86a6-de9d5007169b', '2026-04-25 19:45:26', 6.8738, 79.8702, 0.574679, 254.029, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1738, '46686828-8ea5-4693-86a6-de9d5007169b', '2026-04-25 19:45:27', 6.8738, 79.8702, 0.574679, 254.029, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1739, '46686828-8ea5-4693-86a6-de9d5007169b', '2026-04-25 19:45:31', 6.87379, 79.8702, 0.635039, 248.363, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1740, '46686828-8ea5-4693-86a6-de9d5007169b', '2026-04-25 19:45:34', 6.87379, 79.8702, 0.635039, 248.363, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1741, '46686828-8ea5-4693-86a6-de9d5007169b', '2026-04-25 19:45:36', 6.87379, 79.8702, 0.635039, 248.363, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1742, '46686828-8ea5-4693-86a6-de9d5007169b', '2026-04-25 19:45:41', 6.87391, 79.8702, 2.66487, 61.8876, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1743, '46686828-8ea5-4693-86a6-de9d5007169b', '2026-04-25 19:45:42', 6.87391, 79.8702, 2.66487, 61.8876, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1744, '46686828-8ea5-4693-86a6-de9d5007169b', '2026-04-25 19:45:49', 6.87389, 79.8702, 0.288238, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1745, '46686828-8ea5-4693-86a6-de9d5007169b', '2026-04-25 19:45:50', 6.87389, 79.8702, 0.287981, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1746, '46686828-8ea5-4693-86a6-de9d5007169b', '2026-04-25 19:45:52', 6.87389, 79.8702, 0.287981, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1747, '46686828-8ea5-4693-86a6-de9d5007169b', '2026-04-25 19:45:54', 6.87389, 79.8702, 0.287981, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1748, '46686828-8ea5-4693-86a6-de9d5007169b', '2026-04-25 19:45:59', 6.87389, 79.8702, 0.287935, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1749, '46686828-8ea5-4693-86a6-de9d5007169b', '2026-04-25 19:46:00', 6.87389, 79.8702, 0.287912, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1750, '46686828-8ea5-4693-86a6-de9d5007169b', '2026-04-25 19:46:01', 6.87389, 79.8702, 0.287912, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1751, '46686828-8ea5-4693-86a6-de9d5007169b', '2026-04-25 19:46:03', 6.87389, 79.8702, 0.287935, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1752, '46686828-8ea5-4693-86a6-de9d5007169b', '2026-04-25 19:46:09', 6.87389, 79.8702, 0.287912, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1753, '46686828-8ea5-4693-86a6-de9d5007169b', '2026-04-25 19:46:15', 6.87391, 79.8702, 1.58209, 268.014, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1754, '46686828-8ea5-4693-86a6-de9d5007169b', '2026-04-25 19:46:19', 6.87381, 79.8702, 1.70029, 256.079, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1755, '46686828-8ea5-4693-86a6-de9d5007169b', '2026-04-25 19:46:22', 6.87381, 79.8702, 1.70029, 256.079, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1756, '46686828-8ea5-4693-86a6-de9d5007169b', '2026-04-25 19:46:25', 6.87381, 79.8702, 1.70029, 256.079, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1757, '46686828-8ea5-4693-86a6-de9d5007169b', '2026-04-25 19:46:28', 6.87381, 79.8702, 1.70029, 256.079, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1758, '46686828-8ea5-4693-86a6-de9d5007169b', '2026-04-25 19:46:31', 6.87383, 79.8702, 0.32532, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1759, '46686828-8ea5-4693-86a6-de9d5007169b', '2026-04-25 19:46:34', 6.87383, 79.8702, 0.32532, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1760, '46686828-8ea5-4693-86a6-de9d5007169b', '2026-04-25 19:46:37', 6.87385, 79.8702, 0.539742, 143.996, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1761, '46686828-8ea5-4693-86a6-de9d5007169b', '2026-04-25 19:46:38', 6.87385, 79.8702, 0.539801, 143.963, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1762, '46686828-8ea5-4693-86a6-de9d5007169b', '2026-04-25 19:46:40', 6.87385, 79.8702, 0.539801, 143.963, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1763, '46686828-8ea5-4693-86a6-de9d5007169b', '2026-04-25 19:46:42', 6.87385, 79.8702, 0.539801, 143.963, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1764, '46686828-8ea5-4693-86a6-de9d5007169b', '2026-04-25 19:46:48', 6.87395, 79.8702, 0.43311, 359.965, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1765, '46686828-8ea5-4693-86a6-de9d5007169b', '2026-04-25 19:46:52', 6.87396, 79.8702, 0.433845, 359.934, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1766, '46686828-8ea5-4693-86a6-de9d5007169b', '2026-04-25 19:46:54', 6.87396, 79.8702, 0.433845, 359.934, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1767, '46686828-8ea5-4693-86a6-de9d5007169b', '2026-04-25 19:46:59', 6.87378, 79.8702, 7.42365, 174.15, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1768, '46686828-8ea5-4693-86a6-de9d5007169b', '2026-04-25 19:47:00', 6.87378, 79.8702, 7.42365, 174.15, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1769, '46686828-8ea5-4693-86a6-de9d5007169b', '2026-04-25 19:47:04', 6.87378, 79.8702, 7.42365, 174.15, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1770, '46686828-8ea5-4693-86a6-de9d5007169b', '2026-04-25 19:47:07', 6.87379, 79.8702, 0.47189, 296.001, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1771, '46686828-8ea5-4693-86a6-de9d5007169b', '2026-04-25 19:47:13', 6.87378, 79.8702, 7.42365, 174.15, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1772, '46686828-8ea5-4693-86a6-de9d5007169b', '2026-04-25 19:47:15', 6.87378, 79.8702, 0.597734, 135.649, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1773, '46686828-8ea5-4693-86a6-de9d5007169b', '2026-04-25 19:47:18', 6.87378, 79.8702, 0.597734, 135.649, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1774, '46686828-8ea5-4693-86a6-de9d5007169b', '2026-04-25 19:47:20', 6.87378, 79.8702, 0.597734, 135.649, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1775, '46686828-8ea5-4693-86a6-de9d5007169b', '2026-04-25 19:47:24', 6.87378, 79.8702, 0.463128, 293.968, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1776, '46686828-8ea5-4693-86a6-de9d5007169b', '2026-04-25 19:47:29', 6.87378, 79.8702, 0.463128, 293.968, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1777, '46686828-8ea5-4693-86a6-de9d5007169b', '2026-04-25 19:47:32', 6.87378, 79.8702, 0.463128, 293.968, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1778, '46686828-8ea5-4693-86a6-de9d5007169b', '2026-04-25 19:47:34', 6.87386, 79.8702, 0.510345, 359.723, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1779, '46686828-8ea5-4693-86a6-de9d5007169b', '2026-04-25 19:47:41', 6.87378, 79.8702, 0.545128, 107.368, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1780, '46686828-8ea5-4693-86a6-de9d5007169b', '2026-04-25 19:47:44', 6.87386, 79.8702, 0.791261, 128.968, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1781, '46686828-8ea5-4693-86a6-de9d5007169b', '2026-04-25 19:47:45', 6.87386, 79.8702, 0.791163, 128.971, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1782, '46686828-8ea5-4693-86a6-de9d5007169b', '2026-04-25 19:47:49', 6.87383, 79.8702, 0.971897, 132.997, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1783, '46686828-8ea5-4693-86a6-de9d5007169b', '2026-04-25 19:47:52', 6.87383, 79.8702, 0.972282, 133.002, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1784, '46686828-8ea5-4693-86a6-de9d5007169b', '2026-04-25 19:47:53', 6.87383, 79.8702, 0.971897, 132.997, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1785, '46686828-8ea5-4693-86a6-de9d5007169b', '2026-04-25 19:47:59', 6.87389, 79.8702, 1.18729, 89.9597, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1786, '46686828-8ea5-4693-86a6-de9d5007169b', '2026-04-25 19:48:05', 6.87389, 79.8702, 1.18729, 89.9597, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1787, 'b6783739-24e0-4b99-b9f5-df6852a95ea2', '2026-04-25 19:48:44', 6.87378, 79.8702, 0, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1788, 'b6783739-24e0-4b99-b9f5-df6852a95ea2', '2026-04-25 19:48:47', 6.87378, 79.8702, 0, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1789, 'b6783739-24e0-4b99-b9f5-df6852a95ea2', '2026-04-25 19:48:49', 6.87378, 79.8702, 0, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1790, '0e846127-b8e3-4f43-b491-49f89ed2543a', '2026-04-25 19:48:51', 6.87378, 79.8702, 0, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1791, 'b6783739-24e0-4b99-b9f5-df6852a95ea2', '2026-04-25 19:48:52', 6.87378, 79.8702, 0.320563, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1792, 'b6783739-24e0-4b99-b9f5-df6852a95ea2', '2026-04-25 19:48:55', 6.87378, 79.8702, 0.320563, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1793, 'b6783739-24e0-4b99-b9f5-df6852a95ea2', '2026-04-25 19:48:57', 6.87378, 79.8702, 0.320563, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1794, 'b6783739-24e0-4b99-b9f5-df6852a95ea2', '2026-04-25 19:49:02', 6.87378, 79.8702, 0.258572, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1795, 'b6783739-24e0-4b99-b9f5-df6852a95ea2', '2026-04-25 19:49:05', 6.87378, 79.8702, 0.258572, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1796, 'b6783739-24e0-4b99-b9f5-df6852a95ea2', '2026-04-25 19:49:08', 6.87378, 79.8702, 0.258572, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1797, 'b6783739-24e0-4b99-b9f5-df6852a95ea2', '2026-04-25 19:49:12', 6.87378, 79.8702, 0.359849, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1798, 'b6783739-24e0-4b99-b9f5-df6852a95ea2', '2026-04-25 19:49:14', 6.87378, 79.8702, 0.359751, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1799, 'b6783739-24e0-4b99-b9f5-df6852a95ea2', '2026-04-25 19:49:15', 6.87378, 79.8702, 0.359751, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1800, 'b6783739-24e0-4b99-b9f5-df6852a95ea2', '2026-04-25 19:49:17', 6.87378, 79.8702, 0.359849, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1801, '2021433f-84a0-4b2b-9a7c-98557d864f93', '2026-04-25 20:37:23', 6.87378, 79.8702, 0, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1802, '9318809d-243d-433f-af07-c20e622dc836', '2026-04-25 20:37:24', 6.87378, 79.8702, 0, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1803, '9318809d-243d-433f-af07-c20e622dc836', '2026-04-25 20:37:28', 6.87378, 79.8702, 0, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1804, '9318809d-243d-433f-af07-c20e622dc836', '2026-04-25 20:37:31', 6.87378, 79.8702, 0, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1805, '9318809d-243d-433f-af07-c20e622dc836', '2026-04-25 20:37:32', 6.87378, 79.8702, 0.936094, 89.9847, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1806, '9318809d-243d-433f-af07-c20e622dc836', '2026-04-25 20:37:33', 6.87378, 79.8702, 0.936094, 89.9847, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1807, '9318809d-243d-433f-af07-c20e622dc836', '2026-04-25 20:37:34', 6.87378, 79.8702, 0.936094, 89.9847, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1808, '9318809d-243d-433f-af07-c20e622dc836', '2026-04-25 20:37:36', 6.87378, 79.8702, 0.936094, 89.9847, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1809, '9318809d-243d-433f-af07-c20e622dc836', '2026-04-25 20:37:40', 6.87381, 79.8702, 0.98626, 89.7513, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1810, '9318809d-243d-433f-af07-c20e622dc836', '2026-04-25 20:37:40', 6.87381, 79.8702, 0.98626, 89.7513, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1811, '9318809d-243d-433f-af07-c20e622dc836', '2026-04-25 20:37:44', 6.87381, 79.8702, 0.98626, 89.7513, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1812, '9318809d-243d-433f-af07-c20e622dc836', '2026-04-25 20:37:47', 6.87381, 79.8702, 0.98626, 89.7513, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1813, '9318809d-243d-433f-af07-c20e622dc836', '2026-04-25 20:37:48', 6.87381, 79.8702, 0.987107, 89.9986, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1814, '9318809d-243d-433f-af07-c20e622dc836', '2026-04-25 20:37:52', 6.87381, 79.8702, 0.987107, 89.9986, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1815, '9318809d-243d-433f-af07-c20e622dc836', '2026-04-25 20:37:53', 6.87381, 79.8702, 0.987107, 89.9986, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1816, '9318809d-243d-433f-af07-c20e622dc836', '2026-04-25 20:37:55', 6.87381, 79.8702, 0.987107, 89.9986, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1817, '9318809d-243d-433f-af07-c20e622dc836', '2026-04-25 20:37:56', 6.87379, 79.8702, 0.924235, 90.0059, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1818, '9318809d-243d-433f-af07-c20e622dc836', '2026-04-25 20:37:58', 6.8738, 79.8702, 0.926592, 89.4456, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1819, '9318809d-243d-433f-af07-c20e622dc836', '2026-04-25 20:38:00', 6.8738, 79.8702, 0.926592, 89.4456, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1820, '9318809d-243d-433f-af07-c20e622dc836', '2026-04-25 20:38:01', 6.87379, 79.8702, 0.924235, 90.0059, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1821, '9318809d-243d-433f-af07-c20e622dc836', '2026-04-25 20:38:04', 6.87379, 79.8702, 0.940891, 90.0132, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1822, '9318809d-243d-433f-af07-c20e622dc836', '2026-04-25 20:38:04', 6.87379, 79.8702, 0.940891, 90.0132, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1823, '9318809d-243d-433f-af07-c20e622dc836', '2026-04-25 20:38:08', 6.8738, 79.8702, 0.94115, 88.6522, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1824, '9318809d-243d-433f-af07-c20e622dc836', '2026-04-25 20:38:10', 6.8738, 79.8702, 0.94115, 88.6522, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1825, '9318809d-243d-433f-af07-c20e622dc836', '2026-04-25 20:38:14', 6.87381, 79.8702, 1.14215, 89.9787, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1826, '9318809d-243d-433f-af07-c20e622dc836', '2026-04-25 20:38:14', 6.8738, 79.8702, 0.94115, 88.6522, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1827, '9318809d-243d-433f-af07-c20e622dc836', '2026-04-25 20:38:16', 6.87381, 79.8702, 1.14215, 89.9787, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1828, '9318809d-243d-433f-af07-c20e622dc836', '2026-04-25 20:38:18', 6.87381, 79.8702, 1.14215, 89.9787, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1829, '9318809d-243d-433f-af07-c20e622dc836', '2026-04-25 20:38:18', 6.87381, 79.8702, 1.14331, 88.4649, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1830, '9318809d-243d-433f-af07-c20e622dc836', '2026-04-25 20:38:24', 6.87381, 79.8702, 1.14387, 90.0425, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1831, '9318809d-243d-433f-af07-c20e622dc836', '2026-04-25 20:38:24', 6.87381, 79.8702, 1.14387, 90.0425, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1832, '9318809d-243d-433f-af07-c20e622dc836', '2026-04-25 20:38:26', 6.87381, 79.8702, 1.14331, 88.4649, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1833, '9318809d-243d-433f-af07-c20e622dc836', '2026-04-25 20:38:26', 6.87381, 79.8702, 1.14203, 88.6881, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1834, '9318809d-243d-433f-af07-c20e622dc836', '2026-04-25 20:38:28', 6.87381, 79.8702, 1.14203, 88.6881, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1835, '9318809d-243d-433f-af07-c20e622dc836', '2026-04-25 20:38:34', 6.87381, 79.8702, 1.03256, 90.0019, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1836, '9318809d-243d-433f-af07-c20e622dc836', '2026-04-25 20:38:36', 6.87381, 79.8702, 1.03256, 90.0019, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1837, '9318809d-243d-433f-af07-c20e622dc836', '2026-04-25 20:38:39', 6.87381, 79.8702, 1.03256, 90.0019, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1838, '9318809d-243d-433f-af07-c20e622dc836', '2026-04-25 20:38:42', 6.8738, 79.8702, 1.03623, 90.0042, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1839, '9318809d-243d-433f-af07-c20e622dc836', '2026-04-25 20:38:44', 6.87381, 79.8702, 1.03499, 88.2473, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1840, '9318809d-243d-433f-af07-c20e622dc836', '2026-04-25 20:38:48', 6.87381, 79.8702, 1.03499, 88.2473, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1841, '9318809d-243d-433f-af07-c20e622dc836', '2026-04-25 20:38:50', 6.87381, 79.8702, 1.03499, 88.2473, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1842, '9318809d-243d-433f-af07-c20e622dc836', '2026-04-25 20:38:54', 6.8738, 79.8702, 1.03731, 90.0519, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1843, '9318809d-243d-433f-af07-c20e622dc836', '2026-04-25 20:38:57', 6.8738, 79.8702, 1.03731, 90.0519, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1844, '9318809d-243d-433f-af07-c20e622dc836', '2026-04-25 20:38:58', 6.8738, 79.8702, 0.703979, 90.0025, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1845, '9318809d-243d-433f-af07-c20e622dc836', '2026-04-25 20:39:00', 6.8738, 79.8702, 0.705178, 88.96, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1846, '9318809d-243d-433f-af07-c20e622dc836', '2026-04-25 20:39:07', 6.8738, 79.8702, 0.703979, 90.0025, 24.7, 'LOW', 'GREEN', '[\"stop\"]', 0.347, 0.2576),
(1847, '9318809d-243d-433f-af07-c20e622dc836', '2026-04-25 20:39:08', 6.8738, 79.8702, 1.2267, 90.0197, 28.9, 'LOW', 'GREEN', '[\"stop\"]', 0.2509, 0.2006),
(1848, '9318809d-243d-433f-af07-c20e622dc836', '2026-04-25 20:39:10', 6.87381, 79.8702, 1.22494, 87.966, 29.4, 'LOW', 'GREEN', '[\"stop\"]', 0.1963, 0.1641),
(1849, '9318809d-243d-433f-af07-c20e622dc836', '2026-04-25 20:39:16', 6.87383, 79.8702, 1.89181, 2.90863, 24.8, 'LOW', 'GREEN', '[\"stop\", \"pedestrian_crossing\"]', 0.1067, 0.0964),
(1850, '9318809d-243d-433f-af07-c20e622dc836', '2026-04-25 20:39:18', 6.87386, 79.8702, 1.90477, 2.0118, 18, 'LOW', 'GREEN', '[\"stop\", \"pedestrian_crossing\", \"end_of_living_street\"]', 0.0554, 0.0524),
(1851, '9318809d-243d-433f-af07-c20e622dc836', '2026-04-25 20:39:22', 6.87386, 79.8702, 1.90477, 2.0118, 11.1, 'LOW', 'GREEN', '[\"stop\", \"pedestrian_crossing\", \"end_of_living_street\", \"emergency_telephone\"]', 0.003, 0.003),
(1852, '9318809d-243d-433f-af07-c20e622dc836', '2026-04-25 20:39:25', 6.87386, 79.8702, 1.90477, 2.0118, 7.3, 'LOW', 'GREEN', '[\"stop\", \"pedestrian_crossing\", \"end_of_living_street\", \"emergency_telephone\"]', 0.0016, 0.0016),
(1853, '9318809d-243d-433f-af07-c20e622dc836', '2026-04-25 20:39:26', 6.87383, 79.8702, 1.89225, 90.1612, 6.4, 'LOW', 'GREEN', '[\"stop\", \"pedestrian_crossing\", \"end_of_living_street\", \"emergency_telephone\", \"first_aid\"]', 0, 0),
(1854, '9318809d-243d-433f-af07-c20e622dc836', '2026-04-25 20:39:28', 6.87383, 79.8702, 1.89225, 90.1612, 4.2, 'LOW', 'GREEN', '[\"stop\", \"pedestrian_crossing\", \"end_of_living_street\", \"emergency_telephone\", \"first_aid\"]', 0, 0),
(1855, '9318809d-243d-433f-af07-c20e622dc836', '2026-04-25 20:39:33', 6.87381, 79.8702, 1.2165, 90.0316, 5.4, 'LOW', 'GREEN', '[\"stop\", \"pedestrian_crossing\", \"end_of_living_street\", \"emergency_telephone\", \"first_aid\", \"light_signals_for_pedestrians\"]', 0.0034, 0.0034),
(1856, '9318809d-243d-433f-af07-c20e622dc836', '2026-04-25 20:39:36', 6.87381, 79.8702, 1.21633, 90.012, 5.8, 'LOW', 'GREEN', '[\"stop\", \"pedestrian_crossing\", \"end_of_living_street\", \"emergency_telephone\", \"first_aid\", \"light_signals_for_pedestrians\", \"parking\"]', 0.0016, 0.0016),
(1857, '9318809d-243d-433f-af07-c20e622dc836', '2026-04-25 20:39:40', 6.8738, 79.8702, 1.24719, 90.0067, 3.8, 'LOW', 'GREEN', '[\"stop\", \"end_of_living_street\", \"first_aid\", \"light_signals_for_pedestrians\", \"parking\"]', 0.0006, 0.0006);
INSERT INTO `telemetry_points` (`id`, `trip_id`, `timestamp`, `latitude`, `longitude`, `speed_kph`, `heading`, `risk_score`, `risk_level`, `alert_level`, `detected_signs`, `belief_dangerous`, `conflict_measure`) VALUES
(1858, '9318809d-243d-433f-af07-c20e622dc836', '2026-04-25 20:39:42', 6.87381, 79.8702, 1.24814, 87.3965, 2.5, 'LOW', 'GREEN', '[\"stop\", \"light_signals_for_pedestrians\", \"parking\"]', 0.0003, 0.0003),
(1859, '9318809d-243d-433f-af07-c20e622dc836', '2026-04-25 20:39:45', 6.8738, 79.8702, 1.24719, 90.0067, 1.6, 'LOW', 'GREEN', '[\"stop\", \"light_signals_for_pedestrians\", \"parking\"]', 0.0001, 0.0001),
(1860, '9318809d-243d-433f-af07-c20e622dc836', '2026-04-25 20:39:49', 6.87381, 79.8702, 1.24814, 87.3965, 1.1, 'LOW', 'GREEN', '[\"stop\", \"light_signals_for_pedestrians\", \"parking\"]', 0, 0),
(1861, '9318809d-243d-433f-af07-c20e622dc836', '2026-04-25 20:39:51', 6.87398, 79.8701, 0.721142, 281.304, 0.7, 'LOW', 'GREEN', '[\"stop\", \"light_signals_for_pedestrians\", \"parking\"]', 0, 0),
(1862, '9318809d-243d-433f-af07-c20e622dc836', '2026-04-25 20:39:54', 6.87395, 79.8701, 1.10414, 85.8969, 0.4, 'LOW', 'GREEN', '[\"light_signals_for_pedestrians\", \"parking\"]', 0, 0),
(1863, '9318809d-243d-433f-af07-c20e622dc836', '2026-04-25 20:39:58', 6.87392, 79.8702, 0.8681, 90.0008, 0.3, 'LOW', 'GREEN', '[\"light_signals_for_pedestrians\", \"parking\"]', 0, 0),
(1864, '9318809d-243d-433f-af07-c20e622dc836', '2026-04-25 20:40:00', 6.87391, 79.8702, 0.868279, 90.4546, 0.2, 'LOW', 'GREEN', '[\"light_signals_for_pedestrians\"]', 0, 0),
(1865, '9318809d-243d-433f-af07-c20e622dc836', '2026-04-25 20:40:02', 6.87391, 79.8702, 0.868279, 90.4546, 0.1, 'LOW', 'GREEN', '[]', 0, 0),
(1866, '9318809d-243d-433f-af07-c20e622dc836', '2026-04-25 20:40:08', 6.87392, 79.8702, 0.8681, 90.0008, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1867, '9318809d-243d-433f-af07-c20e622dc836', '2026-04-25 20:40:12', 6.87387, 79.8702, 0.879622, 90.1372, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1868, '9318809d-243d-433f-af07-c20e622dc836', '2026-04-25 20:40:16', 6.87387, 79.8702, 0.879622, 90.1372, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1869, '9318809d-243d-433f-af07-c20e622dc836', '2026-04-25 20:40:18', 6.87387, 79.8702, 0.879622, 90.1372, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1870, '9318809d-243d-433f-af07-c20e622dc836', '2026-04-25 20:40:20', 6.87388, 79.8702, 0.834948, 89.7794, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1871, '9318809d-243d-433f-af07-c20e622dc836', '2026-04-25 20:40:24', 6.87387, 79.8702, 0.941552, 90.3961, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1872, '9318809d-243d-433f-af07-c20e622dc836', '2026-04-25 20:40:26', 6.87387, 79.8702, 0.941552, 90.3961, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1873, 'e908e929-74b7-40dd-9a33-1203091240d4', '2026-05-04 16:13:35', 6.87378, 79.8702, 0, 0, 30, 'LOW', 'GREEN', '[]', 0.255, 0),
(1874, 'e908e929-74b7-40dd-9a33-1203091240d4', '2026-05-04 16:13:37', 6.87379, 79.8702, 2.24627, 89.9915, 31.4, 'LOW', 'GREEN', '[]', 0.2542, 0),
(1875, 'e908e929-74b7-40dd-9a33-1203091240d4', '2026-05-04 16:13:41', 6.87384, 79.8702, 2.24885, 84.8656, 32.3, 'LOW', 'GREEN', '[]', 0.2034, 0),
(1876, 'e908e929-74b7-40dd-9a33-1203091240d4', '2026-05-04 16:13:48', 6.87379, 79.8702, 1.1042, 90.1949, 38.5, 'MEDIUM', 'YELLOW', '[]', 0, 0),
(1877, 'e908e929-74b7-40dd-9a33-1203091240d4', '2026-05-04 16:13:50', 6.87379, 79.8702, 1.1042, 90.1949, 42.5, 'MEDIUM', 'YELLOW', '[]', 0, 0),
(1878, 'e908e929-74b7-40dd-9a33-1203091240d4', '2026-05-04 16:13:53', 6.87379, 79.8702, 1.1042, 90.1949, 45.1, 'MEDIUM', 'YELLOW', '[]', 0, 0),
(1879, 'e908e929-74b7-40dd-9a33-1203091240d4', '2026-05-04 16:13:59', 6.8738, 79.8702, 2.26306, 196.802, 41.2, 'MEDIUM', 'YELLOW', '[]', 0.2856, 0),
(1880, 'e908e929-74b7-40dd-9a33-1203091240d4', '2026-05-04 16:14:00', 6.8738, 79.8702, 2.26306, 196.802, 38.7, 'MEDIUM', 'YELLOW', '[]', 0.2856, 0),
(1881, 'e908e929-74b7-40dd-9a33-1203091240d4', '2026-05-04 16:14:02', 6.8738, 79.8702, 2.26306, 196.802, 37.1, 'MEDIUM', 'YELLOW', '[]', 0.2856, 0),
(1882, 'e908e929-74b7-40dd-9a33-1203091240d4', '2026-05-04 16:14:02', 6.8738, 79.8702, 2.25951, 196.761, 36, 'MEDIUM', 'YELLOW', '[]', 0.2856, 0),
(1883, 'e908e929-74b7-40dd-9a33-1203091240d4', '2026-05-04 16:14:06', 6.8738, 79.8702, 2.26306, 196.802, 35.3, 'MEDIUM', 'YELLOW', '[]', 0.2856, 0),
(1884, 'e908e929-74b7-40dd-9a33-1203091240d4', '2026-05-04 16:14:08', 6.8738, 79.8702, 0.381733, 205.283, 33.7, 'LOW', 'GREEN', '[]', 0.261, 0),
(1885, 'e908e929-74b7-40dd-9a33-1203091240d4', '2026-05-04 16:14:08', 6.8738, 79.8702, 0.381733, 205.283, 32.6, 'LOW', 'GREEN', '[]', 0.261, 0),
(1886, 'e908e929-74b7-40dd-9a33-1203091240d4', '2026-05-04 16:14:10', 6.8738, 79.8702, 2.25951, 196.761, 33.1, 'LOW', 'GREEN', '[]', 0.2856, 0),
(1887, 'e908e929-74b7-40dd-9a33-1203091240d4', '2026-05-04 16:14:12', 6.87382, 79.8702, 7.67014, 291.273, 36.7, 'MEDIUM', 'YELLOW', '[]', 0.3212, 0),
(1888, 'e908e929-74b7-40dd-9a33-1203091240d4', '2026-05-04 16:14:16', 6.87382, 79.8702, 7.67014, 291.273, 39.1, 'MEDIUM', 'YELLOW', '[]', 0.2517, 0),
(1889, 'e908e929-74b7-40dd-9a33-1203091240d4', '2026-05-04 16:14:22', 6.87385, 79.8702, 2.66198, 89.5679, 42.9, 'MEDIUM', 'YELLOW', '[]', 0, 0),
(1890, 'e908e929-74b7-40dd-9a33-1203091240d4', '2026-05-04 16:14:22', 6.87385, 79.8702, 2.66198, 89.5679, 45.4, 'MEDIUM', 'YELLOW', '[]', 0, 0),
(1891, 'e908e929-74b7-40dd-9a33-1203091240d4', '2026-05-04 16:14:25', 6.87388, 79.8702, 2.66792, 84.3538, 47, 'MEDIUM', 'YELLOW', '[]', 0, 0),
(1892, 'e908e929-74b7-40dd-9a33-1203091240d4', '2026-05-04 16:14:25', 6.87388, 79.8702, 2.66792, 84.3538, 48, 'MEDIUM', 'YELLOW', '[]', 0, 0),
(1893, 'e908e929-74b7-40dd-9a33-1203091240d4', '2026-05-04 16:14:26', 6.87387, 79.8702, 1.49738, 90.0281, 48.7, 'MEDIUM', 'YELLOW', '[]', 0, 0),
(1894, 'e908e929-74b7-40dd-9a33-1203091240d4', '2026-05-04 16:14:27', 6.87387, 79.8702, 1.49738, 90.0281, 49.2, 'MEDIUM', 'YELLOW', '[]', 0, 0),
(1895, 'e908e929-74b7-40dd-9a33-1203091240d4', '2026-05-04 16:14:28', 6.87387, 79.8702, 1.49738, 90.0281, 49.5, 'MEDIUM', 'YELLOW', '[]', 0, 0),
(1896, 'a2506001-2111-4e76-9511-bab8a4174379', '2026-05-04 16:14:36', 6.87387, 79.8702, 1.49738, 90.0281, 50, 'MEDIUM', 'YELLOW', '[]', 0, 0),
(1897, '3be8da96-cad3-4a25-8ad4-0b0d31af9d3b', '2026-05-04 16:23:53', 6.87378, 79.8702, 0, 0, 30, 'LOW', 'GREEN', '[]', 0.255, 0),
(1898, '4252d3af-d54c-4b75-9804-38643cf824ba', '2026-05-04 16:23:53', 6.87378, 79.8702, 0, 0, 30, 'LOW', 'GREEN', '[]', 0.255, 0),
(1899, 'f2e6a079-dda1-4ea5-b59c-b5bb28fc962d', '2026-05-04 16:23:55', 6.87378, 79.8702, 0, 0, 30, 'LOW', 'GREEN', '[]', 0.255, 0),
(1900, 'ebfbade9-3a7a-4ffe-91a4-e003b2e173eb', '2026-05-04 16:23:57', 6.87378, 79.8702, 0, 0, 30, 'LOW', 'GREEN', '[]', 0.255, 0),
(1901, 'ebfbade9-3a7a-4ffe-91a4-e003b2e173eb', '2026-05-04 16:24:02', 6.87378, 79.8702, 0.0543681, 0, 30, 'LOW', 'GREEN', '[]', 0.2558, 0),
(1902, 'ebfbade9-3a7a-4ffe-91a4-e003b2e173eb', '2026-05-04 16:24:02', 6.87378, 79.8702, 0.0543681, 0, 30.1, 'LOW', 'GREEN', '[]', 0.2558, 0),
(1903, 'ebfbade9-3a7a-4ffe-91a4-e003b2e173eb', '2026-05-04 16:24:04', 6.87378, 79.8702, 0.0543681, 0, 30.1, 'LOW', 'GREEN', '[]', 0.2558, 0),
(1904, 'ebfbade9-3a7a-4ffe-91a4-e003b2e173eb', '2026-05-04 16:24:05', 6.87378, 79.8702, 0.0543681, 0, 30.1, 'LOW', 'GREEN', '[]', 0.2558, 0),
(1905, 'ebfbade9-3a7a-4ffe-91a4-e003b2e173eb', '2026-05-04 16:24:06', 6.87378, 79.8702, 0.0543681, 0, 30.1, 'LOW', 'GREEN', '[]', 0.2558, 0),
(1906, 'ebfbade9-3a7a-4ffe-91a4-e003b2e173eb', '2026-05-04 16:24:08', 6.87378, 79.8702, 0.0543681, 0, 30.1, 'LOW', 'GREEN', '[]', 0.2558, 0),
(1907, 'ebfbade9-3a7a-4ffe-91a4-e003b2e173eb', '2026-05-04 16:24:14', 6.87377, 79.8702, 0.344246, 0, 30.3, 'LOW', 'GREEN', '[]', 0.2632, 0),
(1908, 'ebfbade9-3a7a-4ffe-91a4-e003b2e173eb', '2026-05-04 16:24:14', 6.87377, 79.8702, 0.344246, 0, 30.4, 'LOW', 'GREEN', '[]', 0.2632, 0),
(1909, 'ebfbade9-3a7a-4ffe-91a4-e003b2e173eb', '2026-05-04 16:24:17', 6.87377, 79.8702, 0.344246, 0, 30.5, 'LOW', 'GREEN', '[]', 0.2632, 0),
(1910, 'ebfbade9-3a7a-4ffe-91a4-e003b2e173eb', '2026-05-04 16:24:19', 6.87377, 79.8702, 0.344246, 0, 30.5, 'LOW', 'GREEN', '[]', 0.2632, 0),
(1911, 'ebfbade9-3a7a-4ffe-91a4-e003b2e173eb', '2026-05-04 16:24:20', 6.87378, 79.8702, 0.284449, 0, 30.5, 'LOW', 'GREEN', '[]', 0.2592, 0),
(1912, 'ebfbade9-3a7a-4ffe-91a4-e003b2e173eb', '2026-05-04 16:24:21', 6.87378, 79.8702, 0.284449, 0, 30.5, 'LOW', 'GREEN', '[]', 0.2592, 0),
(1913, 'ebfbade9-3a7a-4ffe-91a4-e003b2e173eb', '2026-05-04 16:24:22', 6.87378, 79.8702, 0.284449, 0, 30.5, 'LOW', 'GREEN', '[]', 0.2592, 0),
(1914, 'ebfbade9-3a7a-4ffe-91a4-e003b2e173eb', '2026-05-04 16:24:24', 6.87378, 79.8702, 0.284449, 0, 30.5, 'LOW', 'GREEN', '[]', 0.2592, 0),
(1915, 'ebfbade9-3a7a-4ffe-91a4-e003b2e173eb', '2026-05-04 16:24:26', 6.87378, 79.8702, 0.284449, 0, 30.5, 'LOW', 'GREEN', '[]', 0.2592, 0),
(1916, 'ebfbade9-3a7a-4ffe-91a4-e003b2e173eb', '2026-05-04 16:24:34', 6.87378, 79.8702, 0.17659, 0, 30.4, 'LOW', 'GREEN', '[]', 0.2576, 0),
(1917, 'ebfbade9-3a7a-4ffe-91a4-e003b2e173eb', '2026-05-04 16:24:37', 6.87378, 79.8702, 0.17659, 0, 30.4, 'LOW', 'GREEN', '[]', 0.2576, 0),
(1918, 'ebfbade9-3a7a-4ffe-91a4-e003b2e173eb', '2026-05-04 16:24:41', 6.87378, 79.8702, 0.0290609, 0, 30.3, 'LOW', 'GREEN', '[]', 0.2558, 0),
(1919, 'ebfbade9-3a7a-4ffe-91a4-e003b2e173eb', '2026-05-04 16:24:43', 6.87378, 79.8702, 0.0290609, 0, 30.2, 'LOW', 'GREEN', '[]', 0.2558, 0),
(1920, 'ebfbade9-3a7a-4ffe-91a4-e003b2e173eb', '2026-05-04 16:24:48', 6.87378, 79.8702, 0.117067, 0, 30.2, 'LOW', 'GREEN', '[]', 0.2567, 0),
(1921, 'ebfbade9-3a7a-4ffe-91a4-e003b2e173eb', '2026-05-04 16:24:50', 6.87378, 79.8702, 0.117067, 0, 30.2, 'LOW', 'GREEN', '[]', 0.2567, 0),
(1922, 'ebfbade9-3a7a-4ffe-91a4-e003b2e173eb', '2026-05-04 16:24:55', 6.87378, 79.8702, 0.117067, 0, 30.2, 'LOW', 'GREEN', '[]', 0.2567, 0),
(1923, 'ebfbade9-3a7a-4ffe-91a4-e003b2e173eb', '2026-05-04 16:24:59', 6.87378, 79.8702, 0.00199096, 0, 30.1, 'LOW', 'GREEN', '[]', 0.255, 0),
(1924, 'ebfbade9-3a7a-4ffe-91a4-e003b2e173eb', '2026-05-04 16:25:01', 6.87378, 79.8702, 0.00199096, 0, 30.1, 'LOW', 'GREEN', '[]', 0.255, 0),
(1925, 'ebfbade9-3a7a-4ffe-91a4-e003b2e173eb', '2026-05-04 16:25:05', 6.87378, 79.8702, 0.0467021, 0, 30.1, 'LOW', 'GREEN', '[]', 0.2558, 0),
(1926, 'ebfbade9-3a7a-4ffe-91a4-e003b2e173eb', '2026-05-04 16:25:07', 6.87378, 79.8702, 0.0467021, 0, 30.1, 'LOW', 'GREEN', '[]', 0.2558, 0),
(1927, 'ebfbade9-3a7a-4ffe-91a4-e003b2e173eb', '2026-05-04 16:25:09', 6.87378, 79.8702, 0.0467021, 0, 30.1, 'LOW', 'GREEN', '[]', 0.2558, 0),
(1928, 'ebfbade9-3a7a-4ffe-91a4-e003b2e173eb', '2026-05-04 16:25:11', 6.87378, 79.8702, 0.0467021, 0, 30.1, 'LOW', 'GREEN', '[]', 0.2558, 0),
(1929, 'ebfbade9-3a7a-4ffe-91a4-e003b2e173eb', '2026-05-04 16:25:13', 6.87378, 79.8702, 0.0205285, 0, 30.1, 'LOW', 'GREEN', '[]', 0.255, 0),
(1930, 'ebfbade9-3a7a-4ffe-91a4-e003b2e173eb', '2026-05-04 16:25:15', 6.87378, 79.8702, 0.0205285, 0, 30, 'LOW', 'GREEN', '[]', 0.255, 0),
(1931, 'ebfbade9-3a7a-4ffe-91a4-e003b2e173eb', '2026-05-04 16:25:19', 6.87378, 79.8702, 0.0205285, 0, 30, 'LOW', 'GREEN', '[]', 0.255, 0),
(1932, 'ebfbade9-3a7a-4ffe-91a4-e003b2e173eb', '2026-05-04 16:25:21', 6.87378, 79.8702, 0.00682384, 0, 30, 'LOW', 'GREEN', '[]', 0.255, 0),
(1933, 'ebfbade9-3a7a-4ffe-91a4-e003b2e173eb', '2026-05-04 16:25:24', 6.87378, 79.8702, 0.00682384, 0, 30, 'LOW', 'GREEN', '[]', 0.255, 0),
(1934, 'ebfbade9-3a7a-4ffe-91a4-e003b2e173eb', '2026-05-04 16:25:31', 6.87378, 79.8702, 0.00682384, 0, 30, 'LOW', 'GREEN', '[]', 0.255, 0),
(1935, 'ebfbade9-3a7a-4ffe-91a4-e003b2e173eb', '2026-05-04 16:25:33', 6.87378, 79.8702, 0.0240693, 0, 30, 'LOW', 'GREEN', '[]', 0.255, 0),
(1936, 'ebfbade9-3a7a-4ffe-91a4-e003b2e173eb', '2026-05-04 16:25:36', 6.87378, 79.8702, 0.0139908, 0, 30, 'LOW', 'GREEN', '[]', 0.255, 0),
(1937, 'ebfbade9-3a7a-4ffe-91a4-e003b2e173eb', '2026-05-04 16:25:40', 6.87378, 79.8702, 0.0139908, 0, 30, 'LOW', 'GREEN', '[]', 0.255, 0),
(1938, 'ebfbade9-3a7a-4ffe-91a4-e003b2e173eb', '2026-05-04 16:25:45', 6.87378, 79.8702, 0.0172295, 0, 30, 'LOW', 'GREEN', '[]', 0.255, 0),
(1939, 'ebfbade9-3a7a-4ffe-91a4-e003b2e173eb', '2026-05-04 16:25:47', 6.87378, 79.8702, 0.0172295, 0, 30, 'LOW', 'GREEN', '[]', 0.255, 0),
(1940, 'ebfbade9-3a7a-4ffe-91a4-e003b2e173eb', '2026-05-04 16:25:54', 6.87378, 79.8702, 0.0172295, 0, 30, 'LOW', 'GREEN', '[]', 0.255, 0),
(1941, 'ebfbade9-3a7a-4ffe-91a4-e003b2e173eb', '2026-05-04 16:25:55', 6.87378, 79.8702, 0.0115493, 0, 30, 'LOW', 'GREEN', '[]', 0.255, 0),
(1942, 'ebfbade9-3a7a-4ffe-91a4-e003b2e173eb', '2026-05-04 16:25:59', 6.87378, 79.8702, 0.0115493, 0, 30, 'LOW', 'GREEN', '[]', 0.255, 0),
(1943, 'ebfbade9-3a7a-4ffe-91a4-e003b2e173eb', '2026-05-04 16:26:02', 6.87378, 79.8702, 1.48078, 282.722, 30.9, 'LOW', 'GREEN', '[]', 0.2445, 0),
(1944, 'ebfbade9-3a7a-4ffe-91a4-e003b2e173eb', '2026-05-04 16:26:07', 6.87378, 79.8702, 1.48078, 282.722, 31.5, 'LOW', 'GREEN', '[]', 0.1695, 0),
(1945, 'ebfbade9-3a7a-4ffe-91a4-e003b2e173eb', '2026-05-04 16:26:09', 6.87378, 79.8702, 1.48078, 282.722, 31.9, 'LOW', 'GREEN', '[]', 0.1467, 0),
(1946, 'ebfbade9-3a7a-4ffe-91a4-e003b2e173eb', '2026-05-04 16:26:11', 6.87377, 79.8702, 1.23914, 250.063, 32, 'LOW', 'GREEN', '[]', 0.1159, 0),
(1947, 'ebfbade9-3a7a-4ffe-91a4-e003b2e173eb', '2026-05-04 16:26:14', 6.87377, 79.8702, 1.23914, 250.063, 38.3, 'MEDIUM', 'YELLOW', '[]', 0, 0),
(1948, 'ebfbade9-3a7a-4ffe-91a4-e003b2e173eb', '2026-05-04 16:26:19', 6.87377, 79.8702, 1.23914, 250.063, 42.4, 'MEDIUM', 'YELLOW', '[]', 0, 0),
(1949, 'ebfbade9-3a7a-4ffe-91a4-e003b2e173eb', '2026-05-04 16:26:22', 6.87377, 79.8702, 0.421022, 89.6168, 45.1, 'MEDIUM', 'YELLOW', '[]', 0, 0),
(1950, 'ebfbade9-3a7a-4ffe-91a4-e003b2e173eb', '2026-05-04 16:26:25', 6.87377, 79.8702, 0.421022, 89.6168, 46.8, 'MEDIUM', 'YELLOW', '[]', 0, 0),
(1951, 'ebfbade9-3a7a-4ffe-91a4-e003b2e173eb', '2026-05-04 16:26:26', 6.87377, 79.8702, 0.421022, 89.6168, 47.9, 'MEDIUM', 'YELLOW', '[]', 0, 0),
(1952, 'b5f51b29-7be1-47c5-a37b-b9976c1a1d89', '2026-05-04 16:26:34', 6.87377, 79.8702, 0.421022, 89.6168, 50, 'MEDIUM', 'YELLOW', '[]', 0, 0),
(1953, 'c524ac09-a984-4ecb-8b3d-257969f2c46c', '2026-05-04 16:26:35', 6.87378, 79.8702, 0.284299, 0, 30.5, 'LOW', 'GREEN', '[]', 0.2592, 0),
(1954, '1fec6bf3-b640-4279-95cf-495ddcd3dc28', '2026-05-04 16:26:42', 6.87378, 79.8702, 0.284299, 0, 30.5, 'LOW', 'GREEN', '[]', 0.2592, 0),
(1955, 'ddf8d947-0fc7-4e34-8efc-51cb62d99293', '2026-05-06 14:25:19', 6.87393, 79.8702, 1.00679, 170.078, 28, 'LOW', 'GREEN', '[]', 0.224, 0),
(1956, 'f6032e74-5e60-4630-a1a8-1f5598e5f85c', '2026-05-06 14:25:19', 6.87379, 79.8702, 3.66916, 151.024, 29.4, 'LOW', 'GREEN', '[]', 0.2728, 0),
(1957, 'f6032e74-5e60-4630-a1a8-1f5598e5f85c', '2026-05-06 14:25:22', 6.87386, 79.8702, 0.828688, 113.165, 28.8, 'LOW', 'GREEN', '[]', 0.2077, 0),
(1958, 'f6032e74-5e60-4630-a1a8-1f5598e5f85c', '2026-05-06 14:25:25', 6.87399, 79.8702, 0.0754207, 0, 28, 'LOW', 'GREEN', '[]', 0.2067, 0),
(1959, 'f6032e74-5e60-4630-a1a8-1f5598e5f85c', '2026-05-06 14:25:31', 6.87399, 79.8702, 0.0758962, 0, 26.5, 'LOW', 'GREEN', '[]', 0.2067, 0),
(1960, '4f57073b-1e8a-4d7b-bcab-7077e652b632', '2026-05-06 14:25:31', 6.87394, 79.8702, 1.00722, 170.065, 27, 'LOW', 'GREEN', '[]', 0.224, 0),
(1961, '4f57073b-1e8a-4d7b-bcab-7077e652b632', '2026-05-06 14:25:35', 6.87396, 79.8701, 0.18207, 0, 26.9, 'LOW', 'GREEN', '[]', 0.2109, 0),
(1962, '4f57073b-1e8a-4d7b-bcab-7077e652b632', '2026-05-06 14:25:37', 6.87396, 79.8701, 0.182673, 0, 26.8, 'LOW', 'GREEN', '[]', 0.2109, 0),
(1963, '4f57073b-1e8a-4d7b-bcab-7077e652b632', '2026-05-06 14:25:42', 6.87396, 79.8701, 0.182673, 0, 26.8, 'LOW', 'GREEN', '[]', 0.2109, 0),
(1964, '25eca2fe-b81c-4333-824a-cb030b2fb074', '2026-05-06 14:25:45', 6.87388, 79.8701, 0.431213, 359.966, 27.1, 'LOW', 'GREEN', '[]', 0.2195, 0),
(1965, '4f57073b-1e8a-4d7b-bcab-7077e652b632', '2026-05-06 14:25:45', 6.87392, 79.8702, 0.647541, 58.1067, 27.2, 'LOW', 'GREEN', '[]', 0.1945, 0),
(1966, '7e3f0e7e-6c2c-4124-8619-226a79e52e12', '2026-05-06 14:25:48', 6.87393, 79.8702, 1.00679, 170.078, 28, 'LOW', 'GREEN', '[]', 0.224, 0),
(1967, '4f57073b-1e8a-4d7b-bcab-7077e652b632', '2026-05-06 14:25:49', 6.87392, 79.8702, 0.647203, 58.1184, 27.8, 'LOW', 'GREEN', '[]', 0.1918, 0),
(1968, '4f57073b-1e8a-4d7b-bcab-7077e652b632', '2026-05-06 14:25:50', 6.87392, 79.8702, 0.647203, 58.1184, 27.7, 'LOW', 'GREEN', '[]', 0.1781, 0),
(1969, 'f6032e74-5e60-4630-a1a8-1f5598e5f85c', '2026-05-06 14:25:51', 6.87399, 79.8702, 0.0754207, 0, 27.2, 'LOW', 'GREEN', '[]', 0.2067, 0),
(1970, '4f57073b-1e8a-4d7b-bcab-7077e652b632', '2026-05-06 14:25:52', 6.87392, 79.8702, 0.647203, 58.1184, 27.3, 'LOW', 'GREEN', '[]', 0.1863, 0),
(1971, '4f57073b-1e8a-4d7b-bcab-7077e652b632', '2026-05-06 14:25:55', 6.87393, 79.8702, 0.970667, 231.017, 27.5, 'LOW', 'GREEN', '[]', 0.159, 0),
(1972, '4f57073b-1e8a-4d7b-bcab-7077e652b632', '2026-05-06 14:25:57', 6.87393, 79.8702, 0.970667, 231.017, 27.9, 'LOW', 'GREEN', '[]', 0.1311, 0),
(1973, '177eebe1-bd2c-45e7-8b2f-e8756c907c56', '2026-05-06 14:25:57', 6.87387, 79.8702, 0.829149, 113.164, 27.8, 'LOW', 'GREEN', '[]', 0.1302, 0),
(1974, '4f57073b-1e8a-4d7b-bcab-7077e652b632', '2026-05-06 14:25:59', 6.87395, 79.8701, 0.647086, 354.762, 27.7, 'LOW', 'GREEN', '[]', 0.2165, 0),
(1975, '08a05b41-c742-424f-8fcd-899fd2e76d57', '2026-05-06 14:26:00', 6.87386, 79.8702, 0.828688, 113.165, 27.7, 'LOW', 'GREEN', '[]', 0.1911, 0),
(1976, 'f6032e74-5e60-4630-a1a8-1f5598e5f85c', '2026-05-06 14:26:02', 6.87399, 79.8702, 0.0758962, 0, 27.3, 'LOW', 'GREEN', '[]', 0.2067, 0),
(1977, '4f57073b-1e8a-4d7b-bcab-7077e652b632', '2026-05-06 14:26:02', 6.87392, 79.8702, 0.969254, 231.027, 27.5, 'LOW', 'GREEN', '[]', 0.1897, 0),
(1978, '08a05b41-c742-424f-8fcd-899fd2e76d57', '2026-05-06 14:26:04', 6.87392, 79.8702, 0.969254, 231.027, 27.9, 'LOW', 'GREEN', '[]', 0.1702, 0),
(1979, 'de962eba-1bce-49a6-b0dd-ba465a20422d', '2026-05-06 14:26:04', 6.87386, 79.8702, 0.828688, 113.165, 27.8, 'LOW', 'GREEN', '[]', 0.1662, 0),
(1980, '08a05b41-c742-424f-8fcd-899fd2e76d57', '2026-05-06 14:26:07', 6.8739, 79.8703, 1.11783, 53.1861, 27.9, 'LOW', 'GREEN', '[]', 0.1321, 0),
(1981, '08a05b41-c742-424f-8fcd-899fd2e76d57', '2026-05-06 14:26:10', 6.8739, 79.8703, 1.11783, 53.1861, 28, 'LOW', 'GREEN', '[]', 0.0984, 0),
(1982, '08a05b41-c742-424f-8fcd-899fd2e76d57', '2026-05-06 14:26:17', 6.87392, 79.8702, 1.04673, 344.459, 28, 'LOW', 'GREEN', '[]', 0.224, 0),
(1983, '4f57073b-1e8a-4d7b-bcab-7077e652b632', '2026-05-06 14:26:22', 6.87393, 79.8702, 0.970667, 231.017, 28, 'LOW', 'GREEN', '[]', 0.1953, 0),
(1984, 'a5d8e2fe-e686-4732-b5bc-2c745b9e8519', '2026-05-07 14:37:14', 6.871, 79.8686, 0, 0, 50, 'MEDIUM', 'YELLOW', '[]', 0, 0),
(1985, '904b0cff-7ac7-42e9-9f60-1bc75f092f1e', '2026-05-07 14:37:14', 6.871, 79.8686, 0, 0, 50, 'MEDIUM', 'YELLOW', '[]', 0, 0),
(1986, '20ef843a-412f-4773-a73a-7d698e11547d', '2026-05-07 14:37:15', 6.871, 79.8686, 0, 0, 50, 'MEDIUM', 'YELLOW', '[]', 0, 0),
(1987, '0ba9d060-6d61-4904-896f-2d836cb9608a', '2026-05-07 14:37:16', 6.87389, 79.8701, 1.404, 340, 50, 'MEDIUM', 'YELLOW', '[]', 0, 0),
(1988, '20ef843a-412f-4773-a73a-7d698e11547d', '2026-05-07 14:37:17', 6.87389, 79.8701, 1.404, 340, 50, 'MEDIUM', 'YELLOW', '[]', 0, 0),
(1989, '7367b0e0-98e7-41da-b6f8-615bdfb7594f', '2026-05-07 14:37:17', 6.871, 79.8686, 0, 0, 50, 'MEDIUM', 'YELLOW', '[]', 0, 0),
(1990, '41c5da41-960b-4400-8cf4-29599a9d6d79', '2026-05-07 14:37:19', 6.87389, 79.8701, 1.404, 340, 50, 'MEDIUM', 'YELLOW', '[]', 0, 0),
(1991, '20ef843a-412f-4773-a73a-7d698e11547d', '2026-05-07 14:37:19', 6.87389, 79.8701, 1.404, 340, 50, 'MEDIUM', 'YELLOW', '[]', 0, 0),
(1992, 'e1bf0f89-ec03-4743-ab81-33649e57991d', '2026-05-10 23:04:52', 6.87378, 79.8702, 0, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1993, 'e2c29389-1981-4bf2-93db-4600e6e9d3f8', '2026-05-10 23:04:52', 6.87387, 79.8701, 0.998641, 308.053, 0.8, 'LOW', 'GREEN', '[]', 0.0024, 0),
(1994, '8aa1d7c4-000d-4ade-9038-6b1fdbaf2ca5', '2026-05-10 23:04:56', 6.87387, 79.8701, 0.998641, 308.053, 0.8, 'LOW', 'GREEN', '[]', 0.0024, 0),
(1995, 'f87c03ec-6921-41f8-bcea-286638aeaba1', '2026-05-10 23:07:10', 6.87378, 79.8702, 0, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(1996, 'f87c03ec-6921-41f8-bcea-286638aeaba1', '2026-05-10 23:07:42', 6.87378, 79.8702, 0.48516, 156.637, 0.4, 'LOW', 'GREEN', '[]', 0.0012, 0),
(1997, 'f87c03ec-6921-41f8-bcea-286638aeaba1', '2026-05-10 23:08:14', 6.87378, 79.8702, 0.350457, 0, 0.3, 'LOW', 'GREEN', '[]', 0.0008, 0),
(1998, 'f87c03ec-6921-41f8-bcea-286638aeaba1', '2026-05-10 23:13:27', 6.87378, 79.8702, 0.0606748, 0, 0, 'LOW', 'GREEN', '[]', 0.0001, 0),
(1999, 'f87c03ec-6921-41f8-bcea-286638aeaba1', '2026-05-10 23:13:27', 6.87378, 79.8702, 0.768131, 92.3394, 0.2, 'LOW', 'GREEN', '[]', 0.0018, 0),
(2000, '8ad10453-d106-40d0-a634-6bb8445e94cb', '2026-05-10 23:13:33', 6.87378, 79.8703, 1.40402, 157.899, 1.1, 'LOW', 'GREEN', '[]', 0.0034, 0),
(2001, '4e14b9dc-86d4-4686-9846-4203752bfec1', '2026-05-10 23:13:33', 6.87378, 79.8703, 1.40415, 157.873, 1.1, 'LOW', 'GREEN', '[]', 0.0034, 0),
(2002, 'cc925e3e-304f-42f8-9e67-31249779af55', '2026-05-10 23:13:35', 6.87378, 79.8703, 1.40415, 157.873, 1.1, 'LOW', 'GREEN', '[]', 0.0034, 0),
(2003, 'cc925e3e-304f-42f8-9e67-31249779af55', '2026-05-10 23:13:36', 6.87378, 79.8702, 13.9616, 270.59, 4.6, 'LOW', 'GREEN', '[]', 0.0335, 0),
(2004, 'cc925e3e-304f-42f8-9e67-31249779af55', '2026-05-10 23:13:38', 6.87378, 79.8702, 13.9616, 270.59, 6.9, 'LOW', 'GREEN', '[]', 0.0335, 0),
(2005, '2324f528-9a9b-44a3-b313-4d6bc1ca2828', '2026-05-10 23:13:41', 6.87378, 79.8702, 0, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(2006, 'cc925e3e-304f-42f8-9e67-31249779af55', '2026-05-10 23:13:42', 6.87378, 79.8702, 1.47276, 269.974, 0.4, 'LOW', 'GREEN', '[]', 0.0035, 0),
(2007, 'cc925e3e-304f-42f8-9e67-31249779af55', '2026-05-10 23:13:42', 6.87378, 79.8702, 1.47276, 269.974, 0.7, 'LOW', 'GREEN', '[]', 0.0035, 0),
(2008, '124079c1-77d9-4a3a-915c-b9b03a7d37da', '2026-05-10 23:13:43', 6.87378, 79.8703, 1.40402, 157.899, 1.1, 'LOW', 'GREEN', '[]', 0.0034, 0),
(2009, '78727dce-8a9b-493f-84d1-438d5f8066a4', '2026-05-10 23:13:44', 6.87378, 79.8703, 1.40402, 157.899, 1.1, 'LOW', 'GREEN', '[]', 0.0034, 0),
(2010, '78727dce-8a9b-493f-84d1-438d5f8066a4', '2026-05-10 23:13:46', 6.87378, 79.8702, 1.47276, 269.974, 1.1, 'LOW', 'GREEN', '[]', 0.0035, 0),
(2011, 'cc925e3e-304f-42f8-9e67-31249779af55', '2026-05-10 23:13:46', 6.87378, 79.8702, 1.47276, 269.974, 1.2, 'LOW', 'GREEN', '[]', 0.0035, 0),
(2012, '0fda6552-93e3-4d2e-a144-754516cb5cb1', '2026-05-10 23:13:47', 6.87378, 79.8703, 1.40415, 157.873, 1.1, 'LOW', 'GREEN', '[]', 0.0034, 0),
(2013, '0fda6552-93e3-4d2e-a144-754516cb5cb1', '2026-05-10 23:13:50', 6.87379, 79.8702, 0.487592, 21.7962, 0.9, 'LOW', 'GREEN', '[]', 0.0012, 0),
(2014, '0fda6552-93e3-4d2e-a144-754516cb5cb1', '2026-05-10 23:13:52', 6.87378, 79.8702, 0.505886, 292.776, 0.7, 'LOW', 'GREEN', '[]', 0.0012, 0),
(2015, 'd8014c8e-5bd9-4a9c-8bc0-1d76c55226d1', '2026-05-10 23:13:53', 6.87378, 79.8703, 0.695977, 138.267, 0.6, 'LOW', 'GREEN', '[]', 0.0017, 0),
(2016, '560945ac-9c95-4e79-a6b6-db8c6f006299', '2026-05-10 23:13:53', 6.87378, 79.8703, 0.695977, 138.267, 0.6, 'LOW', 'GREEN', '[]', 0.0017, 0),
(2017, '0fda6552-93e3-4d2e-a144-754516cb5cb1', '2026-05-10 23:13:54', 6.87378, 79.8702, 0.505886, 292.776, 0.5, 'LOW', 'GREEN', '[]', 0.0012, 0),
(2018, '0fda6552-93e3-4d2e-a144-754516cb5cb1', '2026-05-10 23:13:58', 6.87398, 79.8701, 1.30263, 352.751, 0.7, 'LOW', 'GREEN', '[]', 0.0031, 0),
(2019, '0fda6552-93e3-4d2e-a144-754516cb5cb1', '2026-05-10 23:13:58', 6.87398, 79.8701, 1.30263, 352.751, 0.8, 'LOW', 'GREEN', '[]', 0.0031, 0),
(2020, '0fda6552-93e3-4d2e-a144-754516cb5cb1', '2026-05-10 23:14:00', 6.87399, 79.8701, 1.30285, 352.743, 0.9, 'LOW', 'GREEN', '[]', 0.0031, 0),
(2021, '0fda6552-93e3-4d2e-a144-754516cb5cb1', '2026-05-10 23:14:02', 6.87399, 79.8701, 1.30285, 352.743, 0.9, 'LOW', 'GREEN', '[]', 0.0031, 0),
(2022, '7e1de4dd-f78b-466a-9c4a-238d6568bb9d', '2026-05-10 23:14:06', 6.87378, 79.8702, 0, 0, 0, 'LOW', 'GREEN', '[]', 0, 0),
(2023, '0fda6552-93e3-4d2e-a144-754516cb5cb1', '2026-05-10 23:14:06', 6.87398, 79.8702, 1.20713, 89.9756, 0.3, 'LOW', 'GREEN', '[]', 0.0029, 0),
(2024, '0fda6552-93e3-4d2e-a144-754516cb5cb1', '2026-05-10 23:14:07', 6.87398, 79.8702, 1.20713, 89.9756, 0.6, 'LOW', 'GREEN', '[]', 0.0029, 0),
(2025, '0fda6552-93e3-4d2e-a144-754516cb5cb1', '2026-05-10 23:14:08', 6.87396, 79.8702, 1.20868, 90.5805, 0.7, 'LOW', 'GREEN', '[]', 0.0029, 0),
(2026, '0fda6552-93e3-4d2e-a144-754516cb5cb1', '2026-05-10 23:14:10', 6.87396, 79.8702, 1.20868, 90.5805, 0.8, 'LOW', 'GREEN', '[]', 0.0029, 0),
(2027, '0fda6552-93e3-4d2e-a144-754516cb5cb1', '2026-05-10 23:14:14', 6.87398, 79.8702, 1.20962, 89.9497, 0.9, 'LOW', 'GREEN', '[]', 0.0029, 0),
(2028, '0fda6552-93e3-4d2e-a144-754516cb5cb1', '2026-05-10 23:14:15', 6.87398, 79.8702, 1.20962, 89.9497, 0.9, 'LOW', 'GREEN', '[]', 0.0029, 0),
(2029, '0fda6552-93e3-4d2e-a144-754516cb5cb1', '2026-05-10 23:14:16', 6.87398, 79.8702, 1.20962, 89.9497, 0.9, 'LOW', 'GREEN', '[]', 0.0029, 0),
(2030, '0fda6552-93e3-4d2e-a144-754516cb5cb1', '2026-05-10 23:14:18', 6.87398, 79.8702, 1.20962, 89.9497, 0.9, 'LOW', 'GREEN', '[]', 0.0029, 0),
(2031, '0fda6552-93e3-4d2e-a144-754516cb5cb1', '2026-05-10 23:14:18', 6.87379, 79.8702, 0.487592, 21.7962, 0.7, 'LOW', 'GREEN', '[]', 0.0012, 0),
(2032, '0fda6552-93e3-4d2e-a144-754516cb5cb1', '2026-05-10 23:14:22', 6.87391, 79.8702, 1.2998, 90.0494, 0.8, 'LOW', 'GREEN', '[]', 0.0031, 0),
(2033, '0fda6552-93e3-4d2e-a144-754516cb5cb1', '2026-05-10 23:14:22', 6.87391, 79.8702, 1.2998, 90.0494, 0.9, 'LOW', 'GREEN', '[]', 0.0031, 0),
(2034, '0fda6552-93e3-4d2e-a144-754516cb5cb1', '2026-05-10 23:14:24', 6.87391, 79.8702, 1.2998, 90.0494, 1, 'LOW', 'GREEN', '[]', 0.0031, 0),
(2035, '0fda6552-93e3-4d2e-a144-754516cb5cb1', '2026-05-10 23:14:25', 6.87391, 79.8702, 1.2998, 90.0494, 1, 'LOW', 'GREEN', '[]', 0.0031, 0),
(2036, '0fda6552-93e3-4d2e-a144-754516cb5cb1', '2026-05-10 23:14:54', 6.87385, 79.8702, 1.20751, 90.0443, 1, 'LOW', 'GREEN', '[]', 0.0029, 0),
(2037, '0fda6552-93e3-4d2e-a144-754516cb5cb1', '2026-05-10 23:14:57', 6.8738, 79.8702, 0.728766, 90.0003, 0.8, 'LOW', 'GREEN', '[]', 0.0017, 0),
(2038, '0fda6552-93e3-4d2e-a144-754516cb5cb1', '2026-05-10 23:14:58', 6.87381, 79.8702, 0.853108, 90.0222, 0.8, 'LOW', 'GREEN', '[]', 0.002, 0),
(2039, '0fda6552-93e3-4d2e-a144-754516cb5cb1', '2026-05-10 23:14:59', 6.87385, 79.8702, 1.20751, 90.0443, 0.8, 'LOW', 'GREEN', '[]', 0.0029, 0),
(2040, '0fda6552-93e3-4d2e-a144-754516cb5cb1', '2026-05-10 23:14:59', 6.87385, 79.8702, 1.20751, 90.0443, 0.9, 'LOW', 'GREEN', '[]', 0.0029, 0),
(2041, '0fda6552-93e3-4d2e-a144-754516cb5cb1', '2026-05-10 23:14:59', 6.8738, 79.8702, 0.728766, 90.0003, 0.8, 'LOW', 'GREEN', '[]', 0.0017, 0),
(2042, '0fda6552-93e3-4d2e-a144-754516cb5cb1', '2026-05-10 23:15:00', 6.87381, 79.8702, 0.853108, 90.0222, 0.7, 'LOW', 'GREEN', '[]', 0.002, 0),
(2043, '0fda6552-93e3-4d2e-a144-754516cb5cb1', '2026-05-10 23:15:01', 6.87381, 79.8702, 0.732341, 88.3207, 0.7, 'LOW', 'GREEN', '[]', 0.0018, 0),
(2044, '0fda6552-93e3-4d2e-a144-754516cb5cb1', '2026-05-10 23:15:04', 6.87381, 79.8702, 0.853108, 90.0222, 0.7, 'LOW', 'GREEN', '[]', 0.002, 0),
(2045, '0fda6552-93e3-4d2e-a144-754516cb5cb1', '2026-05-10 23:15:04', 6.8738, 79.8702, 0.726827, 90.0019, 0.7, 'LOW', 'GREEN', '[]', 0.0017, 0),
(2046, '0fda6552-93e3-4d2e-a144-754516cb5cb1', '2026-05-10 23:15:05', 6.8738, 79.8702, 0.726827, 90.0019, 0.6, 'LOW', 'GREEN', '[]', 0.0017, 0),
(2047, '0fda6552-93e3-4d2e-a144-754516cb5cb1', '2026-05-10 23:15:07', 6.87381, 79.8702, 0.732341, 88.3207, 0.6, 'LOW', 'GREEN', '[]', 0.0018, 0),
(2048, '0fda6552-93e3-4d2e-a144-754516cb5cb1', '2026-05-10 23:15:08', 6.87381, 79.8702, 0.378941, 89.9888, 0.5, 'LOW', 'GREEN', '[]', 0.0009, 0),
(2049, '0fda6552-93e3-4d2e-a144-754516cb5cb1', '2026-05-10 23:15:11', 6.8738, 79.8702, 0.726827, 90.0019, 0.5, 'LOW', 'GREEN', '[]', 0.0017, 0),
(2050, '0fda6552-93e3-4d2e-a144-754516cb5cb1', '2026-05-10 23:15:11', 6.87382, 79.8702, 0.379161, 89.0411, 0.5, 'LOW', 'GREEN', '[]', 0.0009, 0),
(2051, '0fda6552-93e3-4d2e-a144-754516cb5cb1', '2026-05-10 23:15:13', 6.87382, 79.8702, 0.379161, 89.0411, 0.4, 'LOW', 'GREEN', '[]', 0.0009, 0),
(2052, '0fda6552-93e3-4d2e-a144-754516cb5cb1', '2026-05-10 23:15:14', 6.8738, 79.8702, 0.728766, 90.0003, 0.5, 'LOW', 'GREEN', '[]', 0.0017, 0),
(2053, '0fda6552-93e3-4d2e-a144-754516cb5cb1', '2026-05-10 23:15:17', 6.87382, 79.8702, 0.505988, 90.0029, 0.4, 'LOW', 'GREEN', '[]', 0.0012, 0),
(2054, '0fda6552-93e3-4d2e-a144-754516cb5cb1', '2026-05-10 23:15:18', 6.87382, 79.8702, 0.505988, 90.0029, 0.4, 'LOW', 'GREEN', '[]', 0.0012, 0),
(2055, '0fda6552-93e3-4d2e-a144-754516cb5cb1', '2026-05-10 23:15:20', 6.87383, 79.8702, 0.506166, 89.0497, 0.4, 'LOW', 'GREEN', '[]', 0.0012, 0),
(2056, '0fda6552-93e3-4d2e-a144-754516cb5cb1', '2026-05-10 23:15:21', 6.87385, 79.8702, 1.20751, 90.0443, 0.6, 'LOW', 'GREEN', '[]', 0.0029, 0),
(2057, '0fda6552-93e3-4d2e-a144-754516cb5cb1', '2026-05-10 23:15:22', 6.87383, 79.8702, 0.506166, 89.0497, 0.5, 'LOW', 'GREEN', '[]', 0.0012, 0),
(2058, '0fda6552-93e3-4d2e-a144-754516cb5cb1', '2026-05-10 23:15:26', 6.87382, 79.8702, 0.510667, 90.0299, 0.5, 'LOW', 'GREEN', '[]', 0.0012, 0),
(2059, '0fda6552-93e3-4d2e-a144-754516cb5cb1', '2026-05-10 23:15:26', 6.87381, 79.8702, 0.853108, 90.0222, 0.6, 'LOW', 'GREEN', '[]', 0.002, 0),
(2060, '0fda6552-93e3-4d2e-a144-754516cb5cb1', '2026-05-10 23:15:29', 6.87383, 79.8702, 0.510811, 89.0589, 0.5, 'LOW', 'GREEN', '[]', 0.0012, 0),
(2061, '0fda6552-93e3-4d2e-a144-754516cb5cb1', '2026-05-10 23:15:32', 6.87383, 79.8702, 0.510811, 89.0589, 0.5, 'LOW', 'GREEN', '[]', 0.0012, 0),
(2062, '0fda6552-93e3-4d2e-a144-754516cb5cb1', '2026-05-10 23:15:34', 6.8738, 79.8702, 0.726827, 90.0019, 0.5, 'LOW', 'GREEN', '[]', 0.0017, 0),
(2063, '0fda6552-93e3-4d2e-a144-754516cb5cb1', '2026-05-10 23:15:35', 6.8738, 79.8702, 0.726827, 90.0019, 0.5, 'LOW', 'GREEN', '[]', 0.0017, 0),
(2064, '0fda6552-93e3-4d2e-a144-754516cb5cb1', '2026-05-10 23:15:35', 6.87384, 79.8701, 2.05249, 197.16, 0.9, 'LOW', 'GREEN', '[]', 0.0049, 0),
(2065, '0fda6552-93e3-4d2e-a144-754516cb5cb1', '2026-05-10 23:15:36', 6.87384, 79.8701, 2.05249, 197.16, 1.2, 'LOW', 'GREEN', '[]', 0.0049, 0),
(2066, '0fda6552-93e3-4d2e-a144-754516cb5cb1', '2026-05-10 23:15:36', 6.87381, 79.8702, 0.378941, 89.9888, 0.9, 'LOW', 'GREEN', '[]', 0.0009, 0),
(2067, '0fda6552-93e3-4d2e-a144-754516cb5cb1', '2026-05-10 23:15:38', 6.87382, 79.8702, 0.379161, 89.0411, 0.7, 'LOW', 'GREEN', '[]', 0.0009, 0),
(2068, '0fda6552-93e3-4d2e-a144-754516cb5cb1', '2026-05-10 23:15:41', 6.87384, 79.8701, 2.05166, 197.166, 1, 'LOW', 'GREEN', '[]', 0.0049, 0),
(2069, '0fda6552-93e3-4d2e-a144-754516cb5cb1', '2026-05-10 23:15:41', 6.8738, 79.8702, 0.728766, 90.0003, 0.9, 'LOW', 'GREEN', '[]', 0.0017, 0),
(2070, '0fda6552-93e3-4d2e-a144-754516cb5cb1', '2026-05-10 23:15:44', 6.87381, 79.8701, 0.284868, 0, 0.6, 'LOW', 'GREEN', '[]', 0.0007, 0),
(2071, '0fda6552-93e3-4d2e-a144-754516cb5cb1', '2026-05-10 23:15:46', 6.87381, 79.8701, 0.284868, 0, 0.5, 'LOW', 'GREEN', '[]', 0.0007, 0),
(2072, '0fda6552-93e3-4d2e-a144-754516cb5cb1', '2026-05-10 23:15:48', 6.87381, 79.8701, 0.284868, 0, 0.4, 'LOW', 'GREEN', '[]', 0.0007, 0),
(2073, '0fda6552-93e3-4d2e-a144-754516cb5cb1', '2026-05-10 23:15:50', 6.87381, 79.8701, 0.284868, 0, 0.3, 'LOW', 'GREEN', '[]', 0.0007, 0),
(2074, '0fda6552-93e3-4d2e-a144-754516cb5cb1', '2026-05-10 23:15:53', 6.8738, 79.8702, 0.272611, 0, 0.3, 'LOW', 'GREEN', '[]', 0.0007, 0),
(2075, '0fda6552-93e3-4d2e-a144-754516cb5cb1', '2026-05-10 23:15:53', 6.87382, 79.8702, 0.510667, 90.0299, 0.3, 'LOW', 'GREEN', '[]', 0.0012, 0),
(2076, '0fda6552-93e3-4d2e-a144-754516cb5cb1', '2026-05-10 23:15:56', 6.87383, 79.8702, 0.510811, 89.0589, 0.4, 'LOW', 'GREEN', '[]', 0.0012, 0),
(2077, '82233ecf-3d03-4db8-adb7-5d3a595db965', '2026-05-10 23:16:05', 6.87384, 79.8701, 2.05166, 197.166, 1.6, 'LOW', 'GREEN', '[]', 0.0049, 0),
(2078, 'f10d5e03-2ecf-4a88-8314-f038a33af206', '2026-05-10 23:16:07', 6.87384, 79.8701, 2.05166, 197.166, 1.6, 'LOW', 'GREEN', '[]', 0.0049, 0),
(2079, 'da021148-f2c5-45f7-a593-667636ae724b', '2026-05-10 23:16:11', 6.8738, 79.8702, 0.272611, 0, 0.2, 'LOW', 'GREEN', '[]', 0.0007, 0),
(2080, '76a19744-8581-405a-a614-0474519906bd', '2026-05-10 23:16:23', 6.8738, 79.8702, 0.272611, 0, 0.2, 'LOW', 'GREEN', '[]', 0.0007, 0),
(2081, '1ac66cba-1761-465b-b84a-ba5887f72d57', '2026-05-20 07:51:40', 6.91, 79.8775, 40, 45, 32, 'LOW', 'GREEN', '[]', 0.096, 0),
(2082, 'a3c4001b-1edf-4801-aa20-35801185c291', '2026-05-20 07:51:41', 6.91067, 79.8775, 40, 45, 32, 'LOW', 'GREEN', '[]', 0.096, 0),
(2083, 'eb1bb843-bb5e-49f5-a1a6-301115919ce0', '2026-05-20 07:51:42', 6.91133, 79.8775, 40, 45, 32, 'LOW', 'GREEN', '[]', 0.096, 0),
(2084, 'cd41ef54-9e82-4c86-afa3-9faaf9cdf569', '2026-05-20 07:51:43', 6.912, 79.8775, 40, 45, 32, 'LOW', 'GREEN', '[]', 0.096, 0),
(2085, 'fcceed72-3117-4b65-86a5-2cfe2e8de3c6', '2026-05-20 07:51:44', 6.91267, 79.8775, 40, 45, 32, 'LOW', 'GREEN', '[]', 0.096, 0),
(2086, 'a345fef3-0748-4e87-99a2-0987f8663b68', '2026-05-20 07:51:45', 6.91333, 79.8775, 40, 45, 32, 'LOW', 'GREEN', '[]', 0.096, 0),
(2087, '8c03f471-9901-454a-88ec-df1e15f5d4e9', '2026-05-20 07:51:46', 6.914, 79.8775, 40, 45, 32, 'LOW', 'GREEN', '[]', 0.096, 0),
(2088, '4f5e0c21-aa32-4d2f-8c3d-8d629f18ff5c', '2026-05-20 07:51:47', 6.91467, 79.8775, 40, 45, 32, 'LOW', 'GREEN', '[]', 0.096, 0),
(2089, '96ffcf87-909a-4398-8f54-07cc538524e9', '2026-05-20 07:51:48', 6.91533, 79.8775, 40, 45, 32, 'LOW', 'GREEN', '[]', 0.096, 0),
(2090, '1fbc3a7f-863d-4746-b982-0b7e81dc44d3', '2026-05-20 07:51:49', 6.916, 79.8775, 40, 45, 32, 'LOW', 'GREEN', '[]', 0.096, 0),
(2091, 'd14b58c9-5f66-473b-90ee-eb73f7f2b3ea', '2026-05-20 07:51:50', 6.91667, 79.8775, 40, 45, 32, 'LOW', 'GREEN', '[]', 0.096, 0),
(2092, '252011da-2940-46d7-9948-3830f7f97b02', '2026-05-20 07:51:51', 6.91733, 79.8775, 40, 45, 32, 'LOW', 'GREEN', '[]', 0.096, 0),
(2093, '0454f313-dc11-46ee-a35a-a0f1c8a3002b', '2026-05-20 07:51:52', 6.918, 79.8775, 40, 45, 32, 'LOW', 'GREEN', '[]', 0.096, 0),
(2094, 'b94dad23-c376-4849-8078-f8db2f5182f8', '2026-05-20 07:51:53', 6.91867, 79.8775, 40, 45, 32, 'LOW', 'GREEN', '[]', 0.096, 0),
(2095, '5699d256-fc3a-45cc-bd89-fab6d04aa01c', '2026-05-20 07:51:54', 6.91933, 79.8775, 40, 45, 32, 'LOW', 'GREEN', '[]', 0.096, 0);

-- --------------------------------------------------------

--
-- Table structure for table `trips`
--

CREATE TABLE `trips` (
  `id` varchar(36) NOT NULL,
  `vehicle_id` varchar(36) NOT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `avg_risk_score` float DEFAULT NULL,
  `max_risk_score` float DEFAULT NULL,
  `total_distance_km` float DEFAULT NULL,
  `red_alert_count` int(11) DEFAULT NULL,
  `yellow_alert_count` int(11) DEFAULT NULL,
  `point_count` int(11) DEFAULT NULL,
  `hard_brake_count` int(11) DEFAULT 0,
  `harsh_corner_count` int(11) DEFAULT 0,
  `safety_score` float DEFAULT 100
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trips`
--

INSERT INTO `trips` (`id`, `vehicle_id`, `start_time`, `end_time`, `is_active`, `avg_risk_score`, `max_risk_score`, `total_distance_km`, `red_alert_count`, `yellow_alert_count`, `point_count`, `hard_brake_count`, `harsh_corner_count`, `safety_score`) VALUES
('01943eec-20ea-418b-87f9-f3f7366b2366', 'demo-vehicle-001', '2026-04-23 05:35:24', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('01b93829-e5e3-412f-ace3-fbfc2fedafac', 'bench_car', '2026-03-20 23:16:36', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('0241072a-123a-4ed6-89fa-0d90f5ce88af', 'bench_car', '2026-04-01 13:06:16', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('028d884f-ceb1-4f6e-8666-03bfc23156ab', 'bench_car', '2026-04-02 13:43:22', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('0454f313-dc11-46ee-a35a-a0f1c8a3002b', 'sim_car', '2026-05-20 07:51:52', NULL, 1, 32, 32, 0, 0, 0, 1, 0, 0, 100),
('0477d132-d6c7-4416-8cb8-8833b0eeed30', 'demo-vehicle-001', '2026-05-10 23:07:21', NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 100),
('04eb9221-03b3-42fb-a36f-e295e04122a3', 'sim_car', '2026-04-02 13:44:16', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('050b3509-23ea-4c42-833b-e064cf855b71', 'sim_car', '2026-04-02 13:44:10', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('053f9ac1-d5ba-4c9f-9205-ee2f0910ebd9', 'demo-vehicle-001', '2026-03-18 14:37:50', NULL, 1, 1.66877, 3, 0, 0, 0, 221, 0, 0, 100),
('0547ef2f-684b-4b79-9a0b-720527d41584', 'demo-vehicle-001', '2026-03-11 00:21:52', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('05e4a167-ec65-477b-928a-1defca82333b', 'bench_car', '2026-03-20 23:20:56', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('06d5e938-8887-40af-876e-202d7ce55cca', 'bench_car', '2026-04-02 13:43:30', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('072e7f4d-eae7-4410-8afb-938a5feb2983', 'bench_car', '2026-03-20 23:16:30', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('07722293-c93b-439e-9c46-d645376f1180', 'bench_car', '2026-04-01 13:06:34', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('0872a12b-2d99-4501-b027-88590113fd74', 'bench_car', '2026-04-02 13:43:24', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('088f6475-9d30-4a60-92df-bdc341f59100', 'sim_car', '2026-03-20 23:21:31', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('08a05b41-c742-424f-8fcd-899fd2e76d57', 'demo-vehicle-001', '2026-05-06 14:25:59', NULL, 1, 27.9, 28, 0, 0, 0, 5, 0, 0, 100),
('09734dbe-ddb1-4eda-abb1-30f2ab398253', 'sim_car', '2026-03-20 23:18:03', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('0a53ee32-d252-4e58-ba8d-0ac019e7ae07', 'demo-vehicle-001', '2026-04-23 05:35:21', NULL, 1, 0, 0, 0, 0, 0, 9, 0, 0, 100),
('0a848c82-ea37-40c6-81b5-3020edfc938c', 'demo-vehicle-001', '2026-04-02 23:15:11', NULL, 1, 0, 0, 0, 0, 0, 2, 0, 0, 100),
('0ab866e3-194c-4f29-a7fd-21c3818ef9b8', 'sim_car', '2026-03-20 23:21:26', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('0ba9d060-6d61-4904-896f-2d836cb9608a', 'demo-vehicle-001', '2026-05-07 14:37:15', NULL, 1, 50, 50, 0, 0, 1, 1, 0, 0, 100),
('0ca8e543-6381-4965-98d8-3fe1f9c0ce3b', 'demo-vehicle-001', '2026-03-16 23:47:40', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('0cddd6f0-0b91-41f5-82d8-2f1e18775410', 'bench_car', '2026-04-01 13:06:30', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('0daa91a2-6b8d-4a6b-8e72-8e23701b9fcb', 'bench_car', '2026-03-20 23:20:59', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('0df9d65e-dd0d-479c-a7ea-48e9da77fff7', 'demo-vehicle-001', '2026-04-25 19:36:47', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('0e846127-b8e3-4f43-b491-49f89ed2543a', 'demo-vehicle-001', '2026-04-25 19:48:51', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('0ebf1720-94f9-48cd-8cfa-face5e5270e9', 'sim_car', '2026-03-20 23:17:14', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('0f07a151-55b9-4869-8b7c-46d201078856', 'bench_car', '2026-03-20 23:20:51', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('0f36803b-86fa-4577-bc09-216a8245e1bf', 'sim_car', '2026-03-20 23:17:47', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('0f3da4d9-e33f-4c88-9137-eba115787d8b', 'sim_car', '2026-03-20 23:17:00', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('0fda6552-93e3-4d2e-a144-754516cb5cb1', 'demo-vehicle-001', '2026-05-10 23:13:47', '2026-05-10 23:15:57', 0, 0.680645, 1.2, 0, 0, 0, 62, 1, 2, 77),
('108b104d-ce03-49df-af86-b0f1045b56fe', 'bench_car', '2026-04-01 13:06:43', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('10f99b18-0444-44ea-a93a-81da7104ebe5', 'bench_car', '2026-04-02 13:43:28', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('124079c1-77d9-4a3a-915c-b9b03a7d37da', 'demo-vehicle-001', '2026-05-10 23:13:43', NULL, 1, 1.1, 1.1, 0, 0, 0, 1, 0, 0, 100),
('13a4adbe-9038-47fd-b7d7-520f5f6a238a', 'bench_car', '2026-04-02 13:43:25', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('13a57403-0f84-42ab-9f09-0ca15404b049', 'bench_car', '2026-04-02 13:43:23', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('14550ade-cd5c-43bf-aef6-d323ad373d8e', 'demo-vehicle-001', '2026-03-11 00:21:52', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('14d1f055-15a2-4044-a952-1a2f3b9c75ea', 'sim_car', '2026-03-20 23:21:15', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('1502970f-36c4-4b46-aacb-b5fb14f32f17', 'bench_car', '2026-04-01 13:06:25', NULL, 1, 9.8, 9.8, 0, 0, 0, 1, 0, 0, 100),
('15899c41-dc43-48d2-8e13-50f004bc69a9', 'bench_car', '2026-03-20 23:20:53', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('15dbea9c-15bf-42f5-a549-f8ef7f58bb30', 'bench_car', '2026-04-01 13:06:20', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('16a761ca-9c56-4a28-9967-25a8a7185203', 'bench_car', '2026-03-20 23:21:22', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('16f3cd94-9759-4200-9ca6-a4165682ffa7', 'bench_car', '2026-03-20 23:21:13', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('1741063a-aac4-49ce-8793-38164ac4d285', 'bench_car', '2026-04-01 13:06:26', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('17660e31-be52-4db7-ac7f-35680892942f', 'sim_car', '2026-04-02 13:44:11', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('177eebe1-bd2c-45e7-8b2f-e8756c907c56', 'demo-vehicle-001', '2026-05-06 14:25:57', NULL, 1, 27.8, 27.8, 0, 0, 0, 1, 0, 0, 100),
('199a7d97-3363-4052-b863-06ab050ad8f0', 'bench_car', '2026-04-01 13:06:21', NULL, 1, 29.3, 29.3, 0, 0, 0, 1, 0, 0, 100),
('1a2ea3d8-e372-44e8-9071-8d69faad30fc', 'bench_car', '2026-03-20 23:16:34', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('1a3114e5-7728-4dac-b789-ca62aa0b71a4', 'bench_car', '2026-04-01 13:06:15', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('1ac66cba-1761-465b-b84a-ba5887f72d57', 'sim_car', '2026-05-20 07:51:40', NULL, 1, 32, 32, 0, 0, 0, 1, 0, 0, 100),
('1b4e2bcf-e346-4d5e-843e-9233b7caf5c2', 'bench_car', '2026-03-20 23:21:18', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('1bca36d5-b06d-4140-86dd-a17f0a0fa190', 'bench_car', '2026-04-02 13:43:27', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('1ca0b315-8f38-499e-a7fb-cc94307ba800', 'bench_car', '2026-04-02 13:43:31', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('1cfa6f95-c511-4158-b3ea-81aa0694753c', 'bench_car', '2026-03-20 23:21:27', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('1e67b5f9-0b3f-4f8c-9c9b-f014bb721d22', 'sim_car', '2026-03-20 23:17:14', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('1e69ce57-9442-40f1-81f3-e51505b729f9', 'bench_car', '2026-03-20 23:21:34', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('1e8beb46-392c-4975-98c3-0ba22e444fe2', 'bench_car', '2026-04-02 13:43:26', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('1e9b583b-619a-40fd-8d32-8970ef59feaa', 'bench_car', '2026-03-20 23:16:23', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('1f82eb6c-aef3-4b76-8197-e2a6e91f0bce', 'sim_car', '2026-03-20 23:16:58', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('1fbc3a7f-863d-4746-b982-0b7e81dc44d3', 'sim_car', '2026-05-20 07:51:49', NULL, 1, 32, 32, 0, 0, 0, 1, 0, 0, 100),
('1fec6bf3-b640-4279-95cf-495ddcd3dc28', 'demo-vehicle-001', '2026-05-04 16:26:41', NULL, 1, 30.5, 30.5, 0, 0, 0, 1, 0, 0, 100),
('2021433f-84a0-4b2b-9a7c-98557d864f93', 'demo-vehicle-001', '2026-04-25 20:37:22', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('2041f250-d15c-498c-a356-696b652e6550', 'sim_car', '2026-03-20 23:17:16', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('20cd4eeb-8de2-45f3-8383-074a03506936', 'sim_car', '2026-04-02 13:44:07', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('20ef843a-412f-4773-a73a-7d698e11547d', 'demo-vehicle-001', '2026-05-07 14:37:15', NULL, 1, 50, 50, 0, 0, 3, 3, 0, 0, 100),
('20f6a942-d687-437c-9749-5c5b671d70f2', 'sim_car', '2026-04-02 13:44:04', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('21661c60-1136-45a8-ab63-5f0338e6bb0f', 'bench_car', '2026-04-01 13:06:42', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('21b6846f-336a-4862-ba5f-886d6ffe4b6c', 'bench_car', '2026-04-02 13:43:45', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('2312813c-0b58-4426-a270-999b39869de6', 'bench_car', '2026-04-01 13:06:39', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('2324f528-9a9b-44a3-b313-4d6bc1ca2828', 'demo-vehicle-001', '2026-05-10 23:13:41', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('234a766f-9e59-42bf-826e-816947d5041e', 'bench_car', '2026-03-20 23:21:00', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('23c79849-5f05-4573-a744-d05f52dddb7b', 'demo-vehicle-001', '2026-03-11 00:21:48', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('241d54c7-11c9-43f4-ad01-bcc9d9ff5a83', 'bench_car', '2026-03-20 23:16:15', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('247ca116-0394-4c84-bd0b-3a19d0bfcd79', 'sim_car', '2026-03-20 23:17:06', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('252011da-2940-46d7-9948-3830f7f97b02', 'sim_car', '2026-05-20 07:51:51', NULL, 1, 32, 32, 0, 0, 0, 1, 0, 0, 100),
('25d5b0e9-7ed5-45dd-a3a5-b1aa8f9a8e47', 'demo-vehicle-001', '2026-03-11 00:21:54', NULL, 1, 0, 0, 0, 0, 0, 2, 0, 0, 100),
('25dc2eab-854f-430c-9d37-d482fcf75bb4', 'bench_car', '2026-04-01 13:06:28', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('25eca2fe-b81c-4333-824a-cb030b2fb074', 'demo-vehicle-001', '2026-05-06 14:25:44', NULL, 1, 27.1, 27.1, 0, 0, 0, 1, 0, 0, 100),
('26efa5e1-ec93-417e-a2e5-609660495d7b', 'bench_car', '2026-04-02 13:43:41', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('27252478-6687-4997-862f-30249759a75a', 'bench_car', '2026-04-01 13:06:41', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('2797adbd-5175-406c-9841-546f91bc4b65', 'demo-vehicle-001', '2026-04-23 05:55:58', NULL, 1, 9.8, 9.8, 0, 0, 0, 1, 0, 0, 100),
('2b80678d-0ce1-44d4-aea3-13f6bd37457b', 'bench_car', '2026-04-01 13:06:28', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('2c865369-8b4f-48dc-b31f-82ee8aed5db4', 'demo-vehicle-001', '2026-03-16 23:29:27', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('2c9f4ea8-e90e-469b-91c7-67c18101b757', 'bench_car', '2026-03-20 23:16:35', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('2ced1465-d0c6-4472-9703-28b4ae5e2f96', 'demo-vehicle-001', '2026-03-11 00:21:49', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('2d55cbe9-aca4-4f1f-8cc6-046bed7fc15e', 'demo-vehicle-001', '2026-05-10 23:07:31', NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 100),
('2f12b72b-4c01-4a8a-bc09-11ee1e96556d', 'bench_car', '2026-03-20 23:16:28', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('2f3e27b9-c739-4a0a-bc74-6f3ae5a76913', 'sim_car', '2026-03-20 23:17:30', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('306a1abf-3674-4447-b62d-050b4a1ef1da', 'bench_car', '2026-03-20 23:16:37', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('310ee60d-2dcd-470a-99a6-5d99aab34584', 'demo-vehicle-001', '2026-03-17 23:36:34', NULL, 1, 0, 0, 0, 0, 0, 89, 0, 0, 100),
('326aae7b-cf42-4f70-aadb-358231a047de', 'bench_car', '2026-03-20 23:20:57', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('33e8d978-f535-4572-8176-0a0a42058e93', 'bench_car', '2026-04-02 13:43:34', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('345cfd0b-dd4a-4165-a023-50c4b252ed61', 'bench_car', '2026-04-01 13:06:17', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('34fce98c-8f1c-4089-89fb-19bd20a393f5', 'bench_car', '2026-04-02 13:43:38', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('35b452dc-f746-4635-9b5b-fa1b81426e68', 'bench_car', '2026-04-01 13:06:34', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('35f7ad69-b687-473b-8c63-f76ba2c9bb08', 'bench_car', '2026-04-02 13:43:40', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('3601c178-5b4c-4695-b87c-7b25930ed24a', 'sim_car', '2026-03-20 23:21:10', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('39a6e7bf-4dec-4d68-bd86-3e7d67430023', 'demo-vehicle-001', '2026-03-11 00:21:58', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('3aba0119-34dd-4572-8c8f-56609d47abcd', 'bench_car', '2026-04-01 13:06:38', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('3b022ee4-bbde-4e79-9bb7-7a4be90cf14e', 'bench_car', '2026-03-20 23:21:08', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('3b4dc889-5a20-45d1-a90b-693ee84a29a5', 'sim_car', '2026-03-20 23:17:00', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('3be6be54-907d-4fd6-a30c-34eb226101c6', 'bench_car', '2026-03-20 23:16:27', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('3be8da96-cad3-4a25-8ad4-0b0d31af9d3b', 'demo-vehicle-001', '2026-05-04 16:23:51', NULL, 1, 30, 30, 0, 0, 0, 1, 0, 0, 100),
('3c9a2dca-b661-4600-8f30-7ffc0bd16d98', 'bench_car', '2026-03-20 23:16:21', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('3cd74236-58f5-4459-84db-2438def2e319', 'demo-vehicle-001', '2026-03-16 23:04:58', NULL, 1, 0, 0, 0, 0, 0, 76, 0, 0, 100),
('3d9b644c-9ebd-4dad-81ce-a9013330f54f', 'bench_car', '2026-04-02 13:43:39', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('3dc56d0c-b1df-4279-8c16-9021d9e36b93', 'bench_car', '2026-03-20 23:16:38', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('3de3d699-90ea-41e4-b9a4-d59e95670112', 'demo-vehicle-001', '2026-04-23 05:55:55', NULL, 1, 3.73571, 7.4, 0, 0, 0, 42, 0, 0, 100),
('3efb0fbb-1bea-4cc1-8948-c02895581286', 'bench_car', '2026-03-20 23:21:09', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('41c5da41-960b-4400-8cf4-29599a9d6d79', 'demo-vehicle-001', '2026-05-07 14:37:18', NULL, 1, 50, 50, 0, 0, 1, 1, 0, 0, 100),
('41e4ea02-1d4d-45b7-9fb2-0de1d446f4cf', 'sim_car', '2026-03-20 23:21:19', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('4252d3af-d54c-4b75-9804-38643cf824ba', 'demo-vehicle-001', '2026-05-04 16:23:52', NULL, 1, 30, 30, 0, 0, 0, 1, 0, 0, 100),
('42dd4396-2184-4afa-a3e6-603233e536a8', 'bench_car', '2026-04-02 13:43:34', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('4352216d-79e7-4cfe-aa4a-427f09e7c2a4', 'sim_car', '2026-03-20 23:16:57', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('442aee1d-6f3f-427c-8555-861f51a0fc48', 'bench_car', '2026-03-20 23:16:25', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('44e150db-1136-4ca2-9b49-cedd446a8a8c', 'bench_car', '2026-04-02 13:43:45', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('459425ef-0a21-4aa6-b22a-358e5fdd6602', 'bench_car', '2026-03-20 23:16:19', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('45a7f99b-0ad1-4e33-9627-4811554ca874', 'bench_car', '2026-04-01 13:06:19', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('46686828-8ea5-4693-86a6-de9d5007169b', 'demo-vehicle-001', '2026-04-25 19:45:10', NULL, 1, 0, 0, 0, 0, 0, 56, 0, 0, 100),
('495caca8-d952-44cc-8963-497aeb69f611', 'bench_car', '2026-03-20 23:21:11', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('49a47754-c9db-48e3-80fc-a0b8eb8790be', 'bench_car', '2026-04-01 13:06:36', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('49afd69c-edc6-490f-a0ed-ca439718541e', 'demo-vehicle-001', '2026-03-16 23:50:06', NULL, 1, 0, 0, 0, 0, 0, 154, 0, 0, 100),
('4a9b0923-6fcd-4ba5-91f1-6dc49bf7a82c', 'bench_car', '2026-04-02 13:43:36', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('4a9c8369-f883-463e-90c9-192d43431515', 'demo-vehicle-001', '2026-03-16 23:47:41', '2026-03-16 23:48:17', 0, 0, 0, 0, 0, 0, 13, 0, 0, 100),
('4c0a510b-0f9e-46dc-a4bc-2a6dc952fa57', 'bench_car', '2026-04-01 13:06:31', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('4cf1f6c3-a14a-4c36-a51c-9541835e4e15', 'sim_car', '2026-03-20 23:17:25', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('4dd9507d-4c9a-4a8a-867f-78ac8a84bf81', 'bench_car', '2026-03-20 23:16:20', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('4de02bd2-351b-4f7f-8864-efcba396c10e', 'demo-vehicle-001', '2026-03-11 00:22:00', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('4e084776-b55f-4ca9-88c8-7a8538c7f536', 'sim_car', '2026-03-20 23:17:09', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('4e14b9dc-86d4-4686-9846-4203752bfec1', 'demo-vehicle-001', '2026-05-10 23:13:33', NULL, 1, 1.1, 1.1, 0, 0, 0, 1, 0, 0, 100),
('4e1aaf41-f714-406b-b4c6-db81f1299b99', 'demo-vehicle-001', '2026-04-04 11:23:52', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('4ed304c4-602b-42c1-a6d2-9f663ed4ba39', 'bench_car', '2026-04-01 13:06:24', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('4f57073b-1e8a-4d7b-bcab-7077e652b632', 'demo-vehicle-001', '2026-05-06 14:25:30', NULL, 1, 27.3923, 28, 0, 0, 0, 13, 0, 0, 100),
('4f5e0c21-aa32-4d2f-8c3d-8d629f18ff5c', 'sim_car', '2026-05-20 07:51:47', NULL, 1, 32, 32, 0, 0, 0, 1, 0, 0, 100),
('51f071db-b1bd-45bb-b171-1de2a0d68613', 'sim_car', '2026-03-20 23:18:05', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('523f1de8-f976-4371-91ea-bd22b7a8c9b0', 'bench_car', '2026-04-01 13:06:18', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('52546221-a6db-4315-8064-c7f2fff12fb6', 'demo-vehicle-001', '2026-03-11 00:22:01', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('542fe8ca-e7ec-41a5-8687-ee08547d5fff', 'sim_car', '2026-03-20 23:21:05', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('55c9fc00-6cd3-4084-bee6-d944e006503b', 'bench_car', '2026-04-01 13:06:30', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('560945ac-9c95-4e79-a6b6-db8c6f006299', 'demo-vehicle-001', '2026-05-10 23:13:53', NULL, 1, 0.6, 0.6, 0, 0, 0, 1, 0, 0, 100),
('565e60be-6569-4d6a-9a9d-d23825139daf', 'sim_car', '2026-03-20 23:21:33', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('565eb241-d1e8-438e-9236-f16b30a1a012', 'bench_car', '2026-04-02 13:43:22', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('5699d256-fc3a-45cc-bd89-fab6d04aa01c', 'sim_car', '2026-05-20 07:51:54', NULL, 1, 32, 32, 0, 0, 0, 1, 0, 0, 100),
('56bc29a2-f269-4a8e-9d94-36bfdd42853d', 'sim_car', '2026-03-20 23:17:56', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('56bd6319-bcab-445b-b909-a477a4a7cf70', 'bench_car', '2026-03-20 23:16:25', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('56d30f80-f14c-4a25-b627-c06607f7eadc', 'bench_car', '2026-04-01 13:06:44', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('57337d9e-9f61-4ee2-9625-0307b3dd37ff', 'bench_car', '2026-03-20 23:21:19', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('57d1916c-8454-450e-837a-9fa8d166ed51', 'bench_car', '2026-03-20 23:16:06', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('5894be82-0134-42ae-b457-b8f137f0e7f1', 'bench_car', '2026-03-20 23:16:01', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('59af2877-f077-40c1-9901-20575a30e848', 'bench_car', '2026-03-20 23:21:11', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('5b8a3cde-cbb5-4e59-8113-b68abca439e0', 'bench_car', '2026-03-20 23:21:29', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('5bb3f648-e3a7-4db3-bae6-f66293473563', 'demo-vehicle-001', '2026-03-16 23:04:58', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('5bcbb54c-cb74-4b7f-8337-4e297beaebe7', 'demo-vehicle-001', '2026-03-16 23:47:37', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('5d266f42-7f0c-4741-ba0c-f1733ed7b028', 'sim_car', '2026-03-20 23:17:20', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('5e5d1905-08df-4656-a80d-9c036ef5342c', 'bench_car', '2026-04-01 13:06:32', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('5ec08519-3939-495f-b4f0-db44c0a91029', 'demo-vehicle-001', '2026-05-10 23:07:28', NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 100),
('5fb6c7b1-f5fc-4728-b1d4-4b72ab9d3f85', 'bench_car', '2026-04-01 13:06:46', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('603950c9-9c6a-42e7-b08f-3b5a80c6fa61', 'demo-vehicle-001', '2026-03-17 00:04:20', NULL, 1, 0, 0, 0, 0, 0, 30, 0, 0, 100),
('60ab49bf-ed91-44af-bfb1-9d3376e947ca', 'sim_car', '2026-03-20 23:16:49', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('61093734-ebc9-4a6b-ad8a-1ac9f8baa970', 'demo-vehicle-001', '2026-05-10 23:07:13', NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 100),
('61a73467-d698-4419-8caf-35f2b3562252', 'demo-vehicle-001', '2026-03-11 00:21:46', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('61a9bdc4-889a-4218-8f4c-4747de192d9b', 'demo-vehicle-001', '2026-04-25 19:36:46', NULL, 1, 0.247059, 4.9, 0, 0, 0, 102, 0, 0, 100),
('61df8f57-1f39-4790-a732-c76f216f67c2', 'demo-vehicle-001', '2026-04-25 19:36:49', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('6287328e-bf20-4cf2-8524-c0c1780ec020', 'demo-vehicle-001', '2026-03-17 00:02:02', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('633dc694-ed81-4da7-a2f6-1933ae4f3a64', 'bench_car', '2026-03-20 23:21:17', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('6437a07d-1cf1-453f-99b9-5e13f781fb9e', 'bench_car', '2026-03-20 23:16:12', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('649b4d86-af00-4416-9ca8-ad49a91ce9fd', 'demo-vehicle-001', '2026-04-02 23:15:15', NULL, 1, 0, 0, 0, 0, 0, 67, 0, 0, 100),
('652d4ab7-e9a2-4482-b3b6-3ab10b05169b', 'sim_car', '2026-03-20 23:17:53', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('69319624-c2cb-4267-be81-6c6e684615fb', 'bench_car', '2026-04-02 13:43:35', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('69858f53-e13a-47ff-b1b8-45026213cd09', 'bench_car', '2026-03-20 23:16:14', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('69ef18b4-99db-46c1-a101-c5ebdf182afc', 'demo-vehicle-001', '2026-03-11 00:21:51', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('6a3cd242-0280-4d2a-9240-da8ca945bf4f', 'demo-vehicle-001', '2026-05-10 23:07:20', NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 100),
('6a4054f6-8f23-4a26-9125-5db90cf18d63', 'sim_car', '2026-03-20 23:16:47', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('6b286c1a-64f4-4c6a-9132-7275292f7c3b', 'bench_car', '2026-03-20 23:16:11', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('6c1ff999-7814-46a4-93a1-235741892385', 'bench_car', '2026-04-02 13:43:35', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('6cce1e08-e95a-49d2-a3ef-552c2f9606d0', 'sim_car', '2026-03-20 23:17:02', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('6cf4529e-2152-4ae0-a49e-1b5d5f175adc', 'bench_car', '2026-04-02 13:43:43', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('6d429c2c-ca39-4974-9130-e03352152a6f', 'bench_car', '2026-03-20 23:21:15', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('6d4754a5-d7f1-4b1c-ab5a-de210cc8974b', 'bench_car', '2026-04-02 13:43:18', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('6d4bdd1f-2e88-4538-a35e-5ec093cdf3fb', 'bench_car', '2026-03-20 23:20:52', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('6f65deb5-70ab-4c67-ba72-4091d4a5f5d9', 'sim_car', '2026-03-20 23:16:51', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('70d78a46-58cc-4469-9b79-73e44499a269', 'bench_car', '2026-04-02 13:43:20', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('711a0bce-9178-4acb-a973-9905c89e92ba', 'bench_car', '2026-04-02 13:43:29', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('712a18df-4f2a-4cf8-bc8b-79faa28e85e2', 'bench_car', '2026-03-20 23:20:53', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('72a46070-5a60-4784-8097-68a5b7b15c2d', 'sim_car', '2026-04-02 13:44:19', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('72bd1d51-56f1-4508-8ea8-06f35c0a116b', 'bench_car', '2026-04-01 13:06:22', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('72c8c67c-6678-4dbb-bba2-338451f8f2ac', 'bench_car', '2026-03-20 23:16:18', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('7307dd43-d7d0-4d0d-9fc9-45583195dbdd', 'bench_car', '2026-04-01 13:06:37', NULL, 1, 9.8, 9.8, 0, 0, 0, 1, 0, 0, 100),
('7367b0e0-98e7-41da-b6f8-615bdfb7594f', 'demo-vehicle-001', '2026-05-07 14:37:17', '2026-05-07 14:37:20', 0, 50, 50, 0, 0, 1, 1, 0, 0, 100),
('74f965ff-dff9-4e1f-86d1-f4539ed360e2', 'demo-vehicle-001', '2026-03-11 00:21:47', NULL, 1, 0, 0, 0, 0, 0, 4, 0, 0, 100),
('75679dc8-c082-401d-87b1-19935517a1c1', 'bench_car', '2026-04-02 13:43:29', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('75cf12f6-a689-4f1a-ac6c-6bf6b4d5ad3f', 'bench_car', '2026-03-20 23:21:05', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('762f124f-b736-47c5-9bb1-4d8aa0933f21', 'bench_car', '2026-04-01 13:06:35', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('7672c604-d00d-46ae-b06e-3e58f7436950', 'demo-vehicle-001', '2026-03-11 00:22:20', '2026-03-11 00:31:17', 0, 0, 0, 0, 0, 0, 213, 0, 0, 100),
('76a19744-8581-405a-a614-0474519906bd', 'demo-vehicle-001', '2026-05-10 23:16:23', NULL, 1, 0.2, 0.2, 0, 0, 0, 1, 0, 0, 100),
('779dbd0b-cbc5-4f76-910f-df1cee611e9e', 'bench_car', '2026-03-20 23:16:06', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('78727dce-8a9b-493f-84d1-438d5f8066a4', 'demo-vehicle-001', '2026-05-10 23:13:44', NULL, 1, 1.1, 1.1, 0, 0, 0, 2, 0, 0, 100),
('79e3bf8c-0068-4c7b-83e6-e3866508678d', 'bench_car', '2026-04-01 13:06:40', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('7a0585d3-6e06-4f66-a4f4-59b81bbbca0c', 'bench_car', '2026-04-02 13:43:42', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('7cc2e04a-fa3b-4df7-86fb-9fbc04b4c4fd', 'bench_car', '2026-03-20 23:16:33', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('7d3c0fd1-fada-4b36-8a65-f1dcac0a3a08', 'sim_car', '2026-03-20 23:21:03', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('7da5d4da-9d90-436a-9984-b4ac1021ca00', 'sim_car', '2026-03-20 23:17:06', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('7e1de4dd-f78b-466a-9c4a-238d6568bb9d', 'demo-vehicle-001', '2026-05-10 23:14:06', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('7e3f0e7e-6c2c-4124-8619-226a79e52e12', 'demo-vehicle-001', '2026-05-06 14:25:47', NULL, 1, 28, 28, 0, 0, 0, 1, 0, 0, 100),
('7ec8ce03-61cc-42e4-a5d6-515dacf5ffdb', 'bench_car', '2026-03-20 23:16:32', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('7ed637d9-8d30-4618-8652-6da8a9834261', 'sim_car', '2026-03-20 23:21:12', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('7ef65b02-5a2d-4184-9f9b-3edafa6721ac', 'bench_car', '2026-04-02 13:43:37', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('7f27858e-9e27-4b8e-931b-e71958d902d1', 'bench_car', '2026-04-01 13:06:38', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('7f27a121-5e07-4c10-a8db-5e6dc50b78ad', 'bench_car', '2026-04-01 13:06:22', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('7f94e21d-f7d9-4273-8646-c44b52f88fdc', 'bench_car', '2026-03-20 23:16:37', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('81cdff91-6038-4920-9dc2-12c9fd9c584b', 'demo-vehicle-001', '2026-03-11 00:21:46', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('82233ecf-3d03-4db8-adb7-5d3a595db965', 'demo-vehicle-001', '2026-05-10 23:16:05', NULL, 1, 1.6, 1.6, 0, 0, 0, 1, 0, 0, 100),
('824c1c76-012d-4398-a523-1764c9077d93', 'bench_car', '2026-04-01 13:06:44', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('83f12bce-7670-455e-ad3f-83aafa8bc49f', 'bench_car', '2026-04-02 13:43:33', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('84344175-983e-4f49-b1a2-1a420b784597', 'sim_car', '2026-03-20 23:17:27', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('845308de-6d02-442d-9b10-ca9a1773ab2d', 'bench_car', '2026-04-02 13:43:21', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('84e8b7f7-a169-4572-a4c7-30a1bdafb064', 'bench_car', '2026-04-01 13:06:27', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('86aebb16-9b26-40a3-96ad-633911093050', 'demo-vehicle-001', '2026-03-16 23:05:00', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('86f033af-d738-435b-819f-edac609f26cb', 'bench_car', '2026-04-02 13:43:32', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('875b48cf-bc1f-42b5-aec4-7c0323bc1a92', 'demo-vehicle-001', '2026-03-16 23:48:18', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('876d04da-492b-4965-8422-368fdf320829', 'bench_car', '2026-04-01 13:06:14', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('87b4f3db-5494-4b20-9677-4db4973511c0', 'bench_car', '2026-04-02 13:43:30', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('87f3a4f6-1b2d-4de9-b8bf-12c69007a2c2', 'sim_car', '2026-04-02 13:44:13', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('88f83da7-dbc1-4faf-9724-24e364204912', 'demo-vehicle-001', '2026-05-10 23:07:40', NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 100),
('89b516f2-2c79-4248-8d34-e6938dfa231b', 'sim_car', '2026-03-20 23:18:07', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('89bea81c-d9da-413b-aaff-e5e52aff2545', 'bench_car', '2026-03-20 23:16:09', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('8aa1d7c4-000d-4ade-9038-6b1fdbaf2ca5', 'demo-vehicle-001', '2026-05-10 23:04:56', NULL, 1, 0.8, 0.8, 0, 0, 0, 1, 0, 0, 100),
('8ad10453-d106-40d0-a634-6bb8445e94cb', 'demo-vehicle-001', '2026-05-10 23:13:33', NULL, 1, 1.1, 1.1, 0, 0, 0, 1, 0, 0, 100),
('8b1c7027-042a-466d-a916-6e09c85d3786', 'bench_car', '2026-03-20 23:21:32', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('8be2b93a-d62e-4657-9ebb-bd0d2c542818', 'bench_car', '2026-04-01 13:06:17', NULL, 1, 9.8, 9.8, 0, 0, 0, 1, 0, 0, 100),
('8c03f471-9901-454a-88ec-df1e15f5d4e9', 'sim_car', '2026-05-20 07:51:46', NULL, 1, 32, 32, 0, 0, 0, 1, 0, 0, 100),
('8c1faee9-0b33-4cca-8967-0d903ba78cb0', 'sim_car', '2026-04-02 13:44:05', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('8c3f0e4c-03fd-4abb-9111-aa6dbc5da16b', 'bench_car', '2026-03-20 23:21:07', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('8c7144e7-3572-4411-9e0e-4924edcfcfa5', 'sim_car', '2026-03-20 23:21:28', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('8cf24a66-2cdf-4808-8822-6772cf4e8ddb', 'sim_car', '2026-03-20 23:18:12', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('8d4ad289-8eb6-4e8c-895b-46fd827990ca', 'demo-vehicle-001', '2026-03-17 00:02:05', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('8d59a4fe-ee5e-4c89-a69e-b21dca12ad1e', 'sim_car', '2026-03-20 23:17:51', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('8dd427f8-b57a-4482-a495-3e4f531de7c1', 'bench_car', '2026-04-02 13:43:31', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('8eaa91fd-e899-40e0-8dfa-8f3a2e96ebb6', 'bench_car', '2026-03-20 23:16:04', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('8f031f39-5d93-40e5-a1d1-a398a8db158c', 'bench_car', '2026-03-20 23:16:12', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('904b0cff-7ac7-42e9-9f60-1bc75f092f1e', 'demo-vehicle-001', '2026-05-07 14:37:06', NULL, 1, 50, 50, 0, 0, 1, 1, 0, 0, 100),
('91226360-97e3-4192-8306-710601b76458', 'sim_car', '2026-03-20 23:21:17', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('91d8a407-fa3d-43a6-8016-7a46905d4c5b', 'bench_car', '2026-03-20 23:16:03', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('92563786-8b14-492f-8dd1-5418a4d8cc0e', 'bench_car', '2026-03-20 23:21:20', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('9273d0d0-ff4c-471d-b45f-6975cda26746', 'bench_car', '2026-03-20 23:16:31', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('92c6b94e-7066-4f28-a3d8-6b6e25669136', 'sim_car', '2026-03-20 23:17:12', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('9318809d-243d-433f-af07-c20e622dc836', 'demo-vehicle-001', '2026-04-25 20:37:23', NULL, 1, 2.76092, 29.4, 0, 0, 0, 64, 0, 0, 100),
('933915a1-46a3-49f7-9beb-37b86c2da809', 'bench_car', '2026-03-20 23:21:28', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('940bdec1-d9ed-4409-ae20-00bb7d1af423', 'sim_car', '2026-03-20 23:17:10', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('9466a172-451e-4776-b859-4f9b1d27182f', 'bench_car', '2026-03-20 23:16:05', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('95105dae-559c-408a-96ae-d7a1bc095e48', 'bench_car', '2026-04-02 13:43:17', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('95fbc40d-ec45-4198-8386-9030c92fc124', 'bench_car', '2026-03-20 23:21:31', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('96fa1620-6f5b-434c-9234-99d267c58783', 'bench_car', '2026-03-20 23:20:56', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('96ffcf87-909a-4398-8f54-07cc538524e9', 'sim_car', '2026-05-20 07:51:48', NULL, 1, 32, 32, 0, 0, 0, 1, 0, 0, 100),
('98d083e3-4878-4c2c-93b7-982251f7db41', 'bench_car', '2026-04-02 13:43:42', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('98ee8d9a-c0ef-42d1-9e9e-e1e9ebbf9a91', 'bench_car', '2026-03-20 23:21:16', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('990a88ff-dbeb-4523-aaec-504bbbc9b658', 'sim_car', '2026-03-20 23:17:24', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('9929cc64-4b35-4cfc-9eea-f151be1a9dd7', 'bench_car', '2026-04-01 13:06:46', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('9af53534-006e-4dc1-b956-f75a261b636f', 'bench_car', '2026-03-20 23:21:10', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('9b3aaa88-d57a-453a-803e-664afbd5586e', 'demo-vehicle-001', '2026-04-25 19:45:08', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('9b4f24b2-9cce-40b1-97ff-1f5718f46adf', 'demo-vehicle-001', '2026-03-11 00:21:52', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('9bb80a1d-1163-48a1-9461-71b0364c0ae1', 'bench_car', '2026-03-20 23:21:26', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('9dd1221e-c90c-4585-b944-ae78aeefa624', 'sim_car', '2026-03-20 23:17:55', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('9e2c81d0-f647-41be-af1a-392e999c0c54', 'demo-vehicle-001', '2026-03-17 00:02:02', NULL, 1, 0, 0, 0, 0, 0, 12, 0, 0, 100),
('9ed7a1c1-b7f2-4f8e-a910-cd297b3ccc6b', 'demo-vehicle-001', '2026-04-23 05:55:56', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('9f587fb1-9a85-4e15-9e3b-f24b3605582f', 'bench_car', '2026-04-02 13:43:18', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('a0a55789-4e6e-4363-9a6e-7724c3f944a7', 'sim_car', '2026-03-20 23:17:22', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('a19e977c-ae72-4c07-8188-7498da06d682', 'bench_car', '2026-03-20 23:21:02', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('a237a2ac-3819-422e-856d-02e2707eb4c0', 'sim_car', '2026-03-20 23:16:53', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('a2506001-2111-4e76-9511-bab8a4174379', 'demo-vehicle-001', '2026-05-04 16:14:36', NULL, 1, 50, 50, 0, 0, 1, 1, 0, 0, 100),
('a345fef3-0748-4e87-99a2-0987f8663b68', 'sim_car', '2026-05-20 07:51:45', NULL, 1, 32, 32, 0, 0, 0, 1, 0, 0, 100),
('a38cdd50-17d3-458b-91da-edc745366f76', 'bench_car', '2026-04-02 13:43:25', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('a3c1c941-3172-470a-86f2-ca2959d95e80', 'bench_car', '2026-03-20 23:16:28', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('a3c4001b-1edf-4801-aa20-35801185c291', 'sim_car', '2026-05-20 07:51:41', NULL, 1, 32, 32, 0, 0, 0, 1, 0, 0, 100),
('a3e9c199-9587-4409-91b4-943f4b6b1d3b', 'bench_car', '2026-03-20 23:16:17', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('a4c1c7f0-23e4-4f6a-833f-b758e93a5b08', 'bench_car', '2026-04-01 13:06:36', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('a4c1d902-0487-4b2f-a353-cb3edecea158', 'bench_car', '2026-03-20 23:21:22', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('a5d8e2fe-e686-4732-b5bc-2c745b9e8519', 'demo-vehicle-001', '2026-05-07 14:37:06', NULL, 1, 50, 50, 0, 0, 1, 1, 0, 0, 100),
('a6206040-e23c-4dbe-940e-dfe84f082d33', 'bench_car', '2026-03-20 23:16:26', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('a7969bea-d1cd-48e8-b44b-e1fead994a80', 'bench_car', '2026-03-20 23:16:22', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('a7f63d86-fcfb-4407-8387-675cdf3ce65c', 'bench_car', '2026-03-20 23:21:06', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('a9c7956c-1ba0-4684-9eee-f1464c871521', 'demo-vehicle-001', '2026-03-11 00:21:47', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('a9e6105f-82a5-488d-b89f-7d8f02761ac4', 'demo-vehicle-001', '2026-03-11 00:21:48', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('aaadb59b-9828-45de-a716-37c0c2a1fc4b', 'demo-vehicle-001', '2026-03-11 00:22:01', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('ab87c838-0e3b-4c61-b986-ec64e2b1d9a3', 'demo-vehicle-001', '2026-03-17 23:35:08', NULL, 1, 0, 0, 0, 0, 0, 4, 0, 0, 100),
('ae67327e-cf63-423b-bd30-83ccdfdade6b', 'bench_car', '2026-03-20 23:21:14', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('aeaf3464-3f28-4ae9-92d2-60c4b260abd1', 'demo-vehicle-001', '2026-03-11 00:21:58', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('aef19717-7b78-4780-8b2f-6a9eae722e7e', 'bench_car', '2026-04-02 13:43:19', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('b02424f5-d95d-4bb4-9b64-94aa84f7f764', 'bench_car', '2026-04-02 13:43:27', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('b1c174c2-a5b8-4b99-ac95-d5129f4614a5', 'bench_car', '2026-03-20 23:21:25', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('b24905a0-5dc6-4d2a-bb24-173a56fd3592', 'bench_car', '2026-03-20 23:16:16', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('b263f272-1890-425d-be83-2f10f9882315', 'sim_car', '2026-03-20 23:17:04', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('b27eadde-245a-4a2a-8140-6afbddeb288f', 'bench_car', '2026-04-01 13:06:23', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('b29f968c-6d7e-407c-aab8-1d2ad027679b', 'bench_car', '2026-04-02 13:43:37', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('b3694db7-88a6-488a-a79e-4aadcb471712', 'bench_car', '2026-04-01 13:06:41', NULL, 1, 39, 39, 0, 0, 1, 1, 0, 0, 100),
('b413f493-e008-4226-bc6a-8128abe7c873', 'bench_car', '2026-03-20 23:21:24', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('b513f9b3-8900-4783-b076-583424a1914b', 'sim_car', '2026-04-02 13:44:01', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('b549172e-b7f1-43f0-9908-1c7f39496353', 'bench_car', '2026-04-01 13:06:29', NULL, 1, 9.8, 9.8, 0, 0, 0, 1, 0, 0, 100),
('b5c1d848-0636-44f5-9a76-3ce0b7efdb74', 'demo-vehicle-001', '2026-03-11 00:21:48', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('b5f51b29-7be1-47c5-a37b-b9976c1a1d89', 'demo-vehicle-001', '2026-05-04 16:26:33', NULL, 1, 50, 50, 0, 0, 1, 1, 0, 0, 100),
('b6783739-24e0-4b99-b9f5-df6852a95ea2', 'demo-vehicle-001', '2026-04-25 19:48:44', NULL, 1, 0, 0, 0, 0, 0, 13, 0, 0, 100),
('b6efda9f-1c4f-4ec4-8ff6-b07c3af6bf1f', 'bench_car', '2026-04-01 13:06:45', NULL, 1, 9.8, 9.8, 0, 0, 0, 1, 0, 0, 100),
('b70c8697-d513-4934-9838-48f45ac5afa1', 'demo-vehicle', '2026-03-11 00:21:16', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('b930e7ab-f34f-4971-a3c0-26d1aaba8120', 'bench_car', '2026-03-20 23:20:55', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('b94dad23-c376-4849-8078-f8db2f5182f8', 'sim_car', '2026-05-20 07:51:53', NULL, 1, 32, 32, 0, 0, 0, 1, 0, 0, 100),
('b95691fc-37b0-494c-9a32-744c5ed5e753', 'bench_car', '2026-04-01 13:06:33', NULL, 1, 10.2, 10.2, 0, 0, 0, 1, 0, 0, 100),
('ba39a2b4-fc40-40e0-91b6-0a0313e45ae1', 'sim_car', '2026-03-20 23:17:16', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('ba92b7d9-2aa8-4671-9f01-df8c7aa5f41c', 'bench_car', '2026-03-20 23:21:01', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('bb396d5b-0646-4148-9a50-21b2090c5112', 'demo-vehicle-001', '2026-03-11 00:21:55', NULL, 1, 0, 0, 0, 0, 0, 2, 0, 0, 100),
('bcbc6557-2f4e-4a78-980c-a0509e3fe584', 'sim_car', '2026-03-20 23:17:10', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('bd6c8e8d-76ec-4015-9887-0eeea79e09e1', 'sim_car', '2026-03-20 23:17:23', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('bd959b02-9035-40de-bf9f-e4c2c982f885', 'demo-vehicle-001', '2026-03-18 14:27:18', NULL, 1, 3, 3, 0, 0, 0, 1, 0, 0, 100),
('be55fffa-0b0a-4f08-9a9a-266aee9320f8', 'bench_car', '2026-03-20 23:20:58', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('c065b120-d06d-4d35-a204-44017fd9ff45', 'bench_car', '2026-03-20 23:16:09', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('c1eb0f32-f8bc-48fd-969a-fd5d4a97c111', 'bench_car', '2026-03-20 23:16:02', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('c1edb566-bdb7-46b7-825e-13c5f860dcf4', 'sim_car', '2026-03-20 23:21:23', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('c233838f-a354-4581-8705-73b297cde5b5', 'sim_car', '2026-03-20 23:18:09', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('c33f7be6-05bc-42ba-9d03-ff14c0b26e4e', 'sim_car', '2026-03-20 23:16:56', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('c45278d8-0b8c-4340-a04b-8640391e56eb', 'bench_car', '2026-03-20 23:16:34', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('c4d3c3bb-7e13-48da-a0c2-e1ab1ac8933f', 'demo-vehicle-001', '2026-04-04 11:23:51', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('c524ac09-a984-4ecb-8b3d-257969f2c46c', 'demo-vehicle-001', '2026-05-04 16:26:35', NULL, 1, 30.5, 30.5, 0, 0, 0, 1, 0, 0, 100),
('c763e8d7-7bf2-426f-9eed-fea0f691def9', 'bench_car', '2026-03-20 23:21:30', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('c7c569ff-01f9-4eba-b5f5-0cc93966c3aa', 'sim_car', '2026-03-20 23:17:29', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('c8211b06-b433-43cc-b804-9ae26c1b479f', 'demo-vehicle-001', '2026-03-16 23:49:26', NULL, 1, 0, 0, 0, 0, 0, 21, 0, 0, 100),
('c834fcc7-7367-430a-8497-d852bf4d5257', 'bench_car', '2026-03-20 23:16:15', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('c887227c-3511-40e6-9b54-2ef8905035b2', 'bench_car', '2026-04-02 13:43:24', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('c89196f2-83a2-47d6-b06c-1c868f52acb4', 'demo-vehicle-001', '2026-03-11 00:21:50', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('c97f02b0-9258-4b2d-b9fe-5545797b9b22', 'demo-vehicle-001', '2026-05-10 23:04:57', NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 100),
('ca4c7152-b376-4116-8ca3-b1a20f3af163', 'demo-vehicle-001', '2026-05-10 23:07:11', NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 100),
('caa7efc6-a32b-4280-8459-cfc6fa48d1d0', 'bench_car', '2026-03-20 23:16:03', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('cae358de-3cc0-47d9-ab4c-55df55979d91', 'demo-vehicle-001', '2026-03-17 23:35:10', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('caebc216-944b-47dc-b322-a738fb010c83', 'sim_car', '2026-03-20 23:17:19', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('cbda6fa4-647e-4928-ade0-8570df23b513', 'bench_car', '2026-03-20 23:16:13', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('cbfa745b-3686-4368-b1f2-a88c96effcb7', 'bench_car', '2026-04-02 13:43:38', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('cc925e3e-304f-42f8-9e67-31249779af55', 'demo-vehicle-001', '2026-05-10 23:13:34', NULL, 1, 2.48333, 6.9, 0, 0, 0, 6, 0, 0, 100),
('cd266621-1be6-47af-915b-0f9e2ca117b9', 'bench_car', '2026-04-02 13:43:19', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('cd35288d-3e99-49da-94dc-b2664a26e271', 'sim_car', '2026-04-02 13:44:08', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('cd41ef54-9e82-4c86-afa3-9faaf9cdf569', 'sim_car', '2026-05-20 07:51:43', NULL, 1, 32, 32, 0, 0, 0, 1, 0, 0, 100),
('ce2d79f9-1732-421c-bca8-1a98edfd9fca', 'demo-vehicle-001', '2026-03-11 00:21:53', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('ce6a6759-0e02-4c0b-8a0d-0123aab1183e', 'sim_car', '2026-03-20 23:17:34', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('ceb0a840-02c0-4e90-ab66-d533dcd4567e', 'bench_car', '2026-03-20 23:16:19', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('d126f41c-cc14-4d41-9025-1e8dd4df6ed6', 'bench_car', '2026-04-02 13:43:44', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('d13ea526-d191-4deb-b387-ccf8ac99c2d4', 'sim_car', '2026-04-02 13:44:02', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('d14b58c9-5f66-473b-90ee-eb73f7f2b3ea', 'sim_car', '2026-05-20 07:51:50', NULL, 1, 32, 32, 0, 0, 0, 1, 0, 0, 100),
('d155a1e2-5cfc-48f2-8764-55ac0446b97e', 'bench_car', '2026-03-20 23:21:25', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('d194b8de-c4da-4297-827f-0a8528729dc3', 'bench_car', '2026-04-02 13:43:33', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('d2d25486-c9bf-44e2-847f-20e15c889e76', 'sim_car', '2026-04-02 13:44:20', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('d33ad057-d3a4-4efc-9dec-42b866df719b', 'bench_car', '2026-03-20 23:21:14', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('d3a41716-ddc7-415b-99af-deb7a5be3f43', 'bench_car', '2026-03-20 23:20:54', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('d4df342b-8dbb-466e-a5ab-653df46232b0', 'bench_car', '2026-03-20 23:16:29', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('d528eade-0c6b-4628-9d86-244fa7b61139', 'sim_car', '2026-03-20 23:21:08', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('d53c466c-fde3-475c-a48b-6b62e938739a', 'demo-vehicle-001', '2026-03-16 23:47:38', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('d7c761ee-1bf4-43ab-aa29-2c710badf1c7', 'sim_car', '2026-03-20 23:18:00', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('d7eeaa47-4969-4afa-830c-26abad21553a', 'demo-vehicle-001', '2026-03-18 14:27:18', NULL, 1, 3, 3, 0, 0, 0, 1, 0, 0, 100),
('d7fc8635-f455-4fb9-b11d-08e28d693a69', 'bench_car', '2026-04-02 13:43:44', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('d8014c8e-5bd9-4a9c-8bc0-1d76c55226d1', 'demo-vehicle-001', '2026-05-10 23:13:53', NULL, 1, 0.6, 0.6, 0, 0, 0, 1, 0, 0, 100),
('d8650ef4-9676-4630-88ca-994690fc5d5b', 'bench_car', '2026-04-02 13:43:43', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('da021148-f2c5-45f7-a593-667636ae724b', 'demo-vehicle-001', '2026-05-10 23:16:11', NULL, 1, 0.2, 0.2, 0, 0, 0, 1, 0, 0, 100),
('da19619c-afbf-4ccf-adbe-aead982a3111', 'bench_car', '2026-03-20 23:21:03', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('db013482-1961-4b0b-88c0-b85e9544b43a', 'demo-vehicle-001', '2026-05-10 23:07:20', NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 100),
('db46bdac-cf79-490c-8faf-1ca0763557ae', 'bench_car', '2026-03-20 23:21:30', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('dc0cc52b-b4e4-4fdc-a4cd-59ef871e7858', 'demo-vehicle-001', '2026-03-18 14:37:43', '2026-03-18 14:37:46', 0, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('dc7080a4-a498-4631-81a0-3a54ce13d348', 'demo-vehicle-001', '2026-03-16 23:29:28', NULL, 1, 0, 0, 0, 0, 0, 21, 0, 0, 100),
('dcc31ebc-6a63-4747-aab5-d35d72b966ae', 'sim_car', '2026-03-20 23:17:58', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('ddf8d947-0fc7-4e34-8efc-51cb62d99293', 'demo-vehicle-001', '2026-05-06 14:25:12', NULL, 1, 28, 28, 0, 0, 0, 1, 0, 0, 100),
('de202f5f-4298-4f36-bf05-803e525502ce', 'sim_car', '2026-03-20 23:17:12', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('de2fdb36-da99-45b9-b22d-46493f39641b', 'demo-vehicle-001', '2026-04-02 23:15:13', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('de4f145f-ceb8-491f-afb9-f1dbee8cbf06', 'demo-vehicle-001', '2026-03-18 14:27:20', NULL, 1, 7.94489, 12, 0, 0, 0, 49, 0, 0, 100),
('de962eba-1bce-49a6-b0dd-ba465a20422d', 'demo-vehicle-001', '2026-05-06 14:26:03', NULL, 1, 27.8, 27.8, 0, 0, 0, 1, 0, 0, 100),
('e0981ba4-a828-4e42-80a4-37b3ed081098', 'bench_car', '2026-03-20 23:16:22', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('e09c04b3-2db0-451f-8990-457fca317ef3', 'sim_car', '2026-04-02 13:43:59', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('e168189c-330d-453e-8b33-1365b91989fc', 'bench_car', '2026-03-20 23:21:33', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('e187f9c7-e70b-4ca8-817b-208fe0ab2a6d', 'demo-vehicle-001', '2026-03-11 00:21:47', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('e1bf0f89-ec03-4743-ab81-33649e57991d', 'demo-vehicle-001', '2026-05-10 23:04:52', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('e221a31b-0809-4aef-8b7f-8b6ebce4b2d8', 'bench_car', '2026-03-20 23:16:07', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('e2c29389-1981-4bf2-93db-4600e6e9d3f8', 'demo-vehicle-001', '2026-05-10 23:04:52', NULL, 1, 0.8, 0.8, 0, 0, 0, 1, 0, 0, 100),
('e2ce66f8-13c7-408f-b768-f4a7e67e3430', 'demo-vehicle-001', '2026-03-17 23:36:33', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('e363c428-12f0-4ff9-811d-ead4709debb9', 'sim_car', '2026-03-20 23:17:36', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('e3fadd13-8ec0-4dc0-a446-f53db2686df0', 'sim_car', '2026-04-02 13:44:17', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('e4030936-ef8f-403d-901b-7e96500b6906', 'bench_car', '2026-04-01 13:06:26', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('e70c700b-3b83-4e92-aa6f-3a64e73b9b8e', 'bench_car', '2026-03-20 23:16:10', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('e719ed15-5523-4052-b533-cbc39ccc95be', 'sim_car', '2026-03-20 23:17:02', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('e7ca2fa8-9da6-48d8-bfa4-50b52d755a8d', 'demo-vehicle-001', '2026-03-11 00:21:57', NULL, 1, 0, 0, 0, 0, 0, 3, 0, 0, 100),
('e84684b5-ffa2-4131-945f-267f3de996e4', 'bench_car', '2026-04-02 13:43:39', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('e86a586e-3e7f-4751-b36a-2a83db1a833e', 'demo-vehicle-001', '2026-03-11 00:21:46', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('e908e929-74b7-40dd-9a33-1203091240d4', 'demo-vehicle-001', '2026-05-04 16:13:28', '2026-05-04 16:14:30', 0, 39.1445, 49.5, 0, 0, 13, 18, 0, 0, 100),
('e9a6aa57-e038-4d47-8b56-e7f7bc80d8ff', 'sim_car', '2026-03-20 23:17:18', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('ea212e60-cb01-49cf-9a80-9e2f87aa872e', 'demo-vehicle-001', '2026-04-02 23:26:37', NULL, 1, 0, 0, 0, 0, 0, 74, 0, 0, 100),
('eb1bb843-bb5e-49f5-a1a6-301115919ce0', 'sim_car', '2026-05-20 07:51:42', NULL, 1, 32, 32, 0, 0, 0, 1, 0, 0, 100),
('ebfbade9-3a7a-4ffe-91a4-e003b2e173eb', 'demo-vehicle-001', '2026-05-04 16:23:56', '2026-05-04 16:26:27', 0, 31.708, 47.9, 0, 0, 5, 49, 0, 0, 100),
('ed374e68-0d9d-45d9-b531-c84c3c33808d', 'demo-vehicle-001', '2026-04-04 11:23:50', NULL, 1, 0, 0, 0, 0, 0, 3, 0, 0, 100),
('edcabd8a-4f45-482f-90e3-587b55dd779c', 'bench_car', '2026-03-20 23:21:00', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('ee18eb14-9dea-4fbc-a217-3309a72d428e', 'bench_car', '2026-04-01 13:06:19', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('ee9a515c-75cb-4059-81ca-75ca2f022e86', 'sim_car', '2026-03-20 23:17:04', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('f02210d2-c099-4e9b-9bcb-088f6b8c3d5a', 'bench_car', '2026-03-20 23:16:08', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('f04d1343-e872-4386-91e0-12a6099e0157', 'sim_car', '2026-03-20 23:21:35', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('f105b389-d1ca-45e8-b6a9-7cd590fbd3a2', 'bench_car', '2026-04-01 13:06:24', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('f10d5e03-2ecf-4a88-8314-f038a33af206', 'demo-vehicle-001', '2026-05-10 23:16:07', NULL, 1, 1.6, 1.6, 0, 0, 0, 1, 0, 0, 100),
('f17a923e-6ee6-4907-b6ea-1d9141765b93', 'bench_car', '2026-04-01 13:06:14', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('f26320fd-2105-49a9-b6a3-1bea62cf49a5', 'sim_car', '2026-03-20 23:21:21', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('f2cef211-c625-40bf-a0eb-94e44e1d0c7d', 'demo-vehicle-001', '2026-04-23 05:35:25', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('f2e6a079-dda1-4ea5-b59c-b5bb28fc962d', 'demo-vehicle-001', '2026-05-04 16:23:54', NULL, 1, 30, 30, 0, 0, 0, 1, 0, 0, 100),
('f30c9b49-3062-4020-a831-0257d1c1909f', 'bench_car', '2026-04-02 13:43:21', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('f38f7c46-8608-49b0-8a2e-11f9afd783ae', 'sim_car', '2026-03-20 23:17:21', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('f416e5d1-2796-4d5b-9ba7-92f4ffa494cc', 'demo-vehicle-001', '2026-05-10 23:07:50', NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 100),
('f4580f74-a316-45c7-967e-c19ff2113ca5', 'demo-vehicle-001', '2026-03-11 00:22:20', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('f471df5e-b251-49e9-9454-fcb4111ce35f', 'bench_car', '2026-03-20 23:21:04', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('f48df6ce-ea0c-4ac3-a225-b359ab8ddc5e', 'bench_car', '2026-04-01 13:06:32', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('f4fca559-baf9-4e0b-9622-26cb0409664c', 'sim_car', '2026-03-20 23:17:32', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('f545cb48-437f-4a51-94f4-bbf80cf0af0a', 'bench_car', '2026-04-01 13:06:43', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('f5641b1a-7b02-4ce3-bdbd-87955b76662f', 'sim_car', '2026-03-20 23:18:02', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('f6032e74-5e60-4630-a1a8-1f5598e5f85c', 'demo-vehicle-001', '2026-05-06 14:25:16', NULL, 1, 27.8667, 29.4, 0, 0, 0, 6, 0, 0, 100),
('f63069be-e613-4b03-8b4e-47a290293de3', 'demo-vehicle-001', '2026-03-17 00:04:19', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('f7410cf4-c3bc-4546-b630-b37efd9bb97e', 'demo-vehicle-001', '2026-03-11 00:21:51', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('f7eb7560-d3ec-4725-b0dd-9d6917224d2f', 'sim_car', '2026-03-20 23:16:54', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('f80ae115-9dbd-473e-a577-9cb1659109aa', 'bench_car', '2026-03-20 23:16:24', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('f8631845-29fa-44a1-8c63-5cc78174ea68', 'bench_car', '2026-04-01 13:06:20', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('f87c03ec-6921-41f8-bcea-286638aeaba1', 'demo-vehicle-001', '2026-05-10 23:07:10', NULL, 1, 0.18, 0.4, 0, 0, 0, 5, 0, 0, 100),
('f9591b4b-f583-434b-a11c-3cc27aa9a75a', 'bench_car', '2026-04-02 13:43:41', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('fa76aa60-f1ed-44bb-bb19-1616680dcedb', 'bench_car', '2026-03-20 23:21:23', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('fc7a1ac3-7f25-4cf7-ae57-89e393c67f66', 'sim_car', '2026-04-02 13:44:14', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('fc7f5eb5-6eb4-4775-a901-360e95ba4c1b', 'sim_car', '2026-03-20 23:18:11', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('fcceed72-3117-4b65-86a5-2cfe2e8de3c6', 'sim_car', '2026-05-20 07:51:44', NULL, 1, 32, 32, 0, 0, 0, 1, 0, 0, 100),
('fd920da0-8f00-4e2d-b922-427757feecef', 'demo-vehicle-001', '2026-03-18 14:37:46', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('fe76ab56-880a-4158-a162-9ea77329f953', 'bench_car', '2026-03-20 23:16:31', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100);
INSERT INTO `trips` (`id`, `vehicle_id`, `start_time`, `end_time`, `is_active`, `avg_risk_score`, `max_risk_score`, `total_distance_km`, `red_alert_count`, `yellow_alert_count`, `point_count`, `hard_brake_count`, `harsh_corner_count`, `safety_score`) VALUES
('ff79fdf9-03c0-47fc-8052-b5647a31a17d', 'sim_car', '2026-03-20 23:17:49', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('ffa76c66-1e20-446c-9921-9248dea5684c', 'sim_car', '2026-03-20 23:17:08', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100),
('ffda2e48-90f6-4974-8ad5-a5944d39884f', 'demo-vehicle-001', '2026-04-04 11:23:53', NULL, 1, 0, 0, 0, 0, 0, 1, 0, 0, 100);

-- --------------------------------------------------------

--
-- Table structure for table `trip_history`
--

CREATE TABLE `trip_history` (
  `id` int(11) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `duration_seconds` int(11) NOT NULL,
  `distance_km` float NOT NULL,
  `max_risk` float NOT NULL,
  `avg_risk` float NOT NULL,
  `safety_score` float NOT NULL,
  `start_location` varchar(100) DEFAULT NULL,
  `end_location` varchar(100) DEFAULT NULL,
  `risk_events_count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trip_history`
--

INSERT INTO `trip_history` (`id`, `start_time`, `end_time`, `duration_seconds`, `distance_km`, `max_risk`, `avg_risk`, `safety_score`, `start_location`, `end_location`, `risk_events_count`) VALUES
(1, '2026-02-24 23:21:23', '2026-02-24 23:25:01', 217, 0, 0, 0, 100, NULL, NULL, 0),
(2, '2026-02-24 23:21:23', '2026-02-24 23:25:03', 219, 0, 0, 0, 100, NULL, NULL, 0),
(3, '2026-02-24 23:32:53', '2026-02-24 23:40:48', 474, 1.33932, 50, 49.0899, 26.3652, NULL, NULL, 0),
(4, '2026-03-01 20:31:04', '2026-03-01 20:44:24', 800, 0.178907, 33.2, 31.3102, 53.0347, NULL, NULL, 0),
(5, '2026-03-04 13:05:56', '2026-03-04 13:07:24', 87, 0.073481, 20.3, 17.6016, 73.5976, NULL, NULL, 0),
(6, '2026-03-05 14:38:16', '2026-03-05 14:39:48', 92, 0.130942, 20.8, 18.4962, 72.2558, NULL, NULL, 0),
(7, '2026-03-05 14:40:09', '2026-03-05 14:42:56', 167, 0.466288, 20.8, 16.0554, 75.9169, NULL, NULL, 0),
(8, '2026-03-10 23:22:57', '2026-03-10 23:23:38', 40, 0.0163857, 13.4, 7.65, 88.525, NULL, NULL, 0),
(9, '2026-03-14 10:15:06', '2026-03-14 10:17:39', 153, 0.0217305, 15, 15, 77.5, NULL, NULL, 0),
(10, '2026-03-14 10:15:06', '2026-03-14 10:17:54', 167, 0.0217305, 15, 15, 77.5, NULL, NULL, 0),
(11, '2026-03-16 22:53:48', '2026-03-16 22:53:54', 6, 0.0604934, 15, 15, 77.5, NULL, NULL, 0),
(12, '2026-04-23 05:54:11', '2026-04-23 06:20:31', 1579, 0.0650224, 15, 14.4778, 78.2832, NULL, NULL, 0),
(13, '2026-04-23 05:54:11', '2026-04-23 11:57:31', 21799, 0.0975336, 15, 14.4783, 78.2825, NULL, NULL, 0),
(14, '2026-04-25 20:19:08', '2026-04-25 20:34:45', 937, 0.408495, 31.6, 18.7912, 71.8133, NULL, NULL, 0),
(15, '2026-04-25 20:38:59', '2026-04-25 20:39:34', 34, 0.0945004, 29.9, 17.4053, 73.8921, NULL, NULL, 0),
(16, '2026-04-25 20:38:59', '2026-04-25 20:40:07', 68, 0.0945004, 29.9, 17.4053, 73.8921, NULL, NULL, 0),
(17, '2026-05-06 17:49:42', '2026-05-06 17:52:04', 142, 0.125474, 18.2, 1.76027, 97.3596, NULL, NULL, 0),
(18, '2026-05-06 17:49:42', '2026-05-06 17:52:05', 143, 0.125474, 18.2, 1.76027, 97.3596, NULL, NULL, 0),
(19, '2026-05-06 17:52:08', '2026-05-06 18:24:25', 1937, 0.518622, 50, 46.5513, 30.173, NULL, NULL, 0),
(20, '2026-05-06 17:52:08', '2026-05-06 18:24:26', 1938, 0.57479, 50, 46.5538, 30.1693, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `trip_reactions`
--

CREATE TABLE `trip_reactions` (
  `id` int(11) NOT NULL,
  `user_id` varchar(36) NOT NULL,
  `shared_trip_id` int(11) NOT NULL,
  `reaction_type` varchar(20) NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trip_reactions`
--

INSERT INTO `trip_reactions` (`id`, `user_id`, `shared_trip_id`, `reaction_type`, `created_at`) VALUES
(1, 'demo-user-001', 1, 'good_drive', '2026-04-28 23:23:23'),
(2, 'demo-user-001', 1, 'like', '2026-04-28 23:23:26'),
(3, 'demo-user-001', 1, 'warning', '2026-04-28 23:23:33');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` varchar(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `avatar_color` varchar(7) DEFAULT '#00E676',
  `bio` varchar(255) DEFAULT '',
  `safety_score` float DEFAULT 100,
  `total_trips` int(11) DEFAULT 0,
  `total_distance_km` float DEFAULT 0,
  `xp_points` int(11) DEFAULT 0,
  `driver_level` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `created_at`, `avatar_color`, `bio`, `safety_score`, `total_trips`, `total_distance_km`, `xp_points`, `driver_level`) VALUES
('benchmarker', 'DriveGuard User', 'benchmarker@driveguard.app', '2026-03-20 23:16:01', '#00E676', '', 100, 0, 0, 0, 1),
('c40ebb2b-0939-428f-8011-d3c9524d29e5', 'Savindu', 'savindunipun09@gmail.com', '2026-05-04 13:12:55', '#00E676', '', 100, 0, 0, 0, 1),
('demo', 'DriveGuard User', 'demo@driveguard.app', '2026-03-11 00:21:16', '#00E676', '', 100, 0, 0, 0, 1),
('demo-user-001', 'DriveGuard User', 'demo-user-001@driveguard.app', '2026-03-11 00:21:46', '#00E676', '', 87.75, 4, 0, 5, 1),
('e68d6a6d-c1a7-47af-9c19-240ef7b63b8e', 'Savindu', 'savindunipun30@gmail.com', '2026-05-06 14:17:50', '#00E676', '', 100, 0, 0, 0, 1),
('sim_user', 'DriveGuard User', 'sim_user@driveguard.app', '2026-03-20 23:16:47', '#00E676', '', 100, 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_challenge_progress`
--

CREATE TABLE `user_challenge_progress` (
  `id` int(11) NOT NULL,
  `user_id` varchar(36) NOT NULL,
  `challenge_id` int(11) NOT NULL,
  `current_value` int(11) DEFAULT NULL,
  `completed` tinyint(1) DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  `joined_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_challenge_progress`
--

INSERT INTO `user_challenge_progress` (`id`, `user_id`, `challenge_id`, `current_value`, `completed`, `completed_at`, `joined_at`) VALUES
(1, 'demo-user-001', 3, 0, 0, NULL, '2026-04-28 23:40:13'),
(2, 'demo-user-001', 2, 0, 0, NULL, '2026-04-28 23:40:16');

-- --------------------------------------------------------

--
-- Table structure for table `user_follows`
--

CREATE TABLE `user_follows` (
  `id` int(11) NOT NULL,
  `follower_id` varchar(36) NOT NULL,
  `following_id` varchar(36) NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `id` varchar(36) NOT NULL,
  `user_id` varchar(36) NOT NULL,
  `make_model` varchar(255) NOT NULL,
  `vehicle_type` varchar(50) DEFAULT NULL,
  `led_stick_mac` varchar(17) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`id`, `user_id`, `make_model`, `vehicle_type`, `led_stick_mac`, `created_at`) VALUES
('18077886-783a-4e90-aa48-0f7859eb2fec', 'c40ebb2b-0939-428f-8011-d3c9524d29e5', 'Toyota Yaris', 'Car', NULL, '2026-05-04 13:13:04'),
('6a274dcc-2d4e-4159-ba2d-164169127737', 'e68d6a6d-c1a7-47af-9c19-240ef7b63b8e', 'Honda Dio', 'Motorcycle', NULL, '2026-05-06 14:18:07'),
('bench_car', 'benchmarker', 'Demo Vehicle', 'Car', NULL, '2026-03-20 23:16:01'),
('demo-vehicle', 'demo', 'Demo Vehicle', 'Car', NULL, '2026-03-11 00:21:16'),
('demo-vehicle-001', 'demo-user-001', 'Demo Vehicle', 'Car', NULL, '2026-03-11 00:21:46'),
('sim_car', 'sim_user', 'Demo Vehicle', 'Car', NULL, '2026-03-20 23:16:47');

-- --------------------------------------------------------

--
-- Table structure for table `wallets`
--

CREATE TABLE `wallets` (
  `user_id` varchar(36) NOT NULL,
  `license_no` varchar(50) DEFAULT NULL,
  `vehicle_classes` varchar(50) DEFAULT NULL,
  `license_dob` varchar(20) DEFAULT NULL,
  `blood_grp` varchar(5) DEFAULT NULL,
  `issue_date` varchar(20) DEFAULT NULL,
  `expiry_date` varchar(20) DEFAULT NULL,
  `license_pdf_url` text DEFAULT NULL,
  `nic_name` varchar(255) DEFAULT NULL,
  `nic_no` varchar(20) DEFAULT NULL,
  `nic_gender` varchar(10) DEFAULT NULL,
  `nic_pob` varchar(100) DEFAULT NULL,
  `nic_pdf_url` text DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accident_reports`
--
ALTER TABLE `accident_reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_reports_location` (`latitude`,`longitude`);

--
-- Indexes for table `blackspot_reports`
--
ALTER TABLE `blackspot_reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `community_posts`
--
ALTER TABLE `community_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `crowdsourced_signs`
--
ALTER TABLE `crowdsourced_signs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `driving_challenges`
--
ALTER TABLE `driving_challenges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emergency_profiles`
--
ALTER TABLE `emergency_profiles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `group_members`
--
ALTER TABLE `group_members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `insurance_claims`
--
ALTER TABLE `insurance_claims`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `vehicle_id` (`vehicle_id`),
  ADD KEY `trip_id` (`trip_id`);

--
-- Indexes for table `live_trip_sessions`
--
ALTER TABLE `live_trip_sessions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `share_code` (`share_code`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `trip_id` (`trip_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `permanent_hotspots`
--
ALTER TABLE `permanent_hotspots`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_hotspots_location` (`latitude`,`longitude`);

--
-- Indexes for table `quick_hazard_alerts`
--
ALTER TABLE `quick_hazard_alerts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `ride_groups`
--
ALTER TABLE `ride_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `invite_code` (`invite_code`);

--
-- Indexes for table `shared_routes`
--
ALTER TABLE `shared_routes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `shared_trips`
--
ALTER TABLE `shared_trips`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `trip_id` (`trip_id`);

--
-- Indexes for table `telemetry_points`
--
ALTER TABLE `telemetry_points`
  ADD PRIMARY KEY (`id`),
  ADD KEY `trip_id` (`trip_id`);

--
-- Indexes for table `trips`
--
ALTER TABLE `trips`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vehicle_id` (`vehicle_id`);

--
-- Indexes for table `trip_history`
--
ALTER TABLE `trip_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trip_reactions`
--
ALTER TABLE `trip_reactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `shared_trip_id` (`shared_trip_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_challenge_progress`
--
ALTER TABLE `user_challenge_progress`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `challenge_id` (`challenge_id`);

--
-- Indexes for table `user_follows`
--
ALTER TABLE `user_follows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `follower_id` (`follower_id`),
  ADD KEY `following_id` (`following_id`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `wallets`
--
ALTER TABLE `wallets`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accident_reports`
--
ALTER TABLE `accident_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blackspot_reports`
--
ALTER TABLE `blackspot_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `community_posts`
--
ALTER TABLE `community_posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crowdsourced_signs`
--
ALTER TABLE `crowdsourced_signs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `driving_challenges`
--
ALTER TABLE `driving_challenges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `emergency_profiles`
--
ALTER TABLE `emergency_profiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `group_members`
--
ALTER TABLE `group_members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `live_trip_sessions`
--
ALTER TABLE `live_trip_sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `permanent_hotspots`
--
ALTER TABLE `permanent_hotspots`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `quick_hazard_alerts`
--
ALTER TABLE `quick_hazard_alerts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ride_groups`
--
ALTER TABLE `ride_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shared_routes`
--
ALTER TABLE `shared_routes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shared_trips`
--
ALTER TABLE `shared_trips`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `telemetry_points`
--
ALTER TABLE `telemetry_points`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2096;

--
-- AUTO_INCREMENT for table `trip_history`
--
ALTER TABLE `trip_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `trip_reactions`
--
ALTER TABLE `trip_reactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_challenge_progress`
--
ALTER TABLE `user_challenge_progress`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_follows`
--
ALTER TABLE `user_follows`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blackspot_reports`
--
ALTER TABLE `blackspot_reports`
  ADD CONSTRAINT `blackspot_reports_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `community_posts`
--
ALTER TABLE `community_posts`
  ADD CONSTRAINT `community_posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `emergency_profiles`
--
ALTER TABLE `emergency_profiles`
  ADD CONSTRAINT `emergency_profiles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `group_members`
--
ALTER TABLE `group_members`
  ADD CONSTRAINT `group_members_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `ride_groups` (`id`),
  ADD CONSTRAINT `group_members_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `insurance_claims`
--
ALTER TABLE `insurance_claims`
  ADD CONSTRAINT `insurance_claims_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `insurance_claims_ibfk_2` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`id`),
  ADD CONSTRAINT `insurance_claims_ibfk_3` FOREIGN KEY (`trip_id`) REFERENCES `trips` (`id`);

--
-- Constraints for table `live_trip_sessions`
--
ALTER TABLE `live_trip_sessions`
  ADD CONSTRAINT `live_trip_sessions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `live_trip_sessions_ibfk_2` FOREIGN KEY (`trip_id`) REFERENCES `trips` (`id`);

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `quick_hazard_alerts`
--
ALTER TABLE `quick_hazard_alerts`
  ADD CONSTRAINT `quick_hazard_alerts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `shared_routes`
--
ALTER TABLE `shared_routes`
  ADD CONSTRAINT `shared_routes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `shared_trips`
--
ALTER TABLE `shared_trips`
  ADD CONSTRAINT `shared_trips_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `shared_trips_ibfk_2` FOREIGN KEY (`trip_id`) REFERENCES `trips` (`id`);

--
-- Constraints for table `telemetry_points`
--
ALTER TABLE `telemetry_points`
  ADD CONSTRAINT `telemetry_points_ibfk_1` FOREIGN KEY (`trip_id`) REFERENCES `trips` (`id`);

--
-- Constraints for table `trips`
--
ALTER TABLE `trips`
  ADD CONSTRAINT `trips_ibfk_1` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`id`);

--
-- Constraints for table `trip_reactions`
--
ALTER TABLE `trip_reactions`
  ADD CONSTRAINT `trip_reactions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `trip_reactions_ibfk_2` FOREIGN KEY (`shared_trip_id`) REFERENCES `shared_trips` (`id`);

--
-- Constraints for table `user_challenge_progress`
--
ALTER TABLE `user_challenge_progress`
  ADD CONSTRAINT `user_challenge_progress_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `user_challenge_progress_ibfk_2` FOREIGN KEY (`challenge_id`) REFERENCES `driving_challenges` (`id`);

--
-- Constraints for table `user_follows`
--
ALTER TABLE `user_follows`
  ADD CONSTRAINT `user_follows_ibfk_1` FOREIGN KEY (`follower_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `user_follows_ibfk_2` FOREIGN KEY (`following_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD CONSTRAINT `vehicles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `wallets`
--
ALTER TABLE `wallets`
  ADD CONSTRAINT `wallets_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
