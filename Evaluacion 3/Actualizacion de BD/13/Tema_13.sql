-- 1 
INSERT INTO empleados
	(emp_no,apellido,oficio,dir,fecha_alt,
	salario,comision, dept_no)
VALUES
	(1000,'Quevedo','Analista',7782,curdate(),3000,0,40);
	describe empleados;
-- 2
insert into empleados
	(emp_no,apellido,oficio,salario,dept_no)
VALUES 
	(1001,'Rodriguez','Analista',3000,40);
-- 3
insert into empleados
	(emp_no,apellido)
values (1002,'Pérez');-- No se puede insertar un valor null en dept_no
-- 4
INSERT INTO empleados
	(emp_no,apellido,oficio,dir,fecha_alt,
	salario,comision, dept_no) 
    select 
    emp_no, apellido,  oficio,dir,fecha_alt,salario,comision,dept_no
    from empleados where dept_no=30;
    
-- 4.1 Esta daria el mismo resultado
insert into emple30
select * from empleados where dept_no=30;
select * from emple30;
-- 5 Calculamos el departamento que tiene tres empleados
SELECT dept_no
from empleados 
group by dept_no
having count(*)-3;

INSERT INTO empleados(emp_no, apellido, dept_no)
SELECT 1003, 'López', dept_no
FROM empleados group by dept_no 
having count(*)-3;

-- 5 Cambiar el salario a la mitad y la comisión a 0 para aquellos empleados
-- que pertenezcan al departamento de Producción
UPDATE empleados 
set salario = salario/2, comision = 0
Where dept_no = 
				(select dept_no from departamentos
                where dnombre = 'Produccion');
-- Comprobamos
select * from empleados where dept_no=(select dept_no from departamentos
                where dnombre = 'Produccion');
  
-- 6 Modificamos el apellido de los empleados  a minuscula y el salario al
-- docle de aquellos del departamento 40
Update empleados 
set apellido = lower(apellido), salario= salario *2
where dept_no = 40;
	
-- 7 Igualar el salario y oficio de Fernández tabla empleados  al salario 
-- y oficio de Arroyo da la tabla Emple30.
UPDATE empleados set salario =
				(select salario from emple30
					where apellido = 'Arroyo'),
	oficio = (select oficio from emple30 
				where apellido = 'Arroyo')
	where apellido ='Fernández';
-- 13.5
 UPDATE empleados
 set dept_no = (select dept_no from
				departamentos where 
                dnombre='Contabilidad')			
where apellido= 'Fernandez';
-- ***************************************************************************
-- 13.5 
-- Borrar el departamento de la tabla DEPARTAMENTOS cuyo número es el 50.
DELETE FROM departamentos WHERE dept_no = 50; -- No existe el departamento 50
-- Borrar el departamento de la tabla departamentos que no tengan empleados.
DELETE FROM departamentos where dept_no NOT IN
(SELECT DISTINCT dept_no FROM empleados);
 
-- 3. Escribimos y ejecutamos las siguientes órdenes en el Área de consulta SQL
Insert into innoprueba values (200);
Insert into innoprueba values (202);
select * from innoprueba ;

-- 13.1
insert into profesores(apellidos,especialidad,cod_centro)
			values('Quiroga Martín,A.Isabel','Informática',45)
;
-- 13.2
insert into profesores(apellidos,especialidad,cod_centro,dni)
			values('Gonzalez Sevilla,Migel.A','Historia',22,23444800)
;
-- 13.3
-- Insertar en la tabla personal los profesorese de la tabla profesores.
-- (cod_centro,dni,apellidos,funcion Profesor,salario 1900)
insert into personal 
	(cod_centro,dni,apellidos,funcion ,salario)
	select cod_centro,dni,apellidos,'Profesor',1900
	from profesores
;
-- 13.4
-- Inserta en la tabla profesores un profesor de apaellidos y nombre Guijarro Alía, Manuela',
-- 'Informática',28848110 de la especialidad informática en el código de centro que tenga dos 
-- trabajadores cuya función sea conserje.
    INSERT INTO PROFESORES(apellidos,dni,especialidad,cod_centro)
    SELECT 'Guijarro Alía ,Manuela', 28848110, 'INFORMÁTICA', pf.cod_centro
    FROM profesores AS pf INNER JOIN personal AS p 
    ON pf.cod_centro = p.cod_centro
    WHERE p.funcion = 'CONSERJE'
    GROUP BY p.cod_centro
    HAVING COUNT(p.DNI) = 2;

-- 13.5
-- Sea la tabla CENTROS.Cambiar la dirección de cod_centro 22 a 'C/Ilon 13'
-- y el número de plazas a 295.
UPDATE centros 
SET direccion= 'C/Ilon 13', num_plazas=295
WHERE cod_centro=22;
select * from centros where cod_centro=22;
-- 13.6
-- Modificar en la tabla PERSONAL el cod_centro de aquellos cuya función sea
-- conserje igualando al código de centro donde hay dos profesores de la especialidad informárica
-- (obtener los datos de los profesores de la tabla profesores)
Update personal
set cod_centro = (select cod_centro 
					from profesores 
                    where especialidad= 'informática'
                    group by cod_centro
                    HAVING count(cod_centro)=2)
WHERE funcion='Conserje'
;
select * from profesores;

-- 13.7
-- Sumar 50 al número de plazas (columna num_plazas) de la tabla CENTROS ,para aquellos
-- centros que tengan profesores de la especialidad de informática
UPDATE CENTROS 
set  num_plazas=num_plazas+50 
WHERE cod_centro IN (select cod_centro 
					from profesores
                    where especialidad = 'informatica')
;
select * from centros ;  
-- 13.8 
-- Eliminar de la tabla centros aquellos centros que no tengan profesores de la especialidad
-- de 'informática'
DELETE FROM centros 
WHERE cod_centro = (select cod_centro
					  from profesores
                      where especialidad='informatica'
                      group by cod_centro
                      having count(especialidad)=0
                    )
;

DELETE FROM centros 
WHERE cod_centro NOT IN (select cod_centro
					  from profesores
                      where especialidad='informática')
;

select c.cod_centro,c.nombre,  count(p.especialidad) As ghsdhf from centros AS c INNER JOIN  profesores As p
ON c.cod_centro= p.cod_centro
                      group by p.cod_centro
                      having count(p.especialidad)>=2;
-- 13.9
-- Eliminar de la tabla personal aquellas filas cuyo código de centro no exista en la tabla centros
delete from personal
where cod_centro =(select cod_centro from centros
                    group by cod_centro
                    HAVING count(*)=0)
;
delete from personal
where cod_centro NOT IN(select cod_centro 
					from centros)
;

-- 13.10
-- Eliminar de la tabla profesores aquellas filas cuyo dni sea nulo.

-- Insertamos un profesor con dni null por que no hay
insert into profesores(apellidos,especialidad,cod_centro,dni)
			values('Ruiz Revilla,Migel.A','Historia',22,null)
;
-- y lo borramos
delete from profesores
where dni is null
;


select * from personal;
select * from profesores;
select * from empleados ;
select * from departamentos ;
describe empleados;
