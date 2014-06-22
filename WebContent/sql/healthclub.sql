-- MySQL dump 10.13  Distrib 5.6.12, for osx10.8 (x86_64)
--
-- Host: localhost    Database: healthclub
-- ------------------------------------------------------
-- Server version	5.6.13

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
-- Current Database: `healthclub`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `healthclub` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `healthclub`;

--
-- Table structure for table `activity`
--

DROP TABLE IF EXISTS `activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity` (
  `ac_id` int(11) NOT NULL AUTO_INCREMENT,
  `ac_name` varchar(45) NOT NULL,
  `a_id` int(11) NOT NULL,
  `location` varchar(45) NOT NULL,
  `start` date NOT NULL,
  `end` date NOT NULL,
  `co_no` varchar(45) NOT NULL,
  PRIMARY KEY (`ac_id`),
  KEY `fk_activity_attendant1_idx` (`a_id`),
  KEY `fk_activity_coach1_idx` (`co_no`),
  CONSTRAINT `fk_activity_attendant1` FOREIGN KEY (`a_id`) REFERENCES `attendant` (`a_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_activity_coach1` FOREIGN KEY (`co_no`) REFERENCES `coach` (`co_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity`
--

LOCK TABLES `activity` WRITE;
/*!40000 ALTER TABLE `activity` DISABLE KEYS */;
INSERT INTO `activity` VALUES (1,'Tennis',1,'Tennis Court','2014-06-21','2014-06-21','10000'),(3,'Yoga',1,'Yaga Court','2014-06-22','2014-06-22','10000'),(4,'Golf',1,'Golf Court','2014-06-23','2014-06-23','10000'),(5,'Yoga',1,'Yoga room','2014-06-05','2014-06-05','10000');
/*!40000 ALTER TABLE `activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendant`
--

DROP TABLE IF EXISTS `attendant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendant` (
  `a_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(10) NOT NULL,
  `password` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`a_id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendant`
--

LOCK TABLES `attendant` WRITE;
/*!40000 ALTER TABLE `attendant` DISABLE KEYS */;
INSERT INTO `attendant` VALUES (1,'sunshine','123456','zhangxufan');
/*!40000 ALTER TABLE `attendant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `card`
--

DROP TABLE IF EXISTS `card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `card` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(8) NOT NULL,
  `token` varchar(45) NOT NULL,
  `type` varchar(5) NOT NULL,
  `activated` tinyint(1) NOT NULL DEFAULT '0',
  `payed` tinyint(1) NOT NULL DEFAULT '0',
  `activatePrice` double NOT NULL,
  `rent` double NOT NULL,
  `v_id` int(11) NOT NULL,
  PRIMARY KEY (`c_id`),
  UNIQUE KEY `code_UNIQUE` (`code`),
  KEY `fk_card_vip_idx` (`v_id`),
  CONSTRAINT `fk_card_vip` FOREIGN KEY (`v_id`) REFERENCES `vip` (`v_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card`
--

LOCK TABLES `card` WRITE;
/*!40000 ALTER TABLE `card` DISABLE KEYS */;
INSERT INTO `card` VALUES (1,'SGBqzS8','000000','SG',0,0,75,40,15),(3,'SGSg9NN','000000','SG',1,0,75,40,23);
/*!40000 ALTER TABLE `card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `choose`
--

DROP TABLE IF EXISTS `choose`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `choose` (
  `r_id` int(11) NOT NULL AUTO_INCREMENT,
  `v_id` int(11) NOT NULL,
  `ac_id` int(11) NOT NULL,
  `attended` tinyint(1) NOT NULL,
  PRIMARY KEY (`r_id`),
  KEY `fk_reservation_vip1_idx` (`v_id`),
  KEY `fk_reservation_activity1_idx` (`ac_id`),
  CONSTRAINT `fk_reservation_activity1` FOREIGN KEY (`ac_id`) REFERENCES `activity` (`ac_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_reservation_vip1` FOREIGN KEY (`v_id`) REFERENCES `vip` (`v_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `choose`
--

LOCK TABLES `choose` WRITE;
/*!40000 ALTER TABLE `choose` DISABLE KEYS */;
INSERT INTO `choose` VALUES (2,23,3,0);
/*!40000 ALTER TABLE `choose` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coach`
--

DROP TABLE IF EXISTS `coach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coach` (
  `co_id` int(11) NOT NULL AUTO_INCREMENT,
  `co_no` varchar(45) NOT NULL,
  `co_name` varchar(45) NOT NULL,
  PRIMARY KEY (`co_id`),
  UNIQUE KEY `co_no_UNIQUE` (`co_no`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coach`
--

LOCK TABLES `coach` WRITE;
/*!40000 ALTER TABLE `coach` DISABLE KEYS */;
INSERT INTO `coach` VALUES (1,'10000','QQ'),(2,'10001','Baidu'),(3,'10002','Google');
/*!40000 ALTER TABLE `coach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit`
--

DROP TABLE IF EXISTS `credit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credit` (
  `cr_no` varchar(20) NOT NULL,
  `balance` double NOT NULL DEFAULT '1000000',
  PRIMARY KEY (`cr_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit`
--

LOCK TABLES `credit` WRITE;
/*!40000 ALTER TABLE `credit` DISABLE KEYS */;
INSERT INTO `credit` VALUES ('10086',999395),('6222024301057916585',999885);
/*!40000 ALTER TABLE `credit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `debt`
--

DROP TABLE IF EXISTS `debt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `debt` (
  `d_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `count` varchar(45) NOT NULL,
  PRIMARY KEY (`d_id`),
  KEY `fk_debt_card1_idx` (`c_id`),
  CONSTRAINT `fk_debt_card1` FOREIGN KEY (`c_id`) REFERENCES `card` (`c_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `debt`
--

LOCK TABLES `debt` WRITE;
/*!40000 ALTER TABLE `debt` DISABLE KEYS */;
/*!40000 ALTER TABLE `debt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manager` (
  `m_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`m_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES (1,'sunshine','123456');
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payrecord`
--

DROP TABLE IF EXISTS `payrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payrecord` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT,
  `v_id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL,
  `username` varchar(10) NOT NULL,
  `code` varchar(8) NOT NULL,
  `price` double NOT NULL,
  `payType` varchar(10) NOT NULL,
  `date` datetime NOT NULL,
  `cr_no` varchar(20) NOT NULL,
  PRIMARY KEY (`p_id`),
  KEY `fk_payrecord_vip1_idx` (`v_id`),
  KEY `fk_payrecord_card1_idx` (`c_id`),
  KEY `fk_payrecord_credit1_idx` (`cr_no`),
  CONSTRAINT `fk_payrecord_card1` FOREIGN KEY (`c_id`) REFERENCES `card` (`c_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_payrecord_credit1` FOREIGN KEY (`cr_no`) REFERENCES `credit` (`cr_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_payrecord_vip1` FOREIGN KEY (`v_id`) REFERENCES `vip` (`v_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payrecord`
--

LOCK TABLES `payrecord` WRITE;
/*!40000 ALTER TABLE `payrecord` DISABLE KEYS */;
INSERT INTO `payrecord` VALUES (3,23,3,'19198179','SGSg9NN',75,'activate','2014-06-21 02:34:00','10086');
/*!40000 ALTER TABLE `payrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vip`
--

DROP TABLE IF EXISTS `vip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vip` (
  `v_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(10) NOT NULL,
  `name` varchar(45) NOT NULL,
  `gender` varchar(8) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `age` int(11) NOT NULL,
  `password` varchar(45) NOT NULL,
  `cr_no` varchar(20) NOT NULL,
  `address` varchar(20) NOT NULL DEFAULT 'china',
  PRIMARY KEY (`v_id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `phone_UNIQUE` (`phone`),
  KEY `fk_vip_credit1_idx` (`cr_no`),
  CONSTRAINT `fk_vip_credit1` FOREIGN KEY (`cr_no`) REFERENCES `credit` (`cr_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vip`
--

LOCK TABLES `vip` WRITE;
/*!40000 ALTER TABLE `vip` DISABLE KEYS */;
INSERT INTO `vip` VALUES (15,'08424555','sunshine','male','15895862305',20,'e10adc3949ba59abbe56e057f20f883e','10086','China'),(17,'49975220','danding','male','15805197235',22,'e10adc3949ba59abbe56e057f20f883e','10086','China'),(18,'54332265','jingsi','male','15805196995',23,'e10adc3949ba59abbe56e057f20f883e','10086','Korea'),(19,'49061355','wcheng11','male','18066089198',21,'e10adc3949ba59abbe56e057f20f883e','10086','US'),(20,'33812310','WangCheng','male','18906274888',21,'b57057a039b4a29e6c4f96d0e3d9ee74','6222024301057916585','Nanjing,China'),(21,'18903828','Claire','female','15862778166',20,'e10adc3949ba59abbe56e057f20f883e','6222024301057916585','US'),(23,'19198179','zhuzhu','female','15895883099',22,'e10adc3949ba59abbe56e057f20f883e','10086','2a601');
/*!40000 ALTER TABLE `vip` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-06-22 18:06:24
