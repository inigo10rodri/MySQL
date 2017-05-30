DECLARE
  cadena varchar(10);
  opc empleados.apellido%type;
  numEm int;
  empleId empleados.empleado_id%TYPE;
  apellido empleados.apellido%TYPE;
  cursor c_emple is select empleado_id,apellido from empleados where apellido like opc;
BEGIN
  numEm:=0;
  cadena:=&cadena;
  opc:='%'||cadena||'%';
  open c_emple;
  loop
    fetch c_emple into empleId,apellido;
    numEm:=numEm+1;
    exit when c_emple%notfound;
    dbms_output.put_line(empleId || ',' || apellido);
  end loop;
  close c_emple;
  dbms_output.put_line('Numero de empleados: ' || numEm);
END;
