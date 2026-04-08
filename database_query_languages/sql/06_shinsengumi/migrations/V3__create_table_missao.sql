USE prod_ShinsengumiDB;

CREATE TABLE Missao (
    idMissao INT PRIMARY KEY AUTO_INCREMENT,
    descricao TEXT NOT NULL,
    localizacao VARCHAR(100),
    tipo ENUM('Patrulha', 'Captura', 'Proteção', 'Infiltração', 'Inspeção'),
    nivelPerigo ENUM('Baixo', 'Médio', 'Alto', 'Crítico'),
    status ENUM('Aberta', 'Em Andamento', 'Concluída', 'Cancelada') DEFAULT 'Aberta',
    dataInicio DATE,
    dataConclusao DATE
);