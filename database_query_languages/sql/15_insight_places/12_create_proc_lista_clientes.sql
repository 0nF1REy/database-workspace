DROP PROCEDURE IF EXISTS listaClientes;

DELIMITER $$

CREATE PROCEDURE listaClientes()
BEGIN
   SELECT * FROM clientes;
END$$

DELIMITER ;

CALL listaClientes ();