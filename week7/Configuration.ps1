#. (Join-Path $PSScriptRoot configuration.txt)

clear

function readConfiguration(){
$conFile = (Get-Content C:\Users\champuser\SYS-320\week7\configuration.txt)
$Table = @()
$Table += [pscustomobject]@{
    "Days" = $conFile[0]; `
    "ExecutionTime" = $conFile[1]
}
return $Table
}


function changeConfiguration(){
$path = "C:\Users\champuser\SYS-320\week7\configuration.txt"
#Change days
Write-Host "How many days would you like to go back?"
$newDays = Read-Host
while($newDays -notmatch "[0-9]{1,3}"){
    Write-Host "You entered: $newdays. Please enter a digit."
    $newDays = Read-Host
}
$lines = (Get-Content -LiteralPath $path) 
$lines[0] = $newDays
Set-Content -LiteralPath $path -Value $lines


#Change time
Write-Host "What time would you like to execute?"
$newTime = Read-Host
while($newTime -notmatch "[0-9]{1,2}:[0-9]{2} [AP]M"){
    Write-Host "You wrote $newTime. What time would you like to execute?"
$newTime = Read-Host
}
$lines[1] = $newTime
Set-Content -LiteralPath $path -Value $lines


}


function configurationMenu(){
$Prompt = "`n"
$Prompt += "Please choose your operation:`n"
$Prompt += "1 - Show configuration`n"
$Prompt += "2 - Change configuration`n"
$Prompt += "3 - Exit`n"

$operation = $true

while($operation){

    
    Write-Host $Prompt | Out-String
    $choice = Read-Host 


    if($choice -eq 3){
        Write-Host "Goodbye" | Out-String
        exit
        $operation = $false 
    }

    #This option shows the configuration
    elseif($choice -eq 1){
        readConfiguration | Out-String
    }

    #This option changes the configuration
    elseif($choice -eq 2){
        changeConfiguration | Out-String

    }

    else {
        Write-Host "You entered $choice. This is not a valid option, try again."
        $operation = $true
    }
}
}