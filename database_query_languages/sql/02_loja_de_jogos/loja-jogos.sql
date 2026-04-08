# |==============================================================|
# | 1. INSERT INTO tabela (colunas) VALUES (dados);			     |
# | 2. UPDATE tabela SET coluna = novo_dado WHERE coluna = valor;|
# | 3. DELETE FROM tabela WHERE coluna = valor;				     |
# |==============================================================|

CREATE DATABASE LojaDeJogos; 

USE LojaDeJogos; 

CREATE TABLE cliente ( 
    idCliente INT AUTO_INCREMENT PRIMARY KEY, 
    nome VARCHAR(45) NOT NULL, 
    email VARCHAR(50) NOT NULL UNIQUE, 
    telefone CHAR(11) NOT NULL UNIQUE 
); 

CREATE TABLE jogo ( 
    idJogo INT AUTO_INCREMENT PRIMARY KEY, 
    titulo VARCHAR(100) NOT NULL, 
    genero VARCHAR(30) NOT NULL, 
    preco DECIMAL(10,2) NOT NULL, 
    desenvolvedor VARCHAR(50) NOT NULL 
); 

CREATE TABLE compra ( 
    idCompra INT AUTO_INCREMENT PRIMARY KEY, 
    idCliente INT NOT NULL, 
    idJogo INT NOT NULL, 
    data_compra DATE NOT NULL, 
    status ENUM('pendente', 'pago', 'cancelado') NOT NULL, 
    FOREIGN KEY (idCliente) REFERENCES cliente(idCliente), 
    FOREIGN KEY (idJogo) REFERENCES jogo(idJogo) 
); 

# |===========|
# |Exercício 1|
# |===========|
INSERT INTO cliente (nome,email,telefone)
VALUES ("Júlio Silva","julio_gamer@email.com","19991231234");

# |===========|
# |Exercício 2|
# |===========|
INSERT INTO cliente VALUES 
(NULL,"Leda Vieira","vieira_led@email.com ","11991235678"),
(NULL,"Ícaro Souza","icaro_csgo@email.com","11994567890"),
(NULL,"Helena Nunes","hell-lol@email.com","15971234567");

# |===========|
# |Exercício 3|
# |===========|
INSERT INTO jogo VALUES 
(NULL,"The Last Adventure","Ação",199.99,"Game Studio X"), 
(NULL,"Mystery Island","Aventura",149.50,"Adventure Works"), 
(NULL,"Space Wars","Ficção Científica",99.90,"Galactic Games"); 

# |===========|
# |Exercício 4|
# |===========|
UPDATE cliente SET email = "julio.silva@games.com" 
WHERE idCliente = 1;

# |===========|
# |Exercício 5|
# |===========|
UPDATE jogo SET preco = 79.90
WHERE idJogo = 3;

# |===========|
# |Exercício 6|
# |===========|
INSERT INTO compra (idCliente, idJogo, data_compra, status)
VALUES (2, 2,"2024-10-20","pendente");

# |===========|
# |Exercício 7|
# |===========|
INSERT INTO compra VALUES
(NULL,3,1,"2024-10-23","pendente");

# |===========|
# |Exercício 8|
# |===========|
UPDATE compra SET status = "cancelado"
WHERE idCompra = 2;

# |===========|
# |Exercício 9|
# |===========|
UPDATE compra SET status = "pago"
WHERE idCompra = 1;

# |===========|
# |Exercício 10|
# |===========|
DELETE FROM cliente WHERE idCliente = 4;