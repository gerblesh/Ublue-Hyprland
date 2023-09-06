# Only process users with home directories, but skip the "root" user.
<<<<<<< HEAD
#if [ "$(id -u)" != "0" ] && [ ! -z "$HOME" ] && [ -d "$HOME" ]; then
#    # Ensure target file exists and is a symlink (not a regular file or dir).
#    if [ ! -L "$HOME"/.config/autostart/ublue-firstboot.desktop ]; then
#        # Remove any leftovers or incorrect (non-link) files with the same name.
#        rm -rf "$HOME"/.config/autostart/ublue-firstboot.desktop
#
#        # Create symlink to uBlue's autostart runner.
#        # Note that "broken autostart symlinks" are harmless if they remain
#        # after distro switching, and just cause a minor syslog warning. The
#        # user can manually delete this file if they migrate away from uBlue.
#        mkdir -p "$HOME"/.config/autostart
#        ln -s "/usr/share/ublue-os/firstboot/launcher/autostart.desktop" "$HOME"/.config/autostart/ublue-firstboot.desktop
#    fi
#fi
=======
if [ "$(id -u)" != "0" ] && [ ! -z "$HOME" ] && [ -d "$HOME" ]; then
    # Ensure target file exists and is a symlink (not a regular file or dir).
    if [ ! -L "$HOME"/.config/autostart/ublue-firstboot.desktop ]; then
        # Remove any leftovers or incorrect (non-link) files with the same name.
        rm -rf "$HOME"/.config/autostart/ublue-firstboot.desktop

        # Create symlink to uBlue's autostart runner.
        # Note that "broken autostart symlinks" are harmless if they remain
        # after distro switching, and just cause a minor syslog warning. The
        # user can manually delete this file if they migrate away from uBlue.
        mkdir -p "$HOME"/.config/autostart
        ln -s "/usr/share/ublue-os/firstboot/launcher/autostart.desktop" "$HOME"/.config/autostart/ublue-firstboot.desktop
    fi
fi
>>>>>>> 8f76fd66a262d18b0f36960c2582d1ce796cc681
