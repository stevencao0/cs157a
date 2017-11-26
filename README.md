# cs157a

For TheMusicVault Database

CREATE TABLE users (
  userID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  username varchar(100) NOT NULL,
  password varchar(100) NOT NULL,
  email varchar(100) NOT NULL
);
