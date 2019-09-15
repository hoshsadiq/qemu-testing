#!/bin/sh

set -eux

targetHostname="rpi"

# base stuff
apk add ca-certificates
update-ca-certificates

setup-hostname "$targetHostname"
echo "127.0.0.1    $targetHostname $targetHostname.localdomain" > /etc/hosts
setup-keymap gb gb

# time
apk add chrony
setup-timezone -z UTC # users are encouraged to change this to their own timezone
rc-update add chronyd default

# delete build-base
apk del build-base
