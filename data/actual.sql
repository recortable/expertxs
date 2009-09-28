-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.45-Debian_1ubuntu3-log


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema apyrails_development
--

CREATE DATABASE IF NOT EXISTS apyrails_development;
USE apyrails_development;

--
-- Definition of table `apyrails_development`.`experts`
--

DROP TABLE IF EXISTS `apyrails_development`.`experts`;
CREATE TABLE  `apyrails_development`.`experts` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `university` varchar(255) default NULL,
  `center` varchar(255) default NULL,
  `author` varchar(255) default NULL,
  `etype` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `apyrails_development`.`experts`
--

/*!40000 ALTER TABLE `experts` DISABLE KEYS */;
LOCK TABLES `experts` WRITE;
INSERT INTO `apyrails_development`.`experts` VALUES  (2,'Mi investigadora','alguna','por aqui','danigb','investigador(a)'),
 (3,'Mis cosillas','asdfasdf','sadfasdfasdf asdfasdf','Libia','investigador(a) y profesional'),
 (7,'el pofesional','','','Libia','profesional'),
 (8,'El materia UNO','','','Libia','investigador(a)'),
 (9,'El materia DOS','','','Libia','investigador(a)');
UNLOCK TABLES;
/*!40000 ALTER TABLE `experts` ENABLE KEYS */;


--
-- Definition of table `apyrails_development`.`experts_materias`
--

DROP TABLE IF EXISTS `apyrails_development`.`experts_materias`;
CREATE TABLE  `apyrails_development`.`experts_materias` (
  `expert_id` int(11) default NULL,
  `materia_id` int(11) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `apyrails_development`.`experts_materias`
--

/*!40000 ALTER TABLE `experts_materias` DISABLE KEYS */;
LOCK TABLES `experts_materias` WRITE;
INSERT INTO `apyrails_development`.`experts_materias` VALUES  (2,1),
 (3,2),
 (7,1),
 (7,2),
 (8,1),
 (9,2);
UNLOCK TABLES;
/*!40000 ALTER TABLE `experts_materias` ENABLE KEYS */;


--
-- Definition of table `apyrails_development`.`extras`
--

DROP TABLE IF EXISTS `apyrails_development`.`extras`;
CREATE TABLE  `apyrails_development`.`extras` (
  `expert_id` int(11) default NULL,
  `value1` varchar(255) default NULL,
  `value2` varchar(255) default NULL,
  `value3` varchar(255) default NULL,
  `value4` varchar(255) default NULL,
  `etype` varchar(255) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `apyrails_development`.`extras`
--

/*!40000 ALTER TABLE `extras` DISABLE KEYS */;
LOCK TABLES `extras` WRITE;
INSERT INTO `apyrails_development`.`extras` VALUES  (2,'Licenciatura','','','','academic'),
 (2,'Master','asdfasdf','','asdfasdf','academic'),
 (2,'Doctorado','','asdfasdfasd','','academic'),
 (2,'Otros','','','','academic'),
 (2,'','asdfasdf','','','experience'),
 (3,'Licenciatura','','','','academic'),
 (3,'Master','','','','academic'),
 (3,'Doctorado','','','','academic'),
 (3,'Otros','','','','academic'),
 (3,'sadf','asdfasdf','asdfdf','asdf','reference'),
 (7,'Licenciatura','','','','academic'),
 (7,'Master','','','','academic'),
 (7,'Doctorado','','','','academic'),
 (7,'Otros','','','','academic'),
 (8,'Licenciatura','','','','academic'),
 (8,'Master','','','','academic'),
 (8,'Doctorado','','','','academic'),
 (8,'Otros','','','','academic'),
 (9,'Licenciatura','','','','academic'),
 (9,'Master','','','','academic'),
 (9,'Doctorado','','','','academic'),
 (9,'Otros','','','','academic');
UNLOCK TABLES;
/*!40000 ALTER TABLE `extras` ENABLE KEYS */;


--
-- Definition of table `apyrails_development`.`materias`
--

DROP TABLE IF EXISTS `apyrails_development`.`materias`;
CREATE TABLE  `apyrails_development`.`materias` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `description` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `apyrails_development`.`materias`
--

/*!40000 ALTER TABLE `materias` DISABLE KEYS */;
LOCK TABLES `materias` WRITE;
INSERT INTO `apyrails_development`.`materias` VALUES  (1,'Materia1','esto es una materia de prueba'),
 (2,'Materia2','esto es otra materia de prueba');
UNLOCK TABLES;
/*!40000 ALTER TABLE `materias` ENABLE KEYS */;


--
-- Definition of table `apyrails_development`.`users`
--

DROP TABLE IF EXISTS `apyrails_development`.`users`;
CREATE TABLE  `apyrails_development`.`users` (
  `id` int(11) NOT NULL auto_increment,
  `login` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `crypted_password` varchar(40) default NULL,
  `salt` varchar(40) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `remember_token` varchar(255) default NULL,
  `remember_token_expires_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `apyrails_development`.`users`
--

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
LOCK TABLES `users` WRITE;
INSERT INTO `apyrails_development`.`users` VALUES  (1,'danigb','danigb@gmail.com','b1539cb41384f0ee2fcbfeafd27f1b8ed0837304','1995b656f4e779f53a82bbf929bf1dc57efb3c6e','2007-11-07 16:43:04','2007-11-07 17:10:54',NULL,NULL),
 (2,'Libia','redapy2@apysolidaridad.org','fef4014dce251394c930f6e89a409498967788fe','a456f0403285e0df105dd9029000f4c81e941b69','2007-11-07 17:11:46','2007-11-07 17:11:46',NULL,NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
