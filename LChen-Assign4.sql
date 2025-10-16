-- MySQL dump 10.13  Distrib 8.0.43, for macos15 (arm64)
--
-- Host: localhost    Database: unitedhelpers
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `assignment`
--

DROP TABLE IF EXISTS `assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignment` (
  `volunteerId` int NOT NULL,
  `taskCode` int NOT NULL,
  `startDateTime` datetime DEFAULT NULL,
  `endDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`volunteerId`,`taskCode`),
  KEY `taskCode` (`taskCode`),
  CONSTRAINT `assignment_ibfk_1` FOREIGN KEY (`volunteerId`) REFERENCES `volunteer` (`volunteerId`),
  CONSTRAINT `assignment_ibfk_2` FOREIGN KEY (`taskCode`) REFERENCES `task` (`taskCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignment`
--

LOCK TABLES `assignment` WRITE;
/*!40000 ALTER TABLE `assignment` DISABLE KEYS */;
INSERT INTO `assignment` VALUES (101,512,'2025-03-03 09:00:00','2025-03-03 17:00:00'),(101,515,'2025-03-01 10:00:00','2025-03-01 19:00:00'),(102,511,'2025-03-01 09:00:00','2025-03-01 12:00:00'),(103,512,'2025-03-02 09:00:00','2025-03-02 17:00:00'),(103,513,'2025-03-04 09:00:00','2025-03-04 17:00:00'),(104,514,'2025-03-03 10:00:00','2025-03-03 18:00:00'),(105,515,'2025-03-04 09:00:00','2025-03-04 17:00:00'),(106,518,'2025-03-05 09:00:00','2025-03-05 17:00:00'),(110,510,'2025-03-01 09:00:00','2025-03-01 17:00:00'),(110,511,'2025-03-02 09:00:00','2025-03-02 18:00:00');
/*!40000 ALTER TABLE `assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `itemId` int NOT NULL AUTO_INCREMENT,
  `itemDescription` varchar(100) DEFAULT NULL,
  `itemValue` decimal(8,2) DEFAULT NULL,
  `quantityOnHand` int DEFAULT NULL,
  PRIMARY KEY (`itemId`)
) ENGINE=InnoDB AUTO_INCREMENT=816 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (800,'Bandages',1.50,500),(801,'Antiseptic Wipes',0.80,1000),(802,'Medical Gloves',0.25,2000),(803,'Canned Beans',2.00,800),(804,'Rice (1kg)',1.20,900),(805,'Baby Diapers',0.40,1500),(806,'Baby Formula',3.50,400),(807,'Toothbrush',1.00,600),(808,'Soap Bar',0.75,700),(809,'Water Bottle',0.50,1200),(810,'Face Masks',0.30,1800),(811,'First Aid Manual',2.50,350),(812,'Flashlight',4.75,200),(813,'Face Masks',0.30,1800),(814,'First Aid Manual',2.50,350),(815,'Flashlight',4.75,200);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package`
--

DROP TABLE IF EXISTS `package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package` (
  `packageId` int NOT NULL AUTO_INCREMENT,
  `taskCode` int NOT NULL,
  `packageTypeId` int NOT NULL,
  `packageCreateDate` date DEFAULT NULL,
  `packageWeight` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`packageId`),
  KEY `taskCode` (`taskCode`),
  KEY `packageTypeId` (`packageTypeId`),
  CONSTRAINT `package_ibfk_1` FOREIGN KEY (`taskCode`) REFERENCES `task` (`taskCode`),
  CONSTRAINT `package_ibfk_2` FOREIGN KEY (`packageTypeId`) REFERENCES `package_type` (`packageTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=723 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package`
--

LOCK TABLES `package` WRITE;
/*!40000 ALTER TABLE `package` DISABLE KEYS */;
INSERT INTO `package` VALUES (710,510,600,'2025-03-01',3.50),(711,510,600,'2025-03-01',3.60),(712,511,601,'2025-03-02',2.10),(713,511,601,'2025-03-02',2.00),(714,512,602,'2025-03-03',4.20),(715,512,602,'2025-03-03',4.10),(716,516,603,'2025-03-04',1.90),(717,516,603,'2025-03-04',2.00),(718,518,600,'2025-03-05',3.80),(719,518,600,'2025-03-05',3.90),(720,513,603,'2025-03-04',1.95),(721,514,600,'2025-03-05',3.80),(722,515,602,'2025-03-05',4.25);
/*!40000 ALTER TABLE `package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package_contents`
--

DROP TABLE IF EXISTS `package_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package_contents` (
  `itemId` int NOT NULL,
  `packageId` int NOT NULL,
  `itemQuantity` int DEFAULT NULL,
  PRIMARY KEY (`itemId`,`packageId`),
  KEY `packageId` (`packageId`),
  CONSTRAINT `package_contents_ibfk_1` FOREIGN KEY (`itemId`) REFERENCES `item` (`itemId`),
  CONSTRAINT `package_contents_ibfk_2` FOREIGN KEY (`packageId`) REFERENCES `package` (`packageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package_contents`
--

LOCK TABLES `package_contents` WRITE;
/*!40000 ALTER TABLE `package_contents` DISABLE KEYS */;
INSERT INTO `package_contents` VALUES (800,710,10),(800,711,10),(801,710,5),(802,710,20),(802,711,15),(803,713,6),(803,716,5),(804,714,4),(804,717,3),(805,712,10),(806,712,2),(809,712,8),(809,715,10),(809,718,8),(810,712,3),(811,712,12),(812,712,3),(813,717,5);
/*!40000 ALTER TABLE `package_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package_type`
--

DROP TABLE IF EXISTS `package_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package_type` (
  `packageTypeId` int NOT NULL AUTO_INCREMENT,
  `packageTypeName` varchar(100) NOT NULL,
  PRIMARY KEY (`packageTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=608 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package_type`
--

LOCK TABLES `package_type` WRITE;
/*!40000 ALTER TABLE `package_type` DISABLE KEYS */;
INSERT INTO `package_type` VALUES (600,'Basic Medical'),(601,'Child Care'),(602,'Food'),(603,'Hygiene'),(604,'Basic Medical'),(605,'Child Care'),(606,'Food'),(607,'Hygiene');
/*!40000 ALTER TABLE `package_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packing_list`
--

DROP TABLE IF EXISTS `packing_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `packing_list` (
  `packingListId` int NOT NULL AUTO_INCREMENT,
  `packingListName` varchar(100) NOT NULL,
  `packingListDescription` text,
  PRIMARY KEY (`packingListId`)
) ENGINE=InnoDB AUTO_INCREMENT=405 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packing_list`
--

LOCK TABLES `packing_list` WRITE;
/*!40000 ALTER TABLE `packing_list` DISABLE KEYS */;
INSERT INTO `packing_list` VALUES (401,'Basic Medical','Includes bandages, antiseptics, gloves, and masks.'),(402,'Child Care','Includes diapers, baby wipes, and formula.'),(403,'Food Relief','Includes rice, canned goods, and water.'),(404,'Emergency Hygiene','Includes soap, toothbrushes, and shampoo.');
/*!40000 ALTER TABLE `packing_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task` (
  `taskCode` int NOT NULL AUTO_INCREMENT,
  `packingListId` int DEFAULT NULL,
  `taskTypeId` int NOT NULL,
  `taskStatusId` int NOT NULL,
  `taskDescription` varchar(255) NOT NULL,
  PRIMARY KEY (`taskCode`),
  KEY `packingListId` (`packingListId`),
  KEY `taskTypeId` (`taskTypeId`),
  KEY `taskStatusId` (`taskStatusId`),
  CONSTRAINT `task_ibfk_1` FOREIGN KEY (`packingListId`) REFERENCES `packing_list` (`packingListId`),
  CONSTRAINT `task_ibfk_2` FOREIGN KEY (`taskTypeId`) REFERENCES `task_type` (`taskTypeID`),
  CONSTRAINT `task_ibfk_3` FOREIGN KEY (`taskStatusId`) REFERENCES `task_status` (`taskStatusId`)
) ENGINE=InnoDB AUTO_INCREMENT=540 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (510,401,2,1,'Prepare 500 medical relief packages for hospital delivery'),(511,402,2,2,'Assemble 300 child-care kits for families'),(512,403,2,1,'Prepare 200 food packages for flood victims'),(513,404,2,1,'Prepare 150 hygiene kits for emergency shelters'),(514,NULL,1,2,'Answer the disaster relief hotline'),(515,NULL,3,1,'Deliver supplies to Albany relief center'),(516,NULL,4,3,'Process volunteer applications'),(517,NULL,3,2,'Transport packages to regional depot'),(518,NULL,1,3,'Maintain call center logs'),(519,401,2,2,'Restock medical supply packages'),(535,402,1,2,'Prepare 100 emergency food kits for regional dispatch'),(536,NULL,3,1,'Daily volunteer coordination meeting'),(537,NULL,4,3,'Deliver hygiene kits to Rochester relief center'),(538,NULL,4,4,'Update donor contact records and send thank-you notes'),(539,403,3,4,'Assemble 250 hygiene kits for school distribution');
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_status`
--

