#!/bin/bash
# backup_automation.sh
# Compresses and backs up directories with retention cleanup

# === Configuration ===
SOURCE_DIR="/var/log/myapp"        # Directory to back up
BACKUP_DIR="/var/backups/myapp"    # Where backups are stored
RETENTION_DAYS=7                   # How many days to keep backups
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="$BACKUP_DIR/backup_$TIMESTAMP.tar.gz"

# === Ensure backup directory exists ===
mkdir -p "$BACKUP_DIR"

# === Create backup ===
tar -czf "$BACKUP_FILE" "$SOURCE_DIR"
echo "✅ Backup created: $BACKUP_FILE"

# === Cleanup old backups ===
find "$BACKUP_DIR" -type f -mtime +$RETENTION_DAYS -exec rm -f {} \;
echo "🧹 Cleanup complete: Removed backups older than $RETENTION_DAYS days."
