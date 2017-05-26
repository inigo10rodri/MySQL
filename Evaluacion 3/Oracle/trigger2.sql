CREATE TABLE MODIFICACIONES_FACTURAS1
(USUARIO    VARCHAR(12),
 FECHA      DATE,
 HORA       VARCHAR(10),
 DETALLES   VARCHAR(240),
 CONSTRAINT PK_MODIFICACIONES PRIMARY KEY(USUARIO,FECHA,HORA)
);


create or replace trigger modificar_factura after update on factura
for each row
declare
v_fecha date:=to_char(sysdate,'dd-mm-yyyy');
v_hora varchar(10):=to_char(systimestamp,'hh24:mi:ss');
begin
 insert into modificaciones_facturas
 values(user(),v_fecha,v_hora,'la factura antes de la modificacion:' || :old.num_factura||','||
 :old.id_cliente ||','|| :old.fecha||'y despues'|| :new.num_factura||','||:new.id_cliente||','||:new.fecha);
end;