#!/bin/sh

set -eux

apk add bluez
sed -i '/bcm43xx/s/^#//' /etc/mdev.conf
