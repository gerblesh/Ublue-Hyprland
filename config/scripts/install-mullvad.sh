
mkdir -p /tmp/rpms

#curl -Lo /tmp/rpms/mullvad-vpn.rpm https://mullvad.net/en/download/app/rpm/latest --max-redirs 1
echo 'Downloading files needed for installation ...'
wget -qnc --trust-server-names https://mullvad.net/download/app/rpm/latest -P /tmp/mullvad
wget -qnc --trust-server-names https://mullvad.net/download/app/rpm/latest/signature -P /tmp/mullvad
wget -qnc https://mullvad.net/media/mullvad-code-signing.asc -P /tmp/mullvad
echo 'Importing Mullvad GPG key ...'
gpg --import /tmp/mullvad/mullvad-code-signing.asc
echo 'Verify the Mullvad VPN app ...'
gpg --verify /tmp/mullvad/MullvadVPN-*.rpm.asc && rpm-ostree install /tmp/mullvad/MullvadVPN-*.rpm
