#!/bin/bash

# Using elif

read -p "Enter your JEE Main's percentile: " p

if [[ $p -gt 90 ]]
then
    echo "You are selected for Jee Advance"
elif [[ $p -gt 40 ]]
then
    echo "You have cleared JEE Main's, but have not been selected for JEE Advance"
else
    echo "You have not cleared JEE Main's"
fi