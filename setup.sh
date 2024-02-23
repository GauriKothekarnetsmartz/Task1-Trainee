#!/bin/bash

# Specify the repository URL
REPO_URL="https://github.com/GauriKothekarnetsmartz/Task1-Trainee.git"

# Specify the target folder name
TARGET_FOLDER="setup_folder"

# Function to perform setup
setup() {
    # Check if the target folder already exists
    if [ -d "$TARGET_FOLDER" ]; then
        echo "Deleting previous $TARGET_FOLDER..."
        rm -rf "$TARGET_FOLDER"
    fi

    # Clone the repository
    echo "Cloning repository into $TARGET_FOLDER..."
    git clone "$REPO_URL" "$TARGET_FOLDER"
}

# Execute setup function
setup

