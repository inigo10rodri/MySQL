SELECT * FROM alumnos;
SELECT * FROM asignaturas;
SELECT * FROM departamentos;
SELECT * FROM empleados;
SELECT * FROM notas;
-- consultas
-- 1
select apellido,oficio,emp_no,dnombre,loc
from departamentos d, empleados e
where d.dept_no = e.dept_no;
-- 12.11
select apenom,nombre,nota
from alumnos,asignaturas,notas
where alumnos.nif = notas.nif and asignaturas.cod = notas.cod;
-- 12.12
select apenom,nombre,nota
from alumnos,asignaturas,notas
where alumnos.nif = notas.nif and asignaturas.cod = notas.cod
and nombre = 'FOL' and nota= '8';
-- 12.13
select avg(salario) 'Salario Medio' 
from empleados;
-- 12.14
select avg(salario)
from empleados
where dept_no =10;
-- 12.15
select count(*) 'Filas'
from empleados;
-- 12.16
select count(comision)
from empleados;
-- 12.17
select max(salario)
from empleados;
-- 12.18
select min(apellido)
from empleados
where dept_no=20;
-- 12.19
select sum(salario)
from empleados;
-- 12.4.1
select count(*) 'Nº Empleado dept 30'
from empleados
where dept_no=30;
-- 12.4.2
select sum(salario) 'suma salarios dept.30'
from empleados
where dept_no=30;
-- 12.5
select count(oficio) 'Total oficios' 
from empleados;
-- 12.5.1
select count(distinct oficio) 'Oficios distintos'
from empleados;
-- 12.20
select dept_no, avg(salario)
from empleados
group by dept_no;
-- 12.21
select dept_no, count(*)
from empleados
group by dept_no;
-- 12.22
select dept_no, count(*)
from empleados
group by dept_no
having count(*) >3;
-- 12.23
select dept_no, count(*)
from empleados
group by dept_no
having count(*) >3
order by count(*) desc;
-- 12.24
select dept_no, max(salario)
from empleados
group by dept_no;
-- -----------------------------------------------------------------
-- SUBCONSULTAS
-- 12.8
select apellido,oficio,salario
from empleados
where salario=(select salario
				from empleados
                where apellido='sala');
-- 12.31 
select apellido
from empleados
where oficio in(select oficio
				from empleados
                where dept_no=20);
-- 12.32
select apellido,salario,dept_no 
from empleados
where dept_no =(select dept_no
				from empleados
                where apellido='arroyo')
and salario < (select salario
				from empleados
                where apellido='arroyo');
-- 12.33
select dept_no 
from departamentos
where dnombre = 'ventas';
-- ----------------------
select *
from empleados 
where dept_no=30;
-- 12.34
select *
from empleados where dept_no=(select dept_no
							from departamentos
                            where dnombre='ventas');
-- 12.35

