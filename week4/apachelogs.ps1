#List all of the apache logs of xampp
#Get-Content C:\xampp\apache\logs\access.log

#List only the last 5 apache logs
#Get-Content C:\xampp\apache\logs\access.log -Tail 5

#Display only logs that contain 404 (Not Found or 400 (Bad Request)
#Get-Content C:\xampp\apache\logs\access.log | Select-String ' 404 ',' 400 '

#Display only logs that does not contain 200 (ok)
#Get-Content C:\xampp\apache\logs\access.log | Select-String ' 200 ' -NotMatch

#From every .log file in the directory, only get logs that contains the word 'error'
#$A = Get-ChildItem C:\xampp\apache\logs\*.log | Select-String -Last 'error'
#Display last 5 elements of the results array
#$A


#7
#Display only logs that contain 404, save into $notfounds
$notfounds = Get-Content C:\xampp\apache\logs\access.log | Select-String ' 404 '

#Define a regex for IP addresses
$regex = [regex] "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}"

#Get $notfounds records that match to the regex
$ipsUnorganized = $regex.Matches($notfounds)

#Get ips as pscustomobject
$ips = @()
for($i=0; $i -lt $ipsUnorganized.Count; $i++){
    $ips += [pscustomobject]@{ "IP" = $ipsUnorganized[$i].Value ;}
}
#$ips | where-object { $_.IP -ilike "10.*" }

#8
#count ips from number 8
$ipsoftens = $ips | Where-object { $_.IP -ilike "10.*" }
$counts = $ipsoftens | 
$counts | Select-object Count, Name