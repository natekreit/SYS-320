# Write a Linux Bash Script that takes the report.txt from the previous challenge and turns
# it to a HTML report. The report should then be moved to /var/www/html directory.

firstFile="report.txt"
secondFile="/var/www/html/report.html"


echo "<html><body><table border='1' cellspacing='5'>" > $secondFile

while IFS= read -r line
	do
		echo "<tr><td>$line</td></tr>" >> $secondFile
	done < "$firstFile"

echo "</table></body></html>" >> $secondFile
