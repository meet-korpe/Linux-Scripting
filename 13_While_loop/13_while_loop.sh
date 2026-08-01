#!/bin/bash

count=0
num=10

# The loop runs as long as count is less than or equal to num
while [ $count -le $num ]
do
    echo "Numbers are $count"

    # Increment the count variable to eventually end the loop
    let count++
done