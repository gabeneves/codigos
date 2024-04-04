CREATE DATABASE  IF NOT EXISTS `hospital` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hospital`;
-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: hospital
-- ------------------------------------------------------
-- Server version	8.0.36-0ubuntu0.22.04.1

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
-- Table structure for table `CONSULTA`
--

DROP TABLE IF EXISTS `CONSULTA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CONSULTA` (
  `Data_consulta` date NOT NULL,
  `Crm` char(9) DEFAULT NULL,
  `Valor_hora` double DEFAULT NULL,
  `Especialidade_nome` varchar(10) DEFAULT NULL,
  `Nome_medico` varchar(10) DEFAULT NULL,
  `Data_nascimento_medico` date DEFAULT NULL,
  `Logradouro_end_medico` varchar(15) DEFAULT NULL,
  `Numero_end_medico` int DEFAULT NULL,
  `Cep_end_medico` char(8) DEFAULT NULL,
  `Bairro_end_medico` varchar(15) DEFAULT NULL,
  `Cpf_paciente` char(11) DEFAULT NULL,
  `Plano_nome` varchar(10) DEFAULT NULL,
  `Plano_mensalidade` int DEFAULT NULL,
  `Nome_paciente` varchar(10) DEFAULT NULL,
  `Data_nascimento_paciente` date DEFAULT NULL,
  `Logradouro_end_paciente` varchar(15) DEFAULT NULL,
  `Numero_end_paciente` int DEFAULT NULL,
  `Cep_end_paciente` char(8) DEFAULT NULL,
  `Bairro_end_paciente` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`Data_consulta`),
  KEY `CHECRMMCONSULTA` (`Crm`),
  KEY `CHEVALORHRMCONSULTA` (`Valor_hora`),
  KEY `CHEESPMCONSULTA` (`Especialidade_nome`),
  KEY `CHENOMEMCONSULTA` (`Nome_medico`),
  KEY `CHEDATANASCMCONSULTA` (`Data_nascimento_medico`),
  KEY `CHELOGRAMCONSULTA` (`Logradouro_end_medico`),
  KEY `CHENUMMCONSULTA` (`Numero_end_medico`),
  KEY `CHECEPMCONSULTA` (`Cep_end_medico`),
  KEY `CHEBAIRROMCONSULTA` (`Bairro_end_medico`),
  KEY `CHPCPFPCONSULTA` (`Cpf_paciente`),
  KEY `CHENOMEPCONSULTA` (`Nome_paciente`),
  KEY `CHEDATANASCPCONSULTA` (`Data_nascimento_paciente`),
  KEY `CHELOGRAPCONSULTA` (`Logradouro_end_paciente`),
  KEY `CHENUMPCONSULTA` (`Numero_end_paciente`),
  KEY `CHECEPPCONSULTA` (`Cep_end_paciente`),
  KEY `CHEBAIRROPCONSULTA` (`Bairro_end_paciente`),
  KEY `CHENOMEPLANOPCONSULTA` (`Plano_nome`),
  KEY `CHEMENSPLANOPCONSULTA` (`Plano_mensalidade`),
  CONSTRAINT `CHEBAIRROMCONSULTA` FOREIGN KEY (`Bairro_end_medico`) REFERENCES `MEDICO` (`Bairro_end`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `CHEBAIRROPCONSULTA` FOREIGN KEY (`Bairro_end_paciente`) REFERENCES `PACIENTE` (`Bairro_end`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `CHECEPMCONSULTA` FOREIGN KEY (`Cep_end_medico`) REFERENCES `MEDICO` (`Cep_end`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `CHECEPPCONSULTA` FOREIGN KEY (`Cep_end_paciente`) REFERENCES `PACIENTE` (`Cep_end`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `CHECRMMCONSULTA` FOREIGN KEY (`Crm`) REFERENCES `MEDICO` (`Crm`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `CHEDATANASCMCONSULTA` FOREIGN KEY (`Data_nascimento_medico`) REFERENCES `MEDICO` (`Data_nascimento`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `CHEDATANASCPCONSULTA` FOREIGN KEY (`Data_nascimento_paciente`) REFERENCES `PACIENTE` (`Data_nascimento`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `CHEESPMCONSULTA` FOREIGN KEY (`Especialidade_nome`) REFERENCES `MEDICO` (`Especialidade_nome`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `CHELOGRAMCONSULTA` FOREIGN KEY (`Logradouro_end_medico`) REFERENCES `MEDICO` (`Logradouro_end`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `CHELOGRAPCONSULTA` FOREIGN KEY (`Logradouro_end_paciente`) REFERENCES `PACIENTE` (`Logradouro_end`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `CHEMENSPLANOPCONSULTA` FOREIGN KEY (`Plano_mensalidade`) REFERENCES `PACIENTE` (`Plano_mensalidade`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `CHENOMEMCONSULTA` FOREIGN KEY (`Nome_medico`) REFERENCES `MEDICO` (`Nome`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `CHENOMEPCONSULTA` FOREIGN KEY (`Nome_paciente`) REFERENCES `PACIENTE` (`Nome`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `CHENOMEPLANOPCONSULTA` FOREIGN KEY (`Plano_nome`) REFERENCES `PACIENTE` (`Plano_nome`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `CHENUMMCONSULTA` FOREIGN KEY (`Numero_end_medico`) REFERENCES `MEDICO` (`Numero_end`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `CHENUMPCONSULTA` FOREIGN KEY (`Numero_end_paciente`) REFERENCES `PACIENTE` (`Numero_end`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `CHEVALORHRMCONSULTA` FOREIGN KEY (`Valor_hora`) REFERENCES `MEDICO` (`Valor_hora`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `CHPCPFPCONSULTA` FOREIGN KEY (`Cpf_paciente`) REFERENCES `PACIENTE` (`Cpf`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CONSULTA`
