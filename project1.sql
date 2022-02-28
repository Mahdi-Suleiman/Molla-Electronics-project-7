-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 28, 2022 at 07:02 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project1`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `img`) VALUES
(1, 'Samsung', 'Samsung mobile devices, accessories and more.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/24/Samsung_Logo.svg/768px-Samsung_Logo.svg.png'),
(2, 'Huawei', 'Huawei mobile devices and more...', 'http://logok.org/wp-content/uploads/2014/06/Huawei-logo-sun-880x660.png'),
(7, 'Apple', 'Apple mobile devices and accessories.', 'https://1000logos.net/wp-content/uploads/2016/10/Apple-Logo-640x400.png');

-- --------------------------------------------------------

--
-- Table structure for table `items_checkout`
--

CREATE TABLE `items_checkout` (
  `id` int(255) NOT NULL,
  `products_id` int(255) NOT NULL,
  `quantity` int(255) NOT NULL,
  `final_price` int(255) NOT NULL,
  `orders_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `items_checkout`
--

INSERT INTO `items_checkout` (`id`, `products_id`, `quantity`, `final_price`, `orders_id`, `user_id`) VALUES
(39, 1, 1, 1500, 19, 17),
(40, 2, 1, 160, 19, 17),
(41, 14, 1, 405, 20, 17),
(42, 2, 1, 160, 21, 17),
(43, 2, 2, 320, 22, 17),
(44, 2, 1, 160, 23, 17),
(45, 1, 1, 1500, 24, 17),
(46, 2, 2, 320, 25, 17),
(47, 5, 2, 720, 26, 21),
(48, 2, 1, 160, 27, 15);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `date` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `street_address` varchar(255) NOT NULL,
  `post_code` int(11) NOT NULL,
  `phone` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `total`, `date`, `first_name`, `last_name`, `email`, `country`, `street_address`, `post_code`, `phone`) VALUES
