DECLARE
  nombre DEPARTAMENTOS.DEPARTAMENTO_NOMBRE%TYPE;
  depar DEPARTAMENTOS.DEPARTAMENTO_ID%TYPE;
  nEmple EMPLEADOS.EMPLEADO_ID%TYPE;
  sMedio EMPLEADOS.SALARIO%TYPE;
  empleMN EMPLEADOS.NOMBRE%TYPE;
  trabajEmple TRABAJOS.TRABAJO_NOMBRE%TYPE;
  trabajId TRABAJOS.TRABAJO_ID%TYPE;
BEGIN
  nombre:=&NombreDepartamento;
  
  select departamento_id into depar from departamentos where departamento_nombre=nombre;
  select count(empleado_id),avg(salario) into nEmple,sMedio from empleados where departamento_id=depar ;
  select avg(salario) into sMedio from empleados where departamento_id=depar;
  select nombre,trabajo_id into empleMN,trabajId from empleados where salario in(select max(salario) from empleados);
  select trabajo_nombre into trabajEmple from trabajos where trabajo_id=trabajId;
   
  dbms_output.put_line('El departamento ' || nombre || ' tiene:');
  dbms_output.put_line('Numero de empleados es: ' || nEmple );
  dbms_output.put_line('Salario medio: ' || sMedio );
  dbms_output.put_line('El empleado con mayor salario trabaja como: ' || trabajEmple );
  dbms_output.put_line('Se llama: ' || empleMN );
  
END;
