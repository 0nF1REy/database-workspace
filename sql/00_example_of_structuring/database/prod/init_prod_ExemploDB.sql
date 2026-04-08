-- *******************************************************
-- Script: init_prod_ExemploDB.sql
-- Descrição: Este script cria o banco de dados 'prod_ExemploDB'
-- e define as tabelas essenciais para o sistema, incluindo
-- dados como usuários, produtos, e transações.
-- *******************************************************

CREATE DATABASE IF NOT EXISTS prod_ExemploDB;
USE prod_ExemploDB;

-- Criação da tabela de Usuários
CREATE TABLE Usuario (
    idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    criadoEm TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Criação da tabela de Produtos
CREATE TABLE Produto (
    idProduto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10, 2) NOT NULL,
    estoque INT NOT NULL
);

-- Criação da tabela de Transações
CREATE TABLE Transacao (
    idTransacao INT PRIMARY KEY AUTO_INCREMENT,
    idUsuario INT,
    idProduto INT,
    quantidade INT NOT NULL,
    data TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario),
    FOREIGN KEY (idProduto) REFERENCES Produto(idProduto)
);
