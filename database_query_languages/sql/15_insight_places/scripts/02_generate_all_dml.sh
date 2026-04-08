#!/bin/bash
# ===============================================
# Script: generate_all_dml.sh
# Descrição: Gera um arquivo único contendo todos
# arquivos SQL de INSERT (DML) na ordem numérica.
# ===============================================

OUTPUT="all_dml.sql"

# Limpa o arquivo anterior
> "$OUTPUT"

echo "Generating $OUTPUT ..."

# Procura arquivos .sql contendo INSERT (case-insensitive), ordena por nome
for file in $(grep -il "insert" *.sql | sort); do
    echo "-- ====================================== --" >> "$OUTPUT"
    echo "-- START FILE: $file --" >> "$OUTPUT"
    echo "-- ====================================== --" >> "$OUTPUT"
    cat "$file" >> "$OUTPUT"
    echo "" >> "$OUTPUT"
    echo "-- ====================================== --" >> "$OUTPUT"
    echo "-- END FILE: $file --" >> "$OUTPUT"
    echo "-- ====================================== --" >> "$OUTPUT"
    echo "" >> "$OUTPUT"
done

echo "Done! All DML scripts combined into $OUTPUT"
