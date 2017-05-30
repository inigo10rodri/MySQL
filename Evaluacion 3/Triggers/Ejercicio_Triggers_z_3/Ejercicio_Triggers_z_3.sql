describe empleados;
create table AUDITORIA_EMPLEADO(fecha date,hora time,    
num_empl_viejo SMALLINT(4),
num_empl_nuevo SMALLINT(4),
apellido_empl_viejo VARCHAR(10),
apellido_empl_nuevo VARCHAR(10),  
operacion VARCHAR(15));

-- 3.a
DELIMITER |
CREATE trigger INSETAR_EMPLEADO AFTER INSERT On EMPLEADOS
for each row begin
insert into AUDITORIA_EMPLEADO value(
curdate(),curtime(),NULL, new.emp_no,NULL,new.apellido,"Insertar");
END;
|
DELIMITER ;

INSERT INTO EMPLEADOS VALUES(3242,"Alejandrez","Editor",3423,'2015-12-17',2000,350,20);
INSERT INTO EMPLEADOS VALUES(9987,"Larrañaga","Compresor",9685,'2013-10-27',1900,250,10);
select * from empleados where apellido="Larrañaga";
select * from AUDITORIA_EMPLEADO;
-- 3.b 
DELIMITER |
CREATE trigger BORRAR_EMPLEADO AFTER DELETE ON EMPLEADOS
FOR EACH ROW BEGIN 
insert into AUDITORIA_EMPLEADO value(
curdate(),curtime(),OLD.emp_no,NULL,OLD.apellido,NULL,"Borrar");
END;
|
DELIMITER ;
DELETE from empleados where apellido="Alejandrez";
-- 3.c
DELIMITER |
CREATE trigger MODIFICAR_EMPLEADO after update on empleados
for each row begin
insert into AUDITORIA_EMPLEADO value(
curdate(),curtime(),OLD.emp_no,NEW.emp_no,OLD.apellido,NEW.apellido,"Modificado"
);
END;
|
DELIMITER ;

update empleados set salario=salario+2223 where apellido="Larrañaga" ;
update empleados set apellido="Gutierrez" where apellido="Larrañaga" ;