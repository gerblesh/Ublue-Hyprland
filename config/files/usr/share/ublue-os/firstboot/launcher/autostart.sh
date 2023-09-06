#!/usr/bin/env bash

<<<<<<< HEAD
# Ensure target file exists and is a symlink (not a regular file or dir).
if [ ! -f "$HOME"/.config/ublue-firstboot ]; then

    # add file to prevent firstboot from running again

    touch "$HOME"/.config/ublue-firstboot

    sed -i " 1 d" "$HOME"/.config/sway/config

    mkdir -p "$HOME"/.config/just
    cp -r /usr/share/ublue-os/just/custom.just "$HOME"/.config/just/justfile

    cp -r /usr/etc/homedir/.* "$HOME"/
    cp -r /usr/etc/homedir/* "$HOME"/

    /usr/bin/yafti /usr/share/ublue-os/firstboot/yafti.yml
fi

=======
# Simply launches the "yafti" GUI with the uBlue image's configuration.
/usr/bin/yafti /usr/share/ublue-os/firstboot/yafti.yml
>>>>>>> 8f76fd66a262d18b0f36960c2582d1ce796cc681
