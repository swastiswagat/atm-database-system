
create database transaction1;
use transaction1;

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


DROP TABLE IF EXISTS `accountinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accountinfo` (
  `userId` int NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `user_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `role` int DEFAULT NULL,
  `status` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `bankID` int DEFAULT NULL,
  `ProfileUserID` int DEFAULT NULL,
  `CreateDate` date DEFAULT NULL,
  PRIMARY KEY (`userId`),
  KEY `FK_AccountInfo_BankService1` (`bankID`),
  KEY `FK_AccountInfo_ProfileUser` (`ProfileUserID`),
  CONSTRAINT `FK_AccountInfo_BankService1` FOREIGN KEY (`bankID`) REFERENCES `bankservice` (`id`),
  CONSTRAINT `FK_AccountInfo_ProfileUser` FOREIGN KEY (`ProfileUserID`) REFERENCES `profileuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `accountinfo` WRITE;
/*!40000 ALTER TABLE `accountinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `accountinfo` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `accountpayment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accountpayment` (
  `id` int NOT NULL,
  `PaymentInfo` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `userId` int DEFAULT NULL,
  `AccountPayment` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `surplus` decimal(10,0) DEFAULT NULL,
  `CreateDate` date DEFAULT NULL,
  `Status` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_AccountPayment_AccountInfo` (`userId`),
  CONSTRAINT `FK_AccountPayment_AccountInfo` FOREIGN KEY (`userId`) REFERENCES `accountinfo` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `accountpayment` WRITE;
/*!40000 ALTER TABLE `accountpayment` DISABLE KEYS */;
/*!40000 ALTER TABLE `accountpayment` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `accountsaving`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accountsaving` (
  `idSaving` int NOT NULL,
  `userId` int DEFAULT NULL,
  `AccountSaving` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `Money` decimal(10,0) DEFAULT NULL,
  `Status` int DEFAULT NULL,
  `type` int DEFAULT NULL,
  `CreateDate` date DEFAULT NULL,
  `Expire` date DEFAULT NULL,
  PRIMARY KEY (`idSaving`),
  KEY `FK_AccountSaving_AccountInfo` (`userId`),
  KEY `FK_AccountSaving_TypeACcountSaving` (`type`),
  CONSTRAINT `FK_AccountSaving_AccountInfo` FOREIGN KEY (`userId`) REFERENCES `accountinfo` (`userId`),
  CONSTRAINT `FK_AccountSaving_TypeACcountSaving` FOREIGN KEY (`type`) REFERENCES `typeaccountsaving` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accountsaving`
--

LOCK TABLES `accountsaving` WRITE;
/*!40000 ALTER TABLE `accountsaving` DISABLE KEYS */;
/*!40000 ALTER TABLE `accountsaving` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `bankservice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bankservice` (
  `id` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `status` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `CreateDate` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `bankservice` WRITE;
/*!40000 ALTER TABLE `bankservice` DISABLE KEYS */;
/*!40000 ALTER TABLE `bankservice` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `contactinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contactinfo` (
  `id` int NOT NULL,
  `partnerBank` int DEFAULT NULL,
  `ownerBankAccountId` int DEFAULT NULL,
  `bankname` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `aliasName` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `accountNum` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `CreateDate` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ContactInfo_BankService` (`partnerBank`),
  CONSTRAINT `FK_ContactInfo_BankService` FOREIGN KEY (`partnerBank`) REFERENCES `bankservice` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


LOCK TABLES `contactinfo` WRITE;
/*!40000 ALTER TABLE `contactinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `contactinfo` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `debt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `debt` (
  `id` int NOT NULL,
  `name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `money` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `userId` int DEFAULT NULL,
  `debt_val` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `note` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `status` int DEFAULT NULL,
  `createdDate` datetime(3) DEFAULT NULL,
  `userDebtId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Debt_AccountPayment` (`userId`),
  CONSTRAINT `FK_Debt_AccountPayment` FOREIGN KEY (`userId`) REFERENCES `accountpayment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `debt` WRITE;
/*!40000 ALTER TABLE `debt` DISABLE KEYS */;
/*!40000 ALTER TABLE `debt` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `idcard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `idcard` (
  `id` int NOT NULL,
  `IDNo` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `typename` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `IssuedOn` date DEFAULT NULL,
  `ExpireDate` date DEFAULT NULL,
  `Address` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `idcard` WRITE;
/*!40000 ALTER TABLE `idcard` DISABLE KEYS */;
/*!40000 ALTER TABLE `idcard` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `identity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `identity` (
  `id` int NOT NULL,
  `userId` int DEFAULT NULL,
  `refreshToken` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `CreateDate` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Identity_AccountInfo` (`userId`),
  CONSTRAINT `FK_Identity_AccountInfo` FOREIGN KEY (`userId`) REFERENCES `accountinfo` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `identity` WRITE;
/*!40000 ALTER TABLE `identity` DISABLE KEYS */;
/*!40000 ALTER TABLE `identity` ENABLE KEYS */;
UNLOCK TABLES;


DROP TABLE IF EXISTS `moneytransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `moneytransaction` (
  `trans_id` int NOT NULL,
  `accName` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `fromBankAccount` int DEFAULT NULL,
  `toBankAccount` int DEFAULT NULL,
  `amount` decimal(18,0) DEFAULT NULL,
  `note` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `transactionTime` datetime(3) DEFAULT NULL,
  `signature` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `type` int DEFAULT NULL,
  `partnerCode` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `status` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `surplus` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `CreateDate` date DEFAULT NULL,
  PRIMARY KEY (`trans_id`),
  KEY `FK_MoneyTransaction_AccountPayment` (`fromBankAccount`),
  KEY `FK_MoneyTransaction_ReceiverInfo` (`toBankAccount`),
  CONSTRAINT `FK_MoneyTransaction_AccountPayment` FOREIGN KEY (`fromBankAccount`) REFERENCES `accountpayment` (`id`),
  CONSTRAINT `FK_MoneyTransaction_ReceiverInfo` FOREIGN KEY (`toBankAccount`) REFERENCES `contactinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


LOCK TABLES `moneytransaction` WRITE;
/*!40000 ALTER TABLE `moneytransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `moneytransaction` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification` (
  `id` int NOT NULL,
  `recipientId` int DEFAULT NULL,
  `Message` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `senderId` int DEFAULT NULL,
  `senderName` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `receivename` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `CreateDate` date DEFAULT NULL,
  `Status` int DEFAULT NULL,
  `IsRead` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Notification_AccountInfo` (`senderId`),
  CONSTRAINT `FK_Notification_AccountInfo` FOREIGN KEY (`senderId`) REFERENCES `accountinfo` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `profileuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profileuser` (
  `id` int NOT NULL,
  `FirstName` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `LastName` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `MiddleName` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `PlaceOfPermanent` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `Phone` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `FullName` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `Image` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `IDCard` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ProfileUser_IDCard` (`IDCard`),
  CONSTRAINT `FK_ProfileUser_IDCard` FOREIGN KEY (`IDCard`) REFERENCES `idcard` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `profileuser` WRITE;
/*!40000 ALTER TABLE `profileuser` DISABLE KEYS */;
/*!40000 ALTER TABLE `profileuser` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` int NOT NULL,
  `Settings` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `Field` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `typeaccountsaving`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `typeaccountsaving` (
  `id` int NOT NULL,
  `determinative` int DEFAULT NULL,
  `Name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `interestrate` decimal(18,2) DEFAULT NULL,
  `Status` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `typeaccountsaving` WRITE;
/*!40000 ALTER TABLE `typeaccountsaving` DISABLE KEYS */;
/*!40000 ALTER TABLE `typeaccountsaving` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;