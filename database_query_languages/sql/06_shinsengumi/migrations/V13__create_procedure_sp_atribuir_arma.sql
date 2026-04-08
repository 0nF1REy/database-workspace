USE prod_ShinsengumiDB;

DELIMITER $$

CREATE PROCEDURE sp_atribuir_arma (
    IN p_idMembro INT,
    IN p_idArma INT
)
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM MembroArma 
        WHERE idMembro = p_idMembro AND idArma = p_idArma
    ) THEN
        INSERT INTO MembroArma (idMembro, idArma, dataUso)
        VALUES (p_idMembro, p_idArma, CURDATE());
    END IF;
END $$

DELIMITER ;