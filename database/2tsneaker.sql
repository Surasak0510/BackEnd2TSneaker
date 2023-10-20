-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: bppul6mjxzb4j3qoj6g3-mysql.services.clever-cloud.com:3306
-- Generation Time: Oct 20, 2023 at 07:31 AM
-- Server version: 8.0.22-13
-- PHP Version: 8.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bppul6mjxzb4j3qoj6g3`
--

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `fa_id` int NOT NULL,
  `UserID` int NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `Loc_id` varchar(6) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'รหัสที่อยู่',
  `country` varchar(20) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ประเทศ',
  `province` varchar(20) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'จังหวัด',
  `district` varchar(20) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'อำเภอ',
  `postcode` varchar(5) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'รหัสไปรษณีย์'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `UserID` int NOT NULL,
  `Username` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `Password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `Email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `tel` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `Status` enum('ADMIN','USER') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'USER',
  `Loc_id` varchar(6) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `img` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`UserID`, `Username`, `Password`, `Email`, `tel`, `Status`, `Loc_id`, `img`) VALUES
(7, 'Kurenai', 'fenderman2499', 'fenderman2499', '0965805293', 'USER', NULL, NULL),
(34, 'TeeNoi', '123456', 'trewq@gmail.com', '0966383992', 'USER', NULL, NULL),
(35, 'surasak', 'trewq1125', 'surasak.khemthong0510@gmail.com', '0966383992', 'USER', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `pay_id` int NOT NULL,
  `amount` int NOT NULL,
  `Date` datetime DEFAULT CURRENT_TIMESTAMP,
  `UserID` int NOT NULL,
  `pro_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `Pro_id` int NOT NULL COMMENT 'รหัสสินค้า',
  `name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ชื่อสินค้า',
  `color` varchar(10) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'สี',
  `size` varchar(10) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ขนาด',
  `brand` varchar(20) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'แบรนด์',
  `types` varchar(30) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ประเภท',
  `amount` int NOT NULL COMMENT 'จำนวนรองเท้า',
  `image` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'รูปรองเท้า',
  `price` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`Pro_id`, `name`, `color`, `size`, `brand`, `types`, `amount`, `image`, `price`) VALUES
(2, 'Adidas Yeezy Boost 350 V2', 'black', '36', 'Adidas', 'Men', 9, 'https://cdn.discordapp.com/attachments/882572081861099543/1164569979195228180/Adidas-Yeezy-Boost-350-V2-Core-Black-Red-Product.webp?ex=6543b14f&is=65313c4f&hm=cc21525f50a576622580c7802cc3a3d181c20b7a7bfe54ec0be367cf9bae8e1d&', 3000),
(3, 'Adidas Yeezy Boost 350 V2', 'black', '37', 'Adidas', 'Men', 10, 'https://cdn.discordapp.com/attachments/882572081861099543/1164569979195228180/Adidas-Yeezy-Boost-350-V2-Core-Black-Red-Product.webp?ex=6543b14f&is=65313c4f&hm=cc21525f50a576622580c7802cc3a3d181c20b7a7bfe54ec0be367cf9bae8e1d&', 3000),
(4, 'Adidas Yeezy Boost 350 V2', 'black', '38', 'Adidas', 'Men', 10, 'https://cdn.discordapp.com/attachments/882572081861099543/1164569979195228180/Adidas-Yeezy-Boost-350-V2-Core-Black-Red-Product.webp?ex=6543b14f&is=65313c4f&hm=cc21525f50a576622580c7802cc3a3d181c20b7a7bfe54ec0be367cf9bae8e1d&', 3000),
(5, 'Adidas Yeezy Boost 350 V2', 'black', '39', 'Adidas', 'Men', 10, 'https://cdn.discordapp.com/attachments/882572081861099543/1164569979195228180/Adidas-Yeezy-Boost-350-V2-Core-Black-Red-Product.webp?ex=6543b14f&is=65313c4f&hm=cc21525f50a576622580c7802cc3a3d181c20b7a7bfe54ec0be367cf9bae8e1d&', 3000),
(6, 'Adidas Yeezy Boost 350 V2', 'black', '34', 'Adidas', 'Men', 10, 'https://cdn.discordapp.com/attachments/882572081861099543/1164569979195228180/Adidas-Yeezy-Boost-350-V2-Core-Black-Red-Product.webp?ex=6543b14f&is=65313c4f&hm=cc21525f50a576622580c7802cc3a3d181c20b7a7bfe54ec0be367cf9bae8e1d&', 3000),
(7, 'NIKE JORDAN1 HIGH DIOR', 'black', '35', 'NIKE', 'Limited', 10, 'https://cdn.discordapp.com/attachments/1150377622820368424/1163494248646197298/testShoes2.png?ex=653fc775&is=652d5275&hm=2206c9c5d8a7bb8b02e789d9007e8879a96d8e32e8158c4a13fad55fdb587e8b&', 3000),
(8, 'NIKE JORDAN1 HIGH DIOR', 'black', '36', 'NIKE', 'Limited', 10, 'https://cdn.discordapp.com/attachments/1150377622820368424/1163494248646197298/testShoes2.png?ex=653fc775&is=652d5275&hm=2206c9c5d8a7bb8b02e789d9007e8879a96d8e32e8158c4a13fad55fdb587e8b&', 3000),
(9, 'NIKE JORDAN1 HIGH DIOR', 'black', '37', 'NIKE', 'Limited', 10, 'https://cdn.discordapp.com/attachments/1150377622820368424/1163494248646197298/testShoes2.png?ex=653fc775&is=652d5275&hm=2206c9c5d8a7bb8b02e789d9007e8879a96d8e32e8158c4a13fad55fdb587e8b&', 3000),
(10, 'NIKE JORDAN1 HIGH DIOR', 'black', '38', 'NIKE', 'Limited', 10, 'https://cdn.discordapp.com/attachments/1150377622820368424/1163494248646197298/testShoes2.png?ex=653fc775&is=652d5275&hm=2206c9c5d8a7bb8b02e789d9007e8879a96d8e32e8158c4a13fad55fdb587e8b&', 3000);

-- --------------------------------------------------------

--
-- Table structure for table `promotions`
--

CREATE TABLE `promotions` (
  `promotion_id` int UNSIGNED NOT NULL,
  `text` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `Pro_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`fa_id`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`Loc_id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`UserID`),
  ADD KEY `Loc_id` (`Loc_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`pay_id`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `pro_id` (`pro_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`Pro_id`);

--
-- Indexes for table `promotions`
--
ALTER TABLE `promotions`
  ADD PRIMARY KEY (`promotion_id`),
  ADD KEY `Pro_id` (`Pro_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `UserID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `pay_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `Pro_id` int NOT NULL AUTO_INCREMENT COMMENT 'รหัสสินค้า', AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `promotions`
--
ALTER TABLE `promotions`
  MODIFY `promotion_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `members` (`UserID`);

--
-- Constraints for table `members`
--
ALTER TABLE `members`
  ADD CONSTRAINT `members_ibfk_1` FOREIGN KEY (`Loc_id`) REFERENCES `locations` (`Loc_id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `members` (`UserID`),
  ADD CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`pro_id`) REFERENCES `products` (`Pro_id`);

--
-- Constraints for table `promotions`
--
ALTER TABLE `promotions`
  ADD CONSTRAINT `promotions_ibfk_1` FOREIGN KEY (`Pro_id`) REFERENCES `products` (`Pro_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
