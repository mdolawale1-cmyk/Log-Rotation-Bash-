#!/bin/bash
# service_uptime_tracker.sh
# Records uptime and downtime for critical services

# === Configuration ===
SERVICES=("nginx" "postgresql" "redis")
LOG_FILE="service_uptime.log"
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

echo "=== Service Uptime Tracker at $TIMESTAMP ===" >> "$LOG_FILE"

for service in "${SERVICES[@]}"; do
    status=$(systemctl is-active "$service")
    if [ "$status" == "active" ]; then
        echo "✅ $service is UP" | tee -a "$LOG_FILE"
    else
        echo "⚠️ $service is DOWN" | tee -a "$LOG_FILE"
    fi
done

echo "Results saved to $LOG_FILE"
