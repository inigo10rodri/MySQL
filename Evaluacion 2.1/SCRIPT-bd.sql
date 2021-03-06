CREATE  DATABASE  FORMACION3;

USE FORMACION3;

CREATE TABLE  EMPLEADO
(Codigo_empleado  integer,
Nombre  varchar(15),
Apellidos  varchar(25),
Direccion  varchar(25),
Telefono  varchar(9),
Nif varchar(9) NOT NULL UNIQUE,
Fecha_nac  date,
Nacionalidad varchar(15),
Sexo varchar(8),
Firma  varchar(10),
Salario float,
Capacitado  bool,
PRIMARY KEY  (Codigo_empleado));

CREATE TABLE  CAPACITADO
(Codigo_empleado  integer,
PRIMARY KEY  (Codigo_empleado),
FOREIGN KEY  (Codigo_empleado)  REFERENCES EMPLEADO(Codigo_empleado)
ON DELETE CASCADE  ON UPDATE CASCADE);

CREATE TABLE  NO_CAPACITADO
(Codigo_empleado  integer,
PRIMARY KEY  (Codigo_empleado),
FOREIGN KEY  (Codigo_empleado)  REFERENCES EMPLEADO(Codigo_empleado)
ON DELETE CASCADE  ON UPDATE CASCADE);

CREATE TABLE  CURSO
(Codigo_curso  integer,
Nombre  varchar(20),
Descripcion varchar(20),
Duracion  tinyint,
Coste float,
PRIMARY KEY  (Codigo_curso));

CREATE TABLE  EDICION
(Codigo_curso  integer,
Fecha  Date,
Lugar varchar(20),
Horario varchar(20),
Cod_capacitado integer,
PRIMARY KEY  (Codigo_curso, Fecha),
CONSTRAINT FK1 FOREIGN KEY  (Cod_capacitado)  REFERENCES CAPACITADO(Codigo_empleado)
ON DELETE CASCADE  ON UPDATE CASCADE,
CONSTRAINT FK2 FOREIGN KEY  (Codigo_curso)  REFERENCES CURSO(Codigo_curso)
ON DELETE CASCADE  ON UPDATE CASCADE);



CREATE TABLE  RECIBE
(Codigo_empleado   integer,
Codigo_curso  integer,
Fecha  Date,
PRIMARY KEY  (Codigo_empleado, Codigo_curso, Fecha),
FOREIGN KEY  (Codigo_empleado)  REFERENCES EMPLEADO(Codigo_empleado)
ON DELETE CASCADE  ON UPDATE CASCADE,
FOREIGN KEY  (Codigo_curso, Fecha)  REFERENCES EDICION(Codigo_curso, Fecha)
ON DELETE CASCADE  ON UPDATE CASCADE);

CREATE TABLE  PREREQUISITO
(Tiene_pre  integer,
Es_pre integer,
Obligatorio bool,
PRIMARY KEY  (Tiene_pre, Es_pre),
FOREIGN KEY  (Tiene_pre)  REFERENCES CURSO(Codigo_curso)
ON DELETE CASCADE  ON UPDATE CASCADE,
FOREIGN KEY  (Es_pre)  REFERENCES CURSO(Codigo_curso)
ON DELETE CASCADE  ON UPDATE CASCADE);





CREATE DATABASE EMPRESA3;

USE EMPRESA3;

-- TABLAS: DEPARTAMENTOS y EMPLEADOS

CREATE TABLE departamentos (
 dept_no  TINYINT(2) NOT NULL PRIMARY KEY,
 dnombre  VARCHAR(15), 
 loc      VARCHAR(15)
);

CREATE TABLE empleados (
 emp_no    SMALLINT(4) UNSIGNED NOT NULL PRIMARY KEY,
 apellido  VARCHAR(10),
 oficio    VARCHAR(10),
 dir       SMALLINT,
 fecha_alt DATE,
 salario   FLOAT(6,2),
 comision  FLOAT(6,2),
 dept_no   TINYINT(2) NOT NULL REFERENCES departamentos(dept_no)
ON DELETE CASCADE ON UPDATE CASCADE
);

-- DATOS: 

INSERT INTO departamentos VALUES (10,'CONTABILIDAD','SEVILLA');
INSERT INTO departamentos VALUES (20,'INVESTIGACIÓN','MADRID');
INSERT INTO departamentos VALUES (30,'VENTAS','BARCELONA');
INSERT INTO departamentos VALUES (40,'PRODUCCIÓN','BILBAO');


INSERT INTO empleados VALUES (7369,'SÁNCHEZ','EMPLEADO',7902,'1990/12/17',1040,NULL,20);
INSERT INTO empleados VALUES (7499,'ARROYO','VENDEDOR',7698,'1990/02/20',1500,390,30);
INSERT INTO empleados VALUES (7521,'SALA','VENDEDOR',7698,'1991/02/22',1625,650,30);
INSERT INTO empleados VALUES (7566,'JIMÉNEZ','DIRECTOR',7839,'1991/04/02',2900,NULL,20);
INSERT INTO empleados VALUES (7654,'MARTÍN','VENDEDOR',7698,'1991/09/29',1600,1020,30);
INSERT INTO empleados VALUES (7698,'NEGRO','DIRECTOR',7839,'1991/05/01',3005,NULL,30);
INSERT INTO empleados VALUES (7782,'CEREZO','DIRECTOR',7839,'1991/06/09',2885,NULL,10);
INSERT INTO empleados VALUES (7788,'GIL','ANALISTA',7566,'1991/11/09',3000,NULL,20);
INSERT INTO empleados VALUES (7839,'REY','PRESIDENTE',NULL,'1991/11/17',4100,NULL,10);
INSERT INTO empleados VALUES (7844,'TOVAR','VENDEDOR',7698,'1991/09/08',1350,0,30);
INSERT INTO empleados VALUES (7876,'ALONSO','EMPLEADO',7788,'1991/09/23',1430,NULL,20);
INSERT INTO empleados VALUES (7900,'JIMENO','EMPLEADO',7698,'1991/12/03',1335,NULL,30);
INSERT INTO empleados VALUES (7902,'FERNÁNDEZ','ANALISTA',7566,'1991/12/03',3000,NULL,20);
INSERT INTO empleados VALUES (7934,'MUÑOZ','EMPLEADO',7782,'1992/01/23',1690,NULL,10);

