USE prod_ShinsengumiDB;

CREATE TABLE MembroArma (
    idMembro INT,
    idArma INT,
    dataUso DATE,
    FOREIGN KEY (idMembro) REFERENCES Membro(idMembro),
    FOREIGN KEY (idArma) REFERENCES Arsenal(idArma),
    PRIMARY KEY (idMembro, idArma, dataUso)
);