#!/bin/bash
## Set the WALLPAPERS variable to the root folder of your images (like the Pictures folder for instance).  This script will automatically look in all subfolders.

WALLPAPERS="/home/garry/Pictures"

## Reformats the path for use with sed

WALLMOD=$(echo $WALLPAPERS | sed -e 's/\//\\\//g')

## Finds all jpg and png files in the current folder and subfolders.  You can add more file types by copying one of the statements below and editing the part after -name.

find $WALLPAPERS -type f -name "*.jpg" | sed -e "s/$WALLMOD//" | sed -e 's/ /\\ /g'> $WALLPAPERS/files.txt
find $WALLPAPERS -type f -name "*.png" | sed -e "s/$WALLMOD//" | sed -e 's/ /\\ /g'>> $WALLPAPERS/files.txt

## ----------------------------------------------------------------- ##

## You should not need to modify anything after this point

RANGE=`wc -l $WALLPAPERS/files.txt | sed -e "s/$WALLMOD\/files.txt//"`
let "range = $RANGE"
let "number = $RANDOM"
let LASTNUM="`cat $WALLPAPERS/.last` + $number"
let "number = $LASTNUM % $RANGE"
echo $number > $WALLPAPERS/.last
FILE=$(sed -n "$number p" $WALLPAPERS/files.txt)
nitrogen --set-zoom-fill --save $WALLPAPERS/$FILE
	  
###-#!/bin/bash
###-#
###-# Randomly display a wallpaper every 30 minutes.
###-
###-while true;
###-do
###-   find $HOME/.wallpapers -type f -name '*.jpg' -o -name '*.png' | shuf -n 1 | xargs feh --bg-scale
###-   sleep 30m
###-done &

