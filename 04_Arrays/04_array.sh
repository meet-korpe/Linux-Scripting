#!/bin/bash

# Array definition and basic access
myArray=( 1 20 35.7 Hello "Meet_Korpe" )
echo "All the values in an Array: ${myArray[*]}"
echo "Value at 3rd index of array: ${myArray[3]}"
echo "Values from index 2 to 3: ${myArray[*]:2:2}"

# Finding array length
echo "Number of values, length of an array: ${#myArray[*]}"

# Updating the array
myArray+=( msk 7 8 )
echo "Values of new Array: ${myArray[*]}"

# Key-value pair (Associative Array)
declare -A yourArray
yourArray=( [name]=Meet [age]=21 [city]=Mumbai )
echo "Name is: ${yourArray[name]}"
echo "City is: ${yourArray[city]}"