DROP TABLE IF EXISTS `task_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_status` (
  `taskStatusId` int NOT NULL AUTO_INCREMENT,
  `taskStatusName` varchar(50) NOT NULL,
  PRIMARY KEY (`taskStatusId`)
) ENGINE=InnoDB AUTO_INCREMENT=300 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_status`
--

LOCK TABLES `task_status` WRITE;
/*!40000 ALTER TABLE `task_status` DISABLE KEYS */;
INSERT INTO `task_status` VALUES (1,'Open'),(2,'Ongoing'),(3,'Completed'),(4,'Cancelled');
/*!40000 ALTER TABLE `task_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_type`
--

DROP TABLE IF EXISTS `task_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_type` (
  `taskTypeID` int NOT NULL AUTO_INCREMENT,
  `taskTypeName` varchar(100) NOT NULL,
  PRIMARY KEY (`taskTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_type`
--

LOCK TABLES `task_type` WRITE;
/*!40000 ALTER TABLE `task_type` DISABLE KEYS */;
INSERT INTO `task_type` VALUES (1,'Recurring'),(2,'Packing'),(3,'Delivery'),(4,'Administrative');
/*!40000 ALTER TABLE `task_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volunteer`
--

DROP TABLE IF EXISTS `volunteer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volunteer` (
  `volunteerId` int NOT NULL AUTO_INCREMENT,
  `volunteerName` varchar(100) NOT NULL,
  `volunteerAddress` varchar(200) DEFAULT NULL,
  `volunteerTelephone` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`volunteerId`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volunteer`
