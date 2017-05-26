create trigger menor_edad before update on cliente
FOR EACH ROW
declare
begin
if(TO_CHAR(SYSDATE,'YYYY')-TO_CHAR(:NEW.FECHA_NACIMIENTO, 'YYYY'))<18 THEN
:NEW.FECHA_NACIMIENTO:=NULL;
END IF;
END;