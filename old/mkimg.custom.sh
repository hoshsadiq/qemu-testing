
profile_rpi_k3s() {
        profile_base
        title="Raspberry Pi K3s"
        desc="Includes Raspberry Pi kernel and all necessary tooling to run K3s"
        image_ext="tar.gz"
        arch="aarch64 armhf"
        kernel_flavors="rpi"
        kernel_cmdline="console=tty1"
        initfs_features="base squashfs mmc usb kms dhcp https" # see https://github.com/alpinelinux/mkinitfs/tree/master/features.d
        hostname="rpi"
        grub_mod=

        apks="$apks containerd"
        apks="$(echo "$apks" | sed 's/\bhaveged\b//')"
        apks="$(echo "$apks" | sed 's/\bopenssl\b/libressl/')"
        apks="$(echo "$apks" | sed -E 's/ +/ /g')"
}
