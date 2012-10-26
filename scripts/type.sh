#!/bin/bash
ActiveWinID=$(xdotool getwindowfocus)						
WindowIDS=$(xdotool search --class "Keepassx")				
for WinID in $WindowIDS
do
    ## If activewindow is same as thunar window, then
    if [ "$WinID" == "$ActiveWinID" ];then
        echo "Found active keepassx window."
        xdotool type --window "$ActiveWinID" "gauravtrivedi"	
	xdotool key --window "$ActiveWinID" --clearmodifiers "Return"
    fi
done
echo "Keepassx window was not active. Aborting."
exit 1