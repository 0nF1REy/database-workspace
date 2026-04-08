-- |==============================================================|
-- | 1. INSERT INTO tabela (colunas) VALUES (dados);              |
-- | 2. UPDATE tabela SET coluna = novo_dado WHERE coluna = valor;|
-- | 3. DELETE FROM tabela WHERE coluna = valor;                  |
-- |==============================================================|

-- COMANDOS DDL
CREATE DATABASE LojaTenis;

USE LojaTenis;

CREATE TABLE CategoriaTenis (
	idCategoria INT PRIMARY KEY AUTO_INCREMENT,
    nomeCategoria VARCHAR(30) NOT NULL
);

CREATE TABLE MarcaTenis (
	idMarca INT PRIMARY KEY AUTO_INCREMENT,
    nomeMarca VARCHAR(40) NOT NULL
);

CREATE TABLE Tenis (
	idTenis INT PRIMARY KEY AUTO_INCREMENT,
    modelo VARCHAR(30) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    tamanho INT NOT NULL,
    cor VARCHAR(20) NOT NULL,
    idMarca INT NOT NULL,
    idCategoria INT NOT NULL,
    FOREIGN KEY (idMarca) REFERENCES MarcaTenis(idMarca),
    FOREIGN KEY (idCategoria) REFERENCES CategoriaTenis(idCategoria)
);

-- COMANDOS DML
INSERT INTO CategoriaTenis (nomeCategoria) VALUES
('Corrida'),
('Basquete'),
('Skate'),
('Casual'),
('Trilha');

INSERT INTO MarcaTenis (nomeMarca) VALUES
('Nike'),
('Adidas'),
('Puma'),
('Reebok'),
('New Balance'),
('Mizuno'),
('Vans'),
('Fila');

INSERT INTO Tenis (modelo, preco, tamanho, cor, idMarca, idCategoria) VALUES
('Air Zoom Pegasus', 299.99, 35, 'Preto/Vermelho', 1, 1),
('Superstar', 249.99, 39, 'Branco/Preto', 2, 4),
('Suede Classic', 149.99, 38, 'Azul', 3, 4),
('Classic Leather', 129.99, 40, 'Branco', 4, 4),
('Fresh Foam Roav', 199.99, 34, 'Cinza/Rosa', 5, 4),
('Air Max 270', 169.99, 41, 'Branco/Azul', 1, 4),
('Chuck Taylor All Star', 79.99, 36, 'Preto', 2, 4),
('Cell Venom', 119.99, 38, 'Preto/Amarelo', 3, 4),
('Club C 85', 89.99, 39, 'Branco', 4, 4),
('FuelCore Nergize', 79.99, 37, 'Cinza', 5, 4);

-- |===========|
-- |Exercício 1| MOSTRAR TODOS OS CAMPOS DA TABELA MARCA
-- |===========|
SELECT * FROM MarcaTenis;

-- |===========|
-- |Exercício 2| MOSTRAR TODOS OS CAMPOS DA TABELA CATEGORIA 
-- |===========|
SELECT * FROM CategoriaTenis;

-- |===========|
-- |Exercício 3| MOSTRAR TODOS OS CAMPOS DA TABELA TENIS 
-- |===========|
SELECT * FROM Tenis;

-- |===========|
-- |Exercício 4| MOSTRAR OS CAMPOS "MODELO" E "PRECO" DOS TÊNIS DA MARCA NIKE 
-- |===========|

-- Primeiro jeito
SELECT modelo, preco FROM Tenis WHERE idMarca = 1;

-- Segundo jeito
SELECT modelo, preco FROM Tenis WHERE idMarca = 
(SELECT idMarca FROM MarcaTenis WHERE nomeMarca = "Nike");

-- |===========|
-- |Exercício 5| MOSTRAR OS CAMPOS “MODELO”, “PRECO” E “TAMANHO” DOS TÊNIS DA MARCA REEBOK
-- |===========|

SELECT modelo, preco, tamanho FROM Tenis WHERE idMarca = 4;

-- |===========|
-- |Exercício 6| MOSTRAR OS CAMPOS “MODELO” E” PRECO” DOS TÊNIS ACIMA DE 150 REAIS. 
-- |===========|

SELECT modelo, preco FROM Tenis WHERE preco >= 150.0;

