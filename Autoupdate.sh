#!/bin/bash
if [ $(date +\%u) -eq 3 ] && [ $(date +\%d) -le 07 ]; then
  sudo apt update && sudo apt upgrade -y
fi

