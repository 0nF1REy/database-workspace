-- |==============================================================|
-- | 1. INSERT INTO tabela (colunas) VALUES (dados);              |
-- | 2. UPDATE tabela SET coluna = novo_dado WHERE coluna = valor;|
-- | 3. DELETE FROM tabela WHERE coluna = valor;                  |
-- |==============================================================|

DROP DATABASE IF EXISTS EscolaOnline;

-- CRIAR BANCO DE DADOS
CREATE DATABASE EscolaOnline;

USE EscolaOnline;

-- TABELA DE CATEGORIAS DE CURSOS
CREATE TABLE CategoriaCurso (
    idCategoria INT PRIMARY KEY AUTO_INCREMENT,
    nomeCategoria VARCHAR(50) NOT NULL
);

-- TABELA DE CURSOS
CREATE TABLE Curso (
    idCurso INT PRIMARY KEY AUTO_INCREMENT,
    nomeCurso VARCHAR(100) NOT NULL,
    cargaHoraria INT NOT NULL,
    preco DECIMAL(8,2) NOT NULL,
    idCategoria INT NOT NULL,
    FOREIGN KEY (idCategoria) REFERENCES CategoriaCurso(idCategoria)
);

-- TABELA DE ALUNOS
CREATE TABLE Aluno (
    idAluno INT PRIMARY KEY AUTO_INCREMENT,
    nomeAluno VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    dataNascimento DATE NOT NULL
);

-- TABELA DE MATRÍCULAS
CREATE TABLE Matricula (
    idMatricula INT PRIMARY KEY AUTO_INCREMENT,
    idAluno INT NOT NULL,
    idCurso INT NOT NULL,
    dataMatricula DATE NOT NULL,
	status ENUM('Ativa', 'Concluída', 'Cancelada'),
    FOREIGN KEY (idAluno) REFERENCES Aluno(idAluno),
    FOREIGN KEY (idCurso) REFERENCES Curso(idCurso)
);

-- DQL
INSERT INTO CategoriaCurso (nomeCategoria) VALUES
('Programação'),
('Design'),
('Marketing Digital'),
('Idiomas'),
('Negócios');

INSERT INTO Curso (nomeCurso, cargaHoraria, preco, idCategoria) VALUES
('JavaScript Essencial', 35, 259.90, 1),
('Desenvolvimento Web Responsivo', 30, 229.90, 1),
('Lógica de Programação', 20, 199.90, 1),
('Banco de Dados MySQL', 40, 299.90, 1),
('Adobe Illustrator Completo', 25, 279.90, 2),
('Edição de Vídeo com Premiere', 30, 299.90, 2),
('Design de Interfaces (UI/UX)', 40, 349.90, 2),
('Canva para Redes Sociais', 15, 129.90, 2),
('Google Ads para Iniciantes', 20, 199.90, 3),
('Copywriting Persuasivo', 18, 149.90, 3),
('Gestão de Mídias Sociais', 22, 189.90, 3),
('SEO na Prática', 25, 209.90, 3),
('Inglês para Profissionais de TI', 30, 249.90, 4),
('Francês Básico', 25, 199.90, 4),
('Espanhol para Viagens', 20, 179.90, 4),
('Alemão do Zero', 30, 229.90, 4),
('Administração de Pequenos Negócios', 30, 219.90, 5),
('Finanças Pessoais', 18, 129.90, 5),
('Empreendedorismo Digital', 25, 199.90, 5),
('Atendimento ao Cliente Online', 20, 159.90, 5);

INSERT INTO Aluno (nomeAluno, email, dataNascimento) VALUES
('Lucas Ferreira', 'lucas.ferreira@gmail.com', '2000-05-20'),
('Mariana Souza', 'mariana.souza@hotmail.com', '1998-11-10'),
('Carlos Mendes', 'carlos.mendes@yahoo.com', '2002-08-15'),
('Beatriz Lima', 'beatriz.lima@gmail.com', '1999-03-25'),
('Felipe Santos', 'felipe.santos@hotmail.com', '2001-07-12'),
('Ana Paula Ribeiro', 'ana.ribeiro@gmail.com', '1997-12-03'),
('João Pedro Silva', 'joao.silva@yahoo.com', '2003-09-28'),
('Larissa Martins', 'larissa.martins@gmail.com', '2000-02-14'),
('Gabriel Oliveira', 'gabriel.oliveira@hotmail.com', '1996-05-07'),
('Camila Costa', 'camila.costa@gmail.com', '2002-10-19'),
('Ricardo Almeida', 'ricardo.almeida@yahoo.com', '1995-11-22'),
('Juliana Barros', 'juliana.barros@gmail.com', '1998-06-30');

