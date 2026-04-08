# |==============================================================|
# | 1. INSERT INTO tabela (colunas) VALUES (dados);			     |
# | 2. UPDATE tabela SET coluna = novo_dado WHERE coluna = valor;|
# | 3. DELETE FROM tabela WHERE coluna = valor;				     |
# |==============================================================|

CREATE DATABASE LojaCarros;

USE LojaCarros;

CREATE TABLE Fabricante (
	idFabricante INT PRIMARY KEY AUTO_INCREMENT,
    	nomeFabricante VARCHAR(20) NOT NULL,
    	paisOrigem VARCHAR(40) NOT NULL
);

CREATE TABLE Carro (
	idCarro INT PRIMARY KEY AUTO_INCREMENT,
    	placa VARCHAR(8) UNIQUE NOT NULL,
    	anofab INT NOT NULL,
    	cor VARCHAR(20) NOT NULL,
    	modelo VARCHAR(20) NOT NULL,
    	valor FLOAT NOT NULL,
    	idFabricante INT NOT NULL,
    	FOREIGN KEY (idFabricante) REFERENCES Fabricante(idFabricante)
);

# |===========|
# |Exercício 1|
# |===========|
INSERT INTO fabricante (nomeFabricante,paisOrigem)
VALUES ("Volskswagen","Alemanha");

# |===========|
# |Exercício 2|
# |===========|
INSERT INTO fabricante VALUES 
(NULL,"Toyata","Japão"),
(NULL,"GM Chevrolet","Estados Unidos"),
(NULL,"Honda","Japão"),
(NULL,"Hyundai","Coreia do Sul"),
(NULL,"Fiat","Itália");

# |===========|
# |Exercício 3|
# |===========|
INSERT INTO carro (placa,anoFab,cor,modelo,valor,idFabricante)
VALUES ("RTY1254",2018,"Branco","Polo 1.0 TSI",77000,1);

# |===========|
# |Exercício 4|
# |===========|
INSERT INTO carro VALUES 
(NULL,"HUY0989",2019,"Prata","City LX 1.5","81000",4),
(NULL,"FGT0988",2019,"Prata","Yaris Sedan 1.5","66000",2),
(NULL,"HYT1823",2021,"Preto","Argo 1.8","83000",6),
(NULL,"DEE8772",2014,"Prata","HB20s 1.0","45000",5);

# |===========|
# |Exercício 5|
# |===========|
UPDATE carro SET cor = "Azul Escuro" WHERE placa = "HYT1823";
UPDATE carro SET anofab = 2020 WHERE idCarro = 1;
UPDATE carro SET 
modelo = "Polo 1.6 MSI", 
cor = "Prata" 
WHERE valor = 77000;
UPDATE carro SET valor = 79999.99 WHERE cor = "Azul Escuro";

# |===========|
# |Exercício 6|
# |===========|
DELETE FROM carro WHERE placa = "HUY0989";

DROP DATABASE LojaCarros;