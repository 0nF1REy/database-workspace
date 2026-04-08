-- *******************************************************
-- Script: bkp_prod_ExemploDB_20250502.sql
-- Descrição: Este script é um backup do banco de dados
-- 'prod_ExemploDB'. Ele contém todos os comandos para recriar
-- as tabelas e os dados inseridos no banco de dados.
-- *******************************************************

-- Criação das tabelas (como no script 'init_prod_ExemploDB.sql')
CREATE DATABASE IF NOT EXISTS prod_ExemploDB;
USE prod_ExemploDB;

-- Criação das tabelas Usuario, Produto, Transacao

-- Dados inseridos (como no script 'seed_prod_ExemploDB.sql')
INSERT INTO Usuario (nome, email, senha) VALUES
('João Silva', 'joao.silva@email.com', 'senha123'),
('Maria Oliveira', 'maria.oliveira@email.com', 'senha456');

INSERT INTO Produto (nome, descricao, preco, estoque) VALUES
('Camiseta', 'Camiseta 100% algodão', 39.90, 100),
('Calça Jeans', 'Calça jeans de corte reto', 89.90, 50);

INSERT INTO Transacao (idUsuario, idProduto, quantidade) VALUES
(1, 1, 2),
(2, 2, 1);
