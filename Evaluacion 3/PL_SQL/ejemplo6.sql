-- Programa que imprima los n�meros pares y al final imprima la suma de
-- los 50 primeros n�meros pares  y el producto de los 5 primeros n�meros
-- pares.
DECLARE

conta integer:=50;
acum1 integer :=0;
acum2 integer :=1;
conta2 integer :=1;

BEGIN 
while (conta>0)
LOOP
    DBMS_OUTPUT.PUT_LINE(conta);
    conta:=conta-2;
    acum1:=acum1+conta;
    if conta<=5 then 
    acum2:=acum2*conta;
    conta2:=conta2+1;
    end if;
END LOOP;
DBMS_OUTPUT.PUT_LINE('La suma es ' || acum1);
DBMS_OUTPUT.PUT_LINE('El producto es' || acum2);
    
END;
