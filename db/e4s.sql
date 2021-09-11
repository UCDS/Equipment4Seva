-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 11, 2021 at 09:47 AM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e4s`
--

-- --------------------------------------------------------

--
-- Table structure for table `caller_institution`
--

DROP TABLE IF EXISTS `caller_institution`;
CREATE TABLE IF NOT EXISTS `caller_institution` (
  `caller_institution_id` int(11) NOT NULL AUTO_INCREMENT,
  `caller_institution` varchar(100) NOT NULL,
  PRIMARY KEY (`caller_institution_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `captcha`
--

DROP TABLE IF EXISTS `captcha`;
CREATE TABLE IF NOT EXISTS `captcha` (
  `captcha_id` bigint(13) UNSIGNED NOT NULL AUTO_INCREMENT,
  `captcha_time` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `word` varchar(20) NOT NULL,
  PRIMARY KEY (`captcha_id`),
  KEY `word` (`word`)
) ENGINE=MyISAM AUTO_INCREMENT=571 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `captcha`
--

INSERT INTO `captcha` (`captcha_id`, `captcha_time`, `ip_address`, `word`) VALUES
(569, 1631344320, '122.175.8.43', '9FRMg'),
(570, 1631344410, '122.175.8.43', 'QwDhs');

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

DROP TABLE IF EXISTS `ci_sessions`;
CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data` blob NOT NULL,
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `equipment`
--

DROP TABLE IF EXISTS `equipment`;
CREATE TABLE IF NOT EXISTS `equipment` (
  `equipment_id` int(6) NOT NULL AUTO_INCREMENT,
  `equipment_type_id` int(3) DEFAULT NULL,
  `equipment_procurement_type_id` int(11) DEFAULT NULL,
  `manufacturer_id` int(11) DEFAULT NULL,
  `eq_name` varchar(100) DEFAULT NULL,
  `model` varchar(20) DEFAULT NULL,
  `serial_number` varchar(100) DEFAULT NULL,
  `mac_address` varchar(100) DEFAULT NULL,
  `asset_number` varchar(100) DEFAULT NULL,
  `donor_id` int(11) DEFAULT NULL,
  `procured_by_id` int(11) DEFAULT NULL COMMENT 'Owner, map to vendor_id',
  `purchase_order_date` date DEFAULT NULL,
  `cost` int(9) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL COMMENT 'Map to vendor',
  `invoice_number` varchar(50) DEFAULT NULL,
  `invoice_date` date DEFAULT NULL,
  `supply_date` date DEFAULT NULL,
  `installation_date` date DEFAULT NULL,
  `warranty_start_date` date DEFAULT NULL,
  `warranty_end_date` date DEFAULT NULL,
  `functional_status_id` tinyint(1) DEFAULT 1,
  `procurement_status_id` tinyint(1) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_datetime` datetime DEFAULT NULL,
  `updated_datetime` datetime DEFAULT NULL,
  `journal_type_id` int(11) NOT NULL,
  `journal_number` varchar(50) NOT NULL,
  `journal_date` date NOT NULL,
  PRIMARY KEY (`equipment_id`),
  KEY `equipment_procurement_type_id` (`equipment_procurement_type_id`),
  KEY `invoice_number` (`invoice_number`),
  KEY `donor_id` (`donor_id`)
) ENGINE=MyISAM AUTO_INCREMENT=390 DEFAULT CHARSET=latin1 COMMENT='List of equipments in hospital';

--
-- Dumping data for table `equipment`
--

