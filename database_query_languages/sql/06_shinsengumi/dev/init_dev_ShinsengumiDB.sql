# 🧾 Enunciado Geral
# Você é responsável por desenvolver o banco de dados da tropa especial "Shinsengumi", que gerencia membros, missões, armamentos e relatórios operacionais.

-- Criando o banco
CREATE DATABASE IF NOT EXISTS dev_ShinsengumiDB;
USE dev_ShinsengumiDB;

-- 👮‍♂️ Tabela: Membros da Shinsengumi
CREATE TABLE Membro (
    idMembro INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    patente ENUM('Capitão', 'Vice-Capitão', 'Tenente', 'Soldado', 'Recruta') NOT NULL,
    estiloCombate VARCHAR(100),
    ativo BOOLEAN DEFAULT TRUE,
    dataEntrada TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
    -- dataEntrada DATE DEFAULT CURRENT_DATE
);

-- 🧾 Tabela: Missões da Shinsengumi
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

-- 🔗 Tabela: Relacionamento Membros e Missões (N:N)
CREATE TABLE MembroMissao (
    idMembro INT,
    idMissao INT,
    funcao VARCHAR(50) DEFAULT 'N/A',
    FOREIGN KEY (idMembro) REFERENCES Membro(idMembro),
    FOREIGN KEY (idMissao) REFERENCES Missao(idMissao),
    PRIMARY KEY (idMembro, idMissao)
);

-- 💣 Tabela: Arsenal
CREATE TABLE Arsenal (
    idArma INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    tipo ENUM('Katana', 'Arma de Fogo', 'Explosivo', 'Arma Especial'),
    restrita BOOLEAN DEFAULT FALSE
);

-- 🔗 Tabela: Membro e Armas (controle de uso)
CREATE TABLE MembroArma (
    idMembro INT,
    idArma INT,
    dataUso DATE,
    FOREIGN KEY (idMembro) REFERENCES Membro(idMembro),
    FOREIGN KEY (idArma) REFERENCES Arsenal(idArma),
    PRIMARY KEY (idMembro, idArma, dataUso)
);

-- 🧮 Tabela: Relatórios de Missões
CREATE TABLE RelatorioMissao (
    idRelatorio INT PRIMARY KEY AUTO_INCREMENT,
    idMissao INT,
    resumo TEXT,
    sucesso BOOLEAN,
    danosRelatados TEXT,
    autorRelatorio VARCHAR(100),
    FOREIGN KEY (idMissao) REFERENCES Missao(idMissao)
);

-- VIEWs =============================================================

-- 🧭 1. VIEW: Relatório de Missões em Andamento

CREATE VIEW vw_missoes_em_andamento AS
SELECT 
    m.idMissao,
    m.descricao,
    m.localizacao,
    m.nivelPerigo,
    GROUP_CONCAT(CONCAT(mem.nome, ' (', mm.funcao, ')') SEPARATOR ', ') AS participantes
FROM Missao m
LEFT JOIN MembroMissao mm ON m.idMissao = mm.idMissao
LEFT JOIN Membro mem ON mem.idMembro = mm.idMembro
WHERE m.status = 'Em Andamento'
GROUP BY m.idMissao;

-- 💡
SELECT * FROM vw_missoes_em_andamento;

-- 🔐 2. VIEW: Armas Restritas e Quem Está Usando

CREATE OR REPLACE VIEW vw_armas_restritas_em_uso AS
SELECT 
    me.nome AS membro,
    a.nome AS arma,
    a.tipo,
    a.restrita,
    ma.dataUso
FROM Arsenal a
JOIN MembroArma ma ON a.idArma = ma.idArma
JOIN Membro me ON me.idMembro = ma.idMembro
WHERE a.restrita = TRUE;

-- 💡
SELECT * FROM vw_armas_restritas_em_uso;

-- 🔭 3. VIEW: Membros atualmente em missão

CREATE OR REPLACE VIEW vw_membros_em_missao AS
SELECT
    M.idMembro AS IdMembro,
    M.nome AS NomeMembro,
    MI.descricao AS DescricaoMissao,
    MI.status AS StatusMissao
FROM
    Membro M
INNER JOIN
    MembroMissao MM ON M.idMembro = MM.idMembro
INNER JOIN
    Missao MI ON MM.idMissao = MI.idMissao
WHERE
    MI.status = 'Em Andamento';

-- 💡
SELECT * FROM vw_membros_em_missao;

-- PROCEDUREs =============================================================

-- ⚙️ 1. PROCEDURE: Registrar Missão com Parâmetros Seguros
DELIMITER $$

CREATE PROCEDURE sp_registrar_missao (
    IN p_descricao TEXT,
    IN p_localizacao VARCHAR(100),
    IN p_tipo VARCHAR(50),
    IN p_nivelPerigo VARCHAR(10),
    IN p_dataInicio DATE
)
BEGIN
    INSERT INTO Missao (descricao, localizacao, tipo, nivelPerigo, status, dataInicio)
    VALUES (p_descricao, p_localizacao, p_tipo, p_nivelPerigo, 'Aberta', p_dataInicio);
