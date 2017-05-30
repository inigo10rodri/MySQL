create or replace procedure MaxMinTrabajo(nombre varchar2) is
  salarioMax float;
  salarioMin float;
begin
  select max_salario,min_salario into salarioMax,salarioMin from trabajos where trabajo_nombre=nombre;
  dbms_output.put_line('Del trabajo ' || nombre ||' el salario máximo es ' || salarioMax || ' y el minimo es ' || salarioMin);
  end MaxMinTrabajo;
/
