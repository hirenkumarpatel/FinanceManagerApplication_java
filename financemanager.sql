-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 31, 2015 at 06:19 AM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `financemanager`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE IF NOT EXISTS `accounts` (
`account_id` int(11) NOT NULL,
  `account_name` varchar(30) NOT NULL,
  `account_amount` int(11) NOT NULL,
  `account_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_email` varchar(30) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`account_id`, `account_name`, `account_amount`, `account_date`, `user_email`) VALUES
(1, 'Cash', 100, '2015-07-29 14:00:01', 'hirenpatel185@gmail.com'),
(2, 'Scotia Savings', 1500, '2015-07-29 14:33:10', 'hirenpatel185@gmail.com'),
(3, 'SBI Loan', 200, '2015-07-10 04:00:00', 'hirenpatel185@gmail.com'),
(4, 'Credit card', 1000, '2015-07-30 04:00:00', 'hirenpatel185@gmail.com'),
(5, 'College Expencies', 0, '2015-07-30 04:00:00', 'hirenpatel185@gmail.com'),
(6, 'Guardme', 200, '2015-07-30 04:00:00', 'hirenpatel185@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
`category_id` int(11) NOT NULL,
  `category_name` varchar(30) NOT NULL,
  `user_email` varchar(30) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`, `user_email`) VALUES
(1, 'Monthly Income', 'hirenpatel185@gmail.com'),
(2, 'Daily Expense', 'hirenpatel185@gmail.com'),
(3, 'Shopping', 'hirenpatel185@gmail.com'),
(4, 'Internet and Bills', 'hirenpatel185@gmail.com'),
(5, 'House Rent', 'hirenpatel185@gmail.com'),
(6, 'Car wash', 'hirenpatel185@gmail.com'),
(7, 'salary', 'hirenpatel185@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE IF NOT EXISTS `transactions` (
`tran_id` int(11) NOT NULL,
  `tran_desc` varchar(30) NOT NULL,
  `tran_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tran_amount` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `tran_flow` char(1) NOT NULL,
  `category_id` int(11) NOT NULL,
  `user_email` varchar(30) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`tran_id`, `tran_desc`, `tran_date`, `tran_amount`, `account_id`, `tran_flow`, `category_id`, `user_email`) VALUES
(1, 'initial balance', '2015-07-29 15:30:19', 500, 1, 'I', 1, 'hirenpatel185@gmail.com'),
(2, 'Pizza', '2015-07-29 15:30:19', 50, 1, 'E', 2, 'hirenpatel185@gmail.com'),
(3, 'Monthly transfer', '2015-07-30 04:55:50', 670, 2, 'I', 1, 'hirenpatel185@gmail.com'),
(4, 'July Salary', '2015-07-30 04:00:00', 500, 2, 'I', 7, 'hirenpatel185@gmail.com'),
(5, 'College Fees', '2015-07-30 04:00:00', 6500, 4, 'E', 2, 'hirenpatel185@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `user_name` varchar(30) NOT NULL,
  `user_email` varchar(30) NOT NULL,
  `user_password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_name`, `user_email`, `user_password`) VALUES
('Hiren Patel', 'hirenpatel185@gmail.com', 'hiren'),
('jay', 'jay@gmail.com', 'jay'),
('nilesh', 'nilesh@gmail.com', 'nilesh');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
 ADD PRIMARY KEY (`account_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
 ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
 ADD PRIMARY KEY (`tran_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`user_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
MODIFY `account_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
MODIFY `tran_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
