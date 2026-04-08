-- |==============================================================|
-- | 1. INSERT INTO tabela (colunas) VALUES (dados);              |
-- | 2. UPDATE tabela SET coluna = novo_dado WHERE coluna = valor;|
-- | 3. DELETE FROM tabela WHERE coluna = valor;                  |
-- |==============================================================|

DROP DATABASE IF EXISTS PetShop_Caramelo;

CREATE DATABASE PetShop_Caramelo;
USE  PetShop_Caramelo;

/* COMANDOS DDL */

-- Tabela Cliente
CREATE TABLE Cliente (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    nomeCliente VARCHAR(60) NOT NULL,
    whatsapp CHAR(11)
);

-- Tabela Pet
CREATE TABLE Pet (
    idPet INT AUTO_INCREMENT PRIMARY KEY,
    nomePet VARCHAR(30) NOT NULL,
    especie VARCHAR(30) NOT NULL,
    raca VARCHAR(40),
    genero ENUM('F', 'M'),
    idCliente INT NOT NULL,
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
        ON DELETE CASCADE
);

-- Tabela Vendedor
CREATE TABLE Vendedor (
    idVendedor INT AUTO_INCREMENT PRIMARY KEY,
    nomeVendedor VARCHAR(45) NOT NULL
);

-- Tabela FormaPgto
CREATE TABLE FormaPgto (
    idFormPgto INT AUTO_INCREMENT PRIMARY KEY,
    nomePgto VARCHAR(40) NOT NULL
);

-- Tabela Produto
CREATE TABLE Produto (
    idProduto INT AUTO_INCREMENT PRIMARY KEY,
    nomeProduto VARCHAR(100) NOT NULL,
    descricao TEXT,
    marca VARCHAR(45),
    valor DECIMAL(7,2) NOT NULL,
    quantEstoque INT NOT NULL
);

-- Tabela Servico
CREATE TABLE Servico (
    idServico INT AUTO_INCREMENT PRIMARY KEY,
    nomeServico VARCHAR(30) NOT NULL,
    descricao VARCHAR(80),
    valor DECIMAL(7,2) NOT NULL
);

-- Tabela Venda
CREATE TABLE Venda (
    idVenda INT AUTO_INCREMENT PRIMARY KEY,
    valor DECIMAL(7,2) NOT NULL,
    data DATETIME NOT NULL,
    status VARCHAR(45),
    idCliente INT NOT NULL,
    idFormPgto INT NOT NULL,
    idVendedor INT NOT NULL,
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente),
    FOREIGN KEY (idFormPgto) REFERENCES FormaPgto(idFormPgto),
    FOREIGN KEY (idVendedor) REFERENCES Vendedor(idVendedor)
);

-- Tabela Venda_Produto
CREATE TABLE Venda_Produto (
    idVenda_Produto INT AUTO_INCREMENT PRIMARY KEY,
    quantidade INT NOT NULL,
    idVenda INT NOT NULL,
    idProduto INT NOT NULL,
    FOREIGN KEY (idVenda) REFERENCES Venda(idVenda)
        ON DELETE CASCADE,
    FOREIGN KEY (idProduto) REFERENCES Produto(idProduto)
);

-- Tabela Venda_Servico
CREATE TABLE Venda_Servico (
    idVenda_Servico INT AUTO_INCREMENT PRIMARY KEY,
    idVenda INT NOT NULL,
    idServico INT NOT NULL,
    idPet INT,
    FOREIGN KEY (idVenda) REFERENCES Venda(idVenda)
        ON DELETE CASCADE,
    FOREIGN KEY (idServico) REFERENCES Servico(idServico),
    FOREIGN KEY (idPet) REFERENCES Pet(idPet)
);

/* COMANDOS DML */

-- Cliente
INSERT INTO Cliente (nomeCliente, whatsapp) VALUES
('João Silva', '15929240584'),
('Maria Oliveira', '15914001038'),
('Carlos Souza', '15968158440'),
('Ana Santos', '15790510805'),
('Paulo Mendes', '15952144443'),
('Juliana Castro', '15955702688'),
('Roberto Lima', '15989644734'),
('Fernanda Rocha', '15990358868'),
('Ricardo Alves', '15980299085'),
('Camila Ribeiro', '15986564698');

