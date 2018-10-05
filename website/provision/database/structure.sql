-- MySQL dump 10.13  Distrib 5.7.23, for Linux (x86_64)
--
-- Host: localhost    Database: embraer
-- ------------------------------------------------------
-- Server version	5.7.23

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
-- Table structure for table `activity_logs`
--

DROP TABLE IF EXISTS `activity_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip_addresses` varchar(255) NOT NULL DEFAULT '',
  `user_id` int(11) DEFAULT NULL,
  `type` varchar(90) DEFAULT NULL,
  `path` varchar(120) DEFAULT NULL,
  `data` longtext NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `ipAddresses` (`ip_addresses`),
  KEY `date` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=4032 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aircraft`
--

DROP TABLE IF EXISTS `aircraft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aircraft` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `slug` varchar(50) NOT NULL,
  `data` json NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `range` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `active` (`active`),
  KEY `name` (`name`),
  KEY `created` (`created`),
  KEY `updated` (`updated`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aircraft_airport`
--

DROP TABLE IF EXISTS `aircraft_airport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aircraft_airport` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `aircraft_id` int(11) unsigned NOT NULL,
  `airport_id` int(11) unsigned NOT NULL,
  `range_circle` json NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `airport_aau` (`aircraft_id`,`airport_id`),
  KEY `fk_airport` (`airport_id`),
  CONSTRAINT `fk_aircraft` FOREIGN KEY (`aircraft_id`) REFERENCES `aircraft` (`id`),
  CONSTRAINT `fk_airport` FOREIGN KEY (`airport_id`) REFERENCES `airport` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=622 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aircraft_event`
--

DROP TABLE IF EXISTS `aircraft_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aircraft_event` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `region_id` int(10) unsigned NOT NULL,
  `data` json NOT NULL,
  `startsAt` date NOT NULL,
  `endsAt` date NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `startsAt` (`startsAt`),
  KEY `endsAt` (`endsAt`),
  KEY `created` (`created`),
  KEY `updated` (`updated`),
  KEY `region_id` (`region_id`),
  CONSTRAINT `pk_pevt_regid` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9070 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aircraft_event_plane`
--

DROP TABLE IF EXISTS `aircraft_event_plane`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aircraft_event_plane` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `region_id` int(10) unsigned NOT NULL,
  `aircraft_id` int(11) unsigned NOT NULL,
  `event_id` int(11) unsigned NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `region_id` (`region_id`),
  KEY `aircraft_id` (`aircraft_id`),
  KEY `event_id` (`event_id`),
  KEY `created` (`created`),
  KEY `updated` (`updated`),
  CONSTRAINT `pk_pevtplanes_airid` FOREIGN KEY (`aircraft_id`) REFERENCES `aircraft` (`id`),
  CONSTRAINT `pk_pevtplanes_eveid` FOREIGN KEY (`event_id`) REFERENCES `aircraft_event` (`id`),
  CONSTRAINT `pk_pevtplanes_regid` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9228 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `airport`
--

DROP TABLE IF EXISTS `airport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `airport` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` char(120) NOT NULL DEFAULT '',
  `name` char(120) NOT NULL DEFAULT '',
  `location_id` int(11) unsigned NOT NULL,
  `lat` char(25) NOT NULL DEFAULT '',
  `lng` char(25) NOT NULL DEFAULT '',
  `address` varchar(120) DEFAULT NULL,
  `airportName` varchar(120) DEFAULT NULL,
  `destinies` json DEFAULT NULL,
  `centerPoint` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `fk_location` (`location_id`),
  CONSTRAINT `fk_location` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=616 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_contact`
--

DROP TABLE IF EXISTS `app_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_contact` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `region_id` int(10) unsigned NOT NULL,
  `data` json NOT NULL,
  `uploadedFile` char(14) DEFAULT NULL,
  `type` tinyint(1) NOT NULL COMMENT '0: VISIT\n1: SPONSORSHIP\n2: DOUBTS_OR_COMPLIMENTS_OR_COMPLAINTS',
  `date_submit` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0: UNREAD \n1: READ\n2: ANSWERED',
  `message_reply` text,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pk_actc_region_id` (`region_id`),
  CONSTRAINT `pk_actc_region_id` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2103 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_quote`
--

DROP TABLE IF EXISTS `app_quote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_quote` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `region_id` int(10) unsigned NOT NULL,
  `type` enum('text','image','video') NOT NULL DEFAULT 'text',
  `data` json NOT NULL,
  `author` json DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_app_quote_region` (`region_id`),
  CONSTRAINT `fk_app_quote_region` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12067 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blacklist`
