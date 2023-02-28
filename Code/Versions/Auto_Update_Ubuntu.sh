#!/bin/bash

# Set variables for header and log file
HEADER="it2grow v1.0.10 - Auto Update for Ubuntu\linux"
LOG_FILE="$(date +%Y-%m-%d)-update-log.txt"
Step1="\n=======Step 1 - Update list with available Ubuntu packages...   ======="
Step2="\n\n=======Step 2 - Start instalation of packages....               ======="
Step3="\n\n=======Step 3 - Creating log file, please wait....              ======="

# Output header to console
echo "$HEADER"
echo "Date of Update: $(date)"


# Update packages
echo "$Step1" >> $LOG_FILE
sudo apt update >> "$LOG_FILE" 2>&1

# Upgrade packages
echo "$Step2" >> $LOG_FILE
sudo apt upgrade -y >> "$LOG_FILE" 2>&1

# Remove unnecessary packages
sudo apt autoremove -y >> "$LOG_FILE" 2>&1

# Clean up
sudo apt clean >> "$LOG_FILE" 2>&1

echo "$Step3" >> $LOG_FILE
# Format log file by replacing commas with newlines
sed -i 's/,/\n/g' "$LOG_FILE"

# Add header to log file
echo -e "$HEADER\nDate of Update: $(date)\n $Step1 \n $Step2 \n $Step3 \n" | cat - "$LOG_FILE" > temp && mv temp "$LOG_FILE"

# Export log file to home folder of the user
cp "$LOG_FILE" ~/

# Output message to console
echo "Update complete. Log file exported to home folder."
