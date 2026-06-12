USE insight_places_db;

SET GLOBAL log_bin_trust_function_creators = 1;

DROP FUNCTION IF EXISTS consultar_ficha_shinsengumi;

DELIMITER $$

CREATE FUNCTION consultar_ficha_shinsengumi(p_nome_personagem VARCHAR(255)) 
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE v_comentarios_ruins INT;
    DECLARE v_status_policial VARCHAR(100);

    -- O policial verifica se o nome é 'Katsura' (O rebelde mais procurado)
    IF p_nome_personagem LIKE '%Katsura%' THEN
        RETURN 'PROCURADO: Zura janai, Katsura da!!';
    END IF;

    -- O policial conta quantas avaliações com nota baixa (nota < 3) o personagem tem
    SELECT COUNT(*) INTO v_comentarios_ruins
    FROM avaliacoes a
    JOIN clientes c ON a.cliente_id = c.cliente_id
    WHERE c.nome = p_nome_personagem AND a.nota < 3;

    -- Critério da Shinsengumi
    IF v_comentarios_ruins > 1 THEN
        SET v_status_policial = 'SUSPEITO: Comportamento antissocial detectado.';
    ELSEIF v_comentarios_ruins = 1 THEN
        SET v_status_policial = 'OBSERVAÇÃO: Pequenos incidentes em Kabukicho.';
    ELSE
        SET v_status_policial = 'CIDADÃO: Por enquanto não causou problemas.';
    END IF;

    RETURN v_status_policial;
END$$

DELIMITER ;

SELECT 
    nome AS 'Pessoa Abordada', 
    consultar_ficha_shinsengumi(nome) AS 'Resultado da Consulta'
FROM clientes;
