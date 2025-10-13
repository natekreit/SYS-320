clear
#Challenge1
function gatherIOC(){

$page = Invoke-WebRequest -TimeoutSec 2 http://10.0.17.47/IOC.html

#Get all the tr elements of HTML document
$trs=$page.ParsedHtml.body.getElementsByTagName("tr")

#Empty array to hold results
$IOCTable = @()
for($i=1; $i -lt $trs.length; $i++){ #Going over every tr element

    #Get every td element of current tr element
    $tds = $trs[$i].getElementsByTagName("td")

    $IOCTable += [pscustomobject]@{
        "Pattern" = $tds[0].innerText; `
        "Description" = $tds[1].innerText;`
        }
}
return $IOCTable
}
#gatherIOC


#Challenge2
function gatherLogs(){

$logsNotformatted = Get-Content C:\Users\champuser\SYS-320\week8\midterm\access.log

#Empty array to hold results
$LogTable = @()
for ($i=0; $i -lt $logsNotformatted.Count; $i++){

    #Split a string into words
    $words = $logsNotformatted[$i].Split(" ");


    $LogTable += [pscustomobject]@{
        "IP" = $words[0]; `
        "Time" = $words[3].Trim('[');`
        "Method" = $words[5].Trim('"');`
        "Page" = $words[6];`
        "Protocol" = $words[7];`
        "Response" = $words[8];`
        "Referrer" = $words[10];`
        }
}
return $LogTable
}
#gatherLogs | Format-Table -AutoSize -Wrap


#Challenge3
function specificLogs($logFile, $indicators){

$getPattern = $indicators | Select-Object "Pattern"

$SpecificTable = @()
for ($n=0; $n -lt $logFile.Length; $n++){
    $getLogs = $logFile[$n].Page
    for ($k=0; $k -lt $indicators.Length; $k++){
        $getIndicator = $getPattern.Pattern[$k]
        $checkLogs = $getLogs | Select-String $getIndicator
        if($checkLogs){
            $SpecificTable += [pscustomobject]@{
        "IP" = $logFile.IP[$n]; `
        "Time" = $logFile.Time[$n];`
        "Method" = $logFile.Mathod[$n];`
        "Page" = $logFile.Page[$n];`
        "Protocol" = $logFile.Protocol[$n];`
        "Response" = $logFile.Response[$n];`
        "Referrer" = $logFile.Referrer[$n];`
        }
        }
    }
}
return $SpecificTable | Sort-Object -Property Page -Unique
}

$1 = gatherLogs
$2 = gatherIOC
$results = specificLogs $1 $2
#$results | Format-Table -AutoSize