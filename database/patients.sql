-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 25, 2022 at 10:12 AM
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
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phoneNumber` int DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `psychiatristId` int DEFAULT NULL,
  `hospitalId` int DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`id`, `name`, `address`, `email`, `phoneNumber`, `password`, `photo`, `psychiatristId`, `hospitalId`, `createdAt`, `updatedAt`) VALUES
(1, 'Anuj', 'House no:-233, B-Complex Opposite to Amazon Mall, NewUniverse', 'anuj121@gmail.com', 1234567890, '$2b$10$0IJ7v8q6v3dgNRr62mR94efbngyAkpxeDGQODZBP5Jv2Rlh7eQ/MK', 'https://eitrawmaterials.eu/wp-content/uploads/2016/09/person-icon.png', 1, 1, '2022-08-25 03:28:25', '2022-08-25 03:28:25'),
(2, 'Ajay', 'House no:-233, B-Complex Opposite to Amazon Mall, NewUniverse, Shimla', 'ajayrw121@gmail.com', 1234323423, '$2b$10$XecqaxCYT4t59dei7KLu5e/c6u6pngYJd7okVqonPiJ3qsN1h340u', 'https://eitrawmaterials.eu/wp-content/uploads/2016/09/person-icon.png', 1, 1, '2022-08-25 04:33:42', '2022-08-25 04:33:42');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `psychiatristId` (`psychiatristId`),
  ADD KEY `hospitalId` (`hospitalId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `patients`
--
ALTER TABLE `patients`
  ADD CONSTRAINT `patients_ibfk_1` FOREIGN KEY (`psychiatristId`) REFERENCES `psychiatrists` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `patients_ibfk_2` FOREIGN KEY (`hospitalId`) REFERENCES `hospitals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