--

DROP TABLE IF EXISTS `blacklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blacklist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `social` enum('facebook','twitter','instagram','youtube') NOT NULL,
  `post_id` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `region_social_post` (`social`,`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `block`
--

DROP TABLE IF EXISTS `block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `block` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `position` int(10) unsigned NOT NULL,
  `widget_id` int(10) unsigned NOT NULL,
  `container_id` int(10) unsigned NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `widget_index` (`widget_id`),
  KEY `container_index` (`container_id`),
  CONSTRAINT `block_ibfk_1` FOREIGN KEY (`widget_id`) REFERENCES `widget` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `block_ibfk_2` FOREIGN KEY (`container_id`) REFERENCES `container` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12142742 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blog`
--

DROP TABLE IF EXISTS `blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(11) unsigned DEFAULT NULL,
  `languages` json NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `data` json NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `page_id` int(10) unsigned NOT NULL,
  `publishedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pk_blog_cid` (`category_id`),
  KEY `fk_page_blog` (`page_id`),
  CONSTRAINT `fk_page_blog` FOREIGN KEY (`page_id`) REFERENCES `page` (`id`),
  CONSTRAINT `pk_blog_cid` FOREIGN KEY (`category_id`) REFERENCES `blog_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9132 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blog_category`
--

DROP TABLE IF EXISTS `blog_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `languages` json NOT NULL,
  `region_id` int(10) unsigned NOT NULL,
  `name` json NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `pk_blog_c_rid` (`region_id`),
  CONSTRAINT `pk_blog_c_rid` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1213 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conference`
--

DROP TABLE IF EXISTS `conference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conference` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `status` int(3) unsigned NOT NULL DEFAULT '1',
  `startsAt` date NOT NULL,
  `endsAt` date NOT NULL,
  `coordinator` json DEFAULT NULL COMMENT 'Should be an array of users',
  `administrator` json DEFAULT NULL COMMENT 'Should be an array of users',
  `planes` json DEFAULT NULL,
  `resume` json NOT NULL,
  `contact` json DEFAULT NULL,
  `location` json DEFAULT NULL,
  `options` json DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `order` json DEFAULT NULL,
  `discount` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `start_end_dates` (`startsAt`,`endsAt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conference_activities_groups`
--

DROP TABLE IF EXISTS `conference_activities_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conference_activities_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` json DEFAULT NULL,
  `order` varchar(10) DEFAULT NULL,
  `conference_id` int(11) unsigned DEFAULT NULL,
  `status` int(3) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_conference_activities_groups_id` (`conference_id`),
  CONSTRAINT `fk_conference_activities_groups_id` FOREIGN KEY (`conference_id`) REFERENCES `conference` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conference_activity`
--

DROP TABLE IF EXISTS `conference_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conference_activity` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `conference_id` int(11) unsigned NOT NULL,
  `status` int(3) unsigned NOT NULL DEFAULT '0',
  `resume` json NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `activities_groups_id` int(11) unsigned DEFAULT NULL,
  `discount` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pk_activity_conference_id` (`conference_id`),
  KEY `fk_conference_activity_groups_id` (`activities_groups_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conference_activity_groups`
--

DROP TABLE IF EXISTS `conference_activity_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conference_activity_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `groups_id` int(11) unsigned DEFAULT NULL,
  `activity_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_activity` (`activity_id`),
  KEY `fk_groups` (`groups_id`),
  CONSTRAINT `fk_activity` FOREIGN KEY (`activity_id`) REFERENCES `conference_activity` (`id`),
  CONSTRAINT `fk_groups` FOREIGN KEY (`groups_id`) REFERENCES `conference_activities_groups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conference_activity_participant`
--

DROP TABLE IF EXISTS `conference_activity_participant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conference_activity_participant` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `conference_id` int(11) unsigned NOT NULL,
  `activity_id` int(11) unsigned NOT NULL,
  `participant_id` int(11) unsigned NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `pk_cap_cid` (`conference_id`),
  KEY `pk_cap_aid` (`activity_id`),
  KEY `pk_cap_pid` (`participant_id`),
  CONSTRAINT `pk_cap_aid` FOREIGN KEY (`activity_id`) REFERENCES `conference_activity` (`id`),
  CONSTRAINT `pk_cap_cid` FOREIGN KEY (`conference_id`) REFERENCES `conference` (`id`),
  CONSTRAINT `pk_cap_pid` FOREIGN KEY (`participant_id`) REFERENCES `conference_participant` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conference_meeting`
--

DROP TABLE IF EXISTS `conference_meeting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conference_meeting` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `conference_id` int(11) unsigned NOT NULL,
  `activity_id` int(11) unsigned NOT NULL,
  `status` int(3) unsigned NOT NULL DEFAULT '0',
  `startsAt` datetime DEFAULT NULL,
  `endsAt` datetime DEFAULT NULL,
  `resume` json NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `pk_meeting_conference_id` (`conference_id`),
  KEY `pk_meeting_activity_id` (`activity_id`),
  CONSTRAINT `pk_meeting_activity_id` FOREIGN KEY (`activity_id`) REFERENCES `conference_activity` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pk_meeting_conference_id` FOREIGN KEY (`conference_id`) REFERENCES `conference` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conference_meeting_participant`
--

DROP TABLE IF EXISTS `conference_meeting_participant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conference_meeting_participant` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `conference_id` int(11) unsigned NOT NULL,
  `activity_id` int(11) unsigned NOT NULL,
  `meeting_id` int(11) unsigned NOT NULL,
  `participant_id` int(11) unsigned NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `pk_cmp_conference_id` (`conference_id`),
  KEY `pk_cmp_activity_id` (`activity_id`),
  KEY `pk_cmp_participant_id` (`participant_id`),
  KEY `pk_cmp_meeting_id` (`meeting_id`),
  CONSTRAINT `pk_cmp_activity_id` FOREIGN KEY (`activity_id`) REFERENCES `conference_activity` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pk_cmp_conference_id` FOREIGN KEY (`conference_id`) REFERENCES `conference` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pk_cmp_meeting_id` FOREIGN KEY (`meeting_id`) REFERENCES `conference_meeting` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pk_cmp_participant_id` FOREIGN KEY (`participant_id`) REFERENCES `conference_participant` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conference_participant`
--

DROP TABLE IF EXISTS `conference_participant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conference_participant` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `conference_id` int(11) unsigned NOT NULL,
  `status` int(3) unsigned NOT NULL DEFAULT '0',
  `subscriptionType` int(3) unsigned NOT NULL,
  `data` json NOT NULL,
  `paidAt` datetime DEFAULT NULL,
  `approvedAt` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `transaction_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pk_participant_conference_id` (`conference_id`),
  CONSTRAINT `pk_participant_conference_id` FOREIGN KEY (`conference_id`) REFERENCES `conference` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conference_sponsor`
--

DROP TABLE IF EXISTS `conference_sponsor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conference_sponsor` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sponsor_type_id` int(3) unsigned NOT NULL,
  `conference_id` int(11) unsigned NOT NULL,
  `sponsor_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pk_cs_conference_id` (`conference_id`),
  KEY `pk_cs_type_id_id` (`sponsor_type_id`),
  KEY `pk_cs_sponsor_id` (`sponsor_id`),
  CONSTRAINT `pk_cs_conference_id` FOREIGN KEY (`conference_id`) REFERENCES `conference` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pk_cs_sponsor_id` FOREIGN KEY (`sponsor_id`) REFERENCES `sponsor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pk_cs_type_id_id` FOREIGN KEY (`sponsor_type_id`) REFERENCES `sponsor_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contact_map`
--

DROP TABLE IF EXISTS `contact_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_map` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `languages` json NOT NULL,
  `country` json NOT NULL,
  `area` json DEFAULT NULL,
  `detail` json NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `priority` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cm_createdAt` (`createdAt`)
) ENGINE=InnoDB AUTO_INCREMENT=735 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `container`
--