INSERT INTO Matricula (idAluno, idCurso, dataMatricula, status) VALUES
(1, 1, '2024-04-10', 'Ativa'),
(1, 4, '2024-05-01', 'Ativa'),
(2, 2, '2024-05-05', 'Ativa'),
(3, 5, '2024-04-20', 'Concluída'),
(4, 3, '2024-04-15', 'Ativa'),
(5, 6, '2024-05-02', 'Ativa'),
(6, 7, '2024-03-18', 'Concluída'),
(7, 8, '2024-04-25', 'Ativa'),
(8, 9, '2024-05-04', 'Cancelada'),
(9, 10, '2024-04-22', 'Ativa'),
(10, 11, '2024-05-06', 'Ativa'),
(11, 12, '2024-04-28', 'Concluída'),
(12, 13, '2024-05-01', 'Ativa'),
(1, 14, '2024-04-10', 'Ativa'),
(2, 15, '2024-05-02', 'Ativa'),
(3, 16, '2024-05-04', 'Ativa'),
(4, 17, '2024-04-30', 'Ativa'),
(5, 18, '2024-05-03', 'Concluída'),
(6, 19, '2024-04-27', 'Ativa'),
(7, 20, '2024-05-01', 'Ativa');

-- COMANDOS DDL

-- |===========|
-- |Exercício 1| Mostrar todos os campos da tabela de cursos com carga horária acima de 30 horas. 
-- |===========|
SELECT * FROM Curso WHERE cargaHoraria > 30;

-- |===========|
-- |Exercício 2| Mostrar o nome e o preço dos cursos com valor entre R$150 e R$250. 
-- |===========|
SELECT nomeCurso, preco FROM Curso WHERE preco BETWEEN 150 AND 250;

-- |===========|
-- |Exercício 3| Listar os nomes de cursos que contenham a palavra 'Digital'.
-- |===========|
SELECT nomeCurso FROM Curso WHERE nomeCurso LIKE '%Digital%';

-- |===========|
-- |Exercício 4| Mostrar o nome e a carga horária dos cursos ordenados pela carga horária de forma decrescente. 
-- |===========|
SELECT nomeCurso, cargaHoraria FROM Curso ORDER BY cargaHoraria DESC;

-- |===========|
-- |Exercício 5| Exibir os 5 cursos mais baratos.
-- |===========|
SELECT nomeCurso, preco FROM Curso ORDER BY preco ASC LIMIT 5; 

-- |===========|
-- |Exercício 6| Mostrar os cursos a partir do 6º mais barato. 
-- |===========|
SELECT nomeCurso, preco FROM Curso ORDER BY preco ASC LIMIT 20 OFFSET 5;

-- |===========|
-- |Exercício 7| Exibir apenas os nomes diferentes das categorias cadastradas.  
-- |===========|
SELECT * FROM CategoriaCurso;

-- |===========|
-- |Exercício 8| Mostrar a quantidade total de alunos cadastrados. 
-- |===========|
SELECT count(*) FROM Aluno; 

-- |===========|
-- |Exercício 9| Mostrar o valor médio dos preços dos cursos. 
-- |===========|
SELECT ROUND(AVG(preco),2) AS media FROM Curso;

-- |===========|
-- |Exercício 10| Exibir a soma total dos valores de todos os cursos cadastrados. 
-- |===========|
SELECT SUM(preco) FROM Curso;

-- |===========|
-- |Exercício 11| Mostrar os cursos cujo nome começa com a letra 'A'.
-- |===========|
SELECT nomeCurso FROM Curso WHERE nomeCurso LIKE 'a%';

-- |===========|
-- |Exercício 12| Listar os alunos que nasceram entre 1998 e 2002. 
-- |===========|
SELECT nomeAluno,dataNascimento FROM Aluno WHERE dataNascimento BETWEEN '1998-01-01' AND '2002-12-31';

-- |===========|
-- |Exercício 13| Listar os nomes e e-mails dos alunos com e-mail do Gmail.
-- |===========|
SELECT nomeAluno,email FROM Aluno WHERE email LIKE '%@gmail%';

-- |===========|
-- |Exercício 14| Mostrar os nomes dos cursos com mais de 25 horas de carga e preço abaixo de R$250. 
-- |===========|
SELECT nomeCurso,cargaHoraria,preco FROM Curso WHERE cargaHoraria = 25 AND preco <= 250;

-- |===========|
-- |Exercício 15| Listar os nomes e status das matrículas realizadas no mês de maio de 2024. 
-- |===========|
SELECT a.nomeAluno, m.dataMatricula, m.status
FROM Matricula m
JOIN Aluno a ON m.idAluno = a.idAluno
WHERE m.dataMatricula BETWEEN '2024-05-01' AND '2024-05-31';
