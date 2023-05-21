# Only process users with home directories, but skip the "root" user.
if [ "$(id -u)" != "0" ] && [ ! -z "$HOME" ] && [ -d "$HOME" ]; then

    if [ ! -f "$HOME"/.config/ublue-firstboot ]; then
        # copy config files
        cp -r /usr/etc/homedir/* "$HOME"/
        cp -r /usr/etc/homedir/.config/ "$HOME"/.config/
        cp -r /usr/etc/homedir/.local/share/ "$HOME"/.local/share/
    fi

    if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
        Hyprland > /dev/null
    fi

fi
