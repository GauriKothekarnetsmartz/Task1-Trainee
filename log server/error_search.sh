#!/bin/bash

# Function to search for error patterns and extract corresponding log entries
search_and_extract_errors() {
    local log_file="$1"
    local error_suffix="$2"

    # Search for error patterns with the specified suffix and extract corresponding log entries
    grep -E "\[ERROR$error_suffix\]" "$log_file"
}

# Function to enumerate log files
enumerate_log_files() {
    local log_dir="$1"
    local file_count=0

    # List log files in the directory with enumeration
    for log_file in "$log_dir"/*.txt; do
        ((file_count++))
        echo "[$file_count] $(basename "$log_file")"
    done
}

# Main script
log_dir="/home/gauri/Desktop/Assignment1Gauri/log server"

# List log files in the directory with enumeration
echo "Available log files:"
enumerate_log_files "$log_dir"

# Prompt user to choose a log file
read -p "Enter the number corresponding to the log file you want to search: " file_number

# Validate input file number
if ! [[ "$file_number" =~ ^[0-9]+$ ]]; then
    echo "Invalid input. Please enter a valid number."
    exit 1
fi

# Get the selected log file based on the input file number
selected_file=$(ls "$log_dir"/*.txt | sed -n "${file_number}p")

# Prompt user to input the error suffix
read -p "Enter the suffix after 'error' to search for (e.g., 404, 405): " error_suffix

# Call function to search for error patterns and extract corresponding log entries
search_and_extract_errors "$selected_file" "$error_suffix"

