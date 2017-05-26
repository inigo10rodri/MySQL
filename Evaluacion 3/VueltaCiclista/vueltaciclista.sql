
-- ************************TABLAS************************************ --

create table equipo(
nomequipo varchar(20),
director varchar(30),
PRIMARY KEY (nomequipo));

create table ciclista(
dorsal int(2),
nombre varchar(30),
fecha_nac date,
nomequipo varchar(20),
PRIMARY KEY  (dorsal),
FOREIGN KEY  (nomequipo)  REFERENCES equipo(nomequipo)
ON DELETE CASCADE  ON UPDATE CASCADE);

create table etapa(
numetapa int(2),
kms int(3),
salida varchar(30),
llegada varchar(30),
dorsal int(2),
PRIMARY KEY  (numetapa),
FOREIGN KEY  (dorsal)  REFERENCES ciclista(dorsal)
ON DELETE CASCADE  ON UPDATE CASCADE);

create table puerto(
nom_puerto varchar(30),
altura int(4),
categoria char(1),
pendiente float,
numetapa int(2),
dorsal int(2),
PRIMARY KEY  (nom_puerto),
FOREIGN KEY  (dorsal)  REFERENCES ciclista(dorsal)
ON DELETE CASCADE  ON UPDATE CASCADE,
FOREIGN KEY  (numetapa)  REFERENCES etapa(numetapa)
ON DELETE CASCADE  ON UPDATE CASCADE);

create table maillot(
codigo varchar(3),
tipo varchar(20),
color varchar(20),
premio int(7),
PRIMARY KEY  (codigo));

create table lleva(
codigo varchar(3) ,
numetapa int(2),
dorsal int(2),
PRIMARY KEY (codigo,numetapa),
FOREIGN KEY  (codigo)  REFERENCES maillot(codigo)
ON DELETE CASCADE  ON UPDATE CASCADE,
FOREIGN KEY  (numetapa)  REFERENCES etapa(numetapa)
ON DELETE CASCADE  ON UPDATE CASCADE,
FOREIGN KEY  (dorsal)  REFERENCES ciclista(dorsal)
ON DELETE CASCADE  ON UPDATE CASCADE);

-- ************************DATOS************************************ --
INSERT INTO equipo VALUES ('Amore Vita','Ricardo Padacci');
INSERT INTO equipo VALUES ('Artiach','José Peréz');
INSERT INTO equipo VALUES ('Banesto','Miguel Echevarria');

INSERT INTO ciclista VALUES (1,'Miguel Indurain','2000-05-26','Banesto');
INSERT INTO ciclista VALUES (2,'Pedro Delgado','1996-04-12','Banesto');
INSERT INTO ciclista VALUES (4,'Alex Zulle','1998-12-15','Artiach');

INSERT INTO etapa VALUES (1,9,'Valladolid','Valladolid',1);
INSERT INTO etapa VALUES (36,180,'Salamanca','Valladolid',2);
INSERT INTO etapa VALUES (12,240,'Caceres','Salamanca',3);

INSERT INTO puerto VALUES ('Alto de Naranco',565,'1',6.9,1,1);
INSERT INTO puerto VALUES ('Arcalis',2230,'E',6.5,36,4);
INSERT INTO puerto VALUES ('Cerler-Circo de Ampriu',2500,'E',5.87,12,2);

INSERT INTO maillot VALUES ('MGE','General','Amarillo',8000000);
INSERT INTO maillot VALUES ('MMO','Montaña','Blanco y rojo',2000000);
INSERT INTO maillot VALUES ('MMS','Mas Sufrido','estrellas moradas',2000000);

INSERT INTO lleva VALUES ('MGE',1,1);
INSERT INTO lleva VALUES ('MMO',36,2);
INSERT INTO lleva VALUES ('MGE',12,4);

select * from equipo;
select * from ciclista;
select * from etapa;
select * from puerto;
select * from maillot;
select * from lleva;


-- ************************CONSULTAS************************************ --
-- 1
SELECT nombre, edad
FROM ciclista; 
-- 2
SELECT nombre
FROM ciclista 
WHERE year(fecha_nac )> 1997; 
-- 3
SELECT *
FROM ciclista 
WHERE nomequipo='Banesto'; 
-- 4
SELECT c.nomequipo,director
FROM ciclista c, equipo e
WHERE c.nomequipo=e.nomequipo
GROUP BY director;
-- 5
SELECT netapa 
FROM etapa 
WHERE salida 
LIKE '%A%A%'; 
-- 6
SELECT e.netapa, nompuerto 
FROM etapa e, puerto p
WHERE e.dorsal = p.dorsal;
-- 7
SELECT c.nombre FROM ciclista c
WHERE c.nomequipo = (SELECT e.nomequipo FROM equipo e
       				WHERE e.director = 'Miguel Echevarria');
-- 8
SELECT numetapa FROM etapa 
WHERE dorsal IN (SELECT dorsal FROM Ciclista 
WHERE year(fecha_nac)<1997); 
-- 9
select m.codigo,premio
from maillot m, lleva l
where m.codigo=l.codigo;
-- 10
SELECT c.nombre FROM ciclista c, lleva l 
WHERE c.dorsal = l.dorsal AND l.codigo 
IN (SELECT m.codigo 
FROM maillot m 
WHERE m.premio > 2000000);



