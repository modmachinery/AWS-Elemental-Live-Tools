#!/bin/env bash
#
## 1. Save this script to: /usr/local/bin/dnf-autoupdate.sh
## 2. Make executable:
##    sudo chmod +x /usr/local/bin/dnf-autoupdate.sh
## 3. Edit crontab and add the line without '#' (or devise your own schedule):
##    sudo nano /etc/crontab
#7 7 * * sun	root		/usr/local/bin/dnf-autoupdate > /dev/null 2>&1
#
## This example runs every Sunday at 7:07 AM local time.

dnf update -qy
dnf upgrade -qy
