#!/bin/bash
# Script para gerar full_database.sql (DDL + DML)

# Caminhos
SCRIPT_DIR=$(dirname "$0")   # pega o diretório onde o script está
ROOT_DIR="$SCRIPT_DIR/.."    # volta para a raiz do projeto

echo "Generating DDL..."
bash "$SCRIPT_DIR/01_generate_all_ddl.sh"

echo "Generating DML..."
bash "$SCRIPT_DIR/02_generate_all_dml.sh"

# Juntando os arquivos na raiz
OUTPUT="$ROOT_DIR/full_database.sql"
> "$OUTPUT"
cat "$ROOT_DIR/all_ddl.sql" >> "$OUTPUT"
echo -e "\n-- ====================================== --\n" >> "$OUTPUT"
cat "$ROOT_DIR/all_dml.sql" >> "$OUTPUT"

echo "Done! Full database script generated: $OUTPUT"