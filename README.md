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
  ratingAmt INT UNSIGNED NOT NULL
);

