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
  CONSTRAINT `id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_superpersons1` FOREIGN KEY (`superpersons_id`) REFERENCES `superpersons` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorite_superpersons`
--

DROP TABLE IF EXISTS `favorite_superpersons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favorite_superpersons` (
  `superpersons_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`superpersons_id`,`user_id`),
  KEY `fk_superpersons_has_user_user1_idx` (`user_id`),
  KEY `fk_superpersons_has_user_superpersons1_idx` (`superpersons_id`),
  CONSTRAINT `fk_superpersons_has_user_superpersons1` FOREIGN KEY (`superpersons_id`) REFERENCES `superpersons` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_superpersons_has_user_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite_superpersons`
--

LOCK TABLES `favorite_superpersons` WRITE;
/*!40000 ALTER TABLE `favorite_superpersons` DISABLE KEYS */;
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
  CONSTRAINT `fk_Superperson_superperson` FOREIGN KEY (`superperson_id`) REFERENCES `superpersons` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_nemesis_superperson` FOREIGN KEY (`nemesis_id`) REFERENCES `superpersons` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `superpersons`
--

LOCK TABLES `superpersons` WRITE;
/*!40000 ALTER TABLE `superpersons` DISABLE KEYS */;
INSERT INTO `superpersons` VALUES (1,'Iron Man','Tony Stark','1963','Stan Lee',1,'','','superhero'),(2,'Captain America','Steve Rogers','1941','Stan Lee',1,'','','superhero'),(3,'Hulk','Bruce Banner','1962','Stan Lee',1,'','','superhero'),(4,'Thor',NULL,'1951','Stan Lee',1,'','','superhero'),(5,'Black Widow','Natasha Romanoff','1964','Stan Lee',1,'','','superhero'),(6,'Hawkeye','Clint Barton','1964','Stan Lee',1,'','','superhero'),(7,'Doctor Doom','Victor Von Doom','1962','Jack Kirby',NULL,NULL,NULL,'villain'),(8,'Venom','Eddie Brock','1988','Todd McFarlane',NULL,NULL,NULL,'villain'),(9,'Magneto','Max Eisenhaurdt','1963','Stan Lee, Jack Kirby',NULL,NULL,NULL,'villain'),(10,'Galactus','Galan','1966','Stan Lee, Jack Kirby',NULL,NULL,NULL,'villain'),(11,'Carnage','Cletus Kasady','1992','Mark Bagley',NULL,NULL,NULL,'villain');
/*!40000 ALTER TABLE `superpersons` ENABLE KEYS */;
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
  KEY `fk_user_superpersons1_idx` (`superpersons_id`),
  CONSTRAINT `fk_user_superpersons1` FOREIGN KEY (`superpersons_id`) REFERENCES `superpersons` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin',NULL,'admin',NULL,NULL),(2,'',NULL,'',NULL,NULL);
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

-- Dump completed on 2016-02-16 11:37:05