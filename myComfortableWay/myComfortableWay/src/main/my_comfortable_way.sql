-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 08, 2023 at 12:26 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `my_comfortable_way`
--

-- --------------------------------------------------------

--
-- Table structure for table `border_crossings`
--

CREATE TABLE `border_crossings` (
  `border_crossing_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `country` varchar(255) NOT NULL,
  `status` enum('Prohodni','Privremeno zatvoreni','Usporen saobraćaj') NOT NULL,
  `waiting_time_serbia` int(11) NOT NULL,
  `waiting_time_other_country` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `border_crossings`
--

INSERT INTO `border_crossings` (`border_crossing_id`, `name`, `country`, `status`, `waiting_time_serbia`, `waiting_time_other_country`) VALUES
(1, 'Horgos', 'Madjarska', 'Prohodni', 5, 4);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `user_type` enum('Administrator','Driver') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `user_type`) VALUES
(1, 'admin', 'admin', 'Administrator'),
(2, 'vozac', 'vozac', 'Driver');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `border_crossings`
--
ALTER TABLE `border_crossings`
  ADD PRIMARY KEY (`border_crossing_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `border_crossings`
--
ALTER TABLE `border_crossings`
  MODIFY `border_crossing_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
