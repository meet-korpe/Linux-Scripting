#!/bin/bash

# Getting names from the file - names.txt
File="/root/images/names.txt"

for name in $(cat $File)
do
    echo "Names: $name"
done