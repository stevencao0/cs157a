
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
/*
-- Query: SELECT * FROM themusicvault.albums
LIMIT 0, 1000

-- Date: 2017-12-06 13:43
*/
INSERT INTO `albums` (`albumID`,`albumArtist`,`albumName`,`albumRating`,`totalScore`,`ratingAmt`,`albumDate`,`albumGenre`) VALUES (1,'Woodkid','The Golden Age',0,0,0,'18 March 2013','Orchestral Pop');
INSERT INTO `albums` (`albumID`,`albumArtist`,`albumName`,`albumRating`,`totalScore`,`ratingAmt`,`albumDate`,`albumGenre`) VALUES (2,'Adele','21',0,0,0,'24 January 2011','Pop');
INSERT INTO `albums` (`albumID`,`albumArtist`,`albumName`,`albumRating`,`totalScore`,`ratingAmt`,`albumDate`,`albumGenre`) VALUES (3,'Yanni','In My Time',0,0,0,'6 April 1993','Instrumental');
INSERT INTO `albums` (`albumID`,`albumArtist`,`albumName`,`albumRating`,`totalScore`,`ratingAmt`,`albumDate`,`albumGenre`) VALUES (4,'Justin Bieber','Purpose',0,0,0,'13 November 2015','Dance');
INSERT INTO `albums` (`albumID`,`albumArtist`,`albumName`,`albumRating`,`totalScore`,`ratingAmt`,`albumDate`,`albumGenre`) VALUES (5,'Taylor Swift','Reputation',0,0,0,'24 August 2017','Pop');
INSERT INTO `albums` (`albumID`,`albumArtist`,`albumName`,`albumRating`,`totalScore`,`ratingAmt`,`albumDate`,`albumGenre`) VALUES (7,'Lady Gaga','The Fame',0,0,0,'19 August 2008','Electropop');
INSERT INTO `albums` (`albumID`,`albumArtist`,`albumName`,`albumRating`,`totalScore`,`ratingAmt`,`albumDate`,`albumGenre`) VALUES (8,'Bruno Mars','Unorthodox Jukebox',0,0,0,'7 December 2012','Pop');
INSERT INTO `albums` (`albumID`,`albumArtist`,`albumName`,`albumRating`,`totalScore`,`ratingAmt`,`albumDate`,`albumGenre`) VALUES (9,'Katy Perry','Teenage Dream',0,0,0,'24 August 2010','Pop');
INSERT INTO `albums` (`albumID`,`albumArtist`,`albumName`,`albumRating`,`totalScore`,`ratingAmt`,`albumDate`,`albumGenre`) VALUES (10,'Pink','Beautiful Trauma',0,0,0,'13 October 2017','Pop');
INSERT INTO `albums` (`albumID`,`albumArtist`,`albumName`,`albumRating`,`totalScore`,`ratingAmt`,`albumDate`,`albumGenre`) VALUES (11,'Blake Shelton','All About Tonight',0,0,0,'10 August 2010','Country');
INSERT INTO `albums` (`albumID`,`albumArtist`,`albumName`,`albumRating`,`totalScore`,`ratingAmt`,`albumDate`,`albumGenre`) VALUES (12,'Kelly Clarkson','Breakaway',0,0,0,'30 November 2004','Pop rock');
INSERT INTO `albums` (`albumID`,`albumArtist`,`albumName`,`albumRating`,`totalScore`,`ratingAmt`,`albumDate`,`albumGenre`) VALUES (13,'Josh Groban','To Where You Are',0,0,0,'12 November 2002','Adult Contemporary');
INSERT INTO `albums` (`albumID`,`albumArtist`,`albumName`,`albumRating`,`totalScore`,`ratingAmt`,`albumDate`,`albumGenre`) VALUES (14,'Mariah Carey','Butterfly',0,0,0,'16 September 1997','R&B');
INSERT INTO `albums` (`albumID`,`albumArtist`,`albumName`,`albumRating`,`totalScore`,`ratingAmt`,`albumDate`,`albumGenre`) VALUES (15,'Bon Jovi','Slippery When Wet',0,0,0,'18 August 1986','Hard rock');
INSERT INTO `albums` (`albumID`,`albumArtist`,`albumName`,`albumRating`,`totalScore`,`ratingAmt`,`albumDate`,`albumGenre`) VALUES (16,'Michael Buble','Its Time',0,0,0,'8 February 2005','Vocal jazz');
