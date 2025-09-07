#Part 1
Get-Process | Where-Object { $_.ProcessName -ilike 'C*' } | Select-Object ProcessName, Id

#Part 2
Get-Process | Where-Object { $_.Path -and $_.Path -notmatch 'system32' } | Select-Object ProcessName, Id, Path

#Part 3
Get-Service | Where-Object { $_.Status -eq 'Stopped' } | Sort-Object -Property Name | Select-Object Name, Status | Export-Csv -Path "Stop_Service"

#Part 4
if (Get-Process -Name chrome -ErrorAction SilentlyContinue) {
    Stop-Process -Name chrome -Force
} else {
    Start-Process chrome "https://www.champlain.edu"
}
