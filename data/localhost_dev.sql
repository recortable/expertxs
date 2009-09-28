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
CREATE TABLE  `apyrails_development`.`experts` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `university` varchar(255) default NULL,
  `center` varchar(255) default NULL,
  `author` varchar(255) default NULL,
  `etype` varchar(255) default NULL,
  `index` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
INSERT INTO `apyrails_development`.`experts` VALUES  (2,'Mi investigadora','alguna','por aqui','danigb','investigador(a)',NULL),
 (3,'Mis cosillas por aqui...','asdfasdf','sadfasdfasdf asdfasdf','Libia','investigador(a) y profesional',NULL),
 (8,'El materia UNO','','','Libia','investigador(a)',NULL),
 (9,'El materia DOS','','','Libia','investigador(a)',NULL),
 (10,'asdfasdf','','','danigb','investigador(a)',NULL),
 (11,'asdfasdf','','','danigb','investigador(a)',NULL),
 (12,'asdfasdf','','','danigb','investigador(a)',NULL),
 (13,'asdfasdf','','asdfasdf','danigb','investigador(a)',NULL),
 (14,'asdf','','','danigb','investigador(a)',NULL),
 (15,'asdfd','','','danigb','investigador(a)',NULL);
CREATE TABLE  `apyrails_development`.`experts_materias` (
  `expert_id` int(11) default NULL,
  `materia_id` int(11) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
INSERT INTO `apyrails_development`.`experts_materias` VALUES  (8,1),
 (9,2),
 (2,1),
 (3,2),
 (10,1),
 (10,2),
 (13,1),
 (15,2);
CREATE TABLE  `apyrails_development`.`extras` (
  `expert_id` int(11) default NULL,
  `value1` varchar(255) default NULL,
  `value2` varchar(255) default NULL,
  `value3` varchar(255) default NULL,
  `value4` varchar(255) default NULL,
  `etype` varchar(255) default NULL,
  `id` int(11) NOT NULL auto_increment,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=latin1;
INSERT INTO `apyrails_development`.`extras` VALUES  (8,'Licenciatura','','','','academic',15),
 (8,'Master','','','','academic',16),
 (8,'Doctorado','','','','academic',17),
 (8,'Otros','','','','academic',18),
 (9,'Licenciatura','','','','academic',19),
 (9,'Master','','','','academic',20),
 (9,'Doctorado','','','','academic',21),
 (9,'Otros','','','','academic',22),
 (2,'Licenciatura','','','','academic',23),
 (2,'Master','asdfasdf','','asdfasdf','academic',24),
 (2,'Doctorado','','asdfasdfasd','','academic',25),
 (2,'Otros','','','','academic',26),
 (2,'','asdfasdf','','','experience',27),
 (3,'Licenciatura','','','','academic',38),
 (3,'Master','','','','academic',39),
 (3,'Doctorado','','','','academic',40),
 (3,'Otros','','','','academic',41),
 (3,'sadf','asdfasdf','asdfdf','asdf','reference',42),
 (10,'Licenciatura','','','','academic',43),
 (10,'Master','','','','academic',44),
 (10,'Doctorado','','','','academic',45),
 (10,'Otros','','','','academic',46),
 (11,'Licenciatura','','','','academic',52),
 (11,'Master','asdfasdf','','','academic',53);
INSERT INTO `apyrails_development`.`extras` VALUES  (11,'Doctorado','','asdfasdf','','academic',54),
 (11,'Otros','','','asdfasdf','academic',55),
 (11,'','','asdfasdf','','experience',56),
 (11,'asdf','sdfasd','sadfasd','sdfasdf','research',57),
 (11,'asdfsad','sadfsad','sadfasd','sadf','reference',58),
 (12,'Licenciatura','','','','academic',59),
 (12,'Master','','','','academic',60),
 (12,'Doctorado','','','','academic',61),
 (12,'Otros','','','','academic',62),
 (12,'sadf','asdf','sadfsadf','sadf','experience',63),
 (13,'Licenciatura','','','','academic',69),
 (13,'Master','','','','academic',70),
 (13,'Doctorado','','','','academic',71),
 (13,'Otros','','','asdfasdf','academic',72),
 (13,'','','asdfasdf','','experience',73),
 (14,'Licenciatura','','','','academic',74),
 (14,'Master','','','','academic',75),
 (14,'Doctorado','','','','academic',76),
 (14,'Otros','','','','academic',77),
 (14,'','','','asdf','experience',78),
 (14,'','','sadfad','','research',79),
 (14,'','','asdf','','reference',80),
 (15,'Licenciatura','','','','academic',81);
INSERT INTO `apyrails_development`.`extras` VALUES  (15,'Master','','asdf','','academic',82),
 (15,'Doctorado','asdfasd','','','academic',83),
 (15,'Otros','','','asdfd','academic',84),
 (15,'','','','fdf','experience',85);
CREATE TABLE  `apyrails_development`.`materias` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `description` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
INSERT INTO `apyrails_development`.`materias` VALUES  (1,'Materia1','esto es una materia de prueba'),
 (2,'Materia2','esto es otra materia de prueba');
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
INSERT INTO `apyrails_development`.`users` VALUES  (1,'danigb','danigb@gmail.com','b1539cb41384f0ee2fcbfeafd27f1b8ed0837304','1995b656f4e779f53a82bbf929bf1dc57efb3c6e','2007-11-07 16:43:04','2007-11-12 14:30:29',NULL,NULL),
 (2,'Libia','redapy2@apysolidaridad.org','fef4014dce251394c930f6e89a409498967788fe','a456f0403285e0df105dd9029000f4c81e941b69','2007-11-07 17:11:46','2007-11-07 21:32:35',NULL,NULL);



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
