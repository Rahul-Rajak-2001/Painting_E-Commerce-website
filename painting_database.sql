-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: painting
-- ------------------------------------------------------
-- Server version	8.0.26

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

--
-- Table structure for table `adminmessagecustomer`
--

DROP TABLE IF EXISTS `adminmessagecustomer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adminmessagecustomer` (
  `cust_id` int DEFAULT NULL,
  `customer_name` varchar(60) DEFAULT NULL,
  `message` varchar(100) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `cust_id` (`cust_id`),
  CONSTRAINT `adminmessagecustomer_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminmessagecustomer`
--

LOCK TABLES `adminmessagecustomer` WRITE;
/*!40000 ALTER TABLE `adminmessagecustomer` DISABLE KEYS */;
INSERT INTO `adminmessagecustomer` VALUES (35,'Rahul Rajak','Due to some techanical issue your mobile number is not display after some time it will display','2024-06-28 03:43:05'),(35,'Rahul Rajak','Hey, We hope that your query is resolved. Please provide feedback!','2024-07-07 12:02:51'),(45,'Rahul Rajak','ok I got your message Your issue will be solved after some time','2025-01-22 14:24:38'),(45,'Rahul Rajak','baba','2025-01-27 14:59:24');
/*!40000 ALTER TABLE `adminmessagecustomer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adminmessageseller`
--

DROP TABLE IF EXISTS `adminmessageseller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adminmessageseller` (
  `seller_id` int DEFAULT NULL,
  `seller_name` varchar(50) DEFAULT NULL,
  `message` text,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `seller_id` (`seller_id`),
  CONSTRAINT `adminmessageseller_ibfk_1` FOREIGN KEY (`seller_id`) REFERENCES `seller` (`seller_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminmessageseller`
--

LOCK TABLES `adminmessageseller` WRITE;
/*!40000 ALTER TABLE `adminmessageseller` DISABLE KEYS */;
INSERT INTO `adminmessageseller` VALUES (56,'Mandar Marathi','hello','2024-05-23 12:43:53'),(56,'Mandar Marathi','ok I got your message Your issue will be solved after some time','2024-05-23 12:44:05'),(56,'Mandar Marathi','hello','2024-05-23 12:44:17'),(56,'Mandar Marathi','hello','2024-06-23 14:14:01'),(65,'Avinash sinha','your issue wil be solved within 24 hours','2024-06-28 02:59:05'),(65,'Avinash sinha','Due to some techanical problem updated quantity  not display now, but quantity will be update, After sometime it will display','2024-06-28 03:05:01'),(65,'Avinash sinha','ok I got your message Your issue will be solved after some time','2025-01-27 14:57:49');
/*!40000 ALTER TABLE `adminmessageseller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `cart_id` int NOT NULL AUTO_INCREMENT,
  `cust_id` int DEFAULT NULL,
  `painting_id` int DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `painting_name` varchar(50) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `price` varchar(30) DEFAULT NULL,
  `total` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `cust_id` (`cust_id`),
  KEY `painting_id` (`painting_id`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`),
  CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`painting_id`) REFERENCES `painting` (`painting_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1043 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1036,45,234,'ganesha watercolor art.jpg','Ganesha watercolour Art',2,'1999','3998'),(1037,45,286,'subset at beach art.jpg','Sunset at beach',1,'999','999'),(1038,45,277,'mahadev abstract art.webp','Mahadev Abstract Art',1,'1499','1499'),(1039,35,252,'wall art for dining room.jpg','Wall Art Dinning room',1,'999','999'),(1040,35,253,'Abstract_art_for_your_dining_room.webp','Abstract Art',2,'799','1598'),(1041,35,254,'acylic wall art.jpg','Acrylic Wall Art',2,'1499','2998'),(1042,35,301,'canvas autumn forest.jpg','Canvas Autum Forest',2,'1499','2998');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `cust_id` int NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(30) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mobile_no` bigint DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `pincode` int DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `con_password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cust_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (35,'Rahul Rajak','rahul.raj@gmail.com',7903847273,'Jharkhand',' Dhanbad ','Krishna Nagar Cooperative colony',826005,'aaa','aaa'),(36,'Akash Sinha','akash12@gmail.com',9976342322,'West Bengal',' Durgapur ','Bidhan Nagar market',782323,'111','111'),(40,'Manitosh Paul','manitoshpal12@gmail.com',7856342324,'Jharkhand',' Jamshedpur ','1/1 telco',831004,'aaa','aaa'),(42,'Ashutosh Choudhary ','ashutosh123@gmail.com',9876543210,'Bihar',' Purena ','Madhubani Near Ice Factory ',854301,'aaa','aaa'),(43,'shree ganesh','shreeganesh@gmail.com',8754237632,'Bihar',' Banka ','Girja chowk bhatta bazar',854203,'aaa','aaa'),(45,'Rahul Rajak','rahul.raj1@gmail.com',9897668891,'Gujarat',' Anand ','Krishna Nagar Cooperative colony',826005,'aaa','aaa');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `cust_id` int DEFAULT NULL,
  `customer_name` varchar(60) DEFAULT NULL,
  `message` text,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `cust_id` (`cust_id`),
  CONSTRAINT `message_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (35,'Rahul Rajak','In my profile my mobile number is not display','2024-06-28 03:41:32'),(35,'Rahul Rajak','yes, now my mobile number display properly','2024-07-11 13:10:45'),(35,'Rahul Rajak','ok I got it','2024-07-16 16:05:56'),(45,'Rahul Rajak','My name is Rahul Rajak and I have update my address but in my profile old address is shown...please solve this issue','2025-01-22 14:11:23'),(45,'Rahul Rajak','java ','2025-01-27 14:58:50');
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `cust_id` int DEFAULT NULL,
  `Painting_image` varchar(100) DEFAULT NULL,
  `painting_name` varchar(100) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `price` varchar(30) DEFAULT NULL,
  `status` varchar(50) DEFAULT 'pending',
  `order_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `cancel_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `cust_id` (`cust_id`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`)
) ENGINE=InnoDB AUTO_INCREMENT=461 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (448,35,'Durga_Mata_Devotion_Painting.jpg','Maa Durga Art',1,'2999.0','Confirm','2024-06-28 12:04:37',NULL),(449,35,'abstract-painting-with-vibrant-colors_.avif','abstract Vibrant colour art',1,'1499.0','Cancelled','2024-06-28 12:06:28','Changed my mind'),(450,35,'colorful abstract art.webp','Colourful Absract Art',1,'499.0','Cancelled','2024-06-28 12:06:28','Product not needed anymore'),(451,35,'oil painting with colourful flower.webp','Colourful Oil painting',1,'1999.0','Shipped','2024-06-28 12:56:59',NULL),(452,35,'abstract art of flower.webp','Abstract  Flower Art ',2,'3998.0','Confirm','2024-06-28 12:56:59',NULL),(453,36,'Mix colour painting of Lord Krishna.jpg','Krishna Art',1,'800.0','Shipped','2024-06-28 13:15:44',NULL),(454,43,'Lord-Ganesha-Painting.jpg','Lord ganesha Art',1,'999.0','Delivered','2024-07-07 17:30:09',NULL),(455,43,'chaturbhuja lord ganesha.webp','chaturbhujha lord ganesha',1,'1999.0','Confirm','2024-07-07 17:30:09',NULL),(458,35,'oil painting with colourful flower.webp','Colourful Oil painting',2,'3998.0','Cancelled','2024-07-16 21:33:37','Changed my mind'),(459,35,'maruti painting.avif','Maruti Painting',1,'999.0','Confirm','2025-03-18 11:09:02',NULL),(460,35,'lord Hanuman.jpg','Lord Hanuman',2,'3998.0','Confirm','2025-03-18 11:09:02',NULL);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `painting`
--

DROP TABLE IF EXISTS `painting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `painting` (
  `painting_id` int NOT NULL AUTO_INCREMENT,
  `seller_id` int DEFAULT NULL,
  `painting_name` varchar(100) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `price` varchar(30) DEFAULT NULL,
  `category_name` varchar(30) DEFAULT NULL,
  `is_sold` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`painting_id`),
  KEY `seller_id` (`seller_id`),
  CONSTRAINT `painting_ibfk_1` FOREIGN KEY (`seller_id`) REFERENCES `seller` (`seller_id`)
) ENGINE=InnoDB AUTO_INCREMENT=345 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `painting`
--

LOCK TABLES `painting` WRITE;
/*!40000 ALTER TABLE `painting` DISABLE KEYS */;
INSERT INTO `painting` VALUES (225,67,'modern abstract art','modern-abstract-painting.jpg',50,'799','Abstract',0),(226,56,'Abstract landscape art','abstract-landscapes-art.jpg',50,'999','Abstract',0),(227,56,'Multicoloured abstract painting','multicoloredabstract painting.jpg',90,'1499','Living room',0),(228,56,'Gopala playing flute','Gopala_Playing_Flute_Art.webp',90,'1499','Krishna',0),(229,56,'Acrylic flower art','acrylic flower painting.webp',80,'1299','Flower',0),(230,56,'Hanuman wall Art','hanuman wall art.jpg',60,'1999','Lord Hanuman',0),(231,56,'Lake watercolour art','lake water color painting.jpg',80,'1499','Water colour',0),(232,56,'Bedroom wall Art','Bedroom_wall_Painting.webp',100,'2499','Bed room',0),(233,56,'Lord ganesha Art','Lord-Ganesha-Painting.jpg',49,'999','Ganesha',0),(234,58,'Ganesha watercolour Art','ganesha watercolor art.jpg',80,'1999','Ganesha',0),(235,58,'Flower wall Art','flower wall art.jpg',80,'499','Flower',0),(236,58,'Wall Art','wall art.jpg',80,'999','Bed room',0),(237,58,'Wall Art on Canvas','wall art on canvas.webp',120,'1999','Bed room',0),(238,58,'Colourful Absract Art','colorful abstract art.webp',120,'499','Abstract',0),(239,58,'Nature Landscape Canvas','nature-landscape-canvas-painting.webp',100,'999','Canvas',0),(240,58,'peacock canvas art','elegant peacock canvas art.jpg',50,'1499','Canvas',0),(241,58,'ganesha canvas painting','ganesha canvas painting.jpeg',80,'1499','Canvas',0),(242,55,'River Arcylic Art','river impression acrylic painting.webp',80,'799','Canvas',0),(243,55,'Canvas whiteflower','canvas white flowers.webp',60,'999','Canvas',0),(244,55,'Dinning Wall Art','wall art.webp',80,'999','Dinning room',0),(245,55,'Wall Art Painting','wall art painting.jpeg',80,'1999','Dinning room',0),(246,55,'Goddess Durga Art','goddess parvati painting.jpg',80,'2499','Maa Durga',0),(247,55,'Maa Durga Painting','Durga maa painting.jpg',80,'1999','Maa Durga',0),(248,55,'Durga watercolour Art','maa durga water color art.jpg',50,'1499','Maa Durga',0),(249,55,'Maa Saraswati oil painting','devi saraswati oil painting.webp',80,'2999','Mata Saraswati',0),(250,52,'Flower oil painting','abstract flower oil painting.jpeg',80,'799','Bed room',0),(251,52,'Abstract landscape painting','Abstract landscape painting.webp',80,'1999','Bed room',0),(252,52,'Wall Art Dinning room','wall art for dining room.jpg',60,'999','Dinning room',0),(253,52,'Abstract Art','Abstract_art_for_your_dining_room.webp',80,'799','Dinning room',0),(254,52,'Acrylic Wall Art','acylic wall art.jpg',50,'1499','Living room',0),(255,52,'Arcylic Art','acylic art.webp',80,'699','Living room',0),(256,52,'Colourful Oil painting','oil painting with colourful flower.webp',79,'1999','Flower',0),(257,65,'chaturbhujha lord ganesha','chaturbhuja lord ganesha.webp',79,'1999','Ganesha',0),(258,65,'Abstract Ganesha Art','ganesh ji abstract.jpg',55,'999','Ganesha',0),(259,65,'shiv shakti painting','Ardhnarishwara shiva shakti Handmade painting.jpg',80,'2999','Shiva',0),(260,65,'Bholenath shiva painting','bholenath-shiva-religious-painting.webp',80,'1999','Shiva',0),(261,65,'Wall Art study room','WhatsApp Image 2024-06-25 at 12.23.49 PM (1).jpeg',80,'599','Study room',0),(262,65,'wall painting','WhatsApp Image 2024-06-25 at 12.23.50 PM.jpeg',80,'1299','Study room',0),(263,65,'Maa Durga Art','Durga_Mata_Devotion_Painting.jpg',79,'2999','Maa Durga',0),(264,65,'Mata Parvati painting','devi parvati art.jpg',50,'1999','Maa Durga',0),(265,66,'abstract Vibrant colour art','abstract-painting-with-vibrant-colors_.avif',80,'1499','Abstract',0),(266,66,'Blue waves oil painting','blue waves oil painting.webp',70,'1499','Abstract',0),(267,66,'Radha Krishna with flute','Radha Krishna with flaute Art.jpg',80,'2499','Krishna',0),(268,66,'Lord Krishna with cows','Lord Krishna painting with cow.jpg',80,'1499','Krishna',0),(269,66,'Krishna on canvas art','Soulful Krishna-Hand-Painted-Painting-On-Canvas-U.jpg',80,'1499','Krishna',0),(270,66,'Beautiful senere art','45.jpg',50,'1999','Nature',0),(271,66,'Canvas wall art','canvas wall art.jpg',50,'999','Nature',0),(272,66,'Abstract  Flower Art ','abstract art of flower.webp',77,'1999','Flower',0),(273,66,'Watercolour Flower Art','flower water color painting.webp',80,'2499','Flower',0),(274,59,'Acrylic white Flower','white flower acrylic painting.webp',80,'1499','Flower',0),(275,59,'Lotus Flower Art','lotus flower painting.jpg',80,'999','Flower',0),(276,59,'Lord Shiva canvas painting ','Lord shiva canvas painting.jpg',80,'1999','Shiva',0),(277,59,'Mahadev Abstract Art','mahadev abstract art.webp',80,'1499','Shiva',0),(278,59,'RadhaKrishna Art','Radha Krishna art painting.jpg',80,'2999','Krishna',0),(279,59,'Little Krishna Art','little Krishna Canvas Art.jpg',50,'999','Krishna',0),(280,59,'Arcylic Krishna Art','Acrylic Krishna Painting.jpg',50,'1399','Krishna',0),(281,67,'Mata Saraswati Arcylic Art','Mata saraswati acrylic painting.jpg',80,'1999','Mata Saraswati',0),(282,67,'Saraswati Mata Art','Maa saraswati art.jpg',80,'1499','Mata Saraswati',0),(283,67,'Mata Saraswati Painting','WhatsApp Image 2024-06-22 at 3.41.09 PM (1).jpeg',80,'1499','Mata Saraswati',0),(284,67,'Sunrise Canvas Art','sunrise canvas art.jpg',80,'1499','Nature',0),(285,67,'Nature Painting','nature art.jpg',50,'999','Nature',0),(286,67,'Sunset at beach','subset at beach art.jpg',80,'999','Water colour',0),(287,67,'Scenary Watercolour Art','scenary water color painting.jpg',50,'999','Water colour',0),(288,67,'Lord Ganesha Painting','lord ganesha water color art.jpg',80,'1999','Water colour',0),(289,59,'Waterfall Art','watercolor-waterfall-painting.jpg',80,'999','Water colour',0),(290,59,'Mountain Scenary Art','mountain sceni water clor painting.webp',50,'799','Water colour',0),(291,59,'Canvas nature Arcylic Art','canvas nature acrylic art.jpg',80,'1499','Nature',0),(292,59,'Sunrise Arcylic Art','sunrise acrylic painting.jpg',80,'1999','Nature',0),(293,52,'Arcylic Landscape Art','Acrylic landscape painting.avif',80,'1499','Nature',0),(294,59,'Nature Art','47.jpg',60,'699','Nature',0),(295,52,'Multicoloured Flowere painting','multi cooured flower canvas painting.jpg',80,'1999','Flower',0),(296,52,'Abstract Ganesha Art','lord ganesha abstract art.jpg',55,'1999','Abstract',0),(297,52,'Abstract Wall Art','abstract wall art.webp',80,'1499','Abstract',0),(298,52,'Ganesha Abstract Painting','ganesha abstract painting.jpg',80,'999','Abstract',0),(299,52,'Canvas wall Painting','oil painting on canvas.webp',60,'999','Canvas',0),(300,52,'Krishna Canvas Art','canvas art.jpg',70,'1499','Canvas',0),(301,52,'Canvas Autum Forest','canvas autumn forest.jpg',70,'1499','Canvas',0),(302,52,'Butterffly Canvas Art','butter fly water color painting.webp',50,'1499','Water colour',0),(303,52,'Watercolour Art','water color art.jpg',50,'999','Water colour',0),(304,58,'Ganesha Painting','ganesh art.jpg',70,'1499','Ganesha',0),(305,58,'Lord Ganesha','ganesh art.jpg',70,'999','Ganesha',0),(306,58,'Ganesha Art','ganesha-painting.jpg',80,'1999','Ganesha',0),(307,58,'Danceing ganesha Art','dancing ganesha art.webp',80,'1999','Ganesha',0),(308,58,'Bal Hanuman Art','Bal hanuman art.jpg',90,'999','Lord Hanuman',0),(309,58,'Maruti Painting','maruti painting.avif',89,'999','Lord Hanuman',0),(310,58,'Lord Hanuman','lord Hanuman.jpg',78,'1999','Lord Hanuman',0),(311,58,'Hanuman Art','hanuman art.jpg',80,'1999','Lord Hanuman',0),(312,58,'Hanuman Painting','hanuman painting.jpeg',80,'1999','Lord Hanuman',0),(313,58,'Lord Mahadev painting','Lord mahadev shiva art.jpg',80,'1999','Shiva',0),(314,58,'Lord parvati shiva','Lord parvati In lord shiva background.webp',80,'1999','Shiva',0),(315,58,'Maa Saraswati painting','WhatsApp Image 2024-06-22 at 3.41.07 PM (1).jpeg',80,'1499','Mata Saraswati',0),(316,58,'Mata Saraswati','saraswati devi art.jpg',80,'1999','Mata Saraswati',0),(317,58,'Saraswati Mata Painting','WhatsApp Image 2024-06-22 at 3.41.08 PM.jpeg',80,'1499','Mata Saraswati',0),(318,58,'Devi Saraswati Painting','WhatsApp Image 2024-06-22 at 3.41.07 PM.jpeg',50,'1499','Mata Saraswati',0),(319,58,'Lord Parvati  shiva','lord-shiva-with-mata-parvati.jpg',80,'2999','Maa Durga',0),(320,58,' Durga Watercolour Art','maa durga water color art.jpg',80,'999','Maa Durga',0),(321,55,'Study room wall Art','WhatsApp Image 2024-06-25 at 12.23.49 PM (2).jpeg',80,'999','Study room',0),(322,55,'Beautiful Wall Art','WhatsApp Image 2024-06-25 at 12.23.49 PM.jpeg',80,'1499','Study room',0),(323,55,'Abstract Painting','abstract art.webp',50,'1499','Living room',0),(324,55,'Living room wall art','liiving room wal art.webp',50,'1999','Living room',0),(325,55,'Large Wall Painting','large wall art.webp',80,'999','Living room',0),(326,55,'Dinning room Abstract Art','Abstract dinning room art.jpg',80,'1499','Dinning room',0),(327,55,'Modern Dinning room Art','modern dinning room painting.avif',80,'1499','Dinning room',0),(328,55,'Arcylic Painting','Acrylic painting.jpeg',80,'1499','Bed room',0),(329,55,'Bedroom Wall Painting','bedroom wall art.webp',80,'1499','Bed room',0),(330,65,'Rudra Lord shivab Art','Rudra(Lord shiva) art.jpg',80,'999','Shiva',0),(331,65,'Lord shiva painting','Lord Shiva.jpg',80,'1999','Shiva',0),(332,67,'Lord Hanuman Art','Hanuman flying towards the sky.jpg',80,'1999','Lord Hanuman',0),(333,67,'Lord Hanuma Painting','lord maruti painting.jpeg',80,'2999','Lord Hanuman',0),(334,67,'Radha Krishna Canvas Art','Radha krishna Original canvas art.jpg',80,'1999','Krishna',0),(335,67,'Maa Durga Oil Painting','maa durga oil painting.jpg',80,'1499','Maa Durga',0),(336,67,'RadhaKrishna Canvas Art','radha krishna canvas painting.jpeg',80,'2499','Bed room',0),(337,67,'Dinning Wall Oainting','Abstract landscape.jpg',50,'1999','Dinning room',0),(338,67,'Dinning Wall Painting','dinning roo wall art.jpg',80,'1499','Dinning room',0),(339,67,'Living room canvas Art','Living room canvas painting.jpg',80,'1999','Living room',0),(340,67,'Living room wall painting','living room wall art.jpg',80,'1999','Living room',0),(341,56,'Krishna Art','Mix colour painting of Lord Krishna.jpg',20,'800','Krishna',0);
/*!40000 ALTER TABLE `painting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `painting_category`
--

DROP TABLE IF EXISTS `painting_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `painting_category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_name` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `painting_category`
--

LOCK TABLES `painting_category` WRITE;
/*!40000 ALTER TABLE `painting_category` DISABLE KEYS */;
INSERT INTO `painting_category` VALUES (18,'Abstract'),(23,'Bed room'),(30,'Canvas'),(25,'Dinning room'),(29,'Flower'),(28,'Ganesha'),(20,'Krishna'),(24,'Living room'),(22,'Lord Hanuman'),(27,'Maa Durga'),(21,'Mata Saraswati'),(17,'Nature'),(32,'oil painting'),(19,'Shiva'),(26,'Study room'),(31,'Water colour');
/*!40000 ALTER TABLE `painting_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `pay_id` int NOT NULL AUTO_INCREMENT,
  `cust_id` int DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pay_id`),
  KEY `order_id` (`order_id`),
  KEY `cust_id` (`cust_id`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`),
  CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`)
) ENGINE=InnoDB AUTO_INCREMENT=442 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (429,35,448,2999,'2024-06-28 06:34:37'),(430,35,449,1499,'2024-06-28 06:36:28'),(431,35,450,499,'2024-06-28 06:36:28'),(432,35,451,1999,'2024-06-28 07:26:59'),(433,35,452,3998,'2024-06-28 07:26:59'),(434,36,453,800,'2024-06-28 07:45:44'),(435,43,454,999,'2024-07-07 12:00:09'),(436,43,455,1999,'2024-07-07 12:00:09'),(439,35,458,3998,'2024-07-16 16:03:37'),(440,35,459,999,'2025-03-18 05:39:02'),(441,35,460,3998,'2025-03-18 05:39:02');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seller`
--

DROP TABLE IF EXISTS `seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seller` (
  `seller_id` int NOT NULL AUTO_INCREMENT,
  `image` varchar(100) DEFAULT NULL,
  `seller_name` varchar(50) DEFAULT NULL,
  `contact_no` bigint DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `pincode` int DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `con_password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`seller_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller`
--

LOCK TABLES `seller` WRITE;
/*!40000 ALTER TABLE `seller` DISABLE KEYS */;
INSERT INTO `seller` VALUES (52,'Dilip Kumar Chennai.jfif','Dlip Kumar ',7903847273,'ddd@gmail.com','Karnataka',' Bagepalli ','Krishna Nagar Cooperative colony',44444,'aaa','aaa'),(55,'Sonica Agarwal Delhi.jfif','Sonika Agarwal',7903847273,'sas@gmail.com','Karnataka',' Bailhongal ','Krishna Nagar Cooperative colony',11111,'aaa','aaa'),(56,'Mandar Marathe pune Maharashtra.jfif','Mandar Marathe',8898568891,'mandar3@gmail.com','Delhi',' South West Delhi ','Krishna Nagar Cooperative colony',44444,'aaa','aaa'),(58,'Sarita Nakra Delhi.jfif','Sarita Nakra',9897668891,'sarita@gmail.com','Lakshadweep',' Kavaratti Island ','abababababab',21212112,'aaa','aaa'),(59,'i1.jpg','Raghav Metha',7903847273,'raghav55@gmail.com','Delhi',' South Delhi ','Karmic Nagar Near Metro Station',865321,'aaa','aaa'),(65,'painter.webp','Avinash sinha',9834364323,'avinash12@gmail.com','Tamil Nadu',' Chennai ','new shine colony near metro',867543,'123','123'),(66,'i2.jpg','Vinita singh',9897664523,'vinita123@gmail.com','Delhi',' South Delhi ','new chowk Rail bazar',846342,'vinita12','vinita12'),(67,'aditya-ponkshe.webp','Aditya shah',9856342532,'adityashah@gmail.com','Gujarat',' Ahmedabad ','shanti colony near new market',775432,'aditya123','aditya123');
/*!40000 ALTER TABLE `seller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sellermessage`
--

DROP TABLE IF EXISTS `sellermessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sellermessage` (
  `seller_id` int DEFAULT NULL,
  `seller_name` varchar(50) DEFAULT NULL,
  `message` text,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `seller_id` (`seller_id`),
  CONSTRAINT `sellermessage_ibfk_1` FOREIGN KEY (`seller_id`) REFERENCES `seller` (`seller_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sellermessage`
--

LOCK TABLES `sellermessage` WRITE;
/*!40000 ALTER TABLE `sellermessage` DISABLE KEYS */;
INSERT INTO `sellermessage` VALUES (56,'Mandar Marathi','ok I got it','2024-05-23 12:43:42'),(56,'Mandar Marathi','My name is Rahul Rajak and I have update my address but in my profile old address is shown...please solve this issue','2024-05-23 12:44:00'),(56,'Mandar Marathi','ok I got it','2024-05-23 12:44:11'),(56,'Mandar Marathi','hello','2024-06-01 03:06:52'),(65,'Avinash sinha','In my profile My name and address is not visible from sometime','2024-06-28 02:55:43'),(65,'Avinash sinha','I add some quantity In my painting chaturbhujha lord ganesha quantity but updated quantity is bot display','2024-06-28 03:02:41');
/*!40000 ALTER TABLE `sellermessage` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-28 17:35:37
