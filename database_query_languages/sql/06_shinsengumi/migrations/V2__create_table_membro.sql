USE prod_ShinsengumiDB;

CREATE TABLE Membro (
    idMembro INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    patente ENUM('Capitão', 'Vice-Capitão', 'Tenente', 'Soldado', 'Recruta') NOT NULL,
    estiloCombate VARCHAR(100),
    ativo BOOLEAN DEFAULT TRUE,
    dataEntrada TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
);