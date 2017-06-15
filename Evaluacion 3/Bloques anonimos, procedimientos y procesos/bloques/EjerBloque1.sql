DECLARE
    numEmple int;
    empleados int;
    departamento int;
    incremento int;
BEGIN
  numEmple:=&Empleado;  

  Select count(EMPLEADO_ID) into empleados from EMPLEADOS where MANAGER_ID=numEmple;
  Select DEPARTAMENTO_ID into departamento from EMPLEADOS where EMPLEADO_ID=numEmple;
  
  if empleados>=3 then
    incremento:=110;
    DBMS_OUTPUT.PUT_LINE('Incrementado el salario en 110');
  elsif empleados=2 then
     incremento:=100;
    DBMS_OUTPUT.PUT_LINE('Incrementado el salario en 100');
  elsif empleados=1 then
     incremento:=80;
    DBMS_OUTPUT.PUT_LINE('Incrementado el salario en 80');
  else
     incremento:=50;
    DBMS_OUTPUT.PUT_LINE('Incrementado el salario en 50');
  end if;
  
  update EMPLEADOS set salario=salario+incremento where EMPLEADO_ID=numEmple;
   
  if departamento=90 then
    update EMPLEADOS set salario=salario+30 where EMPLEADO_ID=numEmple;
    DBMS_OUTPUT.PUT_LINE('Incrementado el salario en 30 por pertenecer al departamento 90');
  end if;
  
END;
