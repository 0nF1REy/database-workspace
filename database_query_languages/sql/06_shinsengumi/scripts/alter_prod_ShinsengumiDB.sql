USE dev_ShinsengumiDB;
USE prod_ShinsengumiDB;
USE test_ShinsengumiDB

-- ALTERs =============================================================
ALTER TABLE MembroMissao MODIFY COLUMN funcao VARCHAR(50) DEFAULT 'N/A';

ALTER TABLE MembroMissao
MODIFY COLUMN funcao VARCHAR(50) DEFAULT 'N/A';

-- UPDATEs =============================================================
UPDATE MembroMissao SET funcao = 'N/A' WHERE idMembro = 5 AND funcao = '';

-- DROPs =============================================================
DROP VIEW IF EXISTS vw_membros_em_missao;
DROP PROCEDURE IF EXISTS sp_expulsar_membro;
DROP TRIGGER IF EXISTS impedir_armas_restritas_recruta;
DROP DATABASE prod_ShinsengumiDB;