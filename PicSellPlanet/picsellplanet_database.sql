-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 06, 2023 at 04:19 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `picsellplanet_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin_account`
--

CREATE TABLE `tbl_admin_account` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(120) NOT NULL,
  `admin_email` varchar(120) NOT NULL,
  `admin_type` varchar(120) NOT NULL,
  `admin_profile_image` varchar(255) NOT NULL,
  `admin_password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_admin_account`
--

INSERT INTO `tbl_admin_account` (`admin_id`, `admin_name`, `admin_email`, `admin_type`, `admin_profile_image`, `admin_password`) VALUES
(1, 'Administrator', 'admin@picsellplanet.com', 'Super Admin', 'IMG-63d7d2e1405f01.46025941.png', '$2y$10$RMuNP6UT1Uy.15dLYFUIBuWabOFhkYCZabC156Oa9oQm.0l8hTtOC');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cart`
--

CREATE TABLE `tbl_cart` (
  `cart_id` int(20) NOT NULL,
  `cart_quantity` int(255) NOT NULL,
  `cart_status` int(10) NOT NULL DEFAULT 0,
  `cart_date` datetime NOT NULL DEFAULT current_timestamp(),
  `user_id` int(20) NOT NULL,
  `product_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_feedback`
--

CREATE TABLE `tbl_feedback` (
  `feedback_id` int(20) NOT NULL,
  `feedback_rate` int(255) NOT NULL,
  `feedback_message` text NOT NULL,
  `feedback_date` datetime NOT NULL,
  `user_id` int(20) NOT NULL,
  `lensman_id` int(20) DEFAULT NULL,
  `service_id` int(20) DEFAULT NULL,
  `product_id` int(20) DEFAULT NULL,
  `feedback_archive_status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_messages`
--

CREATE TABLE `tbl_messages` (
  `message_id` int(20) NOT NULL,
  `message_content` text NOT NULL,
  `sender_id` int(10) NOT NULL,
  `receiver_id` int(10) NOT NULL,
  `message_status` int(10) DEFAULT 0,
  `message_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_messages_userlist`
--

CREATE TABLE `tbl_messages_userlist` (
  `userlist_id` int(20) NOT NULL,
  `sender_id` int(20) NOT NULL,
  `receiver_id` int(20) NOT NULL,
  `userlist_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_notification`
--

CREATE TABLE `tbl_notification` (
  `notification_id` int(20) NOT NULL,
  `notification_date` datetime NOT NULL,
  `notification_receiver` varchar(100) NOT NULL,
  `avail_pending` int(10) DEFAULT NULL,
  `avail_proceed_downpayment` int(10) DEFAULT NULL,
  `avail_confirmed` int(10) DEFAULT NULL,
  `avail_completed` int(10) DEFAULT NULL,
  `avail_cancelled` int(10) DEFAULT NULL,
  `avail_reschedule` int(10) DEFAULT NULL,
  `avail_downpayment_sent` int(10) DEFAULT NULL,
  `avail_reschedule_accepted` int(10) DEFAULT NULL,
  `avail_reschedule_rejected` int(10) DEFAULT NULL,
  `order_pending` int(10) DEFAULT NULL,
  `order_confirmed` int(10) DEFAULT NULL,
  `order_completed` int(10) DEFAULT NULL,
  `order_cancelled` int(10) DEFAULT NULL,
  `post_reported` int(10) DEFAULT NULL,
  `notification_status` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order`
--

