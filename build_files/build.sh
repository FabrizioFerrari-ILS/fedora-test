#!/bin/bash

set -ouex pipefail

SERVER_PACKAGES=(
    mc
    hunspell-it
    qemu
    cockpit
    cockpit-podman
    fastfetch
    tailscale
    libreoffice
    qt6-qdbusviewer
)

dnf5 install -y "${SERVER_PACKAGES[@]}"


dnf5 -y copr enable lizardbyte/beta
dnf5 -y install Sunshine
dnf5 -y copr disable lizardbyte/beta


systemctl enable podman.socket
systemctl enable cockpit.socket


BUILD_DATE=$(date +'%Y%m%d')
cat > /etc/xdg/kcm-about-distrorc <<EOF
[General]
Variant=ILS test ${BUILD_DATE}
END
EOF