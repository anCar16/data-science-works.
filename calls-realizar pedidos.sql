SET SQL_SAFE_UPDATES=0;
SET FOREIGN_KEY_CHECKS=0;
CALL realizar_pedido(1, 1, 2, @resultado);
select @resultado -- pedido válido
CALL realizar_pedido(1, 2, 5555,@resultado);
select @resultado -- pedido inválido 
SET SQL_SAFE_UPDATES=1;

-- en caso de que el procedimiento no se guarde,aquí está el código comentado para crearlo.
/*
CREATE DEFINER=`root`@`localhost` PROCEDURE `realizar_pedido`(
    in id_cliente int,
    in id_producto int,
    in cantidad int,
    out resultado int -- este parametro va a retornar para saber si fue exitosa o no,un 1 es exitosa y un 0 es no exitosa.
)
BEGIN
    DECLARE stock INT; -- esto es una varibale local del procedimiento.
    Start Transaction;
    -- es el inventario del producto para luego almacernalo arriba.
    select inventario into stock from productos where id_producto = id_producto Limit 1;
    
    If stock > cantidad THEN
        insert into pedidos (id_cliente, fecha_pedido, estado_pedido) values (id_cliente,'2024-05-09', 'Enviado');
        -- Obtener el ID del pedido recién insertado
		SET @pedido_id = LAST_INSERT_ID();
        insert into detalles_pedido (id_pedido, id_producto, cantidad) values (@pedido_id, id_producto, cantidad);
        Update productos set inventario = inventario - cantidad where id_producto = id_producto;
        insert into envios (id_pedido, fecha_envio, estado_envio) values (@pedido_id, Null, 'En proceso');
        Commit;
        Set resultado = 1;
    ELSE
        -- si no hay suficientes existencias, se cancela la transacción
        RollBack;
        set resultado = 0;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No hay suficientes existencias para dicho producto seleccionado.';
        -- esto es el manejo de errores, ese núermo es un número para decir que es error genérico
    END IF;
END
*/
