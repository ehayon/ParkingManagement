CREATE DATABASE IF NOT EXISTS `ParkingManagementSystem`;

USE `ParkingManagementSystem`;

CREATE TABLE IF NOT EXISTS `users`(
	`id_user` INT NOT NULL AUTO_INCREMENT,
	`username` VARCHAR(30) NOT NULL,
	`fname` VARCHAR(30) NOT NULL,
	`lname` VARCHAR(50) NOT NULL,
	`email` VARCHAR(60) NOT NULL,
	`hashed_password` VARCHAR(120) NOT NULL,
	`password_salt` VARCHAR(60) NOT NULL,
   `id_role` INT NOT NULL,
	PRIMARY KEY(`id_user`)
);

CREATE TABLE IF NOT EXISTS `roles`(
	`id_role` INT NOT NULL AUTO_INCREMENT,
	`action` INT NOT NULL,
	`description` TEXT,
	PRIMARY KEY(`id_role`)
);

CREATE TABLE IF NOT EXISTS `parkinglots`(
	`id_parkinglot` INT NOT NULL AUTO_INCREMENT,
	`status` TINYINT NOT NULL,
	`available` INT,
	`capacity` INT,
	`location` TEXT,
	`id_comment` INT NOT NULL,
  `image` BLOB,
	PRIMARY KEY(`id_parkinglot`)
);
	
CREATE TABLE IF NOT EXISTS `activities`(
	`id_activity` INT NOT NULL AUTO_INCREMENT,
	`id_parkinglot` INT,
	`timestamp` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	`description` TEXT,
	PRIMARY KEY(`id_activity`),
	FOREIGN KEY(`id_parkinglot`) REFERENCES parkinglots(`id_parkinglot`)
);

CREATE TABLE IF NOT EXISTS `comments`(
	`id_comment` INT NOT NULL AUTO_INCREMENT,
	`id_user` INT,
	`comment` TEXT,
	PRIMARY KEY(`id_comment`),
	FOREIGN KEY(`id_user`) REFERENCES users(`id_user`)
);

CREATE TABLE IF NOT EXISTS `users_roles`(
	`id_user` INT,
	`id_role` INT,
	PRIMARY KEY(`id_user`,`id_role`),
	FOREIGN KEY(`id_user`) REFERENCES users(`id_user`),
	FOREIGN KEY(`id_role`) REFERENCES roles(`id_role`)
);

CREATE TABLE IF NOT EXISTS `user_parkinglots_subscriptions`(
	`id_user` INT,
	`id_parkinglot` INT,
	PRIMARY KEY(`id_user`,`id_parkinglot`),
	FOREIGN KEY(`id_user`) REFERENCES users(`id_user`),
	FOREIGN KEY(`id_parkinglot`) REFERENCES parkinglots(`id_parkinglot`)
);

CREATE TABLE IF NOT EXISTS `parkinglots_comments`(
	`id_parkinglot` INT NOT NULL,
	`id_comment` INT NOT NULL,
	PRIMARY KEY(`id_parkinglot`,`id_comment`),
	FOREIGN KEY(`id_parkinglot`) REFERENCES parkinglots(`id_parkinglot`),
	FOREIGN KEY(`id_comment`) REFERENCES comments(`id_comment`)
);

CREATE TABLE IF NOT EXISTS `parkingspaces`(
	`id_parkingspace` INT NOT NULL AUTO_INCREMENT,
	`state` CHAR(1) NOT NULL,
	`x` INT NOT NULL,
	`y` INT NOT NULL,
	PRIMARY KEY(`id_parkingspace`)
);

CREATE TABLE IF NOT EXISTS `parkinglots_parkingspaces`(
	`id_parkinglot` INT NOT NULL,
	`id_parkingspace` INT NOT NULL,
	PRIMARY KEY(`id_parkinglot`,`id_parkingspace`),
	FOREIGN KEY(`id_parkinglot`) REFERENCES parkinglots(`id_parkinglot`),
	FOREIGN KEY(`id_parkingspace`) REFERENCES parkingspaces(`id_parkingspace`)
);

CREATE TABLE IF NOT EXISTS `announcements`(
  `id_announcement` INT NOT NULL,
  `announcement` VARCHAR(140) NOT NULL,
  PRIMARY KEY(`id_announcement`)
);

CREATE TABLE IF NOT EXISTS `parkinglots_announcements`(
  `id_parkinglot` INT NOT NULL,
  `id_announcement` INT NOT NULL,
  PRIMARY KEY(`id_parkinglot`,`id_announcement`),
  FOREIGN KEY(`id_parkinglot`) REFERENCES parkinglots(`id_parkinglot`),
  FOREIGN KEY(`id_announcement`) REFERENCES announcements(`id_announcement`)
);


INSERT INTO `roles` (`action`, `description`) VALUES(1, 'General User');
INSERT INTO `roles` (`action`, `description`) VALUES(2, 'Admin');
