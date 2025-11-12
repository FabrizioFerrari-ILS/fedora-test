#!/bin/bash
set -ouex pipefail

dnf5 install -y gimp

dnf5 clean all