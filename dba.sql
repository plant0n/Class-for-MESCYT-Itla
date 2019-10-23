CREATE TABLE `carrera` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1256;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `carrera_materia`
--

DROP TABLE IF EXISTS `carrera_materia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carrera_materia` (
  `carrera_id` int(10) NOT NULL AUTO_INCREMENT,
  `materia_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`carrera_id`),
  KEY `materia_carrera_materia_fk` (`materia_id`),
  CONSTRAINT `carrera_carrera_materia_fk` FOREIGN KEY (`carrera_id`) REFERENCES `carrera` (`id`),
  CONSTRAINT `materia_carrera_materia_fk` FOREIGN KEY (`materia_id`) REFERENCES `materia` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `estudiante`
--

DROP TABLE IF EXISTS `estudiante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estudiante` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `edad` varchar(3) DEFAULT NULL,
  `matricula` varchar(10) DEFAULT NULL,
  `carrera_id` int(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `estudiante_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1256;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `materia`
--

DROP TABLE IF EXISTS `materia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `materia` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `credito` int(2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `materia_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1256;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `semestre`
--

DROP TABLE IF EXISTS `semestre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `semestre` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ciclo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1256;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `semestre_estudiante_materia`
--

DROP TABLE IF EXISTS `semestre_estudiante_materia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `semestre_estudiante_materia` (
  `materia_id` int(10) NOT NULL AUTO_INCREMENT,
  `carrera_id` int(10) NOT NULL,
  `estudiante_id` int(10) NOT NULL,
  PRIMARY KEY (`materia_id`),
  KEY `carrera_semestre_e_fk` (`carrera_id`),
  KEY `estudiante_semestre_e_fk` (`estudiante_id`),
  CONSTRAINT `carrera_semestre_e_fk` FOREIGN KEY (`carrera_id`) REFERENCES `carrera` (`id`),
  CONSTRAINT `estudiante_semestre_e_fk` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiante` (`id`),
  CONSTRAINT `materia_semestre_e_fk` FOREIGN KEY (`materia_id`) REFERENCES `materia` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1256;
