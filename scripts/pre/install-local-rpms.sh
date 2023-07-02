#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
# You should have this in every custom script, to ensure that your completed
# builds actually ran successfully without any errors!
set -oue pipefail

echo "Installing RPMS from /tpm/rpms"
# install rpms from /tmp/rpms
rpm-ostree install \
    /tmp/rpms/*.rpm \
    fedora-repos-archive
