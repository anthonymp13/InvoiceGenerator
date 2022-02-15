/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
DROP TABLE IF EXISTS `company`;
# /*!40101 SET @saved_cs_client     = @@character_set_client */;
# /*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
                           `id` int NOT NULL AUTO_INCREMENT,
                           `companyName` varchar(32) NOT NULL,
                           `address` varchar(32) DEFAULT NULL,
                           `city` varchar(32) DEFAULT NULL,
                           `state` varchar(32) DEFAULT NULL,
                           `zip` int DEFAULT NULL,
                           `phoneNumber` varchar(32) DEFAULT NULL,
                           PRIMARY KEY (`id`)
);

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1,'Hauser Tree Care','741 ruskin st','Madison','Wisconsin',53704,'608-598-9342');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
                            `id` int NOT NULL AUTO_INCREMENT,
                            `firstName` varchar(32) NOT NULL,
                            `lastName` varchar(32) NOT NULL,
                            `street` varchar(32) NOT NULL,
                            `postalCode` int NOT NULL,
                            `city` varchar(32) NOT NULL,
                            `countryId` varchar(32) NOT NULL,
                            `state` varchar(32) NOT NULL,
                            `phoneNumber` varchar(32) DEFAULT NULL,
                            `email` varchar(32) DEFAULT NULL,
                            `companyId` int NOT NULL,
                            PRIMARY KEY (`id`),
                            KEY `customer_company_id_fk` (`companyId`),
                            CONSTRAINT `customer_company_id_fk` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`)
);

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Tim','Weisman','5222 Milwaukee Street',53704,'Madison','BE','Wisconsin',NULL,NULL,1);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;

CREATE TABLE `invoice` (
                           `id` int NOT NULL AUTO_INCREMENT,
                           `invoiceDate` date DEFAULT NULL,
                           `customerId` int NOT NULL,
                           `terms` varchar(32) NOT NULL,
                           `total` double DEFAULT NULL,
                           PRIMARY KEY (`id`),
                           KEY `invoice_customer_id_fk` (`customerId`),
                           CONSTRAINT `invoice_customer_id_fk` FOREIGN KEY (`customerId`) REFERENCES `customer` (`id`)
) ;

-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
INSERT INTO `invoice` VALUES (1,'2020-02-26',1,'Due upon receipt',1500);
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
                           `id` int NOT NULL AUTO_INCREMENT,
                           `name` varchar(32) NOT NULL,
                           `price` int NOT NULL,
                           `vat` int NOT NULL,
                           PRIMARY KEY (`id`),
                           UNIQUE KEY `Product_id_uindex` (`id`)
);

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Remove oak tree',1500,20);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;

CREATE TABLE `item` (
                        `id` int NOT NULL AUTO_INCREMENT,
                        `item` int NOT NULL,
                        `productId` int NOT NULL,
                        `invoiceId` int NOT NULL,
                        `quantity` int NOT NULL,
                        `cost` double DEFAULT NULL,
                        PRIMARY KEY (`id`),
                        UNIQUE KEY `item_id_uindex` (`id`),
                        KEY `item_invoice_id_fk` (`invoiceId`),
                        KEY `item_product_id_fk` (`productId`),
                        CONSTRAINT `item_invoice_id_fk` FOREIGN KEY (`invoiceId`) REFERENCES `invoice` (`id`),
                        CONSTRAINT `item_product_id_fk` FOREIGN KEY (`productId`) REFERENCES `product` (`id`)
);

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,1,1,1,2,1500);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;
--


--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
                        `id` int NOT NULL AUTO_INCREMENT,
                        `userName` varchar(32) NOT NULL,
                        `password` varchar(32) NOT NULL,
                        `firstName` varchar(32) NOT NULL,
                        `lastName` varchar(32) NOT NULL,
                        `companyId` int NOT NULL,
                        PRIMARY KEY (`id`),
                        UNIQUE KEY `user_userName_uindex` (`userName`),
                        KEY `user_company_id_fk` (`companyId`),
                        CONSTRAINT `user_company_id_fk` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE
);

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'anthonyp','giggity','Anthony','Poleski',1),(2,'thomast','thomastp','Thomas','Thomas',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
                             `id` int NOT NULL AUTO_INCREMENT,
                             `userName` varchar(32) NOT NULL,
                             `role_name` varchar(32) NOT NULL,
                             `userId` int NOT NULL,
                             PRIMARY KEY (`id`),
                             KEY `user_role_user_id_fk` (`userId`),
                             CONSTRAINT `user_role_user_id_fk` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE
);

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,'anthonyp','admin',1),(2,'thomast','basic',2);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;


-- Dump completed on 2020-04-26 20:45:02
