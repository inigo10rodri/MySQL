DECLARE
    Numero integer;
BEGIN
    numero:=&valor_numero; -- leer desde teclado
    If numero mod 2 =0 then
        DBMS_OUTPUT.PUT_LINE('El numero es par');
        end if;
end;