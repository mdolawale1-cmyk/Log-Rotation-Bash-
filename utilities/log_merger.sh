#!/bin/bash
# log_merger.sh
# Combines multiple log files into one unified report

# === Configuration ===
LOG_DIR="/var/log/myapp"
MERGED_FILE="merged_system_logs.txt"
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

echo "=== Unified Log Report ($TIMESTAMP) ===" > "$MERGED_FILE"

for file in "$LOG_DIR"/*.log; do
    echo "--- $(basename "$file") ---" >> "$MERGED_FILE"
    cat "$file" >> "$MERGED_FILE"
    echo "" >> "$MERGED_FILE"
done

echo "✅ Logs merged successfully into $MERGED_FILE"
