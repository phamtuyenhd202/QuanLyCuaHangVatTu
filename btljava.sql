CREATE DATABASE  IF NOT EXISTS `manager` /*!40100 DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `manager`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: manager
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `accountmanagement`
--

DROP TABLE IF EXISTS `accountmanagement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accountmanagement` (
  `TenTK` char(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `MK` char(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `QuyenTruyCap` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `MaNV` char(30) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`TenTK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accountmanagement`
--

LOCK TABLES `accountmanagement` WRITE;
/*!40000 ALTER TABLE `accountmanagement` DISABLE KEYS */;
INSERT INTO `accountmanagement` VALUES ('hai','abc123','Nhân Viên','NV02'),('linh','1234567','Quản Lý','NV01');
/*!40000 ALTER TABLE `accountmanagement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customermanagement`
--

DROP TABLE IF EXISTS `customermanagement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customermanagement` (
  `MaNV` char(20) COLLATE utf8mb3_unicode_ci NOT NULL,
  `TenNV` varchar(45) COLLATE utf8mb3_unicode_ci NOT NULL,
  `GioiTinh` varchar(45) COLLATE utf8mb3_unicode_ci NOT NULL,
  `NgaySinh` char(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `DiaChi` varchar(45) COLLATE utf8mb3_unicode_ci NOT NULL,
  `SoDienThoai` varchar(45) COLLATE utf8mb3_unicode_ci NOT NULL,
  `Email` varchar(45) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ChucVu` varchar(45) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`MaNV`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customermanagement`
--

LOCK TABLES `customermanagement` WRITE;
/*!40000 ALTER TABLE `customermanagement` DISABLE KEYS */;
INSERT INTO `customermanagement` VALUES ('NV01','Nguyễn Văn Linh','Nam','14-06-2002','Thái Bình','0869526280','nvanlinh1406@gmail.com','Giám đốc'),('NV02','Mai Công Sao','Nam','13-01-2003','Thái Bình','0869526280','mcs123@gmail.com','Nhân Viên'),('NV03','Nguyễn Sơn Tùng','Nam','16-10-2000','Thái Bình','0869526280','tungnui@gmail.com','Trưởng Phòng'),('NV05','Hoàng Nhật Nam','Nam','16-10-2002','Hưng Yên','0869526280','nhannam12@gmail.com','Nhân Viên');
/*!40000 ALTER TABLE `customermanagement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoicedetails`
--

DROP TABLE IF EXISTS `invoicedetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoicedetails` (
  `MaHD` char(20) COLLATE utf8mb3_unicode_ci NOT NULL,
  `MaSP` char(20) COLLATE utf8mb3_unicode_ci NOT NULL,
  `SoLuongMua` int NOT NULL,
  `DonGia` int NOT NULL,
  KEY `fk_MaHD` (`MaHD`),
  KEY `fk_MaSP` (`MaSP`),
  CONSTRAINT `fk_MaHD` FOREIGN KEY (`MaHD`) REFERENCES `invoices` (`MaHD`),
  CONSTRAINT `fk_MaSP` FOREIGN KEY (`MaSP`) REFERENCES `productmanagement` (`MaSP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoicedetails`
--

LOCK TABLES `invoicedetails` WRITE;
/*!40000 ALTER TABLE `invoicedetails` DISABLE KEYS */;
INSERT INTO `invoicedetails` VALUES ('HD03','DT02',1,2250000),('HD03','MT02',1,19000000),('HD02','DT02',3,2000000),('HD02','MT02',5,15000000),('HD01','MT02',1,19000000),('HD04','DT02',2,2300000),('HD04','MT02',3,17000000),('HD02','DH01',3,7600000),('HD02','MT03',1,47990000),('HD01','DT03',1,12800000);
/*!40000 ALTER TABLE `invoicedetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoices` (
  `MaHD` char(20) COLLATE utf8mb3_unicode_ci NOT NULL,
  `TenKH` varchar(45) COLLATE utf8mb3_unicode_ci NOT NULL,
  `MaNV` char(20) COLLATE utf8mb3_unicode_ci NOT NULL,
  `NgayPhatHanh` varchar(45) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`MaHD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
INSERT INTO `invoices` VALUES ('HD01','Hoàng Ngọc Huyền','NV01','29-05-2023'),('HD02','Lê Bá Cát','NV05','30-05-2023'),('HD03','Tô Ngọc Anh','NV03','27-05-2023'),('HD04','Nguyễn Đức Công','NV05','24-05-2023');
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productmanagement`
--

DROP TABLE IF EXISTS `productmanagement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productmanagement` (
  `MaSP` char(20) COLLATE utf8mb3_unicode_ci NOT NULL,
  `TenSP` varchar(45) COLLATE utf8mb3_unicode_ci NOT NULL,
  `TenNCC` varchar(45) COLLATE utf8mb3_unicode_ci NOT NULL,
  `GiaBan` int NOT NULL,
  `SoLuong` int NOT NULL,
  `DonViTinh` varchar(45) COLLATE utf8mb3_unicode_ci NOT NULL,
  `HanSD` varchar(45) COLLATE utf8mb3_unicode_ci NOT NULL,
  `MaDM` char(20) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`MaSP`),
  KEY `MaDM` (`MaDM`),
  CONSTRAINT `productmanagement_ibfk_1` FOREIGN KEY (`MaDM`) REFERENCES `productportfolio` (`MaDM`),
  CONSTRAINT `productmanagement_ibfk_2` FOREIGN KEY (`MaDM`) REFERENCES `productportfolio` (`MaDM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productmanagement`
--

LOCK TABLES `productmanagement` WRITE;
/*!40000 ALTER TABLE `productmanagement` DISABLE KEYS */;
INSERT INTO `productmanagement` VALUES ('DH01','Casper Power1','Casper',8000000,197,'Chiếc','6 tháng','DM03'),('DT01','Iphone 14 pro','Apple',28000000,148,'Chiếc','12 tháng','DM01'),('DT02','SamSung s22','SamSung',25000000,90,'Chiếc','12 tháng','DM01'),('DT03','Realme 11 Pro Plus','Realme',12800000,98,'Chiếc','12 tháng','DM01'),('MT01','MacBook Air M2','Apple',27690000,100,'Chiếc','24 tháng','DM02'),('MT02','ThinkPad E15 G3','Lenovo',20000000,131,'Chiếc','24 tháng','DM02'),('MT03','MacBook Pro 14','Apple',47990000,121,'Chiếc','36 tháng','DM02');
/*!40000 ALTER TABLE `productmanagement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productportfolio`
--

DROP TABLE IF EXISTS `productportfolio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productportfolio` (
  `MaDM` char(20) COLLATE utf8mb3_unicode_ci NOT NULL,
  `TenDM` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`MaDM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productportfolio`
--

LOCK TABLES `productportfolio` WRITE;
/*!40000 ALTER TABLE `productportfolio` DISABLE KEYS */;
INSERT INTO `productportfolio` VALUES ('DM01','Điện Thoại'),('DM02','Máy Tính'),('DM03','Điều Hòa');
/*!40000 ALTER TABLE `productportfolio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salarymanagement`
--

DROP TABLE IF EXISTS `salarymanagement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salarymanagement` (
  `MaNV` char(20) COLLATE utf8mb3_unicode_ci NOT NULL,
  `TenNV` varchar(45) COLLATE utf8mb3_unicode_ci NOT NULL,
  `SoNgayLam` int NOT NULL,
  `LuongNgay` double NOT NULL,
  `PhuCap` double NOT NULL,
  PRIMARY KEY (`MaNV`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salarymanagement`
--

LOCK TABLES `salarymanagement` WRITE;
/*!40000 ALTER TABLE `salarymanagement` DISABLE KEYS */;
INSERT INTO `salarymanagement` VALUES ('NV01','Nguyễn Văn Linh',22,280000,500000),('NV02','Nguyễn Văn Lương',28,300000,450000),('NV05','Hoàng Nhật Nam',25,250000,490000);
/*!40000 ALTER TABLE `salarymanagement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usermanagement`
--

DROP TABLE IF EXISTS `usermanagement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usermanagement` (
  `MaKH` char(20) COLLATE utf8mb3_unicode_ci NOT NULL,
  `TenKH` varchar(45) COLLATE utf8mb3_unicode_ci NOT NULL,
  `GioiTinh` varchar(45) COLLATE utf8mb3_unicode_ci NOT NULL,
  `NgaySinh` datetime NOT NULL,
  `DiaChi` varchar(45) COLLATE utf8mb3_unicode_ci NOT NULL,
  `SoDienThoai` varchar(45) COLLATE utf8mb3_unicode_ci NOT NULL,
  `Email` varchar(45) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`MaKH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usermanagement`
--

LOCK TABLES `usermanagement` WRITE;
/*!40000 ALTER TABLE `usermanagement` DISABLE KEYS */;
/*!40000 ALTER TABLE `usermanagement` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-31  1:34:08
