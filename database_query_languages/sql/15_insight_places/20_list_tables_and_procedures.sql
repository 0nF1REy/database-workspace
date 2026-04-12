-- Une tabelas e procedures com simulação de FULL OUTER JOIN
-- Mostra todas as linhas, indicando claramente quando um lado não existe
SELECT
    CASE
        WHEN t.rn IS NULL THEN '(sem tabela)'
        ELSE t.TABLE_NAME
    END AS 'tabela',
    CASE
        WHEN r.rn IS NULL THEN '(sem procedure)'
        ELSE r.ROUTINE_NAME
    END AS 'procedure'
FROM
    (
        SELECT
            TABLE_NAME,
            ROW_NUMBER() OVER (
                ORDER BY
                    TABLE_NAME
            ) AS rn
        FROM
            INFORMATION_SCHEMA.TABLES
        WHERE
            TABLE_SCHEMA = DATABASE ()
    ) t
    LEFT JOIN (
        SELECT
            ROUTINE_NAME,
            ROW_NUMBER() OVER (
                ORDER BY
                    ROUTINE_NAME
            ) AS rn
        FROM
            INFORMATION_SCHEMA.ROUTINES
        WHERE
            ROUTINE_SCHEMA = DATABASE ()
            AND ROUTINE_TYPE = 'PROCEDURE'
    ) r ON t.rn = r.rn
UNION ALL
SELECT
    CASE
        WHEN t.rn IS NULL THEN '(sem tabela)'
        ELSE t.TABLE_NAME
    END AS 'tabela',
    CASE
        WHEN r.rn IS NULL THEN '(sem procedure)'
        ELSE r.ROUTINE_NAME
    END AS 'procedure'
FROM
    (
        SELECT
            ROUTINE_NAME,
            ROW_NUMBER() OVER (
                ORDER BY
                    ROUTINE_NAME
            ) AS rn
        FROM
            INFORMATION_SCHEMA.ROUTINES
        WHERE
            ROUTINE_SCHEMA = DATABASE ()
            AND ROUTINE_TYPE = 'PROCEDURE'
    ) r
    LEFT JOIN (
        SELECT
            TABLE_NAME,
            ROW_NUMBER() OVER (
                ORDER BY
                    TABLE_NAME
            ) AS rn
        FROM
            INFORMATION_SCHEMA.TABLES
        WHERE
            TABLE_SCHEMA = DATABASE ()
    ) t ON r.rn = t.rn
WHERE
    t.rn IS NULL;