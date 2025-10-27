#!/bin/bash

pageLogs=""
file="/var/log/apache2/access.log"


function pageCount(){
pageLogs=$(cat "$file" | cut -d' ' -f7 | sort | uniq -c)
}

pageCount

echo "$pageLogs"
