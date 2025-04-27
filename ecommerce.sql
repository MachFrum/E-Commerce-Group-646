CREATE DATABASE  IF NOT EXISTS `ecommercedb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ecommercedb`;
-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommercedb
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `address_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `address_line1` varchar(100) NOT NULL,
  `address_line2` varchar(100) DEFAULT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) DEFAULT NULL,
  `postal_code` varchar(20) NOT NULL,
  `country` varchar(50) NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `address_type` enum('billing','shipping') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`address_id`),
  KEY `idx_address_customer` (`customer_id`),
  KEY `idx_address_country` (`country`),
  KEY `idx_address_city` (`city`),
  CONSTRAINT `address_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,1,'123 Kimathi Street','Apartment 4B','Nairobi',NULL,'00100','Kenya',1,'shipping','2025-04-27 12:08:28',NULL),(2,1,'123 Kimathi Street','Apartment 4B','Nairobi',NULL,'00100','Kenya',1,'billing','2025-04-27 12:08:28',NULL),(3,2,'456 Oginga Odinga Road',NULL,'Kisumu',NULL,'40100','Kenya',1,'shipping','2025-04-27 12:08:28',NULL),(4,3,'789 Biashara Street','Floor 3','Mombasa',NULL,'80100','Kenya',1,'shipping','2025-04-27 12:08:28',NULL),(5,4,'321 Independence Avenue',NULL,'Accra',NULL,'GA-145-9077','Ghana',1,'shipping','2025-04-27 12:08:28',NULL);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_category`
--

DROP TABLE IF EXISTS `attribute_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute_category` (
  `attribute_category_id` int NOT NULL AUTO_INCREMENT,
  `parent_attribute_category_id` int DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `description` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`attribute_category_id`),
  UNIQUE KEY `name` (`name`),
  KEY `idx_parent_attr_category` (`parent_attribute_category_id`),
  CONSTRAINT `attribute_category_ibfk_1` FOREIGN KEY (`parent_attribute_category_id`) REFERENCES `attribute_category` (`attribute_category_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_category`
--

LOCK TABLES `attribute_category` WRITE;
/*!40000 ALTER TABLE `attribute_category` DISABLE KEYS */;
INSERT INTO `attribute_category` VALUES (1,NULL,'Material','Type of material used in product construction','2025-04-27 12:08:27',NULL),(2,NULL,'Origin','Cultural or geographical origin of design','2025-04-27 12:08:27',NULL),(3,NULL,'Technique','Manufacturing or artistic technique','2025-04-27 12:08:27',NULL),(4,NULL,'Sustainability','Environmental and ethical production aspects','2025-04-27 12:08:27',NULL),(5,NULL,'Technical Specs','Technical specifications for electronics','2025-04-27 12:08:27',NULL);
/*!40000 ALTER TABLE `attribute_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_type`
--

DROP TABLE IF EXISTS `attribute_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute_type` (
  `attribute_type_id` int NOT NULL AUTO_INCREMENT,
  `attribute_category_id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`attribute_type_id`),
  UNIQUE KEY `uk_attribute_type` (`attribute_category_id`,`name`),
  KEY `idx_attribute_type_name` (`name`),
  CONSTRAINT `attribute_type_ibfk_1` FOREIGN KEY (`attribute_category_id`) REFERENCES `attribute_category` (`attribute_category_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_type`
--

LOCK TABLES `attribute_type` WRITE;
/*!40000 ALTER TABLE `attribute_type` DISABLE KEYS */;
INSERT INTO `attribute_type` VALUES (1,1,'Fabric Type','Primary fabric material','2025-04-27 12:08:28',NULL),(2,1,'Wood Type','Type of wood used in product','2025-04-27 12:08:28',NULL),(3,2,'Tribal Influence','Specific tribal design origins','2025-04-27 12:08:28',NULL),(4,3,'Handcraft Method','Specific handcrafting technique','2025-04-27 12:08:28',NULL),(5,4,'Fair Trade Certified','Fair trade certification status','2025-04-27 12:08:28',NULL);
/*!40000 ALTER TABLE `attribute_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand` (
  `brand_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text,
  `logo_url` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `country_of_origin` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`brand_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,'Kikoy Kenya','Traditional Kenyan textile manufacturer specializing in colorful cotton fabrics','https://example.com/logos/kikoy.png','https://kikoykenya.co.ke','Kenya','2025-04-27 12:08:27',NULL),(2,'Maasai Treads','Handcrafted footwear made by Maasai artisans using sustainable materials','https://example.com/logos/maasai_treads.png','https://maasaitreads.com','Tanzania','2025-04-27 12:08:27',NULL),(3,'Vivo Africa','Leading African smartphone manufacturer with focus on affordable technology','https://example.com/logos/vivo_africa.png','https://vivoafrica.com','South Africa','2025-04-27 12:08:27',NULL),(4,'Kitengela Glass','Renowned Kenyan glass art studio creating handblown decorative items','https://example.com/logos/kitengela.png','https://kitengelaglass.co.ke','Kenya','2025-04-27 12:08:27',NULL),(5,'Adinkra Designs','Ghanaian fashion house specializing in traditional symbolic patterns','https://example.com/logos/adinkra.png','https://adinkradesigns.com','Ghana','2025-04-27 12:08:27',NULL);
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `color`
--

DROP TABLE IF EXISTS `color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `color` (
  `color_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `hex_code` varchar(7) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`color_id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `hex_code` (`hex_code`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `color`
--

LOCK TABLES `color` WRITE;
/*!40000 ALTER TABLE `color` DISABLE KEYS */;
INSERT INTO `color` VALUES (1,'Savanna Gold','#DAA520','2025-04-27 12:08:27',NULL),(2,'Serengeti Brown','#8B4513','2025-04-27 12:08:27',NULL),(3,'Nairobi Blue','#1E90FF','2025-04-27 12:08:27',NULL),(4,'Maasai Red','#B22222','2025-04-27 12:08:27',NULL),(5,'Kilimanjaro White','#F5F5F5','2025-04-27 12:08:27',NULL);
/*!40000 ALTER TABLE `color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `password_hash` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `email` (`email`),
  KEY `idx_customer_email` (`email`),
  KEY `idx_customer_name` (`last_name`,`first_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Wanjiku','Kamau','wanjiku@example.com','+254712345678','$2a$12$1234567890123456789012','2025-04-27 12:08:28',NULL),(2,'Otieno','Odhiambo','otieno@example.com','+254723456789','$2a$12$2345678901234567890123','2025-04-27 12:08:28',NULL),(3,'Amina','Mohamed','amina@example.com','+254734567890','$2a$12$3456789012345678901234','2025-04-27 12:08:28',NULL),(4,'Kwame','Nkrumah','kwame@example.com','+233512345678','$2a$12$4567890123456789012345','2025-04-27 12:08:28',NULL),(5,'Nala','Adebayo','nala@example.com','+234812345678','$2a$12$5678901234567890123456','2025-04-27 12:08:28',NULL);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_item` (
  `order_item_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `product_variation_id` int NOT NULL,
  `quantity` int NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_item_id`),
  KEY `idx_order_item_order` (`order_id`),
  KEY `idx_order_item_product` (`product_variation_id`),
  CONSTRAINT `order_item_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_item_ibfk_2` FOREIGN KEY (`product_variation_id`) REFERENCES `product_variation` (`variation_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item`
--

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
INSERT INTO `order_item` VALUES (1,1,1,1,3800.00,3800.00,'2025-04-27 12:08:28',NULL),(2,1,3,1,700.00,700.00,'2025-04-27 12:08:28',NULL),(3,2,3,1,3200.00,3200.00,'2025-04-27 12:08:28',NULL),(4,3,4,1,12000.00,12000.00,'2025-04-27 12:08:28',NULL),(5,4,5,1,2800.00,2800.00,'2025-04-27 12:08:28',NULL);
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `shipping_address_id` int NOT NULL,
  `billing_address_id` int NOT NULL,
  `order_status` enum('pending','processing','shipped','delivered','cancelled') NOT NULL DEFAULT 'pending',
  `payment_status` enum('pending','paid','failed','refunded') NOT NULL DEFAULT 'pending',
  `payment_method` varchar(50) NOT NULL,
  `shipping_method` varchar(50) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `shipping_cost` decimal(10,2) NOT NULL,
  `tax_amount` decimal(10,2) NOT NULL,
  `discount_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total_amount` decimal(10,2) NOT NULL,
  `notes` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`),
  KEY `shipping_address_id` (`shipping_address_id`),
  KEY `billing_address_id` (`billing_address_id`),
  KEY `idx_order_customer` (`customer_id`),
  KEY `idx_order_status` (`order_status`),
  KEY `idx_order_payment_status` (`payment_status`),
  KEY `idx_order_created` (`created_at`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`shipping_address_id`) REFERENCES `address` (`address_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`billing_address_id`) REFERENCES `address` (`address_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,1,2,'delivered','paid','M-Pesa','Standard Delivery',4500.00,350.00,450.00,700.00,4600.00,'Please deliver in the morning','2025-04-27 12:08:28',NULL),(2,2,3,3,'processing','paid','M-Pesa','Express Delivery',3200.00,500.00,320.00,0.00,4020.00,NULL,'2025-04-27 12:08:28',NULL),(3,3,4,4,'shipped','paid','Credit Card','Standard Delivery',12000.00,350.00,1200.00,1000.00,12550.00,'Fragile item, handle with care','2025-04-27 12:08:28',NULL),(4,4,5,5,'pending','pending','Mobile Money','International Shipping',2800.00,1200.00,280.00,0.00,4280.00,NULL,'2025-04-27 12:08:28',NULL),(5,1,1,2,'cancelled','refunded','M-Pesa','Standard Delivery',3200.00,350.00,320.00,0.00,3870.00,'Customer requested cancellation','2025-04-27 12:08:28',NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  `transaction_id` varchar(100) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `currency` varchar(3) NOT NULL,
  `status` enum('pending','completed','failed','refunded') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`payment_id`),
  UNIQUE KEY `transaction_id` (`transaction_id`),
  KEY `idx_payment_order` (`order_id`),
  KEY `idx_payment_status` (`status`),
  KEY `idx_payment_transaction` (`transaction_id`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,1,'M-Pesa','MPESA123456789',4600.00,'KES','completed','2025-04-27 12:08:29',NULL),(2,2,'M-Pesa','MPESA234567890',4020.00,'KES','completed','2025-04-27 12:08:29',NULL),(3,3,'Credit Card','CARD345678901',12550.00,'KES','completed','2025-04-27 12:08:29',NULL),(4,4,'Mobile Money','MOMO456789012',4280.00,'GHS','pending','2025-04-27 12:08:29',NULL),(5,1,'M-Pesa','MPESA567890123',3870.00,'KES','refunded','2025-04-27 12:08:29',NULL);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `brand_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_id`),
  KEY `idx_product_name` (`name`),
  KEY `idx_product_category` (`category_id`),
  KEY `idx_product_brand` (`brand_id`),
  KEY `idx_product_featured` (`is_featured`),
  KEY `idx_product_active` (`is_active`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `product_category` (`category_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `product_ibfk_2` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`brand_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,4,1,'Kitenge Wrap Dress','Beautiful wrap dress made from authentic Kenyan kitenge fabric with traditional patterns',1,1,'2025-04-27 12:08:28',NULL),(2,5,4,'Savanna Sunset Glass Bowl','Hand-blown decorative glass bowl with colors inspired by African sunsets',0,1,'2025-04-27 12:08:28',NULL),(3,3,3,'Savanna Pro Smartphone','Affordable smartphone with dual SIM capability and long battery life for rural areas',1,1,'2025-04-27 12:08:28',NULL),(4,1,5,'Adinkra Symbol Shirt','Cotton shirt featuring traditional Ghanaian Adinkra symbols',0,1,'2025-04-27 12:08:28',NULL),(5,2,2,'Maasai Beaded Sandals','Handcrafted leather sandals with colorful Maasai beadwork',1,1,'2025-04-27 12:08:28',NULL);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_attribute`
--

DROP TABLE IF EXISTS `product_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_attribute` (
  `product_attribute_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `attribute_type_id` int NOT NULL,
  `value` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_attribute_id`),
  UNIQUE KEY `uk_product_attribute` (`product_id`,`attribute_type_id`),
  KEY `attribute_type_id` (`attribute_type_id`),
  KEY `idx_product_attribute_value` (`value`),
  CONSTRAINT `product_attribute_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `product_attribute_ibfk_2` FOREIGN KEY (`attribute_type_id`) REFERENCES `attribute_type` (`attribute_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_attribute`
--

LOCK TABLES `product_attribute` WRITE;
/*!40000 ALTER TABLE `product_attribute` DISABLE KEYS */;
INSERT INTO `product_attribute` VALUES (1,1,1,'Cotton Kitenge','2025-04-27 12:08:28',NULL),(2,1,3,'Kenyan Coastal','2025-04-27 12:08:28',NULL),(3,2,4,'Recycled Glass','2025-04-27 12:08:28',NULL),(4,3,5,'Yes - Fairtrade International','2025-04-27 12:08:28',NULL),(5,4,3,'Kente Weaving Inspired','2025-04-27 12:08:28',NULL);
/*!40000 ALTER TABLE `product_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `parent_category_id` int DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `description` text,
  `image_url` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`category_id`),
  KEY `idx_parent_category` (`parent_category_id`),
  KEY `idx_category_name` (`name`),
  CONSTRAINT `product_category_ibfk_1` FOREIGN KEY (`parent_category_id`) REFERENCES `product_category` (`category_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
INSERT INTO `product_category` VALUES (1,NULL,'African Fashion','Traditional and modern clothing with African designs','https://example.com/categories/african_fashion.jpg',1,'2025-04-27 12:08:27',NULL),(2,NULL,'Home & Living','Home decor and household items','https://example.com/categories/home_living.jpg',1,'2025-04-27 12:08:27',NULL),(3,NULL,'Electronics','Gadgets and electronic devices','https://example.com/categories/electronics.jpg',1,'2025-04-27 12:08:27',NULL),(4,1,'Kitenge Clothing','Colorful East African printed fabric clothing','https://example.com/categories/kitenge.jpg',1,'2025-04-27 12:08:27',NULL),(5,2,'African Art','Handcrafted artwork and sculptures','https://example.com/categories/african_art.jpg',1,'2025-04-27 12:08:27',NULL);
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_image`
--

DROP TABLE IF EXISTS `product_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_image` (
  `image_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `alt_text` varchar(255) DEFAULT NULL,
  `is_primary` tinyint(1) NOT NULL DEFAULT '0',
  `display_order` int NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`image_id`),
  KEY `idx_product_image` (`product_id`),
  KEY `idx_primary_image` (`is_primary`),
  CONSTRAINT `product_image_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_image`
--

LOCK TABLES `product_image` WRITE;
/*!40000 ALTER TABLE `product_image` DISABLE KEYS */;
INSERT INTO `product_image` VALUES (1,1,'https://jasper.com/products/kitenge_dress_front.jpg','Kitenge Wrap Dress Front View',1,1,'2025-04-27 12:08:28',NULL),(2,1,'https://tsholo.com/products/kitenge_dress_back.jpg','Kitenge Wrap Dress Back View',0,2,'2025-04-27 12:08:28',NULL),(3,2,'https://milkah.com/products/glass_bowl_main.jpg','Savanna Sunset Glass Bowl',1,1,'2025-04-27 12:08:28',NULL),(4,3,'https://enoch.com/products/savanna_pro_front.jpg','Savanna Pro Smartphone Front',1,1,'2025-04-27 12:08:28',NULL),(5,4,'https://peter.com/products/adinkra_shirt_main.jpg','Adinkra Symbol Shirt',1,1,'2025-04-27 12:08:28',NULL);
/*!40000 ALTER TABLE `product_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_item`
--

DROP TABLE IF EXISTS `product_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_item` (
  `item_id` int NOT NULL AUTO_INCREMENT,
  `variation_id` int NOT NULL,
  `barcode` varchar(50) NOT NULL,
  `weight` decimal(8,2) DEFAULT NULL,
  `weight_unit` varchar(10) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`item_id`),
  UNIQUE KEY `barcode` (`barcode`),
  KEY `variation_id` (`variation_id`),
  KEY `idx_item_barcode` (`barcode`),
  CONSTRAINT `product_item_ibfk_1` FOREIGN KEY (`variation_id`) REFERENCES `product_variation` (`variation_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_item`
--

LOCK TABLES `product_item` WRITE;
/*!40000 ALTER TABLE `product_item` DISABLE KEYS */;
INSERT INTO `product_item` VALUES (1,1,'KEN123456781',0.40,'kg','2025-04-27 12:08:28',NULL),(2,2,'KEN123456782',0.40,'kg','2025-04-27 12:08:28',NULL),(3,3,'KEN123456783',1.20,'kg','2025-04-27 12:08:28',NULL),(4,4,'KEN123456784',0.20,'kg','2025-04-27 12:08:28',NULL),(5,5,'KEN123456785',0.30,'kg','2025-04-27 12:08:28',NULL);
/*!40000 ALTER TABLE `product_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_variation`
--

DROP TABLE IF EXISTS `product_variation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_variation` (
  `variation_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `color_id` int NOT NULL,
  `size_option_id` int NOT NULL,
  `sku` varchar(50) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `sale_price` decimal(10,2) DEFAULT NULL,
  `quantity_in_stock` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`variation_id`),
  UNIQUE KEY `sku` (`sku`),
  UNIQUE KEY `uk_product_variation` (`product_id`,`color_id`,`size_option_id`),
  KEY `color_id` (`color_id`),
  KEY `size_option_id` (`size_option_id`),
  KEY `idx_variation_sku` (`sku`),
  KEY `idx_variation_price` (`price`),
  KEY `idx_variation_stock` (`quantity_in_stock`),
  KEY `idx_variation_active` (`is_active`),
  CONSTRAINT `product_variation_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `product_variation_ibfk_2` FOREIGN KEY (`color_id`) REFERENCES `color` (`color_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `product_variation_ibfk_3` FOREIGN KEY (`size_option_id`) REFERENCES `size_option` (`size_option_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_variation`
--

LOCK TABLES `product_variation` WRITE;
/*!40000 ALTER TABLE `product_variation` DISABLE KEYS */;
INSERT INTO `product_variation` VALUES (1,1,4,1,'KK-DRESS-RED-S',4500.00,3800.00,15,1,'2025-04-27 12:08:28',NULL),(2,1,3,2,'KK-DRESS-BLUE-M',4500.00,NULL,8,1,'2025-04-27 12:08:28',NULL),(3,2,1,4,'KG-BOWL-GOLD-39',3200.00,2800.00,5,1,'2025-04-27 12:08:28',NULL),(4,3,5,3,'VA-PHONE-WHITE-L',12000.00,NULL,25,1,'2025-04-27 12:08:28',NULL),(5,4,2,2,'AD-SHIRT-BROWN-M',2800.00,2500.00,12,1,'2025-04-27 12:08:28',NULL);
/*!40000 ALTER TABLE `product_variation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotion`
--

DROP TABLE IF EXISTS `promotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promotion` (
  `promotion_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text,
  `discount_type` enum('percentage','fixed') NOT NULL,
  `discount_value` decimal(10,2) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `minimum_order_amount` decimal(10,2) DEFAULT NULL,
  `usage_limit` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`promotion_id`),
  KEY `idx_promotion_active` (`is_active`),
  KEY `idx_promotion_dates` (`start_date`,`end_date`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotion`
--

LOCK TABLES `promotion` WRITE;
/*!40000 ALTER TABLE `promotion` DISABLE KEYS */;
INSERT INTO `promotion` VALUES (1,'Madaraka Day Sale','Special discounts to celebrate Kenyan Madaraka Day','percentage',15.00,'2025-05-25','2025-06-02',1,2000.00,100,'2025-04-27 12:08:29',NULL),(2,'New Customer Discount','Welcome discount for first-time customers','fixed',500.00,'2025-01-01','2025-12-31',1,1000.00,NULL,'2025-04-27 12:08:29',NULL),(3,'Kitenge Collection Launch','Special promotion for our new Kitenge collection','percentage',10.00,'2025-04-01','2025-04-30',1,NULL,NULL,'2025-04-27 12:08:29',NULL),(4,'Free Shipping Weekend','Free shipping on all orders above 5000 KES','fixed',350.00,'2025-04-26','2025-04-28',1,5000.00,50,'2025-04-27 12:08:29',NULL),(5,'Flash Sale - African Art','Limited time offer on selected African art pieces','percentage',25.00,'2025-05-10','2025-05-12',0,3000.00,30,'2025-04-27 12:08:29',NULL);
/*!40000 ALTER TABLE `promotion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `review_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `order_id` int NOT NULL,
  `rating` int NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `comment` text,
  `is_verified_purchase` tinyint(1) NOT NULL DEFAULT '0',
  `is_approved` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`review_id`),
  UNIQUE KEY `uk_customer_product_review` (`customer_id`,`product_id`,`order_id`),
  KEY `order_id` (`order_id`),
  KEY `idx_review_product` (`product_id`),
  KEY `idx_review_rating` (`rating`),
  KEY `idx_review_approved` (`is_approved`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `review_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `review_ibfk_3` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,1,1,1,5,'Beautiful Dress!','The kitenge fabric is authentic and the colors are vibrant. The dress fits perfectly and I received many compliments.',1,1,'2025-04-27 12:08:29',NULL),(2,2,1,1,4,'Lovely Bowl','The glass bowl is beautiful and well-crafted. The colors really do remind me of an African sunset.',1,1,'2025-04-27 12:08:29',NULL),(3,3,3,3,5,'Great Phone for the Price','This phone has excellent battery life which is perfect since we have frequent power outages in my area. The dual SIM feature is very useful.',1,1,'2025-04-27 12:08:29',NULL),(4,4,4,4,3,'Nice Shirt but Sizing Issue','The Adinkra symbols are beautiful and authentic, but the shirt runs smaller than expected.',0,1,'2025-04-27 12:08:29',NULL),(5,5,2,2,5,'Stunning Craftsmanship','These sandals are not only comfortable but the beadwork is exquisite. True Maasai craftsmanship!',1,1,'2025-04-27 12:08:29',NULL);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping`
--

DROP TABLE IF EXISTS `shipping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipping` (
  `shipping_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `tracking_number` varchar(100) DEFAULT NULL,
  `carrier` varchar(50) NOT NULL,
  `shipping_method` varchar(50) NOT NULL,
  `shipping_cost` decimal(10,2) NOT NULL,
  `status` enum('pending','processing','shipped','delivered','returned') NOT NULL DEFAULT 'pending',
  `estimated_delivery_date` date DEFAULT NULL,
  `actual_delivery_date` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`shipping_id`),
  KEY `order_id` (`order_id`),
  KEY `idx_shipping_tracking` (`tracking_number`),
  KEY `idx_shipping_status` (`status`),
  CONSTRAINT `shipping_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping`
--

LOCK TABLES `shipping` WRITE;
/*!40000 ALTER TABLE `shipping` DISABLE KEYS */;
INSERT INTO `shipping` VALUES (1,1,'SENDY123456789','Sendy','Standard Delivery',350.00,'delivered','2025-04-15','2025-04-14','2025-04-27 12:08:29',NULL),(2,2,'SENDY234567890','Sendy','Express Delivery',500.00,'processing','2025-04-26',NULL,'2025-04-27 12:08:29',NULL),(3,3,'WELLS345678901','Wells Fargo','Standard Delivery',350.00,'shipped','2025-04-28',NULL,'2025-04-27 12:08:29',NULL),(4,4,'DHL456789012','DHL','International Shipping',1200.00,'pending','2025-05-05',NULL,'2025-04-27 12:08:29',NULL),(5,5,'SENDY134567890','Sendy','Standard Delivery',350.00,'pending','2025-04-30',NULL,'2025-04-27 12:08:29',NULL);
/*!40000 ALTER TABLE `shipping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `size_category`
--

DROP TABLE IF EXISTS `size_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `size_category` (
  `size_category_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`size_category_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `size_category`
--

LOCK TABLES `size_category` WRITE;
/*!40000 ALTER TABLE `size_category` DISABLE KEYS */;
INSERT INTO `size_category` VALUES (1,'Kenyan Clothing','Standard sizing for Kenyan apparel','2025-04-27 12:08:27',NULL),(2,'African Footwear','Sizing for shoes and sandals','2025-04-27 12:08:27',NULL),(3,'Electronics','Size classifications for electronic devices','2025-04-27 12:08:27',NULL),(4,'Home Decor','Size ranges for decorative items','2025-04-27 12:08:27',NULL),(5,'Jewelry','Size options for African jewelry','2025-04-27 12:08:27',NULL);
/*!40000 ALTER TABLE `size_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `size_option`
--

DROP TABLE IF EXISTS `size_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `size_option` (
  `size_option_id` int NOT NULL AUTO_INCREMENT,
  `size_category_id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `code` varchar(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`size_option_id`),
  UNIQUE KEY `uk_size_option` (`size_category_id`,`code`),
  KEY `idx_size_name` (`name`),
  CONSTRAINT `size_option_ibfk_1` FOREIGN KEY (`size_category_id`) REFERENCES `size_category` (`size_category_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `size_option`
--

LOCK TABLES `size_option` WRITE;
/*!40000 ALTER TABLE `size_option` DISABLE KEYS */;
INSERT INTO `size_option` VALUES (1,1,'Small','S','2025-04-27 12:08:27',NULL),(2,1,'Medium','M','2025-04-27 12:08:27',NULL),(3,1,'Large','L','2025-04-27 12:08:27',NULL),(4,2,'39','39','2025-04-27 12:08:27',NULL),(5,2,'42','42','2025-04-27 12:08:27',NULL);
/*!40000 ALTER TABLE `size_option` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-25 15:18:39
