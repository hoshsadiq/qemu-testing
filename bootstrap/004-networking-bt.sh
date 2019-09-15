#!/bin/sh

set -xe

apk add bluez
sed -i '/bcm43xx/s/^#//' /etc/mdev.conf
