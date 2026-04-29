DROP PROCEDURE IF EXISTS novoAluguel_05;

DELIMITER $$

CREATE PROCEDURE novoAluguel_05(
    IN vClienteNome VARCHAR(255),
    IN vHospedagem VARCHAR(10),
    IN vDataInicio DATE,
    IN vDataFinal DATE,
    IN vPrecoUnitario DECIMAL(10,2)
)
BEGIN
    DECLARE vAluguel VARCHAR(10);
    DECLARE vClienteId VARCHAR(10);
    DECLARE vDias INTEGER DEFAULT 0;
    DECLARE vPrecoTotal DECIMAL(10,2);
    DECLARE vMensagem VARCHAR(100);
    DECLARE vNumCliente INTEGER DEFAULT 0;
    
    DECLARE vDataAux DATE;
    DECLARE vDiaSemana INTEGER;

    -- Handler para erros
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        SET vMensagem = 'Erro ao processar aluguel. Verifique os dados.';
        SELECT vMensagem;
    END;

    -- 1. Verifica se o cliente existe
    SELECT COUNT(*), cliente_id INTO vNumCliente, vClienteId 
    FROM clientes 
    WHERE nome = vClienteNome
    GROUP BY cliente_id;

    IF vNumCliente = 1 THEN
        
        -- 2. Geração do ID automático (Lógica que converte string -> número -> soma 1 -> string)
        -- Conversão para UNSIGNED para não cair no erro de '99' > '1000'
        SELECT CONCAT('ALUG_', LPAD(IFNULL(MAX(CAST(SUBSTRING(aluguel_id, 6) AS UNSIGNED)), 0) + 1, 3, '0')) 
        INTO vAluguel 
        FROM alugueis;

        -- 3. Lógica de Dias Úteis
        SET vDataAux = vDataInicio;
        SET vDias = 0;
        WHILE vDataAux < vDataFinal DO
            SET vDiaSemana = WEEKDAY(vDataAux);
            IF vDiaSemana < 5 THEN
                SET vDias = vDias + 1;
            END IF;
            SET vDataAux = DATE_ADD(vDataAux, INTERVAL 1 DAY);
        END WHILE;

        -- 4. Cálculo do preço
        SET vPrecoTotal = vDias * vPrecoUnitario;

        -- 5. Inserção
        INSERT INTO alugueis (
            aluguel_id, cliente_id, hospedagem_id, 
            data_inicio, data_fim, preco_total
        ) VALUES (
            vAluguel, vClienteId, vHospedagem, 
            vDataInicio, vDataFinal, vPrecoTotal
        );

        -- Concatenar o ID na mensagem de sucesso
        SET vMensagem = CONCAT('Aluguel incluido na base com sucesso - ID: ', vAluguel);
        
    ELSE
        SET vMensagem = 'Cliente não encontrado ou nome ambíguo.';
    END IF;

    SELECT vMensagem;

END$$

DELIMITER ;

-- ====================================== --
-- TESTES DA REGRA DE FINAL DE SEMANA
-- ====================================== --

-- Teste 1: Sexta a Segunda (3 dias de intervalo, mas apenas 1 dia útil: Sexta)
-- Se o preço é 100, o total deve ser 100 (Sábado e Domingo grátis)
CALL novoAluguel_05('Sakata Gintoki', 'HOSP_001', '2023-11-10', '2023-11-13', 100.00);

-- Teste 2: Segunda a Sexta (4 dias úteis)
-- Total deve ser 400
CALL novoAluguel_05('Kagura', 'HOSP_001', '2023-11-13', '2023-11-17', 100.00);

-- Verificar resultados
SELECT * FROM alugueis ORDER BY aluguel_id DESC;