-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.16 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             9.1.0.4867
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for tikaappdb
DROP DATABASE IF EXISTS `tikaappdb`;
CREATE DATABASE IF NOT EXISTS `tikaappdb` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `tikaappdb`;


-- Dumping structure for table tikaappdb.appviews
DROP TABLE IF EXISTS `appviews`;
CREATE TABLE IF NOT EXISTS `appviews` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Controller` varchar(100) NOT NULL DEFAULT '0',
  `Action` varchar(100) NOT NULL DEFAULT '0',
  `SuperAdmin` int(11) NOT NULL DEFAULT '0',
  `Admin` int(11) NOT NULL DEFAULT '0',
  `Manager` int(11) NOT NULL DEFAULT '0',
  `ViewUser` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table tikaappdb.appviews: ~1 rows (approximately)
DELETE FROM `appviews`;
/*!40000 ALTER TABLE `appviews` DISABLE KEYS */;
INSERT INTO `appviews` (`ID`, `Controller`, `Action`, `SuperAdmin`, `Admin`, `Manager`, `ViewUser`) VALUES
	(1, 'Home', 'Index', 1, 0, 0, 1);
/*!40000 ALTER TABLE `appviews` ENABLE KEYS */;


-- Dumping structure for table tikaappdb.menuitems
DROP TABLE IF EXISTS `menuitems`;
CREATE TABLE IF NOT EXISTS `menuitems` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MenuName` varchar(50) NOT NULL,
  `ParentMenuName` varchar(50) NOT NULL,
  `AppViewId` int(11) NOT NULL,
  `MenuOrder` int(11) NOT NULL,
  `ParentMenuOrder` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `AppViewId` (`AppViewId`),
  CONSTRAINT `AppViewId` FOREIGN KEY (`AppViewId`) REFERENCES `appviews` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table tikaappdb.menuitems: ~0 rows (approximately)
DELETE FROM `menuitems`;
/*!40000 ALTER TABLE `menuitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `menuitems` ENABLE KEYS */;


-- Dumping structure for table tikaappdb.roles
DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RoleName` varchar(200) NOT NULL,
  `ParentRoleName` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table tikaappdb.roles: ~4 rows (approximately)
DELETE FROM `roles`;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`ID`, `RoleName`, `ParentRoleName`) VALUES
	(1, 'SuperAdmin', 'SuperAdmin'),
	(2, 'Admin', 'SuperAdmin'),
	(3, 'Manager', 'Admin'),
	(4, 'ViewUser', 'Manager');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;


-- Dumping structure for table tikaappdb.userinfo
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE IF NOT EXISTS `userinfo` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NOT NULL,
  `UserName` varchar(50) NOT NULL,
  `FullName` text NOT NULL,
  `FatherName` text NOT NULL,
  `MotherName` text NOT NULL,
  `CellNumber` text NOT NULL,
  `BirthDay` date NOT NULL,
  `CurrentAddress` text NOT NULL,
  `PermanentAddress` text NOT NULL,
  `BirthCertificateID` text NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `UserID` FOREIGN KEY (`UserID`) REFERENCES `users` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table tikaappdb.userinfo: ~1 rows (approximately)
DELETE FROM `userinfo`;
/*!40000 ALTER TABLE `userinfo` DISABLE KEYS */;
INSERT INTO `userinfo` (`ID`, `UserID`, `UserName`, `FullName`, `FatherName`, `MotherName`, `CellNumber`, `BirthDay`, `CurrentAddress`, `PermanentAddress`, `BirthCertificateID`) VALUES
	(1, 4, 'jubayer', 'All Jubayer Mohammad Mahamudunnabi', 'Md. Fazlur Rahman', 'Momotaz Begum', '01926662274', '1984-08-01', 'Dhaka', 'Dinajpur', '111111111111'),
	(2, 10, 'arosh', 'arosh', 'Habibunnobi Md Arifur Rahman', 'Arobi', '01926662227', '2015-03-01', 'Dhaka', 'Dinajpur', '222222222222222');
/*!40000 ALTER TABLE `userinfo` ENABLE KEYS */;


-- Dumping structure for table tikaappdb.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(50) NOT NULL,
  `UserCellNumber` varchar(50) NOT NULL,
  `UserRoleId` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `UserRoleId` (`UserRoleId`),
  CONSTRAINT `UserRoleId` FOREIGN KEY (`UserRoleId`) REFERENCES `roles` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- Dumping data for table tikaappdb.users: ~3 rows (approximately)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`ID`, `UserName`, `UserCellNumber`, `UserRoleId`) VALUES
	(4, 'jubayer', '01926662274', 1),
	(5, 'atique', '01926662260', 2),
	(6, 'sakib', '01926662274', 3),
	(10, 'arosh', '01926662227', 4);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