END $$

DELIMITER ;

CALL sp_registrar_missao(
    'Interrogar comerciante suspeito de vender Amanto ilegais',
    'Distrito Comercial',
    'Inspeção',
    'Alto',
    CURDATE()
);

-- 💡
SELECT * FROM Missao ORDER BY idMissao DESC;

-- ⚙️ 2. PROCEDURE: Promover um Membro

DELIMITER $$

CREATE PROCEDURE sp_promover_membro (
    IN p_idMembro INT,
    IN p_novaPatente VARCHAR(50)
)
BEGIN
    UPDATE Membro
    SET patente = p_novaPatente
    WHERE idMembro = p_idMembro;
END $$

DELIMITER ;

CALL sp_promover_membro(5, 'Tenente');

-- 💡
SELECT * FROM Membro WHERE idMembro = 5;

-- ⚙️ 3. PROCEDURE: Atribuir Arma a um Membro
DELIMITER $$

CREATE PROCEDURE sp_atribuir_arma (
    IN p_idMembro INT,
    IN p_idArma INT
)
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM MembroArma 
        WHERE idMembro = p_idMembro AND idArma = p_idArma
    ) THEN
        INSERT INTO MembroArma (idMembro, idArma, dataUso)
        VALUES (p_idMembro, p_idArma, CURDATE());
    END IF;
END $$

DELIMITER ;

CALL sp_atribuir_arma(3, 2); -- Okita recebe a bazuca, se ainda não tiver

-- 💡
SELECT * FROM MembroArma WHERE idMembro = 3;

-- 🪖 4. PROCEDURE: Designar Membro a Missão
DELIMITER $$

CREATE PROCEDURE sp_designar_missao (
    IN p_idMembro INT,
    IN p_idMissao INT,
    IN p_funcao VARCHAR(50)
)
BEGIN
    UPDATE MembroMissao
    SET funcao = IF(p_funcao IS NULL OR p_funcao = '', 'N/A', p_funcao)
    WHERE idMembro = p_idMembro AND idMissao = p_idMissao;

    IF ROW_COUNT() = 0 THEN
        INSERT INTO MembroMissao (idMembro, idMissao, funcao)
        VALUES (p_idMembro, p_idMissao, 
                IF(p_funcao IS NULL OR p_funcao = '', 'N/A', p_funcao));
    END IF;
END $$

DELIMITER ;

CALL sp_designar_missao(5, 2, 'Sniper');

-- 💡
SELECT * FROM MembroMissao WHERE idMembro IN (5);

-- ❌ 5. PROCEDURE: Expulsar um Membro (Demissão)

DELIMITER $$

CREATE PROCEDURE sp_expulsar_membro (
    IN p_idMembro INT
)
BEGIN
    -- Remove o vínculo com armas
    DELETE FROM MembroArma WHERE idMembro = p_idMembro;

    -- Remove o vínculo com missões
    DELETE FROM MembroMissao WHERE idMembro = p_idMembro;

    -- Remove o membro em si
    DELETE FROM Membro WHERE idMembro = p_idMembro;
END $$

DELIMITER ;

CALL sp_expulsar_membro(5); -- Expulsa o membro com id 5

-- TRIGGERs =============================================================

-- ❌ 1. TRIGGER: Restrição de armas para o recruta

DELIMITER $$

CREATE TRIGGER impedir_armas_restritas_recruta
BEFORE INSERT ON MembroArma
FOR EACH ROW
BEGIN
    IF EXISTS (SELECT 1 FROM Arsenal WHERE idArma = NEW.idArma AND restrita = TRUE) THEN
        IF (SELECT patente FROM Membro WHERE idMembro = NEW.idMembro) = 'Recruta' THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Recrutas não podem usar armas restritas!';
        END IF;
    END IF;
END $$

DELIMITER ;

-- 💡
INSERT INTO MembroArma (idMembro, idArma, dataUso)
VALUES (13, 2, CURDATE());

-- VIEWs + PROCEDUREs =============================================================

-- 🔭 1. VIEW + PROCEDURE: Total de missões por membro

CREATE VIEW vw_participacao_missoes AS
SELECT 
    m.idMembro,
    m.nome,
    COUNT(mm.idMissao) AS totalMissoes
FROM 
    Membro m
LEFT JOIN 
    MembroMissao mm ON m.idMembro = mm.idMembro
GROUP BY 
    m.idMembro, m.nome;

    DELIMITER $$

CREATE PROCEDURE sp_listar_participacoes ()
BEGIN
    SELECT * FROM vw_participacao_missoes ORDER BY totalMissoes DESC;
END $$

DELIMITER ;

CALL sp_listar_participacoes();