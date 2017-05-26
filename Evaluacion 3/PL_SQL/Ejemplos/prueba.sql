declare
 importe NUMBER(8,2);
 contador NUMBER(2,0) :=0 ;
 nombre  CHAR(20) NOT NULL := 'MIGUEL';
 fecha date := current_date;
 mayoredad boolean := true;
 
 begin
 
 importe:=3;
 contador:=contador+1;
 
 DBMS_OUTPUT.PUT_LINE (' el importe es ' || importe);
DBMS_OUTPUT.PUT_LINE (' el contador es ' || contador);
DBMS_OUTPUT.PUT_LINE (' el nombre es ' || nombre);
DBMS_OUTPUT.PUT_LINE (' la fecha es ' || fecha);

end; 
 
 
