-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: hotel_booking_management
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
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `idreservation` int NOT NULL AUTO_INCREMENT,
  `date_deb` date NOT NULL,
  `date_fin` date NOT NULL,
  `CIN` int NOT NULL,
  `idchambre` int NOT NULL,
  PRIMARY KEY (`idreservation`),
  KEY `CIN_idx` (`CIN`),
  KEY `idchambre_idx` (`idchambre`),
  CONSTRAINT `CIN` FOREIGN KEY (`CIN`) REFERENCES `client` (`CIN`),
  CONSTRAINT `idchambre` FOREIGN KEY (`idchambre`) REFERENCES `chambre` (`idchambre`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (1,'2025-04-20','2025-04-25',123456789,1),(3,'2025-04-09','2025-04-25',11000011,3),(4,'2025-04-15','2025-04-17',123456789,1),(8,'2025-06-07','2025-06-11',123456789,1),(9,'2025-06-01','2025-06-05',10000001,1),(10,'2025-06-10','2025-06-15',10000002,2),(11,'2025-06-20','2025-06-25',10000003,3),(12,'2025-07-01','2025-07-10',10000004,4),(13,'2025-07-15','2025-07-20',10000005,5),(14,'2025-08-01','2025-08-07',10000006,6),(15,'2025-08-10','2025-08-17',10000007,7),(16,'2025-09-01','2025-09-05',10000008,8),(17,'2025-09-10','2025-09-15',10000009,9),(18,'2025-10-01','2025-10-07',10000010,10),(19,'2025-05-08','2025-05-24',123456789,2),(20,'2025-05-08','2025-05-24',10000001,3),(21,'2025-05-08','2025-05-24',10000001,4),(22,'2025-05-04','2025-05-31',987654321,6),(23,'2025-05-06','2025-05-23',123456789,5),(24,'2025-05-15','2025-05-20',10000002,7),(25,'2025-05-16','2025-05-23',12345677,10);
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `archive_reservation` AFTER DELETE ON `reservation` FOR EACH ROW BEGIN
    INSERT INTO reservation_archive (
        idreservation, date_deb, date_fin, CIN, idchambre
    ) VALUES (
        OLD.idreservation, OLD.date_deb, OLD.date_fin, OLD.CIN, OLD.idchambre
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-18 22:06:31
