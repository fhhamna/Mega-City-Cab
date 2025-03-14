CREATE DATABASE  IF NOT EXISTS `mega_city_cab` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mega_city_cab`;
-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: mega_city_cab
-- ------------------------------------------------------
-- Server version	8.0.41

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `billing`
--

DROP TABLE IF EXISTS `billing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billing` (
  `bill_ID` int NOT NULL AUTO_INCREMENT,
  `booking_ID` int NOT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `tax` decimal(5,2) DEFAULT NULL,
  `discount` decimal(5,2) DEFAULT NULL,
  `final_amount` decimal(10,2) DEFAULT NULL,
  `status` enum('Pending','Paid') DEFAULT NULL,
  PRIMARY KEY (`bill_ID`),
  KEY `booking_ID` (`booking_ID`),
  CONSTRAINT `billing_ibfk_1` FOREIGN KEY (`booking_ID`) REFERENCES `booking` (`booking_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billing`
--

LOCK TABLES `billing` WRITE;
/*!40000 ALTER TABLE `billing` DISABLE KEYS */;
INSERT INTO `billing` VALUES (2,7,1000.00,50.00,100.00,950.00,'Pending'),(3,6,2000.00,250.00,100.00,2150.00,'Pending'),(4,8,3500.00,250.00,500.00,3250.00,'Pending'),(5,9,3500.00,200.00,420.00,3280.00,'Pending'),(6,8,5000.00,300.00,700.00,4600.00,'Pending'),(7,10,7000.00,300.00,249.99,7050.01,'Pending');
/*!40000 ALTER TABLE `billing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `booking_ID` int NOT NULL AUTO_INCREMENT,
  `pickup_location` varchar(45) NOT NULL,
  `destination` varchar(45) NOT NULL,
  `booking_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `booking_status` enum('Pending','Completed','Cancelled') NOT NULL,
  `registration_ID` int NOT NULL,
  `cab_ID` int NOT NULL,
  PRIMARY KEY (`booking_ID`),
  KEY `cab_ID_fk` (`cab_ID`),
  KEY `registration_ID_fk` (`registration_ID`),
  CONSTRAINT `cab_ID_fk` FOREIGN KEY (`cab_ID`) REFERENCES `cab` (`cab_ID`),
  CONSTRAINT `registration_ID_fk` FOREIGN KEY (`registration_ID`) REFERENCES `customer` (`registration_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (6,'colombo','kandy','2025-03-13 04:58:14','Completed',582406,6),(7,'Church road','Bamba','2025-03-13 09:58:41','Completed',582407,8),(8,'De Krester Avenue','Airport','2025-03-13 13:42:35','Completed',582408,6),(9,'Bambalapitiya','Wattala','2025-03-14 01:58:13','Completed',582410,8),(10,'Kandy road, Colombo','Ampara','2025-03-14 04:52:49','Completed',582411,28),(11,'jhgrikhbkvfytr','thihariya','2025-03-14 07:05:37','Pending',582412,8);
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cab`
--

DROP TABLE IF EXISTS `cab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cab` (
  `cab_ID` int NOT NULL AUTO_INCREMENT,
  `model` varchar(100) NOT NULL,
  `status` enum('Available','Booked','Maintenance') NOT NULL DEFAULT 'Available',
  `price_per_km` decimal(6,2) NOT NULL,
  `passengers` int NOT NULL,
  `suitcases` int NOT NULL,
  `transmission` enum('Manual','Automatic') NOT NULL,
  PRIMARY KEY (`cab_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cab`
--

LOCK TABLES `cab` WRITE;
/*!40000 ALTER TABLE `cab` DISABLE KEYS */;
INSERT INTO `cab` VALUES (6,'Honda Civic','Available',30.00,4,1,'Automatic'),(7,'Toyota Corolla','Available',50.20,4,3,'Automatic'),(8,'Peugeot 306','Available',45.50,6,4,'Automatic'),(20,'Honda Civic','Booked',55.00,4,3,'Manual'),(22,'Nissan Sunny','Available',45.00,4,3,'Automatic'),(23,'Toyota Vitz','Booked',35.00,4,2,'Manual'),(24,'Mitsubishi Lancer','Available',60.00,4,3,'Automatic'),(25,'Honda City','Maintenance',50.00,4,2,'Manual'),(26,'Toyota Axio','Available',55.00,5,3,'Automatic'),(27,'Hyundai Accent','Booked',45.00,4,2,'Manual'),(28,'Kia Picanto','Available',40.00,4,1,'Automatic'),(29,'Nissan Lucino','Maintenance',42.50,4,3,'Automatic');
/*!40000 ALTER TABLE `cab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `registration_ID` int NOT NULL,
  `name` varchar(200) NOT NULL,
  `address` varchar(100) NOT NULL,
  `nic` varchar(20) NOT NULL,
  `phone_no` varchar(15) NOT NULL,
  PRIMARY KEY (`registration_ID`),
  UNIQUE KEY `nic_UNIQUE` (`nic`),
  UNIQUE KEY `phone_no_UNIQUE` (`phone_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (582406,'Zima','23, Main road','2347910V','0778906534'),(582407,'raha','55, Kotahena','30484900V','0772391011'),(582408,'Belle C','61, De Krester Avenue','679098372V','0772908743'),(582409,'Susane','90/2, Galle road, Colombo','998877665V','0767320909'),(582410,'Conrad','99,Duplication road, Colombo','87654321V','0776792736'),(582411,'Zoya','244, Kandy road, Colombo','123498076V','0777672005'),(582412,'hamza','gdvgfvljgogbljfoytf','bjcfydkmvxkts','0772626868');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_ID` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role` enum('Admin','Customer') DEFAULT NULL,
  `registration_ID` int NOT NULL,
  PRIMARY KEY (`user_ID`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  KEY `registration_ID_idx` (`registration_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (29,'zima','$2a$10$tJtcPXRzuk4bYPjlwsNUeeXfnzp3WtPzm0dubPud5rbX5AX45KjLK',NULL,582406),(30,'raha','$2a$10$tgyKJobZhqXWabBDcptUKuM.JY740YMCc4DyfV1dSTU.IkZGpE8sm',NULL,582407),(31,'Belle','$2a$10$YEYY/zrBJ1T6CQrd9Rd7VOyTNmGBbjpNHn1LbuM/Y5T7.eAPYAeTK',NULL,582408),(32,'conrad','$2a$10$n6xICOevl48.4SweTuYqkOw9DY0m7rsnSqQup0kxCRI5b4l7TyB8W',NULL,582410),(33,'Zoya','$2a$10$q3cvaSm//RzfsczJXBSOg.xAzTIPQsVx.q3za8ovNRAEo3MpEJCpO',NULL,582411),(34,'hamza','$2a$10$M5oIK0AXjhlcKTQBptNqLO27Xb7wz3oAuVo0ELuovgxqesOKILu7a',NULL,582412);
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

-- Dump completed on 2025-03-14 13:17:55
