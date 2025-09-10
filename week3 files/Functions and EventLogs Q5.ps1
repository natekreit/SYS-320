#Take input to change how far you woulld like to go back
Write-Host "Enter how many days you would like to go back"
#$daysback = Read-Host


function getDaysBack($daysback){
$loginouts = Get-EventLog system -source EventLog -After (Get-Date).AddDays(-$daysback) | 
Where-Object {( $_.EventId -eq "6006") -or ($_.EventId -eq "6005")}

$loginoutsTable = @() #Empty array to fill customly
for($i=0; $i -lt $loginouts.Count; $i++){

#Creating event property value
$event = ""
if($loginouts[$i].EventId -eq "6005") {$event="Power-On"}
if($loginouts[$i].EventId -eq "6006") {$event="Shut-Down"}

#Creating user property value
$user = $loginouts[$i].ReplacementStrings[1]

#Adding each new line (in form of a custom object) to our empty array
$loginoutsTable += [pscustomobject]@{"Time" = $loginouts[$i].TimeGenerated; 
                                       "Id" = $loginouts[$i].EventId;
                                    "Event" = $event;
                                     "User" = "System";
                                    }
} #End of for
$loginoutsTable
}
getDaysBack(Read-Host)