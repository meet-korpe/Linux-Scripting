#!/bin/bash

echo "Username is: $1"
echo "Age is: $2"

echo "All the arguments: $@"
echo "Number of arguments: $#"

# Looping through all provided arguments
for arg in $@
do
    echo "Argument: $arg"
done

# Execution: bash 19.1_argument.sh Meet 21 Sahil 22 Rohan 24 Nihar 23