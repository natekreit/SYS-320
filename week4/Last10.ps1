function lastLogs{
$applogs = "C:\xampp\apache\logs\*.log"
if (Test-Path $applogs){
    Get-Content $applogs -Tail 10
}
else {
    Write-Host "No logs" 
}
}