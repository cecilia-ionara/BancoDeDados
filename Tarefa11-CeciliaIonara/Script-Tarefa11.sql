-- MySQL dump 10.13  Distrib 8.0.34, for macos13 (arm64)
--
-- Host: 127.0.0.1    Database: hugo
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `Animal`
--

DROP TABLE IF EXISTS `Animal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Animal` (
  `idAnimal` int NOT NULL,
  `nome` varchar(45) NOT NULL,
  `peso` float NOT NULL,
  `cor` varchar(45) NOT NULL,
  `raca` varchar(45) DEFAULT NULL,
  `anoNascimento` int NOT NULL,
  `idTutor` int NOT NULL,
  `idChip` int DEFAULT NULL,
  PRIMARY KEY (`idAnimal`,`idTutor`),
  KEY `fk_Animal_Tutor_idx` (`idTutor`),
  KEY `fk_Animal_ChipIdentificacao1_idx` (`idChip`),
  CONSTRAINT `fk_Animal_ChipIdentificacao1` FOREIGN KEY (`idChip`) REFERENCES `ChipIdentificacao` (`idChip`),
  CONSTRAINT `fk_Animal_Tutor` FOREIGN KEY (`idTutor`) REFERENCES `Tutor` (`idTutor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Animal`
--

LOCK TABLES `Animal` WRITE;
/*!40000 ALTER TABLE `Animal` DISABLE KEYS */;
INSERT INTO `Animal` VALUES (13,'Banguela',1.7,'Amarelo',NULL,2020,3,NULL),(24,'Pistola',3.7,'Caramelo',NULL,2016,1,NULL),(33,'Manchinha',4,'Preta','Siames',2019,6,15),(47,'Luke',4.5,'Cinza','Maine Coon',2017,1,NULL),(51,'Simba',2.3,'Branco',NULL,2021,4,NULL),(65,'Mingau',1.8,'Branco','Chihuahua',2019,4,12),(71,'Sushi',3.5,'Amarelo','Maine Coon',2020,3,87),(72,'Spike',10,'Preto','Rottweiler',2017,5,NULL),(74,'Fubá',2.7,'Amarelo',NULL,2019,2,NULL),(85,'Sansa',1,'Rajado','Siames',2020,1,NULL),(99,'Teela',5,'Dourado','Golden Retriever',2021,2,33);
/*!40000 ALTER TABLE `Animal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ChipIdentificacao`
--

DROP TABLE IF EXISTS `ChipIdentificacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ChipIdentificacao` (
  `idChip` int NOT NULL,
  `codigoChip` varchar(45) NOT NULL,
  `dataAplicacao` date NOT NULL,
  PRIMARY KEY (`idChip`),
  UNIQUE KEY `codigoChip_UNIQUE` (`codigoChip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ChipIdentificacao`
--

LOCK TABLES `ChipIdentificacao` WRITE;
/*!40000 ALTER TABLE `ChipIdentificacao` DISABLE KEYS */;
INSERT INTO `ChipIdentificacao` VALUES (12,'4293890','2010-10-12'),(15,'9234298','2021-11-02'),(33,'2938293','2020-08-24'),(87,'9287323','2021-09-27');
/*!40000 ALTER TABLE `ChipIdentificacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tutor`
--

DROP TABLE IF EXISTS `Tutor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tutor` (
  `idTutor` int NOT NULL,
  `nome` varchar(45) NOT NULL,
  `telefone` varchar(45) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idTutor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tutor`
--

LOCK TABLES `Tutor` WRITE;
/*!40000 ALTER TABLE `Tutor` DISABLE KEYS */;
INSERT INTO `Tutor` VALUES (1,'Ana','94-991230987','joao@acme.com'),(2,'Joaquim','91-991238765',NULL),(3,'Mariana','94-992348907','mariana@acme.com'),(4,'Pedro','91-981482585','pedro@acme.com'),(5,'Tainá','94-983456789','taina@acme.com'),(6,'Carlos','91-991245689','carlos@acme.com'),(7,'Carina','94-99121-4567',NULL);
/*!40000 ALTER TABLE `Tutor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-25  9:55:19
