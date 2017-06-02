create or replace procedure uspSuministro(numProd number, nomCli varchar2) is

  unidades_pedidas int;
  nomCliente varchar2(25);
  localidad_Cliente varchar2(14);

begin
  select unidades into unidades_pedidas from pedidos where producto_no=numProd;
  select nombre,localidad into nomCliente,localidad_Cliente from clientes where cliente_no=nomCli;
  dbms_output.put_line('Las unidades vendidas hasta la fecha son: ' || unidades_pedidas);
  dbms_output.put_line('El nombre del cliente es: ' || nomCliente || ' y la localidad: ' || localidad_Cliente);
  
  end uspSuministro;