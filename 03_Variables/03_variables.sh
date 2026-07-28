#!/bin/bash

# Defining a regular variable
age=21

# Defining a constant variable
readonly name="meet"

# This assignment would fail because 'name' is readonly
# name="msk"

hostName=$(hostname)

echo "My name is $name and my age is $age"
echo "Device name is $hostName"