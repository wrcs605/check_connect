# check_connect.sh

---NOTE---
ONLY USE THIS SCRIPT IF YOU PLAN ON ONLY CONNECTING TO THE TARGET HUB AND THE TARGET HUB ONLY!!!!


MANUALLY CONNECTING TO ANY OTHER HUB WITH THIS SCRIPT ACTIVE WILL CAUSE UNWANTED BRIDGING AND CAUSE BIG ISSUES!!!!!

## Check Connection and Re-Connect Script

SSH into node and open bash shell or command line interface and type the following:

## Hamvoip Step 1
cd /etc/asterisk/local

sudo nano check_connect.sh

## ASL3 Step 1
cd /etc/asterisk

sudo mkdir local

cd /etc/asterisk/local

sudo nano check_connect.sh

## Same for both Hamvoip AND ASL3 Step 2

Paste the following text into the blank file you just created.

Please make sure it copy's over EXACTLY AS SHOWN BELOW! 

#!/bin/bash

#Check Connection to a designated AllStarLink node and reconnect if disconnected 

#Set your AllStarLink node number and the target node number you want to check to the connection

#Change xxxx to the node number on this radio

#Change xxxxx to the node number you want to perm connect to

MY_NODE=xxxx

TARGET_NODE=xxxxx



#Check if the target node is connected

if ! /usr/sbin/asterisk -rx "rpt lstats $MY_NODE" | grep -q "$TARGET_NODE"; then

  echo "Node $MY_NODE is not connected to node $TARGET_NODE. Reconnecting..."

 sudo /usr/sbin/asterisk -rx "rpt fun $MY_NODE *3$TARGET_NODE" 

else

   echo "Node $MY_NODE is already connected to node $TARGET_NODE."

 fi

 --- Once done, press ctrl and x to close, Y to confirm and enter to save.

 ## make script executable

 sudo chmod +x check_connect.sh

 ## This next step will run the script every 10 min. to check for connection

 sudo crontab -e

 --- paste the following command at the bottom of the file.

*/10 * * * * /etc/asterisk/local/check_connect.sh

--- This is set to run every 10 min, to alter the time, change the 10 to any minuite between 1 and 59.

ctrl+x , y , enter to save

