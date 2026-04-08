USE prod_ShinsengumiDB;

DELIMITER $$

CREATE PROCEDURE sp_listar_participacoes ()
BEGIN
    SELECT * FROM vw_participacao_missoes ORDER BY totalMissoes DESC;
END $$

DELIMITER ;