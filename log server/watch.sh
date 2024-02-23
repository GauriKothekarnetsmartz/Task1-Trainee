#!/bin/bash

# Function to count errors in a log file
count_errors() {
    # Count occurrences of "ERROR" in the log file
    error_count=$(grep -c "ERROR" "$1")
    # Print error count in red if it exceeds 100
    if ((error_count > 100)); then
        printf "\e[31m" # Set text color to red
        echo "Error count in $1: $error_count" # Print error count
        printf "\e[0m" # Reset text color
        webhook_url="https://hooks.slack.com/services/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"


# Define the message to send
message="Error limit exceeds! "$file" "

# Construct the payload for the Slack webhook
payload="payload={\"text\": \"$message\"}"

# URL-encode the payload
payload=$(echo "$payload" | sed 's/"/\"/g' | sed "s/'/\\'/g" | sed ':a;N;$!ba;s/\n/\\n/g')

# Send the message to Slack
curl -X POST -H 'Content-type: application/x-www-form-urlencoded' --data-urlencode "$payload" "$webhook_url"


    else
        echo "Error count in $1: $error_count"
    fi
    
}

# Function to display menu of log files
display_menu() {
    while true; do
        echo "Choose a log file to monitor:"
        select file in *.txt; do
            if [ -n "$file" ]; then
                clear
                echo "Monitoring $file. Press any key to exit."
                # Continuously monitor the log file
                while true; do
                    count_errors "$file"
                    tail -n 10 "$file" # Print last 10 lines of the log file
                    sleep 1
                    clear
                done
            else
                echo "Invalid option. Please choose a valid log file."
            fi
        done
    done
}

# Main function
main() {
    display_menu
}

# Call the main function
main

