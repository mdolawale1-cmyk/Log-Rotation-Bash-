#!/bin/bash
# performance_metrics_collector.sh
# Collects CPU, memory, and disk usage metrics periodically

# === Configuration ===
LOG_FILE="performance_metrics.log"
INTERVAL=60  # seconds between checks

echo "=== Performance Metrics Collector Started ==="
while true; do
    TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
    CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
    MEM_USAGE=$(free -m | awk '/Mem:/ {printf "%.2f", $3/$2*100}')
    DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}')
    
    echo "$TIMESTAMP | CPU: ${CPU_USAGE}% | MEM: ${MEM_USAGE}% | DISK: ${DISK_USAGE}" >> "$LOG_FILE"
    sleep $INTERVAL
done
