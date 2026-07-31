#!/bin/bash

# Using if-else to check passing marks

read -p "Enter your marks: " marks

if [[ $marks -gt 40 ]]
then
    echo "You are Pass"
else
    echo "You are Fail!"
fi