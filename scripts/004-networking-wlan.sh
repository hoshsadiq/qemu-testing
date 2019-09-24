#!/bin/sh

set -eux

echo 'brcmfmac' >> /etc/modules

apk add wpa_supplicant wireless-tools wireless-regdb iw
sed -i \
    -e '/^wpa_supplicant_args=/s/-u -Dwext,nl80211 \?//g' \
    -e '/^wpa_supplicant_args=/s/="/="-u -Dwext,nl80211 /' \
    -e '/^wpa_supplicant_args=/s/ \+"/"/' \
    /etc/conf.d/wpa_supplicant

rc-update add wpa_supplicant default

cat <<EOF > /boot/wpa_supplicant.conf
network={
 ssid="SSID"
 psk="PASSWORD"
}
EOF
