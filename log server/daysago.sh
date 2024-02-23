#!/bin/bash

# Function to search logs from specified number of days before
search_logs_days_before() {
    local days_before=$1
    local log_file=$2

    # Calculate the date for the specified number of days before
    local target_date=$(date -d "$days_before days ago" "+%Y-%m-%d")

    # Search for log entries matching the target date
    grep "$target_date" "$log_file"
}

while true; do
    # List log files in the directory
    echo "Available log files:"
    ls -1 /home/gauri/Desktop/Assignment1Gauri/log\ server/*.txt

    # Prompt user to input the log file they want to search
    read -p "Enter the log file you want to search (or type 'exit' to quit): " log_file

    if [ "$log_file" = "exit" ]; then
        echo "Exiting..."
        break
    fi

    # Prompt user to input the number of days before
    read -p "Enter the number of days before: " days_before

    # Call function to search logs from specified number of days before
    search_logs_days_before "$days_before" "$log_file"
done

