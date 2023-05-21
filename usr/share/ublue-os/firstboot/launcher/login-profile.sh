# Only process users with home directories, but skip the "root" user.
if [ "$(id -u)" != "0" ] && [ ! -z "$HOME" ] && [ -d "$HOME" ]; then
    if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
        Hyprland > /dev/null
    fi

fi
