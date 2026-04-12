DROP PROCEDURE IF EXISTS listaHospedagens;

DELIMITER $$

CREATE PROCEDURE listaHospedagens()
BEGIN
   SELECT * FROM hospedagens WHERE tipo = 'Dormitório Shinsengumi';
END$$

DELIMITER ;

CALL listaHospedagens ();