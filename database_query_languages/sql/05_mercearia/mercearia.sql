-- |==============================================================|
-- | 1. INSERT INTO tabela (colunas) VALUES (dados);              |
-- | 2. UPDATE tabela SET coluna = novo_dado WHERE coluna = valor;|
-- | 3. DELETE FROM tabela WHERE coluna = valor;                  |
-- |==============================================================|

DROP DATABASE IF EXISTS mercearia;

-- COMANDOS DDL
CREATE DATABASE mercearia;

USE mercearia;

CREATE TABLE categoria (
	idcategoria INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(30) NOT NULL,
    sigla CHAR(3) UNIQUE NOT NULL
);

CREATE TABLE marca (
	idmarca INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(40) NOT NULL
);

CREATE TABLE produto (
	idproduto INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(30) NOT NULL,
    preco FLOAT NOT NULL,
    quantidade INT NOT NULL,
    validade DATE,
    idmarca INT,
    idcategoria INT,
    FOREIGN KEY (idmarca) REFERENCES marca(idmarca),
    FOREIGN KEY (idcategoria) REFERENCES categoria(idcategoria)
);

-- COMANDOS DML
INSERT INTO categoria (descricao, sigla) VALUES
('Frutas', 'FRU'),
('Legumes', 'LEG'),
('Carnes', 'CAR'),
('Bebidas', 'BEB'),
('Higiene', 'HIG'),
('Limpeza', 'LPZ'),
('Laticínios', 'LAT');

INSERT INTO marca (nome) VALUES
('Natural Foods'),
('Green Fields'),
('Butcher King'),
('Aqua Fresh'),
('Dairy Delight'),
('Super Limp'),
('Lact 10'),
('Delux');

INSERT INTO produto (descricao, preco, quantidade, validade, idmarca, idcategoria) VALUES
('Maçã Gala pct 1kg', 15.50, 150, '2024-05-10', 1, 1),
('Batata Doce pct 1kg', 10.30, 200, '2024-06-15', 2, 2),
('Filé Mignon bandeja 500g', 35.00, 60, '2024-05-30', 3, 3),
('Água Mineral 500ml', 2.50, 300, '2026-07-20', 4, 4),
('Papel Higiênico 4 rolos', 6.50, 200, NULL, 6, 5),
('Desinfetante 500ml', 3.75, 150, NULL, 6, 6), 
('Queijo Prato 500g', 7.50, 120, '2024-08-25', 7, 7),
('Iogurte Grego bandeja 6un', 8.70, 100, '2024-06-10', 5, 7),
('Abacaxi Unidade', 7.20, 100, '2024-05-15', 1, 1),
('Cerveja Pilsen 600ml', 9.00, 300, '2025-01-01', 8, 4),
('Sabonete 150g', 2.30, 250, NULL, 6, 5),
('Amaciante 1 litro', 7.50, 90, NULL, 6, 6) ,
('Laranja pct 1kg', 7.40, 180, '2025-02-20', 1, 1),
('Cenoura Orgânica pct 500g', 5.50, 150, '2024-05-30', 2, 2),
('Costela de Porco pct 550g', 18.00, 40, '2024-06-10', 3, 3),
('Refrigerante Cola 2 litros', 8.50, 200, '2025-04-05', 4, 4),
('Papel Toalha 2 rolos', 5.00, 180, NULL, 6, 5),
('Limpador Multiuso 500ml', 4.00, 120, NULL, 6, 6),
('Leite Integral 1 litro', 4.80, 200, '2024-09-30', 7, 7),
('Manteiga pct 300g', 7.50, 100, '2024-10-20', 5, 7),
('Morango pct 200g', 8.90, 100, '2024-06-10', 1, 1),
('Vinho Tinto 1 litro', 18.00, 80, '2025-06-01', 8, 4),
('Shampoo 500ml', 7.50, 150, NULL, 6, 5),
('Detergente 300ml', 4.20, 200, NULL, 6, 6),
('Iogurte Natural bandeja 2un', 6.50, 120, '2024-09-05', 5, 7),
('Limão pct 1kg', 4.60, 120, '2025-02-28', 1, 1),
('Água de Coco cx 200ml', 3.00, 100, '2025-05-15', 4, 4),
('Creme Dental', 4.00, 180, NULL, 6, 5),
('Sabão em Pó 1kg', 11.00, 100, NULL, 6, 6),
('Iogurte de Frutas bandeja 2un', 4.20, 150, '2024-09-12', 5, 7),
('Pera pct 300g', 4.70, 80, '2024-06-20', 1, 1); 

