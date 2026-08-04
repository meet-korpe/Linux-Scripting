#!/bin/bash

# Prompt the user for the website they want to check
read -p "Which site do you want to check? " site

# Ping the site exactly once (-c 1)
ping -c 1 $site

# Check if the ping command was successful
if [[ $? -eq 0 ]]
then
    echo "Successfully connected to $site"
else
    echo "Unable to connect to $site"
fi