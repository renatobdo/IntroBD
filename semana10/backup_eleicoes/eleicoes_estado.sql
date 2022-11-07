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
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado` (
  `sigla_Estado` varchar(2) NOT NULL,
  `nome` varchar(80) DEFAULT NULL,
  `capital` varchar(100) DEFAULT NULL,
  `nomeColigacao` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`sigla_Estado`),
  KEY `fk_estadoPartido` (`nomeColigacao`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES ('AC','Acre','Rio Branco',''),('AL','Alagoas','Maceió',''),('AM','Amazonas','Manaus',''),('AP','Amapá','Macapa',''),('BA','Bahia','Salvador',''),('CE','Ceará','Fortaleza',''),('DF','Distrito Federal','Brasília',''),('ES','Espírito Santo','Vitória',''),('GO','Goiás','Goiânia',''),('MA','Maranhão','São Luís',''),('MG','Minas Gerais','Belo Horizonte',''),('MS','Mato Grosso do Sul','Campo Grande',''),('MT','Mato Grosso','Cuiabá',''),('PA','Pará','Belém',''),('PB','Paraíba','João Pessoa',''),('PE','Pernambuco','Recife',''),('PI','Piauí','Teresina',''),('PR','Paraná','Curitiba',''),('RJ','Rio de Janeiro','Rio de Janeiro',''),('RN','Rio Grande do Norte','Natal',''),('RO','Rondônia','Porto Velho',''),('RR','Roraima','Boa Vista',''),('RS','Rio Grande do Sul','Porto Alegre',''),('SC','Santa Catarina','Florianópolis',''),('SE','Sergipe','Aracaju',''),('SP','São Paulo','São Paulo',''),('TO','Tocantins','Palmas','');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-07 19:34:57
