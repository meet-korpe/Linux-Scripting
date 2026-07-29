#!/bin/bash

# Method 1: Using 'echo' and 'read' separately
echo "Enter your age: "
read age
echo "Your age is: ${age}"

# Method 2: Using the -p flag to prompt and save input directly
read -p "Enter your name: " name
echo "Your name is: ${name}"