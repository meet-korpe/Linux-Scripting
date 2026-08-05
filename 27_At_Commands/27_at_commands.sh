#!/bin/bash

echo "Starting at command demo"

# Schedule a one-time job to run after 1 minute.
echo 'echo "This job was scheduled with at"' | at now + 1 minute

echo "Current queued jobs:"
atq

echo "To remove a job, use atrm with the job number shown by atq"
echo "Example: atrm 3"