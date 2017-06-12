select * from productos;
declare v_num_prod PRODUCTOS.PRODUCTO_NO%TYPE;
v_nomprod PRODUCTOS.DESCRIPCION%TYPE;
v_stockprod PRODUCTOS.STOCK_DISPONIBLE%TYPE;
v_unidadespedir integer;
cursor cursor_prod is select producto_no, descripcion, stock_disponible, 50-stock_disponible
                            into v_num_prod,v_nomprod,v_stockprod,v_unidadespedir
                            from PRODUCTOS
                            where stock_disponible < 20;
begin
open cursor_prod;
    loop 
        fetch cursor_prod into v_num_prod,v_nomprod,v_stockprod,v_unidadespedir;
        exit when cursor_prod%NOTFOUND;
        dbms_output.put_line(v_num_prod || ' ' ||v_nomprod|| ' ' ||v_stockprod|| ' ' ||v_unidadespedir);
    end loop;
close cursor_prod;
end;