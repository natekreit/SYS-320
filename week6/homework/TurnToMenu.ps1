. (Join-Path C:\Users\champuser\SYS-320\week4 Last10.ps1)
. (Join-Path C:\Users\champuser\SYS-320\week6 Event-Logs.ps1)
. (Join-Path C:\Users\champuser\SYS-320\week2 ProcessManagement1.ps1)


clear

$Prompt = "`n"
$Prompt += "Please choose your operation:`n"
$Prompt += "1 - Display last 10 apache logs`n"
$Prompt += "2 - Display last 10 failed logins for all users`n"
$Prompt += "3 - Display at risk users`n"
$Prompt += "4 - Start Chrome web browser and navigate it to champlain.edu`n"
$Prompt += "5 - Exit`n"

$operation = $true

while($operation){

    
    Write-Host $Prompt | Out-String
    $choice = Read-Host 


    if($choice -eq 5){
        Write-Host "Goodbye" | Out-String
        exit
        $operation = $false 
    }

    elseif($choice -eq 1){
        lastLogs
    }

    elseif($choice -eq 2){
        $name = Read-Host -Prompt "Please enter the username for the user's failed login logs"

        # TODO: Check the given username with the checkUser function. DONE
        $nameValue = checkUser $name
           
        if ($nameValue -eq $false) {
            Write-Host "User: $name not a real user."
        }
        else {
            $days = Read-Host -Prompt "How many days back would you like to search back in the logs?"
            $userLogins = getFailedLogins $days
            # TODO: Change the above line in a way that, the days 90 should be taken from the user DONE

            Write-Host ($userLogins | Where-Object { $_.User -ilike "*$name"} | Format-Table | Out-String)
        }
    }

    elseif($choice -eq 3){
        $time = Read-Host -Prompt "How many days back would you like to search back in the logs?"
        Write-Host "The following users have had at least 10 failed logins in $time days."
        vulnerableUsers $time
    }

    elseif($choice -eq 4){
        chromeOpen
    }


    else {
        Write-Host "You entered $choice. This is not a valid option, try again."
        $operation = $true
    }
}