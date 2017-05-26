-- Se pide a un alumno que introduzca una nota. Si la nota es mayor que
-- cero y menor que 5 además de escribir la nota aparecerá la palabra 
-- cate. Si está entre 5 y 10  además de escribir la nota la palabra
-- aprobado. Si se introduce otro número se indicará que eso no es una 
-- nota.


DECLARE
nota integer;

BEGIN
    nota:=&valor;

IF nota>0 and nota<5 then
    DBMS_OUTPUT.PUT_LINE('la nota es ' || 'CATE');
ELSIF nota>=5 and nota<=10 then
    DBMS_OUTPUT.PUT_LINE('la nota es ' || 'APROBADO');
ELSE
    DBMS_OUTPUT.PUT_LINE('El numero introducido no es una nota');
END IF;
END;