--

LOCK TABLES `CONSULTA` WRITE;
/*!40000 ALTER TABLE `CONSULTA` DISABLE KEYS */;
/*!40000 ALTER TABLE `CONSULTA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ENDERECO`
--

DROP TABLE IF EXISTS `ENDERECO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ENDERECO` (
  `Logradouro_end` varchar(15) NOT NULL,
  `Numero_end` int NOT NULL,
  `Cep_end` char(8) NOT NULL,
  `Bairro_end` varchar(15) NOT NULL,
  PRIMARY KEY (`Logradouro_end`,`Numero_end`,`Cep_end`,`Bairro_end`),
  KEY `Idx_Numero_end` (`Numero_end`),
  KEY `Idx_Cep_end` (`Cep_end`),
  KEY `Idx_Bairro_end` (`Bairro_end`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ENDERECO`
--

LOCK TABLES `ENDERECO` WRITE;
/*!40000 ALTER TABLE `ENDERECO` DISABLE KEYS */;
/*!40000 ALTER TABLE `ENDERECO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ESPECIALIDADE`
--

DROP TABLE IF EXISTS `ESPECIALIDADE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ESPECIALIDADE` (
  `Especialidade_nome` varchar(10) NOT NULL,
  PRIMARY KEY (`Especialidade_nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ESPECIALIDADE`
--

LOCK TABLES `ESPECIALIDADE` WRITE;
/*!40000 ALTER TABLE `ESPECIALIDADE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ESPECIALIDADE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FARINGOPLASTIA`
--

DROP TABLE IF EXISTS `FARINGOPLASTIA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FARINGOPLASTIA` (
  `Mensagem` varchar(20) NOT NULL,
  PRIMARY KEY (`Mensagem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FARINGOPLASTIA`
--

LOCK TABLES `FARINGOPLASTIA` WRITE;
/*!40000 ALTER TABLE `FARINGOPLASTIA` DISABLE KEYS */;
/*!40000 ALTER TABLE `FARINGOPLASTIA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MEDICO`
--

DROP TABLE IF EXISTS `MEDICO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MEDICO` (
  `Crm` char(9) NOT NULL,
  `Valor_hora` double NOT NULL,
  `Especialidade_nome` varchar(10) DEFAULT NULL,
  `Nome` varchar(10) DEFAULT NULL,
  `Data_nascimento` date DEFAULT NULL,
  `Logradouro_end` varchar(15) DEFAULT NULL,
  `Numero_end` int DEFAULT NULL,
  `Cep_end` char(8) DEFAULT NULL,
  `Bairro_end` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`Crm`),
  KEY `Idx_valor_hora` (`Valor_hora`),
  KEY `CHEESPMEDICO` (`Especialidade_nome`),
  KEY `CHENOMEMEDICO` (`Nome`),
  KEY `CHEDATANASCMEDICO` (`Data_nascimento`),
  KEY `CHELOGRAMEDICO` (`Logradouro_end`),
  KEY `CHENUMMEDICO` (`Numero_end`),
  KEY `CHECEPMEDICO` (`Cep_end`),
  KEY `CHEBAIRROMEDICO` (`Bairro_end`),
  CONSTRAINT `CHEBAIRROMEDICO` FOREIGN KEY (`Bairro_end`) REFERENCES `PESSOA` (`Bairro_end`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `CHECEPMEDICO` FOREIGN KEY (`Cep_end`) REFERENCES `PESSOA` (`Cep_end`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `CHEDATANASCMEDICO` FOREIGN KEY (`Data_nascimento`) REFERENCES `PESSOA` (`Data_nascimento`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `CHEESPMEDICO` FOREIGN KEY (`Especialidade_nome`) REFERENCES `ESPECIALIDADE` (`Especialidade_nome`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `CHELOGRAMEDICO` FOREIGN KEY (`Logradouro_end`) REFERENCES `PESSOA` (`Logradouro_end`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `CHENOMEMEDICO` FOREIGN KEY (`Nome`) REFERENCES `PESSOA` (`Nome`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `CHENUMMEDICO` FOREIGN KEY (`Numero_end`) REFERENCES `PESSOA` (`Numero_end`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MEDICO`
--

LOCK TABLES `MEDICO` WRITE;
/*!40000 ALTER TABLE `MEDICO` DISABLE KEYS */;
/*!40000 ALTER TABLE `MEDICO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NEUROCIRURGIA`
--

DROP TABLE IF EXISTS `NEUROCIRURGIA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `NEUROCIRURGIA` (
  `Mensagem` varchar(20) NOT NULL,
  PRIMARY KEY (`Mensagem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NEUROCIRURGIA`
--

LOCK TABLES `NEUROCIRURGIA` WRITE;
/*!40000 ALTER TABLE `NEUROCIRURGIA` DISABLE KEYS */;
/*!40000 ALTER TABLE `NEUROCIRURGIA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PACIENTE`
--

DROP TABLE IF EXISTS `PACIENTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PACIENTE` (
  `Cpf` char(11) NOT NULL,
  `Plano_nome` varchar(10) DEFAULT NULL,
  `Plano_mensalidade` int DEFAULT NULL,
  `Nome` varchar(10) DEFAULT NULL,
  `Data_nascimento` date DEFAULT NULL,
  `Logradouro_end` varchar(15) DEFAULT NULL,
  `Numero_end` int DEFAULT NULL,
  `Cep_end` char(8) DEFAULT NULL,
  `Bairro_end` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`Cpf`),
  KEY `CHENOMEPACIENTE` (`Nome`),
  KEY `CHEDATANASCPACIENTE` (`Data_nascimento`),
  KEY `CHELOGRAPACIENTE` (`Logradouro_end`),
  KEY `CHENUMPACIENTE` (`Numero_end`),
  KEY `CHECEPPACIENTE` (`Cep_end`),
  KEY `CHEBAIRROPACIENTE` (`Bairro_end`),
  KEY `CHENOMEPLANOPACIENTE` (`Plano_nome`),
  KEY `CHEMENSPLANOPACIENTE` (`Plano_mensalidade`),
  CONSTRAINT `CHEBAIRROPACIENTE` FOREIGN KEY (`Bairro_end`) REFERENCES `PESSOA` (`Bairro_end`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `CHECEPPACIENTE` FOREIGN KEY (`Cep_end`) REFERENCES `PESSOA` (`Cep_end`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `CHEDATANASCPACIENTE` FOREIGN KEY (`Data_nascimento`) REFERENCES `PESSOA` (`Data_nascimento`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `CHELOGRAPACIENTE` FOREIGN KEY (`Logradouro_end`) REFERENCES `PESSOA` (`Logradouro_end`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `CHEMENSPLANOPACIENTE` FOREIGN KEY (`Plano_mensalidade`) REFERENCES `PLANO` (`Plano_mensalidade`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `CHENOMEPACIENTE` FOREIGN KEY (`Nome`) REFERENCES `PESSOA` (`Nome`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `CHENOMEPLANOPACIENTE` FOREIGN KEY (`Plano_nome`) REFERENCES `PLANO` (`Plano_nome`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `CHENUMPACIENTE` FOREIGN KEY (`Numero_end`) REFERENCES `PESSOA` (`Numero_end`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PACIENTE`
--

LOCK TABLES `PACIENTE` WRITE;
/*!40000 ALTER TABLE `PACIENTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `PACIENTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PESSOA`
--

DROP TABLE IF EXISTS `PESSOA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PESSOA` (
  `Nome` varchar(10) NOT NULL,
  `Data_nascimento` date NOT NULL,
  `Logradouro_end` varchar(15) DEFAULT NULL,
  `Numero_end` int DEFAULT NULL,
  `Cep_end` char(8) DEFAULT NULL,
  `Bairro_end` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`Nome`,`Data_nascimento`),
  KEY `Idx_Data_nascimento` (`Data_nascimento`),
  KEY `Idx_Logradouro_end` (`Logradouro_end`),
  KEY `Idx_Numero_end` (`Numero_end`),
  KEY `Idx_Cep_end` (`Cep_end`),
  KEY `Idx_Bairro_end` (`Bairro_end`),
  CONSTRAINT `CHEBAIRROPESSOA` FOREIGN KEY (`Bairro_end`) REFERENCES `ENDERECO` (`Bairro_end`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `CHECEPPESSOA` FOREIGN KEY (`Cep_end`) REFERENCES `ENDERECO` (`Cep_end`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `CHELOGRAPESSOA` FOREIGN KEY (`Logradouro_end`) REFERENCES `ENDERECO` (`Logradouro_end`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `CHENUMPESSOA` FOREIGN KEY (`Numero_end`) REFERENCES `ENDERECO` (`Numero_end`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PESSOA`
--

LOCK TABLES `PESSOA` WRITE;
/*!40000 ALTER TABLE `PESSOA` DISABLE KEYS */;
/*!40000 ALTER TABLE `PESSOA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PLANO`
--

DROP TABLE IF EXISTS `PLANO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PLANO` (
  `Plano_nome` varchar(10) NOT NULL,
  `Plano_mensalidade` int NOT NULL,
  PRIMARY KEY (`Plano_nome`),
  KEY `Idx_Plano_mensalidade` (`Plano_mensalidade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PLANO`
--

LOCK TABLES `PLANO` WRITE;
/*!40000 ALTER TABLE `PLANO` DISABLE KEYS */;
/*!40000 ALTER TABLE `PLANO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROCEDIMENTO`
--

DROP TABLE IF EXISTS `PROCEDIMENTO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROCEDIMENTO` (
  `Data_procedimento` date NOT NULL,
  `Valor` double NOT NULL,
  `Tempo_duracao` datetime NOT NULL,
  `Nome_sala` varchar(10) DEFAULT NULL,
  `Crm` char(9) DEFAULT NULL,
  `Valor_hora` double DEFAULT NULL,
  `Especialidade_nome` varchar(10) DEFAULT NULL,
  `Nome_medico` varchar(10) DEFAULT NULL,
  `Data_nascimento_medico` date DEFAULT NULL,
  `Logradouro_end_medico` varchar(15) DEFAULT NULL,
  `Numero_end_medico` int DEFAULT NULL,
  `Cep_end_medico` char(8) DEFAULT NULL,
  `Bairro_end_medico` varchar(15) DEFAULT NULL,
  `Cpf_paciente` char(11) DEFAULT NULL,
  `Plano_nome` varchar(10) DEFAULT NULL,
  `Plano_mensalidade` int DEFAULT NULL,
  `Nome_paciente` varchar(10) DEFAULT NULL,
  `Data_nascimento_paciente` date DEFAULT NULL,
  `Logradouro_end_paciente` varchar(15) DEFAULT NULL,
  `Numero_end_paciente` int DEFAULT NULL,
  `Cep_end_paciente` char(8) DEFAULT NULL,
  `Bairro_end_paciente` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`Data_procedimento`,`Tempo_duracao`),
  KEY `CHESALASPROCEDIMENTO` (`Nome_sala`),
  KEY `CHECRMMPROCEDIMENTO` (`Crm`),
  KEY `CHEVALORHRMPROCEDIMENTO` (`Valor_hora`),
  KEY `CHEESPMPROCEDIMENTO` (`Especialidade_nome`),
  KEY `CHENOMEMPROCEDIMENTO` (`Nome_medico`),
  KEY `CHEDATANASCMPROCEDIMENTO` (`Data_nascimento_medico`),
  KEY `CHELOGRAMPROCEDIMENTO` (`Logradouro_end_medico`),
  KEY `CHENUMMPROCEDIMENTO` (`Numero_end_medico`),
  KEY `CHECEPMPROCEDIMENTO` (`Cep_end_medico`),
  KEY `CHEBAIRROMPROCEDIMENTO` (`Bairro_end_medico`),
  KEY `CHPCPFPPROCEDIMENTO` (`Cpf_paciente`),
  KEY `CHENOMEPPROCEDIMENTO` (`Nome_paciente`),
  KEY `CHEDATANASCPPROCEDIMENTO` (`Data_nascimento_paciente`),
  KEY `CHELOGRAPPROCEDIMENTO` (`Logradouro_end_paciente`),
  KEY `CHENUMPPROCEDIMENTO` (`Numero_end_paciente`),
  KEY `CHECEPPPROCEDIMENTO` (`Cep_end_paciente`),
  KEY `CHEBAIRROPPROCEDIMENTO` (`Bairro_end_paciente`),
  KEY `CHENOMEPLANOPPROCEDIMENTO` (`Plano_nome`),
  KEY `CHEMENSPLANOPPROCEDIMENTO` (`Plano_mensalidade`),
  CONSTRAINT `CHEBAIRROMPROCEDIMENTO` FOREIGN KEY (`Bairro_end_medico`) REFERENCES `MEDICO` (`Bairro_end`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `CHEBAIRROPPROCEDIMENTO` FOREIGN KEY (`Bairro_end_paciente`) REFERENCES `PACIENTE` (`Bairro_end`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `CHECEPMPROCEDIMENTO` FOREIGN KEY (`Cep_end_medico`) REFERENCES `MEDICO` (`Cep_end`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `CHECEPPPROCEDIMENTO` FOREIGN KEY (`Cep_end_paciente`) REFERENCES `PACIENTE` (`Cep_end`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `CHECRMMPROCEDIMENTO` FOREIGN KEY (`Crm`) REFERENCES `MEDICO` (`Crm`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `CHEDATANASCMPROCEDIMENTO` FOREIGN KEY (`Data_nascimento_medico`) REFERENCES `MEDICO` (`Data_nascimento`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `CHEDATANASCPPROCEDIMENTO` FOREIGN KEY (`Data_nascimento_paciente`) REFERENCES `PACIENTE` (`Data_nascimento`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `CHEESPMPROCEDIMENTO` FOREIGN KEY (`Especialidade_nome`) REFERENCES `MEDICO` (`Especialidade_nome`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `CHELOGRAMPROCEDIMENTO` FOREIGN KEY (`Logradouro_end_medico`) REFERENCES `MEDICO` (`Logradouro_end`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `CHELOGRAPPROCEDIMENTO` FOREIGN KEY (`Logradouro_end_paciente`) REFERENCES `PACIENTE` (`Logradouro_end`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `CHEMENSPLANOPPROCEDIMENTO` FOREIGN KEY (`Plano_mensalidade`) REFERENCES `PACIENTE` (`Plano_mensalidade`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `CHENOMEMPROCEDIMENTO` FOREIGN KEY (`Nome_medico`) REFERENCES `MEDICO` (`Nome`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `CHENOMEPLANOPPROCEDIMENTO` FOREIGN KEY (`Plano_nome`) REFERENCES `PACIENTE` (`Plano_nome`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `CHENOMEPPROCEDIMENTO` FOREIGN KEY (`Nome_paciente`) REFERENCES `PACIENTE` (`Nome`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `CHENUMMPROCEDIMENTO` FOREIGN KEY (`Numero_end_medico`) REFERENCES `MEDICO` (`Numero_end`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `CHENUMPPROCEDIMENTO` FOREIGN KEY (`Numero_end_paciente`) REFERENCES `PACIENTE` (`Numero_end`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `CHESALASPROCEDIMENTO` FOREIGN KEY (`Nome_sala`) REFERENCES `SALA` (`Nome`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `CHEVALORHRMPROCEDIMENTO` FOREIGN KEY (`Valor_hora`) REFERENCES `MEDICO` (`Valor_hora`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `CHPCPFPPROCEDIMENTO` FOREIGN KEY (`Cpf_paciente`) REFERENCES `PACIENTE` (`Cpf`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROCEDIMENTO`
--

LOCK TABLES `PROCEDIMENTO` WRITE;
/*!40000 ALTER TABLE `PROCEDIMENTO` DISABLE KEYS */;
/*!40000 ALTER TABLE `PROCEDIMENTO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SALA`
--

DROP TABLE IF EXISTS `SALA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SALA` (
  `Nome` varchar(10) NOT NULL,
  PRIMARY KEY (`Nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SALA`
--

LOCK TABLES `SALA` WRITE;
/*!40000 ALTER TABLE `SALA` DISABLE KEYS */;
/*!40000 ALTER TABLE `SALA` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-18 10:13:07
