#!/bin/bash

echo "Crontab example"

# Example cron entry that runs every day at 9:00 AM.
echo "0 9 * * * /home/user/backup.sh"

echo "Use crontab -e to edit the schedule"
echo "Use crontab -l to list the current cron jobs"