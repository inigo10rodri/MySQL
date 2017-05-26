DROP TABLE IF EXISTS alumnos;
CREATE TABLE alumnos (
  NUM_MATRICULA int(11) NOT NULL,
  NOMBRE varchar(50) default NULL,
  POBLACION varchar(50) default NULL,
  DIRECCION varchar(50) default NULL,
  TLF int(11) default NULL,
  NUM_HERMANOS tinyint(4) default NULL,
  COD_CURSO varchar(5) default NULL,
  PRIMARY KEY  (NUM_MATRICULA)
);

INSERT INTO alumnos (NUM_MATRICULA,NOMBRE,POBLACION,DIRECCION,TLF,NUM_HERMANOS,COD_CURSO) VALUES
 (1001,'ALBA GARCÍA, JOSÉ MIGUEL','ALCALÁ DE HENARES','C/ LA PALMA  Nº 12 - 3º A',918716272,0,'CS001'),
 (2001,'BERMÚDEZ PASCUAL, RAÚL','ALCALÁ DE HENARES','C/ LA NORIA  Nº 10 - 3º A',918334455,0,'SS001'),
 (2041,'MATA CABELLO, ANTONIO','BERROCALEJO','C/MALVARROSA - 45B-2ºD',927577575,3,'PS001'),
 (2043,'ALIA RAMOS, FRANCISCO','LOS SANTOS DE LA HUMOSA','C/LUNA LLENA 32 - 4ºB',912389889,1,'PS003'),
 (2045,'ALIA GARCÍA, PEDRO','BERROCALEJO','C/VIRGEN DE GUADALUPE 45 - 3ºA',927577567,0,'SS001'),
 (2142,'PÉREZ RAMOS, ALBERTO','GUADALAJARA','C/PRESIDENTES 56B',948237814,0,'SS001'),
 (2251,'PANZANO SANZ, ISABEL','GUADALAJARA','C/LOS DEPORTE 3 -7ºB',949220345,1,'PS001'),
 (2324,'DIAZ GRACIA, CARLOS','ALCALÁ DE HENARES','C/ ALBERCA Nº 45 - 8º A',918989899,0,'SS002'),
 (2342,'ESTEBAN RUANO, DAVID','ALCALÁ DE HENARES','C/ RUFINO BLANCO Nº 6 - 2º A',918090870,1,'PS003'),
 (2345,'GARCÍA GARCÍA, CRISTINA','ALCALÁ DE HENARES','C/ PARANINFO 17',918855600,1,'TS001'),
 (2437,'SOLANO CAMINO, JUAN PEDRO','GUADALAJARA','C/LAS MORERAS 34',949887700,2,'PS001'),
 (2556,'GARCÍA LÓPEZ, DANIEL','ALCALÁ DE HENARES','C/ LOS COMUNEROS Nº 34 - 7',918890230,0,'CS001'),
 (3040,'GONZALEZ RAMOS, MATEO','BERROCALEJO','C/OCAÑA 56 - 3ºD',927515476,2,'TS001'),
 (3230,'CASTILLO CABELLO, ANTONIO','ALCALÁ DE HENARES','C/ BARDALES Nº 32 - 3º B',918822170,2,'SS001'),
 (3236,'CANO RAMOS, RAFAEL','BERROCALEJO','C/PILÓN 33 BAJO',927567867,3,'TS001'),
 (3438,'BOTELLA CALAMARO, JUAN ANTONIO','GUADALAJARA','C/EMPERADOR CARLOS V 27',949229922,1,'PS001'),
 (3450,'GARCÍA GARCÍA, JUAN','LOS SANTOS DE LA HUMOSA','C/LOS ORDENADORES 79 A',912345676,1,'PS003'),
 (3452,'CÓRDOBA SAIZ, VICTOR MANUEL','ALCALÁ DE HENARES','C/ LA ESTAMPA Nº 31 - 5º A',918456780,3,'SS001'),
 (3456,'HERRANZ GIL, VICTOR DANIEL','LOS SANTOS DE LA HUMOSA','C/ MAYOR 12',918989830,0,'SS001'),
 (3457,'LÓPEZ GONZÁLEZ, CRISTINA','ALCALÁ DE HENARES','C/ SALESIANOS 23 - A',918111290,1,'PS003'),
 (3478,'LÓPEZ MARTÍN, CARLOS DE LA','MADRID','C/ TALAMANCA Nº 12 - 1º A',918856660,1,'CS001'),
 (3578,'MARTÍN SOLDEU, DANIEL','LOS HUEROS','C/ LIBREROS 54 - 3º B',919203901,1,'PS001'),
 (3900,'LÓPEZ MARTÍNEZ, JUAN','ALCALÁ DE HENARES','C/ CARRETERA A MADRID - 56',915647821,0,'PS003'),
 (4001,'MARTÍNEZ CAMPOS, JOSE ALBERTO','ALCALÁ DE HENARES','C/DEL EJÉRCITO 5 - 9º C',911199922,2,'PS001'),
 (4003,'MARTÍNEZ DEL SOL, ELENA','ALCALÁ DE HENARES','C/ LOS DANZANTES 7 - 5ºD',918343540,2,'SS002'),
 (4023,'PÉREZ LÓPEZ, MARINO DAVID','ALCALÁ DE HENARES','C/ RUFINO BLANCO Nº 23 - 1º C',918893340,2,'CS001'),
 (4033,'BREÑA BREÑA, MARÍA','GUADALAJARA','C/FELIX FERNANDEZ 12',949665544,2,'PS001'),
 (4056,'MORALES PANIAGUA, PEDRO','ALCALÁ DE HENARES','C/ ARAGÓN 3 - 5ºB',918899770,0,'CS001'),
 (4067,'PÉREZ OLMEDO, CARLOS','ALCALÁ DE HENARES','C/ BLANCO Nº 2 - 1º A',918845670,0,'PS002'),
 (4134,'MARTÍN BREÑA, PILAR','ALCALÁ DE HENARES','C/ALCALÁ 211 - 3ºB',912337787,0,'PS002'),
 (4235,'SUAREZ COBOS, JUAN','BERROCALEJO','C/MAYOR 23 - 1ºA',927577487,2,'SS002'),
 (4300,'ROMERO RODRÍGUEZ, DAVID','ALCALÁ DE HENARES','C/ LA ESTAMPA Nº 11 - 5º D',918765432,1,'SS001'),
 (4549,'SANTOS BELLO, RAQUEL','BERROCALEJO','C/PARAISO 50 - 7ºA',927577467,1,'TS001'),
 (4567,'MORENO ALÍA, MARÍA','ALCALÁ DE HENARES','C/ CARRETERA A MADRID - 45',917874843,0,'PS001'),
 (4589,'RAMOS DE MIGUEL, ALBERTO','VILLALVILLA','C/ PARANINFO 17 - 6º',918567870,3,'SS002'),
 (4598,'PÉREZ VAZQUEZ, CESAR','ALCALÁ DE HENARES','C/ EL RÍO TAJO Nº 12 - 2ºA',918855444,2,'CS001'),
 (4623,'RODRÍGUEZ RAMOS, RAÚL','ALCALÁ DE HENARES','C/ MAYOR 14',918043439,1,'PS002'),
 (4626,'SANCHEZ GIL, ÁNGEL','ALCALÁ DE HENARES','C/ BLANCO Nº 22 - 6º B',918823770,0,'PS001'),
 (4687,'PRIETO MARTÍN, EMILIO','ALCALÁ DE HENARES','C/ LOS COMUNEROS Nº 3 - 2ºA',918874380,0,'TS001'),
 (4725,'SÁNCHEZ DE LA TORRE, JUANA','LOS SANTOS DE LA HUMOSA','C/ JUAN DE AUSTRIA 43 - 4ºA',918765990,0,'CS001'),
 (4728,'SÁNCHEZ RAMOS, ISMAEL','ALCALÁ DE HENARES','C/ ALBERCA Nº 5 - 3º A',918232499,2,'SS001'),
 (4831,'VILLAR VADILLO, SERGIO','LOS SANTOS DE LA HUMOSA','C/ JUAN DE AUSTRIA 3 - 6ºA',918899888,2,'CS001'),
 (4932,'RAMOS MARTÍN, ALICIA','ALCALÁ DE HENARES','C/ ABEDULES 19',918891770,1,'TS001'),
 (5427,'SÁNCHEZ MARTÍNEZ, MARTA','ALCALÁ DE HENARES','C/ LIBREROS 34 - 5º A',918989121,3,'TS001'),
 (5639,'RUBIO MORENO, RAÚL','GUADALAJARA','C/PEDRO LUNA 43 -1ºA',949129933,3,'SS002'),
 (5646,'GRANADO PEREZ, OCTAVIO','MADRID','C/VIRGEN DE LOS REMEDIOS 6 - 2ºG',912323123,2,'PS002'),
 (6548,'RAMOS MARTÍN, FERNANDO','GUADALAJARA','C/LA REPÚBLICA 3º B',949456789,0,'PS001'),
 (6730,'SANZ PÉREZ, JORGE','ALCALÁ DE HENARES','C/ LOS ABEDULES 13',919234864,1,'PS002'),
 (7829,'SANTO LINARES, IVÁN','ALCALÁ DE HENARES','C/ MAYOR 19',918899770,1,'CS001'),
 (8747,'RAMOS RINCÓN, OCTAVIO','GUADALAJARA','C/GENERAL 6 - 6ºA',949220023,1,'PS003');







