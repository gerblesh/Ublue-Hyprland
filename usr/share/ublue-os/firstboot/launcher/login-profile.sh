# Only process users with home directories, but skip the "root" user.
if [ "$(id -u)" != "0" ] && [ ! -z "$HOME" ] && [ -d "$HOME" ]; then

    if [ ! -f "$HOME"/.config/ublue-firstboot ]; then
        echo "Starting First Time Setup, Please wait..."
        # copy config files
        cp -r /usr/etc/homedir/.* "$HOME"/
        cp -r /usr/etc/homedir/* "$HOME"/
        # setup distrobox
        echo "Setting up distrobox git"
        curl -s https://raw.githubusercontent.com/89luca89/distrobox/main/install | sh -s -- --next --prefix "$HOME"/.local
    fi

    if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
        echo "Starting Hyprland"
        source "$HOME"/.profile
        Hyprland > /dev/null
    fi

fi
