GITHUB_USER="$1"

if [ -z "$GITHUB_USER" ]; then
  echo "Error: Debe proporcionar un nombre de usuario de GitHub."
  exit 1
fi

USER_DATA=$(curl -s "https://api.github.com/users/$GITHUB_USER")

USER_ID=$(echo "$USER_DATA" | jq -r '.id')
CREATED_AT=$(echo "$USER_DATA" | jq -r '.created_at')

if [ -z "$USER_ID" ] || [ "$USER_ID" == "null" ]; then
  echo "Error: No se pudo obtener información del usuario $GITHUB_USER."
  exit 1
fi

MESSAGE="Hola $GITHUB_USER. User ID: $USER_ID. Cuenta fue creada el: $CREATED_AT."
echo "$MESSAGE"

LOG_DIR="/tmp/$(date +%Y-%m-%d)"
mkdir -p "$LOG_DIR"

LOG_FILE="$LOG_DIR/saludos.log"
echo "$MESSAGE" >> "$LOG_FILE"

(crontab -l ; echo "*/5 * * * * /ruta/al/script.sh $GITHUB_USER") | crontab -
