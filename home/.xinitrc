#!/bin/bash
#
# ~/.xinitrc
#

##__________________________Universal Settings_____________________##

/home/garry/.scripts/xflux -l 26.4711748 -g 80.3325627 -k 4000 &		## so that my eyes does'nt bleed
/usr/bin/urxvtd -q -o -f &							## rxvt-unicode (terminal emulator) daemon
xset +fp /usr/share/fonts/local/ &						## Font Setting
#xset fp rehash &								## Font Setting
xrdb -load /home/garry/.Xresources 						## Load settings for urxvt
start-pulseaudio-x11 &								## Start Pulseaudio Sound Server
mpd &										## Music Player Daemon
###xscreensaver -nosplash 2>&1>> /dev/null &					## Start screensaver

##_________________________________________________________________##


##_________________________Start DWM____________________________##

exec ck-launch-session dbus-launch --sh-syntax --exit-with-session /home/garry/.scripts/startdwm

##_________________________________________________________________##


##_________________________Start XFCE______________________________##

#/usr/bin/tint2 &
#/opt/dropbox/dropbox &
#/usr/bin/volumeicon &
#exec ck-launch-session dbus-launch startxfce4
