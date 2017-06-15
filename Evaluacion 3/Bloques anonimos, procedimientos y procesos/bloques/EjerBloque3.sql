DECLARE
  cursor c_emple is select apellido,salario from empleados;
  cursor c_depar is select departamento_id from departamentos;
  sala empleados.salario%type;
  apellido empleados.apellido%type;
  deparId departamentos.departamento_id%type;
  nEmple int;
  sSalarios float;
  nEmpleT int;
  sSalariosT float;
BEGIN
  nEmpleT:=0;
  sSalariosT:=0;
  nEmple:=0;
  sSalarios:=0;
  open c_emple;
       loop
         fetch c_emple into apellido,sala;
         exit when c_emple%notfound;
         dbms_output.put_line(apellido ||', '|| sala);
       end loop;
  close c_emple;
  open c_depar;
       loop
         fetch c_depar into deparId;
         exit when c_depar%notfound;
         select sum(salario),count(empleado_id) into sSalarios,nEmple from empleados where departamento_id=deparId;
         if(nEmple>0) then
                nEmpleT:=nEmpleT+nEmple;
                sSalariosT:=sSalariosT+sSalarios;
         end if;
         dbms_output.put_line('Departamento_id: ' || deparId || ' numero de empleados: ' || nEmple || ' y suma de todos los salarios del departamento: ' || sSalarios);
       end loop;
  close c_depar;
  dbms_output.put_line('Numero total de empleados: ' || nEmpleT || ' y suma de todos los salarios de todos los departamentos: ' || sSalariosT);
END;
