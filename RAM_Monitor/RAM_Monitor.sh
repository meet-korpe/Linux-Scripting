#!/bin/bash

Free_Space=$(free -mt | grep "Total" | awk '{print $4}')
Threshold=1000

if [[ $Free_Space -lt $Threshold ]]
then
    echo "Warning: Low RAM available. Free space is ${Free_Space} MB."
else
    echo "RAM is sufficient. Free space is ${Free_Space} MB."
fi