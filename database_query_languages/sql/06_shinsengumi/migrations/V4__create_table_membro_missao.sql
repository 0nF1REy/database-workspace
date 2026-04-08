USE prod_ShinsengumiDB;

CREATE TABLE MembroMissao (
    idMembro INT,
    idMissao INT,
    funcao VARCHAR(50) DEFAULT 'N/A',
    FOREIGN KEY (idMembro) REFERENCES Membro(idMembro),
    FOREIGN KEY (idMissao) REFERENCES Missao(idMissao),
    PRIMARY KEY (idMembro, idMissao)
);