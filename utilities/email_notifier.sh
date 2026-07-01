#!/bin/bash
# email_notifier.sh
# Sends daily summaries of uptime, performance, and incidents

# === Configuration ===
ADMIN_EMAIL="admin@example.com"
SUMMARY_FILE="daily_summary.txt"
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

echo "=== Daily Summary ($TIMESTAMP) ===" > "$SUMMARY_FILE"
echo "--- System Health ---" >> "$SUMMARY_FILE"
tail -n 5 performance_metrics.log >> "$SUMMARY_FILE"
echo "--- Service Status ---" >> "$SUMMARY_FILE"
tail -n 5 service_uptime.log >> "$SUMMARY_FILE"
echo "--- Recent Incidents ---" >> "$SUMMARY_FILE"
tail -n 5 incident_response.log >> "$SUMMARY_FILE"

mail -s "Daily System Summary ($TIMESTAMP)" "$ADMIN_EMAIL" < "$SUMMARY_FILE"
echo "✅ Daily summary sent to $ADMIN_EMAIL"
