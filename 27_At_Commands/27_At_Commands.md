# 37. Using at, atq, and atrm

The `at` family of commands is used to schedule one-time jobs in Linux.

## `at`

`at` schedules a command or script to run later at a specific time.

## `atq`

`atq` shows the jobs currently waiting in the at queue.

## `atrm`

`atrm` removes a scheduled at job from the queue.

## Example Script (27_at_commands.sh)

This script schedules a simple message, lists the queued jobs, and shows how to remove one.

```bash
#!/bin/bash

echo "Starting at command demo"

# Schedule a one-time job to run after 1 minute.
echo 'echo "This job was scheduled with at"' | at now + 1 minute

echo "Current queued jobs:"
atq

echo "To remove a job, use atrm with the job number shown by atq"
echo "Example: atrm 3"
```

## Important Points

* `at` is for one-time scheduled jobs, not recurring jobs.
* `atq` helps you see the job ID and scheduled time.
* `atrm` cancels a queued job using its job number.

## How to Run

```bash
bash 27_at_commands.sh
```

If you want to remove a queued job, first check the job number with `atq`, then run:

```bash
atrm <job_number>
```