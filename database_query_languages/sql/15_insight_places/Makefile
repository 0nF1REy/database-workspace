# Makefile para 15_insight_places
# Permite executar a geração de scripts SQL e rodar todos os SQL diretamente no banco

SHELL := /bin/bash
SCRIPTS_DIR := scripts
DB_USER ?= $(shell grep MYSQL_USER ../../../.env | cut -d '=' -f 2)
DB_PASSWORD ?= $(shell grep MYSQL_PASSWORD ../../../.env | cut -d '=' -f 2)
DB_NAME := insight_places_db

.PHONY: default ddl dml full all run reset help

# ---------------------------
# Target default (quando usuário digita apenas 'make')
default: help

# ---------------------------
# Gerar todos os DDL
ddl:
	@echo "Executando script DDL..."
	@bash $(SCRIPTS_DIR)/01_generate_all_ddl.sh

# ---------------------------
# Gerar todos os DML
dml:
	@echo "Executando script DML..."
	@bash $(SCRIPTS_DIR)/02_generate_all_dml.sh

# ---------------------------
# Gerar script completo do banco de dados (DDL + DML)
full:
	@echo "Executando script completo do banco de dados..."
	@bash $(SCRIPTS_DIR)/03_build_full_database.sh

# ---------------------------
# Executa todos os passos (ddl + dml + full)
all: ddl dml full

# ---------------------------
# Executa todos os arquivos .sql no banco de dados
run:
	@echo "Executando todos os scripts SQL no banco $(DB_NAME)..."
	@bash $(SCRIPTS_DIR)/04_run_all_sql.sh

# ---------------------------
# Reseta o banco de dados e reconstrói tudo do zero
reset:
	@echo "Resetando o banco de dados $(DB_NAME)..."
	@mariadb -u "$(DB_USER)" -p"$(DB_PASSWORD)" < 00_reset_database.sql
	@echo "Banco resetado. Reconstruindo estrutura e dados..."
	@$(MAKE) run

# ---------------------------
# Comando de ajuda
help:
	@echo "Uso: make [alvo]"
	@echo ""
	@echo "Alvos disponíveis:"
	@echo "  ddl   - Gera todos os scripts DDL (all_ddl.sql)"
	@echo "  dml   - Gera todos os scripts DML (all_dml.sql)"
	@echo "  full  - Gera o script completo do banco de dados (full_database.sql)"
	@echo "  all   - Executa ddl, dml e full em sequência"
	@echo "  run   - Executa todos os scripts .sql no banco de dados"
	@echo "  reset - Reseta o banco (DROP + CREATE) e reconstrói tudo do zero"
	@echo "  help  - Mostra esta mensagem de ajuda"
