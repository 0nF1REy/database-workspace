# chmod +x backup_prod.sh

# Carrega variáveis do arquivo .env.sh
source .env.sh

# Data atual no formato YYYYMMDD
DATA=$(date +%Y%m%d)

# Nome do arquivo de backup
ARQUIVO="bkp_${DB_NAME}_${DATA}.sql"

# Executa o backup
mysqldump -u "$DB_USER" -p"$DB_PASSWORD" "$DB_NAME" > "${BACKUP_DIR}/${ARQUIVO}"

# Mensagem de sucesso
echo "Backup criado com sucesso: ${BACKUP_DIR}/${ARQUIVO}"
