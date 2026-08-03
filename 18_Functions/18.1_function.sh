#!/bin/bash

# Defining a function that accepts two arguments
welcomeNote() {
    echo "Username is: $1"
    echo "Age is: $2"
}

# Calling the function with different values
welcomeNote Meet 21
welcomeNote Sahil 22
welcomeNote Rohan 24