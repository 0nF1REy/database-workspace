USE insight_places_db;

DROP PROCEDURE IF EXISTS dashboard_geral;

DELIMITER $$

CREATE PROCEDURE dashboard_geral()
BEGIN
    SELECT 'Proprietários' AS 'Entidade', COUNT(*) AS 'Total' FROM proprietarios
    UNION
    SELECT 'Clientes', COUNT(*) FROM clientes
    UNION
    SELECT 'Endereços', COUNT(*) FROM enderecos
    UNION
    SELECT 'Hospedagens', COUNT(*) FROM hospedagens
    UNION
    SELECT 'Aluguéis', COUNT(*) FROM alugueis
    UNION
    SELECT 'Avaliações', COUNT(*) FROM avaliacoes;
END$$

DELIMITER ;

-- Testando o Dashboard:
CALL dashboard_geral();
