<# String-Helper
*************************************************************
   This script contains functions that help with String/Match/Search
   operations. 
************************************************************* 
#>


<# ******************************************************
   Functions: Get Matching Lines
   Input:   1) Text with multiple lines  
            2) Keyword
   Output:  1) Array of lines that contain the keyword
********************************************************* #>
function getMatchingLines($contents, $lookline){

$allines = @()
$splitted =  $contents.split([Environment]::NewLine)

for($j=0; $j -lt $splitted.Count; $j++){  
 
   if($splitted[$j].Length -gt 0){  
        if($splitted[$j] -ilike $lookline){ $allines += $splitted[$j] }
   }

}

return $allines
}


function checkPassword($line){

if ($line.Length -gt 5){
    if ($line -match '\d'){
        if ($line -match "[a-zA-Z]") {
            if ($line -match '[^a-zA-Z0-9\s]') {
                return $true
            }
            else {
                Write-Host "Your password does not have any valid special characters in it."
                return $false
            }
        }
        else {
            Write-Host "Your password does nothave any letters in it."
            return $false
        }
    }
    else {
        Write-Host "Your password does not have any digits in it."
        return $false
    }
}
else {
    Write-Host "Your password is not longer than 6 characters."
    return $false
}
}
checkPassword("123456abc!")


#This function looks for users with more than 10 failed logins
