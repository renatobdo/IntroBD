CREATE DATABASE  IF NOT EXISTS `eleicoes` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `eleicoes`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: eleicoes
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `partido`
--

DROP TABLE IF EXISTS `partido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partido` (
  `sigla` varchar(20) NOT NULL,
  `nome` varchar(80) DEFAULT NULL,
  `nomeColigacao` int DEFAULT NULL,
  `dt_fundacao` date DEFAULT NULL,
  `presidente_nacional` varchar(100) DEFAULT NULL,
  `num_legenda` int DEFAULT NULL,
  PRIMARY KEY (`sigla`),
  KEY `fk_nomecoligacao` (`nomeColigacao`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partido`
--

LOCK TABLES `partido` WRITE;
/*!40000 ALTER TABLE `partido` DISABLE KEYS */;
INSERT INTO `partido` VALUES ('MDB','movimento democrático brasileiro',0,'1981-06-30','Luiz Felipe Baleia Tenuto Rossi',15),('PTB','partido trabalhista brasileiro',0,'1981-11-03','KASSYO SANTOS RAMOS',14),('PDT','partido democrático trabalhista',0,'1981-06-30',NULL,NULL),('PT','partido dos trabalhadores',0,'1981-06-30',NULL,NULL),('PCdoB','partido comunista do Brasil',0,'1981-06-30',NULL,NULL),('PSB','partido socialista Brasileiro',0,'1981-06-30',NULL,NULL),('PSDB','partido da social democracia Brasileira',0,'1981-06-30',NULL,NULL),('AGIR','agir',0,'1981-06-30',NULL,NULL),('PSC','partido social cristão',0,'1981-06-30',NULL,NULL),('PMN','partido da mobilização social',0,'1981-06-30',NULL,NULL),('cidadania','cidadania',0,'1981-06-30',NULL,NULL),('PV','partido verde',0,'1981-06-30',NULL,NULL),('AVANTE','avante',0,'1981-06-30',NULL,NULL),('PP','progressistas',0,'1981-06-30',NULL,NULL),('PSTU','partido socialista dos trabalhadores unificado',0,'1981-06-30',NULL,NULL),('PCB','partido comunista brasileiro',0,'1981-06-30',NULL,NULL),('PRTB','partido renovador trabalhista brasileiro',0,'1981-06-30',NULL,NULL),('DC','democracia cristã',0,'1981-06-30',NULL,NULL),('PCO','partido da causa operária',0,'1981-06-30',NULL,NULL),('PODE','podemos',0,'1981-06-30',NULL,NULL),('REPUBLICANOS','Republicanos',0,'1981-06-30',NULL,NULL),('PSOL','Partido Socialismo e Liberdade',0,'1981-06-30',NULL,NULL),('PL','Partido Liberal',0,'1981-06-30',NULL,NULL),('PSD','Partido Social Democrático',0,'1981-06-30',NULL,NULL),('PATRIOTA','Patriota',0,'1981-06-30',NULL,NULL),('PROS','Partido Republicano da Ordem Social',0,'1981-06-30',NULL,NULL),('SOLIDARIEDADE','Solidariedade',0,'1981-06-30',NULL,NULL),('NOVO','Partido Novo',0,'1981-06-30',NULL,NULL),('REDE','Rede Sustentabilidade',0,'1981-06-30',NULL,NULL),('PMB','Partido da mulher brasileira',0,'1981-06-30',NULL,NULL),('UP','Unidade Popular',0,'1981-06-30',NULL,NULL),('UNIÃO','União Brasil',0,'1981-06-30',NULL,NULL);
/*!40000 ALTER TABLE `partido` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-07 19:34:56
