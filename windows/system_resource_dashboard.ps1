# system_resource_dashboard.ps1
# Generates a quick summary of CPU, memory, and disk utilization

# === Configuration ===
$ReportFile = "system_resource_dashboard.txt"
$Timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

Add-Content $ReportFile "=== System Resource Dashboard ($Timestamp) ===`n"

# CPU Usage
Add-Content $ReportFile "`n--- CPU Usage ---"
Get-Counter '\Processor(_Total)\% Processor Time' |
    Select-Object -ExpandProperty CounterSamples |
    Format-Table InstanceName, CookedValue -AutoSize |
    Out-String | Add-Content $ReportFile

# Memory Usage
Add-Content $ReportFile "`n--- Memory Usage ---"
Get-Counter '\Memory\Available MBytes' |
    Select-Object -ExpandProperty CounterSamples |
    Format-Table InstanceName, CookedValue -AutoSize |
    Out-String | Add-Content $ReportFile

# Disk Usage
Add-Content $ReportFile "`n--- Disk Usage ---"
Get-CimInstance Win32_LogicalDisk -Filter "DriveType=3" |
    Select-Object DeviceID, Size, FreeSpace |
    Format-Table -AutoSize |
    Out-String | Add-Content $ReportFile

Write-Output "✅ System resource dashboard complete. Report saved to $ReportFile"
