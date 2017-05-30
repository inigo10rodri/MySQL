DECLARE
  nombre varchar2(10);
  depar int;
  nEmple int;
  sMedio float;
  empleMN varchar2(10);
  trabajEmple varchar2(20);
  trabajId varchar(10);
BEGIN
  nombre:=&NombreDepartamento;
  
  select departamento_id into depar from departamentos where departamento_nombre=nombre;
  select count(empleado_id),avg(salario) into nEmple,sMedio from empleados where departamento_id=depar ;
  select avg(salario) into sMedio from empleados where departamento_id=depar;
  select nombre,trabajo_id into empleMN,trabajId from empleados where salario=(select max(salario) from empleados);
  select trabajo_nombre into trabajEmple from trabajos where trabajo_id=trabajId;
   
  dbms_output.put_line('El departamento ' || nombre || ' tiene:');
  dbms_output.put_line('Numero de empleados es: ' || nEmple );
  dbms_output.put_line('Salario medio: ' || sMedio );
  dbms_output.put_line('El empleado con mayor salario trabaja como: ' || trabajEmple );
  dbms_output.put_line('Se llama: ' || empleMN );
  
END;
