# scheduled_task_setup.ps1
# Automates running PowerShell scripts daily or weekly

$TaskName = "SystemAuditDaily"
$ScriptPath = "C:\Scripts\system_audit.ps1"
$Trigger = New-ScheduledTaskTrigger -Daily -At 9am
$Action = New-ScheduledTaskAction -Execute "PowerShell.exe" -Argument "-File $ScriptPath"
$Principal = New-ScheduledTaskPrincipal -UserId "SYSTEM" -RunLevel Highest

Register-ScheduledTask -TaskName $TaskName -Trigger $Trigger -Action $Action -Principal $Principal -Description "Runs daily system audit report"

Write-Output "✅ Scheduled task '$TaskName' created to run daily at 9 AM."
