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
-- Table structure for table `songs`
--

DROP TABLE IF EXISTS `songs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `songs` (
  `songID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `songArtist` varchar(100) NOT NULL,
  `songName` varchar(100) NOT NULL,
  `albumID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`songID`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `songs`
--

LOCK TABLES `songs` WRITE;
/*!40000 ALTER TABLE `songs` DISABLE KEYS */;
INSERT INTO `songs` VALUES (1,'Woodkid','The Golden Age',1),(2,'Woodkid','The Great Escape',1),(3,'Woodkid','Boat Song',1),(4,'Woodkid','I Love You',1),(5,'Woodkid','The Shore',1),(6,'Woodkid','Ghost Lights',1),(7,'Woodkid','Shadows',1),(8,'Woodkid','Stabat Mater',1),(9,'Woodkid','Conquest of Spaces',1),(10,'Woodkid','Falling',1),(11,'Woodkid','Where I Live',1),(12,'Woodkid','Iron',1),(13,'Woodkid','The Other Side',1),(14,'Adele','Rolling In The Deep',2),(15,'Adele','Rumour Has It',2),(16,'Adele','Turning Tables',2),(17,'Adele','Don\'t You Remember',2),(18,'Yanni','In The Morning Light',3),(19,'Yanni','One Man\'s Dream',3),(20,'Yanni','Before I Go',3),(21,'Yanni','Enchantment',3),(22,'Justin Bieber','Mark My Words',4),(23,'Justin Bieber','I\'ll Show You',4),(24,'Justin Bieber','What Do you Mean',4),(25,'Justin Bieber','Sorry',4),(26,'Taylor Swift','End Game',5),(27,'Taylor Swift','I Did Something Bad',5),(28,'Taylor Swift','Delicate',5),(29,'Taylor Swift','Gorgeous',5),(30,'Meghan Trainor','All About That Bass',6),(31,'Meghan Trainor','3am',6),(32,'Meghan Trainor','The Best Part',6),(33,'Meghan Trainor','Close Your Eyes',6),(34,'Lady Gaga','Just Dance',7),(35,'Lady Gaga','LoveGame',7),(36,'Lady Gaga','The Fame',7),(37,'Lady Gaga','Poker Face',7),(38,'Bruno Mars','Young Girls',8),(39,'Bruno Mars','Locked Out of Heaven',8),(40,'Bruno Mars','Moonshine',8),(41,'Bruno Mars','Treasure',8),(42,'Katy Perry',' Teenage Dream',9),(43,'Katy Perry','California Gurls',9),(44,'Katy Perry','Firework',9),(45,'Katy Perry','Peacock',9),(46,'Pink','Barbies',10),(47,'Pink','Where We Go',10),(48,'Pink','For Now',10),(49,'Pink','Whatever You Want',10),(50,'Blake Shelton','All About Tonight',11),(51,'Blake Shelton','Got a Little Country',11),(52,'Blake Shelton','Suffocating',11),(53,'Blake Shelton','That Thing We Do',11),(54,'Kelly Clarkson','Breakaway',12),(55,'Kelly Clarkson','Gone',12),(56,'Kelly Clarkson','Because of you',12),(57,'Kelly Clarkson','Walk Away',12),(58,'Josh Groban','Feel',13),(59,'Josh Groban','Soul',13),(60,'Josh Groban','The Difference',13),(61,'Josh Groban','Cold',13),(62,'Mariah Carey','Honey',14),(63,'Mariah Carey','Butterfly',14),(64,'Mariah Carey','My All',14),(65,'Mariah Carey','Fourth of July',14),(66,'Bon Jovi','Let it Rock',15),(67,'Bon Jovi','You Give Love a Bad Name',15),(68,'Bon Jovi','Livin\' On A Prayer',15),(69,'Bon Jovi','I\'d Die for You',15),(70,'Michael Buble','Feeling Good',16),(71,'Michael Buble','Home',16),(72,'Michael Buble','A Song for You',16),(73,'Michael Buble','The More I See You',16);
/*!40000 ALTER TABLE `songs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-06  6:31:11
