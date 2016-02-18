-- MySQL dump 10.13  Distrib 5.5.42, for osx10.6 (i386)
--
-- Host: localhost    Database: superwiki
-- ------------------------------------------------------
-- Server version	5.5.42

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
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `message` varchar(8000) DEFAULT NULL,
  `created` datetime NOT NULL,
  `superpersons_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`user_id`),
  KEY `id_idx` (`user_id`),
  KEY `fk_comment_superpersons1_idx` (`superpersons_id`),
  CONSTRAINT `id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_comment_superpersons1` FOREIGN KEY (`superpersons_id`) REFERENCES `superpersons` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,1,'tony stark is played by rdj','2016-02-16 00:00:00',1);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorite_superpersons`
--

DROP TABLE IF EXISTS `favorite_superpersons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favorite_superpersons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `superpersons_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_superpersons_has_user_user1_idx` (`user_id`),
  KEY `fk_superpersons_has_user_superpersons1_idx` (`superpersons_id`),
  CONSTRAINT `fk_superpersons_has_user_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_superpersons_has_user_superpersons1` FOREIGN KEY (`superpersons_id`) REFERENCES `superpersons` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite_superpersons`
--

LOCK TABLES `favorite_superpersons` WRITE;
/*!40000 ALTER TABLE `favorite_superpersons` DISABLE KEYS */;
INSERT INTO `favorite_superpersons` VALUES (14,1,1);
/*!40000 ALTER TABLE `favorite_superpersons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nemesis`
--

DROP TABLE IF EXISTS `nemesis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nemesis` (
  `superperson_id` int(11) NOT NULL,
  `nemesis_id` int(11) NOT NULL,
  KEY `fk_Superhero_has_Villain_Superhero1_idx` (`superperson_id`),
  KEY `fk_nemesis_superperson_idx` (`nemesis_id`),
  CONSTRAINT `fk_nemesis_superperson` FOREIGN KEY (`nemesis_id`) REFERENCES `superpersons` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Superperson_superperson` FOREIGN KEY (`superperson_id`) REFERENCES `superpersons` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nemesis`
--

LOCK TABLES `nemesis` WRITE;
/*!40000 ALTER TABLE `nemesis` DISABLE KEYS */;
/*!40000 ALTER TABLE `nemesis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `superpersons`
--

DROP TABLE IF EXISTS `superpersons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `superpersons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `alias_names` varchar(45) DEFAULT NULL,
  `firstAppearance` varchar(100) DEFAULT NULL,
  `Creator` varchar(45) DEFAULT NULL,
  `Team_id` int(11) DEFAULT NULL,
  `origin` varchar(42000) DEFAULT NULL,
  `publisher` varchar(100) DEFAULT NULL,
  `supertype` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Superhero_Team_idx` (`Team_id`),
  CONSTRAINT `alias_name` FOREIGN KEY (`Team_id`) REFERENCES `teams` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `superpersons`
--

LOCK TABLES `superpersons` WRITE;
/*!40000 ALTER TABLE `superpersons` DISABLE KEYS */;
INSERT INTO `superpersons` VALUES (1,'Iron Man','Tony Stark','1963','Stan Lee',1,' fslkjsl','marvel','superhero'),(2,'Captain America','Steve Rogers','1941','Stan Lee',1,'','','superhero'),(3,'Hulk','Bruce Banner','1962','Stan Lee',1,'','','superhero'),(4,'Thor',NULL,'1951','Stan Lee',1,'','','superhero'),(5,'Black Widow','Natasha Romanoff','1964','Stan Lee',1,'','','superhero'),(6,'Hawkeye','Clint Barton','1964','Stan Lee',1,'','','superhero'),(7,'Doctor Doom','Victor Von Doom','1962','Jack Kirby',NULL,NULL,NULL,'villain'),(8,'Venom','Eddie Brock','1988','Todd McFarlane',NULL,NULL,NULL,'villain'),(9,'Magneto','Max Eisenhaurdt','1963','Stan Lee, Jack Kirby',NULL,NULL,NULL,'villain'),(10,'Galactus','Galan','1966','Stan Lee, Jack Kirby',NULL,NULL,NULL,'villain'),(11,'Carnage','Cletus Kasady','1992','Mark Bagley',NULL,NULL,NULL,'villain'),(12,'wolverine','logan','hulk','stan lee',NULL,'hello','top cow','superhero');
/*!40000 ALTER TABLE `superpersons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `superpersontypes`
--

DROP TABLE IF EXISTS `superpersontypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `superpersontypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supertype` varchar(45) NOT NULL,
  `superperson_id` int(11) NOT NULL,
  `startYear` year(4) NOT NULL,
  `endYear` year(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_supertype_has_superperson_superperson1_idx` (`superperson_id`),
  KEY `fk_supertype_has_superperson_supertype1_idx` (`id`),
  CONSTRAINT `fk_supertype_has_superperson_superperson1` FOREIGN KEY (`superperson_id`) REFERENCES `superpersons` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `superpersontypes`
--

LOCK TABLES `superpersontypes` WRITE;
/*!40000 ALTER TABLE `superpersontypes` DISABLE KEYS */;
INSERT INTO `superpersontypes` VALUES (1,'superhero',1,1963,NULL),(2,'superhero',2,1941,NULL),(3,'superhero',3,1962,NULL),(4,'superhero',4,1951,NULL),(5,'superhero',5,1964,NULL),(6,'superhero',6,1964,NULL),(7,'villain',7,1962,NULL),(8,'villain',8,1988,NULL),(9,'villain',9,1963,NULL),(10,'villain',10,1966,NULL),(11,'villain',11,1992,NULL);
/*!40000 ALTER TABLE `superpersontypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES (1,'Avengers');
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(16) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(32) NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `superpersons_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  KEY `fk_user_superpersons1_idx` (`superpersons_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin',NULL,'admin',NULL,NULL),(2,'guest',NULL,'guest',NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-02-17 21:01:39
