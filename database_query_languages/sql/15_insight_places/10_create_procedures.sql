DROP PROCEDURE IF EXISTS `nao_faz_nada`;

DELIMITER $$

USE `insight_places_db` $$

CREATE PROCEDURE `nao_faz_nada` ()
BEGIN
END$$

DELIMITER ;

-- ====================================== --

DROP PROCEDURE IF EXISTS `alo_mundo`;

DELIMITER $$

USE `insight_places_db` $$

CREATE PROCEDURE `alo_mundo` ()
BEGIN
   SELECT 'Alô mundo!';
END$$

DELIMITER ;

CALL alo_mundo;

-- ====================================== --

DROP PROCEDURE IF EXISTS `listaClientes`;

DELIMITER $$

USE `insight_places_db` $$

CREATE PROCEDURE `listaClientes` ()
BEGIN
   SELECT * FROM clientes;
END$$

DELIMITER ;

CALL listaClientes;