#!/bin/bash

file="/var/log/apache2/access.log"

function countingCurlAccess(){
curlLogs=$(cat "$file" | cut -d' ' -f1,12 | grep "curl" | sort | uniq -c)
}

countingCurlAccess

echo "$curlLogs"
