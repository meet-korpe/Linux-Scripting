#!/bin/bash

set -e
set -x

echo "Starting the demo"
mkdir -p demo_output
touch demo_output/example.txt
ls demo_output

# Uncomment the next line to see set -e stop the script immediately.
# ls /does-not-exist

echo "Script finished successfully"