#!/bin/sh

set -eux

# todo does cmdline.txt support comments?
cat /build/kernel/cmdline.txt | grep -v '^#' > /boot/cmdline.txt
cp /build/kernel/config.txt /boot/config.txt
cp /build/kernel/fstab.txt /etc/fstab
