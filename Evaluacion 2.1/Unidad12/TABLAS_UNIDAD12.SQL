--
-- TABLA DEPARTAMENTOS
--

CREATE TABLE departamentos (
 dept_no  TINYINT(2) NOT NULL,
 dnombre  VARCHAR(15), 
 loc      VARCHAR(15)
);

INSERT INTO departamentos VALUES (10,'CONTABILIDAD','SEVILLA');
INSERT INTO departamentos VALUES (20,'INVESTIGACIÓN','MADRID');
INSERT INTO departamentos VALUES (30,'VENTAS','BARCELONA');
INSERT INTO departamentos VALUES (40,'PRODUCCIÓN','BILBAO');
COMMIT;

--
-- TABLA EMPLEADOS
--

CREATE TABLE empleados (
 emp_no    SMALLINT(4) UNSIGNED NOT NULL,
 apellido  VARCHAR(10),
 oficio    VARCHAR(10),
 dir       SMALLINT,
 fecha_alt DATE      ,
 salario   FLOAT(6,2),
 comision  FLOAT(6,2),
 dept_no   TINYINT(2) NOT NULL
);

INSERT INTO empleados VALUES (7369,'SÁNCHEZ','EMPLEADO',7902,'1990/12/17',
                        1040,NULL,20);
INSERT INTO empleados VALUES (7499,'ARROYO','VENDEDOR',7698,'1990/02/20',
                        1500,390,30);
INSERT INTO empleados VALUES (7521,'SALA','VENDEDOR',7698,'1991/02/22',
                        1625,650,30);
INSERT INTO empleados VALUES (7566,'JIMÉNEZ','DIRECTOR',7839,'1991/04/02',
                        2900,NULL,20);
INSERT INTO empleados VALUES (7654,'MARTÍN','VENDEDOR',7698,'1991/09/29',
                        1600,1020,30);
INSERT INTO empleados VALUES (7698,'NEGRO','DIRECTOR',7839,'1991/05/01',
                        3005,NULL,30);
INSERT INTO empleados VALUES (7782,'CEREZO','DIRECTOR',7839,'1991/06/09',
                        2885,NULL,10);
INSERT INTO empleados VALUES (7788,'GIL','ANALISTA',7566,'1991/11/09',
                        3000,NULL,20);
INSERT INTO empleados VALUES (7839,'REY','PRESIDENTE',NULL,'1991/11/17',
                        4100,NULL,10);
INSERT INTO empleados VALUES (7844,'TOVAR','VENDEDOR',7698,'1991/09/08',
                        1350,0,30);
INSERT INTO empleados VALUES (7876,'ALONSO','EMPLEADO',7788,'1991/09/23',
                        1430,NULL,20);
INSERT INTO empleados VALUES (7900,'JIMENO','EMPLEADO',7698,'1991/12/03',
                        1335,NULL,30);
INSERT INTO empleados VALUES (7902,'FERNÁNDEZ','ANALISTA',7566,'1991/12/03',
                        3000,NULL,20);
INSERT INTO empleados VALUES (7934,'MUÑOZ','EMPLEADO',7782,'1992/01/23',
                        1690,NULL,10);

COMMIT;


-- ------------------------------------------------
--  TABLAS ALUMNOS, ASIGNATURAS, NOTAS  -----------
-- ------------------------------------------------


CREATE TABLE alumnos
(
  nif    VARCHAR(10) NOT NULL,
  apenom VARCHAR(30),
  direc  VARCHAR(30),
  pobla  VARCHAR(15),
  telef  VARCHAR(10)  
) ;

CREATE TABLE asignaturas
(
  cod    TINYINT UNSIGNED NOT NULL,
  nombre VARCHAR(25)
) ;


CREATE TABLE notas
(
  nif  VARCHAR(10) NOT NULL,
  cod  TINYINT UNSIGNED NOT NULL,
  nota FLOAT(3,1)
);

INSERT INTO asignaturas VALUES (1,'Prog. Leng. Estr.');
INSERT INTO asignaturas VALUES (2,'Sist. Informáticos');
INSERT INTO asignaturas VALUES (3,'Análisis');
INSERT INTO asignaturas VALUES (4,'FOL');
INSERT INTO asignaturas VALUES (5,'RET');
INSERT INTO asignaturas VALUES (6,'Entornos Gráficos');
INSERT INTO asignaturas VALUES (7,'Aplic. Entornos 4ªGen');
INSERT INTO asignaturas VALUES (8,'Idioma');


INSERT INTO alumnos VALUES
('12344345','Alcalde García, Elena', 'C/Las Matas, 24','Madrid','917766545');

INSERT INTO alumnos VALUES
('4448242','Cerrato Vela, Luis', 'C/Mina 28 - 3A', 'Madrid','916566545');

INSERT INTO alumnos VALUES
('56882942','Díaz Fernández, María', 'C/Luis Vives 25', 'Móstoles','915577545');

INSERT INTO notas VALUES('12344345', 1,6);
INSERT INTO notas VALUES('12344345', 2,5);
INSERT INTO notas VALUES('12344345', 3,6);

INSERT INTO notas VALUES('4448242', 4,6);
INSERT INTO notas VALUES('4448242', 5,8);
INSERT INTO notas VALUES('4448242', 6,4);
INSERT INTO notas VALUES('4448242', 7,5);

INSERT INTO notas VALUES('56882942', 4,8);
INSERT INTO notas VALUES('56882942', 5,7);
INSERT INTO notas VALUES('56882942', 6,8);
INSERT INTO notas VALUES('56882942', 7,9);

COMMIT;


-- ******** FIN ***********************

