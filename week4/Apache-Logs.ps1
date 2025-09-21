#Write a function that will take the following inputs:
#The page visited of referred from (index.html, page1.html, ...)
#HTTP code returned
#Name of the web browser

#Gives 1 output:
#IP address that visited web page, with the web browser, and got the HTTP response

function Aplog($page,$code,$browser){

$logs = Get-ChildItem C:\xampp\apache\logs\*.log | Select-String -Pattern "$page" | Select-String -Pattern "$code" | Select-String -Pattern "$browser"


$ips = @()


$regex = [regex] "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}"


$ips = @()
for($i=0; $i -lt $ipsUnorganized.Count; $i++){
    $ips += [pscustomobject]@{ "IP" = $ipsUnorganized[$i].Value ;}
}

#count ips from number 8
$ipsoftens = $ips | Where-object { $_.IP -ilike "10.*" }
$counts = $ipsoftens | Group-Object -Property IP
$counts | Select-object Count, Name
}
