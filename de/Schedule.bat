SchTasks /Create /SC ONLOGON /TN "LogonSwear - Hallo" /TR "powershell.exe -executionpolicy bypass -File C:\LogonSwear\Hallo.ps1"
SchTasks /Create /XML C:\LogonSwear\LogonSwear-Job1.xml /TN "LogonSwear - Wieder da"
SchTasks /Create /SC ONEVENT /MO "*[System[Provider[@Name='Microsoft-Windows-Security-Auditing'] and EventID=4647]]" /EC Security /TN "LogonSwear - Bye" /TR "powershell.exe -executionpolicy bypass -File C:\LogonSwear\Bye.ps1"