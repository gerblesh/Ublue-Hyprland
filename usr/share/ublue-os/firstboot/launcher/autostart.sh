#!/usr/bin/env bash

cp -r /usr/etc/homedir/* ~HOME/
cp -r /usr/etc/homedir/.config/ ~/.config/
cp -r /usr/etc/homedir/.local/share/ ~/.local/share/

Hyprland

sleep 10
# Simply launches the "yafti" GUI with the uBlue image's configuration.
/usr/bin/yafti /usr/share/ublue-os/firstboot/yafti.yml
