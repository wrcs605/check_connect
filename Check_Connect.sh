#!/bin/bash
#Check Connection to a designated AllStarLink node and reconnect if disconnected 
#Set your AllStarLink node number and the target node number you want to check to the connection
#Change xxxx to the node number on this radio
#Change xxxxx to the node number you want to perm connect to
MY_NODE=xxxx
TARGET_NODE=xxxxx

# Check if the target node is connected
if ! /usr/sbin/asterisk -rx "rpt lstats $MY_NODE" | grep -q "$TARGET_NODE"; then
  echo "Node $MY_NODE is not connected to node $TARGET_NODE. Reconnecting..."
 sudo /usr/sbin/asterisk -rx "rpt fun $MY_NODE *3$TARGET_NODE" 
else
   echo "Node $MY_NODE is already connected to node $TARGET_NODE."
 fi
