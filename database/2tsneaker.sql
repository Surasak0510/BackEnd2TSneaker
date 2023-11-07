-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: bppul6mjxzb4j3qoj6g3-mysql.services.clever-cloud.com:3306
-- Generation Time: Nov 07, 2023 at 08:09 AM
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
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `CartID` int NOT NULL,
  `Pro_id` int DEFAULT NULL,
  `UserID` int DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `brand` varchar(50) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `types` varchar(50) DEFAULT NULL,
  `size` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cart`
--

-- INSERT INTO `cart` (`CartID`, `Pro_id`, `UserID`, `name`, `price`, `image`, `brand`, `color`, `amount`, `types`, `size`) VALUES
-- (32, 27, 39, 'NIKE AIR JORDAN1 High Travis Scott Fragment', 130000, 'https://media.discordapp.net/attachments/882572081861099543/1166646717270216754/air-jordan-1-retro-high-og-sp-travis-scott-fragment-military-blue-835922.png?ex=654b3f6c&is=6538ca6c&hm=c5c1fd2489390f0ba514085be33856573f74d315b394e6a6953f55bd6e19aa90&=', 'Nike', 'blue', 2, 'Men', '45'),
-- (33, 101, 35, 'NIKE JORDAN1 Mid Barely Grape (GS)', 5800, 'https://cdn.discordapp.com/attachments/882572081861099543/1167442110862086234/snakerstoreAir_Jordan_1_Mid_Barely_Grape-DQ8423-501-0.png?ex=654e2431&is=653baf31&hm=cf541638438970d1b4522f9c056e76bbcae0883c9dff3fa55f3f2b0f3561e7ab&', 'Nike', 'pink', 7, 'Kid', '33'),
-- (34, 90, 35, 'NIKE JORDAN1 Mid Sneaker School Game Winner (GS)', 4800, 'https://cdn.discordapp.com/attachments/882572081861099543/1167440847181185094/image.png?ex=654e2303&is=653bae03&hm=968de357e0cc6a888b8429936f787f69e01e484fc92f20c1fc5012027f4595b6&', 'Nike', 'blue', 7, 'Kid', '32'),
-- (35, 72, 35, 'NIKE DUNK Low GS \'Pink Velvet\'', 5900, 'https://cdn.discordapp.com/attachments/882572081861099543/1167435859063222292/image_0346386b-8c2c-4066-accc-d60805b8b33c_1445x.png?ex=654e1e5e&is=653ba95e&hm=32dd8d571b14c6187de013df3ccd5ff4b8054715c8b5ebd215b2174dc2a7f4b0&', 'Nike', 'pink', 7, 'Women', '39'),
-- (36, 96, 35, 'NIKE JORDAN1 Low Bulls (GS)', 4800, 'https://cdn.discordapp.com/attachments/882572081861099543/1167441552424042596/JORDAN-1-LOW-CHICAGO-BULLS-GS-1.png?ex=654e23ac&is=653baeac&hm=48a0ed0d018bebf1d11e947236608ff78b8a95ce38d291a6e906c4bacd9dfe4b&', 'Nike', 'red', 6, 'Kid', '35');

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `Fa_id` int NOT NULL,
  `Pro_id` int DEFAULT NULL,
  `UserID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `favorites`
--

