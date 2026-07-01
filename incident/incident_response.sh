#!/bin/bash
# incident_response.sh
# Collects logs, restarts critical services, and notifies admins

# === Configuration ===
LOG_DIR="/var/log/myapp"
ARCHIVE_DIR="/var/log/incident_archive"
SERVICE_NAME="nginx"
ADMIN_EMAIL="admin@example.com"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
REPORT_FILE="$ARCHIVE_DIR/incident_report_$TIMESTAMP.txt"

# === Ensure archive directory exists ===
mkdir -p "$ARCHIVE_DIR"

# === Collect logs ===
echo "=== Incident Report ($TIMESTAMP) ===" > "$REPORT_FILE"
echo "--- Recent Logs ---" >> "$REPORT_FILE"
tail -n 50 "$LOG_DIR"/app.log >> "$REPORT_FILE"

# === Restart service ===
echo "--- Service Restart ---" >> "$REPORT_FILE"
systemctl restart "$SERVICE_NAME"
status=$(systemctl is-active "$SERVICE_NAME")
echo "Service $SERVICE_NAME status: $status" >> "$REPORT_FILE"

# === Archive report ===
tar -czf "$ARCHIVE_DIR/incident_$TIMESTAMP.tar.gz" "$REPORT_FILE"

# === Notify admin (requires mail configured) ===
mail -s "Incident Response Report ($TIMESTAMP)" "$ADMIN_EMAIL" < "$REPORT_FILE"

echo "✅ Incident response complete. Report archived and sent to $ADMIN_EMAIL"
