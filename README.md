## Auto Updater for Ubuntu
## What to do?


1.  Put AutoUpdateUbuntu.sh in /home/<user> folder
2.  Give AutoUpdateUbuntu.sh the correct acces rights. sudo chmod +x Auto_Update_Ubuntu.sh
3.  sudo crontab -e
4.  Add 0 0 1-7 * * [ $(date +\%w) -eq 3 ] && /path/to/Auto_Update_Ubunutu.sh' to the last line and save
5.  

