-- 1
SELECT nombre_alumno
FROM notas_alumnos
WHERE nota2 = 9;
-- 2
SELECT Nombre_alumno, (nota1+nota2+nota3)/3 "Nota media"
FROM notas_alumnos;
-- 3
SELECT Nombre_alumno 
FROM notas_alumnos
WHERE (nota1+ nota2+nota3)/3 > 6;

-- 4
SELECT Nombre_alumno 
FROM notas_alumnos
WHERE (nota1+nota2+nota3)/3 >6;
-- 5
SELECT Nombre_alumno
FROM notas_alumnos
WHERE nota1 = 7
AND (asignatura = 'LENGUA' OR asignatura = 'MATEMÁTICAS');
-- 6 
SELECT Nombre_alumno, Asignatura
FROM notas_alumnos
WHERE curso = '3ESO'
AND (nota1 = 8 OR nota2 = 8 OR nota3 =8);
-- 7
SELECT * 
FROM notas_alumnos 
ORDER BY Nombre_alumno 
DESC;
-- 8
SELECT Nombre_alumno, (nota1+nota2+nota3)/3 'Nota media'
FROM notas_alumnos
ORDER BY (nota1+nota2+nota3)/3;
-- 8.1
SELECT Nombre_alumno, (nota1+nota2+nota3)/3 'Nota media'
FROM notas_alumnos
ORDER BY 2;
-- 9
SELECT Asignatura, Nombre_alumno 
FROM notas_alumnos
ORDER BY Asignatura, nombre_alumno 
DESC;
-- 9.1
SELECT Asignatura, Nombre_alumno 
FROM notas_alumnos
ORDER BY 1, 2
DESC;
-- 10
SELECT Nombre_alumno 
FROM notas_alumnos
WHERE nota1 = 7 
AND (nota1 + nota2 + nota3)/3 >6
ORDER BY 1;
-- 11
SELECT *
FROM notas_alumnos
WHERE nota3 <> 8
AND asignatura = 'MATEMATICAS';
-- 12
SELECT *
FROM notas_alumnos 
WHERE nombre_alumno
LIKE 'C%';
-- 13
SELECT *
FROM notas_alumnos
WHERE nombre_alumno
LIKE '%Sánchez%';
-- 14
SELECT *
FROM notas_alumnos
WHERE nombre_alumno
LIKE 'Sánchez';
-- No se obtiene nada
-- 14
SELECT *
FROM notas_alumnos
WHERE nombre_alumno
LIKE 'Sánchez';
-- No se obtiene nada
-- 14
SELECT *
FROM notas_alumnos
WHERE nombre_alumno
LIKE 'Sánchez';
-- No se obtiene nada
-- 14
SELECT *
FROM notas_alumnos
WHERE nombre_alumno
LIKE 'Sánchez';
-- No se obtiene nada
-- 14
SELECT *
FROM notas_alumnos
WHERE nombre_alumno
LIKE 'Sánchez';
-- No se obtiene nada