-- |===========|
-- |Exercício 7| MOSTRAR OS CAMPOS “MODELO” E “TAMANHO” DOS TÊNIS ORDENANDO DE FORMA CRESCENTE POR TAMANHO. 
-- |===========|

SELECT modelo, tamanho FROM Tenis ORDER BY tamanho ASC;

-- |===========|
-- |Exercício 8| MOSTRAR OS CAMPOS “MODELO” E “PRECO” DOS TÊNIS QUE ESTEJAM ENTRE 100 E 200 REAIS. 
-- |===========|
SELECT modelo, preco FROM Tenis WHERE preco BETWEEN 100 AND 200;

-- |===========|
-- |Exercício 9| MOSTRAR TODOS OS CAMPOS DOS TÊNIS COM TAMANHO ENTRE 35 E 40. 
-- |===========|
SELECT * FROM Tenis WHERE tamanho BETWEEN 35 AND 40;

-- |===========|
-- |Exercício 10| MOSTRAR OS CAMPOS “MODELO”, “PRECO” E “TAMANHO” DOS TÊNIS QUE TENHAM A PALAVRA 'CLASSIC' NO SEU NOME DO MODELO
-- |===========|
SELECT modelo,preco,tamanho FROM Tenis WHERE modelo LIKE "%Classic%";

-- |============|
-- |Exercício 11| MOSTRE A SOMA DOS PREÇOS DE TODOS OS TÊNIS.
-- |===========|
SELECT SUM(preco) AS soma_total FROM Tenis;

-- |============|
-- |Exercício 12| MOSTRE A SOMA DOS PREÇOS DOS TÊNIS DA MARCA ADIDAS. 
-- |===========|
SELECT SUM(preco) AS soma_total_adidas FROM Tenis WHERE idMarca = 2;

-- |============|
-- |Exercício 13| MOSTRE A QUANTIDADE DE TÊNIS DE CADA MARCA. 
-- |===========|
SELECT idMarca, COUNT(idTenis) AS quantidade
FROM Tenis
GROUP BY idMarca;

-- |============|
-- |Exercício 14| MOSTRE A QUANTIDADE DE TÊNIS DE CADA CATEGORIA.
-- |===========|

-- Primeiro jeito
SELECT idCategoria, COUNT(idTenis) AS qtnd_cada_categoria
FROM Tenis
GROUP BY idCategoria;

-- Segundo jeito
SELECT C.nomeCategoria, COUNT(T.idTenis) AS qtnd_cada_categoria
FROM Tenis T
JOIN CategoriaTenis C ON T.idCategoria = C.idCategoria
GROUP BY C.nomeCategoria;

-- Terceiro jeito
SELECT CategoriaTenis.nomeCategoria, COUNT(Tenis.idTenis) AS qtnd_cada_categoria
FROM Tenis
JOIN CategoriaTenis ON Tenis.idCategoria = CategoriaTenis.idCategoria
GROUP BY CategoriaTenis.nomeCategoria;


-- |============|
-- |Exercício 15| MOSTRE A QUANTIDADE DE TÊNIS DE CADA TAMANHO. 
-- |===========|
SELECT tamanho, COUNT(idTenis) AS qtnd_cada_tamanho
FROM Tenis
GROUP BY tamanho;

-- |============|
-- |Exercício 16| MOSTRE A QUANTIDADE DE TÊNIS POR MARCA, MAS MOSTRE O NOME DA MARCA.
-- |===========|

-- Primeiro jeito
SELECT M.nomeMarca, COUNT(T.idTenis) AS qtnd_cada_marca
FROM Tenis T
JOIN MarcaTenis M ON T.idMarca = M.idMarca
GROUP BY M.nomeMarca;

-- Segundo jeito
SELECT MarcaTenis.nomeMarca, COUNT(Tenis.idTenis) AS qtnd_cada_marca
FROM Tenis
JOIN MarcaTenis ON Tenis.idMarca = MarcaTenis.idMarca
GROUP BY MarcaTenis.nomeMarca;

-- |============|
-- |Exercício 17| MOSTRAR TODOS OS TÊNIS ORDENADOS PELO PREÇO EM ORDEM DECRESCENTE.
-- |===========|
SELECT idTenis FROM Tenis ORDER BY preco DESC;

