-- 1.	Obtén el apellido, oficio, nº del departamento, 
-- nombre del departamento de todos los empleados.
select apellido,oficio,d.dept_no,dnombre
from empleados e,departamentos d
where e.dept_no=d.dept_no;
-- 2.	Obtén apellido, oficio, nº de departamento y 
-- nombre de departamento de los empleados de los departamentos
--  10 y 30 ordenados por apellido descendentemente y por nombre 
-- de departamento ascendentemente.
select apellido,oficio,e.dept_no,d.dept_no,dnombre
from empleados e, departamentos d
where d.dept_no=e.dept_no 
and (e.dept_no=10 or e.dept_no=30)
order by e.apellido desc,dnombre asc;
-- 3.	Obtén nº de departamento, nombre y cantidad
--  de empleados para todos los departamentos excepto
--  para el departamento 10.
select d.dept_no,dnombre,count(emp_no)'cantidad empleados'
from empleados e right join departamentos d
on d.dept_no = e.dept_no
where d.dept_no!=10
group by d.dept_no;
-- 4.	Obtén nº de departamento, nombre y el salario
--  medio del departamento para los departamentos 10 y 30.
select d.dept_no ,dnombre,ifnull(avg(salario),0) 'Salario medio'
from departamentos d left join empleados e
on d.dept_no = e.dept_no
where d.dept_no=10 or d.dept_no=30
group by d.dept_no;
-- 5.	Obtén para los empleados cuyo oficio no sea ni
--  Vendedor ni Analista el nombre, oficio, salario,
--  nº departamento y nombre de departamento.
select apellido,oficio,salario,e.dept_no,dnombre
from empleados e, departamentos d
where d.dept_no=e.dept_no and oficio not in ('vendedor','analista');
-- 6.	Obtén para cada oficio el número de empleados,
--  pero únicamente para los oficios que tienen 3 o más trabajadores.
select oficio, count(emp_no)'nº empleados'
from empleados e
group by oficio
having count(emp_no) >=3;
-- 7.	Obtén para cada oficio el salario medio.
select oficio,ifnull(avg(salario),0) 'Salario medio'
from empleados
group by oficio;
-- 8.	Obtén el nº de departamento, el nombre de departamento
--  y la cantidad de empleados para los departamentos que
--  tienen más de 5 empleados.
select d.dept_no,dnombre,count(emp_no) 'nº empleados'
from departamentos d,empleados e
where d.dept_no=e.dept_no
group by d.dept_no
having count(emp_no)>5;
-- 9.	Obtén el nº de departamento, el nombre de departamento
--  y la cantidad de empleados para los departamentos que 
-- tienen menos de 4 empleados ordenado por cantidad de trabajadores.
select d.dept_no,dnombre,count(emp_no) 'nº empleados'
from departamentos d left join empleados e
				on d.dept_no=e.dept_no
group by d.dept_no
having count(emp_no) <4
order by count(emp_no) asc;
-- 10.	Obtén para todos los departamentos el nº de departamento,
--  el nombre de departamento y el número de oficios diferentes.
select d.dept_no,dnombre 'departamento',count(distinct oficio) 'nº oficios distintos'
from departamentos d left join empleados e
					on d.dept_no=e.dept_no
group by d.dept_no;
-- 11.	Obtén el nº de departamento, nombre del departamento
--  y el salario mínimo de todos los departamentos.
select d.dept_no,dnombre 'departamento',ifnull(min(salario),0) 'nº oficios distintos'
from departamentos d left join empleados e
					on d.dept_no=e.dept_no
group by d.dept_no;
