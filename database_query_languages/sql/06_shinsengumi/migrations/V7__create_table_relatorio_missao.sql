USE prod_ShinsengumiDB;

CREATE TABLE RelatorioMissao (
    idRelatorio INT PRIMARY KEY AUTO_INCREMENT,
    idMissao INT,
    resumo TEXT,
    sucesso BOOLEAN,
    danosRelatados TEXT,
    autorRelatorio VARCHAR(100),
    FOREIGN KEY (idMissao) REFERENCES Missao(idMissao)
);