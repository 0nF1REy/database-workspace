USE insight_places_db;

-- 1. Exemplo de TRIM e CONCAT
-- Criando uma frase de cobrança padronizada
SELECT 
    CONCAT('Inquilino: ', TRIM(nome), ' | E-mail: ', contato) AS 'Lista_de_Contatos_Otose'
FROM clientes;

-- 2. Exemplo de SUBSTRING e REPLACE
-- Vamos fingir que o CPF está sem pontos (removendo-os primeiro) 
-- e depois remontando para garantir o padrão XXX.XXX.XXX-XX
SELECT 
    TRIM(nome) AS Nome,
    CONCAT(
        SUBSTRING(REPLACE(REPLACE(cpf, '.', ''), '-', ''), 1, 3), '.', 
        SUBSTRING(REPLACE(REPLACE(cpf, '.', ''), '-', ''), 4, 3), '.', 
        SUBSTRING(REPLACE(REPLACE(cpf, '.', ''), '-', ''), 7, 3), '-', 
        SUBSTRING(REPLACE(REPLACE(cpf, '.', ''), '-', ''), 10, 2)
    ) AS CPF_Mascarado
FROM clientes;

DROP PROCEDURE IF EXISTS sanear_dados_clientes;

DELIMITER $$

CREATE PROCEDURE sanear_dados_clientes()
BEGIN
    -- Remove espaços no início e fim de todos os nomes e contatos
    UPDATE clientes SET 
        nome = TRIM(nome),
        contato = TRIM(contato);
        
    SELECT 'Saneamento concluído! Os nomes da Yorozuya estão limpos.' AS Resultado;
END$$

DELIMITER ;

CALL sanear_dados_clientes();

SELECT nome, CONCAT(SUBSTRING(cpf, 1, 3), '.***.***-**') AS CPF_Protegido FROM clientes;

SELECT 
    CONCAT(
        'Inquilino: ', TRIM(nome), 
        ' | E-mail: ', IFNULL(contato, 'SEM CONTATO CADASTRADO')
    ) AS 'Lista_de_Contatos_Otose'
FROM clientes;
