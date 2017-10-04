-- phpMyAdmin SQL Dump
-- version 4.7.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Oct 04, 2017 at 10:39 AM
-- Server version: 5.6.35
-- PHP Version: 7.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ProjectGame`
--

-- --------------------------------------------------------

--
-- Table structure for table `Difficulty`
--

CREATE TABLE `Difficulty` (
  `difficulty_id` int(11) NOT NULL,
  `easy` int(11) NOT NULL,
  `medium` int(11) NOT NULL,
  `hard` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Highscore`
--

CREATE TABLE `Highscore` (
  `score` int(11) NOT NULL,
  `level_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Level`
--

CREATE TABLE `Level` (
  `level_id` int(11) NOT NULL,
  `description` varchar(60) NOT NULL,
  `name` varchar(60) NOT NULL,
  `highscore` int(11) NOT NULL,
  `difficulty` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Player`
--

CREATE TABLE `Player` (
  `user_id` int(50) NOT NULL,
  `username` varchar(60) NOT NULL,
  `password` varchar(60) NOT NULL,
  `age` int(11) NOT NULL,
  `highscore` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Difficulty`
--
ALTER TABLE `Difficulty`
  ADD PRIMARY KEY (`difficulty_id`);

--
-- Indexes for table `Highscore`
--
ALTER TABLE `Highscore`
  ADD PRIMARY KEY (`level_id`,`user_id`),
  ADD KEY `level_id` (`level_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `Level`
--
ALTER TABLE `Level`
  ADD PRIMARY KEY (`level_id`),
  ADD KEY `levelid` (`level_id`);

--
-- Indexes for table `Player`
--
ALTER TABLE `Player`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `userid` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Player`
--
ALTER TABLE `Player`
  MODIFY `user_id` int(50) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `Highscore`
--
ALTER TABLE `Highscore`
  ADD CONSTRAINT `highscore_ibfk_1` FOREIGN KEY (`level_id`) REFERENCES `Level` (`level_id`),
  ADD CONSTRAINT `highscore_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `Player` (`user_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
