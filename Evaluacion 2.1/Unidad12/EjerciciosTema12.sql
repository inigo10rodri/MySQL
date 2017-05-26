-- 12.1
select apellido,oficio,dnombre
from empleados e, departamentos d
where d.dept_no = e.dept_no
and (oficio='ANALISTA');
-- 12.2
select apellido,oficio,dnombre,loc
from empleados e,departamentos d
where d.dept_no = e.dept_no and oficio != 'analista' and oficio != 'director'
order by apellido;
-- 12.3
select d.dept_no,ifnull(max(salario),0)'Salario maximo',dnombre
from empleados e right join departamentos d
on d.dept_no = e.dept_no
group by d.dept_no,dnombre;
-- 12.4
select d.dept_no,ifnull(sum(salario),0.0)'Suma Salario',dnombre
from empleados e right join departamentos d
on d.dept_no = e.dept_no
group by d.dept_no,dnombre;
-- 12.5
select apenom
from alumnos a,notas n
where (n.nif=a.nif)
and (nota<5) and (pobla ='madrid');
-- 12.5.1(SUBCONSULTAS)
select apenom
from alumnos
where(nif in(select nif
			from notas
            where nota<5))
and (pobla='madrid');
-- 12.6
select nombre
from asignaturas asig,notas n, alumnos al
where (asig.cod=n.cod) and(al.nif=n.nif) 
and (nombre like '%o%o%o%') 
and (pobla ='madrid');
-- 12.6.1(SUBCONSULTAS)
select nombre
from asignaturas
where (nombre like "%o%o%o%")
and (cod in(select cod
			from notas
            where nif in(select nif
						from alumnos
                        where pobla="madrid")));
-- 12.10
select codigo,titulo,autor
from libros l,editoriales e
where (l.editorial=e.editorial) and (nombre like 'paraninfo');
-- 12.10.1(SUBCONSULTAS)
select codigo,titulo,autor
from libros
where editorial = (select editorial
					from editoriales
                    where nombre='paraninfo');
-- 12.11
select e.editorial, nombre, count(l.codigo) 'Num Libros'
from editoriales e left join libros l
on (e.editorial=l.editorial)
group by e.editorial;
-- 12.13
select e.editorial,nombre,titulo
from libros l, editoriales e
where (l.editorial=e.editorial)
order by 1,3 desc;
-- --------------SUBCONSULTAS-----------------
-- 12.7
select *
from asignaturas where cod not in(select cod
									from notas);
-- 12.8
select apenom 
from alumnos where nif not in(select nif
							from notas
                            where cod='1');
-- 12.9
select apenom,nota
from alumnos al,notas n
where (n.nif=al.nif) and nota=(select max(nota)
						from notas);
-- 12.12
select editorial,nombre,localidad
from editoriales 
where editorial not in(select editorial
						from libros);



