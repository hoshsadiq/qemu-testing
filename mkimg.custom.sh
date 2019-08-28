

profile_rpi_custom() {
        profile_base
        title="Raspberry Pi Test"
        desc="Includes Raspberry Pi kernel"
        image_ext="tar.gz"
        arch="aarch64"
        kernel_flavors="rpi"
        kernel_cmdline="console=tty1"
        initfs_features="base squashfs mmc usb kms dhcp https containerd"
        hostname="rpi"
        grub_mod=
}

