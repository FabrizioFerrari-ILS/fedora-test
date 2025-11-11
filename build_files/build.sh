#!/bin/bash
set -ouex pipefail

PACKAGES=(
    mc
    fastfetch
    htop
    hunspell-it
    cockpit
    cockpit-podman
    qt6-qdbusviewer
    distrobox
)

dnf5 install -y "${PACKAGES[@]}"

#dnf5 -y copr enable lizardbyte/beta
#dnf5 -y install Sunshine
#dnf5 -y copr disable lizardbyte/beta

dnf5 clean all

systemctl enable podman.socket
systemctl enable cockpit.socket


BUILD_DATE=$(date +'%Y%m%d')
cat > /etc/xdg/kcm-about-distrorc <<EOF
[General]
Variant=ILS test ${BUILD_DATE}
EOF