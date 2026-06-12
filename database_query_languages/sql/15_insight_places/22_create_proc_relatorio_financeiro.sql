USE insight_places_db;

DROP PROCEDURE IF EXISTS relatorio_faturamento_proprietarios;

DELIMITER $$

CREATE PROCEDURE relatorio_faturamento_proprietarios()
BEGIN
    -- 1. Declaração de variáveis para receber os dados do cursor
    DECLARE v_fim_cursor INTEGER DEFAULT 0;
    DECLARE v_proprietario_id VARCHAR(255);
    DECLARE v_nome_proprietario VARCHAR(255);
    DECLARE v_total_acumulado DECIMAL(10,2);

    -- 2. Declaração do CURSOR (A consulta que queremos percorrer)
    -- Vamos pegar todos os proprietários
    DECLARE cursor_financeiro CURSOR FOR 
        SELECT proprietario_id, nome FROM proprietarios;

    -- 3. Declaração do HANDLER para saber quando o cursor chegou ao fim
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_fim_cursor = 1;

    -- 4. Criação de uma tabela temporária para armazenar os resultados do processamento
    DROP TEMPORARY TABLE IF EXISTS temp_relatorio_financeiro;
    CREATE TEMPORARY TABLE temp_relatorio_financeiro (
        proprietario VARCHAR(255),
        valor_total DECIMAL(10,2),
        situacao VARCHAR(50)
    );

    -- 5. Abertura do Cursor
    OPEN cursor_financeiro;

    -- 6. Início do Loop para percorrer as linhas
    read_loop: LOOP
        -- Busca os dados da linha atual e joga nas variáveis
        FETCH cursor_financeiro INTO v_proprietario_id, v_nome_proprietario;

        -- Se o handler marcou 1, saímos do loop
        IF v_fim_cursor = 1 THEN
            LEAVE read_loop;
        END IF;

        -- 7. Processamento complexo para cada linha:
        -- Calculamos o total de aluguéis das hospedagens DESTE proprietário
        SELECT IFNULL(SUM(a.preco_total), 0) INTO v_total_acumulado
        FROM alugueis a
        JOIN hospedagens h ON a.hospedagem_id = h.hospedagem_id
        WHERE h.proprietario_id = v_proprietario_id;

        -- Regra de negócio: classificar a situação financeira
        IF v_total_acumulado > 10000 THEN
            INSERT INTO temp_relatorio_financeiro VALUES (v_nome_proprietario, v_total_acumulado, 'Rico (Alvo de roubo da Yorozuya)');
        ELSEIF v_total_acumulado > 0 THEN
            INSERT INTO temp_relatorio_financeiro VALUES (v_nome_proprietario, v_total_acumulado, 'Pobre (Estilo Madao)');
        ELSE
            INSERT INTO temp_relatorio_financeiro VALUES (v_nome_proprietario, v_total_acumulado, 'Falido (Calote total)');
        END IF;

    END LOOP;

    -- 8. Fechamento do Cursor
    CLOSE cursor_financeiro;

    -- 9. Exibição do resultado final
    SELECT * FROM temp_relatorio_financeiro ORDER BY valor_total DESC;

END$$

DELIMITER ;

-- Testando a Procedure:
CALL relatorio_faturamento_proprietarios();
