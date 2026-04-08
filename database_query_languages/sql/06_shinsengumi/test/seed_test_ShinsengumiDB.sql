USE test_ShinsengumiDB;

INSERT INTO Membro (nome, patente, estiloCombate)
VALUES
('Ichigo Kurosaki', 'Capitão', 'Zanjutsu, Hakuda, Hoho, Kido, Getsuga Tensho'),
('Rukia Kuchiki', 'Capitão', 'Hakuda, Kido, Shikai (Sode no Shirayuki), Bankai (Hakka no Togame)'),
('Byakuya Kuchiki', 'Capitão', 'Shunpo, Hakuda, Kido, Senbonzakura, Senbonzakura Kageyoshi'),
('Renji Abarai', 'Vice-Capitão', 'Hakuda, Shikai (Zabimaru), Bankai (Soo Zabimaru)'),
('Toshiro Hitsugaya', 'Capitão', 'Shikai (Hyōrinmaru), Bankai (Daiguren Hyōrinmaru)'),
('Rangiku Matsumoto', 'Vice-Capitão', 'Shikai (Haineko)'),
('Kenpachi Zaraki', 'Capitão', 'Brutal Força Bruta, Shikai (Nozarashi), Bankai (não revelado)'),
('Yachiru Kusajishi', 'Vice-Capitão', 'Ainda desconhecido, mas aparenta ter grande Reiatsu'),
('Soifon', 'Capitão', 'Shunpo, Hakuda, Shikai (Suzumebachi), Bankai (Jakuho Raikoben)'),
('Kiyone Kotetsu', 'Tenente', 'Desconhecido'),
('Shuhei Hisagi', 'Vice-Capitão', 'Shikai (Kazeshini)'),
('Ikkaku Madarame', 'Tenente', 'Shikai (Hozukimaru), Bankai (Ryūmon Hōzukimaru)'),
('Orihime Inoue', 'Soldado', 'Santen Kesshun, Soten Kisshun, Shiten Kōshun');

SELECT * FROM Membro;

INSERT INTO Missao (descricao, localizacao, tipo, nivelPerigo, status, dataInicio)
VALUES
('Investigar o desaparecimento de Rukia Kuchiki', 'Distrito de Karakura', 'Inspeção', 'Médio', 'Em Andamento', '2024-01-15'),
('Capturar Hollows de nível Menos Grande na floresta', 'Floresta Rukongai', 'Captura', 'Alto', 'Aberta', '2024-02-01'),
('Proteger a cidade de Karakura contra ataques de Hollows', 'Karakura', 'Proteção', 'Médio', 'Em Andamento', '2024-02-10'),
('Infiltrar-se no Hueco Mundo para resgatar Inoue Orihime', 'Hueco Mundo', 'Infiltração', 'Crítico', 'Aberta', '2024-03-01'),
('Proteger Ichigo Kurosaki durante o treinamento com os Vizards', 'Esconderijo dos Vizards', 'Proteção', 'Alto', 'Em Andamento', '2024-03-15'),
('Capturar o traidor Sosuke Aizen', 'Soul Society', 'Captura', 'Crítico', 'Aberta', '2024-04-01'),
('Patrulhar os arredores do Seireitei', 'Seireitei', 'Patrulha', 'Baixo', 'Aberta', '2024-04-10'),
('Investigar atividades incomuns na Rukongai', 'Rukongai', 'Inspeção', 'Médio', 'Aberta', '2024-04-20'),
('Proteger a Soul Society contra o ataque dos Quincys', 'Soul Society', 'Proteção', 'Crítico', 'Em Andamento', '2024-05-01'),
('Capturar os Sternritter invasores', 'Seireitei', 'Captura', 'Alto', 'Aberta', '2024-05-05'),
('Infiltrar-se no Wandenreich para obter informações', 'Wandenreich', 'Infiltração', 'Crítico', 'Aberta', '2024-05-10'),
('Investigar a origem dos poderes dos Quincys', 'Arquivos da Soul Society', 'Inspeção', 'Médio', 'Aberta', '2024-05-15'),
('Realizar patrulha na cidade de Karakura para eliminar hollows', 'Cidade de Karakura', 'Patrulha', 'Baixo', 'Aberta', '2024-05-20');

SELECT * FROM Missao;

