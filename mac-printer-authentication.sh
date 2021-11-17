#------------------------------------------------------------------------------------------------------------------------------------|
#	Authors:  	KayyDVC		|
#	Date created:	11/8/21				|
#	Purpose:	To Fix The "Hold for authentication" error on Mac OS	|
#   Source Code From: https://www.papercut.com/kb/Main/HoldforAuthentication#what-does-ldquo-hold-for-authentication-rdquo-mean |
#
#------------------------------------------------------------------------------------------------------------------------------------|
#!/bin/bash

sudo -v #Gives 5 minutes until the user must enter their PW for sudo perms again; If this time is not enough, the terminal will prompt for pw again and reset the timer.

printers=`lpstat -s| grep -w -o "[%_[:alnum:]]*Canon_[%_[:alnum:]]*"` #Creates an array of printer names (ie Canon%20Psychology)

#[%_[:alnum:]]* should allow for % signs, integers, and letters 

#echo $printers #Used for testing, to be commented out.

for printer in $printers
do
    sudo lpadmin -p ${printer[@]} -o auth-info-required=username,password #sets the printer_policy to require user/pw on next print

done

echo "Please attempt a test print on the affected printer."

echo "Please also note that all Canon Printers will prompt for TRACKS username and password on first use."
