#!/usr/bin/env bash

set -oue pipefail

rpm-ostree override replace https://bodhi.fedoraproject.org/updates/FEDORA-2023-785fb9cf29

echo "Setup systemd units"
systemctl enable getty@tty1
systemctl disable rpm-ostree-countme.service
systemctl enable power-profiles-daemon
