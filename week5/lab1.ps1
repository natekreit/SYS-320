#Lab1

#Part 1
$scraped_page = Invoke-WebRequest -TimeoutSec 10 http://10.0.17.43/ToBeScraped.html

#Get a count of the links in the page
#$scraped_page.Links.Count



#Part 2
#Get the links as HTML elements
#$scraped_page.Links


#Part 3
#Display only URL and its text
#$scraped_page.Links | Select outerText, href | Format-List


#Part 4
#Get outer text of every element with the tag h2
#$h2s=$scraped_page.ParsedHtml.body.getElementsByTagName("h2") | Select outerText
#$h2s


#Part 5
#Print innerText of every div element that has the class as "div-1"
$divs1=$scraped_page.ParsedHtml.body.getElementsByTagName("div") | where {
$_.getAttributeNode("class").value -ilike "div-1"} | select innerText
$divs1