#!/bin/bash
picom &
# $HOME/scripts/wallpaper/wallpaper_timer.sh &
# xfce4-power-manager &
# /usr/lib/mate-polkit/polkit-mate-authentication-agent-1 & 
# dwmblocks &
/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &

while xsetroot -name "`date +"%m/%d/%Y %I:%M %p"`"
do
   sleep 60
done &

