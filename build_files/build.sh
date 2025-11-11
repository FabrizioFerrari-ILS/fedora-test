#!/bin/bash
set -ouex pipefail

PACKAGES=(
    mc
    hunspell-it
    qemu
    cockpit
    cockpit-podman
    fastfetch
    qt6-qdbusviewer
    distrobox
)

dnf5 install -y "${PACKAGES[@]}"

#dnf5 -y copr enable lizardbyte/beta
#dnf5 -y install Sunshine
#dnf5 -y copr disable lizardbyte/beta

systemctl enable podman.socket
systemctl enable cockpit.socket


BUILD_DATE=$(date +'%Y%m%d')
cat > /etc/xdg/kcm-about-distrorc <<EOF
[General]
Variant=ILS test ${BUILD_DATE}
EOF