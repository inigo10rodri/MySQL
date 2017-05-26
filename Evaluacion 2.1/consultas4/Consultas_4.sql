-- CONSULTAS 4 --

-- Ejercicio 1 --
select ifnull(emp_no, 0), ifnull(apellido, "-"), loc
from empleados e right join departamentos d
on e.dept_no=d.dept_no
where loc!="madrid" and loc!="barcelona"
order by apellido asc;
-- Ejercicio 2 -- ******************
select dnombre
from departamentos d left join empleados e
on d.dept_no=e.dept_no
where year(fecha_alt)<1982;
-- Ejercicio 3 --
select d.dept_no, dnombre
from departamentos d left join empleados e
on d.dept_no=e.dept_no
group by dnombre
having count(emp_no)>1; 
-- Ejercicio 4 --
select loc, apellido
from departamentos d left join empleados e
on d.dept_no=e.dept_no
where comision>(0.1*salario);
-- Ejercicio 5 --
select d.dept_no, dnombre
from departamentos d left join empleados e
on d.dept_no=e.dept_no
group by dnombre
having count(comision>0)>1;
-- Ejercicio 6 --
select d.dept_no, dnombre
from departamentos d left join empleados e
on d.dept_no=e.dept_no
where comision is null
group by dnombre;
-- Ejercicio 7 --
select d.dept_no, dnombre, count(emp_no) "cantidad"
from departamentos d left join empleados e
on d.dept_no=e.dept_no
group by dnombre
order by cantidad desc limit 1; 
-- Ejercicio 8 --
select d.dept_no, dnombre
from departamentos d left join empleados e
on d.dept_no=e.dept_no
group by dnombre
having avg(salario)>=(select avg(salario) from empleados);
-- Ejercicio 9 --
select d.dept_no, dnombre
from departamentos d left join empleados e
on d.dept_no=e.dept_no
group by dnombre
having max(salario+comision);
-- Ejercicio 10 --
select dept_no
from empleados e
group by dept_no
having max(oficio="empleado");
-- Ejercicio 11 --
select d.dept_no, dnombre
from departamentos d left join empleados e
on ddept_no=e.dept_no
group by dnombre
having max(oficio="empleado");
-- Ejercicio 12 -- *****************
select apellido, oficio
from empleados
having oficio=
	(select oficio from empleados where dept_no=20);
-- Ejercicio 13 -- *****************
select apellido, oficio
from empleados
having oficio=
	(select oficio from empleados e, departamentos d where dnombre="contabilidad");
-- Ejercicio 14 --
select *
from departamentos d left join empleados e

-- Ejercicio 15 --

select * from departamentos;
select * from empleados;