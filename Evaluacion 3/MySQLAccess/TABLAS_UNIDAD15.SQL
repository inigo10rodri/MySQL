--
-- TABLA DEPARTAMENTOS
--

CREATE TABLE departamentos (
 dept_no  TINYINT(2) NOT NULL PRIMARY KEY,
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
 emp_no    SMALLINT(4) UNSIGNED NOT NULL PRIMARY KEY,
 apellido  VARCHAR(10),
 oficio    VARCHAR(10),
 dir       SMALLINT,
 fecha_alt DATE      ,
 salario   FLOAT(6,2),
 comision  FLOAT(6,2),
 dept_no   TINYINT(2) NOT NULL REFERENCES departamentos(dept_no)
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
-- --------------------------------------------------------- 
-- --- BASE DE DATOS ALUMNOS
-- ---------------------------------------------------------  

--
-- TABLA CURSOS
--

create table cursos
(
  curso int unsigned not null primary key,
  nomcurso char(30) not null,
  numalum int
) engine = InnoDB;
Insert into cursos VALUES (1,'1º secundaria A',24);
Insert into cursos VALUES (11,'1º secundaria B',28);
Insert into cursos VALUES (2,'2º secundaria A',25);
Insert into cursos VALUES (22,'2º secundaria B',23);
Insert into cursos VALUES (3,'3º secundaria A',26);
Insert into cursos VALUES (33,'3º secundaria B',28);

--
-- TABLA ASIGNATURAS
--

create table asignaturas
(
  codasig int unsigned not null primary key,
  nomasig char(30) not null,
  horas int
)engine = InnoDB;
Insert into asignaturas VALUES (1,'Lengua Española',4);
Insert into asignaturas VALUES (2,'Matemáticas',4);
Insert into asignaturas VALUES (3,'Sociales',3);
Insert into asignaturas VALUES (4,'Música',2);
Insert into asignaturas VALUES (5,'Tecnología',4);
Insert into asignaturas VALUES (6,'Informática',4);

--
-- TABLA ALUMNOS
--

create table alumnos
(
  codalum int unsigned not null primary key,
  nombre char(30) not null,
  direccion char(30) not null,
  curso int references cursos(curso) on delete cascade
) engine = InnoDB; 

Insert into alumnos VALUES (1,'Juanito Pérez', 'Alcalá',1);
Insert into alumnos VALUES (2,'Alberto Gil', 'Guadalajara',1);
Insert into alumnos VALUES (3,'Julia Gómez', 'Alcalá',2);
Insert into alumnos VALUES (4,'Julian García', 'Madrid',2);
Insert into alumnos VALUES (5,'Antonio Ramos', 'Guadalajara',3);
Insert into alumnos VALUES (6,'Juan Pedro Robles', 'Alcalá',3);
Insert into alumnos VALUES (7,'Jesús Sánchez', 'Alcalá',9);

--
-- TABLA NOTAS
--

create table notas
(
  codalum int unsigned not null,
  codasig   int unsigned not null,
  nota int,
  primary key (codalum,codasig),
  foreign key (codasig) references asignaturas (codasig) on delete cascade,
  foreign key (codalum) references alumnos(codalum) on delete cascade
)engine = InnoDB; 

Insert into notas VALUES (1,1,5);
Insert into notas VALUES (1,2,6);
Insert into notas VALUES (2,1,6);
Insert into notas VALUES (2,2,5);
Insert into notas VALUES (3,1,6);
Insert into notas VALUES (3,2,5);

COMMIT;

-- ******** FIN ***********************