DROP TABLE IF EXISTS `container`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `container` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `position` int(10) unsigned NOT NULL,
  `page_id` int(10) unsigned NOT NULL,
  `type` varchar(20) NOT NULL,
  `infinity_scroll` tinyint(1) NOT NULL DEFAULT '0',
  `subtype` tinyint(1) NOT NULL DEFAULT '0',
  `desktop` tinyint(1) NOT NULL DEFAULT '1',
  `tablet` tinyint(1) NOT NULL DEFAULT '1',
  `mobile` tinyint(1) NOT NULL DEFAULT '1',
  `tabs` json DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `page_index` (`page_id`),
  CONSTRAINT `container_ibfk_1` FOREIGN KEY (`page_id`) REFERENCES `page` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12133222 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `region_id` int(10) unsigned NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` varchar(500) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_region_id` (`region_id`),
  CONSTRAINT `fk_department_region` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ee2`
--

DROP TABLE IF EXISTS `ee2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ee2` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `status` int(3) unsigned NOT NULL DEFAULT '0',
  `data` json NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ee2_activity`
--

DROP TABLE IF EXISTS `ee2_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ee2_activity` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int(11) unsigned NOT NULL,
  `status` int(3) unsigned NOT NULL DEFAULT '0',
  `data` json NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `pk_ee2_evid` (`event_id`),
  CONSTRAINT `pk_ee2_evid` FOREIGN KEY (`event_id`) REFERENCES `ee2` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ee2_activity_participant`
--

DROP TABLE IF EXISTS `ee2_activity_participant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ee2_activity_participant` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int(11) unsigned NOT NULL,
  `activity_id` int(11) unsigned NOT NULL,
  `participant_id` int(11) unsigned NOT NULL,
  `status` int(3) unsigned NOT NULL DEFAULT '0',
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `pk_ee2_ap_evid` (`event_id`),
  KEY `pk_ee2_ap_part_id` (`participant_id`),
  KEY `pk_ee2_activity_id` (`activity_id`),
  CONSTRAINT `pk_ee2_activity_id` FOREIGN KEY (`activity_id`) REFERENCES `ee2_activity` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pk_ee2_ap_evid` FOREIGN KEY (`event_id`) REFERENCES `ee2` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pk_ee2_ap_part_id` FOREIGN KEY (`participant_id`) REFERENCES `ee2_participant` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ee2_participant`
