#!/bin/bash
# html_dashboard_generator.sh
# Generates a simple HTML dashboard using Bash

OUTPUT_FILE="system_dashboard.html"
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
MEM_USAGE=$(free -m | awk '/Mem:/ {printf "%.2f", $3/$2*100}')
DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}')

cat <<EOF > $OUTPUT_FILE
<!DOCTYPE html>
<html>
<head>
    <title>System Dashboard</title>
    <style>
        body { font-family: Arial; background-color: #f4f4f4; margin: 20px; }
        h1 { color: #333; }
        .section { background: #fff; padding: 15px; margin-bottom: 10px; border-radius: 8px; }
    </style>
</head>
<body>
    <h1>System Dashboard - $TIMESTAMP</h1>
    <div class="section">
        <h2>Performance Metrics</h2>
        <p>CPU Usage: $CPU_USAGE%</p>
        <p>Memory Usage: $MEM_USAGE%</p>
        <p>Disk Usage: $DISK_USAGE</p>
    </div>
</body>
</html>
EOF

echo "✅ Dashboard generated: $OUTPUT_FILE"
