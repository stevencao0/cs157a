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
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile` (
  `name` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `favoriteArtists` varchar(100) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES (' Aye Swe','Sunny Value, CA','Adele, Bon Jovi, Bruno Mars, Yanni'),('Alec','Berkeley, CA','Danny Brown, Kanye Wst'),('Anna','San Francisco','The Doors, Jimi Hendrix, Pink Floyd'),('Bryan','Los Angeles, CA','Metallica, Slayer,Megadeth'),('Gary','Portland, OR','Aphex Twin, Boards of Canada, Squarepusher'),('Geodi','Los Angels, CA','Justin Bieber '),('Gordon','London, UK','The Rolling Stones, The Who, The Betales'),('Henry','Hemosa Beach, CA','Black Flag, Minor Threat, Dead Kennedys'),('John','Houston, TX','Hank Williams, Waylon Jennings, Willie Nelson'),('Mare','Berlin, DE','Ludwig van Beethoven'),('Natalie','Santa Rosa, CA','Lady Gaga'),('Oystein','Oslo, NO','Mayhem, Burzum, Darkthrone'),('Richard','Lake County, CA','Taylor Swift'),('Sarah','Twin Peaks, WA','Slowdive, The Smiths, The Cure'),('Steven ','Fremont, CA','Ludwig van Beethoven');
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-06  7:04:07
