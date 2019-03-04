-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 04, 2019 at 06:44 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `stroth7_gcm`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
CREATE TABLE `addresses` (
  `ID` int(10) UNSIGNED NOT NULL,
  `AddressTypeID` int(10) UNSIGNED NOT NULL COMMENT 'FK To AddressTypes.ID',
  `CustomerID` int(10) UNSIGNED DEFAULT NULL,
  `CraftsmenID` int(10) UNSIGNED DEFAULT NULL,
  `CauseID` int(10) UNSIGNED DEFAULT NULL,
  `FirstName` char(100) NOT NULL,
  `LastName` char(100) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `PhoneNumber` varchar(15) NOT NULL,
  `BillToAddress1` varchar(60) NOT NULL,
  `BillToAddress2` varchar(60) DEFAULT NULL,
  `BillToAddress3` varchar(60) DEFAULT NULL,
  `BillToAddress4` varchar(60) DEFAULT NULL,
  `BillToCity` char(60) NOT NULL,
  `BillToStateID` int(2) UNSIGNED NOT NULL COMMENT 'FK to States.ID',
  `BillToPostal` int(10) NOT NULL,
  `ShipToSameAsBillTo` tinyint(1) NOT NULL DEFAULT '1',
  `ShipToAddress1` varchar(60) DEFAULT NULL,
  `ShipToAddress2` varchar(60) DEFAULT NULL,
  `ShipToAddress3` varchar(60) DEFAULT NULL,
  `ShipToAddress4` varchar(60) DEFAULT NULL,
  `ShipToCity` char(60) DEFAULT NULL,
  `ShipToStateID` int(2) UNSIGNED DEFAULT NULL COMMENT 'FK to States.ID',
  `ShipToPostal` int(10) DEFAULT NULL,
  `DefaultBilling` tinyint(1) DEFAULT NULL,
  `DefaultShipping` tinyint(1) DEFAULT NULL,
  `Active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Addresses for all customers, artisans, etc';

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`ID`, `AddressTypeID`, `CustomerID`, `CraftsmenID`, `CauseID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `BillToAddress1`, `BillToAddress2`, `BillToAddress3`, `BillToAddress4`, `BillToCity`, `BillToStateID`, `BillToPostal`, `ShipToSameAsBillTo`, `ShipToAddress1`, `ShipToAddress2`, `ShipToAddress3`, `ShipToAddress4`, `ShipToCity`, `ShipToStateID`, `ShipToPostal`, `DefaultBilling`, `DefaultShipping`, `Active`) VALUES
(1, 1, NULL, NULL, 1, 'Jeffrey', 'Strother', 'jeff@strotherit.com', '8128962469', '5122 winterberry drive', NULL, NULL, NULL, 'Indianapolis', 14, 46254, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `addresstypes`
--

DROP TABLE IF EXISTS `addresstypes`;
CREATE TABLE `addresstypes` (
  `ID` int(10) UNSIGNED NOT NULL COMMENT 'FK to Addresses.AddressType',
  `Name` varchar(20) NOT NULL,
  `Active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `addresstypes`
--

INSERT INTO `addresstypes` (`ID`, `Name`, `Active`) VALUES
(1, 'BILLING', 1),
(2, 'MAILING', 1),
(3, 'PRODUCT PICK-UP', 1);

-- --------------------------------------------------------

--
-- Table structure for table `causes`
--

DROP TABLE IF EXISTS `causes`;
CREATE TABLE `causes` (
  `ID` int(10) UNSIGNED NOT NULL,
  `CauseName` varchar(60) NOT NULL,
  `CauseTypeID` int(10) UNSIGNED NOT NULL COMMENT 'FK to CauseTypes.ID',
  `OtherType` varchar(50) DEFAULT NULL,
  `ImageURL` varchar(200) NOT NULL,
  `OrganizationPurpose` text NOT NULL,
  `Is501c3` tinyint(1) NOT NULL DEFAULT '0',
  `Active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='List of all available causes/non-profits';

--
-- Dumping data for table `causes`
--

INSERT INTO `causes` (`ID`, `CauseName`, `CauseTypeID`, `OtherType`, `ImageURL`, `OrganizationPurpose`, `Is501c3`, `Active`) VALUES
(1, 'Strother IT Solutions', 6, '', '', 'To buy things', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `causeschedules`
--

DROP TABLE IF EXISTS `causeschedules`;
CREATE TABLE `causeschedules` (
  `ID` int(10) UNSIGNED NOT NULL,
  `CauseID` int(10) UNSIGNED NOT NULL COMMENT 'FK to Causes.ID',
  `StartDate` datetime(6) NOT NULL,
  `EndDate` datetime(6) NOT NULL COMMENT 'If indefinite, then set to ''9999-12-31 23:59.59''',
  `ApprovedBy` int(10) UNSIGNED DEFAULT NULL COMMENT 'FK to Users.ID',
  `ApprovedOn` datetime(6) DEFAULT NULL,
  `Active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Table for scheduling causes';

--
-- Dumping data for table `causeschedules`
--

INSERT INTO `causeschedules` (`ID`, `CauseID`, `StartDate`, `EndDate`, `ApprovedBy`, `ApprovedOn`, `Active`) VALUES
(1, 1, '0000-00-00 00:00:00.000000', '9999-12-31 23:59:59.000000', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `causetypes`
--

DROP TABLE IF EXISTS `causetypes`;
CREATE TABLE `causetypes` (
  `ID` int(10) UNSIGNED NOT NULL COMMENT 'Used to link tables',
  `Name` varchar(80) NOT NULL,
  `ExpireInDays` int(3) NOT NULL DEFAULT '60' COMMENT 'Set default number of days a cause type should run on website. 0 (Zero) means indefinitely',
  `Active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table is for the available types of causes - 501(c)3,';

--
-- Dumping data for table `causetypes`
--

INSERT INTO `causetypes` (`ID`, `Name`, `ExpireInDays`, `Active`) VALUES
(1, 'RELIGIOUS', 60, 1),
(2, 'EDUCATIONAL', 60, 1),
(3, 'SPORTS LEAGUES', 60, 1),
(4, 'SPORTS LEAGUES YOUTH', 60, 1),
(5, 'CIVIC CLUBS', 60, 1),
(6, 'CIVIC CLUBS YOUTH', 60, 1),
(7, 'CONSERVATION', 0, 1),
(8, 'COMMUNITY SERVICE', 0, 1),
(9, 'COMMUNITY OUTREACH', 0, 1),
(10, 'SCIENTIFIC', 0, 1),
(11, 'OTHER', 60, 1);

-- --------------------------------------------------------

--
-- Table structure for table `craftsmen`
--

DROP TABLE IF EXISTS `craftsmen`;
CREATE TABLE `craftsmen` (
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
  `Active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers` (
  `ID` int(10) UNSIGNED NOT NULL,
  `FName` char(100) NOT NULL,
  `LName` char(100) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `PhoneNumber` varchar(15) NOT NULL,
  `IsCommercial` tinyint(1) NOT NULL DEFAULT '0',
  `CompanyName` varchar(100) DEFAULT NULL,
  `BillToAddressID` int(10) UNSIGNED NOT NULL COMMENT 'FK to Addresses.ID where AddressTypeID=1',
  `ShipToAddressID` int(10) UNSIGNED NOT NULL COMMENT 'FK to Addresses.ID where AddressTypeID=2',
  `ReceiveNewsletter` tinyint(1) DEFAULT '1',
  `ReceiveOffers` tinyint(1) DEFAULT '1',
  `StripeCustomerToken` varchar(100) DEFAULT NULL,
  `UserName` varchar(30) NOT NULL,
  `Password` varchar(30) NOT NULL,
  `Active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Basic Info about registered customer';

-- --------------------------------------------------------

--
-- Table structure for table `itemcategories`
--

DROP TABLE IF EXISTS `itemcategories`;
CREATE TABLE `itemcategories` (
  `ID` int(10) UNSIGNED NOT NULL,
  `Name` varchar(255) NOT NULL COMMENT 'Name of Category that will display on Products Page',
  `Description` varchar(255) NOT NULL COMMENT 'Short Description of the Category',
  `Active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `itemcategories`
--

INSERT INTO `itemcategories` (`ID`, `Name`, `Description`, `Active`) VALUES
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
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
CREATE TABLE `items` (
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
-- Table structure for table `itemsubcategories`
--

DROP TABLE IF EXISTS `itemsubcategories`;
CREATE TABLE `itemsubcategories` (
  `ID` int(10) UNSIGNED NOT NULL,
  `CategoryID` int(10) UNSIGNED NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
CREATE TABLE `notes` (
  `ID` int(10) UNSIGNED NOT NULL,
  `OHOrderNumber` varchar(20) NOT NULL COMMENT 'FK to OrderHeader.OrderNumber',
  `Notes` varchar(255) NOT NULL,
  `CreatedDate` datetime(6) DEFAULT NULL,
  `ModifiedDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table displays notes by order number.';

-- --------------------------------------------------------

--
-- Table structure for table `orderdetail`
--

DROP TABLE IF EXISTS `orderdetail`;
CREATE TABLE `orderdetail` (
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
-- Table structure for table `orderheader`
--

DROP TABLE IF EXISTS `orderheader`;
CREATE TABLE `orderheader` (
  `OrderNumber` int(20) UNSIGNED NOT NULL,
  `OrderDate` date DEFAULT NULL,
  `CustomerID` int(10) UNSIGNED NOT NULL,
  `BillToAddressID` int(10) UNSIGNED NOT NULL,
  `ShipToAddressID` int(10) UNSIGNED NOT NULL,
  `PaymentTypeID` int(6) UNSIGNED NOT NULL,
  `StripePaymentAuthNum` varchar(100) NOT NULL,
  `StripeCardLast4` int(4) UNSIGNED NOT NULL,
  `StripeCardExpiration` varchar(10) NOT NULL,
  `IsSplitPayment` tinyint(1) NOT NULL DEFAULT '0',
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
  `HasNote` tinyint(1) NOT NULL DEFAULT '0',
  `NotesID` int(10) UNSIGNED DEFAULT NULL,
  `OrderStatusID` int(6) UNSIGNED NOT NULL,
  `CauseID1` int(10) UNSIGNED NOT NULL,
  `CauseID2` int(10) UNSIGNED DEFAULT NULL,
  `CauseID3` int(10) UNSIGNED DEFAULT NULL,
  `PONumber` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orderstatus`
--

DROP TABLE IF EXISTS `orderstatus`;
CREATE TABLE `orderstatus` (
  `ID` int(6) UNSIGNED NOT NULL,
  `Name` varchar(60) NOT NULL,
  `Active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='List of all available order statuses';

--
-- Dumping data for table `orderstatus`
--

INSERT INTO `orderstatus` (`ID`, `Name`, `Active`) VALUES
(1, 'PAYMENT PENDING', 1),
(2, 'PAYMENT FINALIZED', 1),
(3, 'ORDER CONFIRMED', 1),
(4, 'IN PROCESS', 1),
(5, 'SHIPPING', 1);

-- --------------------------------------------------------

--
-- Table structure for table `paymenttype`
--

DROP TABLE IF EXISTS `paymenttype`;
CREATE TABLE `paymenttype` (
  `ID` int(6) UNSIGNED NOT NULL,
  `PaymentType` varchar(20) NOT NULL,
  `LastUsed` date DEFAULT NULL COMMENT 'Used to see what payment methods are actually used',
  `RequiresName` tinyint(1) DEFAULT '1',
  `RequiresCVC` tinyint(1) DEFAULT '1',
  `RequiresExpiration` tinyint(1) DEFAULT '1',
  `Active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Supplies the list of available payment types';

-- --------------------------------------------------------

--
-- Table structure for table `shippingmethod`
--

DROP TABLE IF EXISTS `shippingmethod`;
CREATE TABLE `shippingmethod` (
  `ID` int(6) UNSIGNED NOT NULL COMMENT 'Used to link Shipping Method to Order',
  `Name` varchar(100) NOT NULL COMMENT 'Descriptive name for shipping method',
  `Active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='WIll be used to populate drop downs for available shipping';

--
-- Dumping data for table `shippingmethod`
--

INSERT INTO `shippingmethod` (`ID`, `Name`, `Active`) VALUES
(1, 'DROP-SHIP', 1),
(2, 'UPS', 1),
(3, 'FEDEX', 1),
(4, 'USPS', 1);

-- --------------------------------------------------------

--
-- Table structure for table `shippingspeed`
--

DROP TABLE IF EXISTS `shippingspeed`;
CREATE TABLE `shippingspeed` (
  `ID` int(6) UNSIGNED NOT NULL COMMENT 'Used to link tables',
  `ShippingMethodID` int(6) UNSIGNED NOT NULL COMMENT 'FK to ShippingMethod.ID',
  `Name` varchar(100) NOT NULL,
  `NumBDays` varchar(10) NOT NULL COMMENT 'Number of Business Days advertised from Shipper',
  `Active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Used to determine speed - 3 day, next day, etc';

--
-- Dumping data for table `shippingspeed`
--

INSERT INTO `shippingspeed` (`ID`, `ShippingMethodID`, `Name`, `NumBDays`, `Active`) VALUES
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
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
CREATE TABLE `states` (
  `ID` int(2) UNSIGNED NOT NULL COMMENT 'State ID used to link with other tables',
  `Name` char(14) NOT NULL COMMENT 'Full name of State',
  `Abbreviation` char(2) NOT NULL COMMENT '2 Character Abbreviation',
  `Active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='States table will provide lookup and validation';

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`ID`, `Name`, `Abbreviation`, `Active`) VALUES
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
-- Table structure for table `taxauthority`
--

DROP TABLE IF EXISTS `taxauthority`;
CREATE TABLE `taxauthority` (
  `ID` int(6) UNSIGNED NOT NULL COMMENT 'Used to link tables',
  `TypeID` int(6) UNSIGNED NOT NULL COMMENT 'FK to TaxType. Matches TaxType.ID',
  `AuthorityID` int(2) UNSIGNED NOT NULL COMMENT 'FK to States. Matches States.ID',
  `AmountPercent` decimal(13,2) DEFAULT NULL COMMENT 'Could be null if a state charges a flat dollar amount',
  `AmountDollar` decimal(13,4) DEFAULT NULL COMMENT 'Could be null if a state charges only a percentage',
  `Active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Used to determine what state tax needs to be reported in';

--
-- Dumping data for table `taxauthority`
--

INSERT INTO `taxauthority` (`ID`, `TypeID`, `AuthorityID`, `AmountPercent`, `AmountDollar`, `Active`) VALUES
(1, 1, 14, '0.00', '0.0000', 0),
(2, 2, 14, '0.00', '0.0000', 0),
(3, 3, 14, '7.00', '0.0000', 1),
(4, 33, 14, '1.00', '0.0000', 1),
(5, 53, 14, '2.02', '0.0000', 1);

-- --------------------------------------------------------

--
-- Table structure for table `taxtypes`
--

DROP TABLE IF EXISTS `taxtypes`;
CREATE TABLE `taxtypes` (
  `ID` int(6) UNSIGNED NOT NULL COMMENT 'Used to map to other tables',
  `Name` varchar(50) NOT NULL COMMENT 'Descriptive name of the tax',
  `Active` tinyint(1) DEFAULT '1' COMMENT 'Define whether the tax row is active or not'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table will link to the Tax Authorities Table';

--
-- Dumping data for table `taxtypes`
--

INSERT INTO `taxtypes` (`ID`, `Name`, `Active`) VALUES
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
-- Table structure for table `textcopy`
--

DROP TABLE IF EXISTS `textcopy`;
CREATE TABLE `textcopy` (
  `ID` int(10) NOT NULL,
  `Place` varchar(20) NOT NULL,
  `LongDescription` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `trackingnumbers`
--

DROP TABLE IF EXISTS `trackingnumbers`;
CREATE TABLE `trackingnumbers` (
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
-- Table structure for table `uom`
--

DROP TABLE IF EXISTS `uom`;
CREATE TABLE `uom` (
  `ID` int(10) UNSIGNED NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This will define the different unit of measurements';

--
-- Dumping data for table `uom`
--

INSERT INTO `uom` (`ID`, `Name`, `Active`) VALUES
(1, 'EACH', 1),
(2, 'CASE', 1),
(3, 'OZ', 1),
(4, 'INCH', 1),
(5, 'FEET', 1);

-- --------------------------------------------------------

--
-- Table structure for table `userpermissions`
--

DROP TABLE IF EXISTS `userpermissions`;
CREATE TABLE `userpermissions` (
  `ID` int(10) UNSIGNED NOT NULL,
  `Name` varchar(255) NOT NULL,
  `WeightLevel` int(5) UNSIGNED NOT NULL COMMENT 'helps determine what permission level a user should have',
  `Active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
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
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fkShipStateID` (`ShipToStateID`),
  ADD KEY `fkBillStateID` (`BillToStateID`),
  ADD KEY `fkAddressTypeID` (`AddressTypeID`),
  ADD KEY `fkAddressCustomerID` (`CustomerID`),
  ADD KEY `fkAddressCauseID` (`CauseID`),
  ADD KEY `fkAddressCraftsmenID` (`CraftsmenID`);

--
-- Indexes for table `addresstypes`
--
ALTER TABLE `addresstypes`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `causes`
--
ALTER TABLE `causes`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fkCauseTypeID` (`CauseTypeID`);

--
-- Indexes for table `causeschedules`
--
ALTER TABLE `causeschedules`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fkCauseID` (`CauseID`),
  ADD KEY `fkCauseApprovedBy` (`ApprovedBy`);

--
-- Indexes for table `causetypes`
--
ALTER TABLE `causetypes`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `craftsmen`
--
ALTER TABLE `craftsmen`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fkCraftsmenBillToID` (`BillToAddressID`),
  ADD KEY `fkCraftsmenShipToID` (`ShipToAddressID`),
  ADD KEY `fkCraftsmenPickUpID` (`PickupLocationID`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fkAddressesBillID` (`BillToAddressID`),
  ADD KEY `fkAddressesShipID` (`ShipToAddressID`);

--
-- Indexes for table `itemcategories`
--
ALTER TABLE `itemcategories`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
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
-- Indexes for table `itemsubcategories`
--
ALTER TABLE `itemsubcategories`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fkItemCategoryID` (`CategoryID`);

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD PRIMARY KEY (`LineItemID`),
  ADD KEY `fkOrderDetailOrderNumber` (`OHOrderNumber`),
  ADD KEY `fkOrderCraftsmenID` (`CraftsmenID`),
  ADD KEY `fkOrderItemID` (`ItemID`),
  ADD KEY `fkOrderCauseID` (`CauseID`),
  ADD KEY `fkOrderTrackingNumberID` (`TrackingNumberID`);

--
-- Indexes for table `orderheader`
--
ALTER TABLE `orderheader`
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
-- Indexes for table `orderstatus`
--
ALTER TABLE `orderstatus`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `paymenttype`
--
ALTER TABLE `paymenttype`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `shippingmethod`
--
ALTER TABLE `shippingmethod`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `shippingspeed`
--
ALTER TABLE `shippingspeed`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fkShippingMethodID` (`ShippingMethodID`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `taxauthority`
--
ALTER TABLE `taxauthority`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fkTaxTypeID` (`TypeID`),
  ADD KEY `fkAuthorityID` (`AuthorityID`);

--
-- Indexes for table `taxtypes`
--
ALTER TABLE `taxtypes`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `textcopy`
--
ALTER TABLE `textcopy`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `trackingnumbers`
--
ALTER TABLE `trackingnumbers`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `trackingFKShippingMethodID` (`ShippingMethodID`);

--
-- Indexes for table `uom`
--
ALTER TABLE `uom`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `userpermissions`
--
ALTER TABLE `userpermissions`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `addresstypes`
--
ALTER TABLE `addresstypes`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'FK to Addresses.AddressType', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `causes`
--
ALTER TABLE `causes`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `causeschedules`
--
ALTER TABLE `causeschedules`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `causetypes`
--
ALTER TABLE `causetypes`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Used to link tables', AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `craftsmen`
--
ALTER TABLE `craftsmen`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'link tables';

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `itemcategories`
--
ALTER TABLE `itemcategories`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `itemsubcategories`
--
ALTER TABLE `itemsubcategories`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orderdetail`
--
ALTER TABLE `orderdetail`
  MODIFY `LineItemID` bigint(12) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orderheader`
--
ALTER TABLE `orderheader`
  MODIFY `OrderNumber` int(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orderstatus`
--
ALTER TABLE `orderstatus`
  MODIFY `ID` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `paymenttype`
--
ALTER TABLE `paymenttype`
  MODIFY `ID` int(6) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shippingmethod`
--
ALTER TABLE `shippingmethod`
  MODIFY `ID` int(6) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Used to link Shipping Method to Order', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `shippingspeed`
--
ALTER TABLE `shippingspeed`
  MODIFY `ID` int(6) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Used to link tables', AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `ID` int(2) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'State ID used to link with other tables', AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `taxauthority`
--
ALTER TABLE `taxauthority`
  MODIFY `ID` int(6) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Used to link tables', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `taxtypes`
--
ALTER TABLE `taxtypes`
  MODIFY `ID` int(6) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Used to map to other tables', AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `textcopy`
--
ALTER TABLE `textcopy`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trackingnumbers`
--
ALTER TABLE `trackingnumbers`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `uom`
--
ALTER TABLE `uom`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `userpermissions`
--
ALTER TABLE `userpermissions`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `fkAddressCauseID` FOREIGN KEY (`CauseID`) REFERENCES `causes` (`ID`),
  ADD CONSTRAINT `fkAddressCraftsmenID` FOREIGN KEY (`CraftsmenID`) REFERENCES `craftsmen` (`ID`),
  ADD CONSTRAINT `fkAddressCustomerID` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`ID`),
  ADD CONSTRAINT `fkAddressTypeID` FOREIGN KEY (`AddressTypeID`) REFERENCES `addresstypes` (`ID`),
  ADD CONSTRAINT `fkBillStateID` FOREIGN KEY (`BillToStateID`) REFERENCES `states` (`ID`),
  ADD CONSTRAINT `fkShipStateID` FOREIGN KEY (`ShipToStateID`) REFERENCES `states` (`ID`);

--
-- Constraints for table `causes`
--
ALTER TABLE `causes`
  ADD CONSTRAINT `fkCauseTypeID` FOREIGN KEY (`CauseTypeID`) REFERENCES `causetypes` (`ID`);

--
-- Constraints for table `causeschedules`
--
ALTER TABLE `causeschedules`
  ADD CONSTRAINT `fkCauseApprovedBy` FOREIGN KEY (`ApprovedBy`) REFERENCES `users` (`ID`),
  ADD CONSTRAINT `fkCauseID` FOREIGN KEY (`CauseID`) REFERENCES `causes` (`ID`);

--
-- Constraints for table `craftsmen`
--
ALTER TABLE `craftsmen`
  ADD CONSTRAINT `fkCraftsmenBillToID` FOREIGN KEY (`BillToAddressID`) REFERENCES `addresses` (`ID`),
  ADD CONSTRAINT `fkCraftsmenPickUpID` FOREIGN KEY (`PickupLocationID`) REFERENCES `addresses` (`ID`),
  ADD CONSTRAINT `fkCraftsmenShipToID` FOREIGN KEY (`ShipToAddressID`) REFERENCES `addresses` (`ID`);

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `fkAddressesBillID` FOREIGN KEY (`BillToAddressID`) REFERENCES `addresses` (`ID`),
  ADD CONSTRAINT `fkAddressesShipID` FOREIGN KEY (`ShipToAddressID`) REFERENCES `addresses` (`ID`);

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `fkCat1ID` FOREIGN KEY (`Category1ID`) REFERENCES `itemcategories` (`ID`),
  ADD CONSTRAINT `fkCat2ID` FOREIGN KEY (`Category2ID`) REFERENCES `itemcategories` (`ID`),
  ADD CONSTRAINT `fkCat3ID` FOREIGN KEY (`Category3ID`) REFERENCES `itemcategories` (`ID`),
  ADD CONSTRAINT `fkCraftsmenID` FOREIGN KEY (`CraftsmentID`) REFERENCES `craftsmen` (`ID`),
  ADD CONSTRAINT `fkItemCraftsmenID` FOREIGN KEY (`CraftsmentID`) REFERENCES `craftsmen` (`ID`),
  ADD CONSTRAINT `fkItemsUOMID` FOREIGN KEY (`UOMID`) REFERENCES `uom` (`ID`),
  ADD CONSTRAINT `fkSubCat11` FOREIGN KEY (`SubCategory11ID`) REFERENCES `itemsubcategories` (`ID`),
  ADD CONSTRAINT `fkSubCat12` FOREIGN KEY (`SubCategory12ID`) REFERENCES `itemsubcategories` (`ID`),
  ADD CONSTRAINT `fkSubCat13` FOREIGN KEY (`SubCategory13ID`) REFERENCES `itemsubcategories` (`ID`),
  ADD CONSTRAINT `fkSubCat21` FOREIGN KEY (`SubCategory21ID`) REFERENCES `itemsubcategories` (`ID`),
  ADD CONSTRAINT `fkSubCat22` FOREIGN KEY (`SubCategory22ID`) REFERENCES `itemsubcategories` (`ID`),
  ADD CONSTRAINT `fkSubCat23` FOREIGN KEY (`SubCategory23ID`) REFERENCES `itemsubcategories` (`ID`),
  ADD CONSTRAINT `fkSubCat31` FOREIGN KEY (`SubCategory31ID`) REFERENCES `itemsubcategories` (`ID`),
  ADD CONSTRAINT `fkSubCat32` FOREIGN KEY (`SubCategory32ID`) REFERENCES `itemsubcategories` (`ID`),
  ADD CONSTRAINT `fkSubCat33` FOREIGN KEY (`SubCategory33ID`) REFERENCES `itemsubcategories` (`ID`);

--
-- Constraints for table `itemsubcategories`
--
ALTER TABLE `itemsubcategories`
  ADD CONSTRAINT `fkItemCategoryID` FOREIGN KEY (`CategoryID`) REFERENCES `itemcategories` (`ID`);

--
-- Constraints for table `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD CONSTRAINT `fkOrderCauseID` FOREIGN KEY (`CauseID`) REFERENCES `causes` (`ID`),
  ADD CONSTRAINT `fkOrderCraftsmenID` FOREIGN KEY (`CraftsmenID`) REFERENCES `craftsmen` (`ID`),
  ADD CONSTRAINT `fkOrderDetailOrderNumber` FOREIGN KEY (`OHOrderNumber`) REFERENCES `orderheader` (`OrderNumber`),
  ADD CONSTRAINT `fkOrderItemID` FOREIGN KEY (`ItemID`) REFERENCES `items` (`ID`),
  ADD CONSTRAINT `fkOrderTrackingNumberID` FOREIGN KEY (`TrackingNumberID`) REFERENCES `trackingnumbers` (`ID`);

--
-- Constraints for table `orderheader`
--
ALTER TABLE `orderheader`
  ADD CONSTRAINT `fkOHBillToAddressID` FOREIGN KEY (`BillToAddressID`) REFERENCES `addresses` (`ID`),
  ADD CONSTRAINT `fkOHCauseID1` FOREIGN KEY (`CauseID1`) REFERENCES `causes` (`ID`),
  ADD CONSTRAINT `fkOHCauseID2` FOREIGN KEY (`CauseID2`) REFERENCES `causes` (`ID`),
  ADD CONSTRAINT `fkOHCauseID3` FOREIGN KEY (`CauseID3`) REFERENCES `causes` (`ID`),
  ADD CONSTRAINT `fkOHCustomerID` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`ID`),
  ADD CONSTRAINT `fkOHNotesID` FOREIGN KEY (`NotesID`) REFERENCES `notes` (`ID`),
  ADD CONSTRAINT `fkOHOrderStatusID` FOREIGN KEY (`OrderStatusID`) REFERENCES `orderstatus` (`ID`),
  ADD CONSTRAINT `fkOHPaymentTypeID1` FOREIGN KEY (`PaymentTypeID`) REFERENCES `paymenttype` (`ID`),
  ADD CONSTRAINT `fkOHPaymentTypeID2` FOREIGN KEY (`PaymentTypeID2`) REFERENCES `paymenttype` (`ID`),
  ADD CONSTRAINT `fkOHShipToAddressID` FOREIGN KEY (`ShipToAddressID`) REFERENCES `addresses` (`ID`);

--
-- Constraints for table `shippingspeed`
--
ALTER TABLE `shippingspeed`
  ADD CONSTRAINT `fkShippingMethodID` FOREIGN KEY (`ShippingMethodID`) REFERENCES `shippingmethod` (`ID`);

--
-- Constraints for table `taxauthority`
--
ALTER TABLE `taxauthority`
  ADD CONSTRAINT `fkAuthorityID` FOREIGN KEY (`AuthorityID`) REFERENCES `states` (`ID`),
  ADD CONSTRAINT `fkTaxTypeID` FOREIGN KEY (`TypeID`) REFERENCES `taxtypes` (`ID`);

--
-- Constraints for table `trackingnumbers`
--
ALTER TABLE `trackingnumbers`
  ADD CONSTRAINT `trackingFKShippingMethodID` FOREIGN KEY (`ShippingMethodID`) REFERENCES `shippingmethod` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