--

DROP TABLE IF EXISTS `ee2_participant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ee2_participant` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int(11) unsigned NOT NULL,
  `status` int(3) unsigned NOT NULL DEFAULT '0',
  `data` json NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `pk_ee2_part_evid` (`event_id`),
  CONSTRAINT `pk_ee2_part_evid` FOREIGN KEY (`event_id`) REFERENCES `ee2` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eoc_participant`
--

DROP TABLE IF EXISTS `eoc_participant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eoc_participant` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `data` json DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(11) DEFAULT '4',
  `page_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_participant_page` (`page_id`),
  CONSTRAINT `fk_participant_page` FOREIGN KEY (`page_id`) REFERENCES `page` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `region_id` int(10) unsigned NOT NULL,
  `ip` varchar(35) CHARACTER SET latin1 DEFAULT NULL,
  `data` json NOT NULL,
  `reply` json DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `pk_event_rid` (`region_id`),
  CONSTRAINT `pk_event_rid` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cc` varchar(2) DEFAULT NULL,
  `name` json DEFAULT NULL,
  `country` json DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=616 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `magazine`
--

DROP TABLE IF EXISTS `magazine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magazine` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `region_id` int(10) unsigned NOT NULL,
  `publishedAt` datetime DEFAULT NULL,
  `data` json NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_magazine_region` (`region_id`),
  CONSTRAINT `fk_magazine_region` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5111 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` json DEFAULT NULL,
  `region_id` int(10) unsigned NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `region_index` (`region_id`),
  CONSTRAINT `fk_region_id` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1210 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `run_on` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `languages` json NOT NULL,
  `item_datetime` datetime DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `published` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data` json DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1206440 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `page`
--

DROP TABLE IF EXISTS `page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` json DEFAULT NULL,
  `tags` json DEFAULT NULL,
  `slug` json DEFAULT NULL,
  `region_id` int(10) unsigned NOT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL,
  `media` json DEFAULT NULL,
  `infiniteScroll` tinyint(1) DEFAULT '0',
  `locked` tinyint(1) DEFAULT '0',
  `floodlight_id` varchar(20) DEFAULT NULL,
  `review_accepted` tinyint(1) DEFAULT NULL,
  `messages` json DEFAULT NULL,
  `description` json DEFAULT NULL,
  `shortSlug` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shortSlug` (`shortSlug`),
  KEY `region_index` (`region_id`),
  KEY `parent_index` (`parent_id`),
  KEY `user_index` (`user_id`),
  CONSTRAINT `page_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `page_ibfk_2` FOREIGN KEY (`parent_id`) REFERENCES `page` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `page_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=132131 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `portal_blog`
--

