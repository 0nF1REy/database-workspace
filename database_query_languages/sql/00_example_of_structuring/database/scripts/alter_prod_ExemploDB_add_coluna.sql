-- *******************************************************
-- Script: alter_prod_ExemploDB_add_coluna.sql
-- Descrição: Este script realiza a alteração no banco de dados
-- 'prod_ExemploDB' adicionando uma nova coluna chamada
-- 'telefone' na tabela 'Usuario'. Esse tipo de modificação
-- é necessária para manter a estrutura do banco atualizada.
-- *******************************************************

-- Adicionando a coluna 'telefone' na tabela Usuario
ALTER TABLE Usuario
ADD COLUMN telefone VARCHAR(20);

-- Atualizando os dados com a nova coluna
UPDATE Usuario SET telefone = '123456789' WHERE idUsuario = 1;
UPDATE Usuario SET telefone = '987654321' WHERE idUsuario = 2;
