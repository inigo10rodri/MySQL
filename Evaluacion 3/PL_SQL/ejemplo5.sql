-- Realizar un programa que pida al usuario tres numeros y a
-- continuación ofrezca las siguientes 3 opciones:
 
 -- 1.- Suma de los tres numeros.
 -- 2.- Producto de los tres números.
 -- 3.- Promedio.
DECLARE 

n1 integer;
n2 integer;
n3 integer;
op integer;

BEGIN 
    
    n1:=&v1;
    n2:=&v2;
    n3:=&v3;
    
    DBMS_OUTPUT.PUT_LINE('1.- Suma de los tres numeros.');
    DBMS_OUTPUT.PUT_LINE('2.- Producto de los dos primeros numeros');
    DBMS_OUTPUT.PUT_LINE('3.- Promedio');
    
    op:=&v4;
    DBMS_OUTPUT.PUT_LINE('La opcion seleccionada es ' || op);
    CASE op
    WHEN 1 THEN DBMS_OUTPUT.PUT_LINE('La  suma es ' ||(n1+n2+n3));
    WHEN 2 THEN DBMS_OUTPUT.PUT_LINE('El producto es ' ||(n1*n2));
    WHEN 1 THEN DBMS_OUTPUT.PUT_LINE('Promedio ' ||((n1+n2+n3)/3));
    ELSE DBMS_OUTPUT.PUT_LINE('Eleccion no correcta. ');
    END CASE;

END;
    
    
    