#!/bin/bash

read -p "Enter your age: " age

# If age >= 18, print "Adult", else print "Minor"
[[ $age -ge 18 ]] && echo "Adult" || echo "Minor"