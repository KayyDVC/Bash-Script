#---------------------------------------------------------------¬
#	Authors:  	Malakai Stanisclaus			|
#	Date created:	11/8/21				|
#	Purpose:	To Fix The "Hold for authentication" error on Mac OS	|
#   Source Code From: https://www.papercut.com/kb/Main/HoldforAuthentication#what-does-ldquo-hold-for-authentication-rdquo-mean
#
#---------------------------------------------------------------┘
#!/bin/bash

sudo -v #Gives 5 minutes until the user must enter their PW for sudo perms again; If this time is not enough, the terminal will prompt for pw again and reset the timer.

printers=`lpstat -s| grep -w -o "[%_[:alnum:]]*HP_[%_[:alnum:]]*"` #Change 'HP_' portion to general starting pattern of Canon Printers.
#Creates an array of printer names (ie Canon%20Psychology)

#[%_[:alnum:]]* should allow for % signs, integers, and letters (UNTESTED)

echo $printers #Used for testing, to be commented out.

for printer in $printers
do
    echo "sudo lpadmin -p ${printer[@]} -o auth-info-required=username,password" #remove echo and quotes after testing 

done

echo "Please attempt a test print on the affected printer."

echo "Please also note that all Canon Printers will prompt for TRACKS username and password on first use."