#Take input to change how far you woulld like to go back
Write-Host "Enter how many days you would like to go back"
#$daysback = Read-Host


function func1($daysback){
$loginouts = Get-EventLog system -source Microsoft-Windows-Winlogon -After (Get-Date).AddDays(-$daysback)

$loginoutsTable = @() #Empty array to fill customly
for($i=0; $i -lt $loginouts.Count; $i++){

#Creating event property value
$event = ""
if($loginouts[$i].InstanceId -eq "7001") {$event="Logon"}
if($loginouts[$i].InstanceId -eq "7002") {$event="Logoff"}

#Creating user property value
$user = $loginouts[$i].ReplacementStrings[1]

#Adding each new line (in form of a custom object) to our empty array
$loginoutsTable += [pscustomobject]@{"Time" = $loginouts[$i].TimeGenerated; 
                                       "Id" = $loginouts[$i].InstanceID;
                                    "Event" = $event;
                                     "User" = $user | whoami;
                                    }
} #End of for
$loginoutsTable
}
func1(Read-Host)