INSERT INTO `equipment` (`equipment_id`, `equipment_type_id`, `equipment_procurement_type_id`, `manufacturer_id`, `eq_name`, `model`, `serial_number`, `mac_address`, `asset_number`, `donor_id`, `procured_by_id`, `purchase_order_date`, `cost`, `supplier_id`, `invoice_number`, `invoice_date`, `supply_date`, `installation_date`, `warranty_start_date`, `warranty_end_date`, `functional_status_id`, `procurement_status_id`, `created_by`, `updated_by`, `created_datetime`, `updated_datetime`, `journal_type_id`, `journal_number`, `journal_date`) VALUES
(45, 5, 0, 0, 'Dental Stool', '0', '0', '0', '0', 0, 0, '0000-00-00', 5310, 2, '1191', '2020-01-20', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 7, 6, NULL, NULL, NULL, NULL, 0, '', '0000-00-00'),
(46, 4, 0, 0, 'Portable Dental Chair', '0', '0', '0', '0', 0, 3, '0000-00-00', 26880, 2, '1191', '2020-01-20', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 7, 6, NULL, NULL, NULL, NULL, 2, '', '2020-01-21'),
(47, 4, 0, 0, 'Motorised Suction Unit', '0', '0', '0', '0', 0, 3, '0000-00-00', 19000, 2, '1202', '2020-01-22', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 7, 6, NULL, NULL, NULL, NULL, 0, '', '0000-00-00'),
(48, 4, 0, 0, 'Fowler Bed(Patient Bed)', '0', '0', '0', '0', 4, 3, '0000-00-00', 19824, 1, '99', '2020-01-21', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 7, 0, NULL, NULL, NULL, NULL, 0, '', '0000-00-00'),
(49, 4, 0, 0, 'Fowler Bed(Patient Bed)', '0', '0', '0', '0', 4, 0, '0000-00-00', 19824, 1, '99', '2020-01-21', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 7, 0, NULL, NULL, NULL, NULL, 0, '', '0000-00-00'),
(50, 6, 0, 0, 'CPU Components', '0', '0', '0', '0', 6, 3, '0000-00-00', 14000, 5, '18999', '2020-01-24', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 7, 6, NULL, NULL, NULL, NULL, 0, '', '0000-00-00'),
(51, 5, 0, 0, 'Wheel Chair', '809(Basic)F.C', '0', '0', '0', 6, 3, '0000-00-00', 3800, 5, 'J36756', '2019-12-30', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 7, 0, NULL, NULL, NULL, NULL, 0, '', '0000-00-00'),
(52, 7, 0, 0, ' UPS APC 1.5AV', ' 0', ' 0', ' 0', ' 0', 0, 3, '0000-00-00', 14750, 5, '19506', '2020-02-01', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 7, 6, NULL, NULL, NULL, NULL, 0, '', '0000-00-00'),
(53, 4, 0, 0, 'N Class Autoclave', '0', '0', '0', '0', 0, 3, '0000-00-00', 32360, 3, '188', '2020-01-31', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 7, 6, NULL, NULL, NULL, NULL, 0, '', '0000-00-00'),
(54, 4, 0, 0, 'Dental Portable Mobile Trolley', '0', '0', '0', '0', 0, 3, '0000-00-00', 44800, 2, '1199', '2020-01-21', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 7, 6, NULL, NULL, NULL, NULL, 0, '', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `equipment_accessory`
--

DROP TABLE IF EXISTS `equipment_accessory`;
CREATE TABLE IF NOT EXISTS `equipment_accessory` (
  `equipment_accessory_id` int(11) NOT NULL AUTO_INCREMENT,
  `equipment_id` int(11) NOT NULL,
  `accessory_name` varchar(50) NOT NULL,
  PRIMARY KEY (`equipment_accessory_id`),
  KEY `equipment_id` (`equipment_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `equipment_functional_status`
--

DROP TABLE IF EXISTS `equipment_functional_status`;
CREATE TABLE IF NOT EXISTS `equipment_functional_status` (
  `functional_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `working_status` varchar(300) NOT NULL,
  PRIMARY KEY (`functional_status_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `equipment_functional_status`
--

INSERT INTO `equipment_functional_status` (`functional_status_id`, `working_status`) VALUES
(7, 'Working'),
(8, 'Not Known'),
(9, 'Not Working');

-- --------------------------------------------------------

--
-- Table structure for table `equipment_location_log`
--

DROP TABLE IF EXISTS `equipment_location_log`;
CREATE TABLE IF NOT EXISTS `equipment_location_log` (
  `equipment_location_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `equipment_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `place_id` int(11) NOT NULL,
  `address` varchar(300) NOT NULL,
  `delivery_date` date NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_datetime` datetime NOT NULL,
  `updated_datetime` datetime NOT NULL,
  PRIMARY KEY (`equipment_location_log_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `equipment_location_log`
--

INSERT INTO `equipment_location_log` (`equipment_location_log_id`, `equipment_id`, `vendor_id`, `place_id`, `address`, `delivery_date`, `created_by`, `updated_by`, `created_datetime`, `updated_datetime`) VALUES
(1, 46, 3, 1, '', '2020-01-23', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 47, 3, 1, '', '0000-00-00', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 57, 3, 1, '', '2020-12-31', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 0, 3, 2, 'UC Office, Punjagutta', '2020-02-19', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 57, 3, 2, 'UC Office, Punjagutta', '2020-02-19', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `equipment_maintenance_contract`
--

DROP TABLE IF EXISTS `equipment_maintenance_contract`;
CREATE TABLE IF NOT EXISTS `equipment_maintenance_contract` (
  `amc_cmc_id` int(6) NOT NULL,
  `type` tinyint(1) NOT NULL,
  `equipment_id` int(6) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `rate` varchar(10) NOT NULL,
  `cost` int(11) NOT NULL,
  `vendor_id` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Maintenance contracts for equipments';

-- --------------------------------------------------------

--
-- Table structure for table `equipment_procurement_status`
--

DROP TABLE IF EXISTS `equipment_procurement_status`;
CREATE TABLE IF NOT EXISTS `equipment_procurement_status` (
  `equipment_procurement_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `procurement_status` varchar(30) NOT NULL,
  PRIMARY KEY (`equipment_procurement_status_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `equipment_procurement_status`
--

INSERT INTO `equipment_procurement_status` (`equipment_procurement_status_id`, `procurement_status`) VALUES
(4, 'Ordered'),
(5, 'Delivered'),
(6, 'Installed');

-- --------------------------------------------------------

--
-- Table structure for table `equipment_procurement_type`
--

DROP TABLE IF EXISTS `equipment_procurement_type`;
CREATE TABLE IF NOT EXISTS `equipment_procurement_type` (
  `equipment_procurement_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `procurment_type` varchar(50) NOT NULL,
  PRIMARY KEY (`equipment_procurement_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `equipment_service_issue_type`
--

DROP TABLE IF EXISTS `equipment_service_issue_type`;
CREATE TABLE IF NOT EXISTS `equipment_service_issue_type` (
  `equipment_service_issue_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `equipment_service_issue_type` varchar(70) NOT NULL,
  PRIMARY KEY (`equipment_service_issue_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `equipment_service_record`
--

DROP TABLE IF EXISTS `equipment_service_record`;
CREATE TABLE IF NOT EXISTS `equipment_service_record` (
  `request_id` int(6) NOT NULL AUTO_INCREMENT,
  `equipment_id` int(6) NOT NULL,
  `user_id` int(8) NOT NULL,
  `call_date` date DEFAULT NULL,
  `call_time` time DEFAULT NULL,
  `call_type` varchar(20) NOT NULL COMMENT 'Hardcoded, online, call, inperson',
  `service_issue_type_id` int(11) NOT NULL,
  `call_information` varchar(500) DEFAULT NULL,
  `caller_institution_id` int(10) NOT NULL,
  `contact_person` varchar(70) NOT NULL,
  `service_provider_id` varchar(50) DEFAULT NULL COMMENT 'vendor_id',
  `service_person` varchar(50) DEFAULT NULL,
  `service_person_phone` varchar(12) NOT NULL,
  `contact_person_phone` varchar(12) NOT NULL,
  `service_person_remarks` varchar(500) DEFAULT NULL,
  `issue_closure` datetime DEFAULT NULL,
  `functional_status_id` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`request_id`),
  UNIQUE KEY `request_id` (`request_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Service records log for equipments';

--
-- Dumping data for table `equipment_service_record`
--

INSERT INTO `equipment_service_record` (`request_id`, `equipment_id`, `user_id`, `call_date`, `call_time`, `call_type`, `service_issue_type_id`, `call_information`, `caller_institution_id`, `contact_person`, `service_provider_id`, `service_person`, `service_person_phone`, `contact_person_phone`, `service_person_remarks`, `issue_closure`, `functional_status_id`) VALUES
(1, 46, 0, '0000-00-00', '00:00:00', '0', 0, '0', 0, '0', '', '0', '0', '0', ' ', '0000-00-00 00:00:00', 0),
(2, 171, 0, '0000-00-00', '00:00:00', '0', 0, '0', 0, '0', '', '0', '0', '0', ' ', '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `equipment_service_record_log`
--

DROP TABLE IF EXISTS `equipment_service_record_log`;
CREATE TABLE IF NOT EXISTS `equipment_service_record_log` (
  `service_record_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `request_id` int(11) NOT NULL,
  `status_note` varchar(500) NOT NULL,
  `created_on` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  PRIMARY KEY (`service_record_log_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `equipment_type`
--

DROP TABLE IF EXISTS `equipment_type`;
CREATE TABLE IF NOT EXISTS `equipment_type` (
  `equipment_type_id` int(3) NOT NULL AUTO_INCREMENT,
  `equipment_type` varchar(200) NOT NULL,
  PRIMARY KEY (`equipment_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COMMENT='List of equipment types';

--
-- Dumping data for table `equipment_type`
--

INSERT INTO `equipment_type` (`equipment_type_id`, `equipment_type`) VALUES
(4, 'Biomedical'),
(5, 'Furniture'),
(6, 'Computers'),
(7, 'Electrical and Electronical'),
(8, 'Peripherals');

-- --------------------------------------------------------

--
-- Table structure for table `journal_type`
--

DROP TABLE IF EXISTS `journal_type`;
CREATE TABLE IF NOT EXISTS `journal_type` (
  `journal_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `journal_type` varchar(30) NOT NULL,
  PRIMARY KEY (`journal_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `journal_type`
--

INSERT INTO `journal_type` (`journal_type_id`, `journal_type`) VALUES
(1, 'A'),
(2, 'B'),
(3, 'C'),
(4, 'D');

-- --------------------------------------------------------

--
-- Table structure for table `operator`
--

DROP TABLE IF EXISTS `operator`;
CREATE TABLE IF NOT EXISTS `operator` (
  `operator_id` int(11) NOT NULL AUTO_INCREMENT,
  `operator_name` varchar(40) NOT NULL,
  `operator_brief` varchar(100) NOT NULL,
  `inserted_on` date NOT NULL,
  `updated_on` date NOT NULL,
  PRIMARY KEY (`operator_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `place`
--

DROP TABLE IF EXISTS `place`;
CREATE TABLE IF NOT EXISTS `place` (
  `place_id` int(11) NOT NULL AUTO_INCREMENT,
  `place` varchar(250) NOT NULL,
  PRIMARY KEY (`place_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `place`
--

INSERT INTO `place` (`place_id`, `place`) VALUES
(1, 'Puttaparthi'),
(2, 'Hyderabad');

-- --------------------------------------------------------

--
-- Table structure for table `setting_query_filter`
--

DROP TABLE IF EXISTS `setting_query_filter`;
CREATE TABLE IF NOT EXISTS `setting_query_filter` (
  `setting_query_filter_id` int(11) NOT NULL AUTO_INCREMENT,
  `query_filter_name` varchar(30) NOT NULL,
  PRIMARY KEY (`setting_query_filter_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `setting_query_filter`
--

INSERT INTO `setting_query_filter` (`setting_query_filter_id`, `query_filter_name`) VALUES
(1, 'welcome_page');

-- --------------------------------------------------------

--
-- Table structure for table `setting_query_filter_field`
--

DROP TABLE IF EXISTS `setting_query_filter_field`;
CREATE TABLE IF NOT EXISTS `setting_query_filter_field` (
  `setting_query_filter_field_id` int(11) NOT NULL AUTO_INCREMENT,
  `setting_query_filter_id` int(11) NOT NULL,
  `table_name` varchar(50) NOT NULL,
  `master_table_name` varchar(50) NOT NULL,
  `field_name` varchar(50) NOT NULL,
  `master_field_name` varchar(50) NOT NULL,
  `master_label_field` varchar(50) NOT NULL,
  `label` varchar(30) NOT NULL,
  `default_filter` varchar(3) NOT NULL COMMENT 'yes',
  `filter_type` varchar(50) NOT NULL,
  PRIMARY KEY (`setting_query_filter_field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `setting_query_filter_field`
--

INSERT INTO `setting_query_filter_field` (`setting_query_filter_field_id`, `setting_query_filter_id`, `table_name`, `master_table_name`, `field_name`, `master_field_name`, `master_label_field`, `label`, `default_filter`, `filter_type`) VALUES
(1, 1, 'equipment', 'equipment_type', 'equipment_type_id', 'equipment_type_id', 'equipment_type', 'Equipment Type', 'yes', 'group'),
(2, 1, 'equipment', 'equipment_procurement_type', 'equipment_procurement_type_id', 'equipment_procurement_type_id', 'procurment_type', 'Procurement Type', '', 'group'),
(3, 1, 'equipment', 'vendor', 'manufacturer_id', 'vendor_id', 'vendor_name', 'Manufacturer', '', 'group'),
(4, 1, 'equipment', 'vendor', 'donor_id', 'vendor_id', 'vendor_name', 'Donor', '', 'group'),
(5, 1, 'equipment', 'vendor', 'procured_by_id', 'vendor_id', 'vendor_name', 'Procured By', '', 'group'),
(6, 1, 'equipment', 'vendor', 'supplier_id', 'vendor_id', 'vendor_name', 'Supplier', '', 'group'),
(7, 1, 'equipment', 'equipment_functional_status', 'functional_status_id', 'working_status', 'working_status', 'Functional Status', '', 'group'),
(8, 1, 'equipment', 'equipment_procurement_status', 'procurement_status_id', 'equipment_procurement_status_id', 'procurement_status', 'Procurement Status', '', 'group'),
(9, 1, 'equipment', 'journal_type', 'journal_type_id', 'journal_type_id', 'journal_type', 'Journal Type', '', 'group');

-- --------------------------------------------------------

--
-- Table structure for table `user_detail`
--

DROP TABLE IF EXISTS `user_detail`;
CREATE TABLE IF NOT EXISTS `user_detail` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(40) NOT NULL,
  `last_name` varchar(40) NOT NULL,
  `user_name` varchar(40) NOT NULL,
  `password` varchar(150) NOT NULL,
  `inserted_on` date NOT NULL,
  `updated_on` date NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_detail`
--

INSERT INTO `user_detail` (`user_id`, `first_name`, `last_name`, `user_name`, `password`, `inserted_on`, `updated_on`) VALUES
(2, '', '', 'admin', '5f4dcc3b5aa765d61d8327deb882cf99', '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `user_operator_link`
--

DROP TABLE IF EXISTS `user_operator_link`;
CREATE TABLE IF NOT EXISTS `user_operator_link` (
  `link_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `operator_id` int(11) NOT NULL,
  `inserted_on` date NOT NULL,
  `updated_on` date NOT NULL,
  PRIMARY KEY (`link_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vendor`
--

DROP TABLE IF EXISTS `vendor`;
CREATE TABLE IF NOT EXISTS `vendor` (
  `vendor_id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_type_id` int(11) NOT NULL,
  `vendor_name` varchar(30) NOT NULL,
  `vendor_address` varchar(50) NOT NULL,
  `vendor_city` varchar(50) NOT NULL,
  `vendor_state` varchar(50) NOT NULL,
  `vendor_country` varchar(50) NOT NULL,
  `account_no` varchar(30) NOT NULL,
  `bank_name` varchar(200) NOT NULL,
  `branch` varchar(100) NOT NULL,
  `vendor_email` varchar(200) NOT NULL,
  `vendor_phone` varchar(20) NOT NULL,
  `contact_person_id` int(11) NOT NULL COMMENT 'primary contact person',
  `vendor_pan` varchar(10) NOT NULL,
  PRIMARY KEY (`vendor_id`),
  KEY `vendor_type_id` (`vendor_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1 COMMENT='List of vendors';

--
-- Dumping data for table `vendor`
--

INSERT INTO `vendor` (`vendor_id`, `vendor_type_id`, `vendor_name`, `vendor_address`, `vendor_city`, `vendor_state`, `vendor_country`, `account_no`, `bank_name`, `branch`, `vendor_email`, `vendor_phone`, `contact_person_id`, `vendor_pan`) VALUES
(1, 0, 'Vendor-1', '0', 'Hyderabad', 'Telangana', 'India', '0', '0', '0', '0', '0', 1, '0'),
(2, 0, 'Vendor-2', '', 'Mumbai', 'Maharastra', 'India', '0', '0', '0', '', '', 2, '0'),
(3, 0, 'Vendor-3', '', 'Hyderabad', 'Telangana', 'India', '0', '0', '0', '', '1234567890', 3, '0'),
(4, 0, 'Vendor-4', '0', '0', '0', 'India', '0', '0', '0', '0', '0', 0, '0'),
(5, 0, 'Vendor-5', '', 'Secunderabad', 'Telangana', 'India', '0', '0', '0', '0', '1234567890', 0, '0');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_contact`
--

DROP TABLE IF EXISTS `vendor_contact`;
CREATE TABLE IF NOT EXISTS `vendor_contact` (
  `contact_person_id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_person_name` varchar(70) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `email` varchar(70) NOT NULL,
  PRIMARY KEY (`contact_person_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vendor_contact`
--

INSERT INTO `vendor_contact` (`contact_person_id`, `contact_person_name`, `phone`, `email`) VALUES
(1, 'Person-1', '123456789', ''),
(2, 'Person-2', '123456789', ''),
(3, 'Person-3', '1234567890', '');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_contracts`
--

DROP TABLE IF EXISTS `vendor_contracts`;
CREATE TABLE IF NOT EXISTS `vendor_contracts` (
  `contract_id` int(4) NOT NULL AUTO_INCREMENT,
  `vendor_id` int(4) NOT NULL,
  `facility_id` int(4) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`contract_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vendor_type`
--

DROP TABLE IF EXISTS `vendor_type`;
CREATE TABLE IF NOT EXISTS `vendor_type` (
  `vendor_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_type` varchar(50) NOT NULL,
  PRIMARY KEY (`vendor_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