INSERT INTO MembroMissao (idMembro, idMissao, funcao)
VALUES
(1, 1, 'Líder'),
(2, 1, 'Suporte'),
(3, 2, 'Líder'),
(4, 2, 'Assalto'),
(5, 3, 'Investigador'),
(6, 3, 'Suporte'),
(7, 4, 'Líder'),
(9, 4, 'Assalto'),
(1, 5, 'Principal'),
(2, 5, 'Suporte'),
(3, 6, 'Investigador'),
(4, 6, 'Suporte'),
(5, 7, 'Líder');

SELECT * FROM MembroMissao;

INSERT INTO Arsenal (nome, tipo, restrita)
VALUES
('Zangetsu', 'Katana', FALSE),
('Senbonzakura', 'Katana', TRUE),
('Hyōrinmaru', 'Katana', TRUE),
('Suzumebachi', 'Katana', TRUE),
('Zabimaru', 'Katana', FALSE),
('Haineko', 'Katana', FALSE),
('Nozarashi', 'Katana', TRUE),
('Wabisuke', 'Katana', FALSE),
('Katen Kyōkotsu', 'Katana', TRUE),
('Minazuki', 'Katana', TRUE),
('Canhão de Raihoha', 'Arma de Fogo', TRUE),
('Bomba de Fumaça', 'Explosivo', FALSE),
('Ginjō’s Fullbring', 'Arma Especial', TRUE);

SELECT * FROM Arsenal;

INSERT INTO MembroArma (idMembro, idArma, dataUso)
VALUES
(1, 1, '2025-05-01'),
(2, 2, '2025-05-05'),
(5, 3, '2025-05-08'),
(4, 5, '2025-05-10'),
(7, 7, '2025-05-12'),
(9, 4, '2025-05-15'),
(6, 6, '2025-05-18'),
(1, 1, '2025-05-20'),
(2, 2, '2025-05-22'),
(5, 3, '2025-05-25'),
(1, 1, '2025-05-28'),
(4, 5, '2025-05-30'),
(7, 7, '2025-05-31');

SELECT * FROM MembroArma;

INSERT INTO RelatorioMissao (idMissao, resumo, sucesso, danosRelatados, autorRelatorio)
VALUES
(1, 'Cargueiro protegido com sucesso contra ataques de Hollows. Pequenos danos à carga.', TRUE, 'Pequenos danos à carga, alguns ferimentos leves nos guardas.', 'Rukia Kuchiki'),
(2, 'Grupo de renegados Joui capturado após intensa batalha. Algumas baixas sofridas.', FALSE, 'Baixas na Shinsengumi, danos consideráveis à infraestrutura local.', 'Byakuya Kuchiki'),
(3, 'Roubo de maionese não resolvido. Suspeitas recaem sobre Toshiro.', FALSE, 'Nenhum dano físico, mas moral da Shinsengumi abalado.', 'Soifon'),
(4, 'Transporte de suprimentos protegido com sucesso. Sem incidentes.', TRUE, 'Nenhum dano relatado.', 'Ichigo Kurosaki'),
(5, 'Fugitivos do grupo Joui recapturados. Resistência violenta.', TRUE, 'Alguns edifícios danificados durante a perseguição.', 'Renji Abarai'),
(6, 'Ataques em Yoshiwara ligados a um Hollow incomum. A investigação continua.', FALSE, 'Vários comerciantes feridos, danos em alguns estabelecimentos.', 'Toshiro Hitsugaya'),
(7, 'Infiltração bem-sucedida. Informações cruciais obtidas.', TRUE, 'Nenhum dano direto, mas risco de exposição.', 'Kenpachi Zaraki'),
(8, 'Patrulha rotineira. Sem incidentes.', TRUE, 'Nenhum dano relatado.', 'Rangiku Matsumoto'),
(9, 'Loja de oden protegida contra vandalismo. Culpado preso.', TRUE, 'Pequenos danos à loja, um cliente ferido levemente.', 'Ichigo Kurosaki'),
(10, 'Elizabeth recapturada sem grandes problemas.', TRUE, 'Nenhum dano relatado.', 'Rukia Kuchiki'),
(11, 'Fantasmas no banheiro se revelaram ilusões causadas por Kido mal direcionado.', TRUE, 'Nenhum dano real, apenas sustos.', 'Byakuya Kuchiki'),
(12, 'Infiltração no concurso de beleza revelou esquema de contrabando. Operação interrompida.', TRUE, 'Nenhum dano direto, mas alguns envolvidos presos.', 'Renji Abarai'),
(13, 'Patrulha com Okita quase resultou em destruição generalizada. Sucesso parcial.', FALSE, 'Vários edifícios e veículos destruídos, ferimentos generalizados.', 'Toshiro Hitsugaya');

SELECT * FROM RelatorioMissao;
