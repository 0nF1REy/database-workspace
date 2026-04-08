USE prod_ShinsengumiDB;

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