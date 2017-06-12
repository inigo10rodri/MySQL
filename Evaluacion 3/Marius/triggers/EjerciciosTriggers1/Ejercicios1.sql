#--1
#a

DELIMITER //
CREATE TRIGGER insertar_depart2
AFTER INSERT 
	ON departamentos FOR EACH ROW
    
BEGIN
	DECLARE deptno tinyint(2);
    DECLARE nomdept varchar(15);
    SELECT NEW.dept_no INTO deptno;
    SELECT NEW.dnombre INTO nomdept;
    
	INSERT INTO auditoria_depart_i_b (fecha,hora,codigo_dept,nombre_dept,operacion) VALUES (CURDATE(),
    CURTIME(),NEW.dept_no,NEW.dnombre, 'insertar');
    
END; //
DELIMITER ;


#b
DELIMITER //
CREATE TRIGGER delete_depart
AFTER DELETE
ON departamentos FOR EACH ROW

BEGIN
	DECLARE deptno tinyint(2);
    DECLARE nomdept varchar(15);
    SELECT OLD.dept_no INTO deptno;
    SELECT OLD.dnombre INTO nomdept;
    
    INSERT INTO auditoria_depart_i_b (fecha,hora,codigo_dept,nombre_dept,operacion) VALUES (CURDATE(),
    CURTIME(),deptno,nomdept, 'BORRADO');
END; //
DELIMITER ;

#--2

DELIMITER //
CREATE TRIGGER modificar_depart
AFTER UPDATE
ON departamentos FOR EACH ROW

BEGIN
	DECLARE deptno_viejo VARCHAR(15);
    DECLARE dnombre_viejo VARCHAR(15);
    SELECT OLD.dept_no INTO deptno_viejo;
    SELECT OLD.dnombre INTO dnombre_viejo;
	
    INSERT INTO auditoria_depart_modif (fecha,hora,cod_dept_viejo,cod_dept_nuevo,nom_dept_viejo,nom_dept_nuevo) VALUES (
    CURDATE(),CURTIME(),deptno_viejo,NEW.dept_no,dnombre_viejo,NEW.dnombre
    );

END; //

DELIMITER //

