DROP PROCEDURE IF EXISTS insere_clientes_em_massa;

DELIMITER $$

CREATE PROCEDURE insere_clientes_em_massa(IN lista_nomes TEXT)
BEGIN
    DECLARE nome_atual VARCHAR(255);
    DECLARE v_id VARCHAR(255);

    WHILE (LOCATE(',', lista_nomes) > 0) DO
        SET nome_atual = TRIM(SUBSTRING_INDEX(lista_nomes, ',', 1));
        
        -- Gera o próximo ID CLI_XXX
        SELECT CONCAT('CLI_', LPAD(IFNULL(MAX(CAST(SUBSTRING(cliente_id, 5) AS UNSIGNED)), 0) + 1, 3, '0')) 
        INTO v_id FROM clientes;

        INSERT INTO clientes (cliente_id, nome) VALUES (v_id, nome_atual);
        
        SET lista_nomes = SUBSTRING(lista_nomes, LOCATE(',', lista_nomes) + 1);
    END WHILE;

    -- Processa o último
    SET nome_atual = TRIM(lista_nomes);
    IF (LENGTH(nome_atual) > 0) THEN
        SELECT CONCAT('CLI_', LPAD(IFNULL(MAX(CAST(SUBSTRING(cliente_id, 5) AS UNSIGNED)), 0) + 1, 3, '0')) 
        INTO v_id FROM clientes;
        INSERT INTO clientes (cliente_id, nome) VALUES (v_id, nome_atual);
    END IF;
END$$

DELIMITER ;

-- Teste para a tabela real:
CALL insere_clientes_em_massa('Kamui, Abuto, Hedoro');
SELECT * FROM clientes;