DROP TABLE IF EXISTS `portal_blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_blog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `region_id` int(10) unsigned NOT NULL,
  `blog_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pk_pb_portal_id` (`region_id`),
  KEY `pk_pb_blog_id` (`blog_id`),
  CONSTRAINT `pk_pb_blog_id` FOREIGN KEY (`blog_id`) REFERENCES `blog` (`id`),
  CONSTRAINT `pk_pb_portal_id` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `portal_conference`
--

DROP TABLE IF EXISTS `portal_conference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_conference` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `conference_id` int(11) unsigned NOT NULL,
  `region_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pk_pc_conference` (`conference_id`),
  KEY `pk_pc_region_id` (`region_id`),
  CONSTRAINT `pk_pc_conference` FOREIGN KEY (`conference_id`) REFERENCES `conference` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pk_pc_region_id` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `portal_contact_map`
--

DROP TABLE IF EXISTS `portal_contact_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_contact_map` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `region_id` int(10) unsigned NOT NULL,
  `contact_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pk_pcm_contact_id` (`contact_id`),
  KEY `pk_pcm_portal_id` (`region_id`),
  CONSTRAINT `pk_pcm_contact_id` FOREIGN KEY (`contact_id`) REFERENCES `contact_map` (`id`) ON DELETE CASCADE,
  CONSTRAINT `pk_pcm_portal_id` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2032 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `portal_news`
--

DROP TABLE IF EXISTS `portal_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `region_id` int(10) unsigned NOT NULL,
  `news_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pk_portal_id` (`region_id`),
  KEY `pk_news_id` (`news_id`),
  CONSTRAINT `pk_news_id` FOREIGN KEY (`news_id`) REFERENCES `news` (`id`),
  CONSTRAINT `pk_portal_id` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1206468 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `portal_press`
--

DROP TABLE IF EXISTS `portal_press`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_press` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `press_id` int(11) unsigned NOT NULL,
  `region_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pk_pp_press` (`press_id`),
  KEY `pk_pp_region_id` (`region_id`),
  CONSTRAINT `pk_pp_press` FOREIGN KEY (`press_id`) REFERENCES `press_release` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pk_pp_region_id` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pre_flown`
--

DROP TABLE IF EXISTS `pre_flown`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pre_flown` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `year` int(11) NOT NULL,
  `serial` varchar(50) DEFAULT NULL,
  `hours` int(11) NOT NULL,
  `disponibility` varchar(50) NOT NULL,
  `certification` varchar(50) NOT NULL,
  `aircraft_id` int(11) unsigned NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `cycles` varchar(20) DEFAULT NULL,
  `photos` json DEFAULT NULL,
  `specifications` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `created` (`created`),
  KEY `updated` (`updated`),
  KEY `pk_preflown_aircraft` (`aircraft_id`),
  CONSTRAINT `pk_preflown_aircraft` FOREIGN KEY (`aircraft_id`) REFERENCES `aircraft` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `press_release`
--

DROP TABLE IF EXISTS `press_release`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `press_release` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `languages` json NOT NULL,
  `data` json NOT NULL,
  `publishedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `region` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `languages` json NOT NULL,
  `code` varchar(20) NOT NULL,
  `social` json DEFAULT NULL,
  `search_filters` json DEFAULT NULL,
  `color` varchar(6) DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT NULL,
  `business_unit` varchar(30) NOT NULL DEFAULT 'corporate',
  `portal_name` varchar(40) DEFAULT NULL,
  `bynder` json DEFAULT NULL,
  `portal_shortname` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_blog_unit_name` (`business_unit`)
) ENGINE=InnoDB AUTO_INCREMENT=1211 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: admin\n1: customer',
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `social_exception`
--

DROP TABLE IF EXISTS `social_exception`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_exception` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(16) DEFAULT NULL,
  `social` enum('facebook','twitter','instagram','youtube') NOT NULL,
  `post_id` varchar(50) NOT NULL DEFAULT '',
  `data` json NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sponsor`
--

DROP TABLE IF EXISTS `sponsor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sponsor` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type_id` int(3) unsigned NOT NULL,
  `name` json NOT NULL,
  `photo` json NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` int(3) DEFAULT NULL,
  `conference_id` int(11) DEFAULT NULL,
  `data` json DEFAULT NULL,
  `discount` json DEFAULT NULL,
  `transaction_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pk_sponsor_type_id` (`type_id`),
  CONSTRAINT `pk_sponsor_type_id` FOREIGN KEY (`type_id`) REFERENCES `sponsor_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sponsor_type`
--

DROP TABLE IF EXISTS `sponsor_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sponsor_type` (
  `id` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `languages` json NOT NULL,
  `data` json DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `priority` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `description` json DEFAULT NULL,
  `maxAllowed` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `title` json DEFAULT NULL,
  `conference_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `support`
