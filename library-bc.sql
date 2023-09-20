-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: library_bc
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `origin` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES (1,'Jane','Austen','England'),(2,'William','Golding','England'),(3,'F.Scott','Fitzgerald','USA'),(4,'Herman','Melville','USA'),(5,'Alexander','Hamilton','USA'),(6,'John','Jay','USA'),(7,'James','Madison','USA'),(8,'Fyodor','Dostoevsky','Russia'),(9,'Harper','Lee','USA'),(10,'Steven D','Levitt','USA'),(11,'Stephen','Dubner','USA'),(12,'William','Strunk','USA'),(13,'E.B','White','USA'),(14,'Leo','Tolstoy','Russia'),(15,'Bram','Stoker','Ireland'),(16,'Thomas','Harris','USA'),(17,'Victor','Hugo','France'),(18,'Margaret','Mitchell','USA'),(19,'Paulo','Coehlo','Brazil');
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_author`
--

DROP TABLE IF EXISTS `book_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_author` (
  `book_id` int NOT NULL,
  `author_id` int NOT NULL,
  KEY `fk_book_id_book_author_idx` (`book_id`),
  KEY `fk_author_id_book_author_idx` (`author_id`),
  CONSTRAINT `fk_author_id_book_author` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_book_id_book_author` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_author`
--

LOCK TABLES `book_author` WRITE;
/*!40000 ALTER TABLE `book_author` DISABLE KEYS */;
INSERT INTO `book_author` VALUES (1,1),(2,2),(3,3),(4,1),(5,4),(6,5),(6,6),(6,7),(7,8),(8,9),(9,10),(9,11),(10,12),(10,13),(11,14),(12,15),(13,16),(14,2),(15,14),(16,9),(17,19),(18,9),(19,1),(20,3),(21,4);
/*!40000 ALTER TABLE `book_author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_genre`
--

DROP TABLE IF EXISTS `book_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_genre` (
  `book_id` int NOT NULL,
  `genre_id` int NOT NULL,
  KEY `fk_book_id_book_genre_idx` (`book_id`),
  KEY `fk_genre_id_book_genre_idx` (`genre_id`),
  CONSTRAINT `fk_book_id_book_genre` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_genre_id_book_genre` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_genre`
--

LOCK TABLES `book_genre` WRITE;
/*!40000 ALTER TABLE `book_genre` DISABLE KEYS */;
INSERT INTO `book_genre` VALUES (1,1),(1,2),(2,8),(2,4),(3,1),(3,3),(4,2),(4,1),(5,4),(5,1),(6,7),(6,9),(7,6),(7,3),(8,1),(9,9),(10,9),(11,2),(11,1),(11,3),(12,6),(13,6),(14,4),(15,3),(16,2),(16,1),(17,5),(18,1),(18,2),(19,2),(20,1),(21,1),(21,8);
/*!40000 ALTER TABLE `book_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `price` float NOT NULL,
  `qty` int NOT NULL DEFAULT '0',
  `discount` int DEFAULT NULL,
  `year` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'Emma',10,4,NULL,'1815'),(2,'The Inheritors',8,7,NULL,'1955'),(3,'The Great Gatsby',12,6,NULL,'1925'),(4,'Pride and Prejudice',10.5,3,NULL,'1813'),(5,'Moby-Dick',14.99,5,NULL,'1851'),(6,'The Federalist Papers',5.5,12,10,'1788'),(7,'Crime and Punishment',11.9,8,NULL,'1866'),(8,'To Kill a Mockingbird',13,4,NULL,'1960'),(9,'Freakonomics',15,6,NULL,'2005'),(10,'The Elements of Style',10,4,5,'1918'),(11,'Anna Karenina',12.99,6,NULL,'1877'),(12,'Dracula',8.99,7,NULL,'1897'),(13,'The Silence of the Lambs',15,3,NULL,'1988'),(14,'Lord of the Flies',9.9,4,NULL,'1954'),(15,'Les Misérables',10,7,NULL,'1862'),(16,'Gone with the Wind',11.9,6,NULL,'1936'),(17,'The Alchemist',8.9,3,NULL,'1988'),(18,'Little Women',11,0,NULL,'1869'),(19,'Sense and Sensibility',10,5,NULL,'1811'),(20,'Tender Is the Night',11,7,NULL,'1934'),(21,'Bartleby, the Scrivener',7,6,NULL,'1853');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genre` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES (1,'Classics'),(2,'Romance'),(3,'Drama'),(4,'Adventure'),(5,'Fantasy'),(6,'Mystery'),(7,'Political'),(8,'Fiction'),(9,'Non-Fiction');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_book`
