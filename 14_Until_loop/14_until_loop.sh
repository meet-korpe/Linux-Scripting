#!/bin/bash

a=10

# The loop runs until a is equal to 1
until [[ $a -eq 1 ]]
do
    echo "Number is: $a"
    # Decrement the variable
    let a--
done