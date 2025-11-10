#! /bin/bash

authfile="/var/log/auth.log"

function getLogins(){
 logline=$(cat "$authfile" | grep "systemd-logind" | grep "New session" | grep "champuser")
 dateAndUser=$(echo "$logline" | cut -d' ' -f1,2,3,11 | tr -d '\.' | tr ':' '-' )
 echo "$dateAndUser"
}

function getFailedLogins(){
# Todo - 1
# a) Make a little research and experimentation to complete the function
# b) Generate failed logins and test
logline2=$(cat "$authfile" | grep "authentication failure")
dateAndUser2=$(echo "$logline2" | cut -d' ' -f1,2,3,16 | tr ':' '-')
echo "$dateAndUser2"
}

# Sending logins as email - Do not forget to change email address
# to your own email address
echo "To: nathan.kreit@mymail.champlain.edu" > emailform.txt
echo "Subject: Logins" >> emailform.txt
getLogins >> emailform.txt
cat emailform.txt | ssmtp nathan.kreit@mymail.champlain.edu

# Todo - 2
# Send failed logins as email to yourself.
# Similar to sending logins as email
echo "To: nathan.kreit@mymail.champlain.edu" > emailform.txt
echo "Subject: Failed logins" >> emailform.txt
getFailedLogins >> emailform.txt
cat emailform.txt | ssmtp nathan.kreit@mymail.champlain.edu