-- Pet
INSERT INTO Pet (nomePet, especie, raca, genero, idCliente) VALUES
('Rex', 'Cachorro', 'Labrador', 'M', 1),
('Mimi', 'Gato', 'Persa', 'F', 1),
('Thor', 'Cachorro', 'Bulldog', 'M', 2),
('Luna', 'Gato', 'Siamês', 'F', 3),
('Bob', 'Cachorro', 'Poodle', 'M', 4),
('Mel', 'Gato', 'Maine Coon', 'F', 5),
('Toby', 'Cachorro', 'Beagle', 'M', 5),
('Nina', 'Gato', 'Angorá', 'F', 5),
('Spike', 'Cachorro', 'Pastor Alemão', 'M', 6),
('Bela', 'Gato', 'Bengal', 'F', 7),
('Chico', 'Cachorro', 'Golden retriever', 'M', 8),
('Lila', 'Gato', 'SRD','F', 9),
('Tobby', 'Cachorro', 'Pinscher', 'M', 10);

-- Vendedor
INSERT INTO Vendedor (idVendedor, nomeVendedor) VALUES
(1, 'Olívia Mendes'),
(2, 'Pedro Tobias'),
(3, 'João Franco'),
(4, 'Eliana Ricco'),
(5, 'Denise Tavares');

-- FormaPgto
INSERT INTO FormaPgto (idFormPgto, nomePgto) VALUES
(1, 'Dinheiro'),
(2, 'PIX'),
(3, 'Cartão Débito'),
(4, 'Cartão Crédito'),
(5, 'Cheque'),
(6, 'Promissória'),
(7, 'Permuta');

-- Produto
INSERT INTO Produto (nomeProduto, descricao, marca, valor, quantEstoque) VALUES
('Coleira Petz Waterproof Camarão para Cães', 'Coleira resistente à água com fecho de segurança de 4 pontos, ideal para passeios em qualquer clima.', 'Petz', 39.99, 50),
('Brinquedo Mico Leão de Pelúcia Petz para Cães', 'Brinquedo de pelúcia em formato de mico leão, ideal para diversão e conforto do seu cão.', 'Petz', 29.99, 30),
('Shampoo Cheio de Energia Petz para Cães 500ml', 'Shampoo com pH neutro que deixa os pelos macios e brilhantes, proporcionando um banho energizante.', 'Petz', 23.99, 40),
('Coleira Petz Jujuba para Cães', 'Coleira com estampa divertida de jujubas, feita de poliéster resistente e fecho de plástico.', 'Petz', 19.99, 60),
('Brinquedo Louro de Pelúcia Petz para Cães', 'Brinquedo de pelúcia em formato de louro, ideal para cães que gostam de morder e abraçar.', 'Petz', 29.99, 35),
('Shampoo Banho de Carinho Petz para Cães 500ml', 'Shampoo desenvolvido para cãezinhos com peles delicadas, com formulação neutra e balanceada.', 'Petz', 23.99, 45),
('Coleira Petz Geométrica para Cães', 'Coleira com estampa geométrica colorida, feita de poliéster resistente e fecho de plástico.', 'Petz', 19.99, 55),
('Brinquedo Piranha de Pelúcia Petz para Cães', 'Brinquedo de pelúcia em formato de piranha, ideal para cães que gostam de brincar de morder.', 'Petz', 29.99, 25),
('Shampoo Granado Suave para Cães Filhotes 500ml', 'Shampoo suave indicado para cães filhotes, limpa delicadamente sem agredir a pele.', 'Granado', 24.99, 50),
('Brinquedo Tucano de Pelúcia Petz para Cães', 'Brinquedo de pelúcia em formato de tucano, ideal para diversão e conforto do seu cão.', 'Petz', 29.99, 30),
('Ração Seleção Natural para Cães Adultos de Porte Médio e Grande Sabor Frango com Batata Doce 12kg', 'Ração seca para cães adultos de porte médio e grande, sabor frango com batata doce, 12kg.', 'Golden', 179.90, 50),
('Ração Raças Específicas Golden Retriever para Cães Adultos - 12kg', 'Ração seca para cães adultos da raça Golden Retriever, 12kg.', 'Premier Pet', 279.99, 30),
('Ração Fórmula Light para Cães Adultos - 15kg', 'Ração seca light para cães adultos, 15kg.', 'Premier Pet', 186.90, 40),
('Ração Mega para Cães Adultos de Porte Grande Sabor Frango e Arroz - 15kg', 'Ração seca para cães adultos de porte grande, sabor frango e arroz, 15kg.', 'Premier Pet', 174.90, 35),
('Ração Seleção Natural para Cães Sênior de Porte Médio e Grande Sabor Frango e Arroz 12kg', 'Ração seca para cães sênior de porte médio e grande, sabor frango e arroz, 12kg.', 'Golden', 184.90, 25),
('Ração Power Training para Cães Filhotes Sabor Frango e Arroz - 15kg', 'Ração seca para cães filhotes, sabor frango e arroz, 15kg.', 'Premier Pet', 189.90, 45),
('Ração Fórmula Mini Bits para Cães Sênior de Porte Pequeno Sabor Frango e Arroz', 'Ração seca mini bits para cães sênior de porte pequeno, sabor frango e arroz.', 'Premier Pet', 59.90, 60),
('Ração Raças Específicas para Golden Retriever Filhotes Sabor Frango 10,1kg', 'Ração seca para filhotes da raça Golden Retriever, sabor frango, 10,1kg.', 'Premier Pet', 242.90, 20),
('Ração Fórmula para Cães Adultos Sabor Carne e Arroz', 'Ração seca para cães adultos, sabor carne e arroz.', 'Premier Pet', 58.90, 70),
('Ração Mega para Cães Filhotes de Porte Grande Sabor Frango e Arroz 15kg', 'Ração seca para cães filhotes de porte grande, sabor frango e arroz, 15kg.', 'Premier Pet', 184.90, 30);

