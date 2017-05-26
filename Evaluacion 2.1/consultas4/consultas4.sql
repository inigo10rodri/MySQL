-- Dada la base de datos DEPARTAMENTOS genera las siguientes consultas en MySQL:
select * from departamentos;
select * from empleados;

-- 1.	Obtén, en orden alfabético, aquellos empleados que no trabajen ni en Madrid ni en Barcelona.
select ifnull(emp_no, 0), ifnull(apellido, "-"), loc
from empleados e right join departamentos d
on e.dept_no=d.dept_no
where loc!="madrid" and loc!="barcelona"
order by apellido asc;
-- 2.	Listar los nombres de los departamentos que tengan algún empleado con fecha de alta anterior a 1982.
select dnombre
from departamentos d left join empleados e
on d.dept_no=e.dept_no
where year(fecha_alt)<1992
group by dnombre;
-- 3.	Obtener los departamentos y sus nombres, siempre que haya más de un empleado trabajando en ellos. 
select d.dept_no, dnombre
from departamentos d left join empleados e
on d.dept_no=e.dept_no
group by dnombre
having count(emp_no)>1; 
-- 4.	Listar las localidades donde existan departamentos con empleados cuya comisión supere el 10% del salario. 
select loc
from departamentos d left join empleados e
on d.dept_no=e.dept_no
where comision>(0.1*salario)
group by loc;
-- 5.	Seleccionar aquellos departamentos en los que al menos exista un empleado con comisión. 
select d.dept_no, dnombre
from departamentos d left join empleados e
on d.dept_no=e.dept_no
group by dnombre
having count(comision>0)>1;
-- 6.	Listar aquellos departamentos en los que todos sus empleados carezcan de información sobre su comisión. 
select d.dept_no, dnombre
from departamentos d left join empleados e
on d.dept_no=e.dept_no
group by dnombre
having count(comision)=0
order by dept_no;
-- 7.	Visualizar el departamento con más empleados. 
select d.dept_no, dnombre, count(emp_no) 'cantidad'
from departamentos d left join empleados e
on d.dept_no=e.dept_no
group by dnombre
order by cantidad desc limit 1; 
-- 8.	Visualizar los departamentos en los que el salario medio de sus empleados sea mayor o 
-- igual que la media de todos los salarios. 
select d.dept_no, dnombre,avg(salario)
from departamentos d left join empleados e
on d.dept_no=e.dept_no
group by dnombre
having avg(salario)>=(select avg(salario) from empleados);
-- 9.	Visualizar el departamento con más presupuesto asignado para pagar el salario y la comisión de sus empleados. 
select d.dept_no, dnombre,(ifnull(sum(salario),0)+ifnull(sum(comision),0)) 'Presupuesto'
from departamentos d left join empleados e
on d.dept_no=e.dept_no
group by dnombre
order by Presupuesto desc limit 1;
-- 10.	Visualizar el departamento con más personal asignado del oficio ‘empleado’. 
select dept_no
from empleados e
where oficio='empleado'
group by dept_no
order by count(oficio) desc limit 1;
-- 11.	Visualizar el número y el nombre del departamento con más personal de oficio “empleado”,
--  usando las tablas de empleados y de departamentos. 
select d.dept_no, dnombre
from departamentos d left join empleados e
on d.dept_no=e.dept_no
where oficio='empleado'
group by dnombre
order by count(oficio) desc limit 1;
-- 12.	Obtén los apellidos y oficios de los empleados cuyo oficio coincida con algún oficio del departamento 20.
select apellido, oficio
from empleados
having oficio=
	(select oficio from empleados where dept_no=20);
-- 13.	Obtén los apellidos y oficios de los empleados cuyo oficio coincida con algún oficio del departamento “contabilidad”.
select apellido, oficio
from empleados
having oficio=
(select oficio from empleados e, departamentos d where dnombre="contabilidad");
-- 14.	Obtén los datos de los departamentos que no tengan empleados.

-- 15.	Obtén los datos de los departamentos que tengan empleados.

