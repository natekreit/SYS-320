#Write a Powershsell function that Scrapes the table from the web page and saves the content to a custom object

function gatherClasses(){

$page = Invoke-WebRequest -TimeoutSec 2 http://10.0.17.43/Courses2025FA.html

#Get all the tr elements of HTML document
$trs=$page.ParsedHtml.body.getHtmlByTagName("tr")

#Empty array to hold results
$FullTable = @()
for($i=1; $i -lt $trs.length; $i++){ #Going over every tr element

    #Get every td element of current tr element
    $tds = $page.getElementsByTagName("td")

    #Want to separate start time and end time from one time field
    $Times = $tds[5].innerText.split(" ")

    $FullTable += [pscustomobject]@{
        "Class Code" = $tds[0]; `
        "Title" = $tds[1];`
        "Days" = $tds[4];`
        "Time Start" = $Times[5];`
        "Time End" = $Times[5];`
        "Instructor" = $tds[6];`
        "Location" = $tds[9];`
        }
}
return $FullTable
}