--

DROP TABLE IF EXISTS `support`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `support` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `region_id` int(10) unsigned NOT NULL,
  `type_id` int(11) unsigned NOT NULL,
  `contact_id` int(11) unsigned NOT NULL,
  `aircraft_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pk_s_type_id` (`type_id`),
  KEY `pk_s_contact_id` (`contact_id`),
  KEY `pk_s_aircraft_id` (`aircraft_id`),
  KEY `pk_s_region_id` (`region_id`),
  CONSTRAINT `pk_s_aircraft_id` FOREIGN KEY (`aircraft_id`) REFERENCES `aircraft` (`id`) ON DELETE CASCADE,
  CONSTRAINT `pk_s_contact_id` FOREIGN KEY (`contact_id`) REFERENCES `support_contact` (`id`) ON DELETE CASCADE,
  CONSTRAINT `pk_s_region_id` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`),
  CONSTRAINT `pk_s_type_id` FOREIGN KEY (`type_id`) REFERENCES `support_type` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9016196 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `support_contact`
--

DROP TABLE IF EXISTS `support_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `support_contact` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `languages` json NOT NULL,
  `detail` json NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `priority` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `st_createdAt` (`createdAt`),
  KEY `st_updatedAt` (`updatedAt`)
) ENGINE=InnoDB AUTO_INCREMENT=1765 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `support_type`
--

DROP TABLE IF EXISTS `support_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `support_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `languages` json NOT NULL,
  `name` json NOT NULL,
  `introduction` json DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `st_createdAt` (`createdAt`),
  KEY `st_updatedAt` (`updatedAt`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `testimonials`
--

DROP TABLE IF EXISTS `testimonials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testimonials` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `aircraft_id` int(11) unsigned NOT NULL,
  `data` json NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `region_id` int(10) unsigned DEFAULT NULL,
  `highlighted` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_testimonials_aircraft_id` (`aircraft_id`),
  KEY `fk_testimonials_region` (`region_id`),
  CONSTRAINT `fk_testimonials_aircraft_id` FOREIGN KEY (`aircraft_id`) REFERENCES `aircraft` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_testimonials_region` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(20) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0: disabled\n1: active\n2: blocked\n3: deleted',
  `username` varchar(45) NOT NULL,
  `password` varchar(255) NOT NULL,
  `passwordSalt` varchar(255) NOT NULL,
  `passwordResetToken` varchar(255) DEFAULT NULL,
  `passwordCreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `code` varchar(20) DEFAULT NULL,
  `name` varchar(90) NOT NULL,
  `mail` varchar(90) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `lastLogin` datetime DEFAULT NULL,
  `role_id` int(10) unsigned NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL,
  `bus` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid` (`uid`),
  UNIQUE KEY `unique_username` (`username`),
  UNIQUE KEY `unique_passwordResetToken` (`passwordResetToken`),
  KEY `fk_user_role` (`role_id`),
  CONSTRAINT `fk_user_role1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_auth`
--

DROP TABLE IF EXISTS `user_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_auth` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ipAddresses` varchar(255) NOT NULL,
  `user_username` varchar(45) DEFAULT NULL,
  `date` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: failure\n1: success',
  PRIMARY KEY (`id`),
  KEY `ipAddresses` (`ipAddresses`),
  KEY `date` (`date`),
  KEY `fk_user_auth_user` (`user_username`),
  KEY `status` (`status`),
  CONSTRAINT `fk_user_auth_user` FOREIGN KEY (`user_username`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2034 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `webseries`
--

DROP TABLE IF EXISTS `webseries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webseries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` json NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `region_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_webseries_region` (`region_id`),
  CONSTRAINT `fk_webseries_region` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `widget`
--

DROP TABLE IF EXISTS `widget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widget` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1: CAREERS\n2: EMBRAER\n3: FACEBOOK\n4: INSTAGRAM\n5: PRESS\n6: SUPPORT\n7: SUSTAIN\n8: TEXT\n9: TWITTER\n10: YOUTUBE',
  `data` json DEFAULT NULL,
  `app_id` tinyint(1) DEFAULT NULL,
  `custom` tinyint(1) DEFAULT '0',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=12142739 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-16 16:54:31
