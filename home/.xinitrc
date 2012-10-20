#!/bin/bash
#
# ~/.xinitrc
#

##__________________________Universal Settings_____________________##

mpd &										## Music Player Daemon
redshift -l 26.47:80.33 -t 6500:4400 &						## so that my eyes does'nt bleed
urxvtd -q -o -f &								## rxvt-unicode (terminal emulator) daemon
xset +fp /usr/share/fonts/local/ &						## Font Setting
xrdb -load /home/garry/.Xresources 						## Load settings for urxvt
##_________________________________________________________________##


##_________________________Start DWM____________________________##

exec ck-launch-session dbus-launch --sh-syntax --exit-with-session /home/garry/.scripts/startdwm

##_________________________________________________________________##

