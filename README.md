# 📊 Log‑Rotation‑Bash‑

A cross‑platform **system reliability toolkit** for automating log rotation, monitoring, incident response, and reporting using **Bash** and **PowerShell**.

---

## 🏷️ Badges
![Bash](https://img.shields.io/badge/Shell-Bash-blue)
![PowerShell](https://img.shields.io/badge/PowerShell-Windows-green)
![SQL](https://img.shields.io/badge/SQL-Database-orange)
![Automation](https://img.shields.io/badge/Automation-Enabled-success)
![License](https://img.shields.io/badge/License-MIT-lightgrey)

---

## 🚀 Features
- **[Log rotation](ca://s?q=Log_rotation_Bash_script)** → Automated cleanup and compression of system/application logs.  
- **[Monitoring](ca://s?q=Performance_metrics_collector_Bash_script)** → Collect CPU, memory, disk, and network metrics.  
- **[Incident tracking](ca://s?q=Service_uptime_tracker_Bash_script)** → Record uptime/downtime of critical services.  
- **[Reporting](ca://s?q=HTML_dashboard_generator_Bash_script)** → Generate dashboards and summaries in HTML, email, and text.  
- **[Cross‑platform](ca://s?q=Windows_PowerShell_monitoring_scripts)** → Includes PowerShell scripts for Windows system health.  

---

## 📂 Repository Structure (Files & Folders)
```text
Log-Rotation-Bash-/
│
├── README.md                  # Project overview
├── LICENSE                    # MIT license
├── .gitignore                 # Git ignore rules
│
├── backup/                    # Backup automation
│   └── backup_automation.sh
│
├── database/                  # Database health checks
│   └── db_health_checks.sql
│
├── docs/                      # Documentation and visuals
│   └── README_visuals.md
│
├── incident/                  # Incident response scripts
│   ├── incident_response.sh
│   ├── service_dependency_checker.sh
│   └── service_uptime_tracker.sh
│
├── monitoring/                # System monitoring
│   └── performance_metrics_collector.sh
│
├── network/                   # Network monitoring
│   ├── network_check.sh
│   └── network_latency_monitor.sh
│
├── reporting/                 # Reporting and dashboards
│   └── html_dashboard_generator.sh
│
├── samples/                   # Example outputs
│   ├── db_health_checks_example.txt
│   ├── email_notifier_example.txt
│   ├── incident_response_example.txt
│   ├── log_merger_example.txt
│   ├── scheduled_task_setup_example.txt
│   ├── system_audit_example.txt
│   └── system_dashboard_example.html
│
├── security/                  # Security monitoring
│   └── user_session_monitor.sh
│
├── utilities/                 # System utilities
│   ├── disk_space_alert.sh
│   ├── email_notifier.sh
│   ├── log_analyzer.sh
│   ├── log_archiver.sh
│   ├── log_merger.sh
│   ├── log_rotation.sh
│   └── service_restart.sh
│
└── windows/                   # PowerShell scripts for Windows
    ├── event_log_collector.ps1
    ├── html_dashboard_generator.ps1
    ├── scheduled_task_setup.ps1
    ├── system_audit.ps1
    └── system_resource_dashboard.ps1
