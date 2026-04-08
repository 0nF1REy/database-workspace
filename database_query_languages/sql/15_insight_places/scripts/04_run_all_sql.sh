#!/bin/bash
# Executa todos os scripts .sql do diretório raiz do projeto no banco de dados
# Ordem: numérica pelo nome do arquivo

set -euo pipefail

# Localiza o .env subindo os diretórios a partir da pasta scripts
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SEARCH_DIR="$SCRIPT_DIR"
ENV_FILE=""

while [ "$SEARCH_DIR" != "/" ]; do
    if [ -f "$SEARCH_DIR/.env" ]; then
        ENV_FILE="$SEARCH_DIR/.env"
        break
    fi
    SEARCH_DIR="$(dirname "$SEARCH_DIR")"
done

# Carrega variáveis do .env
if [ -n "$ENV_FILE" ]; then
    export $(grep -v '^#' "$ENV_FILE" | xargs)
else
    echo "Arquivo .env não encontrado ao subir diretórios a partir de $SCRIPT_DIR"
    exit 1
fi

# Define variáveis do banco
DB_USER="${MYSQL_USER:-}"
DB_PASSWORD="${MYSQL_PASSWORD:-}"
DB_NAME="${DB_NAME:-insight_places_db}"

echo "Executando todos os scripts SQL em $DB_NAME com usuário $DB_USER..."

SQL_ROOT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
CREATE_DB_SCRIPT="$SQL_ROOT_DIR/01_create_database.sql"

if [ ! -f "$CREATE_DB_SCRIPT" ]; then
    echo "Arquivo obrigatório não encontrado: $CREATE_DB_SCRIPT"
    exit 1
fi

echo "Rodando $CREATE_DB_SCRIPT (sem selecionar banco)..."
mariadb -u "$DB_USER" -p"$DB_PASSWORD" < "$CREATE_DB_SCRIPT"

# Ordena os arquivos numericamente e executa os demais scripts no banco criado
for f in "$SQL_ROOT_DIR"/*.sql; do
    # Ignora arquivos gerados (all_ddl.sql, all_dml.sql, full_database.sql)
    case "$f" in
        *all_ddl.sql|*all_dml.sql|*full_database.sql) continue ;;
    esac

    # O script de criação do banco já foi executado
    if [ "$f" = "$CREATE_DB_SCRIPT" ]; then
        continue
    fi

    echo "Rodando $f..."
    mariadb -u "$DB_USER" -p"$DB_PASSWORD" "$DB_NAME" < "$f"
done

echo "Todos os scripts SQL executados com sucesso!"
