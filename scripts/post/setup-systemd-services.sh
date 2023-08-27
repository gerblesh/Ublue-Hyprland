#!/usr/bin/env bash

set -oue pipefail

echo "Setup systemd units"
systemctl disable rpm-ostree-countme.service
systemctl enable power-profiles-daemon
systemctl enable mullvad-daemon
