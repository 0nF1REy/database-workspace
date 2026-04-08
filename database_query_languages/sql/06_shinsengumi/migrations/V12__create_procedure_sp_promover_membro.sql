USE prod_ShinsengumiDB;

DELIMITER $$

CREATE PROCEDURE sp_promover_membro (
    IN p_idMembro INT,
    IN p_novaPatente VARCHAR(50)
)
BEGIN
    UPDATE Membro
    SET patente = p_novaPatente
    WHERE idMembro = p_idMembro;
END $$

DELIMITER ;