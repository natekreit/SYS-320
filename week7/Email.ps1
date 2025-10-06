function SendAlertEmail($Body){

$From = "nathan.kreit@mymail.champlain.edu"
$To = "nathan.kreit@mymail.champlain.edu"
$Subject = "Suspicious Activity"

$Password = "password" | ConvertTo-SecureString -AsPlainText -Force
$Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $From, $Password

Send-MailMessage -From $From -To $To -Subject $Subject -Body $Body -SmtpServer "smtp.gmail.com" `
-port 587 -UseSsl -Credential $Credential
}

#sendAlertEmail "Body of email"