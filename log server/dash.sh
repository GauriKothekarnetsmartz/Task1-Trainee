#!/bin/bash

# Directory where log files are located
log_dir="/home/gauri/Desktop/Assignment1Gauri/log server/"

progressfile="progress.txt"

# Function to display menu of log files
display_menu() {
    echo "Choose a log file to monitor:"
    select file in "$log_dir"*.txt; do
        if [ -n "$file" ]; then
            clear
            monitor_log "$file"
            break
        else
            echo "Invalid option. Please choose a valid log file."
        fi
    done
}

# Function to monitor a log file
monitor_log() {
    logfile="$1"
    echo "Monitoring $logfile..."
    
    # Check if progress file exists for this logfile, if not create it
    progressfile="$logfile.progress"
    if [ ! -f "$progressfile" ]; then
        echo "0" > "$progressfile"
    fi

    # Read the last scanned line number
    last_line=$(<"$progressfile")

    # Get total lines in the log file
    total_lines=$(wc -l < "$logfile")

    # Check if all lines have been scanned
    if [ "$last_line" -eq "$total_lines" ]; then
        echo "File has already been completely scanned."
        return
    fi

    # Calculate percentage scanned
    percentage=$(awk "BEGIN { pc=100*${last_line}/${total_lines}; i=int(pc); print (pc-i<0.5)?i:i+1 }")

    # Scan new lines from the last scanned line
    tail -n +$((last_line+1)) "$logfile" | while IFS= read -r line; do
        # Process each line here if needed
        # For now, just printing the line
        echo "$line"
        # Increment the scanned line counter
        ((last_line++))
        # Update progress file
        echo "$last_line" > "$progressfile"
        # Print percentage progress
        echo "Progress: $percentage%"
    done

    # If all lines scanned, print completion message, remove progress file and exit
    if [ "$last_line" -eq "$total_lines" ]; then
        echo "File scanning complete."
        rm "$progressfile"
        return
    fi
}

# Main function
main() {
    display_menu
}

# Call the main function
main

