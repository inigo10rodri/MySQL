-- Ejercicios parte 1
-- 1
SELECT num_matricula,nombre,poblacion,tlf
FROM alumnos;
-- 2
SELECT *
FROM alumnos
WHERE poblacion = 'Madrid' AND num_hermanos>1;
-- 3
SELECT num_matricula,nombre,poblacion,tlf
FROM alumnos
WHERE poblacion
LIKE '%S%';
-- 4
SELECT *
FROM alumnos
WHERE nombre
LIKE '%Juan%';
-- 5
SELECT *
FROM alumnos
WHERE cod_curso
LIKE 'CS001';
-- 6
SELECT *
FROM asignaturas
WHERE denominacion = 'Informatica' OR denominacion='Lengua';
-- 7
SELECT *
FROM asignaturas
WHERE tipo = 'TRONCAL';
-- 8
SELECT num_matricula,nombre,poblacion,num_hermanos
FROM alumnos
WHERE poblacion ='Alcala de Henares' OR poblacion='MAdrid' OR poblacion='Guadalajara';
-- 9
SELECT num_matricula,nombre,poblacion,num_hermanos
FROM alumnos
WHERE poblacion !='Alcala de Henares' AND poblacion!='MAdrid' AND poblacion!='Guadalajara';
-- 10
SELECT num_matricula,nombre,poblacion,num_hermanos
FROM alumnos
WHERE (poblacion ='Alcala de Henares' OR poblacion='MAdrid' OR poblacion='Guadalajara')
AND num_hermanos<3;
-- 11
SELECT nombre,num_matricula
FROM alumnos
WHERE cod_curso = 'CS001'
ORDER BY num_matricula;
-- 12
SELECT *
FROM alumnos
WHERE poblacion != 'Madrid';
-- 13
SELECT *
FROM alumnos
WHERE poblacion != 'Madrid'
ORDER BY poblacion;
-- 14
SELECT *, (num_hermanos*10) 'DESCUENTO'
FROM alumnos;
-- 15
SELECT *
FROM alumnos
WHERE poblacion NOT LIKE '%a%';
-- 16
SELECT *
FROM alumnos
ORDER BY poblacion DESC,nombre ASC;
-- Ejercicios parte 2
-- 1
SELECT *
FROM alumnos
WHERE length(poblacion)<7;
-- 2
SELECT *
FROM alumnos
WHERE (length(poblacion)>7) AND poblacion NOT LIKE 'A%';
-- 3
SELECT num_matricula,nombre,poblacion,(80-(num_hermanos*10))'MATRICULA'
FROM alumnos
WHERE poblacion = 'Madrid';
-- 4
SELECT num_matricula,nombre,cod_curso
FROM alumnos
WHERE (num_hermanos=2 OR num_hermanos=3) 
AND cod_curso LIKE 'CS001' AND poblacion NOT LIKE 'Madrid';
-- 5
SELECT *
FROM alumnos
WHERE (poblacion NOT LIKE 'a%' OR 'v%') AND tlf LIKE '91%';
-- 6
SELECT *
FROM alumnos
WHERE (poblacion LIKE 'v%' OR 'm%' OR 'g%') AND tlf NOT LIKE '912%';
-- Ejercicios departamentos
-- 1
SELECT nºemple,apellido,salario
FROM empleados
WHERE salario BETWEEN '1000' AND '2000';
-- 2
SELECT nºdepart,nombre,localidad
FROM departamentos
WHERE localidad LIKE 'm%';
-- 3
SELECT nºdepart,nombre,localidad
FROM departamentos
WHERE localidad LIKE '%e%' 
AND localidad NOT LIKE 'm%';
-- 4
SELECT *
FROM departamentos
WHERE localidad LIKE 'madrid' 
OR localidad LIKE'Barcelona'; 
-- 5
SELECT *
FROM departamentos
WHERE localidad LIKE '_a%';
-- 6
SELECT apellido,salario,comision,(comision+salario)'NUEVO SALARIO'
FROM empleados;

