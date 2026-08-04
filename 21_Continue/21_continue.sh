#!/bin/bash

# Example of using continue in loop
# Suppose we only need to print odd numbers

for i in 1 2 3 4 5 6 7 8 9 10
do
    let r=i%2
    if [[ $r -eq 0 ]]
    then
        # If the number is even (remainder is 0), skip to the next iteration
        continue
    fi
    echo "odd no.: $i"
done