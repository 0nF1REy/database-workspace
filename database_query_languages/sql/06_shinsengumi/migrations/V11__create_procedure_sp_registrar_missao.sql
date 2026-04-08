USE prod_ShinsengumiDB;

DELIMITER $$

CREATE PROCEDURE sp_registrar_missao (
    IN p_descricao TEXT,
    IN p_localizacao VARCHAR(100),
    IN p_tipo VARCHAR(50),
    IN p_nivelPerigo VARCHAR(10),
    IN p_dataInicio DATE
)
BEGIN
    INSERT INTO Missao (descricao, localizacao, tipo, nivelPerigo, status, dataInicio)
    VALUES (p_descricao, p_localizacao, p_tipo, p_nivelPerigo, 'Aberta', p_dataInicio);
END $$

DELIMITER ;3