CREATE TABLE `tbl_order` (
  `order_id` int(20) NOT NULL,
  `order_quantity` int(255) NOT NULL,
  `order_status` int(10) NOT NULL DEFAULT 0,
  `order_date` datetime NOT NULL DEFAULT current_timestamp(),
  `order_cancel_reason` text DEFAULT NULL,
  `user_id` int(20) NOT NULL,
  `product_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_post`
--

CREATE TABLE `tbl_post` (
  `post_id` int(10) NOT NULL,
  `post_content` text NOT NULL,
  `post_type` int(10) NOT NULL,
  `post_date` datetime NOT NULL,
  `user_id` int(10) NOT NULL,
  `post_archive_status` int(10) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_post_comments`
--

CREATE TABLE `tbl_post_comments` (
  `comment_id` int(30) NOT NULL,
  `comment_content` text NOT NULL,
  `comment_date` datetime NOT NULL,
  `post_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_post_likes`
--

CREATE TABLE `tbl_post_likes` (
  `like_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `post_id` int(10) NOT NULL,
  `liked_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product`
--

CREATE TABLE `tbl_product` (
  `product_id` int(20) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_price` int(255) NOT NULL,
  `product_stock` int(11) NOT NULL,
  `product_description` text NOT NULL,
  `product_banner` varchar(255) NOT NULL,
  `user_id` int(20) NOT NULL,
  `product_archive_status` int(10) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_reports`
--

CREATE TABLE `tbl_reports` (
  `report_id` int(20) NOT NULL,
  `report_reason` text NOT NULL,
  `report_date` datetime NOT NULL,
  `post_id` int(20) NOT NULL,
  `user_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_service_avail`
--

CREATE TABLE `tbl_service_avail` (
  `avail_id` int(20) NOT NULL,
  `avail_starting_date_time` datetime NOT NULL,
  `avail_ending_date_time` datetime DEFAULT NULL,
  `old_starting_date_time` datetime DEFAULT NULL,
  `old_ending_date_time` datetime DEFAULT NULL,
  `old_status` int(10) DEFAULT NULL,
  `avail_note` text NOT NULL,
  `avail_downpayment_image` varchar(255) DEFAULT NULL,
  `avail_cancel_reason` text DEFAULT NULL,
  `avail_resched_reason` text DEFAULT NULL,
  `user_id` int(20) NOT NULL,
  `service_id` int(20) NOT NULL,
  `avail_status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_service_packages`
--

CREATE TABLE `tbl_service_packages` (
  `service_id` int(20) NOT NULL,
  `service_name` varchar(255) NOT NULL,
  `service_price` int(120) NOT NULL,
  `service_hours` int(20) NOT NULL,
  `service_description` text NOT NULL,
  `service_banner` varchar(255) NOT NULL,
  `user_id` int(20) NOT NULL,
  `service_archive_status` int(10) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_account`
--

CREATE TABLE `tbl_user_account` (
  `user_id` int(20) NOT NULL,
  `user_type` varchar(120) NOT NULL,
  `user_last_name` varchar(120) NOT NULL,
  `user_first_name` varchar(120) NOT NULL,
  `user_middle_name` varchar(120) NOT NULL,
  `user_nickname` varchar(120) NOT NULL,
  `user_email` varchar(120) NOT NULL,
  `user_address` varchar(255) NOT NULL,
  `user_birthday` date NOT NULL,
  `user_sex` varchar(120) NOT NULL,
  `user_studio_name` varchar(255) DEFAULT NULL,
  `user_id_image` varchar(255) DEFAULT NULL,
  `user_permit_image` varchar(255) DEFAULT NULL,
  `user_tin` varchar(255) DEFAULT NULL,
  `user_contact` varchar(120) NOT NULL,
  `user_profile_image` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_lat` varchar(255) DEFAULT NULL,
  `user_lng` varchar(255) DEFAULT NULL,
  `user_verification_code` varchar(255) DEFAULT NULL,
  `user_verified` int(10) NOT NULL DEFAULT 0,
  `user_active_status` int(10) NOT NULL DEFAULT 0,
  `user_archive_status` int(10) NOT NULL,
  `user_last_seen` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin_account`
--
ALTER TABLE `tbl_admin_account`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `tbl_cart`
--
ALTER TABLE `tbl_cart`
  ADD PRIMARY KEY (`cart_id`);

--
-- Indexes for table `tbl_feedback`
--
ALTER TABLE `tbl_feedback`
  ADD PRIMARY KEY (`feedback_id`);

--
-- Indexes for table `tbl_messages`
--
ALTER TABLE `tbl_messages`
  ADD PRIMARY KEY (`message_id`);

--
-- Indexes for table `tbl_messages_userlist`
--
ALTER TABLE `tbl_messages_userlist`
  ADD PRIMARY KEY (`userlist_id`);

--
-- Indexes for table `tbl_notification`
--
ALTER TABLE `tbl_notification`
  ADD PRIMARY KEY (`notification_id`);

--
-- Indexes for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `tbl_post`
--
ALTER TABLE `tbl_post`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `tbl_post_comments`
--
ALTER TABLE `tbl_post_comments`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `tbl_post_likes`
--
ALTER TABLE `tbl_post_likes`
  ADD PRIMARY KEY (`like_id`);

--
-- Indexes for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `tbl_reports`
--
ALTER TABLE `tbl_reports`
  ADD PRIMARY KEY (`report_id`);

--
-- Indexes for table `tbl_service_avail`
--
ALTER TABLE `tbl_service_avail`
  ADD PRIMARY KEY (`avail_id`);

--
-- Indexes for table `tbl_service_packages`
--
ALTER TABLE `tbl_service_packages`
  ADD PRIMARY KEY (`service_id`);

--
-- Indexes for table `tbl_user_account`
--
ALTER TABLE `tbl_user_account`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin_account`
--
ALTER TABLE `tbl_admin_account`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_cart`
--
ALTER TABLE `tbl_cart`
  MODIFY `cart_id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_feedback`
--
ALTER TABLE `tbl_feedback`
  MODIFY `feedback_id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_messages`
--
ALTER TABLE `tbl_messages`
  MODIFY `message_id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_messages_userlist`
--
ALTER TABLE `tbl_messages_userlist`
  MODIFY `userlist_id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_notification`
--
ALTER TABLE `tbl_notification`
  MODIFY `notification_id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `order_id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_post`
--
ALTER TABLE `tbl_post`
  MODIFY `post_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_post_comments`
--
ALTER TABLE `tbl_post_comments`
  MODIFY `comment_id` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_post_likes`
--
ALTER TABLE `tbl_post_likes`
  MODIFY `like_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `product_id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_reports`
--
ALTER TABLE `tbl_reports`
  MODIFY `report_id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_service_avail`
--
ALTER TABLE `tbl_service_avail`
  MODIFY `avail_id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_service_packages`
--
ALTER TABLE `tbl_service_packages`
  MODIFY `service_id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_user_account`
--
ALTER TABLE `tbl_user_account`
  MODIFY `user_id` int(20) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
