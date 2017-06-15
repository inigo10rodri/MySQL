create or replace procedure NuevaPoblacion (id varchar2, nombre varchar2, region integer) is
re integer null;
begin
 select region_id into re from regiones where region_id=region;
 if re is not null and id is not null and nombre is not null then
    insert into POBLACIONES values(id,nombre,region); 
 else
   dbms_output.put_line('Datos inexistentes');
 end if;
exception
  when dup_val_on_index then
    dbms_output.put_line('Erro clave duplicada');
end NuevaPoblacion;
/
