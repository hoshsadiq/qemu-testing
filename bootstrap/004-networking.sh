#!/bin/sh

set -xe

cat <<EOF > /etc/network/interfaces
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet dhcp

auto wlan0
iface wlan0 inet dhcp
EOF

# avahi
apk add dbus avahi
apk add linux-firmware-brcm
