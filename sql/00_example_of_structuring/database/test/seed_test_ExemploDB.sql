-- *******************************************************
-- Script: seed_test_ExemploDB.sql
-- Descrição: Este script insere dados fictícios no banco de dados
-- 'test_ExemploDB' para um ambiente de testes. Esses dados são
-- usados para validar funcionalidades do sistema em desenvolvimento.
-- *******************************************************

-- Inserindo Usuários de teste
INSERT INTO Usuario (nome, email, senha) VALUES
('Teste Usuário 1', 'teste1@email.com', 'teste123'),
('Teste Usuário 2', 'teste2@email.com', 'teste456');

-- Inserindo Produtos de teste
INSERT INTO Produto (nome, descricao, preco, estoque) VALUES
('Produto Teste 1', 'Produto de teste', 19.90, 10),
('Produto Teste 2', 'Outro produto de teste', 29.90, 5);

-- Inserindo Transações de teste
INSERT INTO Transacao (idUsuario, idProduto, quantidade) VALUES
(1, 1, 1),
(2, 2, 2);
