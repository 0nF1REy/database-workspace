# 🧾 Enunciado Geral
# Você é responsável por desenvolver o banco de dados para a "Academia de Bruxaria Lua Crescente", que gerencia bruxas, suas poções, feitiços e o reino mágico ao qual pertencem.
# Responda os desafios abaixo usando comandos SQL no MySQL Workbench ou terminal.

# |==============================================================|
# | 1. INSERT INTO tabela (colunas) VALUES (dados);              |
# | 2. UPDATE tabela SET coluna = novo_dado WHERE coluna = valor;|
# | 3. DELETE FROM tabela WHERE coluna = valor;                  |
# |==============================================================|

CREATE DATABASE AcademiaBruxaria;

USE AcademiaBruxaria;

CREATE TABLE Bruxa (
    idBruxa INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    idade INT,
    nivelMagia VARCHAR(50)
);

CREATE TABLE Pocao (
    idPocao INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    efeito VARCHAR(200),
    nivelRecomendado VARCHAR(50)
);

CREATE TABLE BruxaPocao (
    idBruxa INT,
    idPocao INT,
    FOREIGN KEY (idBruxa) REFERENCES Bruxa(idBruxa),
    FOREIGN KEY (idPocao) REFERENCES Pocao(idPocao)
);

# |===========|
# |Exercício 1|
# |===========|
INSERT INTO Bruxa (nome, idade, nivelMagia) VALUES
("Morgana das Sombras", 134, "Avançada"),
("Elvira da Névoa", 89, "Intermediária"),
("Luna da Floresta", 46, "Iniciante");

# |===========|
# |Exercício 2|
# |===========|
INSERT INTO Pocao (nome, efeito, nivelRecomendado) VALUES
("Poção de Invisibilidade", "Torna quem bebe invisível por 1 hora", "Avançada"),
("Poção da Calma", "Reduz a raiva de dragões", "Intermediária"),
("Poção de Cura Rápida", "Cura ferimentos leves instantaneamente", "Iniciante");

# |===========|
# |Exercício 4|
# |===========|
UPDATE Bruxa SET nivelMagia = "Intermediária"
WHERE nome = "Luna da Floresta";

# |===========|
# |Exercício 5|
# |===========|
DELETE FROM Pocao WHERE nome = "Poção da Calma";

# |===========|
# |Exercício 6|
# |===========|
DROP DATABASE AcademiaBruxaria;
