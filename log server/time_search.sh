#!/bin/bash

log_dir="/home/gauri/Desktop/Assignment1Gauri/log server"

# List all the text files in the log directory
text_files=$(find "$log_dir" -maxdepth 1 -type f -name "*.txt" -printf "%f\n")

echo "Available log files:"
echo "$text_files"

read -p "Enter the name of the log file you want to search in: " log_file
read -p "Enter start time (HH:MM:SS): " start_time
read -p "Enter end time (HH:MM:SS): " end_time

# Check if the entered log file exists
if [ ! -f "$log_dir$log_file" ]; then
    echo "Error: Log file '$log_file' not found."
    exit 1
fi

# Search for log messages within the specified time range
grep -E "($start_time|$end_time)" "$log_dir$log_file"

