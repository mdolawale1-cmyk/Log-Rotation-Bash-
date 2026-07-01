# system_audit.ps1
# Collects Windows system information into a report

# === Configuration ===
$ReportFile = "system_audit_report.txt"
$Timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

# === Start report ===
Add-Content $ReportFile "=== System Audit Report ($Timestamp) ===`n"

# === OS Information ===
Add-Content $ReportFile "`n--- Operating System ---"
Get-CimInstance Win32_OperatingSystem | 
    Select-Object Caption, Version, OSArchitecture, LastBootUpTime | 
    Format-Table | Out-String | Add-Content $ReportFile

# === CPU Information ===
Add-Content $ReportFile "`n--- CPU ---"
Get-CimInstance Win32_Processor | 
    Select-Object Name, NumberOfCores, MaxClockSpeed | 
    Format-Table | Out-String | Add-Content $ReportFile

# === Memory Information ===
Add-Content $ReportFile "`n--- Memory ---"
Get-CimInstance Win32_PhysicalMemory | 
    Select-Object Manufacturer, Capacity, Speed | 
    Format-Table | Out-String | Add-Content $ReportFile

# === Disk Information ===
Add-Content $ReportFile "`n--- Disk Drives ---"
Get-CimInstance Win32_LogicalDisk -Filter "DriveType=3" | 
    Select-Object DeviceID, Size, FreeSpace | 
    Format-Table | Out-String | Add-Content $ReportFile

# === Services Status ===
Add-Content $ReportFile "`n--- Services ---"
Get-Service | 
    Select-Object Name, Status, StartType | 
    Format-Table | Out-String | Add-Content $ReportFile

# === Completion ===
Add-Content $ReportFile "`nAudit complete. Report saved to $ReportFile"
Write-Output "✅ System audit complete. Report saved to $ReportFile"
