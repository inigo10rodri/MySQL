DROP TABLE IF EXISTS departamentos;
CREATE TABLE departamentos (
  NºDEPART smallint(6) default NULL,
  NOMBRE varchar(30) default NULL,
  LOCALIDAD varchar(30) default NULL
);


INSERT INTO departamentos (NºDEPART,NOMBRE,LOCALIDAD) VALUES
 (10,'Marketing','MADRID'),
 (20,'Desarrollo','BARCELONA'),
 (30,'Investigación','BILBAO'),
 (40,'Informática','GUADALAJARA');




DROP TABLE IF EXISTS empleados;
CREATE TABLE empleados (
  NºEMPLE smallint(6) default NULL,
  APELLIDO varchar(30) default NULL,
  SALARIO int(11) default NULL,
  COMISION int(11) default NULL,
  NºDEPART smallint(6) default NULL,
  JEFE bit(1) default NULL
);




INSERT INTO empleados (NºEMPLE,APELLIDO,SALARIO,COMISION,NºDEPART,JEFE) VALUES
 (1,'López',1200,100,20,0x01),
 (2,'Fernández',1500,120,20,0x00),
 (3,'Martínez',2000,50,30,0x00),
 (4,'Sánchez',3000,200,20,0x01),
 (5,'Martín',1200,20,40,0x00),
 (6,'Ramos',2000,30,20,0x01);





