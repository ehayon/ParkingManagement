CREATE DATABASE IF NOT EXISTS `ParkingManagementSystem`;

CREATE TABLE IF NOT EXISTS `users`(
	`id_user` INT NOT NULL AUTO_INCREMENT,
	`username` VARCHAR(30) NOT NULL,
	`fname` VARCHAR(30) NOT NULL,
	`lname` VARCHAR(50) NOT NULL,
	`email` VARCHAR(60) NOT NULL,
	`hashed_password` VARCHAR(60) NOT NULL,
	`password_salt` VARCHAR(60) NOT NULL,
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
	PRIMARY KEY(`id_parkinglot`)
);
	


