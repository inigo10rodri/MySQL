-- *****************************PROVINCIAS****************************************
SELECT * FROM provincias;
CREATE TABLE `provincias` (
  `CODPRO` tinyint(3) NOT NULL,
  `NOMBRE` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`CODPRO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- *****************************PUEBLOS****************************************
SELECT * FROM pueblos;
CREATE TABLE `pueblos` (
  `CODPUE` varchar(3) NOT NULL,
  `NOMBRE` varchar(45) DEFAULT NULL,
  `CODPRO` tinyint(3) DEFAULT NULL,
  PRIMARY KEY (`CODPUE`),
  KEY `FK_PRO_idx` (`CODPRO`),
  CONSTRAINT `FK_PRO` FOREIGN KEY (`CODPRO`) REFERENCES `provincias` (`CODPRO`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- *****************************CLIENTES****************************************
SELECT * FROM clientes;
CREATE TABLE `clientes` (
  `CODCLI` varchar(3) NOT NULL,
  `NOMBRE` varchar(45) DEFAULT NULL,
  `DIRECCION` varchar(45) DEFAULT NULL,
  `CODPOSTAL` int(5) DEFAULT NULL,
  `CODPUE` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`CODCLI`),
  KEY `FK_PUE_idx` (`CODPUE`),
  CONSTRAINT `FK_PUE` FOREIGN KEY (`CODPUE`) REFERENCES `pueblos` (`CODPUE`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- *****************************FACTURAS****************************************
SELECT * FROM facturas;
CREATE TABLE `facturas` (
  `CODFAC` varchar(3) NOT NULL,
  `FECHA` date DEFAULT NULL,
  `CODCLI` varchar(45) DEFAULT NULL,
  `IVA` tinyint(2) DEFAULT NULL,
  `DTO` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`CODFAC`),
  KEY `FK_CLI_idx` (`CODCLI`),
  CONSTRAINT `FK_CLI` FOREIGN KEY (`CODCLI`) REFERENCES `clientes` (`CODCLI`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- *****************************ARTICULOS****************************************
SELECT * FROM articulos;
CREATE TABLE `articulos` (
  `CODART` varchar(3) NOT NULL,
  `DESCRIP` varchar(30) DEFAULT NULL,
  `PRECIO` tinyint(3) DEFAULT NULL,
  `STOCK` tinyint(3) DEFAULT NULL,
  `STOCK_MIN` tinyint(3) DEFAULT NULL,
  PRIMARY KEY (`CODART`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- *****************************LINEA_FAC****************************************
SELECT * FROM linea_fac;
CREATE TABLE `linea_fac` (
  `CODFAC` varchar(3) NOT NULL,
  `LINEA` varchar(3) NOT NULL,
  `CANT` tinyint(4) DEFAULT NULL,
  `CODART` varchar(3) DEFAULT NULL,
  `DTO` tinyint(2) DEFAULT NULL,
  `PRECIO` tinyint(3) DEFAULT NULL,
  PRIMARY KEY (`CODFAC`,`LINEA`),
  KEY `FK_ART_idx` (`CODART`),
  CONSTRAINT `FK_ART` FOREIGN KEY (`CODART`) REFERENCES `articulos` (`CODART`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_FAC` FOREIGN KEY (`CODFAC`) REFERENCES `facturas` (`CODFAC`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


