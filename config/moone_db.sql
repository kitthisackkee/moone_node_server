-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 12, 2023 at 02:51 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `moone_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `buy`
--

CREATE TABLE `buy` (
  `id_buy` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `price_total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `buy_detail`
--

CREATE TABLE `buy_detail` (
  `id_butdt` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `qty` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `date_time` int(11) NOT NULL,
  `id_pro` int(11) NOT NULL,
  `id_buy` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `buy_order`
--

CREATE TABLE `buy_order` (
  `id_buyorder` int(11) NOT NULL,
  `name_pro` varchar(30) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `type` varchar(20) NOT NULL,
  `id_pro` int(11) NOT NULL,
  `id_order` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id_ctm` int(11) NOT NULL,
  `uuid` varchar(100) DEFAULT NULL,
  `name_ctm` varchar(30) NOT NULL,
  `address` varchar(20) NOT NULL,
  `tell` varchar(20) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id_ctm`, `uuid`, `name_ctm`, `address`, `tell`, `email`, `password`) VALUES
(1, '5bb35d24-dcc4-4aa1-b948-0013a9c3e680', 'demo', 'ທົ່ງຂັນຄຳ', '0205555666', 'demo@gmail.com', '$2a$10$f4TlQWGqmq0VB0CTwKDN3uGmjbicX8nNiO7ScA7kTwm8kkx23bbZq'),
(43, '01732a4e-a167-4730-9c39-e82fbfe580fc', 'egrh', 'dhd', '747474748', 'k@gmail.com', '$2a$10$8iA2NAqcSAfb/TvrZEPdHe2CfdmB.IGTXBzZbEr5ho8WoCJP.BXYy'),
(44, '2afbe560-3a16-48e7-833a-7f69ccabdb08', 'rhrh', 'dhr', 't474736373', 'gd@gmail.com', '$2a$10$bcZ/pp6iKIh06u0LgGiTqu1LXbMsOJhjXieYoaKk4lgyHtf8/.Lnq'),
(45, 'bc203cc4-2fd3-41d6-9f6a-5db64c42f4dc', 'rhrjr', 'rur', '53673737', 'dhdhd@gmail.com', '$2a$10$6SS4Ly23OOyPeerTr1YUFev.4vV8EI8iB9krPkWvFUzonWR3bTql.');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id_emp` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `address` varchar(30) NOT NULL,
  `tell` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  `status_m` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id_emp`, `name`, `address`, `tell`, `email`, `password`, `status_m`) VALUES
