#!/bin/bash
# disk_space_alert.sh
# Monitors disk usage and alerts if thresholds are exceeded

# === Configuration ===
THRESHOLD=80          # Alert if usage exceeds this percentage
LOG_FILE="disk_space_alert.log"
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

# === Check disk usage ===
echo "=== Disk Space Check at $TIMESTAMP ===" >> "$LOG_FILE"

df -h | awk 'NR>1 {print $5 " " $6}' | while read output; do
    usage=$(echo $output | awk '{print $1}' | sed 's/%//')
    mount=$(echo $output | awk '{print $2}')
    
    if [ "$usage" -ge "$THRESHOLD" ]; then
        echo "⚠️ ALERT: $mount is at ${usage}% usage!" | tee -a "$LOG_FILE"
    else
        echo "✅ $mount usage is ${usage}% (OK)" | tee -a "$LOG_FILE"
    fi
done

echo "Results saved to $LOG_FILE"
