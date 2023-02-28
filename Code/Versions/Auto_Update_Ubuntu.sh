#!/bin/bash

# Set variables for header and log file
HEADER="it2grow v1.0.10 - Auto Update for Ubuntu\linux"
LOG_FILE="$(date +%Y-%m-%d)-update-log.txt"
IP_ADDR=$(hostname -I | cut -d' ' -f1)
HOSTNAME=$(hostname)
Step1="\n=======Step 1 - Update list with available Ubuntu packages...     ======="
Step2="\n\n=======Step 2 - Start instalation of packages....               ======="
Step3="\n\n=======Step 3 - Creating log file.....                          ======="

# Output header to console
echo "$HEADER"
echo "Date of Update: $(date)"
echo "IP Address: $IP_ADDR"
echo "Hostname: $HOSTNAME"


# Update packages
echo -e "$Step1" >> $LOG_FILE
sudo apt update >> "$LOG_FILE" 2>&1

# Upgrade packages
echo -e "$Step2" >> $LOG_FILE
sudo apt upgrade -y >> "$LOG_FILE" 2>&1

# Remove unnecessary packages
sudo apt autoremove -y >> "$LOG_FILE" 2>&1

# Clean up
sudo apt clean >> "$LOG_FILE" 2>&1

echo -e "$Step3" >> $LOG_FILE
# Format log file by replacing commas with newlines
sed -i 's/,/\n/g' "$LOG_FILE"

# Add header to log file
echo -e "$HEADER\nDate of Update: $(date)\n $IP_ADDR \n $HOSTNAME" | cat - "$LOG_FILE" > temp && mv temp "$LOG_FILE"

# Export log file to home folder of the user
cp "$LOG_FILE" ~/

# Output message to console
echo "Update complete. Log file exported to home folder."
