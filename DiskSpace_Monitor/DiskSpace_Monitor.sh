#!/bin/bash

#monitor the free fs space disk
FU=$(df -H | egrep -v "Filesystem|tmpfs" | grep "sda1" | awk '{ print $5}' | tr -d '%')

# POSTFIX needs to be installed on the system to send email alerts
TO=meetkorpe079@gmail.com

if [[  $FU -lt 10 ]]
then
    echo "Disk space is critically low. Only $FU% remaining." | mail -s "Disk Space Alert" $TO
else
    echo "Disk space is sufficient. $FU% remaining."
fi