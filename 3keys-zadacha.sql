CREATE DATABASE  IF NOT EXISTS `tyrizm` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `tyrizm`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: tyrizm
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `клиент`
--

DROP TABLE IF EXISTS `клиент`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `клиент` (
  `idКлиент` int NOT NULL AUTO_INCREMENT,
  `ФИО` varchar(65) NOT NULL,
  `Конт.данные` varchar(45) NOT NULL,
  `Паспорт` varchar(45) NOT NULL,
  PRIMARY KEY (`idКлиент`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `клиент`
--

LOCK TABLES `клиент` WRITE;
/*!40000 ALTER TABLE `клиент` DISABLE KEYS */;
/*!40000 ALTER TABLE `клиент` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `направление`
--

DROP TABLE IF EXISTS `направление`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `направление` (
  `idНаправление` int NOT NULL AUTO_INCREMENT,
  `Страна` varchar(65) NOT NULL,
  `Регион` varchar(65) NOT NULL,
  `Город` varchar(45) NOT NULL,
  PRIMARY KEY (`idНаправление`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `направление`
--

LOCK TABLES `направление` WRITE;
/*!40000 ALTER TABLE `направление` DISABLE KEYS */;
/*!40000 ALTER TABLE `направление` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `перечень услуг`
--

DROP TABLE IF EXISTS `перечень услуг`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `перечень услуг` (
  `idПеречень услуг` int NOT NULL AUTO_INCREMENT,
  `Экскурсии` varchar(45) DEFAULT NULL,
  `Услуги гида` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idПеречень услуг`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `перечень услуг`
--

LOCK TABLES `перечень услуг` WRITE;
/*!40000 ALTER TABLE `перечень услуг` DISABLE KEYS */;
/*!40000 ALTER TABLE `перечень услуг` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `размещение`
--

DROP TABLE IF EXISTS `размещение`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `размещение` (
  `idРазмещение` int NOT NULL AUTO_INCREMENT,
  `Отель` varchar(45) DEFAULT NULL,
  `Хостел` varchar(45) DEFAULT NULL,
  `Кемпинг` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idРазмещение`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `размещение`
--

LOCK TABLES `размещение` WRITE;
/*!40000 ALTER TABLE `размещение` DISABLE KEYS */;
/*!40000 ALTER TABLE `размещение` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `тур`
--

DROP TABLE IF EXISTS `тур`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `тур` (
  `idТур` int NOT NULL AUTO_INCREMENT,
  `Клиент` int NOT NULL,
  `Размещение` int NOT NULL,
  `Перечень услуг` int NOT NULL,
  `Направление` int NOT NULL,
  `Виза` varchar(45) NOT NULL,
  `Дата тура` datetime NOT NULL,
  PRIMARY KEY (`idТур`),
  KEY `fk_Тур_Клиент_idx` (`Клиент`),
  KEY `fk_Тур_Размещение1_idx` (`Размещение`),
  KEY `fk_Тур_Перечень услуг1_idx` (`Перечень услуг`),
  KEY `fk_Тур_Направление1_idx` (`Направление`),
  CONSTRAINT `fk_Тур_Клиент` FOREIGN KEY (`Клиент`) REFERENCES `клиент` (`idКлиент`),
  CONSTRAINT `fk_Тур_Направление1` FOREIGN KEY (`Направление`) REFERENCES `направление` (`idНаправление`),
  CONSTRAINT `fk_Тур_Перечень услуг1` FOREIGN KEY (`Перечень услуг`) REFERENCES `перечень услуг` (`idПеречень услуг`),
  CONSTRAINT `fk_Тур_Размещение1` FOREIGN KEY (`Размещение`) REFERENCES `размещение` (`idРазмещение`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `тур`
--

LOCK TABLES `тур` WRITE;
/*!40000 ALTER TABLE `тур` DISABLE KEYS */;
/*!40000 ALTER TABLE `тур` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'tyrizm'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-09 18:04:54