--

LOCK TABLES `volunteer` WRITE;
/*!40000 ALTER TABLE `volunteer` DISABLE KEYS */;
INSERT INTO `volunteer` VALUES (101,'Alice Johnson','12 Maple St, Albany, NY','518-222-4455'),(102,'Brian Lee','44 Oak Ave, Buffalo, NY','716-332-7799'),(103,'Carla Diaz','93 5th Ave, NYC, NY','212-655-2109'),(104,'Daniel Smith','77 Pine Rd, Syracuse, NY','315-444-1010'),(105,'Eva Chen','2 Garden Way, Rochester, NY','585-888-1122'),(106,'Frank Patel','85 Elm St, NYC, NY','212-334-5678'),(107,'Grace Kim','102 River St, Yonkers, NY','914-443-9000'),(108,'Hector Ramirez','55 Main St, Ithaca, NY','607-555-2020'),(109,'Isabella Rossi','29 Lakeview Dr, Albany, NY','518-333-2233'),(110,'James Park','200 Broadway, NYC, NY','212-111-8888'),(111,'Hannah Green','15 Willow Dr, Albany, NY','518-229-7788'),(112,'Jacob Martin','8 Elmwood Ave, Syracuse, NY','315-443-9922'),(113,'Lina Patel','64 Broadway, NYC, NY','212-657-4411'),(114,'Omar Hernandez','22 Lake St, Rochester, NY','585-334-1200');
/*!40000 ALTER TABLE `volunteer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-15 21:07:01
