-- 1
SELECT * FROM alum2006;
-- 2
SELECT dni,nombre,apellidos,curso, nivel,clase
FROM alum2006;
-- 3
SELECT nombre,apellidos
FROM alum2006
WHERE poblacion = 'GUADALAJARA';
-- 4
-- hacemos lo siguiente para calcular la edad de cada uno
SELECT dni,nombre,apellidos,curso, nivel,clase, YEAR(CURDATE())-YEAR(fecha_nac) AS edad
FROM alum2006
ORDER BY nombre ASC, apellidos ASC, fecha_nac;
-- 5
-- Seleccionar el dni cuyaa fecha de nacimiento sea nula
SELECT dni
FROM alum2006
WHERE fecha_nac IS NULL;
-- 6
-- Todos los datos cuya fecha de nacimiento no sea nula
SELECT *
FROM alum2006
WHERE fecha_nac IS NOT NULL;
-- 7
-- Mostrar los alumnos que tengan el apellido perez 
SELECT dni,nombre,apellidos
FROM alum2006
WHERE apellidos 
LIKE '%Pérez%';
-- 8
-- Mostrar los datos que pertenecen a una de esas tres poblaciones
SELECT dni,nombre,apellidos,curso, nivel,clase
FROM alum2006
WHERE poblacion = 'MARCHAMALO' OR poblacion = 'CABANILLAS' OR poblacion ='YUNQUERA';
-- 9
-- Mostrar los datos entre 27 y 28 años
SELECT dni,nombre,apellidos,curso, nivel,clase, YEAR(CURDATE())-YEAR(fecha_nac) AS edad
FROM alum2006
WHERE YEAR(CURDATE())-YEAR(fecha_nac) BETWEEN 27 AND 28;
-- 10
-- Maximo de faltas de los alumnos
SELECT dni,nombre,apellidos, GREATEST(faltas1,faltas2,faltas3) 'Maximo faltas'
FROM alum2006
WHERE nivel ='ESO';
-- 11
SELECT dni,nombre,apellidos,nivel, (faltas1+faltas2+faltas3)/3 'Media faltas'
FROM alum2006;
-- 12
SELECT *
FROM alum2006
WHERE faltas1 IS NULL OR faltas2 IS NULL OR faltas3 IS NULL;
-- 13 
SELECT dni, nombre, apellidos,nivel, YEAR(fecha_nac) AS AÑO, MONTHNAME(fecha_nac) as MES
FROM alum2006
WHERE YEAR(fecha_nac)= '1988' AND MONTHNAME(fecha_nac)='March'; 
-- 14
SELECT dni, concat(Nombre,  ' ', Apellidos) as 'Nombre Alum' 
FROM alum2006
ORDER BY dni ;
-- 15
SELECT nombre, apellidos 
FROM alum2006
WHERE nivel='ESO' AND clase='B'
ORDER BY nombre ASC, apellidos ASC;
-- 16 
SELECT nombre, apellidos, (faltas1+faltas2+faltas3) AS 'FALTAS TOTALES'
FROM alum2006
WHERE nivel='ESO' AND clase='B' AND curso='4'
ORDER BY nombre, apellidos ASC;
-- 17
SELECT dni, nombre, apellidos, curso, nivel, clase, YEAR(CURDATE())-YEAR(fecha_nac) AS EDAD
FROM alum2006
WHERE nivel != 'ESO' AND nivel != 'BAC'
ORDER BY curso,nivel, clase ASC, 
apellidos DESC;
-- 18
SELECT dni, nombre, apellidos, curso, nivel, clase, YEAR(CURDATE())-YEAR(fecha_nac) AS EDAD
FROM alum2006
WHERE nivel != 'ESO' AND nivel != 'BAC' 
AND (YEAR(CURDATE())-YEAR(fecha_nac))  BETWEEN 22 AND 30
ORDER BY curso,nivel, clase ASC, 
apellidos DESC;




