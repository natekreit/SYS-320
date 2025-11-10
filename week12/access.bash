echo "File was accessed $(date)" >> /home/champuser/SYS-320/week12/fileaccesslog.txt

echo "To:nathan.kreit@mymail.champlain.edu" > emailform.txt
echo "Subject: File access logs" >> emailform.txt
cat fileaccesslog.txt | tr ':' '-' >> emailform.txt
cat emailform.txt | ssmtp nathan.kreit@mymail.champlain.edu
