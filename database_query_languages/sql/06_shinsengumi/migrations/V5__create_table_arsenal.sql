USE prod_ShinsengumiDB;

CREATE TABLE Arsenal (
    idArma INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    tipo ENUM('Katana', 'Arma de Fogo', 'Explosivo', 'Arma Especial'),
    restrita BOOLEAN DEFAULT FALSE
);