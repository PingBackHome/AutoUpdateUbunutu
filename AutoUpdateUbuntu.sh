#!/bin/bash

# Set variables for header and log file
HEADER="IT2Grow v1.0.0 - Update Log"
LOG_FILE="$(date +%Y-%m-%d)-update-log.txt"
Step1="=======Step 1 - Update list with available Ubuntu packages ======="
Step2="=======Step 2 - Start instalation of packages ======"
Step3="=======Step 3 - Run packages instalation again to create output ======"

# Output header to console
echo "$HEADER"
echo "Date of Update: $(date)"
echo -e "$Step1"

# Update packages
sudo apt update >> "$LOG_FILE" 2>&1

echo -e "$Step2"
# Upgrade packages
sudo apt upgrade -y >> "$LOG_FILE" 2>&1

# Remove unnecessary packages
sudo apt autoremove -y >> "$LOG_FILE" 2>&1

# Clean up
sudo apt clean >> "$LOG_FILE" 2>&1

echo -e "$Step3"
# Format log file by replacing commas with newlines
sed -i 's/,/\n/g' "$LOG_FILE"

# Add header to log file
echo -e "$HEADER\nDate of Update: $(date)\n $Step1 \n $Step2 \n $Step3 \n" | cat - "$LOG_FILE" > temp && mv temp "$LOG_FILE"

# Export log file to home folder of the user
cp "$LOG_FILE" ~/

# Output message to console
echo "Update complete. Log file exported to home folder."
