#!/bin/bash

# Reading from a CSV file and assigning columns to variables
while IFS="," read id name age
do
    echo "Name is: $name"
done < /images/employee.csv