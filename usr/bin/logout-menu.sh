#!/usr/bin/env bash


playerctl -a pause

options="Screen Lock \nLogout 󰍃\nSleep 󰤄\nShutdown ⏻\nRestart "

choice=$(printf "$options" | fuzzel --dmenu --prompt=" ⏻  " | awk '{print $1}')


case $choice in
    Shutdown)
        echo "Shutting down.."
        systemctl shutdown 
        ;;
    Restart)
        echo "Restarting!"
        systemctl reboot 
        ;;
    Screen)
        echo "Screenlock!"
        /usr/bin/lock.sh 
        ;;
    Sleep)
        echo "Suspend"
        systemctl suspend
        ;;
    Logout)
        echo "Logout"
        loginctl terminate-user $USER
esac
