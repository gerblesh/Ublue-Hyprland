default:
  @just --list

setup-distrobox:
  echo "Setting up distrobox git ..."
  mkdir -p "$HOME"/.local/bin
  curl -s https://raw.githubusercontent.com/89luca89/distrobox/main/install | sh -s -- --next --prefix "$HOME"/.local

setup-flatpaks:
  #!/usr/bin/env bash
  echo 'Installing flatpaks from the ublue recipe ...'
  flatpaks=$(yq -- '.firstboot.flatpaks[]' "/usr/share/ublue-os/recipe.yml")
  for pkg in $flatpaks; do \
      echo "Installing: ${pkg}" && \
      flatpak install --user --noninteractive flathub $pkg; \
  done

setup-gaming:
  echo 'Setting up gaming experience ... lock and load.'
  flatpak install -y --user \\
  com.discordapp.Discord \\
  com.feaneron.Boatswain \\
  org.freedesktop.Platform.VulkanLayer.MangoHud//22.08 \\
  org.freedesktop.Platform.VulkanLayer.OBSVkCapture//22.08 \\
  org.freedesktop.Platform.VulkanLayer.vkBasalt//22.08 \\
  com.heroicgameslauncher.hgl \\
  com.obsproject.Studio \\
  com.obsproject.Studio.Plugin.OBSVkCapture \\
  com.obsproject.Studio.Plugin.Gstreamer \\
  com.usebottles.bottles \\
  com.valvesoftware.Steam \\
  com.valvesoftware.Steam.Utility.gamescope \\
  net.davidotek.pupgui2
  flatpak override com.usebottles.bottles --user --filesystem=xdg-data/applications 
  flatpak override --user --env=MANGOHUD=1 com.valvesoftware.Steam 
  flatpak override --user --env=MANGOHUD=1 com.heroicgameslauncher.hgl 

bios:
  systemctl reboot --firmware-setup

changelogs:
  rpm-ostree db diff --changelogs

distrobox-boxkit:
  echo 'Creating Boxkit distrobox ...'
  distrobox create --image ghcr.io/ublue-os/boxkit -n boxkit -Y

distrobox-debian:
  echo 'Creating Debian distrobox ...'
  distrobox create --image quay.io/toolbx-images/debian-toolbox:unstable -n debian -Y

distrobox-opensuse:
  echo 'Creating openSUSE distrobox ...'
  distrobox create --image quay.io/toolbx-images/opensuse-toolbox:tumbleweed -n opensuse -Y

distrobox-ubuntu:
  echo 'Creating Ubuntu distrobox ...'
  distrobox create --image quay.io/toolbx-images/ubuntu-toolbox:22.04 -n ubuntu -Y

distrobox-fedora:
  echo 'Creating Fedora distrobox ...'
  distrobox create --image quay.io/fedora/fedora:38 -n fedora -Y

distrobox-arch:
  echo 'Creating Fedora distrobox ...'
  distrobox create --image docker.io/library/archlinux:latest -n arch -Y

update:
  rpm-ostree update
  flatpak update -y
  distrobox upgrade -a

nix-me-up:
  echo 'Setting phasers to kill. Installing nix.'
  /usr/bin/ublue-nix-install

yafti:
  yafti /usr/share/ublue-os/firstboot/yafti.yml