DROP TABLE IF EXISTS asignaturas;
CREATE TABLE `asignaturas` (
  COD_ASIGNATURA smallint(6) default NULL,
  DENOMINACION varchar(50) default NULL,
  TIPO varchar(12) default NULL
);




INSERT INTO asignaturas (COD_ASIGNATURA,DENOMINACION,TIPO) VALUES
 (10,'LENGUA','TRONCAL'),
 (20,'CIENCIAS','TRONCAL'),
 (30,'MATEMÁTICAS','TRONCAL'),
 (40,'HISTORIA','TRONCAL'),
 (50,'TECNOLOGÍA','DE MODALIDAD'),
 (60,'FÍSICA','TRONCAL'),
 (70,'QUÍMICA','TRONCAL'),
 (80,'EDUCACIÓN FÍSICA','DE MODALIDAD'),
 (90,'MÚSICA','OPTATIVA'),
 (100,'PLÁSTICA','DE MODALIDAD'),
 (110,'INFORMÁTICA','OPTATIVA'),
 (120,'TECNOLOGÍAS DE LA INFORMACIÓN','DE MODALIDAD'),
 (130,'INGLÉS','TRONCAL'),
 (140,'FRANCÉS','OPTATIVA'),
 (150,'MÁQUINAS','DE MODALIDAD'),
 (160,'DIBUJO','DE MODALIDAD');


