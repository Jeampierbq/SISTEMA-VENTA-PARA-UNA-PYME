CREATE DATABASE  IF NOT EXISTS `bdproyecto` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bdproyecto`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: bdproyecto
-- ------------------------------------------------------
-- Server version	8.2.0

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
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `idcategoria` int NOT NULL AUTO_INCREMENT,
  `categoria` varchar(45) NOT NULL,
  PRIMARY KEY (`idcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Lácteos'),(2,'Abarrotes'),(3,'Gaseosas'),(4,'Licores'),(5,'Confitería'),(6,'Comida para mascotas'),(7,'Limpieza'),(8,'Enlatados'),(9,'Congelados'),(10,'Pan'),(11,'Harinas'),(12,'Embutidos');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `idcliente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `ap_paterno` varchar(100) DEFAULT NULL,
  `ap_materno` varchar(100) DEFAULT NULL,
  `dni` varchar(11) DEFAULT NULL,
  `celular` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`idcliente`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'NombreCliente','ApellidoPaterno','ApellidoMaterno','12345678901','123456789');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `idempleado` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `ap_paterno` varchar(45) DEFAULT NULL,
  `ap_materno` varchar(45) DEFAULT NULL,
  `cargo` varchar(45) NOT NULL,
  PRIMARY KEY (`idempleado`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,'Abel Lizandro','Guillen','Gallegos','Gerente');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_detalle`
--

DROP TABLE IF EXISTS `pedido_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_detalle` (
  `idpedido_detalle` int NOT NULL,
  `idproducto` int NOT NULL,
  `idpedido` int NOT NULL,
  `precio` double DEFAULT NULL,
  `cantidad` double DEFAULT NULL,
  `subtotal` double DEFAULT NULL,
  PRIMARY KEY (`idpedido_detalle`),
  KEY `fk_pedido_detalle_pedido_encabezado` (`idpedido`),
  KEY `fk_pedido_detalle_producto` (`idproducto`),
  CONSTRAINT `fk_pedido_detalle_pedido_encabezado` FOREIGN KEY (`idpedido`) REFERENCES `pedido_encabezado` (`idpedido`),
  CONSTRAINT `fk_pedido_detalle_producto` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`idproducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_detalle`
--

LOCK TABLES `pedido_detalle` WRITE;
/*!40000 ALTER TABLE `pedido_detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_encabezado`
--

DROP TABLE IF EXISTS `pedido_encabezado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_encabezado` (
  `idpedido` int NOT NULL,
  `fecha` date NOT NULL,
  `total` double NOT NULL,
  `idempleado` int DEFAULT NULL,
  `idcliente` int DEFAULT NULL,
  PRIMARY KEY (`idpedido`),
  KEY `fk_pedido_encabezado_cliente` (`idcliente`),
  KEY `fk_pedido_encabezado_empleado` (`idempleado`),
  CONSTRAINT `fk_pedido_encabezado_cliente` FOREIGN KEY (`idcliente`) REFERENCES `cliente` (`idcliente`),
  CONSTRAINT `fk_pedido_encabezado_empleado` FOREIGN KEY (`idempleado`) REFERENCES `empleado` (`idempleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_encabezado`
--

LOCK TABLES `pedido_encabezado` WRITE;
/*!40000 ALTER TABLE `pedido_encabezado` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido_encabezado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `idproducto` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `precio` double NOT NULL,
  `foto` varchar(45) DEFAULT NULL,
  `fecha_ven` date NOT NULL,
  `idcategoria` int DEFAULT NULL,
  PRIMARY KEY (`idproducto`),
  KEY `fk_categoria_producto` (`idcategoria`),
  CONSTRAINT `fk_categoria_producto` FOREIGN KEY (`idcategoria`) REFERENCES `categoria` (`idcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Leche Gloria lata 395g','Leche Reconstituida Entera ',4.2,'lacteos1.jpg','2024-01-01',1),(2,'Leche Gloria Light lata 395g','Leche Light en lata color roja',4.2,'lacteos2.jpg','2024-01-01',1),(3,'Leche Gloria Niños lata 395g','Leche para niños color amarilla',4.4,'lacteos3.jpg','2024-01-01',1),(4,'Leche Gloria Sin lactosa 395g','Leche sin lactosa lata color celeste',4.4,'lacteos4.jpg','2024-01-01',1),(5,'Leche Chocolatada UHT Gloria Bolsa 900ml','Leche chocolatada en bolsa color marrón',9,'lacteos5,jpg','2024-01-01',1),(6,'Lentejas bebé 500g','Lentejas pequeñas',4.5,'abarrotes1.jpg','2024-01-01',2),(7,'Frijol Canario 500g','Frijol de tipo canario',6.7,'abarrotes2.jpg','2024-01-01',2),(8,'Frijol Panamito 500g','Frijol de tipo panamito',5.2,'abarrotes3.jpg','2024-01-01',2),(9,'Arroz Faraón 500g','Arroz Extra Añejo Bolsa Naranja',4.3,'abarrotes4.jpg','2024-01-01',2),(10,'Arroz Costeño 500g','Arroz Extra Bolsa Celeste',5.2,'abarrotes5.jpg','2024-01-01',2),(11,'Gaseosa Coca-Cola 3L','Botella de plástico con tapa roja',10.5,'gaseosas1.jpg','2024-01-01',3),(12,'Gaseosa Coca-Cola Zero 3L','Botella de plástico con tapa negra',10.5,'gaseosas2.jpg','2024-01-01',3),(13,'Gaseosa Pepsi 3L','Botella de plástico con tapa azul',8.5,'gaseosas3.jpg','2024-01-01',3),(14,'Gaseosa Inka Cola 3L','Botella de plático de etiqueta azul',10.5,'gaseosas4.jpg','2024-01-01',3),(15,'Gaseosa Fanta 3L','Botella de plástico con contenido naranja',8.5,'gaseosas5.jpg','2024-01-01',3),(16,'Ron Flor de Caña Oro Botella 750ml','Ron flor de caña 4 años añejo',45.9,'licores1.jpg','2024-01-01',4),(17,'Ron Cartavio Blanco 1L','Ron Cartavio botella ploma',28.9,'licores2.jpg','2024-01-01',4),(18,'Ron Cartavio Black 1L','Ron Caravio botella etiqueta negra',28.9,'licores3.jpg','2024-01-01',4),(19,'Vino Tinto Santiago Queirolo 750ml','Gran Borgoña botella',14.5,'licores4.jpg','2024-01-01',4),(20,'Vino Rosé Santiago Queirolo 750ml','Botella Rosada vino',14.5,'licores5.jpg','2024-01-01',4),(21,'Galleta de Vainilla Field 30g','Galleta \nsabor vainilla',1,'confiteria1.jpg','2024-01-01',5),(22,'Chocolate Sublime 100 g','Chocolate amargo con maní ',11,'confiteria2.jpg','2024-01-01',5),(23,'Bizcocho chocman 28g','Bizcocho chocman relleno manjar',1.2,'confiteria3.jpg','2024-01-01',5),(24,'Galletas picaras winters 30g','Galleta Pícaras con Cubierta Sabor\nChocolate',1.5,'confiteria4.jpg','2024-01-01',5),(25,'Papas Lay\'s bolsa 40g','Papas Lays Clasicas',1.5,'confiteria5.jpg','2024-01-01',5),(26,'Bolsa Dog Chow 500 g','Alimento balanceado para perros',4.5,'mascotas1.jpg','2024-01-01',6),(27,'Bolsa Dog Chow 1 kg ','Alimento balanceado para perros',9,'mascotas2.jpg','2024-01-01',6),(28,'Lata Rico Can 500 g','Comida enlatada para perros ',3.5,'mascotas3.jpg','2024-01-01',6),(29,'Lata Rico Can 1 kg','Comida enlatada para perros',7,'mascotas4.jpg','2024-01-01',6),(30,'Lata Mimascot 500 g','Alimento premium para mascotas ',10,'mascotas5.jpg','2024-01-01',6),(31,'Detergente en polvo ACE Regular Bolsa 5.8kg','Detergente en polvo para lavar ropa',65.99,'limpieza1.jpg','2024-01-01',7),(32,'Detergente en Polvo MAGIA BLANCA Campos de Lavanda Bolsa 4kg','Detergente en polvo',34.5,'limpieza2.jpg','2024-01-01',7),(33,'Quitamanchas SAPOLIO Ropa Color Botella 1800ml','Aroma Floral aromático característico según patrón de perfumación',12.9,'limpieza3.jpg','2024-01-01',7),(34,'Jabón en Barra BOLÍVAR Baby & Kids Paquete 190g','Aspecto opacificado, limpio, sin materias extrañas, sin rebabas de corte o sellado, color blanco a crema claro en función de la formulación grasa',3,'limpieza4.jpg','2024-01-01',7),(35,'Suavizante SUAVITEL Fresca Primavera Doypack 2.3L','Suavizante para ropa',19.9,'limpieza5.jpg','2024-01-01',7),(36,'Filete de Atún Campomar 150g','Filete de Atún en Aceite Lata',6.5,'enlatados1.jpg','2024-01-01',8),(37,'Filete de Atún Primor 140g','Filete de Atún en Aceite Vegetal Lata',5.5,'enlatados2.jpg','2024-01-01',8),(38,'Lomos de Atún Campomar 150g','Lomos de Atún en Aceite Vegetal Lata',6.3,'enlatados3.jpg','2024-01-01',8),(39,'Duraznos en Almíbar ARICA 820g','Trozos de duraznos en Almíbar Lata',9.1,'enlatados4.jpg','2024-01-01',8),(40,'Conserva de fruta ARICA Piña en almibar 565Gr','Trozos de piña en Almíbar Lata',12.7,'enlatados5.jpg','2024-01-01',8),(41,'Suprema de Pollo AVINKA Bolsa 4un','Pollo congelado de 4 unidades',27.8,'congelados1.jpg','2024-01-01',9),(42,'Nuggets Pechuga de Pollo SAN FERNANDO Caja 24un','Empaque de Nuggets de pollo',15.8,'congelados2.jpg','2024-01-01',9),(43,'Hamburguesa OTTO KUNZ Premium 100% Pura Carne de Res Paquete 8un','Hamburguesa premium hecha de carne de Res',25.9,'congelados3.jpg','2024-01-01',9),(44,'Pizza Pepperoni DON ITALO 420g Bolsa 1un','Pizza congelada de Pepperoni',33.5,'congelados4.jpg','2024-01-01',9),(45,'Helado Peziduri Tricolor NESTLÉ Cremoso Pote 900ml','Helado de tres sabores cremoso',9.9,'congelados5.jpg','2024-01-01',9),(46,'Pan francés','Pan redondo y crujiente',2,'pan1.jpg','2024-01-01',10),(47,'Pan de maíz','Pan preparado con harina de maíz',2.5,'pan2.jpg','2024-01-01',10),(48,'Pan de molde','Pan cuadrado o rectangular',3,'pan3.jpg','2024-01-01',10),(49,'Pan integral','Pan hecho con harina de trigo integral',2,'pan4.jpg','2024-01-01',10),(50,'Pan sin gluten','Pan para personas intolerantes al gluten',2.5,'pan5.jpg','2024-01-01',10),(51,'Harina de Maíz Blanco PAN','Harina para repostería',10.5,'harina1.jpg','2024-01-01',11),(52,'Harina preparada Blanca Flor','Harina de trigo preparada',9.1,'harina2.jpg','2024-01-01',11),(53,'Harina sin preparar Blanca Flor','Harina de trigo sin preparar',7.2,'harina3.jpg','2024-01-01',11),(54,'Harina sin prepara Favorita','Harina de trigo sin preparar',5.2,'harina4.jpg','2024-01-01',11),(55,'Harina preparada Bell\'s','Harina de trigo preparada',4.9,'harina5.jpg','2024-01-01',11),(56,'Hot dog SUIZA paquete 200g','6 unidades de hot dog',5,'embutidos1.jpg','2024-01-01',12),(57,'Chorizo Parillero Precocido BRAEDT paquete 500g','5 unidades de chorizos parrilleros',15,'embutidos2.jpg','2024-01-01',12),(58,'Chorizo Cocido San Fernando paquete 480g','6 unidades de chorizo cocido',12.5,'embutidos3.jpg','2024-01-01',12),(59,'Salchicha de pollo San Fernando paquete 500g','6 unidades de salchichas',7,'embutidos4.jpg','2024-01-01',12),(60,'Hot dog BRAEDT paquete 400g','7 unidades de salchichas',10.5,'embutidos5.jpg','2024-01-01',12),(64,'Mantequilla 30g OroSAGASGAS','Zapatilla deportiva',4,'asfas','2023-01-01',1),(65,'Mantequilla 30g OroSAGASGAS','Zapatilla deportiva',4,'asfas','2023-01-01',1),(66,'Mantequilla 30g OroSAGASGAS','Zapatilla deportiva',4,'asfas','2023-01-01',1),(67,'Mantequilla 30g OroSAGASGAS','Zapatilla deportiva',4,'asfas','2023-01-01',1),(69,'Mantequilla 30g OroSAGASGAS','Zapatilla deportiva',4,'asfas','2024-01-01',1),(70,'Mantequilla 30g OroSAGASGAS','Zapatilla deportiva',4,'asfas','2024-01-01',1),(71,'Mantequilla 30g OroSAGASGAS','Zapatilla deportiva',4,'asfas','2024-01-01',1),(72,'Mantequilla 30g OroSAGASGAS','Zapatilla deportiva',4,'asfas','2000-01-01',3),(73,'Mantequilla 30g OroSAGASGAS','Zapatilla deportiva',4,'asfas','2000-01-01',3),(74,'Mantequilla 30g OroSAGASGAS','Zapatilla deportiva',4,'asfas','2000-01-01',3),(75,'Mantequilla 30g OroSAGASGAS','Zapatilla deportiva',4,'asfas','2024-01-01',6),(76,'Mantequilla 30g OroSAGASGAS','Zapatilla deportiva',4,'asfas','2024-01-01',6),(77,'Mantequilla 30g OroSAGASGAS','Zapatilla deportiva',4,'asfas','2024-01-01',6),(78,'Mantequilla 30g OroSAGASGAS','Zapatilla deportiva',4,'asfas','2024-01-01',6),(79,'Mantequilla 30g OroSAGASGAS','Zapatilla deportiva',4,'asfas','2024-01-01',6),(80,'Mantequilla 30g OroSAGASGAS','Zapatilla deportiva',4,'asfas','2024-01-01',6),(81,'Mantequilla 30g OroSAGASGAS','Zapatilla deportiva',4,'asfas','2024-01-01',6),(82,'Mantequilla 30g OroSAGASGAS','Zapatilla deportiva',4,'asfas','2024-01-01',6),(83,'Mantequilla 30g OroSAGASGAS','Zapatilla deportiva',4,'asfas','2024-01-01',6),(84,'Mantequilla 30g OroSAGASGAS','Zapatilla deportiva',4,'asfas','2024-01-01',6);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idusuario` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `idempleado` int NOT NULL,
  PRIMARY KEY (`idusuario`),
  KEY `fk_empleado_usuario` (`idempleado`),
  CONSTRAINT `fk_empleado_usuario` FOREIGN KEY (`idempleado`) REFERENCES `empleado` (`idempleado`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'AbelGG','123',1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-11 23:11:15
