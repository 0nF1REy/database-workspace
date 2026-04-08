#!/bin/bash
# Script para gerar all_dml.sql (todos os inserts)

SCRIPT_DIR=$(dirname "$0")
ROOT_DIR="$SCRIPT_DIR/.."
OUTPUT="$ROOT_DIR/all_dml.sql"

> "$OUTPUT"

for file in 04_insert_proprietarios.sql \
            05_insert_clientes.sql \
            06_insert_enderecos.sql \
            07_insert_hospedagens.sql \
            08_insert_alugueis.sql \
            09_insert_avaliacoes.sql
do
    echo "Adicionando $file..."
    cat "$ROOT_DIR/$file" >> "$OUTPUT"
    echo -e "\n-- ====================================== --\n" >> "$OUTPUT"
done

echo "Done! All DML scripts combined into $OUTPUT"
