select * from empleados;
select * from departamentos;
-- 1.	Obtén apellido, oficio, nº de departamento y nombre de departamento
 -- de los empleados de los departamentos INVESTIGACIÓN y VENTAS ordenados por
 -- oficio descendentemente y por nombre de departamento ascendentemente.
 select e.apellido,e.oficio,e.dept_no,d.dnombre
 from empleados e, departamentos d
 where e.dept_no=d.dept_no
and (dnombre='investigacion' or dnombre='ventas')
order by e.oficio desc, d.dnombre asc;                    
-- 2.	Obtén el apellido, oficio, nº del departamento, nombre del departamento
--  de todos los empleados que tienen el mismo oficio que el empleado que se apellida TOVAR.
select e.apellido,e.oficio,e.dept_no,d.dnombre
from empleados e, departamentos d
where e.dept_no=d.dept_no
and e.oficio in(select oficio
				from empleados
                where apellido ='tovar');
-- 3.	Obtén nº de departamento, nombre y cantidad de empleados para 
-- todos los departamentos excepto para el departamento de VENTAS.
select d.dnombre,d.dept_no,count(e.emp_no) 'cantidad empleados'
from empleados e right join departamentos d
on d.dept_no=e.dept_no
where dnombre!='ventas'
group by e.dept_no,dnombre;
-- 4.	Obtén el salario medio.
select avg(salario)
from empleados;
-- 5.	Obtén para cada departamento el salario medio.
select d.dept_no,ifnull(avg(e.salario),0)'Salario medio',d.dnombre
from departamentos d left join empleados e
					on d.dept_no=e.dept_no
group by d.dept_no;
-- 6.	Obtén el salario medio del departamento CONTABILIDAD.
select d.dept_no,avg(e.salario),d.dnombre
from empleados e right join departamentos d
on d.dept_no=e.dept_no
where dnombre='contabilidad'
group by d.dept_no,dnombre;
-- 7.	Obtén para cada departamento el salario medio del departamento,
--  el salario máximo, el salario mínimo y la diferencia entre el salario máximo y el mínimo.
select d.dept_no,dnombre,ifnull(avg(salario),0), ifnull(min(salario),0),ifnull(max(salario),0), (ifnull(max(salario),0)-ifnull(min(salario),0)) 'diferencia'
from departamentos d left join empleados e
					on d.dept_no=e.dept_no
group by d.dept_no,dnombre;
-- 8.	Obtén para cada departamento el salario medio del departamento,
--  el salario máximo, el salario mínimo y la diferencia entre el salario
--  máximo y el mínimo; pero únicamente para los departamentos que tienen un 
-- salario medio superior a 2000 euros.
select d.dept_no,dnombre,ifnull(avg(salario),0), ifnull(min(salario),0),ifnull(max(salario),0), (ifnull(max(salario),0)-ifnull(min(salario),0)) 'diferencia'
from departamentos d left join empleados e
					on d.dept_no=e.dept_no
group by d.dept_no,dnombre
having avg(salario)>2000;
-- 9.	Obtén para cada departamento el salario medio del departamento,
--  el salario máximo, el salario mínimo y la diferencia entre el salario
--  máximo y el mínimo; pero únicamente para los departamentos que tienen
--  un salario medio superior o igual al salario medio del departamento de VENTAS.
select d.dept_no,dnombre,ifnull(avg(salario),0), ifnull(min(salario),0),ifnull(max(salario),0), (ifnull(max(salario),0)-ifnull(min(salario),0)) 'diferencia'
from departamentos d left join empleados e
					on d.dept_no=e.dept_no
where dnombre!='ventas'
group by d.dept_no
having avg(salario) >= (select avg(salario)
							from departamentos d left join empleados e
							on d.dept_no=e.dept_no
                            where dnombre='ventas');
-- 10.	Obtén nº de departamento, nombre y el salario medio de los departamentos
--  cuyo salario medio es superior al salario medio de todos los empleados.
select d.dept_no,dnombre,ifnull(avg(salario),0)
from departamentos d left join empleados e
					on d.dept_no=e.dept_no
group by d.dept_no,dnombre
having avg(salario) >= (select avg(salario)
							from empleados);
-- 11.	Obtén para cada oficio el número de empleados, pero únicamente para
--  los oficios que tienen más trabajadores que el oficio DIRECTOR.
select count(emp_no) 'Numero de empleados', oficio
from empleados
group by oficio
having count(emp_no) >(select count(emp_no)
						from empleados
                        where oficio ='director'); 
-- 12.	Obtén el nº de departamento, el nombre de departamento y la cantidad
--  de empleados para los departamentos que tienen más empleados que el
--  departamento de CONTABILIDAD.
select d.dept_no, dnombre, count(emp_no) 'Nº empleados'
from departamentos d left join empleados e
					on d.dept_no=e.dept_no
