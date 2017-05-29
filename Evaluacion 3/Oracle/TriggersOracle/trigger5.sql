create or replace trigger actualizar_detalle before update on detalle
for each row
declare
cont_venta_prod number(6);
begin
    if:old.id_producto = :new.id_producto then
        update venta_productos
        set unidades_vendidas = unidades_vendidas - : old.cantidad + :new.cantidad
        where id_prod = : old.id_producto;
    else
        update venta_productos
        set unidades_vendidas = unidades_vendidas - : old.cantidad
        where id_prod = : old.id_producto;
        select count(*) into cont_venta_prod from venta_productos where id_prod= :new.id_producto;
        if cont_venta_prod >0
        then
            update venta_productos
            set unidades_vendidas = unidades_vendidas - : new.cantidad
            where id_prod = : new.id_producto;
        else
            insert into venta_productos values(:new.id_producto, :new.cantidad);
        end if;
    end if;
end;
            
            
