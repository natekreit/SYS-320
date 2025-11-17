#!/bin/bash

link="10.0.17.47/Assignment.html"

sourceFile=$(curl -sL "$link")

# Scrape temperature table
tempData=$(echo "$sourceFile" | xmlstarlet format --html --recover 2>/dev/null | \
xmlstarlet sel -t -v "//html//body//table[@id='"temp"']" 2>/dev/null | sed 's/&#13;//g' | awk '(NF>0){print $1}' | \
awk '{ if (NR%2 == 1) {line = $0} else { print line " " $0 } }' | tail -n +2)

# Scrape pressure table
pressData=$(echo "$sourceFile" | xmlstarlet format --html --recover 2>/dev/null | \
xmlstarlet sel -t -v "//html//body//table[@id='"press"']" 2>/dev/null | sed 's/&#13;//g' | awk '(NF>0){print $1}' | \
awk '{ if (NR%2 == 1) {line = $0} else { print line " " $0 } }' | cut -d' ' -f1 | tail -n +2)


# Making a counter for the pressure output
counter=1


# Merged table
echo "$tempData" | while read -r temp; do
	singlepressData=$(echo "$pressData" | head -$counter | tail -1)
	echo "$singlepressData $temp"
	counter=$((counter+1))
done
