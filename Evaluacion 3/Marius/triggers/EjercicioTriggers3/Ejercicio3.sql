#a
DELIMITER //
CREATE TRIGGER insert_empleado3
AFTER INSERT 
ON empleados FOR EACH ROW 

BEGIN
	


	INSERT INTO auditoria_empleado (fecha,hora,num_empl_nuevo,operacion) VALUES (
	CURDATE(),CURTIME(),NEW.emp_num, 'insertar');

    
    
END; //
DELIMITER ;

#b
DELIMITER //
CREATE TRIGGER delete_empleados
AFTER DELETE
ON empleados FOR EACH ROW 

BEGIN
	
    INSERT INTO auditoria_empleado (fecha,hora,num_empl_viejo,apellido_empl_viejo,operacion) VALUES (
    CURDATE(),CURTIME(),OLD.emp_num,OLD.apellido,'DELETE'
    );

END; //
DELIMITER ;

#c

DELIMITER //
CREATE TRIGGER modificar_empleados
AFTER UPDATE
ON empleados FOR EACH ROW

BEGIN
	DECLARE num_viejo SMALLINT(4);
    DECLARE apellido_viejo VARCHAR(15);
    
	SELECT OLD.emp_num into num_viejo;
    SELECT OLD.apellido into apellido_viejo;
    
    INSERT INTO auditoria_empleado(fecha,hora,num_empl_viejo,num_empl_nuevo, apellido_empl_viejo
    ,apellido_empl_nuevo,operacion) VALUES (CURDATE(),CURTIME(),num_viejo,NEW.emp_num,apellido_viejo,
    NEW.apellido,'MODIF');

END; //
DELIMITER ;