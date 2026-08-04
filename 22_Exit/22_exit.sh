#!/bin/bash

# Exit the script if no arguments are passed
if [[ $# -eq 0 ]]
then
    echo "Please provide atleast one argument"
    exit 1
fi

# To access the arguments individually
echo "Username is: $1"
echo "Age is: $2"

# To access metadata about the arguments
echo "All the arguments: $@"
echo "Number of arguments: $#"

# Looping through all provided arguments
for arg in $@
do
    echo "Argument: $arg"
done