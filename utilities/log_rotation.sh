#!/bin/bash
# log_rotation.sh
# Automates log rotation and cleanup with configurable retention

# === Configuration ===
LOG_DIR="/var/log/myapp"       # Directory containing logs
ARCHIVE_DIR="/var/log/archive" # Where rotated logs are stored
RETENTION_DAYS=7               # How many days to keep old logs

# === Ensure archive directory exists ===
mkdir -p "$ARCHIVE_DIR"

# === Rotate logs ===
for file in "$LOG_DIR"/*.log; do
    if [ -f "$file" ]; then
        timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
        archive_file="$ARCHIVE_DIR/$(basename "$file").$timestamp.tar.gz"
        
        # Compress and move
        tar -czf "$archive_file" "$file"
        echo "Archived $file → $archive_file"
        
        # Clear original log
        : > "$file"
    fi
done

# === Cleanup old archives ===
find "$ARCHIVE_DIR" -type f -mtime +$RETENTION_DAYS -exec rm -f {} \;
echo "Cleanup complete: Removed archives older than $RETENTION_DAYS days."
