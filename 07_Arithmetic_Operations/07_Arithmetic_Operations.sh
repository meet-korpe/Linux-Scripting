#!/bin/bash

x=10
y=2

# To perform arithmetic operations use 'let' or (( ))

# Multiplication using 'let'
let mul=$x*$y
echo "Multiplication of $x and $y is: ${mul}"

# Subtraction using 'let' with arithmetic expansion
let sub=$((x-y))
echo "Subtraction of $((x-y)) is: $sub"