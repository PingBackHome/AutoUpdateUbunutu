#!/bin/bash
if [ $(date +\%u) -eq 3 ] && [ $(date +\%d) -le 07 ]; then
  LOG_FILE="$HOME/update.log"
  sudo apt update | sed 's/, /\'$'\n/g' > $LOG_FILE
  sudo apt upgrade -y | sed 's/, /\'$'\n/g' >> $LOG_FILE
fi
