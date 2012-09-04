#!/bin/bash

# Script to randomly set Background from files in a directory

# Directory Containing Pictures
DIR="/home/garry/Pictures/"

# Command to Select a random jpg file from directory
# Delete the *.jpg to select any file but it may return a folder
PIC=$(ls $DIR/*.jpg | shuf -n 1)

# Command to set Background Image
feh --bg-fill $PIC


#Uncomment this snippet to randomly change wallapaer without cron job.
###-#!/bin/bash
###-#
###-# Randomly display a wallpaper every 30 minutes.
###-
###-while true;
###-do
###-   find $HOME/.wallpapers -type f -name '*.jpg' -o -name '*.png' | shuf -n 1 | xargs feh --bg-scale
###-   sleep 30m
###-done &
