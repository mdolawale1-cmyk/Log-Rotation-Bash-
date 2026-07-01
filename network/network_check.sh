#!/bin/bash
# network_check.sh
# Checks connectivity to critical endpoints and logs results

# === Configuration ===
ENDPOINTS=("google.com" "github.com" "stackoverflow.com")  # Add endpoints here
LOG_FILE="network_check.log"
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

# === Run connectivity checks ===
echo "=== Network Check at $TIMESTAMP ===" >> "$LOG_FILE"

for host in "${ENDPOINTS[@]}"; do
    if ping -c 2 "$host" > /dev/null 2>&1; then
        echo "✅ $host is reachable." | tee -a "$LOG_FILE"
    else
        echo "❌ $host is NOT reachable." | tee -a "$LOG_FILE"
    fi
done

echo "Results saved to $LOG_FILE"
