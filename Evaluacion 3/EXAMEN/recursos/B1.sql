DECLARE
  numProducto number(4,0);
  nomProd varchar(30);
  stockDisponible number(9,0);
  unidades_a_pedir number(4,0);
  
BEGIN
  
  select id_producto into numProducto from productos where producto_no=numProducto;
  select descripcion into nomProd from productos where producto_no=numProducto;
  select stockDisponible into stockDisponible from productos where producto_no=numProducto;
  select unidades into unidades_a_pedir from pedidos where producto_no=numProducto;
   
  dbms_output.put_line('El numero del producto es: ' || numProducto);
  dbms_output.put_line('Nombre del producto: ' || nomProd );
  dbms_output.put_line('Stock disponible: ' || stockDisponible );
  dbms_output.put_line('Unidades a pedir: ' || unidades_a_pedir );
  
END;
