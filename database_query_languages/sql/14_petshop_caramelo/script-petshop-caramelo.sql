CREATE DATABASE petshop_caramelo;
USE petshop_caramelo;

CREATE TABLE Clientes (
    idCliente INT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    telefone CHAR(11)
);

CREATE TABLE Vendedores (
    idVendedor INT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE FormasPagamento (
    idFormaPgto INT PRIMARY KEY,
    descricao VARCHAR(45) NOT NULL
);

CREATE TABLE Pets (
    idPet INT PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    raca VARCHAR(30),
    especie VARCHAR(45),
    idCliente INT,
    FOREIGN KEY (idCliente) REFERENCES Clientes(idCliente)
);

CREATE TABLE Servicos (
    idServico INT PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,
    descricao VARCHAR(80),
    valor DECIMAL(7, 2) NOT NULL
);

CREATE TABLE Produtos (
    idProduto INT PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,
    descricao VARCHAR(100),
    quantidade INT NOT NULL,
    valor DECIMAL(5, 2) NOT NULL
);

CREATE TABLE Vendas (
    idVenda INT PRIMARY KEY,
    valor DECIMAL(7, 2) NOT NULL,
    data DATE NOT NULL,
    idCliente INT,
    idVendedor INT,
    idFormaPgto INT,
    FOREIGN KEY (idCliente) REFERENCES Clientes(idCliente),
    FOREIGN KEY (idVendedor) REFERENCES Vendedores(idVendedor),
    FOREIGN KEY (idFormaPgto) REFERENCES FormasPagamento(idFormaPgto)
);

CREATE TABLE VendasServicos (
    idVenda_Servico INT PRIMARY KEY,
    idVenda INT,
    idServico INT,
    idPet INT,
    FOREIGN KEY (idVenda) REFERENCES Vendas(idVenda),
    FOREIGN KEY (idServico) REFERENCES Servicos(idServico),
    FOREIGN KEY (idPet) REFERENCES Pets(idPet)
);

CREATE TABLE VendasProdutos (
    idVenda_Produto INT PRIMARY KEY,
    idVenda INT,
    idProduto INT,
    FOREIGN KEY (idVenda) REFERENCES Vendas(idVenda),
    FOREIGN KEY (idProduto) REFERENCES Produtos(idProduto)
);