(19, 17, 1660, '2022-01-31 14:18:44.828560', 'Shafira', 'Flores', 'podynefi@mailinator.com', 'Consequat Velit do', 'Fugit soluta nisi q', 0, '1'),
(20, 17, 405, '2022-01-31 14:20:34.113268', 'Malcolm', 'David', 'salugeho@mailinator.com', 'Nostrud facilis quis', 'Quas et reiciendis e', 123456, '777685139'),
(21, 17, 160, '2022-01-31 14:21:38.195139', 'Aaron', 'Fischer', 'fyceh@mailinator.com', 'Praesentium est dolo', 'Omnis illo a eum ex ', 0, '+1 (986) 126-9699'),
(22, 17, 320, '2022-01-31 16:12:01.134294', 'mahdi', 'suleiman', 'mh@gmail.com', 'jordan', 'jorda', 123456, '123465789'),
(23, 17, 160, '2022-01-31 16:24:57.979889', 'mahdi', 'suleiman', 'mh@gmail.com', 'Jordan', 'Amman', 123456, '0777685139'),
(24, 17, 1500, '2022-01-31 18:09:36.992350', 'Zorita', 'Castaneda', 'zumuhof@mailinator.com', 'Ullamco nisi aliquam', 'In impedit in ipsum', 0, '+1 (198) 231-7328'),
(25, 17, 320, '2022-02-01 08:29:10.452924', 'mahdi', 'suleiman', 'mh@gmail.com', 'Jordan', 'amman', 123456, '0777685139'),
(26, 21, 720, '2022-02-28 17:45:46.978560', 'mahdi', 'suleiman', 'mahdi@gmail.com', 'Jordan', 'Amman', 123456, '0777777777'),
(27, 15, 160, '2022-02-28 17:57:01.475803', 'Neve', 'Ellison', 'dunuzoke@mailinator.com', 'Aut possimus quasi ', 'Qui cillum dolores o', 0, '+1 (608) 226-5748');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` float(11,0) NOT NULL,
  `stock` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `discount` float NOT NULL,
  `category_id` int(255) NOT NULL,
  `img` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `stock`, `description`, `discount`, `category_id`, `img`) VALUES
(1, 'Samsung Galaxy S21 Ultra 5G Dual SIM 128GB 12GB', 1500, 147, 'OS:\nAndroid 11, One UI 3.1\nChipset:\nExynos 2100 (5 nm)\nCPU:\nOcta-core (1x2.9 GHz Cortex-X1 & 3x2.80 GHz Cortex-A78 & 4x2.2 GHz Cortex-A55)\nGPU:\nMali-G78 MP14', 0, 1, 'https://mobilestoreimages.blob.core.windows.net/mobilestoreimages/Samsung%20Galaxy%20S21%20Ultra%20silver%20-%20full.png'),
(2, 'Samsung Galaxy A12', 200, 489, 'OS	Android 10, upgradable to Android 11, One UI 3.1\r\nChipset	Mediatek MT6765 Helio P35 (12nm)\r\nCPU	Octa-core (4x2.35 GHz Cortex-A53 & 4x1.8 GHz Cortex-A53)\r\nGPU	PowerVR GE8320', 5, 1, 'https://mobilestoreimages.blob.core.windows.net/mobilestoreimages/Samsung%20Galaxy%20A12%20blue%20-%20full.png'),
(3, 'Samsung Galaxy S20 FE', 1800, 200, 'OS:\r\nAndroid 11, One UI 3.1.1\r\nChipset:\r\nQualcomm SM8350 Snapdragon 888 5G (5 nm)\r\nCPU:\r\nOcta-core (1x2.84 GHz Kryo 680 & 3x2.42 GHz Kryo 680 & 4x1.80 GHz Kryo 680\r\nGPU:\r\nAdreno 660', 0, 1, 'https://mobilestoreimages.blob.core.windows.net/mobilestoreimages/Samsung%20Galaxy%20S20%20FE%20cloud%20mint%20-%20full.png'),
(4, 'Samsung Galaxy S21+ 5G', 350, 150, 'OS	Android 11, One UI 3.1\r\nChipset	Exynos 2100 (5 nm) - International\r\nQualcomm SM8350 Snapdragon 888 5G (5 nm) - USA/China\r\nCPU	Octa-core (1x2.9 GHz Cortex-X1 & 3x2.80 GHz Cortex-A78 & 4x2.2 GHz Cortex-A55) - International\r\nOcta-core (1x2.84 GHz Kryo 680', 0, 1, 'https://mobilestoreimages.blob.core.windows.net/mobilestoreimages/Samsung%20Galaxy%20S21%20Plus%20%20black%20-%20full.png'),
(5, 'Apple iPhone SE 2020', 450, 98, 'OS	iOS 13, upgradable to iOS 15.3\r\nChipset	Apple A13 Bionic (7 nm+)\r\nCPU	Hexa-core (2x2.65 GHz Lightning + 4x1.8 GHz Thunder)\r\nGPU	Apple GPU (4-core graphics)', 5, 7, 'https://mobilestoreimages.blob.core.windows.net/mobilestoreimages/Apple%20iPhone%20SE%202020%20black%20-%20full.png'),
(6, 'Apple iPhone 12', 1000, 150, 'OS	iOS 14.1, upgradable to iOS 15.3\r\nChipset	Apple A14 Bionic (5 nm)\r\nCPU	Hexa-core (2x3.1 GHz Firestorm + 4x1.8 GHz Icestorm)\r\nGPU	Apple GPU (4-core graphics)', 0, 7, 'https://mobilestoreimages.blob.core.windows.net/mobilestoreimages/Apple%20iPhone%2012%20black%20-%20full.png'),
(7, 'Apple iPhone 13', 1450, 150, 'OS	iOS 15, upgradable to iOS 15.3\r\nChipset	Apple A15 Bionic (5 nm)\r\nCPU	Hexa-core (2x3.22 GHz Avalanche + 4xX.X GHz Blizzard)\r\nGPU	Apple GPU (4-core graphics)', 0, 7, 'https://mobilestoreimages.blob.core.windows.net/mobilestoreimages/APPLE---iPhone-13-Mini---Black--Full.png'),
(12, 'Huawei Y7P', 190, 80, 'OS	Android 9.0 (Pie), EMUI 9, no Google Play Services Chipset	Kirin 710F (12 nm) CPU	Octa-core (4x2.2 GHz Cortex-A73 & 4x1.7 GHz Cortex-A53) GPU	Mali-G51 MP4', 5, 2, 'https://mobilestoreimages.blob.core.windows.net/mobilestoreimages/Huawei%20%20Y7P%20midnight%20black%20-%20full.png'),
(13, 'Huawei P Smart 2021', 550, 100, '	OS	Android 10, EMUI 10.1, no Google Play Services Chipset	Kirin 710A (14 nm) CPU	Octa-core (4x2.0 GHz Cortex-A73 & 4x1.7 GHz Cortex-A53) GPU	Mali-G51 MP4', 0, 2, 'https://mobilestoreimages.blob.core.windows.net/mobilestoreimages/Huawei%20%20P%20Smart%202021%20blush%20gold%20-%20full.png'),
(14, 'Huawei Nova 8I', 450, 59, 'OS	Android 10, EMUI 11, no Google Play Services Chipset	Qualcomm SM6115 Snapdragon 662 (11 nm) CPU	Octa-core (4x2.0 GHz Kryo 260 Gold & 4x1.8 GHz Kryo 260 Silver) GPU	Adreno 610', 10, 2, 'https://mobilestoreimages.blob.core.windows.net/mobilestoreimages/HUAWEI-NOVA-8i-----BLACK---FULL.png');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `review` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `product_id`, `user_id`, `review`) VALUES
(4, 1, 17, 'nice product'),
(5, 1, 15, 'nice shop');

-- --------------------------------------------------------

--
-- Table structure for table `tempcart`
--

CREATE TABLE `tempcart` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `img` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` float NOT NULL,
  `quantity` int(11) NOT NULL,
  `discount` float NOT NULL,
  `final_price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tempcart`
