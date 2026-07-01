# event_log_collector.ps1
# Collects critical Windows event logs into a report

# === Configuration ===
$ReportFile = "event_log_report.txt"
$Timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

# === Start report ===
Add-Content $ReportFile "=== Event Log Report ($Timestamp) ===`n"

# === Collect System Errors and Warnings ===
Add-Content $ReportFile "`n--- System Errors & Warnings ---"
Get-WinEvent -LogName System -MaxEvents 20 |
    Where-Object { $_.LevelDisplayName -in @("Error","Warning") } |
    Format-Table TimeCreated, Id, LevelDisplayName, Message -AutoSize |
    Out-String | Add-Content $ReportFile

# === Collect Application Errors ===
Add-Content $ReportFile "`n--- Application Errors ---"
Get-WinEvent -LogName Application -MaxEvents 20 |
    Where-Object { $_.LevelDisplayName -eq "Error" } |
    Format-Table TimeCreated, Id, LevelDisplayName, Message -AutoSize |
    Out-String | Add-Content $ReportFile

Write-Output "✅ Event log collection complete. Report saved to $ReportFile"
