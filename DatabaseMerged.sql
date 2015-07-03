-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.0.37-community-nt - MySQL Community Edition (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             8.3.0.4694
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for tikaappdb
DROP DATABASE IF EXISTS `tikaappdb`;
CREATE DATABASE IF NOT EXISTS `tikaappdb` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `tikaappdb`;


-- Dumping structure for table tikaappdb.appmenuitems
DROP TABLE IF EXISTS `appmenuitems`;
CREATE TABLE IF NOT EXISTS `appmenuitems` (
  `id` int(11) NOT NULL auto_increment,
  `MenuName` varchar(50) default '0',
  `MenuParentName` varchar(50) NOT NULL default '0',
  `AppViewId` int(11) NOT NULL default '0',
  `MenuOrder` int(11) NOT NULL default '0',
  `SubMenuOrder` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `appView` (`AppViewId`),
  CONSTRAINT `appView` FOREIGN KEY (`AppViewId`) REFERENCES `appviews` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table tikaappdb.appmenuitems: ~4 rows (approximately)
/*!40000 ALTER TABLE `appmenuitems` DISABLE KEYS */;
INSERT INTO `appmenuitems` (`id`, `MenuName`, `MenuParentName`, `AppViewId`, `MenuOrder`, `SubMenuOrder`) VALUES
	(1, 'Home', 'Home', 1, 1, 1),
	(2, 'Tika', 'Tika', 2, 2, 1),
	(3, 'Parent', 'Parent', 3, 2, 2),
	(4, 'Child', 'Parent', 4, 2, 3);
/*!40000 ALTER TABLE `appmenuitems` ENABLE KEYS */;


-- Dumping structure for table tikaappdb.appviews
DROP TABLE IF EXISTS `appviews`;
CREATE TABLE IF NOT EXISTS `appviews` (
  `ID` int(11) NOT NULL auto_increment,
  `Controller` varchar(100) NOT NULL default '0',
  `Action` varchar(100) NOT NULL default '0',
  `SuperAdmin` int(11) NOT NULL default '0',
  `Admin` int(11) NOT NULL default '0',
  `Manager` int(11) NOT NULL default '0',
  `ViewUser` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table tikaappdb.appviews: ~4 rows (approximately)
/*!40000 ALTER TABLE `appviews` DISABLE KEYS */;
INSERT INTO `appviews` (`ID`, `Controller`, `Action`, `SuperAdmin`, `Admin`, `Manager`, `ViewUser`) VALUES
	(1, 'Home', 'Index', 1, 1, 0, 1),
	(2, 'Home', 'Tika', 1, 1, 0, 1),
	(3, 'Parent', 'Index', 1, 1, 0, 1),
	(4, 'Parent', 'Child', 1, 1, 0, 1);
/*!40000 ALTER TABLE `appviews` ENABLE KEYS */;


-- Dumping structure for table tikaappdb.centers
DROP TABLE IF EXISTS `centers`;
CREATE TABLE IF NOT EXISTS `centers` (
  `ID` int(11) NOT NULL auto_increment,
  `ThanasID` int(11) default '0',
  `CentersName` varchar(50) default '0',
  `CentersAddress` varchar(50) default '0',
  PRIMARY KEY  (`ID`),
  KEY `FKthanasID` (`ThanasID`),
  CONSTRAINT `FKthanasID` FOREIGN KEY (`ThanasID`) REFERENCES `thanas` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table tikaappdb.centers: ~0 rows (approximately)
/*!40000 ALTER TABLE `centers` DISABLE KEYS */;
/*!40000 ALTER TABLE `centers` ENABLE KEYS */;


-- Dumping structure for table tikaappdb.child
DROP TABLE IF EXISTS `child`;
CREATE TABLE IF NOT EXISTS `child` (
  `ID` int(11) NOT NULL auto_increment,
  `UserloginID` int(11) NOT NULL default '0',
  `ChildName` varchar(50) NOT NULL default '0',
  `ChildBirthDate` varchar(50) NOT NULL default '0',
  `ChildBirthCertificate` varchar(50) NOT NULL default '0',
  `ChildGender` varchar(50) NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  KEY `FKChildUserloginID` (`UserloginID`),
  CONSTRAINT `FKChildUserloginID` FOREIGN KEY (`UserloginID`) REFERENCES `userlogin` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table tikaappdb.child: ~0 rows (approximately)
/*!40000 ALTER TABLE `child` DISABLE KEYS */;
/*!40000 ALTER TABLE `child` ENABLE KEYS */;


-- Dumping structure for table tikaappdb.childinfo
DROP TABLE IF EXISTS `childinfo`;
CREATE TABLE IF NOT EXISTS `childinfo` (
  `ID` int(11) NOT NULL auto_increment,
  `ParentID` int(11) NOT NULL default '0',
  `Name` varchar(50) NOT NULL default '0',
  `Birthdate` date default NULL,
  `BirthCertificateID` varchar(50) default '0',
  PRIMARY KEY  (`ID`),
  KEY `parentFK` (`ParentID`),
  CONSTRAINT `parentFK` FOREIGN KEY (`ParentID`) REFERENCES `userinfo` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table tikaappdb.childinfo: ~2 rows (approximately)
/*!40000 ALTER TABLE `childinfo` DISABLE KEYS */;
INSERT INTO `childinfo` (`ID`, `ParentID`, `Name`, `Birthdate`, `BirthCertificateID`) VALUES
	(1, 1, 'sonamuni1', '2015-05-31', '0'),
	(2, 1, 'sonamuni2', '2017-05-31', '0');
/*!40000 ALTER TABLE `childinfo` ENABLE KEYS */;


-- Dumping structure for table tikaappdb.childvaccin
DROP TABLE IF EXISTS `childvaccin`;
CREATE TABLE IF NOT EXISTS `childvaccin` (
  `ID` int(11) NOT NULL,
  `ChildID` int(11) default NULL,
  `VaccinID` int(11) default NULL,
  `Status` bit(1) default NULL,
  `Date` date default NULL,
  PRIMARY KEY  (`ID`),
  KEY `FKChild` (`ChildID`),
  KEY `FKVaccine` (`VaccinID`),
  CONSTRAINT `FKChild` FOREIGN KEY (`ChildID`) REFERENCES `childinfo` (`ID`),
  CONSTRAINT `FKVaccine` FOREIGN KEY (`VaccinID`) REFERENCES `vaccineinfo` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table tikaappdb.childvaccin: ~0 rows (approximately)
/*!40000 ALTER TABLE `childvaccin` DISABLE KEYS */;
/*!40000 ALTER TABLE `childvaccin` ENABLE KEYS */;


-- Dumping structure for table tikaappdb.disease
DROP TABLE IF EXISTS `disease`;
CREATE TABLE IF NOT EXISTS `disease` (
  `ID` int(11) NOT NULL,
  `DiseaseName` varchar(50) NOT NULL,
  `DiseaseDescription` varchar(50) NOT NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table tikaappdb.disease: ~0 rows (approximately)
/*!40000 ALTER TABLE `disease` DISABLE KEYS */;
/*!40000 ALTER TABLE `disease` ENABLE KEYS */;


-- Dumping structure for table tikaappdb.districts
DROP TABLE IF EXISTS `districts`;
CREATE TABLE IF NOT EXISTS `districts` (
  `ID` int(11) NOT NULL auto_increment,
  `DistrictsName` varchar(50) NOT NULL,
  `DistrictsPopulation` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table tikaappdb.districts: ~64 rows (approximately)
/*!40000 ALTER TABLE `districts` DISABLE KEYS */;
INSERT INTO `districts` (`ID`, `DistrictsName`, `DistrictsPopulation`) VALUES
	(1, 'Dhaka', 0015000000),
	(2, 'Dhaka', 0015000000),
	(3, 'Rangpur', 0005040056),
	(4, 'Rajshahi', 0006055668),
	(5, 'Tangail', 0003571000),
	(6, 'Sylhet', 0003404000),
	(7, 'Sunamganj', 0002443000),
	(8, 'Sirajganj', 0003072000),
	(9, 'Sherpur', 0001334000),
	(10, 'Shariatpur', 0001146000),
	(11, 'Satkhira', 0001973000),
	(12, 'Rangamati', 0000596000),
	(13, 'Rajbari', 0001040000),
	(14, 'Pirojpur', 0001103000),
	(15, 'Patuakhali', 0001517000),
	(16, 'Panchagarh', 0000981000),
	(17, 'Pabna', 0002497000),
	(18, 'Noakhali', 0003072000),
	(19, 'Nilphamari', 0001820000),
	(20, 'Netrakona', 0002207000),
	(21, 'Natore', 0001696000),
	(22, 'Narsingdi', 0002202000),
	(23, 'Narayanganj', 0002897000),
	(24, 'Narail', 0000715000),
	(25, 'Naogaon', 0002576000),
	(26, 'Mymensingh', 0005042000),
	(27, 'Munshiganj', 0001420000),
	(28, 'Moulvibazar', 0001902000),
	(29, 'Meherpur', 0000652000),
	(30, 'Manikganj', 0001379000),
	(31, 'Magura', 0000913000),
	(32, 'Madaripur', 0001149000),
	(33, 'Lalmonirhat', 0001249000),
	(34, 'Lakshmipur', 0001711000),
	(35, 'Kushtia', 0001933000),
	(36, 'Kurigram', 0002050000),
	(37, 'Kishoreganj', 0002853000),
	(38, 'Khulna', 0002294000),
	(39, 'Khagrachhari', 0000608000),
	(40, 'Joypurhat', 0000909000),
	(41, 'Jhenaidah', 0001756000),
	(42, 'Jhalokati', 0000596000),
	(43, 'Jessore', 0002742000),
	(44, 'Jamalpur', 0002265000),
	(45, 'Habiganj', 0002059000),
	(46, 'Gopalganj', 0001149000),
	(47, 'Gazipur', 0003333000),
	(48, 'Gaibandha', 0002349000),
	(49, 'Feni', 0001420000),
	(50, 'Faridpur', 0001867000),
	(51, 'Dinajpur', 0002970000),
	(52, 'CoxsBazar', 0002275000),
	(53, 'Comilla', 0005304000),
	(54, 'Chuadanga', 0001123000),
	(55, 'Chittagong', 0007509000),
	(56, 'Chapainawabganj', 0001635000),
	(57, 'Chandpur', 0002393000),
	(58, 'Brahmanbaria', 0002808000),
	(59, 'Bogra', 0003371000),
	(60, 'Bhola', 0001758000),
	(61, 'Barisal', 0002291000),
	(62, 'Barguna', 0000882000),
	(63, 'Bandarban', 0000383000),
	(64, 'Bagerhat', 0001461000);
/*!40000 ALTER TABLE `districts` ENABLE KEYS */;


-- Dumping structure for table tikaappdb.featuredetails
DROP TABLE IF EXISTS `featuredetails`;
CREATE TABLE IF NOT EXISTS `featuredetails` (
  `ID` int(11) NOT NULL auto_increment,
  `FeatureSummaryID` int(11) NOT NULL default '0',
  `ActionName` varchar(50) NOT NULL default '0',
  `ActionStartDate` int(11) NOT NULL default '0',
  `ActionEndOffset` int(11) NOT NULL default '0',
  `Severity` varchar(50) NOT NULL default '0',
  `DiseaseID` int(11) NOT NULL default '0',
  `Description` varchar(50) NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  KEY `FKFeatureDetailsFeatureSummaryID` (`FeatureSummaryID`),
  KEY `FKFeatureDetailsDiseaseID` (`DiseaseID`),
  CONSTRAINT `FKFeatureDetailsDiseaseID` FOREIGN KEY (`DiseaseID`) REFERENCES `disease` (`ID`),
  CONSTRAINT `FKFeatureDetailsFeatureSummaryID` FOREIGN KEY (`FeatureSummaryID`) REFERENCES `featuresummary` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table tikaappdb.featuredetails: ~0 rows (approximately)
/*!40000 ALTER TABLE `featuredetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `featuredetails` ENABLE KEYS */;


-- Dumping structure for table tikaappdb.featureimplementation
DROP TABLE IF EXISTS `featureimplementation`;
CREATE TABLE IF NOT EXISTS `featureimplementation` (
  `ID` int(11) NOT NULL,
  `ChildID` int(11) NOT NULL,
  `FeatureDetailsID` int(11) NOT NULL,
  `StartDate` varchar(50) NOT NULL,
  `EndDate` varchar(50) NOT NULL,
  `Status` varchar(50) NOT NULL,
  `CentersID` int(11) NOT NULL,
  PRIMARY KEY  (`ID`),
  KEY `FKFatureImplementationChildID` (`ChildID`),
  KEY `FKFatureImplementationFeatureDetailsID` (`FeatureDetailsID`),
  KEY `FKFatureImplementationCentersID` (`CentersID`),
  CONSTRAINT `FKFatureImplementationChildID` FOREIGN KEY (`ChildID`) REFERENCES `child` (`ID`),
  CONSTRAINT `FKFatureImplementationFeatureDetailsID` FOREIGN KEY (`FeatureDetailsID`) REFERENCES `featuredetails` (`ID`),
  CONSTRAINT `FKFatureImplementationCentersID` FOREIGN KEY (`CentersID`) REFERENCES `centers` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table tikaappdb.featureimplementation: ~0 rows (approximately)
/*!40000 ALTER TABLE `featureimplementation` DISABLE KEYS */;
/*!40000 ALTER TABLE `featureimplementation` ENABLE KEYS */;


-- Dumping structure for table tikaappdb.featuresummary
DROP TABLE IF EXISTS `featuresummary`;
CREATE TABLE IF NOT EXISTS `featuresummary` (
  `ID` int(11) NOT NULL auto_increment,
  `FeatureName` varchar(50) NOT NULL default '0',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table tikaappdb.featuresummary: ~0 rows (approximately)
/*!40000 ALTER TABLE `featuresummary` DISABLE KEYS */;
/*!40000 ALTER TABLE `featuresummary` ENABLE KEYS */;


-- Dumping structure for table tikaappdb.menuitems
DROP TABLE IF EXISTS `menuitems`;
CREATE TABLE IF NOT EXISTS `menuitems` (
  `ID` int(11) NOT NULL auto_increment,
  `MenuName` varchar(50) NOT NULL,
  `ParentMenuName` varchar(50) NOT NULL,
  `AppViewId` int(11) NOT NULL,
  `MenuOrder` int(11) NOT NULL,
  `ParentMenuOrder` int(11) NOT NULL,
  PRIMARY KEY  (`ID`),
  KEY `AppViewId` (`AppViewId`),
  CONSTRAINT `AppViewId` FOREIGN KEY (`AppViewId`) REFERENCES `appviews` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table tikaappdb.menuitems: ~0 rows (approximately)
/*!40000 ALTER TABLE `menuitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `menuitems` ENABLE KEYS */;


-- Dumping structure for table tikaappdb.roles
DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `ID` int(11) NOT NULL auto_increment,
  `RoleName` varchar(200) NOT NULL,
  `ParentRoleName` varchar(200) NOT NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table tikaappdb.roles: ~4 rows (approximately)
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`ID`, `RoleName`, `ParentRoleName`) VALUES
	(1, 'SuperAdmin', 'SuperAdmin'),
	(2, 'Admin', 'SuperAdmin'),
	(3, 'Manager', 'Admin'),
	(4, 'ViewUser', 'Manager');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;


-- Dumping structure for table tikaappdb.thanas
DROP TABLE IF EXISTS `thanas`;
CREATE TABLE IF NOT EXISTS `thanas` (
  `ID` int(11) NOT NULL auto_increment,
  `DistrictsID` int(11) NOT NULL default '0',
  `ThanasName` varchar(50) NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  KEY `FKdistrictsID` (`DistrictsID`),
  CONSTRAINT `FKdistrictsID` FOREIGN KEY (`DistrictsID`) REFERENCES `districts` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table tikaappdb.thanas: ~413 rows (approximately)
/*!40000 ALTER TABLE `thanas` DISABLE KEYS */;
INSERT INTO `thanas` (`ID`, `DistrictsID`, `ThanasName`) VALUES
	(1, 1, 'Kafrul'),
	(2, 2, 'Sadar'),
	(3, 1, 'Cantonment'),
	(4, 1, 'Savar'),
	(5, 3, 'Rajshahi1'),
	(6, 60, 'Barisal Sadar'),
	(7, 59, 'Burhanuddin'),
	(8, 13, 'Mathbaria'),
	(9, 60, 'Bakerganj'),
	(10, 61, 'Amtali'),
	(11, 13, 'Nazirpur'),
	(12, 60, 'Mehendiganj'),
	(13, 61, 'Barguna Sadar'),
	(14, 59, 'Lalmohan'),
	(15, 13, 'Zianagar'),
	(16, 60, 'Agailjhara'),
	(17, 60, 'Hijla'),
	(18, 14, 'Kalapara'),
	(19, 13, 'Pirojpur sadar'),
	(20, 13, 'Nesarabad'),
	(21, 14, 'Patuakhali sadar'),
	(22, 14, 'Bauphal'),
	(23, 59, 'Bhola Sadar'),
	(24, 14, 'Galachipa'),
	(25, 60, 'Wazirpur'),
	(26, 59, 'Tazumuddin'),
	(27, 59, 'Char Fasson'),
	(28, 60, 'Muladi'),
	(29, 14, 'Dashmina'),
	(30, 60, 'Gaurnadi'),
	(31, 60, 'Babuganj'),
	(32, 13, 'Bhandaria'),
	(33, 59, 'Daulatkhan'),
	(34, 60, 'Banaripara'),
	(35, 13, 'Kaukhali'),
	(36, 61, 'Patharghata'),
	(37, 14, 'Mirzaganj'),
	(38, 14, 'Dumki'),
	(39, 61, 'Betagi'),
	(40, 59, 'Manpura'),
	(41, 61, 'Bamna'),
	(42, 54, 'Hathazari'),
	(43, 54, 'Double Mooring'),
	(44, 54, 'Khulshi'),
	(45, 54, 'Kotwali Ctg.'),
	(46, 54, 'Chittagong Port'),
	(47, 54, 'Panchlaish'),
	(48, 54, 'Baizid Bostami'),
	(49, 52, 'Comilla Sadar'),
	(50, 54, 'Sitakunda'),
	(51, 54, 'Bakalia'),
	(52, 17, 'Noakhali Sadar'),
	(53, 54, 'Patiya'),
	(54, 54, 'Pahartali'),
	(55, 54, 'Halishahar'),
	(56, 17, 'Kabirhat'),
	(57, 56, 'Chandpur Sadar'),
	(58, 54, 'Sandwip'),
	(59, 54, 'Lohagara Ctg.'),
	(60, 54, 'Rangunia'),
	(61, 48, 'Chhagalnaiya'),
	(62, 56, 'Faridganj'),
	(63, 48, 'Feni Sadar'),
	(64, 57, 'Brahmanbaria Sadar'),
	(65, 57, 'Sarail'),
	(66, 57, 'Nabinagar'),
	(67, 57, 'Kasba'),
	(68, 57, 'Nasirnagar'),
	(69, 57, 'Bancharampur'),
	(70, 57, 'Ashuganj'),
	(71, 52, 'Chauddagram'),
	(72, 52, 'Homna'),
	(73, 11, 'Kaptai'),
	(74, 26, 'Gazaria'),
	(75, 52, 'Laksam'),
	(76, 54, 'Patenga'),
	(77, 56, 'South matlab'),
	(78, 33, 'Raipur Lks.'),
	(79, 54, 'Mirsharai'),
	(80, 17, 'Sonaimuri'),
	(81, 52, 'Chandina'),
	(82, 33, 'Lakshmipur Sadar'),
	(83, 33, 'Kamolnagar'),
	(84, 52, 'Nangalkot'),
	(85, 52, 'Meghna'),
	(86, 17, 'Senbagh'),
	(87, 62, 'Alikadam'),
	(88, 48, 'Parshuram'),
	(89, 52, 'Titas'),
	(90, 17, 'Hatiya'),
	(91, 52, 'Barura'),
	(92, 33, 'Ramgati'),
	(93, 48, 'Sonagazi'),
	(94, 52, 'Debidwar'),
	(95, 56, 'North Matlab'),
	(96, 54, 'Anwara'),
	(97, 17, 'Chatkhil'),
	(98, 54, 'Boalkhali'),
	(99, 52, 'Muradnagar'),
	(100, 54, 'Fatikchhari'),
	(101, 54, 'Raozan'),
	(102, 54, 'Banshkhali'),
	(103, 54, 'Chandanaish'),
	(104, 48, 'Daganbhuiyan'),
	(105, 56, 'Shahrasti'),
	(106, 17, 'Begumganj'),
	(107, 56, 'Haziganj'),
	(108, 38, 'Dighinala'),
	(109, 52, 'Manoharganj'),
	(110, 57, 'Akhaura'),
	(111, 52, 'Burichong'),
	(112, 56, 'Haimchar'),
	(113, 48, 'Phulgazi'),
	(114, 56, 'Kachua Cnp.'),
	(115, 54, 'Chandgaon'),
	(116, 11, 'Rangamati Sadar'),
	(117, 38, 'Khagrachhari Sadar'),
	(118, 62, 'Bandarban Sadar'),
	(119, 54, 'Satkania'),
	(120, 38, 'Ramgarh'),
	(121, 17, 'Subarnar Char'),
	(122, 11, 'Kawkhali (Betbunia)'),
	(123, 38, 'Mahalchhari'),
	(124, 38, 'Matiranga'),
	(125, 62, 'Lama'),
	(126, 52, 'Daudkandi'),
	(127, 33, 'Ramganj'),
	(128, 17, 'Companiganj Nkh.'),
	(129, 52, 'Brahmanpara'),
	(130, 62, 'Ruma'),
	(131, 11, 'Rajasthali'),
	(132, 11, 'Nanner Char'),
	(133, 11, 'Baghai Chhari'),
	(134, 1, 'Motijheel'),
	(135, 1, 'Badda'),
	(136, 1, 'Gulshan'),
	(137, 21, 'Palash'),
	(138, 1, 'Mohammadpur dhk.'),
	(139, 1, 'Ramna'),
	(140, 1, 'Dhanmondi'),
	(141, 25, 'Bhaluka'),
	(142, 1, 'Tejgaon'),
	(143, 1, 'Uttara'),
	(144, 1, 'Mirpur Dhk.'),
	(145, 1, 'Dhamrai'),
	(146, 1, 'Pallabi'),
	(147, 22, 'Sonargaon'),
	(148, 1, 'Sutrapur'),
	(149, 1, 'Khilgaon'),
	(150, 46, 'Gazipur Sadar'),
	(151, 1, 'Savar'),
	(152, 1, 'Kafrul'),
	(153, 22, 'Narayanganj Sadar'),
	(154, 1, 'Lalbagh'),
	(155, 1, 'Kotwali Dhk.'),
	(156, 46, 'Sreepur Gzp.'),
	(157, 46, 'Tongi'),
	(158, 1, 'Keraniganj'),
	(159, 1, 'Shyampur'),
	(160, 1, 'Dohar'),
	(161, 26, 'Tongibari'),
	(162, 9, 'Gosairhat'),
	(163, 29, 'Shivalaya'),
	(164, 43, 'Islampur'),
	(165, 26, 'Sreenagar Mun.'),
	(166, 46, 'Kaliakair'),
	(167, 29, 'Harirampur'),
	(168, 22, 'Bandar'),
	(169, 4, 'Bhuapur'),
	(170, 49, 'Sadarpur'),
	(171, 12, 'Pangsha'),
	(172, 45, 'Muksudpur'),
	(173, 9, 'Bhedarganj'),
	(174, 26, 'Lohojang'),
	(175, 43, 'Dewanganj'),
	(176, 36, 'Bajitpur'),
	(177, 46, 'Kaliganj Gzp.'),
	(178, 22, 'Araihazar'),
	(179, 36, 'Itna'),
	(180, 36, 'Karimganj'),
	(181, 45, 'Gopalganj Sadar'),
	(182, 8, 'Nalitabari'),
	(183, 25, 'Phulpur'),
	(184, 25, 'Gaffargaon'),
	(185, 36, 'Kishoreganj Sadar'),
	(186, 4, 'Gopalpur'),
	(187, 43, 'Melandaha'),
	(188, 9, 'Naria'),
	(189, 25, 'Muktagachha'),
	(190, 31, 'Shibchar'),
	(191, 1, 'Nawabganj Dhk.'),
	(192, 36, 'Mithamain'),
	(193, 26, 'Munshiganj Sadar'),
	(194, 49, 'Faridpur Sadar'),
	(195, 26, 'Sirajdikhan'),
	(196, 25, 'Trishal'),
	(197, 21, 'Narsingdi Sadar'),
	(198, 9, 'Zanjira'),
	(199, 31, 'Rajoir'),
	(200, 31, 'Madaripur sadar'),
	(201, 25, 'Mymensingh Sadar'),
	(202, 21, 'Belabo'),
	(203, 49, 'Boalmari'),
	(204, 29, 'Manikganj Sadar'),
	(205, 12, 'Rajbari Sadar'),
	(206, 43, 'Madarganj'),
	(207, 4, 'Madhupur'),
	(208, 43, 'Baksiganj'),
	(209, 49, 'Bhanga'),
	(210, 25, 'DHOBAURA'),
	(211, 1, 'Demra'),
	(212, 21, 'Shibpur'),
	(213, 25, 'Haluaghat'),
	(214, 22, 'Rupganj'),
	(215, 46, 'Kapasia'),
	(216, 21, 'Raipur Nrs.'),
	(217, 25, 'Gauripur'),
	(218, 25, 'Ishwarganj'),
	(219, 4, 'Sakhipur'),
	(220, 4, 'Delduar'),
	(221, 21, 'Monohardi'),
	(222, 8, 'Nakla'),
	(223, 36, 'Bhairab'),
	(224, 8, 'Sherpur sadar'),
	(225, 4, 'Tangail Sadar'),
	(226, 4, 'Mirzapur'),
	(227, 12, 'Goalandaghat'),
	(228, 43, 'Jamalpur Sadar'),
	(229, 36, 'Astagram'),
	(230, 12, 'Baliakandi'),
	(231, 4, 'Nagarpur'),
	(232, 45, 'Kashiani'),
	(233, 31, 'Kalkini'),
	(234, 45, 'Kotalipara'),
	(235, 29, 'Saturia'),
	(236, 9, 'Shariatpur Sadar'),
	(237, 4, 'Kalihati'),
	(238, 29, 'Singair'),
	(239, 8, 'Sreebardi'),
	(240, 36, 'Hossainpur'),
	(241, 29, 'Ghior'),
	(242, 25, 'Phulbari Mym.'),
	(243, 1, 'Hazaribagh'),
	(244, 59, 'Sadar'),
	(245, 4, 'Basail'),
	(246, 49, 'Madhukhali'),
	(247, 25, 'Nandail'),
	(248, 1, 'Sabujbagh'),
	(249, 1, 'Kamrangirchar'),
	(250, 1, 'Cantonment'),
	(251, 4, 'Ghatail'),
	(252, 49, 'Nagarkanda'),
	(253, 36, 'Kuliarchar'),
	(254, 50, 'Phulbari Dpr.'),
	(255, 1, 'Mirpur'),
	(256, 39, 'Joypurhat sadar'),
	(257, 24, 'Naogaon sadar'),
	(258, 58, 'Sadar'),
	(259, 45, 'Tungipara'),
	(260, 43, 'Sarishabari'),
	(261, 4, 'Dhanbari'),
	(262, 8, 'Jhenaigati'),
	(263, 36, 'Katiadi'),
	(264, 36, 'Pakundia'),
	(265, 36, 'Nikli'),
	(266, 49, 'Charbhadrasan'),
	(267, 29, 'Daulatpur Mkj.'),
	(268, 9, 'Damudya'),
	(269, 36, 'Tarail'),
	(270, 49, 'Alfadanga'),
	(271, 39, 'Kalai'),
	(272, 58, 'Gabtali'),
	(273, 24, 'Raninagar'),
	(274, 42, 'Manirampur'),
	(275, 10, 'Tala'),
	(276, 47, 'Sughatta'),
	(277, 42, 'Jessore Sadar'),
	(278, 44, 'Habiganj Sadar'),
	(279, 37, 'Khalispur'),
	(280, 37, 'Kotwali Khl.'),
	(281, 1, 'Dhanmondi '),
	(282, 30, 'Sreepur Mgr.'),
	(283, 30, 'Shalikha'),
	(284, 16, 'Ishwardi'),
	(285, 3, 'Mohanpur'),
	(286, 7, 'Raiganj'),
	(287, 3, 'Charghat'),
	(288, 18, 'Kishoreganj Nfm'),
	(289, 37, 'Phultala'),
	(290, 37, 'Sonadanga'),
	(291, 34, 'Mirpur Kst.'),
	(292, 42, 'Chaugachha'),
	(293, 10, 'Kaliganj Skh.'),
	(294, 37, 'Dighalia'),
	(295, 10, 'Kalaroa'),
	(296, 42, 'Sharsha'),
	(297, 23, 'Kalia'),
	(298, 23, 'Narail Sadar'),
	(299, 28, 'Gangni'),
	(300, 42, 'Keshabpur'),
	(301, 63, 'Mongla'),
	(302, 37, 'Paikgachha'),
	(303, 37, 'Khan Jahan Ali'),
	(304, 37, 'Khalishpur'),
	(305, 53, 'Alamdanga'),
	(306, 53, 'Damurhuda'),
	(307, 10, 'Assasuni'),
	(308, 28, 'Mujibnagar'),
	(309, 53, 'Chuadanga Sadar'),
	(310, 37, 'Batiaghata'),
	(311, 42, 'Jhikargachha'),
	(312, 34, 'Kushtia Sadar'),
	(313, 53, 'Jibannagar'),
	(314, 28, 'Meherpur Sadar'),
	(315, 63, 'Morrelganj'),
	(316, 37, 'Dumuria'),
	(317, 30, 'Mohammadpur Mgr.'),
	(318, 34, 'Bheramara'),
	(319, 63, 'Sarankhola'),
	(320, 10, 'Satkhira Sadar'),
	(321, 37, 'Daulatpur Khl.'),
	(322, 37, 'Dacope'),
	(323, 63, 'Fakirhat'),
	(324, 34, 'Khoksa'),
	(325, 10, 'Debhata'),
	(326, 42, 'Bagherpara'),
	(327, 10, 'Shyamnagar'),
	(328, 42, 'Abhaynagar'),
	(329, 63, 'Bagerhat Sadar'),
	(330, 34, 'Daulatpur Kst.'),
	(331, 34, 'Kumarkhali'),
	(332, 30, 'Magura Sadar'),
	(333, 63, 'Rampal'),
	(334, 63, 'Kachua Bgr.'),
	(335, 37, 'Koyra'),
	(336, 63, 'Chitalmari'),
	(337, 63, 'Mollahat'),
	(338, 37, 'Terokhada'),
	(339, 37, 'Rupsa'),
	(340, 23, 'Lohagara Nrl.'),
	(341, 5, 'Sylhet Sadar'),
	(342, 3, 'Raipara'),
	(343, 58, 'Bogra Sadar'),
	(344, 35, 'Kurigram Sadar'),
	(345, 15, 'Panchagarh Sadar'),
	(346, 32, 'Kaliganj Lal.'),
	(347, 47, 'Gobindaganj'),
	(348, 2, 'Rangpur Sadar'),
	(349, 2, 'Pirganj Rpr.'),
	(350, 58, 'Sonatala'),
	(351, 58, 'Dhunat'),
	(352, 16, 'Pabna Sadar'),
	(353, 7, 'Sirajganj Sadar'),
	(354, 3, 'Bagmara'),
	(355, 58, 'Adamdighi'),
	(356, 58, 'Nandigram'),
	(357, 24, 'Manda'),
	(358, 58, 'Majhira'),
	(359, 16, 'Bangura'),
	(360, 7, 'Ullahpara'),
	(361, 3, 'Bagha'),
	(362, 3, 'Paba'),
	(363, 3, 'Tanore'),
	(364, 7, 'Shahjadpur'),
	(365, 3, 'Puthia'),
	(366, 58, 'Kahaloo'),
	(367, 3, 'Godagari'),
	(368, 58, 'Dupchanchia'),
	(369, 16, 'Bera'),
	(370, 16, 'Chatmohar'),
	(371, 7, 'Tarash'),
	(372, 16, 'Sujanagar'),
	(373, 58, 'Shibganj Bgr.'),
	(374, 7, 'Kazipur'),
	(375, 7, 'Kamarkhanda'),
	(376, 3, 'Durgapur Raj.'),
	(377, 24, 'Niamatpur'),
	(378, 24, 'Patnitala'),
	(379, 47, 'Gaibandha Sadar'),
	(380, 47, 'Sundarganj'),
	(381, 47, 'Sadullapur'),
	(382, 47, 'Phulchhari'),
	(383, 24, 'Atrai'),
	(384, 24, 'Porsha'),
	(385, 24, 'Badalgachhi'),
	(386, 24, 'Dhamoirhat'),
	(387, 24, 'Sapahar'),
	(388, 2, 'Mithapukur'),
	(389, 2, 'Pirgachha'),
	(390, 2, 'Badarganj'),
	(391, 2, 'Gangachhara'),
	(392, 18, 'Nilphamari Sadar'),
	(393, 58, 'Sherpur Bgr.'),
	(394, 32, 'Aditmari'),
	(395, 3, 'Boalia'),
	(396, 3, 'Motihar'),
	(397, 7, 'Chauhali'),
	(398, 50, 'Dinajpur Sadar'),
	(399, 35, 'Phulbari Kgm.'),
	(400, 50, 'Kaharole'),
	(401, 20, 'Singra'),
	(402, 20, 'Natore Sadar'),
	(403, 39, 'Panchbibi'),
	(404, 39, 'Akkelpur'),
	(405, 20, 'Lalpur'),
	(406, 20, 'Baraigram'),
	(407, 20, 'Gurudaspur'),
	(408, 50, 'Ghoraghat'),
	(409, 18, 'Domar'),
	(410, 15, 'Atwari'),
	(411, 15, 'Boda'),
	(412, 50, 'Birampur'),
	(413, 18, 'Dimla'),
	(414, 15, 'Debiganj'),
	(415, 15, 'Tetulia'),
	(416, 50, 'Chirirbandar'),
	(417, 50, 'Biral'),
	(418, 50, 'Parbatipur'),
	(419, 50, 'Nawabganj Dpr.'),
	(420, 50, 'Hakimpur'),
	(421, 7, 'Belkuchi'),
	(422, 50, 'Birganj'),
	(423, 32, 'Hatibandha'),
	(424, 35, 'Nageshwari'),
	(425, 47, 'Palashbari'),
	(426, 35, 'Ulipur'),
	(427, 50, 'Khansama'),
	(428, 58, 'Sariakandi'),
	(429, 20, 'Bagatipara'),
	(430, 24, 'Mahadevpur'),
	(431, 18, 'Jaldhaka'),
	(432, 39, 'Khetlal'),
	(433, 16, 'Atgharia'),
	(434, 16, 'Faridpur Pbn.'),
	(435, 50, 'Bochaganj'),
	(436, 35, 'Rajarhat'),
	(437, 32, 'Lalmonirhat Sadar'),
	(438, 35, 'Chilmari'),
	(439, 2, 'Taraganj'),
	(440, 16, 'Santhia'),
	(441, 32, 'Patgram'),
	(442, 18, 'Kishoreganj Nfm.'),
	(443, 18, 'Saidpur'),
	(444, 2, 'Kaunia'),
	(445, 35, 'Bhurungamari'),
	(446, 35, 'Char Rajibpur'),
	(447, 35, 'Raomari'),
	(448, 3, 'Shah Makdam'),
	(449, 5, 'Beanibazar'),
	(450, 27, 'Moulvibazar Sadar'),
	(451, 27, 'Kulaura'),
	(452, 44, 'Ajmiriganj'),
	(453, 27, 'Barlekha'),
	(454, 5, 'Zakiganj'),
	(455, 44, 'Chunarughat'),
	(456, 27, 'Sreemangal'),
	(457, 27, 'Kamalganj'),
	(458, 5, 'Balaganj'),
	(459, 44, 'Madhabpur'),
	(460, 44, 'Nabiganj'),
	(461, 5, 'Kanaighat'),
	(462, 5, 'Golabganj'),
	(463, 5, 'Bishwanath'),
	(464, 44, 'Lakhai'),
	(465, 44, 'Baniachong'),
	(466, 5, 'Gowainghat'),
	(467, 5, 'Companiganj Syl.'),
	(468, 6, 'Dharampasha'),
	(469, 27, 'Rajnagar'),
	(470, 27, 'Juri'),
	(471, 6, 'Jamalganj'),
	(472, 6, 'Derai'),
	(473, 6, 'Bishwamvarpur'),
	(474, 6, 'Dowarabazar'),
	(475, 44, 'Bahubal'),
	(476, 6, 'Tahirpur'),
	(477, 6, 'Jagannathpur'),
	(478, 6, 'Sunamganj Sadar'),
	(479, 6, 'Chhatak'),
	(480, 5, 'Jaintiapur'),
	(481, 5, 'Fenchuganj'),
	(482, 6, 'Sullah'),
	(483, 38, 'Manikchhari'),
	(484, 11, 'Barkal'),
	(485, 62, 'Naikhongchhari'),
	(486, 38, 'Lakshmichhari'),
	(487, 62, 'Rowangchhari'),
	(488, 2, 'Sadar'),
	(489, 46, 'Joydebpur'),
	(490, 38, 'Panchhari'),
	(491, 1, 'Gazipur Sadar'),
	(492, 5, 'Habiganj Sadar'),
	(493, 1, 'Lalbag'),
	(494, 59, 'Lalmohon'),
	(495, 7, 'Shajadpur'),
	(496, 15, 'Sadar'),
	(497, 58, 'Sonatola'),
	(498, 58, 'Sherpur Bgr'),
	(499, 35, 'Phulbari Kgm'),
	(500, 1, 'Banani'),
	(501, 4, 'Madhupur'),
	(502, 48, 'Feni Sadar '),
	(503, 10, 'Shatkhira Sodor'),
	(504, 63, 'Chitolmari'),
	(505, 34, 'Kushtia Sador'),
	(506, 32, 'Sadar'),
	(507, 18, 'Sadar'),
	(508, 1, 'Tongi'),
	(509, 60, 'Hizla'),
	(510, 13, 'Zianagor'),
	(511, 3, 'Sadar');
/*!40000 ALTER TABLE `thanas` ENABLE KEYS */;


-- Dumping structure for table tikaappdb.userinfo
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE IF NOT EXISTS `userinfo` (
  `ID` int(11) NOT NULL auto_increment,
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
  PRIMARY KEY  (`ID`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `UserID` FOREIGN KEY (`UserID`) REFERENCES `users` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table tikaappdb.userinfo: ~2 rows (approximately)
/*!40000 ALTER TABLE `userinfo` DISABLE KEYS */;
INSERT INTO `userinfo` (`ID`, `UserID`, `UserName`, `FullName`, `FatherName`, `MotherName`, `CellNumber`, `BirthDay`, `CurrentAddress`, `PermanentAddress`, `BirthCertificateID`) VALUES
	(1, 4, 'jubayer', 'All Jubayer Mohammad Mahamudunnabi', 'Md. Fazlur Rahman', 'Momotaz Begum', '01926662274', '1984-08-01', 'Dhaka', 'Dinajpur', '111111111111'),
	(2, 10, 'arosh', 'arosh', 'Habibunnobi Md Arifur Rahman', 'Arobi', '01926662227', '2015-03-01', 'Dhaka', 'Dinajpur', '222222222222222');
/*!40000 ALTER TABLE `userinfo` ENABLE KEYS */;


-- Dumping structure for table tikaappdb.userlogin
DROP TABLE IF EXISTS `userlogin`;
CREATE TABLE IF NOT EXISTS `userlogin` (
  `ID` int(11) NOT NULL auto_increment,
  `Name` varchar(50) NOT NULL default '0',
  `Phone` varchar(50) NOT NULL default '0',
  `Address` varchar(50) NOT NULL default '0',
  `ThanasID` int(11) NOT NULL default '0',
  `SpouseName` varchar(50) NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  KEY `FKUserLoginThanasID` (`ThanasID`),
  CONSTRAINT `FKUserLoginThanasID` FOREIGN KEY (`ThanasID`) REFERENCES `thanas` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table tikaappdb.userlogin: ~0 rows (approximately)
/*!40000 ALTER TABLE `userlogin` DISABLE KEYS */;
/*!40000 ALTER TABLE `userlogin` ENABLE KEYS */;


-- Dumping structure for table tikaappdb.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `ID` int(11) NOT NULL auto_increment,
  `UserName` varchar(50) NOT NULL,
  `UserCellNumber` varchar(50) NOT NULL,
  `UserRoleId` int(11) NOT NULL,
  PRIMARY KEY  (`ID`),
  KEY `UserRoleId` (`UserRoleId`),
  CONSTRAINT `UserRoleId` FOREIGN KEY (`UserRoleId`) REFERENCES `roles` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table tikaappdb.users: ~3 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`ID`, `UserName`, `UserCellNumber`, `UserRoleId`) VALUES
	(4, 'jubayer', '01926662274', 1),
	(5, 'atique', '01926662260', 2),
	(10, 'arosh', '01926662227', 4);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;


-- Dumping structure for table tikaappdb.vaccineinfo
DROP TABLE IF EXISTS `vaccineinfo`;
CREATE TABLE IF NOT EXISTS `vaccineinfo` (
  `ID` int(11) NOT NULL auto_increment,
  `VaccineName` varchar(50) NOT NULL default '0',
  `Type` varchar(50) default 'Genaral',
  `StartDay` int(11) NOT NULL default '0',
  `EndDay` int(11) NOT NULL default '0',
  `Description` varchar(50) NOT NULL default '0',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table tikaappdb.vaccineinfo: ~3 rows (approximately)
/*!40000 ALTER TABLE `vaccineinfo` DISABLE KEYS */;
INSERT INTO `vaccineinfo` (`ID`, `VaccineName`, `Type`, `StartDay`, `EndDay`, `Description`) VALUES
	(2, 'hum', 'Genaral', 30, 90, 'hhh2345666'),
	(3, 'pp', 'Genaral', 1, 1000, 'hjjk'),
	(5, 'piol', 'Genaral', 40, 80, 'ghgh890');
/*!40000 ALTER TABLE `vaccineinfo` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
