-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table e-sweepstakes.dozvole
CREATE TABLE IF NOT EXISTS `dozvole` (
  `dozvole_id` int NOT NULL AUTO_INCREMENT,
  `sudjelovanje` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `organiziranje` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `upravljanje_sustavom` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`dozvole_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table e-sweepstakes.dozvole: ~0 rows (approximately)

-- Dumping structure for table e-sweepstakes.nagrada
CREATE TABLE IF NOT EXISTS `nagrada` (
  `nagrada_id` int NOT NULL AUTO_INCREMENT,
  `naziv` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `vrijednost` float DEFAULT NULL,
  PRIMARY KEY (`nagrada_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table e-sweepstakes.nagrada: ~0 rows (approximately)

-- Dumping structure for table e-sweepstakes.osoba
CREATE TABLE IF NOT EXISTS `osoba` (
  `osoba_id` int NOT NULL AUTO_INCREMENT,
  `ime` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `prezime` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `username` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `lozinka` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `uloga_id` int DEFAULT NULL,
  `tokeni` int DEFAULT NULL,
  PRIMARY KEY (`osoba_id`),
  KEY `FK_osoba_uloga` (`uloga_id`),
  CONSTRAINT `FK_osoba_uloga` FOREIGN KEY (`uloga_id`) REFERENCES `uloga` (`uloga_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table e-sweepstakes.osoba: ~0 rows (approximately)

-- Dumping structure for table e-sweepstakes.ponuda
CREATE TABLE IF NOT EXISTS `ponuda` (
  `ponuda_id` int NOT NULL AUTO_INCREMENT,
  `naziv` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `organizator_id` int DEFAULT NULL,
  `nagrada_id` int DEFAULT NULL,
  `datum_zavrsetka` date DEFAULT NULL,
  `tokena` int DEFAULT NULL,
  `dobitnik_id` int DEFAULT NULL,
  `tip` int DEFAULT NULL,
  PRIMARY KEY (`ponuda_id`),
  KEY `FK_osoba` (`organizator_id`),
  KEY `FK__nagrada` (`nagrada_id`),
  KEY `FK_osoba_2` (`dobitnik_id`),
  KEY `FK__tip` (`tip`),
  CONSTRAINT `FK__nagrada` FOREIGN KEY (`nagrada_id`) REFERENCES `nagrada` (`nagrada_id`),
  CONSTRAINT `FK__tip` FOREIGN KEY (`tip`) REFERENCES `tip` (`tip_id`),
  CONSTRAINT `FK_osoba` FOREIGN KEY (`organizator_id`) REFERENCES `osoba` (`osoba_id`),
  CONSTRAINT `FK_osoba_2` FOREIGN KEY (`dobitnik_id`) REFERENCES `osoba` (`osoba_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table e-sweepstakes.ponuda: ~0 rows (approximately)

-- Dumping structure for table e-sweepstakes.prijava
CREATE TABLE IF NOT EXISTS `prijava` (
  `prijava_id` int NOT NULL AUTO_INCREMENT,
  `osoba_id` int DEFAULT NULL,
  `ponuda_id` int DEFAULT NULL,
  PRIMARY KEY (`prijava_id`),
  KEY `FK__osoba` (`osoba_id`),
  KEY `FK_prijava_ponuda` (`ponuda_id`),
  CONSTRAINT `FK__osoba` FOREIGN KEY (`osoba_id`) REFERENCES `osoba` (`osoba_id`),
  CONSTRAINT `FK_prijava_ponuda` FOREIGN KEY (`ponuda_id`) REFERENCES `ponuda` (`ponuda_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table e-sweepstakes.prijava: ~0 rows (approximately)

-- Dumping structure for table e-sweepstakes.tip
CREATE TABLE IF NOT EXISTS `tip` (
  `tip_id` int NOT NULL AUTO_INCREMENT,
  `naziv` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`tip_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table e-sweepstakes.tip: ~0 rows (approximately)

-- Dumping structure for table e-sweepstakes.uloga
CREATE TABLE IF NOT EXISTS `uloga` (
  `uloga_id` int NOT NULL AUTO_INCREMENT,
  `opis` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `dozvole_id` int DEFAULT NULL,
  PRIMARY KEY (`uloga_id`),
  KEY `FK__dozvole` (`dozvole_id`),
  CONSTRAINT `FK__dozvole` FOREIGN KEY (`dozvole_id`) REFERENCES `dozvole` (`dozvole_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table e-sweepstakes.uloga: ~0 rows (approximately)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
