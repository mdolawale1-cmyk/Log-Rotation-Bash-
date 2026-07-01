#!/bin/bash
# user_session_monitor.sh
# Monitors active user sessions and alerts if unauthorized logins occur

# === Configuration ===
AUTHORIZED_USERS=("admin" "support" "developer")   # Allowed usernames
LOG_FILE="user_session_monitor.log"
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

# === Start monitoring ===
echo "=== User Session Monitor at $TIMESTAMP ===" >> "$LOG_FILE"

# Get current logged-in users
who | awk '{print $1}' | sort | uniq | while read user; do
    if [[ " ${AUTHORIZED_USERS[@]} " =~ " $user " ]]; then
        echo "✅ Authorized user logged in: $user" | tee -a "$LOG_FILE"
    else
        echo "⚠️ ALERT: Unauthorized user detected: $user" | tee -a "$LOG_FILE"
        # Optional: send notification (requires mail configured)
        # echo "Unauthorized login detected: $user at $TIMESTAMP" | mail -s "Security Alert" admin@example.com
    fi
done

echo "Results saved to $LOG_FILE"
