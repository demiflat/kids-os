#!/bin/bash

set -ouex pipefail

# Copy the contents of system_files/ of the git repo to /
cp -avf "/ctx/system_files"/. /

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/43/x86_64/repoview/index.html&protocol=https&redirect=1

#curl -fsSL "https://copr.fedorainfracloud.org/coprs/scottames/ghostty/repo/fedora-${VERSION_ID}/scottames-ghostty-fedora-${VERSION_ID}.repo" | sudo tee /etc/yum.repos.d/_copr:copr.fedorainfracloud.org:scottames:ghostty.repo > /dev/null
dnf5 -y copr enable scottames/ghostty
dnf5 install -y ghostty

dnf5 install -y sshd
dnf5 install -y tmux
dnf5 install -y aria2
dnf5 install -y et
dnf5 install -y dos2unix
dnf5 install -y diffutils
dnf5 install -y figlet
dnf5 install -y firefox
dnf5 install -y fortune-mod
dnf5 install -y fzf
dnf5 install -y golang
dnf5 install -y git-delta
dnf5 install -y gitk
dnf5 install -y hdparm
dnf5 install -y iftop
dnf5 install -y iotop-c
dnf5 install -y jq
dnf5 install -y iperf3
dnf5 install -y libreoffice
dnf5 install -y lolcat
dnf5 install -y lsd
# dnf5 install -y ltunify
dnf5 install -y mpv
dnf5 install -y neovim
dnf5 install -y net-tools
dnf5 install -y NetworkManager-tui
dnf5 install -y p7zip
dnf5 install -y progress
dnf5 install -y pv
dnf5 install -y pwgen
dnf5 install -y python3-pip
dnf5 install -y python3-virtualenv
dnf5 install -y qemu
dnf5 install -y strace
dnf5 install -y unzip
dnf5 install -y zip
dnf5 install -y zstd

systemctl enable sshd.service
systemctl enable podman.socket
