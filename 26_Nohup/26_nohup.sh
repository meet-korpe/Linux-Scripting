#!/bin/bash

echo "Starting nohup demo"

# Run a command in the background and keep it alive after logout.
nohup bash -c 'for i in 1 2 3 4 5; do echo "Log line $i"; sleep 1; done' > nohup_demo.out 2>&1 &

echo "Background process started"
echo "Output will be written to nohup_demo.out"
echo "Check the process with: ps -ef | grep bash"