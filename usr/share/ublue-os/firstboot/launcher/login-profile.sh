# Only process users with home directories, but skip the "root" user.
if [ "$(id -u)" != "0" ] && [ ! -z "$HOME" ] && [ -d "$HOME" ]; then
    if [ ! -f "$HOME"/.config/ublue-firstboot ]; then
        echo "Starting First Time Setup, Please wait..."
        # copy config files
        cp -r /usr/etc/homedir/.* "$HOME"/
        cp -r /usr/etc/homedir/* "$HOME"/
        # copy justfile
        echo "Setting up just"
        mkdir -p "$HOME"/.config/just
        cp -r /usr/share/ublue-os/just/custom.just "$HOME"/.config/just/justfile
    fi
fi

