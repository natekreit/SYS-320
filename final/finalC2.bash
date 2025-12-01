# Write a Linux Bash Script that lists the apache logs that contain indicators of compromise

logFile=$1
iocFile=$2

cat "$logFile" | grep -i -f "$iocFile" | cut -d' ' -f1,4,7 | tr -d '[' > report.txt
