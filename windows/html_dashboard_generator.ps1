# html_dashboard_generator.ps1
# Generates a simple HTML dashboard using PowerShell

$OutputFile = "system_dashboard.html"
$Timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

$CPU = (Get-Counter '\Processor(_Total)\% Processor Time').CounterSamples.CookedValue
$Mem = (Get-Counter '\Memory\Available MBytes').CounterSamples.CookedValue
$Disk = Get-CimInstance Win32_LogicalDisk -Filter "DriveType=3" | 
        Select-Object DeviceID, Size, FreeSpace

$html = @"
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
    <h1>System Dashboard - $Timestamp</h1>
    <div class="section">
        <h2>Performance Metrics</h2>
        <p>CPU Usage: $CPU%</p>
        <p>Memory Available: $Mem MB</p>
        <p>Disk Usage:</p>
        <pre>$($Disk | Format-Table -AutoSize | Out-String)</pre>
    </div>
</body>
</html>
"@

$html | Out-File $OutputFile
Write-Output "✅ Dashboard generated: $OutputFile"
