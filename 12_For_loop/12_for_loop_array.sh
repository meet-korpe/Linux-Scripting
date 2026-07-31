#!/bin/bash

# Define an array with different data types
myArray=( 1 2 3 Hi Hello )

# Get the length of the array
length=${#myArray[*]}

# Iterate using the index
for (( i=0; i<$length; i++ ))
do
    echo "Value of array is: ${myArray[i]}"
done