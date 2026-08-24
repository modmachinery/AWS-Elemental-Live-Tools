#!/bin/env bash

## 1. Save this script to: /usr/local/bin/
## 2. Edit crontab and add the line without '#' (or devise your own schedule):
##    This example runs every Sunday at 7:07 AM local time.
##
# sudo nano /etc/crontab
## Add (remove '#'' to uncomment):
#7 7 * * sun	root		/usr/local/bin/dnf-autoupdate > /dev/null 2>&1

dnf update -qy
dnf upgrade -qy
