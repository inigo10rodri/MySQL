set serveroutput on;

DECLARE

BEGIN

FOR I IN (SELECT PRODUCTO_NO,DESCRIPCION,STOCK_DISPONIBLE FROM PRODUCTOS) LOOP
IF I.STOCK_DISPONIBLE < 20 THEN

dbms_output.put_line(I.PRODUCTO_NO || ' ' || I.DESCRIPCION || ' ' || I.STOCK_DISPONIBLE || ' ' || (50 - I.STOCK_DISPONIBLE));

END IF;

END LOOP;

END;