-- |============|
-- |Exercício 18| AGRUPAR OS TÊNIS POR CATEGORIA E MOSTRAR A QUANTIDADE DE TÊNIS EM CADA CATEGORIA.
-- |===========|

-- Primeiro jeito
SELECT C.nomeCategoria, COUNT(T.idTenis) AS qtnd_cada_categoria
FROM Tenis T
JOIN CategoriaTenis C ON T.idCategoria = C.idCategoria
GROUP BY C.nomeCategoria;

-- Segundo jeito
SELECT CategoriaTenis.nomeCategoria, COUNT(Tenis.idTenis) AS qtnd_cada_marca
FROM Tenis
JOIN CategoriaTenis ON Tenis.idCategoria = CategoriaTenis.idCategoria
GROUP BY CategoriaTenis.nomeCategoria;

-- |============|
-- |Exercício 19| MOSTRAR O NÚMERO TOTAL DE TÊNIS CADASTRADOS. 
-- |===========|

-- Primeiro jeito
SELECT COUNT(idTenis) AS total_tenis_cadastrados FROM Tenis;

-- Segundo jeito
SELECT COUNT(*) AS total_tenis_cadastrados FROM Tenis;

-- Terceiro jeito
SELECT COUNT(1) AS total_tenis_cadastrados FROM Tenis;

-- Quarta jeito
SELECT COUNT(idTenis) AS total_tenis_cadastrados 
FROM Tenis
HAVING COUNT(idTenis) > 0;


-- |============|
-- |Exercício 20| CALCULAR O VALOR TOTAL DOS TÊNIS DISPONÍVEIS. 
-- |===========|

-- Primeiro jeito
SELECT SUM(preco) AS valor_total_tenis FROM Tenis;

-- Segundo jeito
SELECT (SELECT SUM(preco) FROM Tenis) AS valor_total_tenis;

-- |============|
-- |Exercício 21| MOSTRAR O TÊNIS COM O MAIOR PREÇO. 
-- |===========|

-- Primeiro jeito
SELECT modelo, preco 
FROM Tenis 
WHERE preco = (SELECT MAX(preco) FROM Tenis);

-- Segundo jeito
SELECT modelo, preco 
FROM Tenis 
ORDER BY preco DESC 
LIMIT 1;

-- |============|
-- |Exercício 22| MOSTRAR O TÊNIS COM O MENOR PREÇO.
-- |===========|

-- Primeiro jeito
SELECT modelo, preco 
FROM Tenis 
WHERE preco = (SELECT MIN(preco) FROM Tenis);

-- Segundo jeito
SELECT modelo, preco 
FROM Tenis 
ORDER BY preco ASC 
LIMIT 1;

-- |============|
-- |Exercício 23| MOSTRAR CATEGORIAS COM MAIS DE 2 TÊNIS CADASTRADOS.
-- |===========|
SELECT idCategoria, COUNT(idTenis) AS qntd_tenis
FROM Tenis
GROUP BY idCategoria
HAVING COUNT(idTenis) > 2;

-- |============|
-- |Exercício 24| MOSTRAR TODAS AS CORES DE TÊNIS DISPONÍVEIS (SEM REPETIÇÕES).
-- |===========|

-- Primeiro jeito
SELECT DISTINCT cor FROM Tenis;

-- Segundo jeito
SELECT cor
FROM Tenis
GROUP BY cor;

-- |============|
-- |Exercício 25| MOSTRAR OS 3 PRIMEIROS TÊNIS CADASTRADOS.
-- |===========|
SELECT DISTINCT idTenis,modelo FROM Tenis LIMIT 3;

-- |============|
-- |Exercício 26| MOSTRAR OS TÊNIS A PARTIR DO 4º REGISTRO.
-- |===========|
SELECT DISTINCT idTenis,modelo FROM Tenis WHERE idTenis >= 4;

-- |============|
-- |Exercício 27| MOSTRAR OS TÊNIS QUE SÃO DA CATEGORIA 'CASUAL' OU 'SKATE'. 
-- |===========|
SELECT idTenis,modelo
FROM Tenis 
WHERE idCategoria IN (SELECT idCategoria FROM CategoriaTenis WHERE nomeCategoria IN ('Casual', 'Skate'));

# |============|
# |Exercício 28| 
# |===========|
DROP DATABASE LojaTenis;
