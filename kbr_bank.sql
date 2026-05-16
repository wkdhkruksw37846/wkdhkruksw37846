-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 06, 2026 at 01:11 PM
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
-- Database: `kbr_bank`
--

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `type` enum('info','success','warning','error','account') DEFAULT 'info',
  `category` enum('transaction','account_status','security','system') DEFAULT 'system',
  `is_read` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `title`, `message`, `type`, `category`, `is_read`, `created_at`) VALUES
(1, 2, '', 'Deposit of ৳100 successful', 'info', 'system', 1, '2026-04-12 18:04:31'),
(2, 2, '', 'Deposit of ৳10000000 successful', 'info', 'system', 1, '2026-04-12 19:33:06'),
(3, 2, '', 'Deposit of ৳10 successful', 'info', 'system', 1, '2026-04-12 19:47:43'),
(4, 2, 'Deposit Successful', '৳10 deposited via undefined. TXN: TXN202626718611', 'success', 'transaction', 1, '2026-04-12 20:31:46'),
(5, 2, 'Withdrawal Successful', '৳10 withdrawn via undefined. TXN: TXN202655022212', 'success', 'transaction', 1, '2026-04-12 21:20:39'),
(6, 2, 'Withdrawal Successful', '৳10 withdrawn via internal. TXN: TXN202693912113', 'success', 'transaction', 1, '2026-04-12 21:23:38'),
(7, 2, 'Transfer Sent', '৳10 sent to ACC20262745683. TXN: TXN202645296514', 'success', 'transaction', 1, '2026-04-12 21:49:46'),
(8, 3, 'Money Received', '৳10 received from ACC20261884302. TXN: TXN202645296514', 'success', 'transaction', 1, '2026-04-12 21:49:46'),
(9, 3, 'Deposit Successful', '৳100000 deposited via internal. TXN: TXN202660748415', 'success', 'transaction', 1, '2026-04-12 21:54:19'),
(10, 3, 'Transfer Sent', '৳300 sent to ACC20261884302. TXN: TXN202668465716', 'success', 'transaction', 1, '2026-04-12 21:54:29'),
(11, 2, 'Money Received', '৳300 received from ACC20262745683. TXN: TXN202668465716', 'success', 'transaction', 1, '2026-04-12 21:54:29'),
(12, 2, 'Deposit Successful', '৳100 deposited via internal. TXN: TXN202628870917', 'success', 'transaction', 1, '2026-04-13 13:21:28'),
(13, 2, 'Withdrawal Successful', '৳500 withdrawn via internal. TXN: TXN202649862518', 'success', 'transaction', 1, '2026-04-13 13:21:51'),
(14, 4, 'Deposit Successful', '৳1650 deposited via internal. TXN: TXN202640136119', 'success', 'transaction', 1, '2026-04-13 14:09:09'),
(15, 4, 'Transfer Sent', '৳100 sent to ACC20261884302. TXN: TXN202688430820', 'success', 'transaction', 0, '2026-04-13 14:18:49'),
(16, 2, 'Money Received', '৳100 received from ACC20262760284. TXN: TXN202688430820', 'success', 'transaction', 1, '2026-04-13 14:18:49'),
(17, 2, 'Transfer Sent', '৳100 sent to ACC20262745683. TXN: TXN202658400721', 'success', 'transaction', 0, '2026-04-13 14:31:34'),
(18, 3, 'Money Received', '৳100 received from ACC20261884302. TXN: TXN202658400721', 'success', 'transaction', 1, '2026-04-13 14:31:35'),
(19, 2, 'Deposit Successful', '৳100 deposited via internal. TXN: TXN202670230822', 'success', 'transaction', 0, '2026-04-13 14:33:01'),
(20, 4, 'Account Frozen', 'Your account has been frozen by admin.', '', 'account_status', 0, '2026-05-05 20:58:22'),
(21, 4, 'Account Unfrozen', 'Your account has been reactivated.', 'success', 'account_status', 0, '2026-05-05 20:58:26'),
(22, 4, 'Account Frozen', 'Your account has been frozen by admin.', '', 'account_status', 0, '2026-05-05 20:58:28'),
(23, 4, 'Account Unfrozen', 'Your account has been reactivated.', 'success', 'account_status', 0, '2026-05-05 20:58:34'),
(24, 5, 'Account Approved', 'Your account has been approved by admin.', 'success', 'account_status', 1, '2026-05-05 21:13:45');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `type` enum('transfer','deposit','withdrawal') NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `sender_user_id` int(11) DEFAULT NULL,
  `receiver_user_id` int(11) DEFAULT NULL,
  `sender_account` varchar(50) DEFAULT NULL,
  `receiver_account` varchar(50) DEFAULT NULL,
  `payment_method` enum('internal','bkash','nagad','rocket') DEFAULT 'internal',
  `reference` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` enum('success','pending','failed') DEFAULT 'success',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `type`, `amount`, `sender_user_id`, `receiver_user_id`, `sender_account`, `receiver_account`, `payment_method`, `reference`, `description`, `status`, `created_at`) VALUES
(1, 'deposit', 100.00, NULL, 2, NULL, NULL, 'internal', NULL, NULL, 'success', '2026-04-12 18:04:31'),
(3, 'deposit', 10.00, NULL, 2, NULL, NULL, 'internal', NULL, NULL, 'success', '2026-04-12 19:47:43'),
(5, 'deposit', 10.00, NULL, 2, NULL, 'ACC20261884302', NULL, 'TXN20268734665', NULL, 'success', '2026-04-12 19:56:00'),
(6, 'deposit', 100.00, NULL, 2, NULL, 'ACC20261884302', NULL, 'TXN20262988296', NULL, 'success', '2026-04-12 20:06:09'),
(7, 'deposit', 500.00, NULL, 2, NULL, 'ACC20261884302', NULL, 'TXN20267465997', NULL, 'success', '2026-04-12 20:07:40'),
(8, 'deposit', 0.01, NULL, 2, NULL, 'ACC20261884302', NULL, 'TXN20269197808', NULL, 'success', '2026-04-12 20:09:00'),
(9, 'deposit', 9.00, NULL, 2, NULL, 'ACC20261884302', NULL, 'TXN20266114709', NULL, 'success', '2026-04-12 20:10:46'),
(10, 'deposit', 1.00, NULL, 2, NULL, 'ACC20261884302', NULL, 'TXN202694538010', NULL, 'success', '2026-04-12 20:11:10'),
(11, 'deposit', 10.00, NULL, 2, NULL, 'ACC20261884302', NULL, 'TXN202626718611', NULL, 'success', '2026-04-12 20:31:46'),
(12, 'withdrawal', 10.00, 2, NULL, 'ACC20261884302', NULL, NULL, 'TXN202655022212', NULL, 'success', '2026-04-12 21:20:39'),
(13, 'withdrawal', 10.00, 2, NULL, 'ACC20261884302', NULL, 'internal', 'TXN202693912113', NULL, 'success', '2026-04-12 21:23:38'),
(14, 'transfer', 10.00, 2, 3, 'ACC20261884302', 'ACC20262745683', 'internal', 'TXN202645296514', NULL, 'success', '2026-04-12 21:49:46'),
(15, 'deposit', 100000.00, NULL, 3, NULL, 'ACC20262745683', 'internal', 'TXN202660748415', NULL, 'success', '2026-04-12 21:54:19'),
(16, 'transfer', 300.00, 3, 2, 'ACC20262745683', 'ACC20261884302', 'internal', 'TXN202668465716', NULL, 'success', '2026-04-12 21:54:29'),
(17, 'deposit', 100.00, NULL, 2, NULL, 'ACC20261884302', 'internal', 'TXN202628870917', NULL, 'success', '2026-04-13 13:21:28'),
(18, 'withdrawal', 500.00, 2, NULL, 'ACC20261884302', NULL, 'internal', 'TXN202649862518', NULL, 'success', '2026-04-13 13:21:51'),
(19, 'deposit', 1650.00, NULL, 4, NULL, 'ACC20262760284', 'internal', 'TXN202640136119', NULL, 'success', '2026-04-13 14:09:09'),
(20, 'transfer', 100.00, 4, 2, 'ACC20262760284', 'ACC20261884302', 'internal', 'TXN202688430820', NULL, 'success', '2026-04-13 14:18:49'),
(21, 'transfer', 100.00, 2, 3, 'ACC20261884302', 'ACC20262745683', 'internal', 'TXN202658400721', NULL, 'success', '2026-04-13 14:31:34'),
(22, 'deposit', 100.00, NULL, 2, NULL, 'ACC20261884302', 'internal', 'TXN202670230822', NULL, 'success', '2026-04-13 14:33:01');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `mobile_number` varchar(20) DEFAULT NULL,
  `nid` varchar(50) DEFAULT NULL,
  `account_number` varchar(50) DEFAULT NULL,
  `balance` decimal(12,2) DEFAULT 0.00,
  `role` enum('user','admin') DEFAULT 'user',
  `is_active` tinyint(1) DEFAULT 1,
  `account_status` enum('pending','approved','rejected','frozen') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `password`, `mobile_number`, `nid`, `account_number`, `balance`, `role`, `is_active`, `account_status`, `created_at`) VALUES
(2, 'Raiyan Hossain', 'raiyanhossain086@gmail.com', '$2b$10$XYFx51oRlKKAD/83qEFJb.4bExRdHSNjoakD8jVdtvo3vM3Dl0UR6', '01303268944', '123456789', 'ACC20261884302', 710.01, 'user', 1, 'approved', '2026-04-11 21:52:22'),
(3, 'Bisnu Dash', 'bisnudash102@gmail.com', '$2b$10$H.lq4PJ3NTLIS5gcd3Pa5OFb5mjGuR3Y9HoOBn7MVcSSMFF8vO6AC', '01400613070', '123456789', 'ACC20262745683', 99810.00, 'admin', 1, 'approved', '2026-04-12 21:46:06'),
(4, 'Bisnu Chandra Das', 'bisnububt102@gmail.com', '$2b$10$LHf3gWuM8.oUu042jSKVzOq20IEwaDKnjceKpnRLGzgoilPS51WpG', '01740468366', '20234203102', 'ACC20262760284', 1550.00, 'user', 1, 'approved', '2026-04-13 14:07:57'),
(5, 'Santa Islam', 'santaislam123@gmail.com', '$2b$10$IagHUV8zIPMOiLbhAs43gurw.BSd50BQqHKUsrbic/ZU0TH4Wc5Qm', '01799467583', '123456789', 'ACC20267183645', 0.00, 'user', 1, 'approved', '2026-05-05 21:13:10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
