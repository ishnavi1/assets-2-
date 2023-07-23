-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 30, 2020 at 01:54 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop_inventory`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customerID` int(11) NOT NULL,
  `fullName` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mobile` int(11) NOT NULL,
  `phone2` int(11) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `district` varchar(30) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Active',
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--


-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `productID` int(11) NOT NULL,
  `itemNumber` varchar(255) NOT NULL,
  `itemName` varchar(255) NOT NULL,
  `discount` float NOT NULL DEFAULT '0',
  `stock` int(11) NOT NULL DEFAULT '0',
  `unitPrice` float NOT NULL DEFAULT '0',
  `imageURL` varchar(255) NOT NULL DEFAULT 'imageNotAvailable.jpg',
  `status` varchar(255) NOT NULL DEFAULT 'Active',
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item`
--

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

CREATE TABLE `purchase` (
  `purchaseID` int(11) NOT NULL,
  `itemNumber` varchar(255) NOT NULL,
  `purchaseDate` date NOT NULL,
  `itemName` varchar(255) NOT NULL,
  `unitPrice` float NOT NULL DEFAULT '0',
  `quantity` int(11) NOT NULL DEFAULT '0',
  `vendorName` varchar(255) NOT NULL DEFAULT 'Test Vendor',
  `vendorID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchase`
--


-- --------------------------------------------------------

--
-- Table structure for table `sale`
--

CREATE TABLE `sale` (
  `saleID` int(11) NOT NULL,
  `itemNumber` varchar(255) NOT NULL,
  `customerID` int(11) NOT NULL,
  `customerName` varchar(255) NOT NULL,
  `itemName` varchar(255) NOT NULL,
  `saleDate` date NOT NULL,
  `discount` float NOT NULL DEFAULT '0',
  `quantity` int(11) NOT NULL DEFAULT '0',
  `unitPrice` float(10,0) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sale`
--



-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userID` int(11) NOT NULL,
  `fullName` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userID`, `fullName`, `username`, `password`, `status`) VALUES
(5, 'Guest', 'guest', '81dc9bdb52d04dc20036dbd8313ed055', 'Active'),
(6, 'a', 'a', '0cc175b9c0f1b6a831c399e269772661', 'Active'),
(7, 'admin', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `vendor`
--

CREATE TABLE `vendor` (
  `vendorID` int(11) NOT NULL,
  `fullName` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile` int(11) NOT NULL,
  `phone2` int(11) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `district` varchar(30) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Active',
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Dumping data for table `vendor`
--


--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customerID`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`productID`);

--
-- Indexes for table `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`purchaseID`);

--
-- Indexes for table `sale`
--
ALTER TABLE `sale`
  ADD PRIMARY KEY (`saleID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userID`);

--
-- Indexes for table `vendor`
--
ALTER TABLE `vendor`
  ADD PRIMARY KEY (`vendorID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `productID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `purchase`
--
ALTER TABLE `purchase`
  MODIFY `purchaseID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `sale`
--
ALTER TABLE `sale`
  MODIFY `saleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `vendor`
--
ALTER TABLE `vendor`
  MODIFY `vendorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
