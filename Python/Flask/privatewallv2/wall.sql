CREATE DATABASE  IF NOT EXISTS `login` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `login`;
-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: login
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(255) DEFAULT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_messages_users_idx` (`sender_id`),
  KEY `fk_messages_users1_idx` (`receiver_id`),
  CONSTRAINT `fk_messages_users` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_messages_users1` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (11,'Did you get the TPS report?',2,1,'2019-06-14 12:15:48','2019-06-14 12:15:48'),(12,'If I got the TPS report, I did not read it',1,2,'2019-06-14 12:15:50','2019-06-14 12:15:50'),(13,'Need you to come in Saturday ',2,1,'2019-06-14 12:15:54','2019-06-14 12:15:54'),(14,'I do not work saturdays',1,2,'2019-06-14 12:15:56','2019-06-14 12:15:56'),(15,'Hi Kim, its Not. When are you coming to the office',2,1,'2019-06-14 12:15:57','2019-06-14 12:15:57'),(16,'I am not',1,2,'2019-06-14 12:15:58','2019-06-14 12:15:58'),(17,'We are undergoing a performance review Monday',2,1,'2019-06-14 12:17:50','2019-06-14 12:17:50'),(18,'So I should skip Monday too, huh?',1,2,'2019-06-14 12:17:51','2019-06-14 12:17:51'),(19,'It would reflect negatively on your review',2,1,'2019-06-14 12:17:52','2019-06-14 12:17:52'),(20,'Enough to get me fired?',1,2,'2019-06-14 12:17:54','2019-06-14 12:17:54'),(23,'Possibly',2,1,'2019-06-14 12:18:13','2019-06-14 12:18:13'),(24,'Good.',1,2,'2019-06-14 12:18:14','2019-06-14 12:18:14'),(25,'Test Test',1,2,'2019-06-14 13:53:24','2019-06-14 13:53:24'),(26,'What if we take those fractions of a percent that are dropped off and give them to ourselves?',1,4,'2019-06-14 13:56:40','2019-06-14 13:56:40'),(27,'Test Test',1,5,'2019-06-14 14:39:46','2019-06-14 14:39:46'),(28,'Test Test',1,4,'2019-06-14 14:42:50','2019-06-14 14:42:50'),(29,'More Tests of our cents program.',1,5,'2019-06-14 14:49:39','2019-06-14 14:49:39'),(30,'How much is in the account.',1,4,'2019-06-14 14:50:37','2019-06-14 14:50:37'),(31,'Testing the dumb shit',1,5,'2019-06-14 15:41:40','2019-06-14 15:41:40'),(32,'More dumb shit',1,5,'2019-06-14 15:46:34','2019-06-14 15:46:34'),(33,'testing again',1,5,'2019-06-14 15:46:50','2019-06-14 15:46:50'),(34,'more meat for the database',1,5,'2019-06-14 15:47:24','2019-06-14 15:47:24'),(35,'Once more',1,5,'2019-06-14 15:52:32','2019-06-14 15:52:32'),(36,'Maybe',1,5,'2019-06-14 15:53:50','2019-06-14 15:53:50'),(37,'Yaddada',1,5,'2019-06-14 15:55:05','2019-06-14 15:55:05'),(38,'once more unto the breach',1,5,'2019-06-14 16:43:23','2019-06-14 16:43:23'),(39,'Maaaybe this time',1,5,'2019-06-14 16:44:17','2019-06-14 16:44:17'),(40,'Nother chance',1,5,'2019-06-14 16:45:59','2019-06-14 16:45:59');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Kim','Possible','kp@aa.com','$2b$12$94knlSxoaLKvvuCOYNJ5OuIgyN3OlRXrAZRTLHzTINXOL4e08AqVe',NULL,NULL),(2,'Not','Possible','np@aa.com','$2b$12$yW0/nb26ejOrLImFDrmGFOODXAf/D7PgK/ZeD4KbYOKZ2Vq22xrXy',NULL,NULL),(3,'Bill','Possible','bp@gmail.com','$2b$12$mwMRsUINV1Vbv0JfV1jU6uAExtaiPOhkrNUYVAmgbIuqmrH4RS/2q',NULL,NULL),(4,'Jim','Possible','jp@yahoo.com','$2b$12$lhh0QOk.8gzNH5DqzsBREeADRcuhzyTYIZJCMn/f68xrSEpjzyd3e',NULL,NULL),(5,'Terry','Terry','tt@microsoft.com','$2b$12$N/splOjTliwf74Xj8pXV2esFYApBve.dCGXsR4yaGFhozQl33JJr6',NULL,NULL);
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

-- Dump completed on 2019-06-14 16:48:44
