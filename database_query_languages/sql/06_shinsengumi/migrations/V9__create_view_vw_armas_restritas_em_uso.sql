USE prod_ShinsengumiDB;

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