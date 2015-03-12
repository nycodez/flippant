# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 104.131.162.225 (MySQL 5.1.73)
# Database: webapp
# Generation Time: 2015-03-12 18:37:40 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table balance
# ------------------------------------------------------------

CREATE TABLE `balance` (
  `entity_id` int(11) DEFAULT NULL,
  `credit` decimal(5,2) DEFAULT '0.00',
  `unpaid` decimal(5,2) DEFAULT '0.00',
  `row` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`row`),
  KEY `entity_id` (`entity_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table entity
# ------------------------------------------------------------

CREATE TABLE `entity` (
  `type` enum('Contact','Employee','Group','User','Vendor') DEFAULT NULL,
  `login` char(30) DEFAULT NULL,
  `secret` char(40) DEFAULT NULL,
  `session` char(40) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `ip` varchar(20) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `entity` WRITE;
/*!40000 ALTER TABLE `entity` DISABLE KEYS */;

INSERT INTO `entity` (`type`, `login`, `secret`, `session`, `name`, `active`, `ip`, `parent_id`, `id`)
VALUES
	('Contact','che','pug',NULL,'Che Gonzales',1,NULL,2,1),
	('Group',NULL,NULL,NULL,'Mirgon Technology',1,NULL,NULL,2),
	('Group',NULL,NULL,NULL,'Adcox Square',1,NULL,NULL,3),
	('Group',NULL,NULL,NULL,'Liberty Management',1,NULL,NULL,4),
	('Vendor',NULL,NULL,NULL,'Schmoe Pizza',1,NULL,NULL,5),
	('Vendor',NULL,NULL,NULL,'Poland Springs',1,NULL,NULL,6),
	('Vendor',NULL,NULL,NULL,'Bank of America',1,NULL,NULL,7),
	('Vendor',NULL,NULL,NULL,'PG&E',1,NULL,NULL,8),
	('Vendor',NULL,NULL,NULL,'Patriot Pools',1,NULL,NULL,9),
	('User','agonzales','012389c6260186faf2e5b5f41a7a266a','tu0jbq2hi5s2earaqkgau6gjr0','Andy Gonzales',1,'66.192.33.198',NULL,11),
	('User','test','012389c6260186faf2e5b5f41a7a266a','417n5rjclg7d32m065c1i5bf94','Andy Gonzales',1,'66.192.33.198',NULL,14);

/*!40000 ALTER TABLE `entity` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table fields
# ------------------------------------------------------------

CREATE TABLE `fields` (
  `order` int(5) DEFAULT NULL,
  `grouping` enum('entity','record') DEFAULT NULL,
  `subgrouping` char(20) DEFAULT NULL,
  `name` char(30) DEFAULT NULL,
  `type` enum('select','textarea','text','radio','checkbox') DEFAULT NULL,
  `label` varchar(30) DEFAULT NULL,
  `options` text,
  `maxlength` smallint(6) DEFAULT NULL,
  `placeholder` varchar(30) DEFAULT NULL,
  `default` varchar(30) DEFAULT NULL,
  `id` varchar(30) DEFAULT NULL,
  `required` tinyint(1) DEFAULT '0',
  `active` tinyint(1) DEFAULT '1',
  `row` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`row`),
  UNIQUE KEY `id` (`id`),
  KEY `grouping` (`grouping`,`subgrouping`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;

INSERT INTO `fields` (`order`, `grouping`, `subgrouping`, `name`, `type`, `label`, `options`, `maxlength`, `placeholder`, `default`, `id`, `required`, `active`, `row`)
VALUES
	(1,'entity','Contact','Email','text','Email',NULL,30,'Primary Email',NULL,'contactEmail',0,1,1),
	(2,'entity','Contact','Phone','text','Phone',NULL,20,'Primary Phone',NULL,'contactPhone',0,1,2),
	(NULL,'entity','Group','EntranceAddress','text','Entrance Address',NULL,100,'Entrance Address',NULL,'entranceAddress',0,1,3),
	(NULL,'entity','Vendor','BillingTerms','text','Billing Terms',NULL,20,'Billing Terms',NULL,'billingTerms',0,1,4),
	(10,'entity','Contact','Notes','textarea','Notes',NULL,NULL,'Notes',NULL,'contactNotes',0,1,6),
	(3,'entity','Contact','Address','text','Address',NULL,100,'Address',NULL,NULL,0,1,7),
	(4,'entity','Contact','City, State ZIP','text','City, State ZIP',NULL,100,'City, State ZIP',NULL,NULL,0,1,8);

/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table itemservice
# ------------------------------------------------------------

CREATE TABLE `itemservice` (
  `name` varchar(50) DEFAULT NULL,
  `type` enum('Item','Service') DEFAULT NULL,
  `dateAdded` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `percent` decimal(3,3) DEFAULT NULL,
  `cost` decimal(5,2) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table keyvals
# ------------------------------------------------------------

CREATE TABLE `keyvals` (
  `record_id` int(11) DEFAULT NULL,
  `key` char(30) DEFAULT NULL,
  `value` text,
  `row` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`row`),
  KEY `record_id` (`record_id`),
  KEY `key` (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `keyvals` WRITE;
/*!40000 ALTER TABLE `keyvals` DISABLE KEYS */;

INSERT INTO `keyvals` (`record_id`, `key`, `value`, `row`)
VALUES
	(1,'contactEmail','che@pug.com',1),
	(1,'contactPhone','212-203-9068',2),
	(1,'contactNotes','testing',3);

/*!40000 ALTER TABLE `keyvals` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table record
# ------------------------------------------------------------

CREATE TABLE `record` (
  `type` enum('Call','Document','Event') DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `status` enum('NEW','ASSIGNED','CLOSED') DEFAULT 'NEW',
  `date` datetime DEFAULT NULL,
  `entity_id` int(11) DEFAULT NULL,
  `record_id` int(11) DEFAULT NULL,
  `created_id` int(11) DEFAULT NULL,
  `assigned_id` int(11) DEFAULT NULL,
  `private` tinyint(1) DEFAULT '0',
  `scheduleDate` date DEFAULT NULL,
  `scheduleTime` time DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `contact_id` (`entity_id`),
  KEY `record_id` (`record_id`),
  KEY `created_id` (`created_id`),
  KEY `assigned_id` (`assigned_id`),
  KEY `scheduleDate` (`scheduleDate`),
  KEY `scheduleTime` (`scheduleTime`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `record` WRITE;
/*!40000 ALTER TABLE `record` DISABLE KEYS */;

INSERT INTO `record` (`type`, `name`, `status`, `date`, `entity_id`, `record_id`, `created_id`, `assigned_id`, `private`, `scheduleDate`, `scheduleTime`, `active`, `id`)
VALUES
	('Call','Approve Fence','NEW','2014-12-12 14:34:22',5,NULL,11,1,0,NULL,NULL,1,1);

/*!40000 ALTER TABLE `record` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
