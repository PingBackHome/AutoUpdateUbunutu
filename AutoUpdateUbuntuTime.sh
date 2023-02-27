#!/bin/bash

# Set variables for header and log file
HEADER="IT2Grow v1.0.0 - Update Log"
LOG_FILE="$(date +%Y-%m-%d)-update-log.txt"

# Output header to console
echo "$HEADER"
echo "Date of Update: $(date)"
START_TIME=$(date +%T)
echo "Start Time of Update: $START_TIME"

# Update packages
sudo apt update >> "$LOG_FILE" 2>&1

# Upgrade packages
sudo apt upgrade -y >> "$LOG_FILE" 2>&1

# Remove unnecessary packages
sudo apt autoremove -y >> "$LOG_FILE" 2>&1

# Clean up
sudo apt clean >> "$LOG_FILE" 2>&1

# Format log file by replacing commas with newlines
sed -i 's/,/\n/g' "$LOG_FILE"

# Get end time of update
END_TIME=$(date +%T)

# Add header to log file
echo -e "$HEADER\nDate of Update: $(date)\nStart Time of Update: $START_TIME\nEnd Time of Update: $END_TIME\n" | cat - "$LOG_FILE" > temp && mv temp "$LOG_FILE"

# Export log file to home folder of the user
cp "$LOG_FILE" ~/

# Output message to console
echo "Update complete. Log file exported to home folder."
