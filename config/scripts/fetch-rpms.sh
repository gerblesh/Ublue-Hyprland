
mkdir -p /tmp/rpms

curl -Lo /tmp/rpms/mullvad-vpn.rpm https://mullvad.net/en/download/app/rpm/latest --max-redirs 1

echo "Installing RPMS from /tpm/rpms"
# install rpms from /tmp/rpms
rpm-ostree install \
    /tmp/rpms/*.rpm

