# --------------------------------------------------------
# Host:                         127.0.0.1
# Database:                     fake_product_bl
# Server version:               5.1.73-community
# Server OS:                    Win32
# HeidiSQL version:             5.0.0.3272
# Date/time:                    2024-02-13 12:48:23
# --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
# Dumping database structure for fake_product_bl
CREATE DATABASE IF NOT EXISTS `fake_product_bl` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `fake_product_bl`;


# Dumping structure for table fake_product_bl.companyregistertbl
CREATE TABLE IF NOT EXISTS `companyregistertbl` (
  `Cusername` text,
  `Cemail` text,
  `Cpassword` text,
  `CMbNo` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

# Dumping data for table fake_product_bl.companyregistertbl: 2 rows
/*!40000 ALTER TABLE `companyregistertbl` DISABLE KEYS */;
INSERT INTO `companyregistertbl` (`Cusername`, `Cemail`, `Cpassword`, `CMbNo`) VALUES ('om', 'om@gmail.com', 'Om@123456', '9874563210'), ('d2', 'd2@gmail.com', 'Da@123', '9874563210');
/*!40000 ALTER TABLE `companyregistertbl` ENABLE KEYS */;


# Dumping structure for table fake_product_bl.distribute_product_info
CREATE TABLE IF NOT EXISTS `distribute_product_info` (
  `MID` int(10) NOT NULL AUTO_INCREMENT,
  `ProductName` text,
  `CompanyName` text,
  `DescriptionName` text,
  `MFGDate` text,
  `Price` text,
  `ExpiryDate` text,
  `Qty` text,
  `Product_No` text,
  PRIMARY KEY (`MID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

# Dumping data for table fake_product_bl.distribute_product_info: 6 rows
/*!40000 ALTER TABLE `distribute_product_info` DISABLE KEYS */;
INSERT INTO `distribute_product_info` (`MID`, `ProductName`, `CompanyName`, `DescriptionName`, `MFGDate`, `Price`, `ExpiryDate`, `Qty`, `Product_No`) VALUES (2, 'Mobile', 'Sony', 'best mobile', '2023-02-01', '15000', '2025-02-20', '8', 'Mob84566'), (3, 'sony', 'sony', 'best TV and Mobile', '2023-01-02', '15000', '2024-05-03', '48', 'son49193'), (4, 'Vicks_Action_500', 'MI', 'fever good medicine', '2023-10-18', '10', '2023-10-26', '34', 'Vic23140'), (5, 'Vicks_Action_500', 'xyz', 'fever good medicine', '2023-12-11', '150', '2024-12-26', '2', 'Vic90965'), (6, 'Vicks', 'xyz', 'fever good medicine', '2023-02-12', '150', '2025-02-06', '3', 'Vic14449'), (7, 'kjs', 'bdskjb', 'bdk', '2023-04-03', '123', '2025-04-03', '2', 'kjs84398');
/*!40000 ALTER TABLE `distribute_product_info` ENABLE KEYS */;


# Dumping structure for table fake_product_bl.distribute_product_info_bill
CREATE TABLE IF NOT EXISTS `distribute_product_info_bill` (
  `MID` int(10) NOT NULL AUTO_INCREMENT,
  `ProductName` text,
  `CompanyName` text,
  `DescriptionName` text,
  `MFGDate` text,
  `Price` text,
  `ExpiryDate` text,
  `Qty` text,
  `Product_No` text,
  `Paybill` text,
  `Email_ID` text,
  `Distribute_Mobile_No` text,
  PRIMARY KEY (`MID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

# Dumping data for table fake_product_bl.distribute_product_info_bill: 3 rows
/*!40000 ALTER TABLE `distribute_product_info_bill` DISABLE KEYS */;
INSERT INTO `distribute_product_info_bill` (`MID`, `ProductName`, `CompanyName`, `DescriptionName`, `MFGDate`, `Price`, `ExpiryDate`, `Qty`, `Product_No`, `Paybill`, `Email_ID`, `Distribute_Mobile_No`) VALUES (2, 'Mobile', 'Sony', 'best mobile', '2023-02-01', '15000', '2025-02-20', '10', 'Mob84566', '150000', 'om@gmail.com', '9874563210'), (3, 'Vicks_Action_500', 'MI', 'fever good medicine', '2023-10-18', '10', '2023-10-26', '34', 'Vic23140', '340', 'om@gmail.com', '9874563210'), (4, 'kjs', 'bdskjb', 'bdk', '2023-04-03', '123', '2025-04-03', '2', 'kjs84398', '246', 'om@gmail.com', '9874563210');
/*!40000 ALTER TABLE `distribute_product_info_bill` ENABLE KEYS */;


# Dumping structure for table fake_product_bl.product_info
CREATE TABLE IF NOT EXISTS `product_info` (
  `MID` int(10) NOT NULL AUTO_INCREMENT,
  `ProductName` text,
  `CompanyName` text,
  `DescriptionName` text,
  `MFGDate` text,
  `Price` text,
  `ExpiryDate` text,
  `Qty` text,
  `Product_No` text,
  `Tab_Contains_First` text,
  `Tab_Contains_Second` text,
  `Tab_Contains_Third` text,
  PRIMARY KEY (`MID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

# Dumping data for table fake_product_bl.product_info: 6 rows
/*!40000 ALTER TABLE `product_info` DISABLE KEYS */;
INSERT INTO `product_info` (`MID`, `ProductName`, `CompanyName`, `DescriptionName`, `MFGDate`, `Price`, `ExpiryDate`, `Qty`, `Product_No`, `Tab_Contains_First`, `Tab_Contains_Second`, `Tab_Contains_Third`) VALUES (2, 'Mobile', 'Sony', 'best mobile', '2023-02-01', '15000', '2025-02-20', '1490', 'Mob84567', NULL, NULL, NULL), (3, 'MI mobile', 'MI', 'best TV and Mobile', '2023-01-31', '15000', '2024-02-02', '49900', 'MI 99746', NULL, NULL, NULL), (4, 'sony', 'sony', 'best TV and Mobile', '2023-01-02', '15000', '2024-05-03', '9950', 'son49193', NULL, NULL, NULL), (7, 'Vicks_Action_500', 'xyz', 'fever good medicine', '2023-12-11', '150', '2024-12-26', '1498', 'Vic90965', NULL, NULL, NULL), (8, 'Vicks', 'xyz', 'fever good medicine', '2023-02-12', '150', '2025-02-06', '147', 'Vic14449', 'Caffeine', 'Diphenhydramine', 'Paracetamol'), (9, 'kjs', 'bdskjb', 'bdk', '2023-04-03', '123', '2025-04-03', '21', 'kjs84398', 'abcd', 'abcde', 'abc');
/*!40000 ALTER TABLE `product_info` ENABLE KEYS */;


# Dumping structure for table fake_product_bl.product_info_order
CREATE TABLE IF NOT EXISTS `product_info_order` (
  `D_Id` int(10) NOT NULL AUTO_INCREMENT,
  `Distribute_Email_ID` text,
  `Product_No` text,
  `ProductName` text,
  `CompanyName` text,
  `Order_Qty` text,
  `MId` text,
  `Distribute_Mobile_No` text,
  `Status_Info` text,
  PRIMARY KEY (`D_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

# Dumping data for table fake_product_bl.product_info_order: 8 rows
/*!40000 ALTER TABLE `product_info_order` DISABLE KEYS */;
INSERT INTO `product_info_order` (`D_Id`, `Distribute_Email_ID`, `Product_No`, `ProductName`, `CompanyName`, `Order_Qty`, `MId`, `Distribute_Mobile_No`, `Status_Info`) VALUES (2, 'om@gmail.com', 'Mob84566', 'Mobile', 'Sony', '10', '2', '9874563210', 'Accept Request'), (3, 'd2@gmail.com', 'MI', 'MI mobile', 'MI', '100', '3', '9874563210', 'Accept Request'), (4, 'd2@gmail.com', 'son49193', 'sony', 'sony', '50', '4', '9874563210', 'Accept Request'), (5, 'd2@gmail.com', 'Vic88372', 'Vicks_Action_500', 'xyz', '2', '5', '9874563210', 'Accept Request'), (6, 'om@gmail.com', 'Vic23140', 'Vicks_Action_500', 'MI', '34', '6', '9874563210', 'Accept Request'), (7, 'd2@gmail.com', 'Vic90965', 'Vicks_Action_500', 'xyz', '2', '7', '9874563210', 'Accept Request'), (8, 'd2@gmail.com', 'Vic14449', 'Vicks', 'xyz', '3', '8', '9874563210', 'Accept Request'), (9, 'om@gmail.com', 'kjs84398', 'kjs', 'bdskjb', '2', '9', '9874563210', 'Accept Request');
/*!40000 ALTER TABLE `product_info_order` ENABLE KEYS */;


# Dumping structure for table fake_product_bl.registertbl
CREATE TABLE IF NOT EXISTS `registertbl` (
  `Uusername` text,
  `Uemail` text,
  `Upassword` text,
  `UMbNo` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

# Dumping data for table fake_product_bl.registertbl: 2 rows
/*!40000 ALTER TABLE `registertbl` DISABLE KEYS */;
INSERT INTO `registertbl` (`Uusername`, `Uemail`, `Upassword`, `UMbNo`) VALUES ('jitu', 'jitu@gmail.com', 'Jp@12345', '9874563210'), ('u2', 'u2@gmail.com', 'Us@123', '7896541230');
/*!40000 ALTER TABLE `registertbl` ENABLE KEYS */;


# Dumping structure for table fake_product_bl.tblamount
CREATE TABLE IF NOT EXISTS `tblamount` (
  `A_ID` int(10) NOT NULL AUTO_INCREMENT,
  `Email_ID` text,
  `Amount` text,
  PRIMARY KEY (`A_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

# Dumping data for table fake_product_bl.tblamount: 1 rows
/*!40000 ALTER TABLE `tblamount` DISABLE KEYS */;
INSERT INTO `tblamount` (`A_ID`, `Email_ID`, `Amount`) VALUES (1, 'om@gmail.com', '99849414');
/*!40000 ALTER TABLE `tblamount` ENABLE KEYS */;


# Dumping structure for table fake_product_bl.tbluser_amount
CREATE TABLE IF NOT EXISTS `tbluser_amount` (
  `A_ID` int(10) NOT NULL AUTO_INCREMENT,
  `Email_ID` text,
  `Amount` text,
  PRIMARY KEY (`A_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

# Dumping data for table fake_product_bl.tbluser_amount: 2 rows
/*!40000 ALTER TABLE `tbluser_amount` DISABLE KEYS */;
INSERT INTO `tbluser_amount` (`A_ID`, `Email_ID`, `Amount`) VALUES (1, 'jitu@gmail.com', '100000000'), (2, 'u2@gmail.com', '100000000');
/*!40000 ALTER TABLE `tbluser_amount` ENABLE KEYS */;


# Dumping structure for table fake_product_bl.user_product_info
CREATE TABLE IF NOT EXISTS `user_product_info` (
  `MID` int(10) NOT NULL AUTO_INCREMENT,
  `ProductName` text,
  `CompanyName` text,
  `DescriptionName` text,
  `MFGDate` text,
  `Price` text,
  `ExpiryDate` text,
  `Qty` text,
  `Product_No` text,
  PRIMARY KEY (`MID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

# Dumping data for table fake_product_bl.user_product_info: 0 rows
/*!40000 ALTER TABLE `user_product_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_product_info` ENABLE KEYS */;


# Dumping structure for table fake_product_bl.user_product_info_bill
CREATE TABLE IF NOT EXISTS `user_product_info_bill` (
  `MID` int(10) NOT NULL AUTO_INCREMENT,
  `ProductName` text,
  `CompanyName` text,
  `DescriptionName` text,
  `MFGDate` text,
  `Price` text,
  `ExpiryDate` text,
  `Qty` text,
  `Product_No` text,
  `Paybill` text,
  `Email_ID` text,
  `User_Mobile_No` text,
  PRIMARY KEY (`MID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

# Dumping data for table fake_product_bl.user_product_info_bill: 4 rows
/*!40000 ALTER TABLE `user_product_info_bill` DISABLE KEYS */;
INSERT INTO `user_product_info_bill` (`MID`, `ProductName`, `CompanyName`, `DescriptionName`, `MFGDate`, `Price`, `ExpiryDate`, `Qty`, `Product_No`, `Paybill`, `Email_ID`, `User_Mobile_No`) VALUES (3, 'Mobile', 'Sony', 'best mobile', '2023-02-01', '15000', '2025-02-20', '2', 'Mob84566', NULL, NULL, NULL), (4, 'Mobile', 'Sony', 'best mobile', '2023-02-01', '15000', '2025-02-20', '2', 'Mob84566', '30000', 'jitu@gmail.com', '9874563210'), (5, 'sony', 'sony', 'best TV and Mobile', '2023-01-02', '15000', '2024-05-03', '2', 'son49193', NULL, NULL, NULL), (6, 'sony', 'sony', 'best TV and Mobile', '2023-01-02', '15000', '2024-05-03', '2', 'son49193', '30000', 'u2@gmail.com', '7896541230');
/*!40000 ALTER TABLE `user_product_info_bill` ENABLE KEYS */;


# Dumping structure for table fake_product_bl.user_product_info_order
CREATE TABLE IF NOT EXISTS `user_product_info_order` (
  `D_Id` int(10) NOT NULL AUTO_INCREMENT,
  `User_Email_ID` text,
  `Product_No` text,
  `ProductName` text,
  `CompanyName` text,
  `Order_Qty` text,
  `MId` text,
  `User_Mobile_No` text,
  `Status_Info` text,
  PRIMARY KEY (`D_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

# Dumping data for table fake_product_bl.user_product_info_order: 3 rows
/*!40000 ALTER TABLE `user_product_info_order` DISABLE KEYS */;
INSERT INTO `user_product_info_order` (`D_Id`, `User_Email_ID`, `Product_No`, `ProductName`, `CompanyName`, `Order_Qty`, `MId`, `User_Mobile_No`, `Status_Info`) VALUES (2, 'jitu@gmail.com', 'Mob84566', 'Mobile', 'Sony', '2', '2', '9874563210', 'Accept Request'), (3, 'u2@gmail.com', 'son49193', 'sony', 'sony', '2', '3', '7896541230', 'Accept Request'), (4, 'u2@gmail.com', 'Vic14449', 'Vicks', 'xyz', '1', '6', '7896541230', '0');
/*!40000 ALTER TABLE `user_product_info_order` ENABLE KEYS */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
