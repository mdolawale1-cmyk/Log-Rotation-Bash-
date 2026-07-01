#!/bin/bash
# service_dependency_checker.sh
# Verifies that dependent services are running in the correct order

# === Configuration ===
DEPENDENCIES=("postgresql" "redis" "nginx")  # Example: DB before cache before web
LOG_FILE="service_dependency_report.log"
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

# === Start report ===
echo "=== Service Dependency Check at $TIMESTAMP ===" >> "$LOG_FILE"

for service in "${DEPENDENCIES[@]}"; do
    status=$(systemctl is-active "$service")
    if [ "$status" == "active" ]; then
        echo "✅ $service is running." | tee -a "$LOG_FILE"
    else
        echo "⚠️ ALERT: $service is NOT running!" | tee -a "$LOG_FILE"
    fi
done

echo "Results saved to $LOG_FILE"
