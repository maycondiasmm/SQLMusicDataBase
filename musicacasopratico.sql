-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: musica
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `albuns`
--

DROP TABLE IF EXISTS `albuns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `albuns` (
  `albumID` int(11) NOT NULL AUTO_INCREMENT,
  `albumNome` varchar(100) NOT NULL,
  `ano_lancamento` year(4) NOT NULL,
  `artistaID` int(11) DEFAULT NULL,
  `produtorID` int(11) DEFAULT NULL,
  PRIMARY KEY (`albumID`),
  KEY `fk_artistaid_idx` (`artistaID`),
  KEY `fk_produtorid_idx` (`produtorID`),
  CONSTRAINT `fk_artistaid` FOREIGN KEY (`artistaID`) REFERENCES `artistas` (`artistasID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_produtorid` FOREIGN KEY (`produtorID`) REFERENCES `produtores` (`produtorID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albuns`
--

LOCK TABLES `albuns` WRITE;
/*!40000 ALTER TABLE `albuns` DISABLE KEYS */;
INSERT INTO `albuns` VALUES (1,'Concentrado',1982,1,1),(2,'Brothers in Arms',1985,2,2),(3,'Making Movies',1980,2,2),(4,'Reckless 30th Anniversary',2014,3,3),(5,'Stadium Arcadium',2006,4,4);
/*!40000 ALTER TABLE `albuns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artistas`
--

DROP TABLE IF EXISTS `artistas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artistas` (
  `artistasID` int(11) NOT NULL AUTO_INCREMENT,
  `artistaNome` varchar(100) NOT NULL,
  PRIMARY KEY (`artistasID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artistas`
--

LOCK TABLES `artistas` WRITE;
/*!40000 ALTER TABLE `artistas` DISABLE KEYS */;
INSERT INTO `artistas` VALUES (1,'GNR'),(2,'Dire Straits'),(3,'Bryan Adams'),(4,'Red Hot Chili Peppers');
/*!40000 ALTER TABLE `artistas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compositores`
--

DROP TABLE IF EXISTS `compositores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compositores` (
  `compositorID` int(11) NOT NULL AUTO_INCREMENT,
  `compositorNome` varchar(100) NOT NULL,
  PRIMARY KEY (`compositorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compositores`
--

LOCK TABLES `compositores` WRITE;
/*!40000 ALTER TABLE `compositores` DISABLE KEYS */;
/*!40000 ALTER TABLE `compositores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compositores_musicas`
--

DROP TABLE IF EXISTS `compositores_musicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compositores_musicas` (
  `musicaID` int(11) DEFAULT NULL,
  `compositorID` int(11) DEFAULT NULL,
  KEY `fk_musicaid_idx` (`musicaID`),
  KEY `fk_compositorID_idx` (`compositorID`),
  CONSTRAINT `fk_compositorID` FOREIGN KEY (`compositorID`) REFERENCES `compositores` (`compositorID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_musicaid` FOREIGN KEY (`musicaID`) REFERENCES `musicas` (`musicaID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compositores_musicas`
--

LOCK TABLES `compositores_musicas` WRITE;
/*!40000 ALTER TABLE `compositores_musicas` DISABLE KEYS */;
/*!40000 ALTER TABLE `compositores_musicas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `info_walk_of_life`
--