-- |===========|
-- |Exercício 1| Listar todas as colunas e registros da tabela “produto”. 
-- |===========|
SELECT * FROM Produto;

-- |===========|
-- |Exercício 2| Listar somente as colunas “descricao” e “preco” da tabela “produto”, apenas dos produtos que tenham o preço maior que 10 reais. 
-- |===========|
SELECT descricao, preco FROM produto WHERE preco > 10; 

-- |===========|
-- |Exercício 3| Listar somente as colunas “descricao” e “quantidade” da tabela “produto”, apenas da marca “Dairy Delight”.
-- |===========|
SELECT descricao, quantidade FROM Produto WHERE idMarca = 5; 

-- |===========|
-- |Exercício 4| Listar somente as colunas “descricao” e “validade” da tabela “produto”, apenas da categoria “Laticínios”, mostrando em ordem decrescente pela data de validade. 
-- |===========|
SELECT descricao, validade FROM Produto WHERE idCategoria = 7 ORDER BY validade DESC;

-- |===========|
-- |Exercício 5| Listar as colunas “descricao” e “preco” da tabela “produto”, apenas da marca “Natural Foods”, mostrando em ordem crescente pelo preço. 
-- |===========|
SELECT descricao, preco FROM Produto WHERE idMarca = 1 ORDER BY preco ASC;

-- |===========|
-- |Exercício 6| Mostrar o total de itens cadastrados na tabela “produto”. 
-- |===========|
SELECT count(*) FROM produto; 

-- |===========|
-- |Exercício 7| Mostrar o total de produtos no estoque (soma de todos as quantidades) cadastrados na tabela “produto”. 
-- |===========|
SELECT SUM(quantidade) FROM Produto;

-- |===========|
-- |Exercício 8| Mostrar a quantidade de itens da categoria “Frutas” que estão cadastrados na tabela “produto”. 
-- |===========|
SELECT count(*) FROM Produto WHERE idCategoria = 1;

-- |===========|
-- |Exercício 9| Mostrar a média dos preços apenas dos itens da categoria “Bebidas” cadastrados na tabela “produto”. 
-- |===========|
SELECT AVG(preco) FROM Produto WHERE idCategoria = 4;

-- |===========|
-- |Exercício 10| Mostrar o maior preço dos itens cadastrados na tabela “produto”. 
-- |===========|
SELECT MAX(preco) FROM Produto;

-- |===========|
-- |Exercício 11| Mostrar o menor preço dos itens da marca “Super Limp” cadastrados na tabela “produto”. 
-- |===========|
SELECT MIN(preco) FROM Produto WHERE idMarca = 6;

-- |===========|
-- |Exercício 12| Mostrar as colunas “idProduto” e “descricao” dos produtos que iniciem com a letra “a” cadastrados na tabela “produto”. 
-- |===========|
SELECT idproduto, descricao FROM Produto WHERE descricao LIKE 'a%';

-- |===========|
-- |Exercício 13| Mostrar as colunas “idProduto”, “descricao” e “preco” dos produtos que contenham a palavra “iogurte” cadastrados na tabela “produto”. 
-- |===========|
SELECT idproduto, descricao, preco FROM Produto WHERE descricao LIKE '%Iogurte%';

-- |===========|
-- |Exercício 14| Mostrar as colunas “idProduto”, “descricao” dos produtos que não tem data de vencimento cadastrados na tabela “produto”. 
-- |===========|
SELECT idproduto, descricao FROM Produto WHERE validade IS NULL; 

-- |===========|
-- |Exercício 15| Mostrar as colunas “idProduto”, “descricao” e “validade” dos produtos em que a validade será no mês de maio/2024, cadastrados na tabela “produto”. 
-- |===========|
SELECT idproduto, descricao, validade FROM Produto WHERE validade BETWEEN '2024-05-01' AND '2024-05-31';

-- |===========|
-- |Exercício 16| Mostrar as colunas “descricao” e “preco” da tabela "produto", apenas os três produtos mais caros em ordem descrescente. 
-- |===========|
SELECT descricao, preco FROM produto ORDER BY preco DESC LIMIT 3;

-- |===========|
-- |Exercício 17| Mostrar a quantidade de itens em cada categoria registrada na tabela “produto”, agrupando pelo “idcategoria”.  
-- |===========|
SELECT idcategoria, COUNT(*) FROM produto GROUP BY idcategoria;