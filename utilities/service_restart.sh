#!/bin/bash
# service_restart.sh
# Checks if a service is running and restarts it if stopped

# === Configuration ===
SERVICE_NAME="nginx"   # Change to the service you want to monitor
RESTART_CMD="systemctl restart $SERVICE_NAME"
STATUS_CMD="systemctl is-active $SERVICE_NAME"

# === Check service status ===
status=$($STATUS_CMD)

if [ "$status" = "active" ]; then
    echo "✅ $SERVICE_NAME is running."
else
    echo "⚠️ $SERVICE_NAME is not running. Attempting restart..."
    $RESTART_CMD
    
    # Verify restart
    new_status=$($STATUS_CMD)
    if [ "$new_status" = "active" ]; then
        echo "✅ Restart successful: $SERVICE_NAME is now running."
    else
        echo "❌ Restart failed: $SERVICE_NAME is still inactive."
    fi
fi
