-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 25, 2022 at 05:44 AM
-- Server version: 8.0.30-0ubuntu0.20.04.2
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rest`
--

-- --------------------------------------------------------

--
-- Table structure for table `psychiatrists`
--

CREATE TABLE `psychiatrists` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `hospitalId` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `psychiatrists`
--

INSERT INTO `psychiatrists` (`id`, `name`, `createdAt`, `updatedAt`, `hospitalId`) VALUES
(1, 'Dr Pullen', '2022-08-24 21:43:57', '2022-08-24 21:43:57', 1),
(2, 'Dr Fillmore', '2022-08-24 21:45:16', '2022-08-24 21:45:16', 1),
(3, 'Dr Mangle', '2022-08-24 21:45:44', '2022-08-24 21:45:44', 1),
(4, 'Dr Ken Hurt', '2022-08-24 21:46:02', '2022-08-24 21:46:02', 1),
(5, 'Dr B. Sick', '2022-08-24 21:46:33', '2022-08-24 21:46:33', 1),
(6, 'Dr Watamaniuk', '2022-08-24 21:47:01', '2022-08-24 21:47:01', 2),
(7, 'Dr Lipp', '2022-08-24 21:47:22', '2022-08-24 21:47:22', 2),
(8, 'Dr Carey', '2022-08-24 21:47:48', '2022-08-24 21:47:48', 2),
(9, 'Dr Nervo', '2022-08-24 21:48:07', '2022-08-24 21:48:07', 2),
(10, 'Dr Pulley', '2022-08-24 21:48:28', '2022-08-24 21:48:28', 2),
(11, 'Dr Hurt', '2022-08-24 21:48:44', '2022-08-24 21:48:44', 3),
(12, 'Dr Ohno', '2022-08-24 21:49:42', '2022-08-24 21:49:42', 3),
(13, 'Dr Sweet', '2022-08-24 21:50:07', '2022-08-24 21:50:07', 3),
(14, 'Dr Crownover', '2022-08-24 21:50:24', '2022-08-24 21:50:24', 3),
(15, 'Dr Yankum', '2022-08-24 21:50:47', '2022-08-24 21:50:47', 3),
(16, 'Dr Spot', '2022-08-24 21:51:14', '2022-08-24 21:51:14', 4),
(17, 'Dr Rash', '2022-08-24 21:51:46', '2022-08-24 21:51:46', 4),
(18, 'Dr Cheek', '2022-08-24 21:52:08', '2022-08-24 21:52:08', 4),
(19, 'Dr Frye', '2022-08-24 21:52:30', '2022-08-24 21:52:30', 4),
(20, 'Dr Tanner', '2022-08-24 21:52:52', '2022-08-24 21:52:52', 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `psychiatrists`
--
ALTER TABLE `psychiatrists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hospitalId` (`hospitalId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `psychiatrists`
--
ALTER TABLE `psychiatrists`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `psychiatrists`
--
ALTER TABLE `psychiatrists`
  ADD CONSTRAINT `psychiatrists_ibfk_1` FOREIGN KEY (`hospitalId`) REFERENCES `hospitals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
