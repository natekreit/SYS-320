. (Join-Path $PSScriptRoot "Functions and EventLogs Q5_2.ps1")

clear

#Get Login and Logoffs from the last 15 days
$loginoutsTable = func1(15)
$loginoutsTable

#Get Shut Downs from the last 25 days
$shutdownsTable = func3(25)
$shutdownsTable

#Get Start Ups from the last 25 days
$startupsTable = func2(25)
$startupsTable