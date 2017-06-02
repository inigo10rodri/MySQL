delimiter 
CREATE TRIGGER OtroPedido
after insert on pedidos
for each row 
begin

declare cliente_nuevo int(3);
declare pedido_nuevo int(3);
declare cantidad_unidades int(3);
declare precio_unidad int (3);

select new.cliente_no into cliente_nuevo;
select new.pedido_no into pedido_nuevo;
select new.unidades into cantidad_unidades;
select new.precio_actual into precio_total_unidades from productos where producto_no = new.producto_no;

insert into  HISTORIA_PEDIDOS(n_dep,n_cli,a_pagar) values(
pedido_nuevo,cliente_nuevo,(cantidad_unidades*precio_total_unidades));

update CLIENTES
set debe= debe + (cantidad_unidades*precio_total_unidades);
END;
 delimiter 
