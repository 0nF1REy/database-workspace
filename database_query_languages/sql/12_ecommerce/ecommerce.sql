DROP DATABASE IF EXISTS ecommerce_db;
CREATE DATABASE ecommerce_db;
USE ecommerce_db;

/* COMANDOS DDL */
CREATE TABLE tb_clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE tb_produtos (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome_produto VARCHAR(50) NOT NULL,
    quantidade INT NOT NULL,
    preco DECIMAL(10,2) NOT NULL
);

CREATE TABLE tb_pedidos (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    data_pedido DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_cliente) REFERENCES tb_clientes(id_cliente)
);

CREATE TABLE tb_itens_pedido (
    id_item INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES tb_pedidos(id_pedido),
    FOREIGN KEY (id_produto) REFERENCES tb_produtos(id_produto)
);

/* COMANDOS DML */
INSERT INTO tb_clientes (nome, email) VALUES
('Ana Silva', 'ana.silva@email.com'),
('Carlos Souza', 'carlos.souza@email.com');

INSERT INTO tb_produtos (nome_produto, quantidade, preco) VALUES
('Smartphone', 100, 1500.00),
('Fone de Ouvido', 50, 150.00),
('Cabo USB', 200, 25.00);

/* COMANDOS DQL */
SELECT * FROM tb_produtos;

SELECT * FROM tb_clientes;

SELECT * FROM tb_pedidos;

SELECT * FROM tb_itens_pedido;

START TRANSACTION;

INSERT INTO tb_pedidos (id_cliente) VALUES (2);

SET @pedido_id = LAST_INSERT_ID();

SELECT @pedido_id;

/* COMANDO DTL/TCL */
SAVEPOINT pedido_criado;

INSERT INTO tb_itens_pedido (id_pedido, id_produto, quantidade, preco_unitario) VALUES
(@pedido_id, 1, 1, 1500.00),
(@pedido_id, 2, 2, 150.00);

SAVEPOINT itens_parciais_inseridos;

INSERT INTO tb_itens_pedido (id_pedido, id_produto, quantidade, preco_unitario) VALUES
(@pedido_id, 3, 2, 25.00);

SAVEPOINT itens_parciais_inseridos_02;

UPDATE tb_produtos p
JOIN tb_itens_pedido i ON p.id_produto = i.id_produto
SET p.quantidade = p.quantidade - i.quantidade
WHERE i.id_pedido = @pedido_id;

SAVEPOINT estoque_atualizado;

/* COMANDO DTL/TCL */
-- Rollbacks
ROLLBACK TO itens_parciais_inseridos;
ROLLBACK TO itens_parciais_inseridos_02;
ROLLBACK TO estoque_atualizado;

-- Consulta para exibir os detalhes do pedido feito por um cliente específico
SELECT 
    c.nome AS cliente,
    p.id_pedido,
    p.data_pedido,
    pr.nome_produto,
    i.quantidade,
    i.preco_unitario,
    (i.quantidade * i.preco_unitario) AS total_item
FROM tb_clientes c
JOIN tb_pedidos p ON c.id_cliente = p.id_cliente
JOIN tb_itens_pedido i ON p.id_pedido = i.id_pedido
JOIN tb_produtos pr ON i.id_produto = pr.id_produto
WHERE p.id_pedido = @pedido_id;

-- Consulta para verificar o estoque dos produtos envolvidos no pedido
SELECT 
    p.id_produto,
    p.nome_produto,
    p.quantidade
FROM tb_produtos p
JOIN tb_itens_pedido i ON p.id_produto = i.id_produto
WHERE i.id_pedido = @pedido_id;

/* COMANDO DTL/TCL */
ROLLBACK;

/* COMANDO DTL/TCL */
COMMIT;

-- Consulta que exibe os detalhes de todos os pedidos realizados
SELECT 
    c.nome AS cliente,
    p.id_pedido,
    p.data_pedido,
    pr.nome_produto,
    i.quantidade,
    i.preco_unitario,
    (i.quantidade * i.preco_unitario) AS total_item
FROM tb_clientes c
JOIN tb_pedidos p ON c.id_cliente = p.id_cliente
JOIN tb_itens_pedido i ON p.id_pedido = i.id_pedido
JOIN tb_produtos pr ON i.id_produto = pr.id_produto
ORDER BY p.id_pedido;
