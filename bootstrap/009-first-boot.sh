#!/bin/sh

set -eux

# ideally these will be installed before on first boot but internet is not guaranteed
apk add --virtual resizepart e2fsprogs-extra parted

cat <<EOF > /usr/bin/first-boot
#!/bin/sh
set -eux

parted --script /dev/mmcblk0 resizepart 2 yes 100%
partprobe
resize2fs /dev/mmcblk0p2
rc-update del first-boot
rm /etc/init.d/first-boot /usr/bin/first-boot

cp -f /boot/wpa_supplicant.conf /etc/wpa_supplicant/wpa_supplicant.conf

apk del resizepart e2fsprogs-extra parted

reboot
EOF

cat <<EOF > /etc/init.d/first-boot
#!/sbin/openrc-run
command="/usr/bin/first-boot"
command_background=false
depend() {
  after modules
  need localmount
}
EOF

chmod +x /etc/init.d/first-boot /usr/bin/first-boot
rc-update add first-boot
