#!/bin/bash

echo "Hey, provide an option"
echo "a for date"
echo "b for list of scripts"
echo "c to check the current location"

read choice

case $choice in
    a)
        echo "Todays date is:"
        date
        echo "---End---"
        ;;
    b) ls;;
    c) pwd;;
    *) echo "Please provide a valid input"
esac
