DROP PROCEDURE IF EXISTS novoAluguel_04;

DELIMITER $$

CREATE PROCEDURE novoAluguel_04(
    IN vAluguel VARCHAR(10),
    IN vCliente VARCHAR(10),
    IN vHospedagem VARCHAR(10),
    IN vDataInicio DATE,
    IN vDataFinal DATE,
    IN vPrecoUnitario DECIMAL(10,2)
)
BEGIN
        DECLARE vDias INTEGER DEFAULT 0;
        DECLARE vPrecoTotal DECIMAL(10,2);
        DECLARE vMensagem VARCHAR(100);
        DECLARE EXIT HANDLER FOR 1452
        BEGIN
            SET vMensagem = 'Problema de chave estrangeira associado a alguma entidade da base.';
            SELECT vMensagem;
        END;
        SET vDias = (SELECT DATEDIFF (vDataFinal,vDataInicio));
        SET vPrecoTotal = vDias * vPrecoUnitario;
        INSERT INTO alugueis (
            aluguel_id,
            cliente_id,
            hospedagem_id,
            data_inicio,
            data_fim,
            preco_total
        ) VALUES (
            vAluguel,
            vCliente,
            vHospedagem,
            vDataInicio,
            vDataFinal,
            vPrecoTotal
        );
        SET vMensagem = 'Aluguel incluído na base com sucesso.';
        SELECT vMensagem;
END$$

DELIMITER ;

CALL novoAluguel_04('ALUG_070', 'CLI_004', 'HOSP_001', '2023-03-13', '2023-03-16', 40.00);

CALL novoAluguel_04('ALUG_071', 'CLI_044', 'HOSP_001', '2023-03-13', '2023-03-16', 40.00);