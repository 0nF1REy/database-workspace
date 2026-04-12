DROP PROCEDURE IF EXISTS novoAluguel_01;

DELIMITER $$

CREATE PROCEDURE novoAluguel_01()
BEGIN
  DECLARE vAluguel VARCHAR(10) DEFAULT 'ALUG_011';
  DECLARE vCliente VARCHAR(10) DEFAULT 'CLI_002';
  DECLARE vHospedagem VARCHAR(10) DEFAULT 'HOSP_003';
  DECLARE vDataInicio DATE DEFAULT '2023-03-01';
  DECLARE vDataFinal DATE DEFAULT '2023-03-05';
  DECLARE vPrecoTotal DECIMAL(10,2) DEFAULT 550.23;
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

CALL novoAluguel_01 ();

SELECT * FROM alugueis WHERE aluguel_id = 'ALUG_011';