DROP TABLE IF EXISTS cursa;
CREATE TABLE cursa (
  COD_ASIGNATURA smallint(6) default NULL,
  NUM_MATRICULA int(11) default NULL,
  NOTA float default NULL
);


INSERT INTO cursa (COD_ASIGNATURA,NUM_MATRICULA,NOTA) VALUES
 (10,1001,6),
 (10,2001,5),
 (10,2041,7),
 (10,2043,8),
 (10,2045,5),
 (10,2142,6),
 (10,2251,4),
 (10,2324,3),
 (10,2342,5),
 (10,2345,6),
 (10,2437,7),
 (10,2556,8),
 (10,3040,9),
 (10,3230,6),
 (10,3236,7),
 (10,3438,8),
 (10,3450,5),
 (10,3452,5),
 (10,3456,4),
 (10,3457,4),
 (10,3478,3),
 (10,3578,6),
 (10,3900,7),
 (10,4001,8),
 (10,4003,6),
 (10,4725,8),
 (10,6730,3),
 (10,8747,2),
 (20,1001,5),
 (20,2001,6),
 (20,2041,7),
 (20,2043,8),
 (20,2045,5),
 (20,2142,4),
 (20,2251,6),
 (20,2324,9),
 (20,2342,8),
 (20,2345,9),
 (20,2437,7),
 (20,2556,8),
 (20,3040,6),
 (20,3230,5),
 (20,3236,4),
 (20,3438,3),
 (20,3450,6),
 (20,3452,7),
 (20,3456,8),
 (20,3457,9),
 (20,3478,6),
 (20,3578,5),
 (20,3900,4),
 (20,4001,3),
 (20,4003,6),
 (20,4023,7),
 (20,4033,8),
 (20,4725,9),
 (20,8747,8),
 (30,1001,6),
 (30,3230,9),
 (30,3236,5),
 (30,3438,6),
 (30,3450,7),
 (30,3452,7),
 (30,3456,6),
 (30,3457,4),
 (30,3478,4),
 (30,3578,3),
 (30,3900,3),
 (30,4001,5),
 (30,4003,4),
 (30,4056,6),
 (30,4067,5),
 (30,4134,4),
 (30,4235,3),
 (30,4300,4),
 (30,4549,2),
 (30,4567,5),
 (30,4589,6),
 (30,4598,7),
 (30,4623,8),
 (30,4626,4),
 (30,4687,5),
 (30,4725,6),
 (30,4728,8),
 (30,4831,9),
 (30,4932,3),
 (30,5427,4),
 (30,5639,7),
 (30,5646,6),
 (30,6548,5),
 (30,6730,4),
 (30,7829,8),
 (30,8747,7),
 (40,4023,5),
 (40,4033,6),
 (40,4056,5),
 (40,4067,6),
 (40,4134,7),
 (40,4235,8),
 (40,4300,3),
 (40,4549,4),
 (40,4567,9),
 (40,4589,9),
 (40,4598,8),
 (40,4623,7),
 (40,4626,5),
 (40,4687,4),
 (40,4725,3),
 (40,4728,5),
 (40,4831,6),
 (40,4932,7),
 (40,5427,8),
 (40,5639,4),
 (40,5646,3),
 (40,6548,6),
 (40,6730,7),
 (40,7829,8),
 (40,8747,9),
 (50,1001,6),
 (50,2001,6),
 (50,4728,6),
 (50,4831,7),
 (50,4932,7),
 (50,5427,8),
 (50,5639,8),
 (50,5646,6),
 (50,6548,6),
 (50,6730,6),
 (50,7829,5),
 (50,8747,5),
 (60,1001,4),
 (60,2001,4),
 (60,2041,5),
 (60,2043,5),
 (60,2045,6),
 (60,2142,6),
 (60,2251,5),
 (60,2324,5),
 (60,2342,4),
 (60,2345,6),
 (60,2437,7),
 (60,2556,8),
 (60,3040,7),
 (70,2001,5),
 (70,3230,6),
 (70,3236,5),
 (70,3438,4),
 (70,3450,5),
 (70,3452,6),
 (70,3456,7),
 (70,3457,8),
 (70,3478,9),
 (70,3578,8),
 (70,3900,7),
 (70,4001,6),
 (70,4003,5),
 (70,4023,6),
 (70,4033,4),
 (80,2001,6),
 (80,2041,7),
 (80,4056,3),
 (80,4067,2),
 (80,4134,3),
 (80,4235,4),
 (80,4300,5),
 (80,4549,6),
 (80,4567,5),
 (80,4589,6),
 (80,4598,4),
 (80,4623,5),
 (80,4626,7),
 (80,4687,8),
 (80,4725,9),
 (90,2041,6),
 (90,4728,8),
 (90,4831,7),
 (90,4932,6),
 (90,5427,5),
 (90,5639,5),
 (90,5646,4),
 (90,6548,4),
 (90,6730,3),
 (90,7829,3),
 (90,8747,4),
 (100,1001,6),
 (100,2001,7),
 (100,2041,7),
 (100,2043,9),
 (100,2045,9),
 (100,2142,9),
 (100,2251,8),
 (100,2324,8),
 (100,2342,10),
 (100,2345,8),
 (100,2437,8),
 (100,2556,7),
 (100,3040,6),
 (110,1001,7),
 (110,4023,6),
 (110,4033,5),
 (110,4056,4),
 (110,4067,3),
 (110,4134,6),
 (110,4235,7),
 (110,4300,8),
 (110,4549,9),
 (110,4567,2),
 (110,4589,7),
 (110,4598,6),
 (110,4623,5),
 (110,4626,4),
 (110,4687,3),
 (110,4725,8),
 (120,4725,5),
 (120,8747,7),
 (130,2041,5),
 (130,4725,10),
 (130,6730,4);



