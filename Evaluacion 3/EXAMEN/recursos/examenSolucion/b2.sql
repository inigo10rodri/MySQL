SELECT * FROM PRODUCTOS;
declare
numprod PRODUCTOS.PRODUCTO_NO%TYPE;
nombre PRODUCTOS.DESCRIPCION%TYPE;
precio PRODUCTOS.PRECIO_ACTUAL%TYPE;
stock PRODUCTOS.STOCK_DISPONIBLE%TYPE;
unidades_vendidas PEDIDOS.UNIDADES%TYPE;
nom_cli CLIENTES.NOMBRE%TYPE;
loc_cli CLIENTES.LOCALIDAD%TYPE;

cursor curClientes is select nombre,localidad into nom_cli,loc_cli 
                    from clientes 
                    where cliente_no in(select cliente_no 
                                    from pedidos 
                                    where producto_no=numprod);
begin
numprod:=&Numero_Producto;
select descripcion, precio_actual, stock_disponible
    into nombre, precio,stock
from productos
where producto_no=numprod;
select sum(unidades) into unidades_vendidas from pedidos where producto_no=numprod;
dbms_output.put_line(numprod||' '||nombre|| ' ' ||precio|| ' ' ||stock);
dbms_output.put_line('');
dbms_output.put_line('Unidades Vendidas: '|| unidades_vendidas);
dbms_output.put_line('');
dbms_output.put_line('Clientes que han pedido el producto: ');
dbms_output.put_line('');
open curClientes;
    loop 
        fetch curClientes into nom_cli,loc_cli;
        exit when curClientes%NOTFOUND;
        dbms_output.put_line(nom_cli || ' ' ||loc_cli);
    end loop;
close curClientes;
end;

