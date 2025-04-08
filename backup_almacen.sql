-- MariaDB dump 10.17  Distrib 10.4.14-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: bd_almacen
-- ------------------------------------------------------
-- Server version	10.4.14-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `articulo`
--

DROP TABLE IF EXISTS `articulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articulo` (
  `art_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `art_nombre` varchar(30) NOT NULL,
  `art_precio` double(19,2) NOT NULL,
  `idCategoria` int(11) NOT NULL,
  PRIMARY KEY (`art_codigo`),
  KEY `idCategoria_idx` (`idCategoria`),
  CONSTRAINT `idCategoria` FOREIGN KEY (`idCategoria`) REFERENCES `categorias` (`idCategorias`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulo`
--

LOCK TABLES `articulo` WRITE;
/*!40000 ALTER TABLE `articulo` DISABLE KEYS */;
INSERT INTO `articulo` VALUES (1,'ARROZ DIANA',5000.00,1),(2,'Mermelada de Piña',4500.00,1),(3,'Agua Brisa 6 litros',8400.00,2),(4,'Aceite Girasol',11000.00,1),(5,'ARROZ DIANA',12000.00,1),(6,'Chocolatina jet',6000.00,1),(7,'Leche alpina',24000.00,2),(8,'Queso Campesino',4000.00,1),(9,'Salchichas Zenu',8000.00,1),(10,'Servilletero',10000.00,4),(11,'Televisor Samsung 52\'\'',1500000.00,3),(12,'Barbie Ingeniera',60000.00,5),(13,'Teclado Asus Inalambrico',40000.00,3),(14,'Sillas de madera',20000.00,4),(15,'Patineta',21000.00,5),(16,'cuaderno',8900.00,8),(17,'lapicero',1500.00,8),(18,'cartulina',400.00,8),(19,'vestido',79676.35,9),(20,'Pan',400.00,1),(21,'Yogourt',2000.00,1),(22,'borrador',500.00,8);
/*!40000 ALTER TABLE `articulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `barrios`
--

DROP TABLE IF EXISTS `barrios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `barrios` (
  `idBarrio` int(11) NOT NULL,
  `barNombre` varchar(45) NOT NULL,
  `idLocalidad` int(11) NOT NULL,
  PRIMARY KEY (`idBarrio`),
  KEY `idLocalidad_idx` (`idLocalidad`),
  CONSTRAINT `idLocalidad` FOREIGN KEY (`idLocalidad`) REFERENCES `localidades` (`idLocalidad`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barrios`
--

LOCK TABLES `barrios` WRITE;
/*!40000 ALTER TABLE `barrios` DISABLE KEYS */;
INSERT INTO `barrios` VALUES (1,'sucre',2),(2,'Marly',2),(3,'San Cristobal',2);
/*!40000 ALTER TABLE `barrios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorias` (
  `idCategorias` int(11) NOT NULL,
  `catNombre` varchar(45) NOT NULL,
  PRIMARY KEY (`idCategorias`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Alimentos'),(2,'Bebidas'),(3,'Tecnologia'),(4,'Decoración'),(5,'Niños'),(6,'Salud'),(7,'Otras'),(8,'papeleria'),(9,'vestuario'),(10,'Calzado\r\n11');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras`
--

DROP TABLE IF EXISTS `compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compras` (
  `idCompras` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `comFecha` date NOT NULL,
  `comVrTotal` decimal(10,0) NOT NULL,
  `comdcto` double DEFAULT NULL,
  PRIMARY KEY (`idCompras`),
  KEY `idUsuario_idx` (`idUsuario`),
  CONSTRAINT `idUsuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuarios`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras`
--

LOCK TABLES `compras` WRITE;
/*!40000 ALTER TABLE `compras` DISABLE KEYS */;
INSERT INTO `compras` VALUES (1,1,'2020-06-01',35000,NULL),(2,3,'2018-07-05',80750,4037.5),(3,1,'2020-07-01',90000,9999.99),(4,3,'2020-04-02',20000,NULL),(5,5,'2020-05-03',100000,NULL),(6,2,'2020-09-03',100001,NULL);
/*!40000 ALTER TABLE `compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras_articulos`
--

DROP TABLE IF EXISTS `compras_articulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compras_articulos` (
  `art_codigo` int(11) NOT NULL,
  `idCompras` int(11) NOT NULL,
  `comArt_cantidad` int(11) NOT NULL,
  PRIMARY KEY (`art_codigo`,`idCompras`),
  KEY `idCompras_idx` (`idCompras`),
  CONSTRAINT `art_codigo` FOREIGN KEY (`art_codigo`) REFERENCES `articulo` (`art_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idCompras` FOREIGN KEY (`idCompras`) REFERENCES `compras` (`idCompras`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras_articulos`
--

LOCK TABLES `compras_articulos` WRITE;
/*!40000 ALTER TABLE `compras_articulos` DISABLE KEYS */;
INSERT INTO `compras_articulos` VALUES (1,1,5),(1,3,2),(1,4,19),(2,5,9),(3,1,1),(3,3,1),(3,4,1),(4,2,3),(12,1,3),(15,3,2);
/*!40000 ALTER TABLE `compras_articulos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `localidades`
--

DROP TABLE IF EXISTS `localidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `localidades` (
  `idLocalidad` int(11) NOT NULL,
  `locNombre` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`idLocalidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localidades`
--

LOCK TABLES `localidades` WRITE;
/*!40000 ALTER TABLE `localidades` DISABLE KEYS */;
INSERT INTO `localidades` VALUES (1,'Usaquen'),(2,'Chapinero'),(3,'Santa Fe'),(4,'San Cristobal'),(5,'Usme'),(6,'Tunjuelito'),(7,'Bosa'),(8,'Kennedy'),(9,'Fontibón'),(10,'Engativa'),(11,'Suba'),(12,'Barrios Unidos'),(13,'Teusaquillo'),(14,'Los Martires'),(15,'Antonio Nariño'),(16,'Puente Aranda');
/*!40000 ALTER TABLE `localidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedor` (
  `prov_codigo` int(11) NOT NULL,
  `prov_nombres` varchar(30) NOT NULL,
  `prov_apellidos` varchar(30) NOT NULL,
  `prov_edad` int(11) DEFAULT NULL,
  `NACIMIENTO` year(4) DEFAULT NULL,
  PRIMARY KEY (`prov_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (120,'Diego','Lopez',23,1997),(121,'Miguel','Morales',41,1979),(122,'Vanessa','Garnica',35,1985),(123,'Maicol','García',22,NULL),(124,'Jorge','Reina',19,0000),(125,'Angel','González',45,NULL),(126,'Angie','Martinez',67,NULL),(127,'Sebastian','Rubio',52,NULL),(128,'Cristian','Avila',76,NULL),(129,'Felipe','Buyuaibe',89,NULL);
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor_articulo`
--

DROP TABLE IF EXISTS `proveedor_articulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedor_articulo` (
  `prov_codigo` int(11) NOT NULL,
  `art_codigo` int(11) NOT NULL,
  PRIMARY KEY (`prov_codigo`,`art_codigo`),
  KEY `art_codigo` (`art_codigo`),
  CONSTRAINT `proveedor_articulo_ibfk_1` FOREIGN KEY (`prov_codigo`) REFERENCES `proveedor` (`prov_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `proveedor_articulo_ibfk_2` FOREIGN KEY (`art_codigo`) REFERENCES `articulo` (`art_codigo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor_articulo`
--

LOCK TABLES `proveedor_articulo` WRITE;
/*!40000 ALTER TABLE `proveedor_articulo` DISABLE KEYS */;
INSERT INTO `proveedor_articulo` VALUES (120,1),(120,2),(120,5),(121,1),(121,6),(121,8),(122,2),(122,7),(123,4),(124,5),(125,11),(126,9),(127,13),(128,14),(129,11);
/*!40000 ALTER TABLE `proveedor_articulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock` (
  `sto_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `art_codigo` int(11) NOT NULL,
  `sto_cantidad` int(11) NOT NULL,
  PRIMARY KEY (`sto_codigo`),
  KEY `art_codigo` (`art_codigo`),
  CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`art_codigo`) REFERENCES `articulo` (`art_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (1,1,13),(2,2,11),(3,6,9),(4,3,50),(5,4,120),(6,5,78),(8,7,5);
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `idUsuarios` int(11) NOT NULL,
  `usuNombre` varchar(45) NOT NULL,
  `usuEmail` varchar(25) NOT NULL,
  `usuPassword` varchar(8) NOT NULL,
  `idTipo_Usuarios` int(11) NOT NULL,
  `idBarrio` int(11) NOT NULL,
  PRIMARY KEY (`idUsuarios`),
  KEY `IdTipUsuario_idx` (`idTipo_Usuarios`),
  KEY `idBarrio_idx` (`idBarrio`),
  CONSTRAINT `idBarrio` FOREIGN KEY (`idBarrio`) REFERENCES `barrios` (`idBarrio`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'lina','linam@hotmail.con','233',1,3),(2,'pedro','pedro@gmail.com','8787',3,1),(3,'Carlos','carlosj@hotmail.com','8787',3,2),(4,'juan','juan@gmail.com','787878',1,3),(5,'Maria','maria@gmail.com','12345',3,2),(6,'Johanna','Johanna@hotmail.com','12345',3,3),(7,'María Sofia Castro','maria@correo.gmail.com','eccdfg',2,1);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-26  7:12:34
