-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.3.14-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for mywebsite
CREATE DATABASE IF NOT EXISTS `mywebsite` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `mywebsite`;

-- Dumping structure for table mywebsite.chef
CREATE TABLE IF NOT EXISTS `chef` (
  `chefID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `aboutMe` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`chefID`)
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8 COMMENT='List of chefs that can be chosen to order food from';

-- Dumping data for table mywebsite.chef: ~10 rows (approximately)
/*!40000 ALTER TABLE `chef` DISABLE KEYS */;
INSERT INTO `chef` (`chefID`, `name`, `aboutMe`) VALUES
	(11, 'Ferdousi Begum(B)', 'Bangali Cuisine'),
	(22, 'Ruksana Akhter(B)', 'Bangali Cuisine'),
	(33, 'Shazia Ali(P)', 'Pakistani Cuisine'),
	(44, 'Samara Khan(P)', 'Pakistani Cuisine'),
	(55, 'Ankita Jha(NI)', 'North Indian Cuisine'),
	(66, 'Navya Swamy(NI)', 'North Indian Cuisine'),
	(77, 'Gunjan Aggarwal(SI)', 'South Indian Cuisine'),
	(88, 'Richa Rattan(SI)', 'South Indian Cuisine'),
	(99, 'Asiya Andrabi(K)', 'Kashmiri Cuisine'),
	(110, 'Bajracharya Bakhrel(N)', 'Nepalese Cuisine');
/*!40000 ALTER TABLE `chef` ENABLE KEYS */;

-- Dumping structure for table mywebsite.food
CREATE TABLE IF NOT EXISTS `food` (
  `foodID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `f_regionID` int(11) DEFAULT NULL,
  `f_chefID` int(11) DEFAULT NULL,
  PRIMARY KEY (`foodID`),
  KEY `FK_food_region` (`f_regionID`),
  KEY `FK_food_chefs` (`f_chefID`),
  CONSTRAINT `FK_food_chefs` FOREIGN KEY (`f_chefID`) REFERENCES `chef` (`chefID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_food_region` FOREIGN KEY (`f_regionID`) REFERENCES `region` (`regionID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- Dumping data for table mywebsite.food: ~31 rows (approximately)
/*!40000 ALTER TABLE `food` DISABLE KEYS */;
INSERT INTO `food` (`foodID`, `name`, `description`, `price`, `f_regionID`, `f_chefID`) VALUES
	(2, 'Beef Tehari', 'Delicious boneless beef biryani cooked with mustard oil and lots of chilis. ', 10, 30, 11),
	(3, '5-Bhorthas', 'The Fave-five: Shutki, aloo, begun, kalijeera, and tomato bhortha.  ', 7, 30, 22),
	(4, 'Kalo Bhuna', 'Cooked for hours, blackened tender beef.', 8, 30, 11),
	(5, 'Elish Maas', 'The BD national favorite fish fry: Elish! ', 8, 30, 22),
	(6, 'Rui Maas', 'Delicious fish curry. ', 8, 30, 22),
	(7, 'Khichuri', 'A lentil and rice mixed comfort food. ', 7, 20, 11),
	(8, 'Idli', 'Yummy rice cakes for dipping into chutneys and curries. ', 6, 20, 77),
	(9, 'Dosa', 'Paper thin crepes for dipping into chutneys and curries. ', 7, 20, 77),
	(10, 'Pulihora', 'Mouthwatering Tamarind Rice from the streets of Tamil Nadu.', 10, 20, 88),
	(11, 'Ven Pongal', 'A sweet or savory dish with rice and moong daal.', 10, 20, 88),
	(12, 'Pav Bhaji', 'Dip your rolls into this deliciously thick vegetable curry. ', 8, 10, 66),
	(13, 'Chappati', 'Soft, round flatbreads for dipping into chutneys and curries. ', 3, 10, 66),
	(14, 'Chicken Tikka Masala', 'Perfectly tender chunks of chicken in a flavorful creamy tomato sauce.', 10, 10, 55),
	(15, 'Aloo Paratha', 'und, buttery, flaky flatbread stuffed with spiced potatoes.', 3, 10, 66),
	(16, 'Rajma Chawal', 'A delicious chili with veggie, rices, and beans.', 5, 10, 66),
	(17, 'Chole Bhatura', 'Spiced chickpeas. Enjoy with thin fried bread.', 5, 10, 55),
	(18, 'Butter Chicken', 'Aromatic golden chicken pieces in creamy curry sauce', 12, 10, 66),
	(19, 'Dhokla ', 'Savory soft cakes - can be a main course, side dish, or a snack.', 5, 10, 55),
	(20, 'Nihari', 'A very popular, rich dish: slow-cooked beef shank soup.', 12, 40, 44),
	(21, 'Goat Paya', 'Slow-cooked goat hooves in clear rich soup. ', 12, 40, 44),
	(22, 'Naan ', 'Round flat bread baked in clay oven. ', 3, 40, 33),
	(23, 'Chicken Karahi', 'Traditional chicken curry with bellpeppers. ', 11, 40, 33),
	(24, 'Chicken Dum Biryani ', 'Slow-cooked traditional chicken biryani.', 12, 40, 44),
	(25, 'Mutton Biryani', 'Rich traditional mutto biryani. ', 12, 40, 33),
	(26, 'Yakhni ', 'Mutton-on-the-bone curry simmered in creamy yogurt gravy.', 9, 50, 99),
	(27, 'Rogan Josh', 'Pieces of lamb braised in a gravy slow-cooked in dampokhtak style.', 9, 50, 99),
	(28, 'Modur Pulav', 'Delicious aromatic sweet pulao with basmati rice, nuts, spices, and ghee', 8, 50, 99),
	(29, 'Beef Momo', 'Steamed dumpling with ground beef filling. ', 8, 60, 110),
	(30, 'Chicken Momo', 'Steamed dumpling with ground chicken filling. ', 7, 60, 110),
	(31, 'Thukpa', 'Traditional Nepali twist to chicken noodle soup. ', 7, 60, 110),
	(35, 'Pizza', 'yummy cheesy', 1, 10, 11);
/*!40000 ALTER TABLE `food` ENABLE KEYS */;

-- Dumping structure for table mywebsite.order
CREATE TABLE IF NOT EXISTS `order` (
  `orderID` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `price` date DEFAULT NULL,
  `quantity` date DEFAULT NULL,
  `order_userID` int(11) DEFAULT NULL,
  `order_foodID` int(11) DEFAULT NULL,
  `Column 5` int(11) DEFAULT NULL,
  PRIMARY KEY (`orderID`),
  KEY `FK_orders_users` (`order_userID`),
  KEY `FK_orders_food` (`order_foodID`),
  CONSTRAINT `FK_orders_food` FOREIGN KEY (`order_foodID`) REFERENCES `food` (`foodID`),
  CONSTRAINT `FK_orders_users` FOREIGN KEY (`order_userID`) REFERENCES `users` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table mywebsite.order: ~0 rows (approximately)
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;

-- Dumping structure for table mywebsite.region
CREATE TABLE IF NOT EXISTS `region` (
  `regionID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`regionID`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

-- Dumping data for table mywebsite.region: ~6 rows (approximately)
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` (`regionID`, `name`) VALUES
	(10, 'North Indian'),
	(20, 'South Indian'),
	(30, 'Bangladeshi'),
	(40, 'Pakistani '),
	(50, 'Kashmiri'),
	(60, 'Nepal');
/*!40000 ALTER TABLE `region` ENABLE KEYS */;

-- Dumping structure for table mywebsite.shoppingcart
CREATE TABLE IF NOT EXISTS `shoppingcart` (
  `shoppingCart_ID` int(11) NOT NULL AUTO_INCREMENT,
  `price` int(11) NOT NULL DEFAULT 0,
  `quantity` int(2) NOT NULL,
  `shp_foodID` int(11) NOT NULL,
  PRIMARY KEY (`shoppingCart_ID`),
  KEY `FK_shoppingCart_food` (`shp_foodID`),
  CONSTRAINT `FK_shoppingCart_food` FOREIGN KEY (`shp_foodID`) REFERENCES `food` (`foodID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table mywebsite.shoppingcart: ~0 rows (approximately)
/*!40000 ALTER TABLE `shoppingcart` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppingcart` ENABLE KEYS */;

-- Dumping structure for table mywebsite.users
CREATE TABLE IF NOT EXISTS `users` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `adminFlag` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- Dumping data for table mywebsite.users: ~2 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`userID`, `username`, `password`, `firstname`, `lastname`, `email`, `adminFlag`) VALUES
	(10, 'admin', 'adminpass', 'admin', 'admin', 'admin@admin.com', 1),
	(15, 'user1', 'pass1', 'Zannatul', 'Rezwana', 'zr@email.com', 0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
