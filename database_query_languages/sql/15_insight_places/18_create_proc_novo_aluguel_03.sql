DROP PROCEDURE IF EXISTS novoAluguel_03;

DELIMITER $$

CREATE PROCEDURE novoAluguel_03(
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
END$$

DELIMITER ;

CALL novoAluguel_03('ALUG_069', 'CLI_004', 'HOSP_001', '2023-03-13', '2023-03-16', 40.00);

SELECT * FROM alugueis WHERE aluguel_id = 'ALUG_069';