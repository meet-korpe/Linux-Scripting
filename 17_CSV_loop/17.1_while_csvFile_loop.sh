#!/bin/bash

# Use awk to skip the header, then pipe the remaining data into the while loop
cat /images/employee.csv | awk 'NR!=1 {print}' | while IFS="," read id name age
do
    echo "Name is: $name"
done