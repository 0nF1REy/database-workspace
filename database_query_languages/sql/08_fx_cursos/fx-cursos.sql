-- |==============================================================|
-- | 1. INSERT INTO tabela (colunas) VALUES (dados);              |
-- | 2. UPDATE tabela SET coluna = novo_dado WHERE coluna = valor;|
-- | 3. DELETE FROM tabela WHERE coluna = valor;                  |
-- |==============================================================|

DROP DATABASE IF EXISTS fxcursos;

CREATE DATABASE fxcursos;

USE fxcursos;

/* COMANDOS DDL */

-- Tabela de aluno
CREATE TABLE aluno (
	idAluno INT PRIMARY KEY AUTO_INCREMENT,
    nomeAluno VARCHAR(50) NOT NULL,
    cpf CHAR(11) UNIQUE NOT NULL
);

-- Tabela de curso
CREATE TABLE curso (
	idCurso INT PRIMARY KEY AUTO_INCREMENT,
    nomeCurso VARCHAR(30) NOT NULL,
    duracaohoras INT NOT NULL
);

-- Tabela de matricula
CREATE TABLE matricula (
	idMatricula INT PRIMARY KEY AUTO_INCREMENT,
    dataMatricula DATE NOT NULL,
    idAluno INT,
    idCurso INT,
    FOREIGN KEY (idAluno) REFERENCES aluno(idAluno),
	FOREIGN KEY (idCurso) REFERENCES curso(idCurso)
);

/* COMANDOS DML */

INSERT INTO aluno (nomeAluno, cpf) VALUES
('Mariana Gomes', '44455566677'),
('Felipe Andrade', '66655544433'),
('Carla Silva', '22233344455'),
('Pedro Carvalho', '88899900011'),
('Laura Almeida', '11133355577'),
('Ana Beatriz', '77788899900'),
('Thiago Souza', '33311122266'),
('Paula Fernandes', '99988877766'),
('Luiz Alves','12345678900'),
('Julia Siqueira','23409823544'),
('Iris Oliveira','09873892920'),
('Elias Pereira','01287609811');


INSERT INTO curso (nomeCurso, duracaohoras) VALUES
('Curso de JavaScript', 65),
('Curso de PHP Avançado', 75),
('Curso de Redes de Computadores', 45),
('Curso de Machine Learning', 80),
('Curso de Excel para Negócios', 40),
('Curso de Design Gráfico', 70),
('Curso de Java para Web', 120),
('Curso de Estrutura de Dados', 50),
('Curso de Photoshop Avançado', 90),
('Curso de After Effects', 120),
('Curso de Google Gemini', 60),
('Curso de Cloud com MS Azure', 50),
('Curso de Python Básico', 60),
('Curso de MySQL', 50);


INSERT INTO matricula (dataMatricula, idAluno, idCurso) VALUES
('2025-01-10', 2, 3),
('2025-01-20', 4, 4),
('2025-01-25', 5, 5),
('2025-02-01', 6, 6),
('2025-02-05', 2, 7),
('2025-02-10', 8, 8),
('2025-02-15', 9, 1),
('2025-02-20', 10, 2),
('2025-03-01', 1, 3),
('2025-03-05', 2, 4),
('2025-03-10', 11, 5),
('2025-03-15', 4, 6),
('2025-03-20', 5, 7),
('2025-03-25', 6, 8),
('2025-03-30', 9, 1),
('2025-04-05', 8, 2),
('2025-04-10', 9, 3),
('2025-04-15', 10, 4),
('2025-04-20', 1, 5),
('2025-04-25', 2, 6),
('2025-05-01', 11, 7),
('2025-05-05', 4, 8),
('2025-05-10', 5, 1),
('2025-05-15', 6, 2);

/* COMANDOS DQL */

-- |===========|
-- |Exercício 1| Mostra todas as colunas e registros da tabela aluno 
-- |===========|
SELECT * FROM aluno;

-- |===========|
-- |Exercício 2| Mostrar todas as colunas e registros da tabela curso
-- |===========|
SELECT * FROM curso;

-- |===========|
-- |Exercício 3| Mostrar a tabela matricula
-- |===========|
SELECT * FROM matricula;

-- |===========|
-- |Exercício 4| Qual o nome dos alunos que estão matriculados em algum curso ? 
-- |===========|
SELECT *
FROM aluno a
INNER JOIN matricula m
ON m.idAluno = a.idAluno; 

--

SELECT DISTINCT a.nomeAluno /* DISTINCT = Evita repetição */
FROM aluno a /* TABELA 1 DE ORIGEM */
INNER JOIN matricula m /* ALIAS = É abreviação/apelido */
ON m.idAluno = a.idAluno; /* ON = LIGAÇÃO ENTRE AS TABELAS, Tem que citar a chave estrangeira */

-- |===========|
-- |Exercício 5| Qual o nome dos cursos que possuem algum aluno matriculado?
-- |===========|
SELECT *
FROM curso c
INNER JOIN matricula m
ON c.idCurso = m.idCurso;

--

SELECT DISTINCT c.nomeCurso
FROM curso c
INNER JOIN matricula m
ON c.idCurso = m.idCurso;

-- |===========|
-- |Exercício 6| Qual os nomes dos alunos e dos cursos em que possuem matricula ativa?
-- |===========|

/*
    Aluno vem primeiro
    Matricula vem depois
    Curso vem depois
*/

SELECT *
FROM aluno a
INNER JOIN matricula m
ON a.idAluno = m.idAluno
INNER JOIN curso c
ON c.idCurso = m.idCurso;

--

SELECT a.nomeAluno, c.nomeCurso
FROM aluno a
INNER JOIN matricula m
ON a.idAluno = m.idAluno
INNER JOIN curso c
ON c.idCurso = m.idCurso;

-- |===========|
-- |Exercício 7| Mostrar o nome do aluno e curso, apenas de quem faz curso de java para
-- |===========| web
SELECT a.nomeAluno as Aluno, c.nomeCurso as Curso
FROM aluno a
INNER JOIN matricula m
ON a.idAluno = m.idAluno
INNER JOIN curso c
ON c.idCurso = m.idCurso
WHERE c.nomeCurso = 'Curso de Java para Web';

-- |===========|
-- |Exercício 8| Mostrar o nome do aluno, nome do curso, data da matricula,
-- |===========| das matriculas feitas em março.
SELECT a.nomeAluno as Aluno, c.nomeCurso as Curso, m.dataMatricula
FROM aluno a
INNER JOIN matricula m
ON a.idAluno = m.idAluno
INNER JOIN curso c
ON c.idCurso = m.idCurso
WHERE m.dataMatricula BETWEEN '2025-03-01' AND '2025-03-31';

-- |===========|
-- |Exercício 9| Quais alunos não tem matrícula ativa
-- |===========|
SELECT a.nomeAluno
FROM aluno a
LEFT JOIN matricula m ON a.idAluno = m.idAluno
WHERE m.dataMatricula IS NULL;

-- |===========|
-- |Exercício 10| Quais os cursos que estão sem matriculas
-- |===========|
SELECT c.nomeCurso
FROM curso c
LEFT JOIN matricula m ON c.idCurso = m.idCurso
WHERE m.dataMatricula IS NULL;