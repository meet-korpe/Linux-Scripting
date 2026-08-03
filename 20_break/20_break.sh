#!/bin/bash

# Example of break in loop
# We need to confirm if the given no. is present or not

no=7

for i in 1 2 3 4 5 6 7 8 9 10
do
    # Check if current number matches our target
    if [[ $no -eq $i ]]
    then
        echo "$no is found"
        break  # Exits the loop immediately
    fi
    echo "Number is: $i"
done