-- Servico
INSERT INTO Servico (nomeServico, descricao, valor) VALUES
('Banho Porte Pequeno e Médio', 'Banho completo para o pet de porte pequeno e médio.', 40.00),
('Banho Porte Grande', 'Banho completo com produtos especiais para o pet de porte grande.', 70.00),
('Tosa Completa', 'Serviço de tosa higiênica, tosa geral e aparo.', 30.00),
('Hidratação de Pelos', 'Hidratação profunda dos pelos com produtos específicos.', 35.00),
('Corte de Unhas', 'Aparar as unhas do pet de forma segura e confortável.', 25.00),
('Limpeza de Ouvidos', 'Higienização completa dos ouvidos do pet com produtos veterinários.', 15.00),
('Vacinação', 'Aplicação de vacinas obrigatórias ou opcionais para cães e gatos.', 100.00),
('Banho Medicinal', 'Banho terapêutico com produtos específicos para problemas de pele e alergias.', 110.00);

-- Venda
INSERT INTO Venda (valor, data, status, idCliente, idFormPgto, idVendedor) VALUES
(54.18, '2024-08-17 10:27:45', 'Concluída', 3, 1, 5),
(140.39, '2024-05-09 23:19:07', 'Concluída', 4, 1, 5),
(205.27, '2024-06-30 09:37:13', 'Concluída', 7, 3, 1),
(427.85, '2024-07-25 18:53:17', 'Cancelada', 9, 3, 4),
(404.32, '2024-03-29 14:32:53', 'Pendente', 5, 4, 3),
(99.96, '2024-02-28 10:16:12', 'Concluída', 2, 4, 5),
(447.37, '2024-05-10 04:40:46', 'Cancelada', 6, 5, 3),
(264.44, '2024-10-07 02:21:48', 'Pendente', 2, 7, 4),
(246.62, '2024-02-10 16:09:45', 'Concluída', 1, 2, 2),
(160.32, '2024-12-25 20:13:59', 'Concluída', 1, 6, 2);

-- Venda_Produto
INSERT INTO Venda_Produto (quantidade, idVenda, idProduto) VALUES
(3, 2, 16),
(1, 8, 15),
(2, 1, 8),
(1, 3, 1),
(3, 10, 18),
(5, 5, 11),
(3, 9, 8),
(4, 5, 20),
(5, 8, 14),
(5, 9, 16),
(4, 10, 18),
(4, 2, 11),
(5, 4, 9),
(3, 5, 19),
(1, 9, 5);

-- Venda_Servico
INSERT INTO Venda_Servico (idVenda, idServico, idPet) VALUES
(6, 6, 6),
(9, 8, 11),
(3, 3, 3),
(6, 5, 6),
(2, 8, 8),
(6, 3, 1),
(2, 3, 4),
(8, 5, 13),
(6, 2, 8),
(5, 4, 12);

/* COMANDOS DQL */

