#!/bin/bash
set -ouex pipefail

dnf5 install -y libreoffice

dnf5 clean all