-- MySQL dump 
--
-- ------------------------------------------------------
-- Server version	

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
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Orders` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `orderId` varchar(20) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `first` varchar(255) DEFAULT NULL,
  `middle` varchar(255) DEFAULT NULL,
  `last` varchar(255) DEFAULT NULL,
  `pId` int(11) unsigned NOT NULL,
  `numberShipped` int(11) DEFAULT NULL,
  `orderDate` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pId` (`pId`),
  CONSTRAINT `Orders_ibfk_1` FOREIGN KEY (`pId`) REFERENCES `ProductList` (`pId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
INSERT INTO `Orders` VALUES (1,'1','','Sid','','Customer',3,1,'2018-04-30'),(2,'2','','Abhi','','Customer',3,2,'2014-04-22'),(3,'3','','Anup','','Customer',1,3,'2014-04-26'),(4,'3',NULL,'Anup',NULL,'Customer',2,1,'2014-04-26');
/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductList`
--

DROP TABLE IF EXISTS `ProductList`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProductList` (
  `pId` int(11) unsigned NOT NULL,
  `serialNumber` varchar(45) NOT NULL,
  `brand` varchar(150) NOT NULL,
  `model` varchar(150) NOT NULL,
  `type` enum('acoustic','electric') NOT NULL,
  `numOfString` smallint(11) DEFAULT NULL,
  `price` float NOT NULL,
  `inventoryReceived` int(10) unsigned DEFAULT '0',
  `inventoryShipped` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`pId`),
  UNIQUE KEY `serialNumber_UNIQUE` (`serialNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductList`
--

LOCK TABLES `ProductList` WRITE;
/*!40000 ALTER TABLE `ProductList` DISABLE KEYS */;
INSERT INTO `ProductList` VALUES (1,'ABC123','Yamaha','YZ-200','electric',4,15000,15,3),(2,'ABC12','Yamaha','YZ-500','electric',5,22000,10,1),(3,'KA-001','Kanda Shokai','Gakki','acoustic',4,18000,15,3),(4,'M-2349','Maybach','Maybach-1','acoustic',4,33000,10,0),(5,'XYZ#001','JOSHUA GUITARS','Rainsong BI-WS1000N2','acoustic',4,45000,20,0);
/*!40000 ALTER TABLE `ProductList` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Purchases`
--

DROP TABLE IF EXISTS `Purchases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Purchases` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pId` int(11) unsigned NOT NULL,
  `numberReceived` int(11) NOT NULL,
  `purchaseDate` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_product_fk` (`pId`),
  CONSTRAINT `purchase_product_fk` FOREIGN KEY (`pId`) REFERENCES `ProductList` (`pId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Purchases`
--

LOCK TABLES `Purchases` WRITE;
/*!40000 ALTER TABLE `Purchases` DISABLE KEYS */;
INSERT INTO `Purchases` VALUES (1,2,10,'2018-04-01'),(2,1,15,'2018-04-01'),(3,3,15,'2018-03-01'),(4,4,10,'2018-03-01'),(5,5,20,'2018-03-01');
/*!40000 ALTER TABLE `Purchases` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-05 22:14:27