DROP TABLE IF EXISTS `info_walk_of_life`;
/*!50001 DROP VIEW IF EXISTS `info_walk_of_life`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `info_walk_of_life` AS SELECT 
 1 AS `titulo`,
 1 AS `duracao`,
 1 AS `letra`,
 1 AS `album`,
 1 AS `artista`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `musicas`
--

DROP TABLE IF EXISTS `musicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `musicas` (
  `musicaID` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `duracao` time NOT NULL,
  `albumID` int(11) DEFAULT NULL,
  `letra` text DEFAULT NULL,
  PRIMARY KEY (`musicaID`),
  KEY `fk_albumID_idx` (`albumID`),
  CONSTRAINT `fk_albumID` FOREIGN KEY (`albumID`) REFERENCES `albuns` (`albumID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `musicas`
--

LOCK TABLES `musicas` WRITE;
/*!40000 ALTER TABLE `musicas` DISABLE KEYS */;
INSERT INTO `musicas` VALUES (1,'Dani California','04:42:00',5,NULL),(2,'Snow (Hey Oh)','05:35:00',5,NULL),(3,'Stadium Arcadium','05:15:00',5,NULL),(4,'Charlie','04:37:00',5,NULL),(5,'Hump de Bump','03:33:00',5,NULL),(6,'Walk of Life','04:12:00',2,'Here comes Johnny singing oldies, goldies\n\"Be-Bop-A-Lula, \" \"Baby What I Say\"\nHere comes Johnny singing, \"I Gotta Woman\"\nDown in the tunnels, trying to make it pay\nHe got the action, he got the motion\nYeah, the boy can play\nDedication, devotion\nTurning all the night time into the day\nHe do the song about the sweet lovin woman He do the song about the knife\nHe do the walk, do the walk of life\nYeah, he do the walk of life\nHere comes Johnny, gonna tell you the story\nHand me down my walkin shoes\nHere comes Johnny with the power and the glory\nBackbeat the talkin blues\nHe got the action, he got the motion\nYeah, the boy can play\nDedication, devotion\nTurning all the night time into the day\nThe song about the sweet lovin  woman\nHe do the song about the knife\nThen he do the walk, he do the walk of life\nYeah, he do the walk of life\nHere comes Johnny singing oldies, goldies\n\"Be-Bop-A-Lula, \" \"Baby What I Say\"\nHere comes Johnny singing, \"I Gotta Woman\"\nDown in the tunnels, trying to make it pay\nHe got the action, he got the motion\nYeah, the boy can play\nDedication, devotion\nTurning all the night time into the day\nAnd after all the violence and double talk\nThere s just a song in all the trouble and the strife\nYou do the walk, yeah, you do the walk of life\nHmm, you do the walk of life'),(7,'So Far Away','03:58:00',2,NULL),(8,'Reckless','05:10:00',4,NULL),(9,'One Night Love Affair','04:33:00',4,NULL),(10,'She’s Only Happy When She’s Dancin’','03:55:00',4,NULL),(11,'Run to You','03:53:00',4,NULL),(12,'Heaven','04:03:00',4,NULL),(13,'Somebody','04:44:00',4,NULL),(14,'Summer of ’69','03:35:00',4,NULL),(15,'Kids Wanna Rock','02:36:00',4,NULL),(16,'It’s Only Love','03:15:00',4,NULL),(17,'Long Gone','03:58:00',4,NULL),(18,'Ain’t Gonna Cry','04:07:00',4,NULL),(19,'Reckless','04:30:00',4,NULL),(20,'Teacher Teacher','03:44:00',4,NULL),(21,'The Boys Night Out','03:49:00',4,NULL),(22,'Draw the Line','03:25:00',4,NULL),(23,'Play to Win','03:28:00',4,NULL),(24,'Let Me Down Easy','04:07:00',4,NULL),(25,'Too Hot to Handle','04:01:00',4,NULL);
/*!40000 ALTER TABLE `musicas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `musicos`
--

DROP TABLE IF EXISTS `musicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `musicos` (
  `musicoID` int(11) NOT NULL AUTO_INCREMENT,
  `musicoNome` varchar(100) NOT NULL,
  PRIMARY KEY (`musicoID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `musicos`
--

LOCK TABLES `musicos` WRITE;
/*!40000 ALTER TABLE `musicos` DISABLE KEYS */;
/*!40000 ALTER TABLE `musicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `musicos_musicas`
--

DROP TABLE IF EXISTS `musicos_musicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `musicos_musicas` (
  `musicaID` int(11) NOT NULL,
  `musicoID` int(11) DEFAULT NULL,
  KEY `fk_musicaID_idx` (`musicaID`),
  KEY `fk_musicoID_idx` (`musicoID`),
  CONSTRAINT `fk_musicaID_musicas` FOREIGN KEY (`musicaID`) REFERENCES `musicas` (`musicaID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_musicoID_musicos` FOREIGN KEY (`musicoID`) REFERENCES `musicos` (`musicoID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `musicos_musicas`
--

LOCK TABLES `musicos_musicas` WRITE;
/*!40000 ALTER TABLE `musicos_musicas` DISABLE KEYS */;
/*!40000 ALTER TABLE `musicos_musicas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtores`
--

DROP TABLE IF EXISTS `produtores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtores` (
  `produtorID` int(11) NOT NULL AUTO_INCREMENT,
  `produtorNome` varchar(100) NOT NULL,
  PRIMARY KEY (`produtorID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtores`
--

LOCK TABLES `produtores` WRITE;
/*!40000 ALTER TABLE `produtores` DISABLE KEYS */;
INSERT INTO `produtores` VALUES (1,'Produtor GNR'),(2,'Produtor Dire Straits'),(3,'Produtor Bryan Adams'),(4,'Produtor RHCP');
/*!40000 ALTER TABLE `produtores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `info_walk_of_life`
--

/*!50001 DROP VIEW IF EXISTS `info_walk_of_life`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `info_walk_of_life` AS select `m`.`titulo` AS `titulo`,`m`.`duracao` AS `duracao`,`m`.`letra` AS `letra`,`a`.`albumNome` AS `album`,`ar`.`artistaNome` AS `artista` from ((`musicas` `m` join `albuns` `a` on(`m`.`albumID` = `a`.`albumID`)) join `artistas` `ar` on(`a`.`artistaID` = `ar`.`artistasID`)) where `m`.`titulo` = 'Walk of Life' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-18 20:50:18
