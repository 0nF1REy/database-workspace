CREATE DATABASE empresa_woop;

-- Cria os papéis (roles)
CREATE ROLE IF NOT EXISTS 'desenvolvimento', 'gerente', 'venda';

SELECT user, host FROM mysql.user 
WHERE user IN ('desenvolvimento', 'gerente', 'venda');

CREATE USER 'diego'@'localhost' IDENTIFIED BY 's3nh@';
CREATE USER 'marcia'@'localhost' IDENTIFIED BY 'abc1234';
CREATE USER 'joana'@'localhost' IDENTIFIED BY 'user123';

SELECT user, host FROM mysql.user 
WHERE user IN ('diego', 'marcia', 'joana');

-- Associa os papéis aos usuários correspondentes
GRANT desenvolvimento TO diego@localhost;
GRANT gerente TO marcia@localhost;
GRANT venda TO joana@localhost;

-- Consulta as relações entre usuários e papéis
SELECT from_user AS usuario, to_user AS role 
FROM mysql.role_edges;

-- Mostra as permissões dos papéis
SHOW GRANTS FOR 'desenvolvimento';
SHOW GRANTS FOR 'gerente';
SHOW GRANTS FOR 'venda';


-- Lista todas as relações entre papéis e usuários
SELECT * FROM mysql.role_edges;

-- Lista papéis e seus usuários ordenados pelo nome do papel
SELECT to_user AS role_name, from_user AS user_name 
FROM mysql.role_edges 
ORDER BY to_user;

GRANT ALL PRIVILEGES ON *.* TO 'desenvolvimento';
GRANT SELECT, INSERT, UPDATE, DELETE ON empresa_woop.* TO 'gerente';
GRANT SELECT ON empresa_woop.* TO 'venda';

GRANT ALL PRIVILEGES ON *.* TO 'desenvolvimento';
GRANT SELECT ON empresa_woop.* TO 'gerente';
GRANT SELECT ON empresa_woop.* TO 'venda';

DROP USER 'marcia'@'localhost';

DROP ROLE 'gerente';
