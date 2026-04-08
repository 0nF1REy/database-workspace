USE prod_ShinsengumiDB;

DELIMITER $$

CREATE PROCEDURE sp_expulsar_membro (
    IN p_idMembro INT
)
BEGIN
    -- Remove o vínculo com armas
    DELETE FROM MembroArma WHERE idMembro = p_idMembro;

    -- Remove o vínculo com missões
    DELETE FROM MembroMissao WHERE idMembro = p_idMembro;

    -- Remove o membro em si
    DELETE FROM Membro WHERE idMembro = p_idMembro;
END $$

DELIMITER ;