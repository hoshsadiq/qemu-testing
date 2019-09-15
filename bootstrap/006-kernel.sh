#!/bin/sh

set -xe

echo "dwc_otg.lpm_enable=0 console=tty1 root=/dev/mmcblk0p2 rootfstype=ext4 elevator=deadline fsck.repair=yes rootwait quiet" > /boot/cmdline.txt

cat <<EOF > /boot/config.txt
disable_splash=1
boot_delay=0
arm_64bit=true
# use usercfg.txt to change other settings as this file may get overwritten
include usercfg.txt
EOF

# fstab
cat <<EOF > /etc/fstab
/dev/mmcblk0p1  /boot           vfat    defaults          0       2
/dev/mmcblk0p2  /               ext4    defaults,noatime  0       1
EOF
