CREATE TABLE IF NOT EXISTS `socios`.`SOCIOS` (
  `dni` VARCHAR(9) NOT NULL,
  `nombre` VARCHAR(25) NULL,
  `apellido` VARCHAR(25) NULL,
  `edad` INT(2) NULL,
  `num_hermanos` INT(2) NULL,
  `telefono` INT NULL,
  PRIMARY KEY (`dni`));
  CREATE TABLE IF NOT EXISTS `socios`.`SOCIOS_CON_HERMANOS` (
  `dni_socio` VARCHAR(9) NOT NULL,
  `hermanos` INT(2) NULL,
  PRIMARY KEY (`dni_socio`));
  CREATE TABLE IF NOT EXISTS `socios`.`SOCIOS_HERMANOS` (
  `dni_socio` VARCHAR(9) NOT NULL,
  `hermanos` INT(2) NULL,
  `tiene` VARCHAR(2) NULL,
  PRIMARY KEY (`dni_socio`));
  CREATE TABLE IF NOT EXISTS `socios`.`SOCIOS_SIN_HERMANOS` (
  `dni_socio` VARCHAR(9) NOT NULL,
  PRIMARY KEY (`dni_socio`));
  delimiter |
  create trigger INSERTAR_SOCIO 

  -- https://es.slideshare.net/galvis/ejemplo-de-triggers-en-mysql
  