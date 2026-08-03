#!/bin/bash

# To create user, provide username and description
echo "Creating a user"
echo "Username is: $1"

# Shifting moves all subsequent arguments one position to the left
shift
echo "Description is: $@"

# Execution: bash 19.3_shift_argument.sh Meet L3 DevOps Engineer
# In this case, "Meet" is $1. After shift, "L3 DevOps Engineer" becomes $@