#!/usr/bin/env bash


playerctl -a pause

options="Screen Lock \nLogout 󰍃\nSleep 󰤄\nShutdown ⏻\nRestart \nBIOS "

choice=$(printf "$options" | fuzzel --dmenu --prompt=" ⏻  " | awk '{print $1}')


case $choice in
    Shutdown)
        echo "Shutting down.."
        systemctl poweroff 
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
        ;;
    BIOS)
        echo "entering UEFI firmware interface"
        systemctl reboot --firmware-setup
        ;;
esac