-- |===========|
-- |Exercício 1| Nome e telefone dos clientes que compraram produtos da marca 'Premier Pet' 
-- |===========|
SELECT DISTINCT c.nomeCliente, c.whatsapp
FROM Cliente c
INNER JOIN Venda v ON c.idCliente = v.idCliente
INNER JOIN Venda_Produto vp ON v.idVenda = vp.idVenda
INNER JOIN Produto p ON vp.idProduto = p.idProduto
WHERE p.marca = 'Premier Pet';

-- |===========|
-- |Exercício 2| Nome dos produtos e valor dos produtos comprados pela cliente 'Maria Oliveira'
-- |===========|
SELECT p.nomeProduto, p.valor
FROM Produto p
INNER JOIN Venda_Produto vp ON p.idProduto = vp.idProduto
INNER JOIN Venda v ON vp.idVenda = v.idVenda
INNER JOIN Cliente c ON v.idCliente = c.idCliente
WHERE c.nomeCliente = 'Maria Oliveira';

-- |===========|
-- |Exercício 3| Soma total das vendas por vendedor
-- |===========|
SELECT v.nomeVendedor, SUM(ve.valor) AS totalVendas
FROM Vendedor v
INNER JOIN Venda ve ON v.idVendedor = ve.idVendedor
GROUP BY v.nomeVendedor;

-- |===========|
-- |Exercício 4| Lista com o nome dos clientes e o nome dos produtos comprados por eles 
-- |===========|
SELECT c.nomeCliente, p.nomeProduto
FROM Cliente c
INNER JOIN Venda v ON c.idCliente = v.idCliente
INNER JOIN Venda_Produto vp ON v.idVenda = vp.idVenda
INNER JOIN Produto p ON vp.idProduto = p.idProduto;

-- |===========|
-- |Exercício 5| Nome do cliente que comprou o produto Shampoo Granado
-- |===========|
SELECT DISTINCT c.nomeCliente
FROM Cliente c
INNER JOIN Venda v ON c.idCliente = v.idCliente
INNER JOIN Venda_Produto vp ON v.idVenda = vp.idVenda
INNER JOIN Produto p ON vp.idProduto = p.idProduto
WHERE p.nomeProduto LIKE '%Shampoo Granado%';

-- |===========|
-- |Exercício 6| Nome, descrição, valor e data da realização do serviço para o pet chamado "Rex"
-- |===========|
SELECT s.nomeServico, s.descricao, s.valor, v.data
FROM Servico s
INNER JOIN Venda_Servico vs ON s.idServico = vs.idServico
INNER JOIN Venda v ON vs.idVenda = v.idVenda
INNER JOIN Pet p ON vs.idPet = p.idPet
WHERE p.nomePet = 'Rex';

-- |===========|
-- |Exercício 7| Nome dos clientes, telefone e nome dos Pets que receberam o serviço de Tosa Completa
-- |===========|
SELECT c.nomeCliente, c.whatsapp, p.nomePet
FROM Cliente c
INNER JOIN Pet p ON c.idCliente = p.idCliente
INNER JOIN Venda_Servico vs ON p.idPet = vs.idPet
INNER JOIN Servico s ON vs.idServico = s.idServico
INNER JOIN Venda v ON vs.idVenda = v.idVenda
WHERE s.nomeServico = 'Tosa Completa';

-- |===========|
-- |Exercício 8| Liste o nome dos clientes, forma de pagamento, valor das vendas e datas, das vendas feitas por cartões, Débito ou Crédito. 
-- |===========|
SELECT c.nomeCliente, f.nomePgto, v.valor, v.data
FROM Cliente c
INNER JOIN Venda v ON c.idCliente = v.idCliente
INNER JOIN FormaPgto f ON v.idFormPgto = f.idFormPgto
WHERE f.nomePgto IN ('Cartão Débito', 'Cartão Crédito')
ORDER BY v.data DESC;

-- |===========|
-- |Exercício 9| Cliente com a maior compra individual
-- |===========|
SELECT c.nomeCliente, v.valor
FROM Venda v
INNER JOIN Cliente c ON v.idCliente = c.idCliente
WHERE v.valor = (SELECT MAX(valor) FROM Venda);

-- |===========|
-- |Exercício 10| Liste o nome do cliente e seus respectivos Pets
-- |===========|
SELECT c.nomeCliente, p.nomePet
FROM Cliente c
LEFT JOIN Pet p ON c.idCliente = p.idCliente
ORDER BY c.nomeCliente;
