-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: quick_park_assist
-- ------------------------------------------------------
-- Server version	8.1.0

CREATE DATABASE quick_park_assist;
USE quick_park_assist;
-- Table structure for table `booking`
DROP TABLE IF EXISTS `booking`;
CREATE TABLE `booking` (
  `full_name` varchar(255) NOT NULL,
  `duration` varchar(255) DEFAULT NULL,
  `parking_spot` varchar(255) DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `start_time` datetime(6) DEFAULT NULL,
  `booking_id` bigint NOT NULL AUTO_INCREMENT,
  `spot_id` int DEFAULT NULL,
  `mobile_number` varchar(255) DEFAULT NULL,
  `status` enum('CONFIRMED','PENDING','CANCELLED','COMPLETED') DEFAULT 'CONFIRMED',
  `user_id` bigint DEFAULT NULL,
  `parking_spot_id` bigint DEFAULT NULL,
  `vehicle_id` bigint DEFAULT NULL,
  `vehicle_model` varchar(255) DEFAULT NULL,
  `vehicle_number` varchar(255) DEFAULT NULL,
  `spot_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`booking_id`),
  KEY `FKewv68n7xxnaq9qs2fn1ty2lhy` (`spot_id`),
  KEY `fk_user_id` (`user_id`),
  KEY `FKejehywt60rdh29uvn8ejths82` (`vehicle_id`),
  CONSTRAINT `FKejehywt60rdh29uvn8ejths82` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle` (`id`),
  CONSTRAINT `FKewv68n7xxnaq9qs2fn1ty2lhy` FOREIGN KEY (`spot_id`) REFERENCES `parkingspots` (`spot_id`)
) ENGINE=InnoDB AUTO_INCREMENT=179 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
UNLOCK TABLES;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;

