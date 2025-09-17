function ApacheLogs1(){
    $logsNotformatted = Get-Content C:\xampp\apache\logs\access.log
    $tableRecords = @()

    for ($i=0; $i -lt $logsNotformatted.Count; $i++){

        #Split a string into words
        $words = $logsNotformatted[$i].Split(" ");

        $tableRecords += [pscustomobject]@{ 
            "IP" = $words[0]; `
            "Time" = $words[3].Trim('['); `
            "Method" = $words[5].Trim('"'); `
            "Page" = $words[6]; `
            "Protocol" = $words[7]; `
            "Response" = $words[8]; `
            "Referrer" = $words[10]; `
            "Client" = $words[11..($words.Count - 1)]; }
    }
    return $tableRecords | Where-Object { $_.IP -match "10.*" }
}
$tableRecords = ApacheLogs1
$tableRecords | Format-Table -AutoSize -Wrap