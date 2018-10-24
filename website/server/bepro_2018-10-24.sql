# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 10.10.4.36 (MySQL 5.7.23)
# Database: bepro
# Generation Time: 2018-10-24 17:48:37 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;

INSERT INTO `categories` (`id`, `name`)
VALUES
	(1,'t-shirts'),
	(2,'pants'),
	(3,'shoes'),
	(4,'caps');

/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table header_slides
# ------------------------------------------------------------

DROP TABLE IF EXISTS `header_slides`;

CREATE TABLE `header_slides` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `button` varchar(45) DEFAULT NULL,
  `back_text` varchar(45) DEFAULT NULL,
  `bgr_image` varchar(45) DEFAULT NULL,
  `href` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `header_slides` WRITE;
/*!40000 ALTER TABLE `header_slides` DISABLE KEYS */;

INSERT INTO `header_slides` (`id`, `title`, `button`, `back_text`, `bgr_image`, `href`)
VALUES
	(1,'New Arrival','BUY NOW','FASHION','bgr-header.png','https://google.com'),
	(2,'Cotton Clothes','SEE NOW','COTTON','bgr-header2.png','https://google.com'),
	(3,'New Caps','CHECK NOW','FASHION','bgr-header3.png','https://google.com');

/*!40000 ALTER TABLE `header_slides` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table partners_slides
# ------------------------------------------------------------

DROP TABLE IF EXISTS `partners_slides`;

CREATE TABLE `partners_slides` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `partner_image` varchar(45) DEFAULT NULL,
  `href` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `partners_slides` WRITE;
/*!40000 ALTER TABLE `partners_slides` DISABLE KEYS */;

INSERT INTO `partners_slides` (`id`, `partner_image`, `href`)
VALUES
	(1,'partner1.png',NULL),
	(2,'partner2.png',NULL),
	(3,'partner3.png',NULL),
	(4,'partner4.png',NULL),
	(5,'partner1.png',NULL),
	(6,'partner2.png',NULL),
	(7,'partner3.png',NULL),
	(8,'partner4.png',NULL);

/*!40000 ALTER TABLE `partners_slides` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table products
# ------------------------------------------------------------

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `old_price` decimal(8,2) DEFAULT NULL,
  `price` decimal(8,2) NOT NULL,
  `badge_text` varchar(15) DEFAULT NULL,
  `badge_direction` varchar(5) DEFAULT NULL,
  `theme` varchar(70) DEFAULT NULL,
  `tiny_thumb` varchar(200) DEFAULT NULL,
  `thumb` varchar(200) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product relation` (`category_id`),
  CONSTRAINT `product relation` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;

INSERT INTO `products` (`id`, `category_id`, `title`, `old_price`, `price`, `badge_text`, `badge_direction`, `theme`, `tiny_thumb`, `thumb`, `created_at`, `last_update`)
VALUES
	(1,1,'first t-shirt',200.00,150.00,'baf','right','color','tshirt-0.jpg','tshirt-0.jpg','2017-08-10 00:00:00','2017-08-13 00:00:00'),
	(2,1,'second t-shirt',NULL,100.00,NULL,NULL,NULL,'tshirt-1.jpg','tshirt-1.jpg','2017-08-10 00:00:00','2017-08-05 00:00:00'),
	(3,1,'ewifjifj',200.00,200.00,NULL,NULL,NULL,'tshirt-2.jpg','tshirt-2.jpg','2017-08-10 00:00:00','2017-08-20 00:00:00'),
	(4,1,'ewifjifj',200.00,200.00,NULL,NULL,NULL,'tshirt-3.jpg','tshirt-3.jpg','2017-08-10 00:00:00','2017-08-22 00:00:00'),
	(5,2,'first t-shirt',NULL,150.00,'jd','left','color','pant-0.jpg','pant-0.jpg','2017-08-10 00:00:00','2017-08-10 00:00:00'),
	(6,2,'second t-shirt',NULL,100.00,NULL,NULL,NULL,'pant-1.jpg','pant-1.jpg','2017-08-10 00:00:00','2017-08-24 00:00:00'),
	(7,2,'ewifjifj',200.00,200.00,NULL,NULL,NULL,'pant-2.jpg','pant-2.jpg','2017-08-10 00:00:00','2017-08-30 00:00:00'),
	(8,2,'ewifjifj',200.00,200.00,NULL,NULL,NULL,'pant-3.jpg','pant-3.jpg','2017-08-10 00:00:00','2017-08-14 00:00:00'),
	(9,3,'first t-shirt',200.00,150.00,'baf','right','color','shoes-0.jpg','shoes-0.jpg','2017-08-10 00:00:00','2017-08-07 00:00:00'),
	(10,3,'second t-shirt',NULL,100.00,NULL,NULL,'color','shoes-1.jpg','shoes-1.jpg','2017-08-10 00:00:00','2017-08-01 00:00:00'),
	(11,3,'ewifjifj',200.00,200.00,NULL,NULL,NULL,'shoes-2.jpg','shoes-2.jpg','2017-08-10 00:00:00','2017-08-10 00:00:00'),
	(12,3,'ewifjifj',200.00,200.00,NULL,NULL,NULL,'shoes-3.jpg','shoes-3.jpg','2017-08-10 00:00:00','2017-08-15 00:00:00'),
	(13,4,'first t-shirt',200.00,150.00,'baf','right','color','cap-0.jpg','cap-0.jpg','2017-08-10 00:00:00','2017-08-21 00:00:00'),
	(14,4,'second t-shirt',NULL,100.00,NULL,NULL,NULL,'cap-1.jpg','cap-1.jpg','2017-08-10 00:00:00','2017-08-31 00:00:00'),
	(15,4,'ewifjifj',200.00,200.00,NULL,NULL,NULL,'cap-2.jpg','cap-2.jpg','2017-08-10 00:00:00','2017-08-28 00:00:00'),
	(16,4,'ewifjifj',200.00,200.00,NULL,NULL,NULL,'cap-3.jpg','cap-3.jpg','2017-08-10 00:00:00','2017-08-02 00:00:00');

/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
