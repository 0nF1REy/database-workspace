USE prod_ShinsengumiDB;

INSERT INTO Membro (nome, patente, estiloCombate)
VALUES
('Kondou Isao', 'Capitão', 'Jūjutsu'),
('Hijikata Toushirou', 'Vice-Capitão', 'Kenjutsu e Tática'),
('Okita Sougo', 'Tenente', 'Espada e Explosivos'),
('Yamazaki Sagaru', 'Soldado', 'Vigilância e Stealth'),
('Saitou Shimaru', 'Tenente', 'Iaijutsu'),
('Ito Kamotarou', 'Tenente', 'Política e Manipulação'),
('Inoue Genzaburou', 'Soldado', 'Defesa e Tática'),
('Harada Sanosuke', 'Soldado', 'Lança'),
('Toudou Heisuke', 'Tenente', 'Naginata'),
('Kurogoma Katsuo', 'Recruta', 'Técnicas de Disfarce'),
('Nagakura Shinpachi', 'Soldado', 'Kenjutsu'),
('Kawakami Bansai', 'Soldado', 'Música e Espionagem'),
('Hasegawa Taizou', 'Recruta', 'Sobrevivência Urbana');

INSERT INTO Missao (descricao, localizacao, tipo, nivelPerigo, status, dataInicio)
VALUES
('Proteger o cargueiro Amanto em Kabukicho', 'Kabukicho', 'Proteção', 'Médio', 'Em Andamento', '2025-04-29'),
('Capturar grupo de renegados Joui', 'Distrito Exterior', 'Captura', 'Alto', 'Aberta', '2025-05-01'),
('Investigar roubo de maionese no depósito da Shinsengumi', 'Quartel Shinsengumi', 'Inspeção', 'Crítico', 'Aberta', '2025-05-01'),
('Proteger o transporte de suprimentos para o quartel', 'Edo', 'Proteção', 'Médio', 'Em Andamento', '2025-05-03'),
('Capturar fugitivos do grupo Joui em Edo', 'Distrito de Edo', 'Captura', 'Alto', 'Aberta', '2025-05-04'),
('Investigar ataques misteriosos a comerciantes em Yoshiwara', 'Yoshiwara', 'Inspeção', 'Alto', 'Aberta', '2025-05-05'),
('Infiltrar-se na base inimiga em Kabukicho', 'Kabukicho', 'Infiltração', 'Crítico', 'Aberta', '2025-05-06'),
('Patrulha na área de Shimabara', 'Shimabara', 'Patrulha', 'Baixo', 'Aberta', '2025-05-07'),
('Proteger loja de oden de ataques noturnos', 'Mercado Central', 'Proteção', 'Médio', 'Aberta', '2025-05-08'),
('Capturar Elizabeth após fuga do controle da Katsura', 'Distrito de Gokumon', 'Captura', 'Baixo', 'Aberta', '2025-05-09'),
('Inspecionar queixas sobre fantasmas no banheiro do quartel', 'Quartel Shinsengumi', 'Inspeção', 'Médio', 'Aberta', '2025-05-10'),
('Infiltrar-se disfarçado em um concurso de beleza suspeito', 'Kabukicho', 'Infiltração', 'Alto', 'Aberta', '2025-05-11'),
('Realizar patrulha noturna com Okita sem causar explosões', 'Centro de Edo', 'Patrulha', 'Alto', 'Aberta', '2025-05-12');

INSERT INTO MembroMissao (idMembro, idMissao, funcao)
VALUES
(1, 1, 'Líder'),
(2, 1, 'Tático'),
(3, 2, 'Explosivos'),
(2, 3, 'Investigador');

INSERT INTO MembroMissao (idMembro, idMissao)
VALUES
(5, 2);

INSERT INTO Arsenal (nome, tipo, restrita)
VALUES
('Katana do Hijikata', 'Katana', FALSE),
('Bazuca de Okita', 'Explosivo', TRUE),
('Maionese Tática', 'Arma Especial', TRUE),
('Binóculo da Vigilância', 'Arma Especial', FALSE),
('Katana Comum', 'Katana', FALSE),
('Espada de Treinamento de Shinpachi', 'Katana', FALSE),
('Shamisen de Bansai', 'Arma Especial', TRUE),
('Kit de Disfarce do Yamazaki', 'Arma Especial', FALSE),
('Granada Fumacê do Okita', 'Explosivo', TRUE),
('Pistola de Patrulha', 'Arma de Fogo', TRUE),
('Katana Cerimonial', 'Katana', FALSE),
('Maionese Reserva', 'Arma Especial', TRUE),
('Revólver de Hasegawa', 'Arma de Fogo', FALSE);

INSERT INTO MembroArma (idMembro, idArma, dataUso)
VALUES 
(3, 2, '2025-05-02'),
(2, 3, '2025-05-03');

INSERT INTO RelatorioMissao (idMissao, resumo, sucesso, danosRelatados, autorRelatorio)
VALUES
(1, 'Missão em andamento. Amanto protegidos até o momento.', NULL, 'Nenhum ainda', 'Kondou Isao'),
(3, 'Investigação inconclusiva. Frasco de maionese desaparecido.', FALSE, 'Um armário destruído por raiva.', 'Hijikata Toushirou');

