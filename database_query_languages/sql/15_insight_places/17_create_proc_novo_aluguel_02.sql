DROP PROCEDURE IF EXISTS novoAluguel_02;

DELIMITER $$

CREATE PROCEDURE novoAluguel_02(
    IN vAluguel VARCHAR(10),
    IN vCliente VARCHAR(10),
    IN vHospedagem VARCHAR(10),
    IN vDataInicio DATE,
    IN vDataFinal DATE,
    IN vPrecoTotal DECIMAL(10,2)
)
BEGIN
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

CALL novoAluguel_02('ALUG_065', 'CLI_004', 'HOSP_001', '2023-04-01', '2023-04-15', 1200.00);

CALL novoAluguel_02('ALUG_066', 'CLI_005', 'HOSP_001', '2023-04-01', '2023-04-12', 800.00);

SELECT * FROM alugueis WHERE aluguel_id = 'ALUG_065';

SELECT * FROM alugueis WHERE aluguel_id IN ('ALUG_065','ALUG_066');