(1, 'xang', 'kvs', '12345678', 'xang@gmail.com', '123456', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id_order` int(11) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `totals` int(11) NOT NULL,
  `id_spp` int(11) NOT NULL,
  `id_buydt` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id_pro` int(11) NOT NULL,
  `name_pro` varchar(30) NOT NULL,
  `type_p` varchar(20) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `picture` varchar(50) NOT NULL,
  `detail` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id_pro`, `name_pro`, `type_p`, `qty`, `price`, `picture`, `detail`) VALUES
(2, 'trousers', '2', 2, 55000, 'hh.png', 'trousers hand made'),
(3, 'shirt', '1', 0, 100000, 'blackshirt1.png', 't-shirt hand made '),
(4, 'shirt', '1', 0, 100000, 'blackshirt.png', 't-shirt hand made'),
(5, 'trousers', '2', 1, 125000, 'blacktrouser.png', 'trousers hand made'),
(6, 'trousers', '2', 1, 125000, 'trouser.png', 'trousers hand made'),
(7, 'ຶັwhite bag', '3', 1, 65000, 'bag.png', 'bag hand made'),
(8, 'bag', '3', 1, 75000, 'bag1.png', 'bag hand made'),
(12, 'ເສື້ອສີຂາວ', '1', 2, 145000, 'WhatsApp Image 2023-07-10 at 15.27.08.jpeg', 'ເສື້ອສີຂາວ ຂະໜາດ M'),
(13, 'ເສື້ອສີຂາວ', '1', 2, 175000, 'shirt.jfif', 'ເສື້ອແຂນຍາວສີຂາວ ຂະໜາດ M'),
(14, 'ເສື້ອແຂນຢາວສີຂາວ', '1', 1, 175000, 'shritg.jfif', 'ເສື້ອແຂນຢາວ ສີຂາວ ຂະໜາດ L'),
(15, 'ເສື້ອແຂນສັນ', '1', 1, 145000, 'e1912434-977f-4176-abcf-c218f6022941.jfif', 'ເສື້ອແຂນສັນ ຂະໜາດ L');

-- --------------------------------------------------------

--
-- Table structure for table `product_type`
--

CREATE TABLE `product_type` (
  `id_type` int(11) NOT NULL,
  `name_type` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_type`
--

INSERT INTO `product_type` (`id_type`, `name_type`) VALUES
(1, 'ເສື້ອ'),
(2, 'ໂສ້ງ'),
(3, 'ກະເປົ່າ');

-- --------------------------------------------------------

--
-- Table structure for table `sale`
--

CREATE TABLE `sale` (
  `id_sale` int(11) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `sale_status` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `tell` varchar(20) NOT NULL,
  `village` varchar(30) NOT NULL,
  `district` varchar(30) NOT NULL,
  `province` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sale`
--

INSERT INTO `sale` (`id_sale`, `date_time`, `sale_status`, `total`, `name`, `tell`, `village`, `district`, `province`) VALUES
(889208, '2023-06-25 08:58:19', 2, 100000, 'ton', '02059583013', 'phaxai', 'sisattanark', 'nakhoneluang'),
(944313, '2023-06-25 09:02:34', 2, 100000, 'xang', '123456', 'KVS', 'sisuttanark', 'nakhoneluang');

-- --------------------------------------------------------

--
-- Table structure for table `sale_detail`
--

CREATE TABLE `sale_detail` (
  `id_saledt` int(11) NOT NULL,
  `id_sale` int(11) NOT NULL,
  `id_pro` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sale_detail`
--

INSERT INTO `sale_detail` (`id_saledt`, `id_sale`, `id_pro`, `qty`, `price`, `total`) VALUES
(7, 887999, 3, 1, 100000, 100000),
(10, 889208, 3, 1, 100000, 100000),
(11, 944313, 4, 1, 100000, 100000);

-- --------------------------------------------------------

--
-- Table structure for table `sale_status`
--

CREATE TABLE `sale_status` (
  `id` int(11) NOT NULL,
  `No` int(11) NOT NULL,
  `status` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sale_status`
--

INSERT INTO `sale_status` (`id`, `No`, `status`) VALUES
(1, 2, 'ກຳລັງສັ່ງຊື້'),
(2, 3, 'ຈັດສົ່ງແລ້ວ'),
(3, 4, 'ຍົກເລີກ');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id_spp` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `tell` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buy`
--
ALTER TABLE `buy`
  ADD PRIMARY KEY (`id_buy`);

--
-- Indexes for table `buy_detail`
--
ALTER TABLE `buy_detail`
  ADD PRIMARY KEY (`id_butdt`);

--
-- Indexes for table `buy_order`
--
ALTER TABLE `buy_order`
  ADD PRIMARY KEY (`id_buyorder`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id_ctm`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id_emp`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id_order`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id_pro`);

--
-- Indexes for table `product_type`
--
ALTER TABLE `product_type`
  ADD PRIMARY KEY (`id_type`);

--
-- Indexes for table `sale`
--
ALTER TABLE `sale`
  ADD PRIMARY KEY (`id_sale`);

--
-- Indexes for table `sale_detail`
--
ALTER TABLE `sale_detail`
  ADD PRIMARY KEY (`id_saledt`);

--
-- Indexes for table `sale_status`
--
ALTER TABLE `sale_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id_spp`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buy`
--
ALTER TABLE `buy`
  MODIFY `id_buy` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `buy_detail`
--
ALTER TABLE `buy_detail`
  MODIFY `id_butdt` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `buy_order`
--
ALTER TABLE `buy_order`
  MODIFY `id_buyorder` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id_ctm` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id_emp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id_order` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id_pro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `product_type`
--
ALTER TABLE `product_type`
  MODIFY `id_type` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sale`
--
ALTER TABLE `sale`
  MODIFY `id_sale` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=944314;

--
-- AUTO_INCREMENT for table `sale_detail`
--
ALTER TABLE `sale_detail`
  MODIFY `id_saledt` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `sale_status`
--
ALTER TABLE `sale_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id_spp` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
