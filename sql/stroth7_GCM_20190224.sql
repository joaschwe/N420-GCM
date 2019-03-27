-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 24, 2019 at 08:11 PM
-- Server version: 10.2.12-MariaDB-log
-- PHP Version: 7.2.7

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `stroth7_GCM`
--
CREATE DATABASE IF NOT EXISTS `stroth7_GCM` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `stroth7_GCM`;

-- --------------------------------------------------------

--
-- Table structure for table `Addresses`
--

DROP TABLE IF EXISTS `Addresses`;
CREATE TABLE `Addresses` (
  `ID` int(10) UNSIGNED NOT NULL,
  `AddressTypeID` int(10) UNSIGNED NOT NULL COMMENT 'FK To AddressTypes.ID',
  `CustomerID` int(10) UNSIGNED DEFAULT NULL,
  `CraftsmenID` int(10) UNSIGNED DEFAULT NULL,
  `CauseID` int(10) UNSIGNED DEFAULT NULL,
  `FirstName` char(100) NOT NULL,
  `LastName` char(100) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `PhoneNumber` varchar(15) NOT NULL,
  `FaxNumber` varchar(15) DEFAULT NULL,
  `BillToAddress1` varchar(60) NOT NULL,
  `BillToAddress2` varchar(60) NOT NULL,
  `BillToAddress3` varchar(60) NOT NULL,
  `BillToAddress4` varchar(60) NOT NULL,
  `BillToCity` char(60) NOT NULL,
  `BillToStateID` int(2) UNSIGNED NOT NULL COMMENT 'FK to States.ID',
  `BillToPostal` int(10) NOT NULL,
  `ShipToSameAsBillTo` tinyint(1) NOT NULL DEFAULT 1,
  `ShipToAddress1` varchar(60) DEFAULT NULL,
  `ShipToAddress2` varchar(60) DEFAULT NULL,
  `ShipToAddress3` varchar(60) DEFAULT NULL,
  `ShipToAddress4` varchar(60) DEFAULT NULL,
  `ShipToCity` char(60) DEFAULT NULL,
  `ShipToStateID` int(2) UNSIGNED DEFAULT NULL COMMENT 'FK to States.ID',
  `ShipToPostal` int(10) DEFAULT NULL,
  `DefaultBilling` tinyint(1) DEFAULT NULL,
  `DefaultShipping` tinyint(1) DEFAULT NULL,
  `Active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Addresses for all customers, artisans, etc';

-- --------------------------------------------------------

--
-- Table structure for table `AddressTypes`
--

DROP TABLE IF EXISTS `AddressTypes`;
CREATE TABLE `AddressTypes` (
  `ID` int(10) UNSIGNED NOT NULL COMMENT 'FK to Addresses.AddressType',
  `Name` varchar(20) NOT NULL,
  `Active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `AddressTypes`
--

INSERT INTO `AddressTypes` (`ID`, `Name`, `Active`) VALUES
(1, 'BILLING', 1),
(2, 'MAILING', 1),
(3, 'PRODUCT PICK-UP', 1);

-- --------------------------------------------------------

--
-- Table structure for table `Causes`
--

DROP TABLE IF EXISTS `Causes`;
CREATE TABLE `Causes` (
  `ID` int(10) UNSIGNED NOT NULL,
  `Name` varchar(60) NOT NULL,
  `CauseTypeID` int(10) UNSIGNED NOT NULL COMMENT 'FK to CauseTypes.ID',
  `CauseScheduleID` int(10) UNSIGNED NOT NULL COMMENT 'FK to CauseSchedules.ID',
  `Active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='List of all available causes/non-profits';

-- --------------------------------------------------------

--
-- Table structure for table `CauseSchedules`
--

DROP TABLE IF EXISTS `CauseSchedules`;
CREATE TABLE `CauseSchedules` (
  `ID` int(10) UNSIGNED NOT NULL,
  `CauseID` int(10) UNSIGNED NOT NULL COMMENT 'FK to Causes.ID',
  `StartDate` datetime(6) NOT NULL,
  `EndDate` datetime(6) NOT NULL COMMENT 'If indefinite, then set to ''9999-12-31 23:59.59''',
  `ApprovedBy` int(10) UNSIGNED NOT NULL COMMENT 'FK to Users.ID',
  `ApprovedOn` datetime(6) NOT NULL,
  `Active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Table for scheduling causes';

-- --------------------------------------------------------

--
-- Table structure for table `CauseTypes`
--

DROP TABLE IF EXISTS `CauseTypes`;
CREATE TABLE `CauseTypes` (
  `ID` int(10) UNSIGNED NOT NULL COMMENT 'Used to link tables',
  `Name` varchar(80) NOT NULL,
  `ExpireInDays` int(3) NOT NULL DEFAULT 60 COMMENT 'Set default number of days a cause type should run on website. 0 (Zero) means indefinitely',
  `Active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table is for the available types of causes - 501(c)3,';

--
-- Dumping data for table `CauseTypes`
--

INSERT INTO `CauseTypes` (`ID`, `Name`, `ExpireInDays`, `Active`) VALUES
(1, 'RELIGIOUS', 60, 1),
(2, 'EDUCATIONAL', 60, 1),
(3, 'SPORTS LEAGUES', 60, 1),
(4, 'SPORTS LEAGUES YOUTH', 60, 1),
(5, 'CIVIC CLUBS', 60, 1),
(6, 'CIVIC CLUBS YOUTH', 60, 1),
(7, 'CONSERVATION', 0, 1),
(8, 'COMMUNITY SERVICE', 0, 1),
(9, 'COMMUNITY OUTREACH', 0, 1),
(10, 'SCIENTIFIC', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Craftsmen`
--

DROP TABLE IF EXISTS `Craftsmen`;
CREATE TABLE `Craftsmen` (
  `ID` int(10) UNSIGNED NOT NULL COMMENT 'link tables',
  `Name` varchar(255) NOT NULL,
  `CraftsmenID_translation` varchar(20) NOT NULL COMMENT 'If Craftor has their ID they want for Xref',
  `BillToAddressID` int(10) UNSIGNED NOT NULL COMMENT 'fk to Addresses.ID',
  `ShipToAddressID` int(10) UNSIGNED NOT NULL COMMENT 'fk to Addresses.ID',
  `PickupLocationID` int(10) UNSIGNED NOT NULL COMMENT 'fk to Addresses.ID',
  `FedexAcctNumber` varchar(15) NOT NULL,
  `UPSAccountNumber` varchar(15) NOT NULL,
  `USPSAccountNumber` varchar(15) NOT NULL,
  `DescriptionAbout` varchar(255) NOT NULL,
  `WebsiteURL` varchar(100) NOT NULL,
  `Active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Customers`
--

DROP TABLE IF EXISTS `Customers`;
CREATE TABLE `Customers` (
  `ID` int(10) UNSIGNED NOT NULL,
  `FName` char(100) NOT NULL,
  `LName` char(100) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `PhoneNumber` varchar(15) NOT NULL,
  `IsCommercial` tinyint(1) NOT NULL DEFAULT 0,
  `CompanyName` varchar(100) DEFAULT NULL,
  `BillToAddressID` int(10) UNSIGNED NOT NULL COMMENT 'FK to Addresses.ID where AddressTypeID=1',
  `ShipToAddressID` int(10) UNSIGNED NOT NULL COMMENT 'FK to Addresses.ID where AddressTypeID=2',
  `ReceiveNewsletter` tinyint(1) DEFAULT 1,
  `ReceiveOffers` tinyint(1) DEFAULT 1,
  `StripeCustomerToken` varchar(100) DEFAULT NULL,
  `UserName` varchar(30) NOT NULL,
  `Password` varchar(30) NOT NULL,
  `Active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Basic Info about registered customer';

-- --------------------------------------------------------

--
-- Table structure for table `ItemCategories`
--

DROP TABLE IF EXISTS `ItemCategories`;
CREATE TABLE `ItemCategories` (
  `ID` int(10) UNSIGNED NOT NULL,
  `Name` varchar(255) NOT NULL COMMENT 'Name of Category that will display on Products Page',
  `Description` varchar(255) NOT NULL COMMENT 'Short Description of the Category',
  `Active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ItemCategories`
--

INSERT INTO `ItemCategories` (`ID`, `Name`, `Description`, `Active`) VALUES
(1, 'CLOTHING, ACCESSORIES, JEWELRY', 'The products may not be Rolodexes, Vera Bradley Bags, or Tommy Hilfiger items; however, these are some of the best hand-made Clothes, Accessories, and Jewelry in Indiana you can buy', 1),
(2, 'RUGGED', 'A little rough on things? Need something really sturdy, check out our Rugged section then!', 1),
(3, 'CANDLES', 'Looking for something on the lighter side? Check out our assortment of scented and unscented Candles', 1),
(4, 'INCREDIBLE EDIBLES', 'We love food at Good Cause Market! Check out some of the Incredible Edibles we\'ve came across over the years.', 1),
(5, 'PETS', 'Don\'t forget about your four-legged friends. Our Pets selection is through the \"woof\". Some might say it\'s the Cat\'s meow!', 1),
(6, 'KIDDOS', 'Wishy, washy, soft, and plushie - we have the things your Kiddos will want!', 1),
(7, 'BATH AND BEAUTY', 'Head, shoulders, knees, and toes! Our Bath and Beauty has got you covered, head to toe.', 1),
(8, 'HOME', 'Home is where the heart is. Let our hearts fill your home.', 1);

-- --------------------------------------------------------

--
-- Table structure for table `Items`
--

DROP TABLE IF EXISTS `Items`;
CREATE TABLE `Items` (
  `ID` int(10) UNSIGNED NOT NULL,
  `CraftsmentID` int(10) UNSIGNED NOT NULL COMMENT 'fk to Craftsmen.ID',
  `CraftsmenID_translation` varchar(20) DEFAULT NULL COMMENT 'fk to Craftsmen.CraftsmenID_translation',
  `Name` varchar(266) NOT NULL,
  `Description` varchar(266) NOT NULL,
  `imageURL` varchar(100) DEFAULT NULL COMMENT 'May not have an image for an uploaded item',
  `Length` decimal(10,4) DEFAULT NULL COMMENT 'May not have LxWxH or Weight',
  `Width` decimal(10,4) DEFAULT NULL COMMENT 'May not have LxWxH or Weight',
  `Height` decimal(10,4) DEFAULT NULL COMMENT 'May not have LxWxH or Weight',
  `Weight` decimal(10,4) DEFAULT NULL COMMENT 'May not have LxWxH or Weight',
  `UOMID` int(10) UNSIGNED NOT NULL COMMENT 'Must use the Unit of Measures defined',
  `Cost` decimal(10,6) DEFAULT NULL COMMENT 'May only have a retail designated since not keeping track of costs',
  `Retail` decimal(10,6) NOT NULL,
  `Category1ID` int(10) UNSIGNED NOT NULL COMMENT 'fk to ItemCategories.ID',
  `Category2ID` int(10) UNSIGNED NOT NULL COMMENT 'fk to ItemCategories.ID',
  `Category3ID` int(10) UNSIGNED NOT NULL COMMENT 'fk to ItemCategories.ID',
  `SubCategory11ID` int(10) UNSIGNED NOT NULL COMMENT 'fk to ItemSubCategories.ID',
  `SubCategory12ID` int(10) UNSIGNED NOT NULL COMMENT 'fk to ItemSubCategories.ID',
  `SubCategory13ID` int(10) UNSIGNED NOT NULL COMMENT 'fk to ItemSubCategories.ID',
  `SubCategory21ID` int(10) UNSIGNED NOT NULL COMMENT 'fk to ItemSubCategories.ID',
  `SubCategory22ID` int(10) UNSIGNED NOT NULL COMMENT 'fk to ItemSubCategories.ID',
  `SubCategory23ID` int(10) UNSIGNED NOT NULL COMMENT 'fk to ItemSubCategories.ID',
  `SubCategory31ID` int(10) UNSIGNED NOT NULL COMMENT 'fk to ItemSubCategories.ID',
  `SubCategory32ID` int(10) UNSIGNED NOT NULL COMMENT 'fk to ItemSubCategories.ID',
  `SubCategory33ID` int(10) UNSIGNED NOT NULL COMMENT 'fk to ItemSubCategories.ID',
  `QtyInStock` int(10) NOT NULL,
  `QtyPendingSale` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ItemSubCategories`
--

DROP TABLE IF EXISTS `ItemSubCategories`;
CREATE TABLE `ItemSubCategories` (
  `ID` int(10) UNSIGNED NOT NULL,
  `CategoryID` int(10) UNSIGNED NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Notes`
--

DROP TABLE IF EXISTS `Notes`;
CREATE TABLE `Notes` (
  `ID` int(10) UNSIGNED NOT NULL,
  `OHOrderNumber` varchar(20) NOT NULL COMMENT 'FK to OrderHeader.OrderNumber',
  `Notes` varchar(255) NOT NULL,
  `CreatedDate` datetime(6) DEFAULT NULL,
  `ModifiedDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table displays notes by order number.';

-- --------------------------------------------------------

--
-- Table structure for table `OrderDetail`
--

DROP TABLE IF EXISTS `OrderDetail`;
CREATE TABLE `OrderDetail` (
  `LineItemID` bigint(12) UNSIGNED NOT NULL,
  `OHOrderNumber` int(20) UNSIGNED NOT NULL COMMENT 'fk to OrderHeader.OrderNumber',
  `CraftsmenID` int(10) UNSIGNED NOT NULL COMMENT 'fk to Craftsmen.ID',
  `ItemID` int(10) UNSIGNED NOT NULL COMMENT 'fk to Items.ID',
  `ItemQuantity` tinyint(3) UNSIGNED NOT NULL,
  `RetailAmount` decimal(10,2) NOT NULL,
  `LineItemTotal` decimal(10,2) NOT NULL,
  `ShippingAmount` decimal(10,2) NOT NULL,
  `CauseID` int(10) UNSIGNED NOT NULL COMMENT 'fk to Causes.ID',
  `CauseAmount` decimal(10,2) NOT NULL,
  `TrackingNumberID` int(10) UNSIGNED NOT NULL COMMENT 'fk to TrackingNumber.ID'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `OrderHeader`
--

DROP TABLE IF EXISTS `OrderHeader`;
CREATE TABLE `OrderHeader` (
  `OrderNumber` int(20) UNSIGNED NOT NULL,
  `OrderDate` date DEFAULT NULL,
  `CustomerID` int(10) UNSIGNED NOT NULL,
  `BillToAddressID` int(10) UNSIGNED NOT NULL,
  `ShipToAddressID` int(10) UNSIGNED NOT NULL,
  `PaymentTypeID` int(6) UNSIGNED NOT NULL,
  `StripePaymentAuthNum` varchar(100) NOT NULL,
  `StripeCardLast4` int(4) UNSIGNED NOT NULL,
  `StripeCardExpiration` varchar(10) NOT NULL,
  `IsSplitPayment` tinyint(1) NOT NULL DEFAULT 0,
  `PaymentTypeID2` int(6) UNSIGNED DEFAULT NULL,
  `StripePaymentAuthNum2` varchar(100) DEFAULT NULL,
  `StripeCard2Last4` int(4) UNSIGNED DEFAULT NULL,
  `StripeCard2Expiration` varchar(10) DEFAULT NULL,
  `ItemsSubtotal` decimal(10,2) NOT NULL,
  `ItemsShippingTotal` decimal(10,2) NOT NULL,
  `ItemsTaxTotal` decimal(10,2) DEFAULT NULL,
  `AppliedRewardsTotal` decimal(10,2) DEFAULT NULL,
  `OrderTotal` decimal(10,2) NOT NULL,
  `DonationTotal` decimal(10,2) NOT NULL,
  `StripeFeesTotal` decimal(10,2) NOT NULL,
  `IsGuestCheckout` tinyint(1) NOT NULL,
  `IsRegisteredCheckout` tinyint(1) NOT NULL,
  `HasNote` tinyint(1) NOT NULL DEFAULT 0,
  `NotesID` int(10) UNSIGNED DEFAULT NULL,
  `OrderStatusID` int(6) UNSIGNED NOT NULL,
  `CauseID1` int(10) UNSIGNED NOT NULL,
  `CauseID2` int(10) UNSIGNED DEFAULT NULL,
  `CauseID3` int(10) UNSIGNED DEFAULT NULL,
  `PONumber` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `OrderStatus`
--

DROP TABLE IF EXISTS `OrderStatus`;
CREATE TABLE `OrderStatus` (
  `ID` int(6) UNSIGNED NOT NULL,
  `Name` varchar(60) NOT NULL,
  `Active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='List of all available order statuses';

--
-- Dumping data for table `OrderStatus`
--

INSERT INTO `OrderStatus` (`ID`, `Name`, `Active`) VALUES
(1, 'PAYMENT PENDING', 1),
(2, 'PAYMENT FINALIZED', 1),
(3, 'ORDER CONFIRMED', 1),
(4, 'IN PROCESS', 1),
(5, 'SHIPPING', 1);

-- --------------------------------------------------------

--
-- Table structure for table `PaymentType`
--

DROP TABLE IF EXISTS `PaymentType`;
CREATE TABLE `PaymentType` (
  `ID` int(6) UNSIGNED NOT NULL,
  `PaymentType` varchar(20) NOT NULL,
  `LastUsed` date DEFAULT NULL COMMENT 'Used to see what payment methods are actually used',
  `RequiresName` tinyint(1) DEFAULT 1,
  `RequiresCVC` tinyint(1) DEFAULT 1,
  `RequiresExpiration` tinyint(1) DEFAULT 1,
  `Active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Supplies the list of available payment types';

-- --------------------------------------------------------

--
-- Table structure for table `ShippingMethod`
--

DROP TABLE IF EXISTS `ShippingMethod`;
CREATE TABLE `ShippingMethod` (
  `ID` int(6) UNSIGNED NOT NULL COMMENT 'Used to link Shipping Method to Order',
  `Name` varchar(100) NOT NULL COMMENT 'Descriptive name for shipping method',
  `Active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='WIll be used to populate drop downs for available shipping';

--
-- Dumping data for table `ShippingMethod`
--

INSERT INTO `ShippingMethod` (`ID`, `Name`, `Active`) VALUES
(1, 'DROP-SHIP', 1),
(2, 'UPS', 1),
(3, 'FEDEX', 1),
(4, 'USPS', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ShippingSpeed`
--

DROP TABLE IF EXISTS `ShippingSpeed`;
CREATE TABLE `ShippingSpeed` (
  `ID` int(6) UNSIGNED NOT NULL COMMENT 'Used to link tables',
  `ShippingMethodID` int(6) UNSIGNED NOT NULL COMMENT 'FK to ShippingMethod.ID',
  `Name` varchar(100) NOT NULL,
  `NumBDays` varchar(10) NOT NULL COMMENT 'Number of Business Days advertised from Shipper',
  `Active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Used to determine speed - 3 day, next day, etc';

--
-- Dumping data for table `ShippingSpeed`
--

INSERT INTO `ShippingSpeed` (`ID`, `ShippingMethodID`, `Name`, `NumBDays`, `Active`) VALUES
(1, 1, 'ASAP', 'ASAP', 1),
(2, 1, 'SCHEDULED', 'TBD', 1),
(3, 2, 'EXPRESS CRITICAL', '<1', 1),
(4, 2, 'NEXT DAY AIR EARLY', '1', 1),
(5, 2, 'NEXT DAY AIR', '1', 1),
(6, 2, 'NEXT DAY AIR SAVER', '1', 1),
(7, 2, '2ND DAY AIR AM', '2', 1),
(8, 2, '2ND DAY AIR', '2', 1),
(9, 2, '3 DAY SELECT', '3', 1),
(10, 2, 'GROUND', '1-5', 1),
(11, 3, 'SAMEDAY', '<1', 1),
(12, 3, 'FIRST OVERNIGHT', '1', 1),
(13, 3, 'PRIORITY OVERNIGHT', '1', 1),
(14, 3, 'STANDARD OVERNIGHT', '1', 1),
(15, 3, '2DAY AM', '2', 1),
(16, 3, '2DAY', '2', 1),
(17, 3, 'EXPRESS SAVER', '3', 1),
(18, 3, 'GROUND', '1-7', 1),
(19, 3, 'HOME DELIVERY', '1-7', 1),
(20, 3, 'SMARTPOST', '2-7', 1),
(21, 4, 'PRIORITY MAIL EXPRESS', 'Ovrnt, 1-2', 1),
(22, 4, 'PRIORITY MAIL', '1-3', 1),
(23, 4, 'FIRST-CLASS MAIL', '1-3', 1),
(24, 4, 'USPS RETAIL GROUND', '2-8', 1),
(25, 4, 'MEDIA MAIL', '2-8', 1);

-- --------------------------------------------------------

--
-- Table structure for table `States`
--

DROP TABLE IF EXISTS `States`;
CREATE TABLE `States` (
  `ID` int(2) UNSIGNED NOT NULL COMMENT 'State ID used to link with other tables',
  `Name` char(14) NOT NULL COMMENT 'Full name of State',
  `Abbreviation` char(2) NOT NULL COMMENT '2 Character Abbreviation',
  `Active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='States table will provide lookup and validation';

--
-- Dumping data for table `States`
--

INSERT INTO `States` (`ID`, `Name`, `Abbreviation`, `Active`) VALUES
(1, 'ALABAMA', 'AL', 0),
(2, 'ALASKA', 'AK', 0),
(3, 'ARIZONA', 'AZ', 0),
(4, 'ARKANSAS', 'AR', 0),
(5, 'CALIFORNIA', 'CA', 0),
(6, 'COLORADO', 'CO', 0),
(7, 'CONNECTICUT', 'CT', 0),
(8, 'DELAWARE', 'DE', 0),
(9, 'FLORIDA', 'FL', 0),
(10, 'GEORGIA', 'GA', 0),
(11, 'HAWAII', 'HI', 0),
(12, 'IDAHO', 'ID', 0),
(13, 'ILLINOIS', 'IL', 0),
(14, 'INDIANA', 'IN', 1),
(15, 'IOWA', 'IA', 0),
(16, 'KANSAS', 'KS', 0),
(17, 'KENTUCKY', 'KY', 0),
(18, 'LOUISIANA', 'LA', 0),
(19, 'MAINE', 'ME', 0),
(20, 'MARYLAND', 'MD', 0),
(21, 'MASSACHUSETTS', 'MA', 0),
(22, 'MICHIGAN', 'MI', 0),
(23, 'MINNESOTA', 'MN', 0),
(24, 'MISSISSIPPI', 'MS', 0),
(25, 'MISSOURI', 'MO', 0),
(26, 'MONTANA', 'MT', 0),
(27, 'NEBRASKA', 'NE', 0),
(28, 'NEVADA', 'NV', 0),
(29, 'NEW HAMPSHIRE', 'NH', 0),
(30, 'NEW JERSEY', 'NJ', 0),
(31, 'NEW MEXICO', 'NM', 0),
(32, 'NEW YORK', 'NY', 0),
(33, 'NORTH CAROLINA', 'NC', 0),
(34, 'NORTH DAKOTA', 'ND', 0),
(35, 'OHIO', 'OH', 0),
(36, 'OKLAHOMA', 'OK', 0),
(37, 'OREGON', 'OR', 0),
(38, 'PENNSYLVANIA', 'PA', 0),
(39, 'RHODE ISLAND', 'RI', 0),
(40, 'SOUTH CAROLINA', 'SC', 0),
(41, 'SOUTH DAKOTA', 'SD', 0),
(42, 'TENNESSEE', 'TN', 0),
(43, 'TEXAS', 'TX', 0),
(44, 'UTAH', 'UT', 0),
(45, 'VERMONT', 'VT', 0),
(46, 'VIRGINIA', 'VA', 0),
(47, 'WASHINGTON', 'WA', 0),
(48, 'WEST VIRGINIA', 'WV', 0),
(49, 'WISCONSIN', 'WI', 0),
(50, 'WYOMING', 'WY', 0);

-- --------------------------------------------------------

--
-- Table structure for table `TaxAuthority`
--

DROP TABLE IF EXISTS `TaxAuthority`;
CREATE TABLE `TaxAuthority` (
  `ID` int(6) UNSIGNED NOT NULL COMMENT 'Used to link tables',
  `TypeID` int(6) UNSIGNED NOT NULL COMMENT 'FK to TaxType. Matches TaxType.ID',
  `AuthorityID` int(2) UNSIGNED NOT NULL COMMENT 'FK to States. Matches States.ID',
  `AmountPercent` decimal(13,2) DEFAULT NULL COMMENT 'Could be null if a state charges a flat dollar amount',
  `AmountDollar` decimal(13,4) DEFAULT NULL COMMENT 'Could be null if a state charges only a percentage',
  `Active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Used to determine what state tax needs to be reported in';

--
-- Dumping data for table `TaxAuthority`
--

INSERT INTO `TaxAuthority` (`ID`, `TypeID`, `AuthorityID`, `AmountPercent`, `AmountDollar`, `Active`) VALUES
(1, 1, 14, '0.00', '0.0000', 0),
(2, 2, 14, '0.00', '0.0000', 0),
(3, 3, 14, '7.00', '0.0000', 1),
(4, 33, 14, '1.00', '0.0000', 1),
(5, 53, 14, '2.02', '0.0000', 1);

-- --------------------------------------------------------

--
-- Table structure for table `TaxTypes`
--

DROP TABLE IF EXISTS `TaxTypes`;
CREATE TABLE `TaxTypes` (
  `ID` int(6) UNSIGNED NOT NULL COMMENT 'Used to map to other tables',
  `Name` varchar(50) NOT NULL COMMENT 'Descriptive name of the tax',
  `Active` tinyint(1) DEFAULT 1 COMMENT 'Define whether the tax row is active or not'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table will link to the Tax Authorities Table';

--
-- Dumping data for table `TaxTypes`
--

INSERT INTO `TaxTypes` (`ID`, `Name`, `Active`) VALUES
(1, 'FEDERAL', 1),
(2, 'FICA', 1),
(3, 'STATE', 1),
(4, 'LOCAL', 0),
(5, 'COUNTYIN_ADAMS', 0),
(6, 'COUNTYIN_ALLEN', 0),
(7, 'COUNTYIN_BARTHOLOMEW', 0),
(8, 'COUNTYIN_BENTON', 0),
(9, 'COUNTYIN_BLACKFORD', 0),
(10, 'COUNTYIN_BOONE', 0),
(11, 'COUNTYIN_BROWN', 0),
(12, 'COUNTYIN_CARROLL', 0),
(13, 'COUNTYIN_CASS', 0),
(14, 'COUNTYIN_CLARK', 0),
(15, 'COUNTYIN_CLAY', 0),
(16, 'COUNTYIN_CLINTON', 0),
(17, 'COUNTYIN_CRAWFORD', 0),
(18, 'COUNTYIN_DAVIESS', 0),
(19, 'COUNTYIN_DEARBORN', 0),
(20, 'COUNTYIN_DECATUR', 0),
(21, 'COUNTYIN_DEKALB', 0),
(22, 'COUNTYIN_DELAWARE', 0),
(23, 'COUNTYIN_DUBOIS', 0),
(24, 'COUNTYIN_ELKHART', 0),
(25, 'COUNTYIN_FAYETTE', 0),
(26, 'COUNTYIN_FLOYD', 0),
(27, 'COUNTYIN_FOUNTAIN', 0),
(28, 'COUNTYIN_FRANKLIN', 0),
(29, 'COUNTYIN_FULTON', 0),
(30, 'COUNTYIN_GIBSON', 0),
(31, 'COUNTYIN_GRANT', 0),
(32, 'COUNTYIN_GREENE', 0),
(33, 'COUNTYIN_HAMILTON', 1),
(34, 'COUNTYIN_HANCOCK', 0),
(35, 'COUNTYIN_HARRISON', 0),
(36, 'COUNTYIN_HENDRICKS', 0),
(37, 'COUNTYIN_HENRY', 0),
(38, 'COUNTYIN_HOWARD', 0),
(39, 'COUNTYIN_HUNTINGTON', 0),
(40, 'COUNTYIN_JACKSON', 0),
(41, 'COUNTYIN_JASPER', 0),
(42, 'COUNTYIN_JAY', 0),
(43, 'COUNTYIN_JEFFERSON', 0),
(44, 'COUNTYIN_JENNINGS', 0),
(45, 'COUNTYIN_JOHNSON', 0),
(46, 'COUNTYIN_KNOX', 0),
(47, 'COUNTYIN_KOSCIUSKO', 0),
(48, 'COUNTYIN_LAGRANGE', 0),
(49, 'COUNTYIN_LAKE', 0),
(50, 'COUNTYIN_LAPORTE', 0),
(51, 'COUNTYIN_LAWRENCE', 0),
(52, 'COUNTYIN_MADISON', 0),
(53, 'COUNTYIN_MARION', 1),
(54, 'COUNTYIN_MARSHALL', 0),
(55, 'COUNTYIN_MARTIN', 0),
(56, 'COUNTYIN_MIAMI', 0),
(57, 'COUNTYIN_MONROE', 0),
(58, 'COUNTYIN_MONTGOMERY', 0),
(59, 'COUNTYIN_MORGAN', 0),
(60, 'COUNTYIN_NEWTON', 0),
(61, 'COUNTYIN_NOBLE', 0),
(62, 'COUNTYIN_OHIO', 0),
(63, 'COUNTYIN_ORANGE', 0),
(64, 'COUNTYIN_OWEN', 0),
(65, 'COUNTYIN_PARKE', 0),
(66, 'COUNTYIN_PERRY', 0),
(67, 'COUNTYIN_PIKE', 0),
(68, 'COUNTYIN_PORTER', 0),
(69, 'COUNTYIN_POSEY', 0),
(70, 'COUNTYIN_PULASKI', 0),
(71, 'COUNTYIN_PUTNAM', 0),
(72, 'COUNTYIN_RANDOLPH', 0),
(73, 'COUNTYIN_RIPLEY', 0),
(74, 'COUNTYIN_RUSH', 0),
(75, 'COUNTYIN_SCOTT', 0),
(76, 'COUNTYIN_SHELBY', 0),
(77, 'COUNTYIN_SPENCER', 0),
(78, 'COUNTYIN_ST. JOSEPH', 0),
(79, 'COUNTYIN_STARKE', 0),
(80, 'COUNTYIN_STEUBEN', 0),
(81, 'COUNTYIN_SULLIVAN', 0),
(82, 'COUNTYIN_SWITZERLAND', 0),
(83, 'COUNTYIN_TIPPECANOE', 0),
(84, 'COUNTYIN_TIPTON', 0),
(85, 'COUNTYIN_UNION', 0),
(86, 'COUNTYIN_VANDERBURGH', 0),
(87, 'COUNTYIN_VERMILLION', 0),
(88, 'COUNTYIN_VIGO', 0),
(89, 'COUNTYIN_WABASH', 0),
(90, 'COUNTYIN_WARREN', 0),
(91, 'COUNTYIN_WARRICK', 0),
(92, 'COUNTYIN_WASHINGTON', 0),
(93, 'COUNTYIN_WAYNE', 0),
(94, 'COUNTYIN_WELLS', 0),
(95, 'COUNTYIN_WHITE', 0),
(96, 'COUNTYIN_WHITLEY', 0);

-- --------------------------------------------------------

--
-- Table structure for table `TextCopy`
--

DROP TABLE IF EXISTS `TextCopy`;
CREATE TABLE `TextCopy` (
  `ID` int(10) NOT NULL,
  `Place` varchar(20) NOT NULL,
  `LongDescription` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `TrackingNumbers`
--

DROP TABLE IF EXISTS `TrackingNumbers`;
CREATE TABLE `TrackingNumbers` (
  `ID` int(10) UNSIGNED NOT NULL,
  `OHOrderNumber` varchar(20) NOT NULL COMMENT 'FK to OrderHeader.OrderNumber',
  `ODLineItemID` bigint(12) UNSIGNED NOT NULL COMMENT 'FK to OrderDetail.LineItemID',
  `ShippingMethodID` int(6) UNSIGNED NOT NULL COMMENT 'FK to ShippingMethod.ID',
  `ShippingSpeedID` int(6) UNSIGNED NOT NULL COMMENT 'fk to ShippingSpeed.ID',
  `CraftsmenFedexAcctNumber` varchar(15) DEFAULT NULL COMMENT 'fk to Craftsmen.FedexAcctNumber',
  `CraftsmenUPSAccountNumber` varchar(15) DEFAULT NULL COMMENT 'fk to Craftsmen.UPSAccountNumber',
  `CraftsmenUSPSAccountNumber` varchar(15) DEFAULT NULL COMMENT 'fk to Craftsmen.USPSAccountNumber',
  `TrackingNumber` varchar(30) NOT NULL,
  `ShippedOn` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='List of tracking numbers by order number';

-- --------------------------------------------------------

--
-- Table structure for table `UOM`
--

DROP TABLE IF EXISTS `UOM`;
CREATE TABLE `UOM` (
  `ID` int(10) UNSIGNED NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This will define the different unit of measurements';

--
-- Dumping data for table `UOM`
--

INSERT INTO `UOM` (`ID`, `Name`, `Active`) VALUES
(1, 'EACH', 1),
(2, 'CASE', 1),
(3, 'OZ', 1),
(4, 'INCH', 1),
(5, 'FEET', 1);

-- --------------------------------------------------------

--
-- Table structure for table `UserPermissions`
--

DROP TABLE IF EXISTS `UserPermissions`;
CREATE TABLE `UserPermissions` (
  `ID` int(10) UNSIGNED NOT NULL,
  `Name` varchar(255) NOT NULL,
  `WeightLevel` int(5) UNSIGNED NOT NULL COMMENT 'helps determine what permission level a user should have',
  `Active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
CREATE TABLE `Users` (
  `ID` int(10) UNSIGNED NOT NULL,
  `Username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `PermissionLevel` int(10) UNSIGNED NOT NULL,
  `Active` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Addresses`
--
ALTER TABLE `Addresses`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fkShipStateID` (`ShipToStateID`),
  ADD KEY `fkBillStateID` (`BillToStateID`),
  ADD KEY `fkAddressTypeID` (`AddressTypeID`),
  ADD KEY `fkAddressCustomerID` (`CustomerID`),
  ADD KEY `fkAddressCauseID` (`CauseID`),
  ADD KEY `fkAddressCraftsmenID` (`CraftsmenID`);

--
-- Indexes for table `AddressTypes`
--
ALTER TABLE `AddressTypes`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `Causes`
--
ALTER TABLE `Causes`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fkCauseTypeID` (`CauseTypeID`),
  ADD KEY `fkCauseScheduleID` (`CauseScheduleID`);

--
-- Indexes for table `CauseSchedules`
--
ALTER TABLE `CauseSchedules`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fkCauseID` (`CauseID`),
  ADD KEY `fkCauseApprovedBy` (`ApprovedBy`);

--
-- Indexes for table `CauseTypes`
--
ALTER TABLE `CauseTypes`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `Craftsmen`
--
ALTER TABLE `Craftsmen`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fkCraftsmenBillToID` (`BillToAddressID`),
  ADD KEY `fkCraftsmenShipToID` (`ShipToAddressID`),
  ADD KEY `fkCraftsmenPickUpID` (`PickupLocationID`);

--
-- Indexes for table `Customers`
--
ALTER TABLE `Customers`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fkAddressesBillID` (`BillToAddressID`),
  ADD KEY `fkAddressesShipID` (`ShipToAddressID`);

--
-- Indexes for table `ItemCategories`
--
ALTER TABLE `ItemCategories`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `Items`
--
ALTER TABLE `Items`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fkCat1ID` (`Category1ID`),
  ADD KEY `fkCat2ID` (`Category2ID`),
  ADD KEY `fkCat3ID` (`Category3ID`),
  ADD KEY `fkSubCat11` (`SubCategory11ID`),
  ADD KEY `fkSubCat12` (`SubCategory12ID`),
  ADD KEY `fkSubCat13` (`SubCategory13ID`),
  ADD KEY `fkSubCat21` (`SubCategory21ID`),
  ADD KEY `fkSubCat22` (`SubCategory22ID`),
  ADD KEY `fkSubCat23` (`SubCategory23ID`),
  ADD KEY `fkSubCat31` (`SubCategory31ID`),
  ADD KEY `fkSubCat32` (`SubCategory32ID`),
  ADD KEY `fkSubCat33` (`SubCategory33ID`),
  ADD KEY `fkItemsUOMID` (`UOMID`),
  ADD KEY `fkCraftsmenID` (`CraftsmentID`);

--
-- Indexes for table `ItemSubCategories`
--
ALTER TABLE `ItemSubCategories`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fkItemCategoryID` (`CategoryID`);

--
-- Indexes for table `Notes`
--
ALTER TABLE `Notes`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `OrderDetail`
--
ALTER TABLE `OrderDetail`
  ADD PRIMARY KEY (`LineItemID`),
  ADD KEY `fkOrderDetailOrderNumber` (`OHOrderNumber`),
  ADD KEY `fkOrderCraftsmenID` (`CraftsmenID`),
  ADD KEY `fkOrderItemID` (`ItemID`),
  ADD KEY `fkOrderCauseID` (`CauseID`),
  ADD KEY `fkOrderTrackingNumberID` (`TrackingNumberID`);

--
-- Indexes for table `OrderHeader`
--
ALTER TABLE `OrderHeader`
  ADD PRIMARY KEY (`OrderNumber`),
  ADD KEY `fkOHBillToAddressID` (`BillToAddressID`),
  ADD KEY `fkOHCauseID1` (`CauseID1`),
  ADD KEY `fkOHCauseID2` (`CauseID2`),
  ADD KEY `fkOHCauseID3` (`CauseID3`),
  ADD KEY `fkOHCustomerID` (`CustomerID`),
  ADD KEY `fkOHNotesID` (`NotesID`),
  ADD KEY `fkOHOrderStatusID` (`OrderStatusID`),
  ADD KEY `fkOHPaymentTypeID1` (`PaymentTypeID`),
  ADD KEY `fkOHPaymentTypeID2` (`PaymentTypeID2`),
  ADD KEY `fkOHShipToAddressID` (`ShipToAddressID`);

--
-- Indexes for table `OrderStatus`
--
ALTER TABLE `OrderStatus`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `PaymentType`
--
ALTER TABLE `PaymentType`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ShippingMethod`
--
ALTER TABLE `ShippingMethod`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ShippingSpeed`
--
ALTER TABLE `ShippingSpeed`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fkShippingMethodID` (`ShippingMethodID`);

--
-- Indexes for table `States`
--
ALTER TABLE `States`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `TaxAuthority`
--
ALTER TABLE `TaxAuthority`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fkTaxTypeID` (`TypeID`),
  ADD KEY `fkAuthorityID` (`AuthorityID`);

--
-- Indexes for table `TaxTypes`
--
ALTER TABLE `TaxTypes`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `TextCopy`
--
ALTER TABLE `TextCopy`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `TrackingNumbers`
--
ALTER TABLE `TrackingNumbers`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `trackingFKShippingMethodID` (`ShippingMethodID`);

--
-- Indexes for table `UOM`
--
ALTER TABLE `UOM`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `UserPermissions`
--
ALTER TABLE `UserPermissions`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Addresses`
--
ALTER TABLE `Addresses`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `AddressTypes`
--
ALTER TABLE `AddressTypes`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'FK to Addresses.AddressType', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Causes`
--
ALTER TABLE `Causes`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `CauseSchedules`
--
ALTER TABLE `CauseSchedules`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `CauseTypes`
--
ALTER TABLE `CauseTypes`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Used to link tables', AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `Craftsmen`
--
ALTER TABLE `Craftsmen`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'link tables';

--
-- AUTO_INCREMENT for table `Customers`
--
ALTER TABLE `Customers`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ItemCategories`
--
ALTER TABLE `ItemCategories`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `Items`
--
ALTER TABLE `Items`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ItemSubCategories`
--
ALTER TABLE `ItemSubCategories`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Notes`
--
ALTER TABLE `Notes`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `OrderDetail`
--
ALTER TABLE `OrderDetail`
  MODIFY `LineItemID` bigint(12) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `OrderHeader`
--
ALTER TABLE `OrderHeader`
  MODIFY `OrderNumber` int(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `OrderStatus`
--
ALTER TABLE `OrderStatus`
  MODIFY `ID` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `PaymentType`
--
ALTER TABLE `PaymentType`
  MODIFY `ID` int(6) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ShippingMethod`
--
ALTER TABLE `ShippingMethod`
  MODIFY `ID` int(6) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Used to link Shipping Method to Order', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ShippingSpeed`
--
ALTER TABLE `ShippingSpeed`
  MODIFY `ID` int(6) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Used to link tables', AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `States`
--
ALTER TABLE `States`
  MODIFY `ID` int(2) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'State ID used to link with other tables', AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `TaxAuthority`
--
ALTER TABLE `TaxAuthority`
  MODIFY `ID` int(6) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Used to link tables', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `TaxTypes`
--
ALTER TABLE `TaxTypes`
  MODIFY `ID` int(6) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Used to map to other tables', AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `TextCopy`
--
ALTER TABLE `TextCopy`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `TrackingNumbers`
--
ALTER TABLE `TrackingNumbers`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `UOM`
--
ALTER TABLE `UOM`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `UserPermissions`
--
ALTER TABLE `UserPermissions`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Addresses`
--
ALTER TABLE `Addresses`
  ADD CONSTRAINT `fkAddressCauseID` FOREIGN KEY (`CauseID`) REFERENCES `Causes` (`ID`),
  ADD CONSTRAINT `fkAddressCraftsmenID` FOREIGN KEY (`CraftsmenID`) REFERENCES `Craftsmen` (`ID`),
  ADD CONSTRAINT `fkAddressCustomerID` FOREIGN KEY (`CustomerID`) REFERENCES `Customers` (`ID`),
  ADD CONSTRAINT `fkAddressTypeID` FOREIGN KEY (`AddressTypeID`) REFERENCES `AddressTypes` (`ID`),
  ADD CONSTRAINT `fkBillStateID` FOREIGN KEY (`BillToStateID`) REFERENCES `States` (`ID`),
  ADD CONSTRAINT `fkShipStateID` FOREIGN KEY (`ShipToStateID`) REFERENCES `States` (`ID`);

--
-- Constraints for table `Causes`
--
ALTER TABLE `Causes`
  ADD CONSTRAINT `fkCauseScheduleID` FOREIGN KEY (`CauseScheduleID`) REFERENCES `CauseSchedules` (`ID`),
  ADD CONSTRAINT `fkCauseTypeID` FOREIGN KEY (`CauseTypeID`) REFERENCES `CauseTypes` (`ID`);

--
-- Constraints for table `CauseSchedules`
--
ALTER TABLE `CauseSchedules`
  ADD CONSTRAINT `fkCauseApprovedBy` FOREIGN KEY (`ApprovedBy`) REFERENCES `Users` (`ID`),
  ADD CONSTRAINT `fkCauseID` FOREIGN KEY (`CauseID`) REFERENCES `Causes` (`ID`);

--
-- Constraints for table `Craftsmen`
--
ALTER TABLE `Craftsmen`
  ADD CONSTRAINT `fkCraftsmenBillToID` FOREIGN KEY (`BillToAddressID`) REFERENCES `Addresses` (`ID`),
  ADD CONSTRAINT `fkCraftsmenPickUpID` FOREIGN KEY (`PickupLocationID`) REFERENCES `Addresses` (`ID`),
  ADD CONSTRAINT `fkCraftsmenShipToID` FOREIGN KEY (`ShipToAddressID`) REFERENCES `Addresses` (`ID`);

--
-- Constraints for table `Customers`
--
ALTER TABLE `Customers`
  ADD CONSTRAINT `fkAddressesBillID` FOREIGN KEY (`BillToAddressID`) REFERENCES `Addresses` (`ID`),
  ADD CONSTRAINT `fkAddressesShipID` FOREIGN KEY (`ShipToAddressID`) REFERENCES `Addresses` (`ID`);

--
-- Constraints for table `Items`
--
ALTER TABLE `Items`
  ADD CONSTRAINT `fkCat1ID` FOREIGN KEY (`Category1ID`) REFERENCES `ItemCategories` (`ID`),
  ADD CONSTRAINT `fkCat2ID` FOREIGN KEY (`Category2ID`) REFERENCES `ItemCategories` (`ID`),
  ADD CONSTRAINT `fkCat3ID` FOREIGN KEY (`Category3ID`) REFERENCES `ItemCategories` (`ID`),
  ADD CONSTRAINT `fkCraftsmenID` FOREIGN KEY (`CraftsmentID`) REFERENCES `Craftsmen` (`ID`),
  ADD CONSTRAINT `fkItemCraftsmenID` FOREIGN KEY (`CraftsmentID`) REFERENCES `Craftsmen` (`ID`),
  ADD CONSTRAINT `fkItemsUOMID` FOREIGN KEY (`UOMID`) REFERENCES `UOM` (`ID`),
  ADD CONSTRAINT `fkSubCat11` FOREIGN KEY (`SubCategory11ID`) REFERENCES `ItemSubCategories` (`ID`),
  ADD CONSTRAINT `fkSubCat12` FOREIGN KEY (`SubCategory12ID`) REFERENCES `ItemSubCategories` (`ID`),
  ADD CONSTRAINT `fkSubCat13` FOREIGN KEY (`SubCategory13ID`) REFERENCES `ItemSubCategories` (`ID`),
  ADD CONSTRAINT `fkSubCat21` FOREIGN KEY (`SubCategory21ID`) REFERENCES `ItemSubCategories` (`ID`),
  ADD CONSTRAINT `fkSubCat22` FOREIGN KEY (`SubCategory22ID`) REFERENCES `ItemSubCategories` (`ID`),
  ADD CONSTRAINT `fkSubCat23` FOREIGN KEY (`SubCategory23ID`) REFERENCES `ItemSubCategories` (`ID`),
  ADD CONSTRAINT `fkSubCat31` FOREIGN KEY (`SubCategory31ID`) REFERENCES `ItemSubCategories` (`ID`),
  ADD CONSTRAINT `fkSubCat32` FOREIGN KEY (`SubCategory32ID`) REFERENCES `ItemSubCategories` (`ID`),
  ADD CONSTRAINT `fkSubCat33` FOREIGN KEY (`SubCategory33ID`) REFERENCES `ItemSubCategories` (`ID`);

--
-- Constraints for table `ItemSubCategories`
--
ALTER TABLE `ItemSubCategories`
  ADD CONSTRAINT `fkItemCategoryID` FOREIGN KEY (`CategoryID`) REFERENCES `ItemCategories` (`ID`);

--
-- Constraints for table `OrderDetail`
--
ALTER TABLE `OrderDetail`
  ADD CONSTRAINT `fkOrderCauseID` FOREIGN KEY (`CauseID`) REFERENCES `Causes` (`ID`),
  ADD CONSTRAINT `fkOrderCraftsmenID` FOREIGN KEY (`CraftsmenID`) REFERENCES `Craftsmen` (`ID`),
  ADD CONSTRAINT `fkOrderDetailOrderNumber` FOREIGN KEY (`OHOrderNumber`) REFERENCES `OrderHeader` (`OrderNumber`),
  ADD CONSTRAINT `fkOrderItemID` FOREIGN KEY (`ItemID`) REFERENCES `Items` (`ID`),
  ADD CONSTRAINT `fkOrderTrackingNumberID` FOREIGN KEY (`TrackingNumberID`) REFERENCES `TrackingNumbers` (`ID`);

--
-- Constraints for table `OrderHeader`
--
ALTER TABLE `OrderHeader`
  ADD CONSTRAINT `fkOHBillToAddressID` FOREIGN KEY (`BillToAddressID`) REFERENCES `Addresses` (`ID`),
  ADD CONSTRAINT `fkOHCauseID1` FOREIGN KEY (`CauseID1`) REFERENCES `Causes` (`ID`),
  ADD CONSTRAINT `fkOHCauseID2` FOREIGN KEY (`CauseID2`) REFERENCES `Causes` (`ID`),
  ADD CONSTRAINT `fkOHCauseID3` FOREIGN KEY (`CauseID3`) REFERENCES `Causes` (`ID`),
  ADD CONSTRAINT `fkOHCustomerID` FOREIGN KEY (`CustomerID`) REFERENCES `Customers` (`ID`),
  ADD CONSTRAINT `fkOHNotesID` FOREIGN KEY (`NotesID`) REFERENCES `Notes` (`ID`),
  ADD CONSTRAINT `fkOHOrderStatusID` FOREIGN KEY (`OrderStatusID`) REFERENCES `OrderStatus` (`ID`),
  ADD CONSTRAINT `fkOHPaymentTypeID1` FOREIGN KEY (`PaymentTypeID`) REFERENCES `PaymentType` (`ID`),
  ADD CONSTRAINT `fkOHPaymentTypeID2` FOREIGN KEY (`PaymentTypeID2`) REFERENCES `PaymentType` (`ID`),
  ADD CONSTRAINT `fkOHShipToAddressID` FOREIGN KEY (`ShipToAddressID`) REFERENCES `Addresses` (`ID`);

--
-- Constraints for table `ShippingSpeed`
--
ALTER TABLE `ShippingSpeed`
  ADD CONSTRAINT `fkShippingMethodID` FOREIGN KEY (`ShippingMethodID`) REFERENCES `ShippingMethod` (`ID`);

--
-- Constraints for table `TaxAuthority`
--
ALTER TABLE `TaxAuthority`
  ADD CONSTRAINT `fkAuthorityID` FOREIGN KEY (`AuthorityID`) REFERENCES `States` (`ID`),
  ADD CONSTRAINT `fkTaxTypeID` FOREIGN KEY (`TypeID`) REFERENCES `TaxTypes` (`ID`);

--
-- Constraints for table `TrackingNumbers`
--
ALTER TABLE `TrackingNumbers`
  ADD CONSTRAINT `trackingFKShippingMethodID` FOREIGN KEY (`ShippingMethodID`) REFERENCES `ShippingMethod` (`ID`);
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
