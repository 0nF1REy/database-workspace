DROP DATABASE IF EXISTS banco_db;
CREATE DATABASE banco_db;
USE banco_db;

CREATE TABLE tb_conta (
    id_conta INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    saldo DOUBLE NOT NULL
);

INSERT INTO tb_conta (nome, saldo) VALUES
('Alan Ryan', 1000.00),
('Aerith Gainsborough', 1500.00);

SELECT * FROM tb_conta;

START TRANSACTION;

UPDATE tb_conta SET saldo = saldo - 100 WHERE id_conta = 2;
UPDATE tb_conta SET saldo = saldo + 100 WHERE id_conta = 1;

SAVEPOINT transferencia;

UPDATE tb_conta SET saldo = 0 WHERE id_conta = 1;

ROLLBACK TO transferencia;

COMMIT;
