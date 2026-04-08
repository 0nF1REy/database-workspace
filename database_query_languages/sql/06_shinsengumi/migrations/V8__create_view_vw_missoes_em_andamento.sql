USE prod_ShinsengumiDB;

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