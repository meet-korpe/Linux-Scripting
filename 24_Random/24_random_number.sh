#!/bin/bash

# Generating a random number between 1 - 6
NO=$(( $RANDOM%6 + 1 ))

echo "Number is: $NO"