-- 1
SELECT * FROM  alum2006;
-- 2
SELECT dni, nombre, apellidos, curso, nivel, clase
FROM alum2006; 
-- 3
SELECT nombre, apellidos
FROM alum2006
WHERE poblacion='GUADALAJARA';
-- 4
-- Calculamos la edad con curdate restandole la fecha de nacimiento.
SELECT dni, nombre, apellidos, curso, nivel, clase, YEAR(CURDATE())-YEAR(fecha_nac) AS EDAD
FROM alum2006
ORDER BY nombre ASC, apellidos ASC, fecha_nac;
-- 5
-- Consulatar dni cuya fecha nacimiento sea nula.alter
SELECT dni
FROM alum2006
WHERE fecha_nac IS NULL;
-- 6
-- Consultar todos los datos de los que tengan fecha no nula
SELECT *
FROM alum2006
WHERE fecha_nac IS NOT NULL;
-- 7
-- dni, nombre y apellidos donde tenga pérez
SELECT dni, nombre, apellidos
FROM alum2006
WHERE apellidos LIKE '%PEREZ%';
-- 8
-- que tengan la población de CABANILLAS, MARCHAMALO, YUNQUERA
SELECT dni, nombre, apellidos, curso, nivel, clase
FROM alum2006
WHERE poblacion='CABANILLAS' OR poblacion='MARCHAMALO' OR poblacion='YUNQUERA';
-- 9
-- fecha de nacimeiento entre 27 y 28
SELECT dni, nombre, apellidos, curso, nivel, clase, YEAR(CURDATE())-YEAR(fecha_nac) AS EDAD
FROM alum2006
WHERE YEAR(CURDATE())-YEAR(fecha_nac) BETWEEN 27 AND 28;
-- 10
-- Máxino  de faltas de los alumnos
-- SELECT dni, nombre, apellidos, max(faltas1),max(faltas2),max(faltas3)<-- Maximo de faltas
SELECT dni, nombre, apellidos, greatest(faltas1,faltas2,faltas3) AS 'Total Faltas'
FROM alum2006
WHERE nivel='ESO';
-- 11
-- La media de las faltas
SELECT dni, nombre, apellidos,nivel, (faltas1+faltas2+faltas3)/3 AS 'Media faltas'
FROM alum2006;
-- 12
-- faltas con valor nulo
SELECT *
FROM alum2006
WHERE faltas1 IS NULL OR faltas2 IS NULL OR faltas3 IS NULL;
-- 13 
SELECT dni, nombre, apellidos,nivel, YEAR(fecha_nac) AS AÑO, MONTHNAME(fecha_nac) as MES
FROM alum2006
WHERE YEAR(fecha_nac)= '1988' AND MONTHNAME(fecha_nac)='March'; 
-- 14
-- Obtener DNI  y en otra la concatenación de las columnas nombres y apellidos
-- ordenanado por dni descendentemente
SELECT dni, concat(Nombre,  ' ', Apellidos) as 'Nombre Alum' 
FROM alum2006
ORDER BY dni ;
-- 15
-- Obtener nombre apekkidos de todos de 4º ESO de la clase B ordenados por 
-- apellidos y nombre ascendente.
SELECT nombre, apellidos 
FROM alum2006
WHERE nivel='ESO' AND clase='B'
ORDER BY nombre ASC, apellidos ASC;
-- 16 
-- Obtener nombre, apellidos y el total de faltas de los 3 trimestres de todos los alumnos de 4 de la ESO
-- de la clase B order by apellidos, nombre asc
SELECT nombre, apellidos, (faltas1+faltas2+faltas3) AS 'FALTAS TOTALES'
FROM alum2006
WHERE nivel='ESO' AND clase='B' AND curso='4'
ORDER BY nombre, apellidos ASC;
-- 17
-- dni, nombre, apellidos, curso, nivel, clase y edad de todos los alumnos ordenado por curso,nivel, clase 
-- ascendentemente y apellidos descendentemente cuyo nivel no sea ni ESO ni BAC
SELECT dni, nombre, apellidos, curso, nivel, clase, YEAR(CURDATE())-YEAR(fecha_nac) AS EDAD
FROM alum2006
WHERE nivel != 'ESO' AND nivel != 'BAC'
ORDER BY curso,nivel, clase ASC, 
apellidos DESC;
-- 18
-- Obtener igual anterior edad comprendidia entre 
SELECT dni, nombre, apellidos, curso, nivel, clase, YEAR(CURDATE())-YEAR(fecha_nac) AS EDAD
FROM alum2006
WHERE nivel != 'ESO' AND nivel != 'BAC' 
AND (YEAR(CURDATE())-YEAR(fecha_nac))  BETWEEN 22 AND 30
ORDER BY curso,nivel, clase ASC, 
apellidos DESC;