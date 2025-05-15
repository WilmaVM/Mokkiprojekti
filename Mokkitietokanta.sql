CREATE DATABASE  IF NOT EXISTS `mokkikodit` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mokkikodit`;
-- MySQL dump 10.13  Distrib 8.0.42, for macos15 (x86_64)
--
-- Host: localhost    Database: mokkikodit
-- ------------------------------------------------------
-- Server version	9.3.0

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
-- Table structure for table `Asiakas`
--

DROP TABLE IF EXISTS `Asiakas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Asiakas` (
  `asiakas_id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `nimi` varchar(100) DEFAULT NULL,
  `puhelin` varchar(20) DEFAULT NULL,
  `sahkoposti` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`asiakas_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lasku`
--

DROP TABLE IF EXISTS `lasku`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lasku` (
  `lasku_id` int NOT NULL AUTO_INCREMENT,
  `varaus_id` char(8) DEFAULT NULL,
  `summa` decimal(10,2) DEFAULT NULL,
  `erapaiva` date DEFAULT NULL,
  `maksupaiva` date DEFAULT NULL,
  PRIMARY KEY (`lasku_id`),
  KEY `FK_lasku_varaus` (`varaus_id`),
  CONSTRAINT `FK_lasku_varaus` FOREIGN KEY (`varaus_id`) REFERENCES `varaus` (`varaus_id`) ON DELETE CASCADE,
  CONSTRAINT `lasku_ibfk_1` FOREIGN KEY (`varaus_id`) REFERENCES `Varaus` (`varaus_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8999 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Mokit`
--

DROP TABLE IF EXISTS `Mokit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Mokit` (
  `mokki_id` char(3) NOT NULL,
  `osoite` varchar(255) DEFAULT NULL,
  `hinta` decimal(10,2) DEFAULT NULL,
  `varustelu` varchar(255) DEFAULT NULL,
  `kapasiteetti` int DEFAULT NULL,
  PRIMARY KEY (`mokki_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Data for table `Mokit`
--

INSERT INTO `Mokit` (`mokki_id`, `osoite`, `hinta`, `varustelu`, `kapasiteetti`) VALUES
(101, 'Kemppistie 21, 80110 Koli', 590, 'Suihku', 4),
(102, 'Ylisraitti 1017, 80330 Nurmes', 620, 'Suihku, Sauna', 4),
(103, 'Majavalammentie 382, 80120 Patvinsuo', 700, 'Suihku, Sauna', 6),
(104, 'Taivaltunnel 111, 80200 Tuusniemi', 1200, 'Suihku, Sauna, Poreamme', 10),
(105, 'Sammalpolku 6, 80220 Kesälahti', 1000, 'Suihku, Sauna, Poreamme', 8),
(106, 'Telekientie 66, 80310 Heinävaara', 850, 'Suihku, Sauna, Poreamme', 5);
--
-- Table structure for table `varaus`
--

DROP TABLE IF EXISTS `varaus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `varaus` (
  `varaus_id` char(8) NOT NULL,
  `asiakas_id` tinyint unsigned DEFAULT NULL,
  `mokki_id` char(3) DEFAULT NULL,
  `aloitus_pvm` date DEFAULT NULL,
  `paattymis_pvm` date DEFAULT NULL,
  `kesto` varchar(255) DEFAULT NULL,
  `varaajan_nimi` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`varaus_id`),
  KEY `mokki_id` (`mokki_id`),
  KEY `varaus_ibfk_1` (`asiakas_id`),
  CONSTRAINT `varaus_ibfk_1` FOREIGN KEY (`asiakas_id`) REFERENCES `asiakas` (`asiakas_id`) ON DELETE CASCADE,
  CONSTRAINT `varaus_ibfk_2` FOREIGN KEY (`mokki_id`) REFERENCES `Mokit` (`mokki_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
