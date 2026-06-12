USE insight_places_db;

-- Funções exigem essa configuração se você não tiver logs binários ativos
SET GLOBAL log_bin_trust_function_creators = 1;

DROP FUNCTION IF EXISTS get_status_cliente;

DELIMITER $$

CREATE FUNCTION get_status_cliente(p_cliente_id VARCHAR(255)) 
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE v_total DECIMAL(10,2);
    DECLARE v_status VARCHAR(100);

    -- Soma o quanto esse cliente deve em aluguéis
    SELECT IFNULL(SUM(preco_total), 0) INTO v_total
    FROM alugueis
    WHERE cliente_id = p_cliente_id;

    -- Lógica da função
    IF v_total > 40000 THEN
        SET v_status = 'Nível Gintoki (Caloteiro Lendário)';
    ELSEIF v_total > 0 THEN
        SET v_status = 'Dívida Ativa';
    ELSE
        SET v_status = 'Em dia (Ou é o Shinpachi)';
    END IF;

    RETURN v_status;
END$$

DELIMITER ;

-- Usando a Function criada + Alias de coluna
SELECT 
    nome AS 'Nome do Personagem', 
    get_status_cliente(cliente_id) AS 'Situação Financeira' -- Chamada da Function com Alias
FROM clientes;
