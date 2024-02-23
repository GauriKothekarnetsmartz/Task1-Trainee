#!/bin/bash

# Function to generate a timestamp
generate_timestamp() {
  date +"%Y-%m-%d %H:%M:%S"
}

# Function to generate log entries with random prefixes
generate_log() {
  prefixes=("INFO" "WARNING" "ERROR403" "ERROR404" "ERROR504")
  log_file="$1"
  error_count=0
  error_log="error_log.txt"

  while true; do
    prefix_index=$(( RANDOM % ${#prefixes[@]} ))
    prefix=${prefixes[$prefix_index]}
    timestamp=$(generate_timestamp)
    message="Log message"
    
    # Simulate errors
    if [ "$prefix" == "ERROR" ]; then
      ((error_count++))
      message="Error message"
      echo "[$prefix] $timestamp - $message" >> "$error_log"
    fi
    
    echo "[$prefix] $timestamp - $message" >> "$log_file"
    
    sleep 1  # Adjust sleep duration as needed
  done
}

# Function to create directories and log files
create_directories_and_files() {
  local source_parent_dir="$1"
  local destination_dir="$2"
  num_dirs=$3
  num_logs=$4

  for ((i=1; i<=num_dirs; i++)); do
    dir_name="$source_parent_dir/directory_$i"
    mkdir -p "$dir_name"
    
    for ((j=1; j<=num_logs; j++)); do
      log_file="$dir_name/log_file$j.txt"
      generate_log "$log_file" &
    done
  done
}

# Source and destination directories
source_parent_dir="/home/gauri/Desktop/Assignment1Gauri"
destination_dir="/home/gauri/Desktop/Assignment1Gauri/log server"

# Delay for 15 seconds before starting the main loop
sleep 5

# Initial directory and file numbers
dir_num=1
file_num=1

# Array to keep track of copied files and their last modified timestamps
declare -A copied_files

# Main loop to generate directories and log files, and copy them to the destination directory
while true; do
  create_directories_and_files "$source_parent_dir" "$destination_dir" "$dir_num" "$file_num"
  
  # Copy files from source to destination with directory prefixes
  for source_dir in "$source_parent_dir"/directory_*; do
    directory_name=$(basename "$source_dir")
    for file in "$source_dir"/*.txt; do
      if [ -f "$file" ]; then
        filename=$(basename "$file")
        destination_filename="$directory_name"_"$filename"
        
        # Get the last modified timestamp of the file
        last_modified=$(stat -c %Y "$file")
        
        # Check if the file has been copied before and if it has been modified since then
        if [[ ! "${copied_files[$file]}" || "${copied_files[$file]}" -lt "$last_modified" ]]; then
          cp "$file" "$destination_dir/$destination_filename"
          echo "Copied $filename to $destination_dir/$destination_filename"
          # Update the copied files array with the new timestamp
          copied_files[$file]=$last_modified
        fi
      fi
    done
  done
  
  ((dir_num++))
  ((file_num++))
  sleep 5
done

