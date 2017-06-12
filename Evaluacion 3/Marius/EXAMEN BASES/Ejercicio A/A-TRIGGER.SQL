DELIMITER //
CREATE TRIGGER OtroPedido
AFTER INSERT ON PEDIDOS
FOR EACH ROW
BEGIN
DECLARE cliente_no_nuevo int(4);
DECLARE pedido_no_nuevo int(4);
DECLARE cant_unidades int(4);
DECLARE precio_unidad int(8);

SELECT NEW.CLIENTE_NO INTO cliente_no_nuevo;
SELECT NEW.PEDIDO_NO INTO pedido_no_nuevo;
SELECT NEW.UNIDADES INTO cant_unidades;
SELECT PRECIO_ACTUAL INTO precio_unidad FROM productos WHERE PRODUCTO_NO = NEW.PRODUCTO_NO;

INSERT INTO HISTORIA_PEDIDOS (N_PED, N_CLI,A_PAGAR) 
VALUES (pedido_no_nuevo,cliente_no_nuevo,(cant_unidades * precio_unidad)); 

UPDATE CLIENTES 
SET DEBE = DEBE + cant_unidades * precio_unidad
WHERE CLIENTE_NO = cliente_no_nuevo;


END; //

DELIMITER ;



