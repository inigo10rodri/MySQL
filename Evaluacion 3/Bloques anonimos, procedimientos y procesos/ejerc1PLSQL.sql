set serveroutput on;

DECLARE

departId NUMBER(4,0);

BEGIN


for i in (SELECT MANAGER_ID,COUNT(MANAGER_ID) AS numEmployees FROM EMPLEADOS GROUP BY MANAGER_ID) loop
    dbms_output.put_line(i.MANAGER_ID || ' ' || i.numEmployees);
    
    BEGIN
    SELECT DEPARTAMENTO_ID INTO departId FROM EMPLEADOS WHERE EMPLEADO_ID = i.MANAGER_ID;
    
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            departId := NULL;
    END;
    
    IF (departId = 90) THEN
    
        UPDATE EMPLEADOS
        SET SALARIO = SALARIO + 30
        WHERE EMPLEADO_ID = i.MANAGER_ID;
        
        IF (i.numEmployees = 0) THEN
        
            UPDATE EMPLEADOS
            SET SALARIO = SALARIO + 50
            WHERE EMPLEADO_ID = i.MANAGER_ID;
            
        ELSIF (i.numEmployees = 1) THEN
        
             UPDATE EMPLEADOS
             SET SALARIO = SALARIO + 80
             WHERE EMPLEADO_ID = i.MANAGER_ID;
             
        ELSIF (i.numEmployees = 2) THEN 
        
             UPDATE EMPLEADOS
             SET SALARIO = SALARIO + 100
             WHERE EMPLEADO_ID = i.MANAGER_ID;
             
        ELSIF (i.numEmployees >= 3) THEN
        
             UPDATE EMPLEADOS
             SET SALARIO = SALARIO + 110
             WHERE EMPLEADO_ID = i.MANAGER_ID;
        ELSE
            dbms_output.put_line('Nada que actualizar');

        END IF;
        
    ELSE
    
        IF (i.numEmployees = 0) THEN
    
        UPDATE EMPLEADOS
        SET SALARIO = SALARIO + 50
        WHERE EMPLEADO_ID = i.MANAGER_ID;
            
        ELSIF (i.numEmployees = 1) THEN
        
             UPDATE EMPLEADOS
             SET SALARIO = SALARIO + 80
             WHERE EMPLEADO_ID = i.MANAGER_ID;
             
        ELSIF (i.numEmployees = 2) THEN 
        
             UPDATE EMPLEADOS
             SET SALARIO = SALARIO + 100
             WHERE EMPLEADO_ID = i.MANAGER_ID;
             
        ELSIF (i.numEmployees >= 3) THEN
        
             UPDATE EMPLEADOS
             SET SALARIO = SALARIO + 110
             WHERE EMPLEADO_ID = i.MANAGER_ID; 
        
        ELSE 
             dbms_output.put_line('Nada que actualizar');

        END IF;    
    
    
    END IF;    
        
    
    
end loop;



END;

set serveroutput on;
DECLARE
deptID number;
deptNombre VARCHAR2(30 BYTE);
numEmpl NUMBER;
salarioMedio NUMBER;
mejorPagado NUMBER(8,2);
mejorPagadoTrabajoId VARCHAR2(10 BYTE);
mejorPagadoOcupacion VARCHAR2(35 BYTE);
mejorPagadoNombre VARCHAR2(20 BYTE);

PROCEDURE detallesDepartamento(deptID IN number, deptNombre OUT VARCHAR2, numEmpl OUT NUMBER, salarioMedio OUT  VARCHAR2, mejorPagadoOcupacion OUT VARCHAR2,mejorPagadoNombre OUT VARCHAR2) IS
BEGIN

    SELECT DEPARTAMENTO_NOMBRE INTO deptNombre FROM DEPARTAMENTOS WHERE DEPARTAMENTO_ID = deptID;
    
    SELECT COUNT(EMPLEADO_ID) INTO numEmpl FROM EMPLEADOS WHERE DEPARTAMENTO_ID = deptID;
    
    SELECT AVG(SALARIO) INTO salarioMedio FROM EMPLEADOS WHERE DEPARTAMENTO_ID = deptID;
    
    SELECT MAX(SALARIO) INTO mejorPagado FROM EMPLEADOS WHERE DEPARTAMENTO_ID = deptID;
    
    SELECT TRABAJO_ID INTO mejorPagadoTrabajoId FROM EMPLEADOS WHERE SALARIO = mejorPagado;
    
    SELECT TRABAJO_NOMBRE INTO mejorPagadoOcupacion FROM TRABAJOS WHERE TRABAJO_ID = mejorPagadoTrabajoId;
    
    SELECT NOMBRE INTO mejorPagadoNombre FROM EMPLEADOS WHERE SALARIO = mejorPagado;

END;

BEGIN

    deptID := 99;
    
    detallesDepartamento(deptID,deptNombre,numEmpl,salarioMedio,mejorPagadoOcupacion,mejorPagadoNombre);
    
      dbms_output.put_line('El departamento ' || deptNombre || ' tiene: ');
      dbms_output.put_line('Número de empleados: ' || numEmpl);
      dbms_output.put_line('El salario medio es: ' || salarioMedio);
      dbms_output.put_line('Empleado con mayor salario trabaja como : ' || mejorPagadoOcupacion);
      dbms_output.put_line('Y se llama: ' || mejorPagadoNombre);

END;




