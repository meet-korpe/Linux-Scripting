# 38. Using crontab

`crontab` is used to schedule recurring tasks in Linux.

## What crontab Does

With `crontab`, you can run commands or scripts automatically at fixed times, every minute, every day, or on specific dates.

## Cron Format

A cron entry usually follows this pattern:

```bash
minute hour day_of_month month day_of_week command
```

## Example Script (28_crontab.sh)

This script prints a sample cron entry and reminds you of the common crontab commands.

```bash
#!/bin/bash

echo "Crontab example"

# Example cron entry that runs every day at 9:00 AM.
echo "0 9 * * * /home/user/backup.sh"

echo "Use crontab -e to edit the schedule"
echo "Use crontab -l to list the current cron jobs"
```

## Important Points

* `crontab -e` opens the cron table for editing.
* `crontab -l` lists the current scheduled jobs.
* Cron is useful for repeating tasks like backups, cleanup, and reports.

## How to Run

```bash
bash 28_crontab.sh
```

To edit your actual cron jobs, run:

```bash
crontab -e
```