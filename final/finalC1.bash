# Write a Linux Bash Script that obtains IOC from the given web page (10.0.17.47/IOC.html)
# and save it to a file called IOC.txt.

webpage=$(curl -s http://10.0.17.47/IOC.html)

compromises=$(echo "$webpage" | grep -oP '(?<=<td>).*?(?=</td>)' | sed -n '1~2p')

echo "$compromises" > IOC.txt
