. (Join-Path C:\Users\champuser\SYS-320\week6\ Event-Logs.ps1)
. (Join-Path $PSScriptRoot Email.ps1)
. (Join-Path $PSScriptRoot Scheduler.ps1)
. (Join-Path $PSScriptRoot Configuration.ps1)

clear

#Obtaining confiiguration
$configuration = readConfiguration

#Obtaining at risk users
$Failed = vulnerableUsers $configuration.Days

#Sending at risk users as email
SendAlertEmail ($Failed | Format-Table | Out-String)

#Setting the script to be run daily
ChooseTimeToRun $configuration.ExecutionTime