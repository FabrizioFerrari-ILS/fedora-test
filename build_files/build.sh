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

dnf5 -y install "${PACKAGES[@]}"

systemctl enable podman.socket
systemctl enable cockpit.socket

BUILD_DATE=$(date +'%Y%m%d')
cat > /etc/xdg/kcm-about-distrorc <<EOF
[General]
Variant=ILS test ${BUILD_DATE}
EOF