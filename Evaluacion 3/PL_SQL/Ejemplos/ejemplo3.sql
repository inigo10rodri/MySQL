-- Realizar un programa que pida dos n�meros enteros. Si la suma de los
-- dos es par se visualizar� en pantalla la suma de ambos. Si no es as�,
-- se dar� el resultado de restar el n�mero mayor al menor.
  
DECLARE

numero1 integer;
numero2 integer;

BEGIN
numero1:= &valor1;
numero2:= &valor2;

    If(numero1+numero2) mod 2 =0 then
        DBMS_OUTPUT.PUT_LINE('SUMA ES ' || (numero1+numero2));
    else
        DBMS_OUTPUT.PUT_LINE('RESTA ES ' || (numero1-numero2));
    end if;

END;