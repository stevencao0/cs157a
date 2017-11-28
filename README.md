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

CREATE TABLE songs (
  songID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  songArtist varchar(100) NOT NULL,
  songName varchar(100) NOT NULL,
  songAlbum varchar(100) NOT NULL
);

INSERT INTO albums VALUES(NULL,'Woodkid','The Golden Age',0,0,0,'18 March 2013','Orchestral Pop');

INSERT INTO songs VALUES(NULL,'Woodkid','The Golden Age','The Golden Age'),(NULL,'Woodkid','The Great Escape','The Golden Age'),(NULL,'Woodkid','Boat Song','The Golden Age'),(NULL,'Woodkid','I Love You','The Golden Age'),(NULL,'Woodkid','The Shore','The Golden Age'),(NULL,'Woodkid','Ghost Lights','The Golden Age'),(NULL,'Woodkid','Shadows','The Golden Age'),(NULL,'Woodkid','Stabat Mater','The Golden Age'),(NULL,'Woodkid','Conquest of Spaces','The Golden Age'),(NULL,'Woodkid','Falling','The Golden Age'),(NULL,'Woodkid','Where I Live','The Golden Age'),(NULL,'Woodkid','Iron','The Golden Age'),(NULL,'Woodkid','The Other Side','The Golden Age');