DROP TABLE IF EXISTS cursos;
CREATE TABLE cursos (
  COD_CURSO varchar(5) default NULL,
  DESCRIPCION varchar(50) default NULL,
  NIVEL tinyint(4) default NULL,
  TURNO varchar(10) default NULL,
  ETAPA varchar(16) default NULL
);





INSERT INTO cursos (COD_CURSO,DESCRIPCION,NIVEL,TURNO,ETAPA) VALUES
 ('CS001','CUARTO DE SECUNDARIA',4,'DIURNO','SEGUNDO CICLO'),
 ('PS001','PRIMERO DE SECUNDARIA',1,'DIURNO','PRIMER CICLO'),
 ('PS002','PRIMERO DE SECUNDARIA',1,'VESPERTINO','PRIMER CICLO'),
 ('PS003','PRIMERO DE SECUNDARIA',1,'NOCTURNO','PRIMER CICLO'),
 ('SS001','SEGUNDO DE SECUNDARIA',2,'DIURNO','PRIMER CICLO'),
 ('SS002','SEGUNDO DE SECUNDARIA',2,'VESPERTINO','PRIMER CICLO'),
 ('TS001','TERCERO DE SECUNDARIA',3,'DIURNO','SEGUNDO CICLO');


DROP TABLE IF EXISTS delegados;
CREATE TABLE delegados (
  NUM_MATRICULA int(11) default NULL,
  COD_DELEGADO int(11) default NULL
) ;




INSERT INTO delegados (NUM_MATRICULA,COD_DELEGADO) VALUES
 (1001,2045),
 (2001,2045),
 (2041,2045),
 (2043,2045),
 (2045,2045),
 (2142,2045),
 (2251,2045),
 (2324,2045),
 (2342,2045),
 (2345,3457),
 (2437,3457),
 (2556,3457),
 (3040,3457),
 (3230,3457),
 (3236,3457),
 (3438,3457),
 (3450,3457),
 (3452,3457),
 (3456,3457),
 (3457,3457),
 (3478,3457),
 (3578,3457),
 (3900,3457),
 (4001,3457),
 (4003,4033),
 (4023,4033),
 (4033,4033),
 (4056,4033),
 (4067,4033),
 (4134,4033),
 (4235,4033),
 (4300,4033),
 (4549,4033),
 (4567,4033),
 (4589,4033),
 (4598,4033),
 (4623,4033),
 (4626,4033),
 (4687,4033),
 (4725,8747),
 (4728,8747),
 (4831,8747),
 (4932,8747),
 (5427,8747),
 (5639,8747),
 (5646,8747),
 (6548,8747),
 (6730,8747),
 (7829,8747),
 (8747,8747);





