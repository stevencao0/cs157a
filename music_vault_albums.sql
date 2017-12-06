-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: music_vault
-- ------------------------------------------------------
-- Server version	5.7.19-log

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
-- Table structure for table `albums`
--

DROP TABLE IF EXISTS `albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `albums` (
  `albumID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `albumArtist` varchar(100) NOT NULL,
  `albumName` varchar(100) NOT NULL,
  `albumRating` int(5) NOT NULL,
  `totalScore` int(10) unsigned NOT NULL,
  `ratingAmt` int(10) unsigned NOT NULL,
  `albumDate` varchar(100) NOT NULL,
  `albumGenre` varchar(100) NOT NULL,
  PRIMARY KEY (`albumID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albums`
--

LOCK TABLES `albums` WRITE;
/*!40000 ALTER TABLE `albums` DISABLE KEYS */;
INSERT INTO `albums` VALUES (1,'Woodkid','The Golden Age',0,0,0,'18 March 2013','Orchestral Pop'),(2,'Adele','21',0,0,0,'24 January 2011','Pop'),(3,'Yanni','In My Time',0,0,0,'6 April 1993','Instrumental'),(4,'Justin Bieber','Purpose',0,0,0,'13 November 2015','Dance'),(5,'Taylor Swift','Reputation',0,0,0,'24 August 2017','Pop'),(6,'Meghan Trainor','All about That Bass',0,0,0,'30 Jun 2014','Bubblegum'),(7,'Lady Gaga','The Fame',0,0,0,'19 August 2008','Electropop'),(8,'Bruno Mars','Unorthodox Jukebox',0,0,0,'7 December 2012','Pop'),(9,'Katy Perry','Teenage Dream',0,0,0,'24 August 2010','Pop'),(10,'Pink','Beautiful Trauma',0,0,0,'13 October 2017','Pop'),(11,'Blake Shelton','All About Tonight',0,0,0,'10 August 2010','Country'),(12,'Kelly Clarkson','Breakaway',0,0,0,'30 November 2004','Pop rock'),(13,'Josh Groban','To Where You Are',0,0,0,'12 November 2002','Adult Contemporary'),(14,'Mariah Carey','Butterfly',0,0,0,'16 September 1997','R&B'),(15,'Bon Jovi','Slippery When Wet',0,0,0,'18 August 1986','Hard rock'),(16,'Michael Buble','Its Time',0,0,0,'8 February 2005','Vocal jazz');
/*!40000 ALTER TABLE `albums` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-06  6:31:10