--

INSERT INTO `tempcart` (`id`, `product_id`, `user_id`, `img`, `name`, `price`, `quantity`, `discount`, `final_price`) VALUES
(24, 1, 20, 'https://mobilestoreimages.blob.core.windows.net/mobilestoreimages/Samsung%20Galaxy%20S21%20Ultra%20silver%20-%20full.png', 'Samsung Galaxy S21 Ultra 5G Dual SIM 128GB 12GB RAM SM-G998F/DS Phantom Silver', 1500, 1, 0, 1500),
(25, 2, 20, 'https://mobilestoreimages.blob.core.windows.net/mobilestoreimages/Samsung%20Galaxy%20A12%20blue%20-%20full.png', 'Samsung Galaxy A12', 200, 1, 5, 160);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`) VALUES
(15, 'admin', 'admin@admin.com', 'e10adc3949ba59abbe56e057f20f883e', 1),
(16, 'Sanad', 'sanad@gmail.com', '25d55ad283aa400af464c76d713c07ad', 0),
(17, 'Mahdi', 'mahdi@gmail.com', '25d55ad283aa400af464c76d713c07ad', 0),
(18, 'Farah', 'farah@gmail.com', '25d55ad283aa400af464c76d713c07ad', 0),
(19, 'AbdulKareem', 'abed@gmail.com', '25d55ad283aa400af464c76d713c07ad', 0),
(20, 'mahd', 'mh@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 0),
(21, 'mahdi', 'mahdi2@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items_checkout`
--
ALTER TABLE `items_checkout`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_id` (`orders_id`),
  ADD KEY `products_id` (`products_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_ibfk_1` (`category_id`),
  ADD KEY `products_ibfk_2` (`discount`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tempcart`
--
ALTER TABLE `tempcart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `items_checkout`
--
ALTER TABLE `items_checkout`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tempcart`
--
ALTER TABLE `tempcart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `items_checkout`
--
ALTER TABLE `items_checkout`
  ADD CONSTRAINT `items_checkout_ibfk_1` FOREIGN KEY (`orders_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `items_checkout_ibfk_2` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `items_checkout_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `tempcart`
--
ALTER TABLE `tempcart`
  ADD CONSTRAINT `tempcart_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tempcart_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
