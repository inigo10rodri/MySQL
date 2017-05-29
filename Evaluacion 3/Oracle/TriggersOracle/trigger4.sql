create or replace trigger borrar_detalle before delete on detalle
    for each row
    begin
        update venta_productos
        set unidades_vendidas = unidades_vendidas - :old.cantidad
        where id_prod = :old.id_producto;
    end;