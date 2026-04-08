-- *******************************************************
-- Script: seed_prod_ExemploDB.sql
-- Descrição: Este script insere dados iniciais no banco de dados
-- 'prod_ExemploDB'. Ele popula as tabelas de Usuários, Produtos
-- e Transações com dados de exemplo.
-- *******************************************************

-- Inserindo Usuários
INSERT INTO Usuario (nome, email, senha) VALUES
('João Silva', 'joao.silva@email.com', 'senha123'),
('Maria Oliveira', 'maria.oliveira@email.com', 'senha456');

-- Inserindo Produtos
INSERT INTO Produto (nome, descricao, preco, estoque) VALUES
('Camiseta', 'Camiseta 100% algodão', 39.90, 100),
('Calça Jeans', 'Calça jeans de corte reto', 89.90, 50);

-- Inserindo Transações
INSERT INTO Transacao (idUsuario, idProduto, quantidade) VALUES
(1, 1, 2),
(2, 2, 1);
