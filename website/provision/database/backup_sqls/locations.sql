-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: localhost    Database: embraer
-- ------------------------------------------------------
-- Server version	5.7.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(120) NOT NULL DEFAULT '',
  `country` varchar(50) DEFAULT NULL COMMENT 'country name',
  `cc` varchar(2) DEFAULT NULL COMMENT 'country code',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=622 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'almaty','Kazakhstan','KZ'),(2,'dallas-ft-worth','United States','US'),(3,'beijing','China','CN'),(4,'dubai','United Arab Emirates','AE'),(5,'sao-paulo','Brazil','BR'),(6,'perth','Australia','AU'),(7,'berlin','Germany','DE'),(8,'hong-kong','Hong Kong','HK'),(9,'shanghai','China','CN'),(10,'london','United Kingdom','GB'),(11,'lanseria','South Africa','ZA'),(12,'santiago','Chile','CL'),(13,'geneva','Switzerland','CH'),(14,'tokyo','Japan','JP'),(15,'singapore','Singapore','SG'),(16,'istanbul','Turkey','TR'),(17,'white-plains','United States','US'),(18,'sydney','Australia','AU'),(19,'moscow','Russia','RU'),(20,'los-angeles','United States','US'),(21,'toluca','Mexico','MX'),(22,'abuja','Nigeria','NG'),(23,'miami','United States','US'),(25,'mumbai','India','IN'),(26,'chicago','United States','US'),(174,'phuket','Thailand','TH'),(182,'rome','Italy','IT'),(190,'las-vegas','United States','US'),(197,'toronto','Canada','CA'),(204,'paris','France','FR'),(211,'varna','Bulgaria','BG'),(212,'riyadh','Saudi Arabia','SA'),(213,'honolulu','United States','US'),(214,'copenhagen','Denmark','DK'),(215,'jakarta','Indonesia','ID'),(216,'auckland','New Zealand','NZ'),(217,'agra','India','IN'),(260,'edinburgh','United Kingdom','GB'),(267,'wellington','New Zealand','NZ'),(274,'dublin','Ireland','IE'),(281,'hanoi','Vietnam','VN'),(288,'luxor','Egypt','EG'),(295,'melbourne','Australia','AU'),(302,'manila','Philippines','PH'),(309,'phnom-penh','Cambodia','KH'),(316,'zurich','Switzerland','CH'),(323,'athens','Greece','GR'),(330,'budapest','Hungary','HU'),(337,'cape-town','South Africa','ZA'),(344,'delhi','India','IN'),(351,'jerusalem','Israel','IL'),(358,'st-petersburg','Russia','RU'),(365,'lima-callao','Peru','PE'),(372,'madrid','Spain','ES'),(379,'munich','Germany','DE'),(386,'prague','Czechia','CZ'),(393,'seattle','United States','US'),(400,'san-francisco','United States','US'),(407,'vienna','Austria','AT'),(414,'montreal','Canada','CA'),(421,'vancouver','Canada','CA'),(428,'antalya','Turkey','TR'),(435,'bogota','Colombia','CO'),(442,'johannesburg','South Africa','ZA'),(449,'lisbon','Portugal','PT'),(463,'bangkok','Thailand','TH'),(470,'cancun','Mexico','MX'),(477,'kuala-lumpur','Malaysia','MY'),(484,'hochiminh','Vietnam','VN'),(491,'sharm-el-sheik','Egypt','EG'),(498,'harbin','China','CN'),(505,'anchorage','United States','US'),(512,'atlanta','United States','US'),(519,'melbourne-fl','United States','US'),(526,'male','Maldives','MV'),(533,'nome','United States','US'),(540,'petropavlovsk','Russia','RU'),(547,'reykjavik','Iceland','IS'),(554,'scottsdale','United States','US'),(561,'st-louis','United States','US'),(568,'narsarsuaq','Greenland','GL'),(575,'urumqi','China','CN'),(582,'gander','Canada','CA'),(589,'san-juan','Puerto Rico','PR'),(590,'ft-lauderdale','United States','US'),(591,'birmingham','United States','US'),(592,'new-orleans','United States','US'),(615,'guayaquil','Ecuador','EC');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-30 13:32:27
