#!/bin/bash

myVar="Hey buddy, how are you?"

# To find the length of the string
myVarLength=${#myVar}
echo "Length of the String is: ${myVarLength} or ${#myVar}"

# To convert the string into uppercase
echo "Upper case is: ${myVar^^}"

# To convert the string into lowercase
echo "Lower case is: ${myVar,,}"

# To replace a word in the string
# Replaces "buddy" with "Meet"
echo "${myVar} : ${myVar/buddy/Meet}"

# To slice a string
# Starts at index 4 and takes 5 characters
echo "A part of the string: ${myVar:4:5}"