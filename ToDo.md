## Auto Updater for Ubuntu
## What to do?


1.  Put AutoUpdateUbuntu.sh in /home/veeamadmin folder
2.  Give AutoUpdateUbuntu.sh the correct acces rights. sudo chmod +x AutoUpdateUbuntu.sh
3.  sudo crontab -e
4.  Add 0 0 1-7 * * [ $(date +\%w) -eq 3 ] && /path/to/update_script.sh' to the last line and save
5.  

