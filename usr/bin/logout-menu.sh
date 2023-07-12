#!/usr/bin/env bash


playerctl -a pause

options=" Screen Lock\n󰍃 Logout\n󰤄 Sleep\n⏻ Shutdown\n Restart\n BIOS"

choice=$(printf "$options" | fuzzel --dmenu --prompt=" Goodbye!  " | awk '{print $2}')


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
