#!/bin/bash

# The loop reads every line from names.txt until the end of the file
while read myVar
do
    echo "Name is: $myVar"
done < /images/names.txt