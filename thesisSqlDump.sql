-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: projectmanagement
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'Eng Mohamed Emara','m.emara@vimsolutions.com'),(2,'Mrs. Sarah Abdullah','s.abdullah@vimsolutions.com'),(3,'Mr. Ahmed Salama','a.salama@vimsolutions.com'),(4,'Mr. Khaled Ahmed','k.ahmed@vimsolutions.com');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Alaa Hassan','Carpenter',1),(2,'Mona Saeed','Interior Designer',2),(3,'Tamer Youssef','Architect',3),(4,'Nour El-Sayed','Furniture Assembler',4),(5,'Khalid Naguib','Team Lead',5);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `employeetask`
--

LOCK TABLES `employeetask` WRITE;
/*!40000 ALTER TABLE `employeetask` DISABLE KEYS */;
INSERT INTO `employeetask` VALUES (1,1,1),(2,2,1),(3,3,2),(4,4,2),(5,5,3),(6,6,3),(7,7,4),(8,8,4),(9,9,5),(10,10,5);
/*!40000 ALTER TABLE `employeetask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `payable`
--

LOCK TABLES `payable` WRITE;
/*!40000 ALTER TABLE `payable` DISABLE KEYS */;
INSERT INTO `payable` VALUES (1,1,15000.00,'Completed'),(2,2,20000.00,'Pending'),(3,3,30000.00,'Pending'),(4,4,25000.00,'Pending'),(5,5,50000.00,'Pending');
/*!40000 ALTER TABLE `payable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (1,1,1,'Living Room Makeover','2024-01-16','2024-02-10'),(2,2,2,'Cozy Bedroom Setup','2024-02-02','2024-02-28'),(3,3,3,'Modern Office Design','2024-02-21','2024-03-25'),(4,4,4,'Elegant Dining Space','2024-03-06','2024-03-30'),(5,5,5,'Luxury Home Renovation','2024-03-16','2024-05-30');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `purchaseorder`
--

LOCK TABLES `purchaseorder` WRITE;
/*!40000 ALTER TABLE `purchaseorder` DISABLE KEYS */;
INSERT INTO `purchaseorder` VALUES (1,1,1,'2024-01-20',15000.00),(2,2,2,'2024-02-05',20000.00),(3,3,3,'2024-02-25',30000.00),(4,1,4,'2024-03-10',25000.00),(5,2,5,'2024-03-20',50000.00);
/*!40000 ALTER TABLE `purchaseorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `receivable`
--

LOCK TABLES `receivable` WRITE;
/*!40000 ALTER TABLE `receivable` DISABLE KEYS */;
INSERT INTO `receivable` VALUES (1,1,45000.00,'Completed'),(2,2,70000.00,'Completed'),(3,3,85000.00,'Pending'),(4,4,60000.00,'Pending'),(5,5,150000.00,'Pending');
/*!40000 ALTER TABLE `receivable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `saleorder`
--

LOCK TABLES `saleorder` WRITE;
/*!40000 ALTER TABLE `saleorder` DISABLE KEYS */;
INSERT INTO `saleorder` VALUES (1,1,'2024-01-15',45000.00),(2,2,'2024-02-01',70000.00),(3,3,'2024-02-20',85000.00),(4,4,'2024-03-05',60000.00),(5,1,'2024-03-15',150000.00);
/*!40000 ALTER TABLE `saleorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'WoodWorld','contact@woodworld.com'),(2,'DecorPro Egypt','support@decorpro.com'),(3,'MetalTech Solutions','info@metaltech.com');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (1,1,'Custom Sofa Design'),(2,1,'TV Unit Installation'),(3,2,'Wardrobe Setup'),(4,2,'Lighting Installation'),(5,3,'Conference Table Assembly'),(6,3,'Workspace Partitioning'),(7,4,'Dining Table Setup'),(8,4,'Cabinet Installation'),(9,5,'Flooring and Painting'),(10,5,'Furniture Setup');
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (1,'Living Room Specialists'),(2,'Bedroom Specialists'),(3,'Office Space Designers'),(4,'Dining Space Innovators'),(5,'Full Renovation Experts');
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-13  1:34:09
