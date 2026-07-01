#!/bin/bash
# log_analyzer.sh
# Summarizes and analyzes logs for error patterns

# === Configuration ===
LOG_DIR="/var/log/myapp"
REPORT_FILE="log_analysis_report.txt"
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

echo "=== Log Analysis Report ($TIMESTAMP) ===" > "$REPORT_FILE"

# Count errors, warnings, and info messages
ERROR_COUNT=$(grep -i "error" "$LOG_DIR"/app.log | wc -l)
WARN_COUNT=$(grep -i "warn" "$LOG_DIR"/app.log | wc -l)
INFO_COUNT=$(grep -i "info" "$LOG_DIR"/app.log | wc -l)

echo "Errors: $ERROR_COUNT" >> "$REPORT_FILE"
echo "Warnings: $WARN_COUNT" >> "$REPORT_FILE"
echo "Info: $INFO_COUNT" >> "$REPORT_FILE"

echo "✅ Log analysis complete. Report saved to $REPORT_FILE"
