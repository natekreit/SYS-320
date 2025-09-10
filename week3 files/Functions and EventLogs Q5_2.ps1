#Take input to change how far you woulld like to go back
#Write-Host "Enter how many days you would like to go back"
#$daysback = Read-Host


function func2($daysback){
$startups = Get-EventLog system -source EventLog -After (Get-Date).AddDays(-$daysback) | 
Where-Object {( $_.EventId -eq "6005")}

$startupsTable = @() #Empty array to fill customly
for($i=0; $i -lt $startups.Count; $i++){

#Creating event property value
$event = ""
if($startups[$i].EventId -eq "6005") {$event="Power-On"}

#Creating user property value
$user = $startups[$i].ReplacementStrings[1]

#Adding each new line (in form of a custom object) to our empty array
$startupsTable += [pscustomobject]@{"Time" = $startups[$i].TimeGenerated; 
                                      "Id" = $startups[$i].EventId;
                                   "Event" = $event;
                                    "User" = "System";
                                    }
} #End of for
$startupsTable
}


function func3($daysback){
$shutdowns = Get-EventLog system -source EventLog -After (Get-Date).AddDays(-$daysback) | 
Where-Object {($_.EventId -eq "6006")}

$shutdownsTable = @() #Empty array to fill customly
for($i=0; $i -lt $shutdowns.Count; $i++){

#Creating event property value
$event = ""
if($shutdowns[$i].EventId -eq "6006") {$event="Shut-Down"}

#Creating user property value
$user = $shutdowns[$i].ReplacementStrings[1]

#Adding each new line (in form of a custom object) to our empty array
$shutdownsTable += [pscustomobject]@{"Time" = $shutdowns[$i].TimeGenerated; 
                                       "Id" = $shutdowns[$i].EventId;
                                    "Event" = $event;
                                     "User" = "System";
                                    }

} #End of for
$shutdownsTable
}

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

#func3(Read-Host)