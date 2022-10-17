-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.6.5-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para tupiel
CREATE DATABASE IF NOT EXISTS `tupiel` /*!40100 DEFAULT CHARACTER SET utf8mb3 */;
USE `tupiel`;

-- Volcando estructura para tabla tupiel.analisis
CREATE TABLE IF NOT EXISTS `analisis` (
  `idAnalisis` int(11) NOT NULL AUTO_INCREMENT,
  `idPaciente` int(11) DEFAULT NULL,
  `fechaAnalisis` date DEFAULT NULL,
  PRIMARY KEY (`idAnalisis`),
  KEY `FK_analisis_pacientes` (`idPaciente`),
  CONSTRAINT `FK_analisis_pacientes` FOREIGN KEY (`idPaciente`) REFERENCES `pacientes` (`idPaciente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla tupiel.analisis: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `analisis` DISABLE KEYS */;
/*!40000 ALTER TABLE `analisis` ENABLE KEYS */;

-- Volcando estructura para tabla tupiel.datosanalisis
CREATE TABLE IF NOT EXISTS `datosanalisis` (
  `idAnalisis` int(11) NOT NULL,
  `isSonda` int(11) NOT NULL,
  `idParte` int(11) NOT NULL,
  `Valor` int(11) NOT NULL,
  PRIMARY KEY (`idAnalisis`,`isSonda`,`idParte`),
  KEY `FK_datosanalisis_sondas` (`isSonda`),
  KEY `FK_datosanalisis_partescuerpo` (`idParte`),
  CONSTRAINT `FK_datosanalisis_analisis` FOREIGN KEY (`idAnalisis`) REFERENCES `analisis` (`idAnalisis`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_datosanalisis_partescuerpo` FOREIGN KEY (`idParte`) REFERENCES `partescuerpo` (`idParte`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_datosanalisis_sondas` FOREIGN KEY (`isSonda`) REFERENCES `sondas` (`idSonda`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla tupiel.datosanalisis: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `datosanalisis` DISABLE KEYS */;
/*!40000 ALTER TABLE `datosanalisis` ENABLE KEYS */;

-- Volcando estructura para tabla tupiel.otrosdatosanalisisestructura
CREATE TABLE IF NOT EXISTS `otrosdatosanalisisestructura` (
  `idOtroDato` int(11) NOT NULL AUTO_INCREMENT,
  `NombreOtroDato` varchar(50) NOT NULL DEFAULT '0',
  `Observacion` varchar(250) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idOtroDato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla tupiel.otrosdatosanalisisestructura: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `otrosdatosanalisisestructura` DISABLE KEYS */;
/*!40000 ALTER TABLE `otrosdatosanalisisestructura` ENABLE KEYS */;

-- Volcando estructura para tabla tupiel.pacientes
CREATE TABLE IF NOT EXISTS `pacientes` (
  `idPaciente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(150) NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `sexo` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`idPaciente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla tupiel.pacientes: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `pacientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `pacientes` ENABLE KEYS */;

-- Volcando estructura para tabla tupiel.partescuerpo
CREATE TABLE IF NOT EXISTS `partescuerpo` (
  `idParte` int(11) NOT NULL AUTO_INCREMENT,
  `parte` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idParte`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla tupiel.partescuerpo: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `partescuerpo` DISABLE KEYS */;
/*!40000 ALTER TABLE `partescuerpo` ENABLE KEYS */;

-- Volcando estructura para tabla tupiel.restodatosanalisis
CREATE TABLE IF NOT EXISTS `restodatosanalisis` (
  `idAnalisis` int(11) NOT NULL,
  `idOtrosDatos` int(11) NOT NULL,
  `Valor` varchar(250) NOT NULL,
  PRIMARY KEY (`idAnalisis`,`idOtrosDatos`),
  KEY `FK_restodatosanalisis_otrosdatosanalisisestructura` (`idOtrosDatos`),
  CONSTRAINT `FK_restodatosanalisis_analisis` FOREIGN KEY (`idAnalisis`) REFERENCES `analisis` (`idAnalisis`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_restodatosanalisis_otrosdatosanalisisestructura` FOREIGN KEY (`idOtrosDatos`) REFERENCES `otrosdatosanalisisestructura` (`idOtroDato`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla tupiel.restodatosanalisis: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `restodatosanalisis` DISABLE KEYS */;
/*!40000 ALTER TABLE `restodatosanalisis` ENABLE KEYS */;

-- Volcando estructura para tabla tupiel.sondas
CREATE TABLE IF NOT EXISTS `sondas` (
  `idSonda` int(11) NOT NULL AUTO_INCREMENT,
  `nombreSonda` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idSonda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla tupiel.sondas: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `sondas` DISABLE KEYS */;
/*!40000 ALTER TABLE `sondas` ENABLE KEYS */;

-- Volcando estructura para tabla tupiel.valores
CREATE TABLE IF NOT EXISTS `valores` (
  `idSonda` int(11) NOT NULL,
  `idPartecuerpo` int(11) NOT NULL,
  `Minimo` int(11) DEFAULT NULL,
  `Maximo` int(11) DEFAULT NULL,
  `decimales` int(11) DEFAULT NULL,
  `Descripcion` int(11) DEFAULT NULL,
  PRIMARY KEY (`idSonda`,`idPartecuerpo`),
  KEY `FK_valores_partescuerpo` (`idPartecuerpo`),
  CONSTRAINT `FK_valores_partescuerpo` FOREIGN KEY (`idPartecuerpo`) REFERENCES `partescuerpo` (`idParte`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_valores_sondas` FOREIGN KEY (`idSonda`) REFERENCES `sondas` (`idSonda`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Volcando datos para la tabla tupiel.valores: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `valores` DISABLE KEYS */;
/*!40000 ALTER TABLE `valores` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