-- INSERT INTO `favorites` (`Fa_id`, `Pro_id`, `UserID`) VALUES
-- (3, 65, 35),
-- (10, 25, 40),
-- (11, 25, 39);

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `Loc_id` varchar(6) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'รหัสที่อยู่',
  `country` varchar(20) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ประเทศ',
  `province` varchar(20) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'จังหวัด',
  `district` varchar(20) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'อำเภอ',
  `postcode` varchar(5) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'รหัสไปรษณีย์',
  `UserID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `locations`
--

-- INSERT INTO `locations` (`Loc_id`, `country`, `province`, `district`, `postcode`, `UserID`) VALUES
-- ('2', 'Thailand', 'Bangyai', 'Nonthaburi', '11110', 35);

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
  `Loc_id` varchar(6) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `members`
--

-- INSERT INTO `members` (`UserID`, `Username`, `Password`, `Email`, `tel`, `Status`, `Loc_id`) VALUES
-- (7, 'Kurenai', 'fenderman2499', 'fenderman2499', '0965805293', 'USER', NULL),
-- (34, 'TeeNoi', '123456', 'trewq@gmail.com', '0966383992', 'USER', NULL),
-- (35, 'Surasak Khemthong', 'trewq1125', 'surasak.khemthong0510@gmail.com', '0966383992', 'USER', NULL),
-- (38, 'Surasak03', 'test02', 'trewq0510@gmail.com', '0966383992', 'USER', NULL),
-- (39, 'Kafka', 'yedhee123', 'yedtood@gmail.com', '0965805293', 'USER', NULL),
-- (40, 'siwapon', 'siwapon2835', 'siwapon2835@gmail.com', '0614495827', 'USER', NULL);

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
(14, 'NIKE JORDAN1 HIGH DIOR', 'black', '43', 'NIKE', 'Limited', 10, 'https://cdn.discordapp.com/attachments/1150377622820368424/1163494248646197298/testShoes2.png?ex=653fc775&is=652d5275&hm=2206c9c5d8a7bb8b02e789d9007e8879a96d8e32e8158c4a13fad55fdb587e8b&', 3000),
(15, 'NIKE JORDAN1 HIGH DIOR', 'black', '43', 'NIKE', 'Limited', 10, 'https://cdn.discordapp.com/attachments/1150377622820368424/1163494248646197298/testShoes2.png?ex=653fc775&is=652d5275&hm=2206c9c5d8a7bb8b02e789d9007e8879a96d8e32e8158c4a13fad55fdb587e8b&', 3000),
(16, 'Adidas Yeezy Boost 350 V2', 'black', '36', 'Adidas', 'Men', 10, 'https://cdn.discordapp.com/attachments/882572081861099543/1164569979195228180/Adidas-Yeezy-Boost-350-V2-Core-Black-Red-Product.webp?ex=6543b14f&is=65313c4f&hm=cc21525f50a576622580c7802cc3a3d181c20b7a7bfe54ec0be367cf9bae8e1d&', 3000),
(17, 'Adidas Yeezy Boost 350 V2', 'black', '37', 'Adidas', 'Men', 12, 'https://cdn.discordapp.com/attachments/882572081861099543/1164569979195228180/Adidas-Yeezy-Boost-350-V2-Core-Black-Red-Product.webp?ex=6543b14f&is=65313c4f&hm=cc21525f50a576622580c7802cc3a3d181c20b7a7bfe54ec0be367cf9bae8e1d&', 3000),
(18, 'Adidas Yeezy Boost 350 V2', 'black', '40', 'Adidas', 'Men', 10, 'https://cdn.discordapp.com/attachments/882572081861099543/1164569979195228180/Adidas-Yeezy-Boost-350-V2-Core-Black-Red-Product.webp?ex=6543b14f&is=65313c4f&hm=cc21525f50a576622580c7802cc3a3d181c20b7a7bfe54ec0be367cf9bae8e1d&', 3000),
(19, 'Adidas Yeezy Boost 350 V2', 'black', '42', 'Adidas', 'Men', 7, 'https://cdn.discordapp.com/attachments/882572081861099543/1164569979195228180/Adidas-Yeezy-Boost-350-V2-Core-Black-Red-Product.webp?ex=6543b14f&is=65313c4f&hm=cc21525f50a576622580c7802cc3a3d181c20b7a7bfe54ec0be367cf9bae8e1d&', 3000),
(20, 'Adidas Yeezy Boost 350 V2', 'black', '45', 'Adidas', 'Men', 3, 'https://cdn.discordapp.com/attachments/882572081861099543/1164569979195228180/Adidas-Yeezy-Boost-350-V2-Core-Black-Red-Product.webp?ex=6543b14f&is=65313c4f&hm=cc21525f50a576622580c7802cc3a3d181c20b7a7bfe54ec0be367cf9bae8e1d&', 3000),
(21, 'NIKE AIR JORDAN1 HIGH OG CHICAGO', 'red', '43', 'Nike', 'Men', 5, 'https://cdn.discordapp.com/attachments/882572081861099543/1166640671969529856/jordan-1-retro-chicago-1994-1.png?ex=654b39cb&is=6538c4cb&hm=fe555f2b84ddbe358bd6ca20e58a80bfa233568411b8de55c53db652a2e4e4a6&', 13000),
(22, 'NIKE AIR JORDAN1 HIGH OG CHICAGO', 'red', '45', 'Nike', 'Men', 10, 'https://cdn.discordapp.com/attachments/882572081861099543/1166640671969529856/jordan-1-retro-chicago-1994-1.png?ex=654b39cb&is=6538c4cb&hm=fe555f2b84ddbe358bd6ca20e58a80bfa233568411b8de55c53db652a2e4e4a6&', 13000),
(23, 'NIKE AIR JORDAN1 HIGH OG CHICAGO', 'red', '46', 'Nike', 'Men', 8, 'https://cdn.discordapp.com/attachments/882572081861099543/1166640671969529856/jordan-1-retro-chicago-1994-1.png?ex=654b39cb&is=6538c4cb&hm=fe555f2b84ddbe358bd6ca20e58a80bfa233568411b8de55c53db652a2e4e4a6&', 13000),
(24, 'NIKE AIR JORDAN1 HIGH OG CHICAGO', 'red', '47', 'Nike', 'Men', 7, 'https://cdn.discordapp.com/attachments/882572081861099543/1166640671969529856/jordan-1-retro-chicago-1994-1.png?ex=654b39cb&is=6538c4cb&hm=fe555f2b84ddbe358bd6ca20e58a80bfa233568411b8de55c53db652a2e4e4a6&', 13000),
(25, 'NIKE AIR JORDAN1 High Travis Scott Fragment', 'blue', '41', 'Nike', 'Men', 7, 'https://media.discordapp.net/attachments/882572081861099543/1166646717270216754/air-jordan-1-retro-high-og-sp-travis-scott-fragment-military-blue-835922.png?ex=654b3f6c&is=6538ca6c&hm=c5c1fd2489390f0ba514085be33856573f74d315b394e6a6953f55bd6e19aa90&=', 130000),
(26, 'NIKE AIR JORDAN1 High Travis Scott Fragment', 'blue', '44', 'Nike', 'Men', 3, 'https://media.discordapp.net/attachments/882572081861099543/1166646717270216754/air-jordan-1-retro-high-og-sp-travis-scott-fragment-military-blue-835922.png?ex=654b3f6c&is=6538ca6c&hm=c5c1fd2489390f0ba514085be33856573f74d315b394e6a6953f55bd6e19aa90&=', 130000),
(27, 'NIKE AIR JORDAN1 High Travis Scott Fragment', 'blue', '45', 'Nike', 'Men', 2, 'https://media.discordapp.net/attachments/882572081861099543/1166646717270216754/air-jordan-1-retro-high-og-sp-travis-scott-fragment-military-blue-835922.png?ex=654b3f6c&is=6538ca6c&hm=c5c1fd2489390f0ba514085be33856573f74d315b394e6a6953f55bd6e19aa90&=', 130000),
(28, 'NIKE AIR JORDAN1 High Travis Scott Fragment', 'blue', '46', 'Nike', 'Men', 5, 'https://media.discordapp.net/attachments/882572081861099543/1166646717270216754/air-jordan-1-retro-high-og-sp-travis-scott-fragment-military-blue-835922.png?ex=654b3f6c&is=6538ca6c&hm=c5c1fd2489390f0ba514085be33856573f74d315b394e6a6953f55bd6e19aa90&=', 130000),
(29, 'Adidas Yeezy Boot 350 blue tint', 'grey', '40', 'Adidas', 'Men', 7, 'https://cdn.discordapp.com/attachments/882572081861099543/1166647662645362738/2_19_e8f65771-aff0-484e-a635-17ce2f9d0e26.png?ex=654b404e&is=6538cb4e&hm=012393c0a3d6766c16a77e3d94d93eb98bd1188057a526bae3068ac778d9af49&', 12000),
(30, 'Adidas Yeezy Boot 350 blue tint', 'grey', '41', 'Adidas', 'Men', 8, 'https://cdn.discordapp.com/attachments/882572081861099543/1166647662645362738/2_19_e8f65771-aff0-484e-a635-17ce2f9d0e26.png?ex=654b404e&is=6538cb4e&hm=012393c0a3d6766c16a77e3d94d93eb98bd1188057a526bae3068ac778d9af49&', 12000),
(31, 'Adidas Yeezy Boot 350 blue tint', 'grey', '42', 'Adidas', 'Men', 8, 'https://cdn.discordapp.com/attachments/882572081861099543/1166647662645362738/2_19_e8f65771-aff0-484e-a635-17ce2f9d0e26.png?ex=654b404e&is=6538cb4e&hm=012393c0a3d6766c16a77e3d94d93eb98bd1188057a526bae3068ac778d9af49&', 12000),
(32, 'Adidas Yeezy Boot 350 blue tint', 'grey', '43', 'Adidas', 'Men', 10, 'https://cdn.discordapp.com/attachments/882572081861099543/1166647662645362738/2_19_e8f65771-aff0-484e-a635-17ce2f9d0e26.png?ex=654b404e&is=6538cb4e&hm=012393c0a3d6766c16a77e3d94d93eb98bd1188057a526bae3068ac778d9af49&', 12000),
(33, 'Adidas Yeezy Boot 350 blue tint', 'grey', '44', 'Adidas', 'Men', 13, 'https://cdn.discordapp.com/attachments/882572081861099543/1166647662645362738/2_19_e8f65771-aff0-484e-a635-17ce2f9d0e26.png?ex=654b404e&is=6538cb4e&hm=012393c0a3d6766c16a77e3d94d93eb98bd1188057a526bae3068ac778d9af49&', 12000),
(34, 'Adidas Yeezy Boot 350 blue tint', 'grey', '45', 'Adidas', 'Men', 16, 'https://cdn.discordapp.com/attachments/882572081861099543/1166647662645362738/2_19_e8f65771-aff0-484e-a635-17ce2f9d0e26.png?ex=654b404e&is=6538cb4e&hm=012393c0a3d6766c16a77e3d94d93eb98bd1188057a526bae3068ac778d9af49&', 12000),
(35, 'Adidas Yeezy Boot 350 V2 Beluga', 'brown', '39', 'Adidas', 'Men', 16, 'https://media.discordapp.net/attachments/882572081861099543/1166648602383360000/yeezy-boost-350-v2-beluga-674699.png?ex=654b412e&is=6538cc2e&hm=3fee7f6a3b0c94013e883fc30a73ab6e7b26f032e54a90dc9df05af81b836a21&=', 22000),
(36, 'Adidas Yeezy Boot 350 V2 Beluga', 'brown', '40', 'Adidas', 'Men', 2, 'https://media.discordapp.net/attachments/882572081861099543/1166648602383360000/yeezy-boost-350-v2-beluga-674699.png?ex=654b412e&is=6538cc2e&hm=3fee7f6a3b0c94013e883fc30a73ab6e7b26f032e54a90dc9df05af81b836a21&=', 22000),
(37, 'Adidas Yeezy Boot 350 V2 Beluga', 'brown', '43', 'Adidas', 'Men', 5, 'https://media.discordapp.net/attachments/882572081861099543/1166648602383360000/yeezy-boost-350-v2-beluga-674699.png?ex=654b412e&is=6538cc2e&hm=3fee7f6a3b0c94013e883fc30a73ab6e7b26f032e54a90dc9df05af81b836a21&=', 22000),
(38, 'Adidas Yeezy Boot 350 V2 Beluga', 'brown', '44', 'Adidas', 'Men', 3, 'https://media.discordapp.net/attachments/882572081861099543/1166648602383360000/yeezy-boost-350-v2-beluga-674699.png?ex=654b412e&is=6538cc2e&hm=3fee7f6a3b0c94013e883fc30a73ab6e7b26f032e54a90dc9df05af81b836a21&=', 22000),
(39, 'Adidas Yeezy Boot 350 V2 Beluga', 'brown', '46', 'Adidas', 'Men', 1, 'https://media.discordapp.net/attachments/882572081861099543/1166648602383360000/yeezy-boost-350-v2-beluga-674699.png?ex=654b412e&is=6538cc2e&hm=3fee7f6a3b0c94013e883fc30a73ab6e7b26f032e54a90dc9df05af81b836a21&=', 22000),
(40, 'NIKE AIR JORDAN1 Low Dior', 'grey', '43', 'Nike', 'Limited', 1, 'https://cdn.discordapp.com/attachments/882572081861099543/1166649437679013928/air-jordan-1-low-dior-297727.png?ex=654b41f5&is=6538ccf5&hm=2df4991035e36af05f2cf03e89a1be99f75b16f0c1c161621bbd1cda5aa9b794&', 220000),
(41, 'NIKE AIR JORDAN1 Low Dior', 'grey', '44', 'Nike', 'Limited', 2, 'https://cdn.discordapp.com/attachments/882572081861099543/1166649437679013928/air-jordan-1-low-dior-297727.png?ex=654b41f5&is=6538ccf5&hm=2df4991035e36af05f2cf03e89a1be99f75b16f0c1c161621bbd1cda5aa9b794&', 220000),
(42, 'NIKE AIR JORDAN1 Low Dior', 'grey', '45', 'Nike', 'Limited', 2, 'https://cdn.discordapp.com/attachments/882572081861099543/1166649437679013928/air-jordan-1-low-dior-297727.png?ex=654b41f5&is=6538ccf5&hm=2df4991035e36af05f2cf03e89a1be99f75b16f0c1c161621bbd1cda5aa9b794&', 220000),
(43, 'NIKE SB Dunk Low Grateful Dead Bears Yellow', 'yellow', '41', 'Nike', 'Limited', 2, 'https://cdn.discordapp.com/attachments/882572081861099543/1166650242637238302/sb-dunk-low-grateful-dead-bears-yellow-756509.png?ex=654b42b5&is=6538cdb5&hm=996648abeb9619ac0787442ac6be45586c066255e2d27f8471a118d4543f7758&', 42000),
(44, 'NIKE SB Dunk Low Grateful Dead Bears Yellow', 'yellow', '43', 'Nike', 'Limited', 4, 'https://cdn.discordapp.com/attachments/882572081861099543/1166650242637238302/sb-dunk-low-grateful-dead-bears-yellow-756509.png?ex=654b42b5&is=6538cdb5&hm=996648abeb9619ac0787442ac6be45586c066255e2d27f8471a118d4543f7758&', 42000),
(45, 'NIKE SB Dunk Low Grateful Dead Bears Yellow', 'yellow', '44', 'Nike', 'Limited', 3, 'https://cdn.discordapp.com/attachments/882572081861099543/1166650242637238302/sb-dunk-low-grateful-dead-bears-yellow-756509.png?ex=654b42b5&is=6538cdb5&hm=996648abeb9619ac0787442ac6be45586c066255e2d27f8471a118d4543f7758&', 42000),
(46, 'NIKE SB Dunk Low Grateful Dead Bears Yellow', 'yellow', '46', 'Nike', 'Limited', 1, 'https://cdn.discordapp.com/attachments/882572081861099543/1166650242637238302/sb-dunk-low-grateful-dead-bears-yellow-756509.png?ex=654b42b5&is=6538cdb5&hm=996648abeb9619ac0787442ac6be45586c066255e2d27f8471a118d4543f7758&', 42000),
(47, 'NIKE SB Dunk Low Grateful Dead Bears Green', 'green', '40', 'Nike', 'Limited', 1, 'https://media.discordapp.net/attachments/882572081861099543/1166650586448527440/nike-sb-dunk-low-grateful-dead-bears-1-1000.png?ex=654b4307&is=6538ce07&hm=619f13fb25b994d0fe25d7116a0dd548e0658a8144d68cc105df7577bd695232&=', 42000),
(48, 'NIKE SB Dunk Low Grateful Dead Bears Green', 'green', '42', 'Nike', 'Limited', 1, 'https://media.discordapp.net/attachments/882572081861099543/1166650586448527440/nike-sb-dunk-low-grateful-dead-bears-1-1000.png?ex=654b4307&is=6538ce07&hm=619f13fb25b994d0fe25d7116a0dd548e0658a8144d68cc105df7577bd695232&=', 42000),
(49, 'NIKE SB Dunk Low Grateful Dead Bears Green', 'green', '43', 'Nike', 'Limited', 2, 'https://media.discordapp.net/attachments/882572081861099543/1166650586448527440/nike-sb-dunk-low-grateful-dead-bears-1-1000.png?ex=654b4307&is=6538ce07&hm=619f13fb25b994d0fe25d7116a0dd548e0658a8144d68cc105df7577bd695232&=', 42000),
(50, 'NIKE SB Dunk Low Grateful Dead Bears Orange', 'orange', '39', 'Nike', 'Limited', 1, 'https://media.discordapp.net/attachments/882572081861099543/1166650829193883668/image.png?ex=654b4341&is=6538ce41&hm=cba01d53937b8453c27e0fabe0fd70e4e786548ed28d00505bcf0a1808ff5aa1&=', 42000),
(51, 'NIKE SB Dunk Low Grateful Dead Bears Orange', 'orange', '40', 'Nike', 'Limited', 1, 'https://media.discordapp.net/attachments/882572081861099543/1166650829193883668/image.png?ex=654b4341&is=6538ce41&hm=cba01d53937b8453c27e0fabe0fd70e4e786548ed28d00505bcf0a1808ff5aa1&=', 42000),
(52, 'NIKE SB Dunk Low Grateful Dead Bears Orange', 'orange', '43', 'Nike', 'Limited', 1, 'https://media.discordapp.net/attachments/882572081861099543/1166650829193883668/image.png?ex=654b4341&is=6538ce41&hm=cba01d53937b8453c27e0fabe0fd70e4e786548ed28d00505bcf0a1808ff5aa1&=', 42000),
(53, 'NIKE SB Dunk Low Grateful Dead Bears Orange', 'orange', '44', 'Nike', 'Limited', 2, 'https://media.discordapp.net/attachments/882572081861099543/1166650829193883668/image.png?ex=654b4341&is=6538ce41&hm=cba01d53937b8453c27e0fabe0fd70e4e786548ed28d00505bcf0a1808ff5aa1&=', 42000),
(54, 'NIKE JORDAN1 LOW True Blue', 'blue', '36', 'Nike', 'Women', 16, 'https://cdn.discordapp.com/attachments/882572081861099543/1167432701268209724/Air-Jordan-1-Low-True-Blue-1_1.png?ex=654e1b6d&is=653ba66d&hm=72d36bca5d216ef76a73eeea8040e9e5e6237f2a12f1c4d0ff91f1a93015f7f1&', 6500),
(55, 'NIKE JORDAN1 LOW True Blue', 'blue', '37', 'Nike', 'Women', 11, 'https://cdn.discordapp.com/attachments/882572081861099543/1167432701268209724/Air-Jordan-1-Low-True-Blue-1_1.png?ex=654e1b6d&is=653ba66d&hm=72d36bca5d216ef76a73eeea8040e9e5e6237f2a12f1c4d0ff91f1a93015f7f1&', 6500),
(56, 'NIKE JORDAN1 LOW True Blue', 'blue', '38', 'Nike', 'Women', 10, 'https://cdn.discordapp.com/attachments/882572081861099543/1167432701268209724/Air-Jordan-1-Low-True-Blue-1_1.png?ex=654e1b6d&is=653ba66d&hm=72d36bca5d216ef76a73eeea8040e9e5e6237f2a12f1c4d0ff91f1a93015f7f1&', 6500),
(57, 'NIKE JORDAN1 LOW True Blue', 'blue', '39', 'Nike', 'Women', 10, 'https://cdn.discordapp.com/attachments/882572081861099543/1167432701268209724/Air-Jordan-1-Low-True-Blue-1_1.png?ex=654e1b6d&is=653ba66d&hm=72d36bca5d216ef76a73eeea8040e9e5e6237f2a12f1c4d0ff91f1a93015f7f1&', 6500),
(58, 'NIKE JORDAN1 LOW True Blue', 'blue', '40', 'Nike', 'Women', 8, 'https://cdn.discordapp.com/attachments/882572081861099543/1167432701268209724/Air-Jordan-1-Low-True-Blue-1_1.png?ex=654e1b6d&is=653ba66d&hm=72d36bca5d216ef76a73eeea8040e9e5e6237f2a12f1c4d0ff91f1a93015f7f1&', 6500),
(59, 'NIKE JORDAN1 LOW Wolf Grey', 'grey', '36', 'Nike', 'Women', 8, 'https://media.discordapp.net/attachments/882572081861099543/1167433710652629092/air-jordan-1-low-wolf-grey-282269.png?ex=654e1c5e&is=653ba75e&hm=6b3c2323edd103c7670a5b38c7807f9f1d13cd08bc0500da09b2de9850a13e37&=', 6900),
(60, 'NIKE JORDAN1 LOW Wolf Grey', 'grey', '37', 'Nike', 'Women', 10, 'https://media.discordapp.net/attachments/882572081861099543/1167433710652629092/air-jordan-1-low-wolf-grey-282269.png?ex=654e1c5e&is=653ba75e&hm=6b3c2323edd103c7670a5b38c7807f9f1d13cd08bc0500da09b2de9850a13e37&=', 6900),
(61, 'NIKE JORDAN1 LOW Wolf Grey', 'grey', '38', 'Nike', 'Women', 11, 'https://media.discordapp.net/attachments/882572081861099543/1167433710652629092/air-jordan-1-low-wolf-grey-282269.png?ex=654e1c5e&is=653ba75e&hm=6b3c2323edd103c7670a5b38c7807f9f1d13cd08bc0500da09b2de9850a13e37&=', 6900),
(62, 'NIKE JORDAN1 LOW Wolf Grey', 'grey', '39', 'Nike', 'Women', 12, 'https://media.discordapp.net/attachments/882572081861099543/1167433710652629092/air-jordan-1-low-wolf-grey-282269.png?ex=654e1c5e&is=653ba75e&hm=6b3c2323edd103c7670a5b38c7807f9f1d13cd08bc0500da09b2de9850a13e37&=', 6900),
(63, 'NIKE JORDAN1 LOW Wolf Grey', 'grey', '40', 'Nike', 'Women', 6, 'https://media.discordapp.net/attachments/882572081861099543/1167433710652629092/air-jordan-1-low-wolf-grey-282269.png?ex=654e1c5e&is=653ba75e&hm=6b3c2323edd103c7670a5b38c7807f9f1d13cd08bc0500da09b2de9850a13e37&=', 6900),
(64, 'NIKE JORDAN1 LOW Wolf Grey', 'grey', '41', 'Nike', 'Women', 7, 'https://media.discordapp.net/attachments/882572081861099543/1167433710652629092/air-jordan-1-low-wolf-grey-282269.png?ex=654e1c5e&is=653ba75e&hm=6b3c2323edd103c7670a5b38c7807f9f1d13cd08bc0500da09b2de9850a13e37&=', 6900),
(65, 'NIKE DUNK Low Retro PRM Valentine\'s Day', 'pink', '39', 'Nike', 'Women', 7, 'https://media.discordapp.net/attachments/882572081861099543/1167434495612420117/DunkLowRetroPRMValentine_sDay_2023.png?ex=654e1d19&is=653ba819&hm=1d4315a73f2bba030b594619033743c8433ce3c63ffa281b71b37e8788da8ea8&=', 6900),
(66, 'NIKE DUNK Low Retro PRM Valentine\'s Day', 'pink', '40', 'Nike', 'Women', 5, 'https://media.discordapp.net/attachments/882572081861099543/1167434495612420117/DunkLowRetroPRMValentine_sDay_2023.png?ex=654e1d19&is=653ba819&hm=1d4315a73f2bba030b594619033743c8433ce3c63ffa281b71b37e8788da8ea8&=', 6900),
(67, 'NIKE DUNK Low Retro PRM Valentine\'s Day', 'pink', '41', 'Nike', 'Women', 7, 'https://media.discordapp.net/attachments/882572081861099543/1167434495612420117/DunkLowRetroPRMValentine_sDay_2023.png?ex=654e1d19&is=653ba819&hm=1d4315a73f2bba030b594619033743c8433ce3c63ffa281b71b37e8788da8ea8&=', 6900),
(68, 'NIKE DUNK Low Retro PRM Valentine\'s Day', 'pink', '42', 'Nike', 'Women', 3, 'https://media.discordapp.net/attachments/882572081861099543/1167434495612420117/DunkLowRetroPRMValentine_sDay_2023.png?ex=654e1d19&is=653ba819&hm=1d4315a73f2bba030b594619033743c8433ce3c63ffa281b71b37e8788da8ea8&=', 6900),
(69, 'NIKE DUNK Low Retro PRM Valentine\'s Day', 'pink', '43', 'Nike', 'Women', 4, 'https://media.discordapp.net/attachments/882572081861099543/1167434495612420117/DunkLowRetroPRMValentine_sDay_2023.png?ex=654e1d19&is=653ba819&hm=1d4315a73f2bba030b594619033743c8433ce3c63ffa281b71b37e8788da8ea8&=', 6900),
(70, 'NIKE DUNK Low GS \'Pink Velvet\'', 'pink', '37', 'Nike', 'Women', 4, 'https://cdn.discordapp.com/attachments/882572081861099543/1167435859063222292/image_0346386b-8c2c-4066-accc-d60805b8b33c_1445x.png?ex=654e1e5e&is=653ba95e&hm=32dd8d571b14c6187de013df3ccd5ff4b8054715c8b5ebd215b2174dc2a7f4b0&', 5900),
(71, 'NIKE DUNK Low GS \'Pink Velvet\'', 'pink', '38', 'Nike', 'Women', 5, 'https://cdn.discordapp.com/attachments/882572081861099543/1167435859063222292/image_0346386b-8c2c-4066-accc-d60805b8b33c_1445x.png?ex=654e1e5e&is=653ba95e&hm=32dd8d571b14c6187de013df3ccd5ff4b8054715c8b5ebd215b2174dc2a7f4b0&', 5900),
(72, 'NIKE DUNK Low GS \'Pink Velvet\'', 'pink', '39', 'Nike', 'Women', 7, 'https://cdn.discordapp.com/attachments/882572081861099543/1167435859063222292/image_0346386b-8c2c-4066-accc-d60805b8b33c_1445x.png?ex=654e1e5e&is=653ba95e&hm=32dd8d571b14c6187de013df3ccd5ff4b8054715c8b5ebd215b2174dc2a7f4b0&', 5900),
(73, 'NIKE DUNK Low GS \'Pink Velvet\'', 'pink', '40', 'Nike', 'Women', 7, 'https://cdn.discordapp.com/attachments/882572081861099543/1167435859063222292/image_0346386b-8c2c-4066-accc-d60805b8b33c_1445x.png?ex=654e1e5e&is=653ba95e&hm=32dd8d571b14c6187de013df3ccd5ff4b8054715c8b5ebd215b2174dc2a7f4b0&', 5900),
(74, 'NIKE DUNK Low GS \'Pink Velvet\'', 'pink', '41', 'Nike', 'Women', 10, 'https://cdn.discordapp.com/attachments/882572081861099543/1167435859063222292/image_0346386b-8c2c-4066-accc-d60805b8b33c_1445x.png?ex=654e1e5e&is=653ba95e&hm=32dd8d571b14c6187de013df3ccd5ff4b8054715c8b5ebd215b2174dc2a7f4b0&', 5900),
(75, 'NIKE Air Force 1 Shadow Pale Ivory', 'white', '37', 'Nike', 'Women', 10, 'https://cdn.discordapp.com/attachments/882572081861099543/1167436472492761118/air-force-1-shadow-ivoire-pale-320083.png?ex=654e1ef0&is=653ba9f0&hm=1fd2685190dfeb83607d7535783b47afaf9b104f8ee84dd702abfbf08bf2a7cd&', 7900),
(76, 'NIKE Air Force 1 Shadow Pale Ivory', 'white', '38', 'Nike', 'Women', 10, 'https://cdn.discordapp.com/attachments/882572081861099543/1167436472492761118/air-force-1-shadow-ivoire-pale-320083.png?ex=654e1ef0&is=653ba9f0&hm=1fd2685190dfeb83607d7535783b47afaf9b104f8ee84dd702abfbf08bf2a7cd&', 7900),
(77, 'NIKE Air Force 1 Shadow Pale Ivory', 'white', '40', 'Nike', 'Women', 9, 'https://cdn.discordapp.com/attachments/882572081861099543/1167436472492761118/air-force-1-shadow-ivoire-pale-320083.png?ex=654e1ef0&is=653ba9f0&hm=1fd2685190dfeb83607d7535783b47afaf9b104f8ee84dd702abfbf08bf2a7cd&', 7900),
(78, 'NIKE Air Force 1 Shadow Pale Ivory', 'white', '43', 'Nike', 'Women', 9, 'https://cdn.discordapp.com/attachments/882572081861099543/1167436472492761118/air-force-1-shadow-ivoire-pale-320083.png?ex=654e1ef0&is=653ba9f0&hm=1fd2685190dfeb83607d7535783b47afaf9b104f8ee84dd702abfbf08bf2a7cd&', 7900),
(79, 'Yeezy Slide Glow Green KID', 'green', '25', 'Adidas', 'Kid', 9, 'https://cdn.discordapp.com/attachments/882572081861099543/1167439672633466921/adidas-yeezy-slide-glow-green-kids-GX6139_1.png?ex=654e21eb&is=653baceb&hm=5589641f807c52b00b6ca6f958564711f109b13bd5f2827ee35bae0e57eecefe&', 6900),
(80, 'Yeezy Slide Glow Green KID', 'green', '26', 'Adidas', 'Kid', 4, 'https://cdn.discordapp.com/attachments/882572081861099543/1167439672633466921/adidas-yeezy-slide-glow-green-kids-GX6139_1.png?ex=654e21eb&is=653baceb&hm=5589641f807c52b00b6ca6f958564711f109b13bd5f2827ee35bae0e57eecefe&', 6900),
(81, 'Yeezy Slide Glow Green KID', 'green', '27', 'Adidas', 'Kid', 5, 'https://cdn.discordapp.com/attachments/882572081861099543/1167439672633466921/adidas-yeezy-slide-glow-green-kids-GX6139_1.png?ex=654e21eb&is=653baceb&hm=5589641f807c52b00b6ca6f958564711f109b13bd5f2827ee35bae0e57eecefe&', 6900),
(82, 'Yeezy Slide Glow Green KID', 'green', '28', 'Adidas', 'Kid', 5, 'https://cdn.discordapp.com/attachments/882572081861099543/1167439672633466921/adidas-yeezy-slide-glow-green-kids-GX6139_1.png?ex=654e21eb&is=653baceb&hm=5589641f807c52b00b6ca6f958564711f109b13bd5f2827ee35bae0e57eecefe&', 6900),
(83, 'Yeezy 700 V3 Safflower (GS)', 'white', '26', 'Adidas', 'Kid', 3, 'https://cdn.discordapp.com/attachments/882572081861099543/1167440367231184906/yeezy-700-v3-safflower-g54853_1.png?ex=654e2291&is=653bad91&hm=5608059cfa54848cd5cf1fc4ca528dc23946830b64bf5318856dfefe170eee27&', 7800),
(84, 'Yeezy 700 V3 Safflower (GS)', 'white', '27', 'Adidas', 'Kid', 4, 'https://cdn.discordapp.com/attachments/882572081861099543/1167440367231184906/yeezy-700-v3-safflower-g54853_1.png?ex=654e2291&is=653bad91&hm=5608059cfa54848cd5cf1fc4ca528dc23946830b64bf5318856dfefe170eee27&', 7800),
(85, 'Yeezy 700 V3 Safflower (GS)', 'white', '28', 'Adidas', 'Kid', 6, 'https://cdn.discordapp.com/attachments/882572081861099543/1167440367231184906/yeezy-700-v3-safflower-g54853_1.png?ex=654e2291&is=653bad91&hm=5608059cfa54848cd5cf1fc4ca528dc23946830b64bf5318856dfefe170eee27&', 7800),
(86, 'Yeezy 700 V3 Safflower (GS)', 'white', '29', 'Adidas', 'Kid', 2, 'https://cdn.discordapp.com/attachments/882572081861099543/1167440367231184906/yeezy-700-v3-safflower-g54853_1.png?ex=654e2291&is=653bad91&hm=5608059cfa54848cd5cf1fc4ca528dc23946830b64bf5318856dfefe170eee27&', 7800),
(87, 'NIKE JORDAN1 Mid Sneaker School Game Winner (GS)', 'blue', '26', 'Nike', 'Kid', 2, 'https://cdn.discordapp.com/attachments/882572081861099543/1167440847181185094/image.png?ex=654e2303&is=653bae03&hm=968de357e0cc6a888b8429936f787f69e01e484fc92f20c1fc5012027f4595b6&', 4800),
(88, 'NIKE JORDAN1 Mid Sneaker School Game Winner (GS)', 'blue', '28', 'Nike', 'Kid', 4, 'https://cdn.discordapp.com/attachments/882572081861099543/1167440847181185094/image.png?ex=654e2303&is=653bae03&hm=968de357e0cc6a888b8429936f787f69e01e484fc92f20c1fc5012027f4595b6&', 4800),
(89, 'NIKE JORDAN1 Mid Sneaker School Game Winner (GS)', 'blue', '30', 'Nike', 'Kid', 7, 'https://cdn.discordapp.com/attachments/882572081861099543/1167440847181185094/image.png?ex=654e2303&is=653bae03&hm=968de357e0cc6a888b8429936f787f69e01e484fc92f20c1fc5012027f4595b6&', 4800),
(90, 'NIKE JORDAN1 Mid Sneaker School Game Winner (GS)', 'blue', '32', 'Nike', 'Kid', 7, 'https://cdn.discordapp.com/attachments/882572081861099543/1167440847181185094/image.png?ex=654e2303&is=653bae03&hm=968de357e0cc6a888b8429936f787f69e01e484fc92f20c1fc5012027f4595b6&', 4800),
(91, 'NIKE JORDAN1 Mid Sneaker School Game Winner (GS)', 'blue', '33', 'Nike', 'Kid', 4, 'https://cdn.discordapp.com/attachments/882572081861099543/1167440847181185094/image.png?ex=654e2303&is=653bae03&hm=968de357e0cc6a888b8429936f787f69e01e484fc92f20c1fc5012027f4595b6&', 4800),
(92, 'NIKE JORDAN1 Low Bulls (GS)', 'red', '27', 'Nike', 'Kid', 3, 'https://cdn.discordapp.com/attachments/882572081861099543/1167441552424042596/JORDAN-1-LOW-CHICAGO-BULLS-GS-1.png?ex=654e23ac&is=653baeac&hm=48a0ed0d018bebf1d11e947236608ff78b8a95ce38d291a6e906c4bacd9dfe4b&', 4800),
(93, 'NIKE JORDAN1 Low Bulls (GS)', 'red', '28', 'Nike', 'Kid', 3, 'https://cdn.discordapp.com/attachments/882572081861099543/1167441552424042596/JORDAN-1-LOW-CHICAGO-BULLS-GS-1.png?ex=654e23ac&is=653baeac&hm=48a0ed0d018bebf1d11e947236608ff78b8a95ce38d291a6e906c4bacd9dfe4b&', 4800),
(94, 'NIKE JORDAN1 Low Bulls (GS)', 'red', '30', 'Nike', 'Kid', 5, 'https://cdn.discordapp.com/attachments/882572081861099543/1167441552424042596/JORDAN-1-LOW-CHICAGO-BULLS-GS-1.png?ex=654e23ac&is=653baeac&hm=48a0ed0d018bebf1d11e947236608ff78b8a95ce38d291a6e906c4bacd9dfe4b&', 4800),
(95, 'NIKE JORDAN1 Low Bulls (GS)', 'red', '34', 'Nike', 'Kid', 7, 'https://cdn.discordapp.com/attachments/882572081861099543/1167441552424042596/JORDAN-1-LOW-CHICAGO-BULLS-GS-1.png?ex=654e23ac&is=653baeac&hm=48a0ed0d018bebf1d11e947236608ff78b8a95ce38d291a6e906c4bacd9dfe4b&', 4800),
(96, 'NIKE JORDAN1 Low Bulls (GS)', 'red', '35', 'Nike', 'Kid', 6, 'https://cdn.discordapp.com/attachments/882572081861099543/1167441552424042596/JORDAN-1-LOW-CHICAGO-BULLS-GS-1.png?ex=654e23ac&is=653baeac&hm=48a0ed0d018bebf1d11e947236608ff78b8a95ce38d291a6e906c4bacd9dfe4b&', 4800),
(97, 'NIKE JORDAN1 Mid Barely Grape (GS)', 'pink', '25', 'Nike', 'Kid', 6, 'https://cdn.discordapp.com/attachments/882572081861099543/1167442110862086234/snakerstoreAir_Jordan_1_Mid_Barely_Grape-DQ8423-501-0.png?ex=654e2431&is=653baf31&hm=cf541638438970d1b4522f9c056e76bbcae0883c9dff3fa55f3f2b0f3561e7ab&', 5800),
(98, 'NIKE JORDAN1 Mid Barely Grape (GS)', 'pink', '26', 'Nike', 'Kid', 7, 'https://cdn.discordapp.com/attachments/882572081861099543/1167442110862086234/snakerstoreAir_Jordan_1_Mid_Barely_Grape-DQ8423-501-0.png?ex=654e2431&is=653baf31&hm=cf541638438970d1b4522f9c056e76bbcae0883c9dff3fa55f3f2b0f3561e7ab&', 5800),
(99, 'NIKE JORDAN1 Mid Barely Grape (GS)', 'pink', '28', 'Nike', 'Kid', 7, 'https://cdn.discordapp.com/attachments/882572081861099543/1167442110862086234/snakerstoreAir_Jordan_1_Mid_Barely_Grape-DQ8423-501-0.png?ex=654e2431&is=653baf31&hm=cf541638438970d1b4522f9c056e76bbcae0883c9dff3fa55f3f2b0f3561e7ab&', 5800),
(100, 'NIKE JORDAN1 Mid Barely Grape (GS)', 'pink', '30', 'Nike', 'Kid', 8, 'https://cdn.discordapp.com/attachments/882572081861099543/1167442110862086234/snakerstoreAir_Jordan_1_Mid_Barely_Grape-DQ8423-501-0.png?ex=654e2431&is=653baf31&hm=cf541638438970d1b4522f9c056e76bbcae0883c9dff3fa55f3f2b0f3561e7ab&', 5800),
(101, 'NIKE JORDAN1 Mid Barely Grape (GS)', 'pink', '33', 'Nike', 'Kid', 7, 'https://cdn.discordapp.com/attachments/882572081861099543/1167442110862086234/snakerstoreAir_Jordan_1_Mid_Barely_Grape-DQ8423-501-0.png?ex=654e2431&is=653baf31&hm=cf541638438970d1b4522f9c056e76bbcae0883c9dff3fa55f3f2b0f3561e7ab&', 5800),
(102, 'NIKE JORDAN1 Mid Barely Grape (GS)', 'pink', '34', 'Nike', 'Kid', 7, 'https://cdn.discordapp.com/attachments/882572081861099543/1167442110862086234/snakerstoreAir_Jordan_1_Mid_Barely_Grape-DQ8423-501-0.png?ex=654e2431&is=653baf31&hm=cf541638438970d1b4522f9c056e76bbcae0883c9dff3fa55f3f2b0f3561e7ab&', 5800),
(103, 'New Balance 530 White Silver Navy', 'white', '37', 'New Balance', 'New and Outstanding', 7, 'https://cdn.discordapp.com/attachments/882572081861099543/1167443778177601657/new-balance-530-white-silver-navy-1-1000.png?ex=654e25be&is=653bb0be&hm=6417e7d138c07ccef44429e36168d212e1e9991d0328d25b89906a3856d15f3e&', 5800),
(104, 'New Balance 530 White Silver Navy', 'white', '38', 'New Balance', 'New and Outstanding', 7, 'https://cdn.discordapp.com/attachments/882572081861099543/1167443778177601657/new-balance-530-white-silver-navy-1-1000.png?ex=654e25be&is=653bb0be&hm=6417e7d138c07ccef44429e36168d212e1e9991d0328d25b89906a3856d15f3e&', 5800),
(105, 'New Balance 530 White Silver Navy', 'white', '39', 'New Balance', 'New and Outstanding', 7, 'https://cdn.discordapp.com/attachments/882572081861099543/1167443778177601657/new-balance-530-white-silver-navy-1-1000.png?ex=654e25be&is=653bb0be&hm=6417e7d138c07ccef44429e36168d212e1e9991d0328d25b89906a3856d15f3e&', 5800),
(106, 'New Balance 530 White Silver Navy', 'white', '41', 'New Balance', 'New and Outstanding', 5, 'https://cdn.discordapp.com/attachments/882572081861099543/1167443778177601657/new-balance-530-white-silver-navy-1-1000.png?ex=654e25be&is=653bb0be&hm=6417e7d138c07ccef44429e36168d212e1e9991d0328d25b89906a3856d15f3e&', 5800),
(107, 'New Balance 530 White Silver Navy', 'white', '42', 'New Balance', 'New and Outstanding', 5, 'https://cdn.discordapp.com/attachments/882572081861099543/1167443778177601657/new-balance-530-white-silver-navy-1-1000.png?ex=654e25be&is=653bb0be&hm=6417e7d138c07ccef44429e36168d212e1e9991d0328d25b89906a3856d15f3e&', 5800),
(108, 'New Balance 530 White Silver Navy', 'white', '45', 'New Balance', 'New and Outstanding', 7, 'https://cdn.discordapp.com/attachments/882572081861099543/1167443778177601657/new-balance-530-white-silver-navy-1-1000.png?ex=654e25be&is=653bb0be&hm=6417e7d138c07ccef44429e36168d212e1e9991d0328d25b89906a3856d15f3e&', 5800),
(109, 'New Balance 990 v3 MiUSA Teddy Santis Scarlet', 'red', '42', 'New Balance', 'New and Outstanding', 7, 'https://cdn.discordapp.com/attachments/882572081861099543/1167444232823373875/image.png?ex=654e262b&is=653bb12b&hm=491f10c40faa4deb39243ecc9c2e82de90c566b740a986e434d2ce2a7d0718da&', 7800),
(110, 'New Balance 990 v3 MiUSA Teddy Santis Scarlet', 'red', '43', 'New Balance', 'New and Outstanding', 7, 'https://cdn.discordapp.com/attachments/882572081861099543/1167444232823373875/image.png?ex=654e262b&is=653bb12b&hm=491f10c40faa4deb39243ecc9c2e82de90c566b740a986e434d2ce2a7d0718da&', 7800),
(111, 'New Balance 990 v3 MiUSA Teddy Santis Scarlet', 'red', '44', 'New Balance', 'New and Outstanding', 7, 'https://cdn.discordapp.com/attachments/882572081861099543/1167444232823373875/image.png?ex=654e262b&is=653bb12b&hm=491f10c40faa4deb39243ecc9c2e82de90c566b740a986e434d2ce2a7d0718da&', 7800),
(112, 'New Balance 990 v3 MiUSA Teddy Santis Scarlet', 'red', '45', 'New Balance', 'New and Outstanding', 8, 'https://cdn.discordapp.com/attachments/882572081861099543/1167444232823373875/image.png?ex=654e262b&is=653bb12b&hm=491f10c40faa4deb39243ecc9c2e82de90c566b740a986e434d2ce2a7d0718da&', 7800),
(113, 'New Balance 990 v3 MiUSA Teddy Santis Scarlet', 'red', '46', 'New Balance', 'New and Outstanding', 4, 'https://cdn.discordapp.com/attachments/882572081861099543/1167444232823373875/image.png?ex=654e262b&is=653bb12b&hm=491f10c40faa4deb39243ecc9c2e82de90c566b740a986e434d2ce2a7d0718da&', 7800),
(114, 'Salomon XT-6 Fiery Red', 'red', '42', 'Salomon', 'New and Outstanding', 4, 'https://cdn.discordapp.com/attachments/882572081861099543/1167444773326553199/salomon-xt-6-10th-anniversary-fiery-red-1.png?ex=654e26ac&is=653bb1ac&hm=8de510cbc41c3e2aac6ff3a6f3af74ce187e891ed84c7fe6fa8c66f7258163f8&', 14800),
(115, 'Salomon XT-6 Fiery Red', 'red', '44', 'Salomon', 'New and Outstanding', 5, 'https://cdn.discordapp.com/attachments/882572081861099543/1167444773326553199/salomon-xt-6-10th-anniversary-fiery-red-1.png?ex=654e26ac&is=653bb1ac&hm=8de510cbc41c3e2aac6ff3a6f3af74ce187e891ed84c7fe6fa8c66f7258163f8&', 14800),
(116, 'Salomon XT-6 Fiery Red', 'red', '45', 'Salomon', 'New and Outstanding', 7, 'https://cdn.discordapp.com/attachments/882572081861099543/1167444773326553199/salomon-xt-6-10th-anniversary-fiery-red-1.png?ex=654e26ac&is=653bb1ac&hm=8de510cbc41c3e2aac6ff3a6f3af74ce187e891ed84c7fe6fa8c66f7258163f8&', 14800),
(117, 'AIR JORDAN4 Retro Fire Red (2020)', 'red', '41', 'Nike', 'New and Outstanding', 4, 'https://cdn.discordapp.com/attachments/882572081861099543/1167445208921800756/air-jordan-4-retro-fire-red-2020-gs-1-1000.png?ex=654e2713&is=653bb213&hm=973cb01bde0a83bfacef1bfa6e377ec6062c8a52886b1f2a47bc88688c948721&', 16800),
(118, 'AIR JORDAN4 Retro Fire Red (2020)', 'red', '42', 'Nike', 'New and Outstanding', 3, 'https://cdn.discordapp.com/attachments/882572081861099543/1167445208921800756/air-jordan-4-retro-fire-red-2020-gs-1-1000.png?ex=654e2713&is=653bb213&hm=973cb01bde0a83bfacef1bfa6e377ec6062c8a52886b1f2a47bc88688c948721&', 16800),
(119, 'AIR JORDAN4 Retro Fire Red (2020)', 'red', '43', 'Nike', 'New and Outstanding', 10, 'https://cdn.discordapp.com/attachments/882572081861099543/1167445208921800756/air-jordan-4-retro-fire-red-2020-gs-1-1000.png?ex=654e2713&is=653bb213&hm=973cb01bde0a83bfacef1bfa6e377ec6062c8a52886b1f2a47bc88688c948721&', 16800),
(120, 'AIR JORDAN4 Retro Fire Red (2020)', 'red', '45', 'Nike', 'New and Outstanding', 9, 'https://cdn.discordapp.com/attachments/882572081861099543/1167445208921800756/air-jordan-4-retro-fire-red-2020-gs-1-1000.png?ex=654e2713&is=653bb213&hm=973cb01bde0a83bfacef1bfa6e377ec6062c8a52886b1f2a47bc88688c948721&', 16800),
(121, 'AIR JORDAN4 Retro Fire Red (2020)', 'red', '46', 'Nike', 'New and Outstanding', 9, 'https://cdn.discordapp.com/attachments/882572081861099543/1167445208921800756/air-jordan-4-retro-fire-red-2020-gs-1-1000.png?ex=654e2713&is=653bb213&hm=973cb01bde0a83bfacef1bfa6e377ec6062c8a52886b1f2a47bc88688c948721&', 16800),
(122, 'NIKE AIR Max 97 OG Silver Bullet', 'silver', '39', 'Nike', 'New and Outstanding', 9, 'https://cdn.discordapp.com/attachments/882572081861099543/1167447522298564738/air-max-97-silver-bullet-2022-2.png?ex=654e293b&is=653bb43b&hm=12eb26b07a00d416e40cc5906ceb4ae127a4b288f7a080f6362994562e7d910f&', 6500),
(123, 'NIKE AIR Max 97 OG Silver Bullet', 'silver', '40', 'Nike', 'New and Outstanding', 8, 'https://cdn.discordapp.com/attachments/882572081861099543/1167447522298564738/air-max-97-silver-bullet-2022-2.png?ex=654e293b&is=653bb43b&hm=12eb26b07a00d416e40cc5906ceb4ae127a4b288f7a080f6362994562e7d910f&', 6500),
(124, 'NIKE AIR Max 97 OG Silver Bullet', 'silver', '42', 'Nike', 'New and Outstanding', 10, 'https://cdn.discordapp.com/attachments/882572081861099543/1167447522298564738/air-max-97-silver-bullet-2022-2.png?ex=654e293b&is=653bb43b&hm=12eb26b07a00d416e40cc5906ceb4ae127a4b288f7a080f6362994562e7d910f&', 6500),
(125, 'NIKE AIR Max 97 OG Silver Bullet', 'silver', '43', 'Nike', 'New and Outstanding', 11, 'https://cdn.discordapp.com/attachments/882572081861099543/1167447522298564738/air-max-97-silver-bullet-2022-2.png?ex=654e293b&is=653bb43b&hm=12eb26b07a00d416e40cc5906ceb4ae127a4b288f7a080f6362994562e7d910f&', 6500),
(126, 'NIKE AIR Max 97 OG Silver Bullet', 'silver', '45', 'Nike', 'New and Outstanding', 3, 'https://cdn.discordapp.com/attachments/882572081861099543/1167447522298564738/air-max-97-silver-bullet-2022-2.png?ex=654e293b&is=653bb43b&hm=12eb26b07a00d416e40cc5906ceb4ae127a4b288f7a080f6362994562e7d910f&', 6500),
(127, 'NIKE AIR Max 97 OG Silver Bullet', 'silver', '46', 'Nike', 'New and Outstanding', 8, 'https://cdn.discordapp.com/attachments/882572081861099543/1167447522298564738/air-max-97-silver-bullet-2022-2.png?ex=654e293b&is=653bb43b&hm=12eb26b07a00d416e40cc5906ceb4ae127a4b288f7a080f6362994562e7d910f&', 6500);

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
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`CartID`),
  ADD KEY `Pro_id` (`Pro_id`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`Fa_id`),
  ADD KEY `Pro_id` (`Pro_id`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`Loc_id`),
  ADD KEY `UserID` (`UserID`);

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
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `CartID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `Fa_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `UserID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `pay_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `Pro_id` int NOT NULL AUTO_INCREMENT COMMENT 'รหัสสินค้า', AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT for table `promotions`
--
ALTER TABLE `promotions`
  MODIFY `promotion_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`Pro_id`) REFERENCES `products` (`Pro_id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `members` (`UserID`);

--
-- Constraints for table `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`Pro_id`) REFERENCES `products` (`Pro_id`),
  ADD CONSTRAINT `favorites_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `members` (`UserID`);

--
-- Constraints for table `locations`
--
ALTER TABLE `locations`
  ADD CONSTRAINT `locations_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `members` (`UserID`);

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
