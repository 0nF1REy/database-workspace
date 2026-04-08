-- ====================================== --
-- 7. POPULANDO HOSPEDAGENS (Onde a confusão acontece)
-- ====================================== --
INSERT INTO hospedagens (hospedagem_id, tipo, endereco_id, proprietario_id, ativo) VALUES
('HOSP_001', 'Apartamento (Yorozuya)', 'END_001', 'PROP_001', TRUE),
('HOSP_002', 'Quarto de Luxo Yoshiwara', 'END_002', 'PROP_002', TRUE),
('HOSP_003', 'Dormitório Shinsengumi', 'END_003', 'PROP_004', TRUE),
('HOSP_004', 'Suíte Espacial', 'END_004', 'PROP_005', TRUE),
('HOSP_005', 'Abrigo de Papelão', 'END_009', 'PROP_008', TRUE),
('HOSP_006', 'Jaula Amanto', 'END_006', 'PROP_003', TRUE),
('HOSP_007', 'Oficina de Robôs', 'END_005', 'PROP_006', TRUE),
('HOSP_008', 'Dojo Yagyu', 'END_008', 'PROP_010', TRUE),
('HOSP_009', 'Quarto dos Fundos (Snack Bar)', 'END_001', 'PROP_009', TRUE),
('HOSP_010', 'Caverna de Caça', 'END_007', 'PROP_007', FALSE);