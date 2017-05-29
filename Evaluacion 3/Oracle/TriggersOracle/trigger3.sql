CREATE TABLE VENTA_PRODUCTOS
(ID_PROD    VARCHAR(12),
 UNIDADES_VENDIDAS NUMBER(6),
 CONSTRAINT PK_VENTAS PRIMARY KEY(ID_PROD)
);
COMMIT;

create or replace trigger insertar_detalle before insert on detalle
for each row
declare
cont_venta_prod number(6);
begin
    select count(*) into cont_venta_prod from venta_productos where id_prod= :new.id_producto;
    if cont_venta_prod > 0
    then
        update venta_productos
        set unidades_vendidas = unidades_vendidas + :new.cantidad
        where id_prod = :new.id_producto;
    else
        insert into venta_productos values(:new.id_producto, :new.cantidad);
    end if;
end;
