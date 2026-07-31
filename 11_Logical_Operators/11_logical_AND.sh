#!/bin/bash

read -p "Enter your age: " age  
read -p "Enter your country name: " country

# Both conditions must be true  
if [[ $age -ge 18 ]] && [[ ${country^^} == "INDIA" ]]  
then  
    echo "You can vote"  
else  
    echo "You cannot vote"  
fi