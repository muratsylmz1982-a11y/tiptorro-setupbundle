#!bin/bash
chmod u+x 9100Single.sh

#=================================
#Check argv
#================================
CMDNAME=`basename $0`
if [ $# -ne 2 ]; then   
  echo "Usage: /bin/bash $CMDNAME \"IPAddress\" \"login root Password\""
  exit 1
fi


#=================================
#Check ping command
#=================================
ping -c 1 $1 > /dev/null

if [ $? == 0 ];
then 
 echo "$1 is connected."
else
 echo "$1 is not connected."
 exit 1
fi

#=========================================
#Display IPAddress, loginID, loginPassword
#==========================================
ipaddress=$1
login=root
password=$2

echo ================================
echo IP Address: $ipaddress

echo login ID: $login

echo Password: $password
echo ===============================

#=====================================
#Set #9100 Single Sessison
#=====================================

expect -c "
set timeout 3
spawn telnet $ipaddress

expect \"login:\"
send \"$login\r\"

expect \"password:\"
send \"$password\r\"


#Main Menu
#Select System Configuration
expect \"=== Main Menu ===\"
send \"2\r\"


#System Configuration Menu
#Select 9100 Single Session
expect \"=== System Configuration Menu ===\"
send \"2\r\"


#9100 Multi Session
#Select DISABLE
expect \"=== #9100 Multi Session ===\"
send \"2\r\"


#System Configuration
#Select Back to Main Menu
expect \"=== System Configuration Menu ===\"
send \"99\r\"


#Main Menu
#Select Save & Restart
expect \"=== Main Menu ===\"
send \"98\r\"


#Main Menu
#Select Save & Restart device
expect \"=== Save to NVRAM & Restart Printer Menu ===\"
send \"2\r\"

interact
"
