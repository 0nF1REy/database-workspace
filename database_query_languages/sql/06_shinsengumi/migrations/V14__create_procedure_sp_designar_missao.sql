USE prod_ShinsengumiDB;

DELIMITER $$

CREATE PROCEDURE sp_designar_missao (
    IN p_idMembro INT,
    IN p_idMissao INT,
    IN p_funcao VARCHAR(50)
)
BEGIN
    UPDATE MembroMissao
    SET funcao = IF(p_funcao IS NULL OR p_funcao = '', 'N/A', p_funcao)
    WHERE idMembro = p_idMembro AND idMissao = p_idMissao;

    IF ROW_COUNT() = 0 THEN
        INSERT INTO MembroMissao (idMembro, idMissao, funcao)
        VALUES (p_idMembro, p_idMissao, 
                IF(p_funcao IS NULL OR p_funcao = '', 'N/A', p_funcao));
    END IF;
END $$

DELIMITER ;