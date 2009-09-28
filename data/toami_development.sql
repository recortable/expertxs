-- MySQL dump 10.11
--
-- Host: localhost    Database: apyrails_development
-- ------------------------------------------------------
-- Server version	5.0.32-Debian_7etch1-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `experts`
--

DROP TABLE IF EXISTS `experts`;
CREATE TABLE `experts` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `university` varchar(255) default NULL,
  `center` varchar(255) default NULL,
  `author` varchar(255) default NULL,
  `etype` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `experts`
--

LOCK TABLES `experts` WRITE;
/*!40000 ALTER TABLE `experts` DISABLE KEYS */;
INSERT INTO `experts` VALUES (2,'Mi investigadora','alguna','por aqui','danigb','investigador(a)'),(3,'Mis cosillas','asdfasdf','sadfasdfasdf asdfasdf','Libia','investigador(a) y profesional'),(7,'el pofesional','','','Libia','profesional'),(8,'El materia UNO','','','Libia','investigador(a)'),(9,'El materia DOS','','','Libia','investigador(a)'),(10,'dfasdfasdf','','','danigb','investigador(a)'),(12,'','','','Rosana','investigador(a)');
/*!40000 ALTER TABLE `experts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experts_materias`
--

DROP TABLE IF EXISTS `experts_materias`;
CREATE TABLE `experts_materias` (
  `expert_id` int(11) default NULL,
  `materia_id` int(11) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `experts_materias`
--

LOCK TABLES `experts_materias` WRITE;
/*!40000 ALTER TABLE `experts_materias` DISABLE KEYS */;
INSERT INTO `experts_materias` VALUES (2,1),(3,2),(7,1),(7,2),(8,1),(10,1),(10,2);
/*!40000 ALTER TABLE `experts_materias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras`
--

DROP TABLE IF EXISTS `extras`;
CREATE TABLE `extras` (
  `expert_id` int(11) default NULL,
  `value1` varchar(255) default NULL,
  `value2` varchar(255) default NULL,
  `value3` varchar(255) default NULL,
  `value4` varchar(255) default NULL,
  `etype` varchar(255) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `extras`
--

LOCK TABLES `extras` WRITE;
/*!40000 ALTER TABLE `extras` DISABLE KEYS */;
INSERT INTO `extras` VALUES (2,'Licenciatura','','','','academic'),(2,'Master','asdfasdf','','asdfasdf','academic'),(2,'Doctorado','','asdfasdfasd','','academic'),(2,'Otros','','','','academic'),(2,'','asdfasdf','','','experience'),(3,'Licenciatura','','','','academic'),(3,'Master','','','','academic'),(3,'Doctorado','','','','academic'),(3,'Otros','','','','academic'),(3,'sadf','asdfasdf','asdfdf','asdf','reference'),(7,'Licenciatura','','','','academic'),(7,'Master','','','','academic'),(7,'Doctorado','','','','academic'),(7,'Otros','','','','academic'),(8,'Licenciatura','','','','academic'),(8,'Master','','','','academic'),(8,'Doctorado','','','','academic'),(8,'Otros','','','','academic'),(9,'Licenciatura','','','','academic'),(9,'Master','','','','academic'),(9,'Doctorado','','','','academic'),(9,'Otros','','','','academic'),(10,'Licenciatura','','','','academic'),(10,'Master','','','','academic'),(10,'Doctorado','','','','academic'),(10,'Otros','','','','academic'),(10,'','','sdfasdf','','research'),(10,'','','sadfasd','','reference'),(12,'Licenciatura','','','','academic'),(12,'Master','','','','academic'),(12,'Doctorado','','','','academic'),(12,'Otros','','','','academic');
/*!40000 ALTER TABLE `extras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materias`
--

DROP TABLE IF EXISTS `materias`;
CREATE TABLE `materias` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `description` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `materias`
--

LOCK TABLES `materias` WRITE;
/*!40000 ALTER TABLE `materias` DISABLE KEYS */;
INSERT INTO `materias` VALUES (1,'Materia1','esto es una materia de prueba'),(2,'Materia2','esto es otra materia de prueba'),(3,'Materia3','esto es otra materia de prueba');
/*!40000 ALTER TABLE `materias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'danigb','danigb@gmail.com','b1539cb41384f0ee2fcbfeafd27f1b8ed0837304','1995b656f4e779f53a82bbf929bf1dc57efb3c6e','2007-11-07 16:43:04','2007-11-07 19:57:08',NULL,NULL),(2,'Libia','redapy2@apysolidaridad.org','fef4014dce251394c930f6e89a409498967788fe','a456f0403285e0df105dd9029000f4c81e941b69','2007-11-07 17:11:46','2007-11-07 17:11:46',NULL,NULL),(3,'Rosana','redapy1@apysolidaridad.org','7795277b492dd09d313d720bc8f6ea96b0c6672b','3a837a2979ebde4e09e7c20aa5327f293b2cdd8e','2007-11-12 12:10:49','2007-11-12 12:16:07',NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2007-11-12 11:57:14
