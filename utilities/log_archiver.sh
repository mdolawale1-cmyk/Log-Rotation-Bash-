#!/bin/bash
# log_archiver.sh
# Archives old logs into compressed files for long-term storage

# === Configuration ===
LOG_DIR="/var/log/myapp"
ARCHIVE_DIR="/var/log/log_archive"
RETENTION_DAYS=30
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

# === Ensure archive directory exists ===
mkdir -p "$ARCHIVE_DIR"

# === Archive logs older than retention period ===
find "$LOG_DIR" -type f -mtime +$RETENTION_DAYS | while read logfile; do
    archive_file="$ARCHIVE_DIR/$(basename $logfile)_$TIMESTAMP.tar.gz"
    tar -czf "$archive_file" "$logfile"
    echo "📦 Archived $logfile to $archive_file"
    rm -f "$logfile"
done

echo "✅ Log archiving complete. Old logs older than $RETENTION_DAYS days have been archived."