--

DROP TABLE IF EXISTS `order_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_book` (
  `order_id` int NOT NULL,
  `book_id` int NOT NULL,
  KEY `fk_order_id_order_book_idx` (`order_id`),
  KEY `fk_product_id_order_book_idx` (`book_id`),
  CONSTRAINT `fk_order_id_order_book` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_product_id_order_book` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_book`
--

LOCK TABLES `order_book` WRITE;
/*!40000 ALTER TABLE `order_book` DISABLE KEYS */;
INSERT INTO `order_book` VALUES (1,4),(1,8),(1,15),(2,9),(2,6),(3,7),(3,11),(3,2),(4,4),(4,13),(4,12),(4,17),(5,5);
/*!40000 ALTER TABLE `order_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `total` float DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_user_orders_idx` (`user_id`),
  CONSTRAINT `fk_user_orders` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,2,38.5,'2023-09-19 15:40:11'),(2,5,20.5,'2023-09-19 15:40:11'),(3,6,32.89,'2023-09-19 15:40:11'),(4,8,43.29,'2023-09-19 15:40:11'),(5,10,14.99,'2023-09-19 15:40:11');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'crate order'),(5,'create book'),(9,'create category'),(7,'delete book'),(11,'delete category'),(3,'delete order'),(6,'update book'),(10,'update category'),(2,'update order'),(8,'view book'),(12,'view category'),(4,'view order');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_permission`
--

DROP TABLE IF EXISTS `role_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_permission` (
  `role_id` int NOT NULL,
  `permission_id` int NOT NULL,
  KEY `fk_role_id_role_permission_idx` (`role_id`),
  KEY `fk_permission_id_role_permission_idx` (`permission_id`),
  CONSTRAINT `fk_permission_id_role_permission` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_role_id_role_permission` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_permission`
--

LOCK TABLES `role_permission` WRITE;
/*!40000 ALTER TABLE `role_permission` DISABLE KEYS */;
INSERT INTO `role_permission` VALUES (2,1),(2,2),(2,3),(2,4),(2,5),(2,6),(2,7),(2,8),(2,9),(2,10),(2,11),(2,12),(1,1),(1,2),(1,3),(1,4),(2,1),(2,2),(2,3),(2,4),(2,5),(2,6),(2,7),(2,8),(2,9),(2,10),(2,11),(2,12),(1,1),(1,2),(1,3),(1,4);
/*!40000 ALTER TABLE `role_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (2,'admin'),(1,'customer');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `user_id` int NOT NULL,
  `role_id` int NOT NULL,
  KEY `fk_user_id_user_role_idx` (`user_id`),
  KEY `fk_role_id_user_role_idx` (`role_id`),
  CONSTRAINT `fk_role_id_user_role` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_id_user_role` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,2),(2,2),(3,2),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `surname` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `phone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Elton','Dervishi','e.d@gmail.com','123412','044223582'),(2,'Lirida','Krasniqi','lirida@hotmail.com','736131','043221828'),(3,'Arben','Xhaka','arb@gmail.com','arben123','045249853'),(4,'Valbona','Shala','valbona.sh@yahoo.com','v67753','044986128'),(5,'Blerina','Gjokaj','blerina.g@hotmail.com','843123','045299267'),(6,'Renata','Hoxha','rhxh@outlook.com','048774','044875398'),(7,'Gentian','Ademi','g.a@outlook.com','864987','043876987'),(8,'Erika','Rama','erika@gmail.com','003005','049754892'),(9,'Luan','Gashi','l.g@gmail.com','03485a','044398343'),(10,'Agim','Berisha','aberisha@hotmail.com','123498','044329665');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-19 19:31:22