where dnombre!='contabilidad'
group by d.dept_no,d.dnombre
having count(emp_no) >(select count(emp_no)
						from departamentos d, empleados e
                        where e.dept_no=d.dept_no and dnombre='contabilidad'
                        group by d.dept_no); 
-- 13.	Obtén para todos los departamentos el nº de departamento,
--  el nombre de departamento y el número de oficios diferentes pero
--  únicamente para los departamentos en los que hay más oficios (diferentes)
--  que los que hay en el departamento de PRODUCCIÓN.
select d.dept_no, d.dnombre, count(distinct oficio) 'Nº oficios'
from departamentos d left join empleados e
					on d.dept_no=e.dept_no
group by d.dept_no,dnombre
having count(distinct oficio) >(select count(distinct oficio)
						from empleados e, departamentos d
                        where d.dept_no=e.dept_no
                        and dnombre='produccion');


-- Dada la base de datos EDITORIALES genera las siguientes consultas en MySQL:
select * from libros;
select * from editoriales;

-- 14.	Obtén para cada editorial código, nombre y número de libros vendidos (unidades vendidas).
select e.editorial,nombre,ifnull(sum(unidades_vendidas),0)'vendidas'
from editoriales e left join libros l
on l.editorial=e.editorial
group by  e.editorial;
-- 15.	Obtén  código, nombre y número de libros vendidos (unidades vendidas) 
-- para las editoriales que han vendido más libros que la editorial de código 20.ç
select e.editorial,codigo,nombre,ifnull(sum(unidades_vendidas),0)'Vendidos'
from editoriales e left join libros l
on l.editorial=e.editorial
group by e.editorial,nombre
having sum(unidades_vendidas) >(select ifnull(sum(unidades_vendidas),0)
								from libros
								where editorial=20);
-- 16.	Obtén  código, nombre y número de libros vendidos (unidades vendidas)
--  para las editoriales que han vendido más libros que la editorial PARANINFO.
select e.editorial,codigo,nombre,ifnull(sum(unidades_vendidas),0)'Vendidos'
from editoriales e left join libros l
on l.editorial=e.editorial
group by e.editorial
having sum(unidades_vendidas) >(select ifnull(sum(unidades_vendidas),0)
								from editoriales e left join libros l
								on l.editorial=e.editorial
                                where nombre='paraninfo');
-- 17.	Obtén la cantidad o número de libros de la editorial RAMA.
select count(codigo)'nº libros rama'
from editoriales e,libros l
where l.editorial=e.editorial
and nombre='rama';
-- 18.	Obtén para cada editorial el código, nombre y número de libros.
select e.editorial,e.nombre, ifnull(count(codigo),0)
from editoriales e left join libros l
on l.editorial=e.editorial
group by e.editorial,nombre;
-- 19.	Obtén código, nombre y número de libros para las editoriales 
-- que tienen más libros que la editorial RAMA.
select e.editorial,nombre,count(codigo) 'libros'
from editoriales e left join libros l
on l.editorial=e.editorial
group by e.editorial,nombre
having count(codigo) > (select count(codigo)
						from editoriales e left join libros l
						on l.editorial=e.editorial
                        where nombre='rama');
-- 20.	Obtén la última fecha de publicación.
select max(fecha_publicacion) 'Ultima fecha'
from libros;
-- 21.	Obtén los datos de los libros que se han publicado antes que el 
-- último libro publicado por la editorial MACGRAW-HILL.
select *
from libros
where fecha_publicacion < (select max(fecha_publicacion)
							from libros l,editoriales e
                            where e.editorial=l.editorial
                            and nombre='MCGRAW-HILL');
-- 22.	Obtén el código, titulo, nombre de la editorial y fecha de publicación
--  de los libros que se han publicado antes que el último libro publicado por la editorial MACGRAW-HILL.
select codigo,titulo,nombre,fecha_publicacion
from editoriales e,libros l
where l.editorial=e.editorial
and fecha_publicacion < (select max(fecha_publicacion)
							from libros l,editoriales e
                            where l.editorial=e.editorial
                            and nombre='MCGRAW-HILL');
-- 23.	Obtén cuántos años han pasado desde la publicación del último 
-- libro publicado por la editorial MACGRAW-HILL.
select year(current_date()) - year((select max(fecha_publicacion)
								from editoriales e,libros l
                                where e.editorial=l.editorial
                                and nombre='MCGRAW-HILL'))'Años desde la ult. publicacion de MCGRAW-HILL';
-- 24.	Obtén para cada libro el código, título, nombre de la editorial,
--  fecha de publicación y cuántos años han pasado desde su publicación.
select codigo, titulo,nombre, fecha_publicacion,year(curdate())- year(fecha_publicacion)'Años desde su publicacion'
from libros l, editoriales e
where l.editorial=e.editorial;