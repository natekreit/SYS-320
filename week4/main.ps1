. (Join-Path $PSScriptRoot "Apache-Logs.ps1")
. (Join-Path $PSScriptRoot "ApacheLogs1.ps1")

clear

$alogs = Aplog 'index.html' '200' 'firefox'
$alogs
