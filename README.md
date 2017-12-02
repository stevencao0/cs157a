# cs157a

For TheMusicVault Database

CREATE TABLE users (
  userID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  username varchar(100) NOT NULL,
  password varchar(100) NOT NULL,
  email varchar(100) NOT NULL
);

CREATE TABLE albums (
  albumID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  albumArtist varchar(100) NOT NULL,
  albumName varchar(100) NOT NULL,
  albumRating int(5) NOT NULL,
  totalScore INT UNSIGNED NOT NULL,
  ratingAmt INT UNSIGNED NOT NULL,
  albumDate varchar(100) NOT NULL,
  albumGenre varchar(100) NOT NULL
);

Ex) Albums
  albumID // NULL
  albumArtist // Woodkid
  albumName // The Golden Age
  albumRating // 0
  totalScore // 0
  ratingAmt // 0
  albumDate // 18 March 2013
  albumGenre // Orchestral Pop


CREATE TABLE songs (
  songID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  songArtist varchar(100) NOT NULL,
  songName varchar(100) NOT NULL,
  albumID INT UNSIGNED NOT NULL
);

Ex) Songs
  songID // NULL
  songArtist // Woodkid
  songName // Boat Song
  albumID // (w/e albumID it's attached to)

CREATE TABLE artists (
  artistName varchar(100) NOT NULL,
  artistDate varchar(100) NOT NULL,
  artistGenre varchar(100) NOT NULL,
  artistOrigin varchar(100) NOT NULL,
  artistLabels varchar(100) NOT NULL,
  bioText TEXT NOT NULL
);
Ex)Artists
  artistName // Woodkid
  artistDate //Years-Active
  artistGenre // Pop, Chamber Pop, Neofolk
  artistOrigin // Lyon, France
  artistLabels // Green United Music
  bioText  // any biograph text. I took some text from the wikipedia.



 ->(DON'T FILL ANY DATA FOR ratingCheck table!!!)
CREATE TABLE ratingCheck (
    userID INT UNSIGNED NOT NULL,
    albumID INT UNSIGNED NOT NULL,
    haveRated BOOLEAN NOT NULL DEFAULT FALSE,
    rateValue INT UNSIGNED
    primary key (userID, albumID)
);



INSERT INTO albums VALUES(NULL,'Woodkid','The Golden Age',0,0,0,'18 March 2013','Orchestral Pop');

INSERT INTO songs VALUES(NULL,'Woodkid','The Golden Age',1),(NULL,'Woodkid','The Great Escape',1),(NULL,'Woodkid','Boat Song',1),(NULL,'Woodkid','I Love You',1),(NULL,'Woodkid','The Shore',1),(NULL,'Woodkid','Ghost Lights',1),(NULL,'Woodkid','Shadows',1),(NULL,'Woodkid','Stabat Mater',1),(NULL,'Woodkid','Conquest of Spaces',1),(NULL,'Woodkid','Falling',1),(NULL,'Woodkid','Where I Live',1),(NULL,'Woodkid','Iron',1),(NULL,'Woodkid','The Other Side',1);


INSERT INTO artists VALUES('Woodkid','2006-present','Pop, Chamber Pop, Art Pop, Neofolk','Lyon, France','Green United Music','Yoann Lemoine (born 16 March 1983) is a French music video director, graphic designer and singer-songwriter. His most notable works include his music video direction for Katy Perry''s Teenage Dream, Taylor Swift''s single Back to December, Lana Del Rey''s Born to Die and Mystery Jets'' Dreaming of Another World.Lemoine is also a neofolk musician, going by the stage name Woodkid. On March 28, 2011, Woodkid released his first EP Iron EP, and on March 18, 2013, he released his first album titled The Golden Age, which is an autobiographical record. In June 2010, he received 5 Lions for his AIDS Awareness campaign Graffiti at the Cannes Lions Advertising festival. In 2012, Lemoine received the award for Best Director of the Year at the MVPA Awards in Los Angeles and was nominated for 6 MTV Video Music awards for his videos for Lana Del Rey, Drake, and Rihanna.');
