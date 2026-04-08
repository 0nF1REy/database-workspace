#!/bin/bash
# ===============================================
# Script: generate_all_ddl.sh
# Descrição: Gera um arquivo único contendo todos
# arquivos SQL com CREATE (DDL) na ordem numérica.
# ===============================================

OUTPUT="all_ddl.sql"

# Limpa o arquivo anterior
> "$OUTPUT"

echo "Generating $OUTPUT ..."

# Procura arquivos .sql contendo CREATE, ordena por nome
for file in $(grep -il "create" *.sql | sort); do
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

echo "Done! All DDL scripts combined into $OUTPUT"
