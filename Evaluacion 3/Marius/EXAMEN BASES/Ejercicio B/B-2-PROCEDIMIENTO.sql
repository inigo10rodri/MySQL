set serveroutput on;
DECLARE
prod_no NUMBER(4,0);
descripcion_prod VARCHAR2(30 BYTE);
precio_actual_prod NUMBER(8,0);
stock_disponible_prod NUMBER(9,0);
unidades_vendidas number(9,0);

nom_cli VARCHAR2(30 BYTE);
loc_cli VARCHAR2(30 BYTE);


BEGIN
prod_no := &Introduce;

SELECT DESCRIPCION INTO descripcion_prod FROM PRODUCTOS WHERE PRODUCTO_NO = prod_no;
SELECT PRECIO_ACTUAL INTO precio_actual_prod FROM PRODUCTOS WHERE PRODUCTO_NO = prod_no;
SELECT STOCK_DISPONIBLE INTO stock_disponible_prod FROM PRODUCTOS WHERE PRODUCTO_NO = prod_no;
SELECT COUNT(UNIDADES) INTO unidades_vendidas FROM PEDIDOS WHERE PRODUCTO_NO = prod_no;


dbms_output.put_line('Datos (prod_cod,descripcion,precio,stock)' || ' :' || prod_no || ', ' || descripcion_prod ||
',' || precio_actual_prod ||', '  || stock_disponible_prod );

dbms_output.put_line('Unidades vendidas: ' || unidades_vendidas);

for i in (SELECT CLIENTE_NO FROM PEDIDOS WHERE PRODUCTO_NO = prod_no) LOOP
    SELECT NOMBRE INTO nom_cli FROM CLIENTES where CLIENTE_NO = I.CLIENTE_NO;
    SELECT LOCALIDAD INTO loc_cli FROM CLIENTES WHERE CLIENTE_NO = I.CLIENTE_NO;

    dbms_output.put_line('Nombre: ' || nom_cli);
    dbms_output.put_line('Localidad: ' || loc_cli);
END LOOP;



END;

