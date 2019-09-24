#!/bin/sh

set -xeu

apk add linux-rpi
apk add linux-firmware-brcm
apk add raspberrypi-bootloader


apk manifest linux-rpi | \
    awk "/${RPI_CI_DTB_FILES:--dtb$}/{print \"/\"\$2}" | \
    while read dtb; do
        mv "$dtb" "/boot"
    done
