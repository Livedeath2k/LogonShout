SchTasks /Create /SC ONLOGON /TN "LogonShout - Hallo" /TR "powershell.exe -executionpolicy bypass -File C:\LogonShout\Hallo.ps1"
SchTasks /Create /XML C:\LogonShout\BeleidigungsHallo2.xml /TN "LogonShout - Hallo2"
SchTasks /Create /SC ONEVENT /MO "*[System[Provider[@Name='Microsoft-Windows-Security-Auditing'] and EventID=4647]]" /EC Security /TN "LogonShout - Bye" /TR "powershell.exe -executionpolicy bypass -File C:\LogonShout\Bye.ps1"