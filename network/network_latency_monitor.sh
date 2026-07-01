#!/bin/bash
# network_latency_monitor.sh
# Measures latency and connectivity to critical endpoints

# === Configuration ===
ENDPOINTS=("8.8.8.8" "1.1.1.1" "github.com")
LOG_FILE="network_latency.log"
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

echo "=== Network Latency Check at $TIMESTAMP ===" >> "$LOG_FILE"

for host in "${ENDPOINTS[@]}"; do
    ping -c 4 "$host" | tail -1 | awk '{print $4}' | cut -d '/' -f 2 | while read latency; do
        if [ -z "$latency" ]; then
            echo "⚠️ $host unreachable!" | tee -a "$LOG_FILE"
        else
            echo "✅ $host average latency: ${latency} ms" | tee -a "$LOG_FILE"
        fi
    done
done

echo "Results saved to $LOG_FILE"
