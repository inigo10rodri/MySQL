delimiter |
CREATE TRIGGER OtroPedidoSol
after insert on pedidos
for each row 
begin
declare v_precio int;
select precio_actual into v_precio
from productos
where producto_no=new.producto_no;

insert into  HISTORIA_PEDIDOS values(
new.pedido_no,new.cliente_no,(new.unidades*v_precio));
update clientes

set debe = debe + (new.unidades * v_precio)
where cliente_no=new.cliente_no;
end;
|
delimiter ;
drop trigger OtroPedido;
