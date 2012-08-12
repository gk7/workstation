#!/bin/bash
scrot '%Y-%m-%d-%H:%M:%S_$wx$h_scrot.png' -e 'mv $f /home/garry/Pictures/screenshots && gpicview /home/garry/Pictures/screenshots/$n'