CREATE TABLE `bookings` (
  `booking_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `spot_id` int DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `duration` varchar(255) DEFAULT NULL,
  `status` enum('confirmed','pending','completed','canceled') DEFAULT NULL,
  `id` int NOT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `parking_spot` varchar(255) DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`booking_id`),
  KEY `user_id` (`user_id`),
  KEY `spot_id` (`spot_id`),
  CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`spot_id`) REFERENCES `parkingspots` (`spot_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;

UNLOCK TABLES;

--
-- Table structure for table `ev_charging_station`
--

DROP TABLE IF EXISTS `ev_charging_station`;

CREATE TABLE `ev_charging_station` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `charging_station` bigint DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
--
-- Dumping data for table `ev_charging_station`
-

LOCK TABLES `ev_charging_station` WRITE;
UNLOCK TABLES;

--
-- Table structure for table `ev_charging_stations`
--

DROP TABLE IF EXISTS `ev_charging_stations`;
CREATE TABLE `ev_charging_stations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `charging_station_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `ev_charging_stations`
--

LOCK TABLES `ev_charging_stations` WRITE;
INSERT INTO `ev_charging_stations` VALUES (1,'Station 1','Downtown Area',NULL),(2,'Station 2','Central Park',NULL),(3,'Station 3','Airport Terminal',NULL),(4,'Station 4','City Mall',NULL),(5,'Station 5','Train Station',NULL),(6,'Station 6','University Campus',NULL),(7,'Station 7','Business District',NULL),(8,'Station 8','Hospital Complex',NULL),(9,'Station 9','Beachfront',NULL),(10,'Station 10','Tech Park',NULL);
UNLOCK TABLES;

--
-- Table structure for table `evcharging_station`
--

DROP TABLE IF EXISTS `evcharging_station`;

CREATE TABLE `evcharging_station` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `location` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `charging_station` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `evcharging_station`
--

LOCK TABLES `evcharging_station` WRITE;

UNLOCK TABLES;

--
-- Table structure for table `evmodel`
--

DROP TABLE IF EXISTS `evmodel`;

CREATE TABLE `evmodel` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `end_time` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `reservation_date` date DEFAULT NULL,
  `reservation_id` int DEFAULT NULL,
  `start_time` varchar(255) DEFAULT NULL,
  `vehicle_id` varchar(255) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `duration` double NOT NULL,
  `vechile_id` varchar(255) DEFAULT NULL,
  `spot_name` varchar(255) DEFAULT NULL,
  `ev_spot` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `evmodel`
--

LOCK TABLES `evmodel` WRITE;
INSERT INTO `evmodel` VALUES (45,'22:30','Pune','2025-01-13',173,'17:30','22345',31,5,NULL,'Spot A2',20),(46,'13:16','Pune','2025-01-16',719,'09:16','88888',34,4,NULL,'Spot A2',20),(50,'14:01','Pune','2025-01-07',510,'11:01','455666',29,3,NULL,'Spot A2',20);
UNLOCK TABLES;

--
-- Table structure for table `parkingspots`
--

DROP TABLE IF EXISTS `parkingspots`;

CREATE TABLE `parkingspots` (
  `spot_id` int NOT NULL AUTO_INCREMENT,
  `location` varchar(255) DEFAULT NULL,
  `spot_status` varchar(255) DEFAULT 'available',
  `price_per_hour` double NOT NULL,
  `owner_id` int DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `availability` varchar(255) DEFAULT NULL,
  `slot` int NOT NULL,
  `spot_name` varchar(255) DEFAULT NULL,
  `station` varchar(255) DEFAULT NULL,
  `charger_type` varchar(255) DEFAULT NULL,
  `power_capacity` double DEFAULT NULL,
  `spot_type` varchar(255) NOT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`spot_id`),
  KEY `owner_id` (`owner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1315 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `parkingspots`
--

LOCK TABLES `parkingspots` WRITE;
INSERT INTO `parkingspots` VALUES (1,'India_','Active',10,0,'Downtown Parking Spot','YES',1,'A1','Station 1',NULL,NULL,'regular',1),(2,'Uptown, 6th Avenue (outdoor)','occupied',100,2,NULL,'yes',0,'Budget Uptown Outdoor',NULL,NULL,NULL,'normal',NULL),(3,'Midtown, 7th Avenue (indoor)','available',240,3,NULL,'yes',0,'Luxury Midtown Indoor',NULL,NULL,NULL,'normal',NULL),(4,'Eastside, 8th Avenue (outdoor)','available',100,1,NULL,'yes',0,'Standard Eastside Outdoor',NULL,NULL,NULL,'normal',NULL),(6,'mumbai','available',200,0,NULL,'YES',5,'New spot','East indoor ',NULL,NULL,'normal',NULL),(7,'mumbai','available',200,0,NULL,'yes',5,'New spot updated','East indoor ',NULL,NULL,'normal',NULL),(12,'Downtown Parking Lot','available',5,1,'Near the main square','yes',10,'Spot A1','Main Station',NULL,NULL,'normal',NULL),(18,'mumbai',NULL,130,0,NULL,'yes',6,'Premium Downtown Indoor','Main Station',NULL,NULL,'normal',NULL),(19,'mumbai',NULL,120,0,NULL,'yes',54,'Premium Downtown Indoor','Main Station',NULL,NULL,'normal',NULL),(20,'Pune',NULL,250,0,NULL,'YES',25,'Spot A2','Star ',NULL,NULL,'ev',NULL),(21,'mumbai',NULL,500,0,NULL,'YES',4,'Charging slot','New',NULL,NULL,'ev',NULL),(22,'Pune Outdoor',NULL,200,0,NULL,'yes',6,'Spot A','Downtown',NULL,NULL,'ev',NULL),(23,'mumbai',NULL,180,0,NULL,'yes',23,'Spot A3','Main Station ',NULL,NULL,'ev',NULL),(24,'mumbai',NULL,100,0,NULL,'yes',5,'Premium Downtown Indoor','Star ',NULL,NULL,'normal',NULL),(29,' Downtown, 5th Avenue (indoor) ',NULL,320,0,NULL,'yes',34,'Premium Downtown Indoor','Star ',NULL,NULL,'normal',NULL),(33,'Downtown, 5th Avenue',NULL,220,0,NULL,'yes',3,'Alpha-1','New updated',NULL,NULL,'normal',NULL),(291,'new updated',NULL,120,0,NULL,'yes',4,'Charging spot','4',NULL,NULL,'ev',NULL),(631,'Downtown, 5th Avenue, PUNE',NULL,200,0,NULL,'yes',5,'Alpha-1','refref','type2',NULL,'normal',53),(632,'Downtown, 5th Avenue, PUNE',NULL,200,0,NULL,'yes',5,'Alpha-1 new','refref',NULL,NULL,'normal',NULL),(633,'Downtown, 5th Avenue, PUNE',NULL,300,0,NULL,'yes',5,'Alpha-1','refref',NULL,NULL,'normal',NULL),(634,'Downtown, 5th Avenue, PUNE',NULL,200,0,NULL,'yes',5,'Alpha-1 Updated','refref',NULL,NULL,'normal',NULL),(1308,'India_','Active',15,0,'Delhi Parking Spot','YES',2,'A2','Station 2',NULL,NULL,'ev_',1),(1309,'India_','Active',15,0,'Delhi Parking Spot','YES',2,'A2','Station 2',NULL,NULL,'ev_',1),(1310,'India_','Active',15,0,'Delhi Parking Spot','YES',2,'A2','Station 2',NULL,NULL,'ev_',1),(1311,'India_','Active',15,0,'Delhi Parking Spot','YES',2,'A2','Station 2',NULL,NULL,'ev_',1),(1312,'India_','Active',15,0,'Delhi Parking Spot','YES',2,'A2','Station 2',NULL,NULL,'ev_',1),(1313,'India_','Active',15,0,'Delhi Parking Spot','YES',2,'A2','Station 2',NULL,NULL,'ev_',1),(1314,'India_','Active',15,0,'Delhi Parking Spot','YES',2,'A2','Station 2',NULL,NULL,'ev_',1);
UNLOCK TABLES;

--
-- Table structure for table `passwordresettoken`
--

DROP TABLE IF EXISTS `passwordresettoken`;

CREATE TABLE `passwordresettoken` (
  `id` int NOT NULL AUTO_INCREMENT,
  `expiry_date_time` datetime DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK9dbcvg1tus9vsxrly63i6l16n` (`user_id`),
  CONSTRAINT `FKc926bi0aw9gcyy8uha1nk8efu` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `passwordresettoken`
--

LOCK TABLES `passwordresettoken` WRITE;

UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;

CREATE TABLE `payments` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `booking_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `payment_mode` enum('card','cash','UPI','net_banking') DEFAULT NULL,
  `payment_status` enum('paid','pending','failed') DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `booking_id` (`booking_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`booking_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
UNLOCK TABLES;

--
-- Table structure for table `spot`
--

DROP TABLE IF EXISTS `spot`;

CREATE TABLE `spot` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `availability` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `price_per_hour` double DEFAULT NULL,
  `slot` int NOT NULL,
  `spot_name` varchar(255) DEFAULT NULL,
  `spot_status` varchar(255) DEFAULT NULL,
  `station` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `spot`
--

LOCK TABLES `spot` WRITE;
INSERT INTO `spot` VALUES (1,'yes','new mumbai ',350,6,'Premium Downtown Indoor',NULL,'Main Station');
UNLOCK TABLES;

--
-- Table structure for table `tbl_addon`
--

DROP TABLE IF EXISTS `tbl_addon`;
CREATE TABLE `tbl_addon` (
  `serviceid` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `duration` float NOT NULL,
  `is_active` bit(1) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` float NOT NULL,
  `owner_id` bigint NOT NULL,
  PRIMARY KEY (`serviceid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_addon`
--

LOCK TABLES `tbl_addon` WRITE;
INSERT INTO `tbl_addon` VALUES (5,'egfd',6,_binary '\0','Car service',220,0);
UNLOCK TABLES;

--
-- Table structure for table `tbl_addon_booking`
--

DROP TABLE IF EXISTS `tbl_addon_booking`;
CREATE TABLE `tbl_addon_booking` (
  `addon_service_bookingid` bigint NOT NULL AUTO_INCREMENT,
  `quantities` varchar(255) DEFAULT NULL,
  `serviceids` varchar(255) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`addon_service_bookingid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


--
-- Dumping data for table `tbl_addon_booking`
--

LOCK TABLES `tbl_addon_booking` WRITE;
INSERT INTO `tbl_addon_booking` VALUES (5,'6.0','5',NULL),(6,'6.0','5',NULL);
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `availability` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `vehicle_model` varchar(255) DEFAULT NULL,
  `vehicle_number` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL DEFAULT '" "',
  `has_electric` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_sb8bbouer5wak8vyiiy4pf2bx` (`username`),
  UNIQUE KEY `UKob8kqyqqgmefl0aco34akdtpe` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
INSERT INTO `user` VALUES (51,NULL,NULL,'testuseragain@example.com','testuser','testpassword',NULL,NULL,NULL,NULL,'testuseragain@example.com',NULL),(52,'Pune new nagar west','ACTIVE','sandesh@gmail.com','Sandesh Patil','$2a$10$cm2W/atIucw5ujdbXuFWqOWJiI3XJf9Sh/HsF1kw5ut8XMGQ.Ei8m','8888888888','VEHICLE_OWNER',NULL,NULL,'sandesh@gmail.com',NULL),(53,'new address updated','ACTIVE','sandeshp9011@gmail.com','Sandesh Patil','$2a$10$8nUpRwCBFZZtvCH9.SDsMeEuJb9sRha3MNgw/yWRcEGqWF2KxZnG.','0000000000','SPOT_OWNER',NULL,NULL,'sandeshp9011@gmail.com',NULL);
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `user_id` bigint NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `mobile_number` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `role` enum('user','admin','owner') DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `mobile_number` (`mobile_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
INSERT INTO `users` VALUES (1,'User One','1234567890','user1@example.com','owner','default_username',NULL),(2,'User Two','0987654321','user2@example.com','owner','default_username',NULL),(3,'User Three','1122334455','user3@example.com','owner','default_username',NULL),(7,'User Testing','12345670','usertest@example.com','user','user','password'),(8,'Sandesh Patil','123456','sandesh@example.com','user','sandesh_patil','password'),(2003,'Sandesh Sanjay Patil','1234569088','sandesh@example.com','user','sandesh','password'),(2937464,'Sandesh Sanjay Patil','123456469088','sandesh@example.com','user','Test_user','password');
UNLOCK TABLES;

--
-- Table structure for table `vehicle`
--

DROP TABLE IF EXISTS `vehicle`;

CREATE TABLE `vehicle` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `has_electric` varchar(255) DEFAULT NULL,
  `vehicle_model` varchar(255) DEFAULT NULL,
  `vehicle_number` varchar(255) DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKrmyxjc1r0nxymg692mq9emy56` (`user_id`),
  CONSTRAINT `FKrmyxjc1r0nxymg692mq9emy56` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `vehicle`
--

LOCK TABLES `vehicle` WRITE;
INSERT INTO `vehicle` VALUES (54,'NO','Volkswagen Polo','123456',52),(55,'NO','Volkswagen Polo','453672',52);
UNLOCK TABLES;
-- Dump completed on 2025-01-30 18:20:21
