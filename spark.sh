#!/bin/bash

# my personal linux box setup script
echo "And we see a spark of life"

echo "Please refer to"
echo "https://asus-linux.org/wiki/fedora-guide/"
echo "for the G-14"
sudo dnf update -y


# for ssh
sudo dnf install openssh-server
sudo systemctl enable sshd
sudo systemctl start sshd
sudo systemctl status sshd

# zerotier
curl -s https://install.zerotier.com | sudo bash

# additional repo
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf update -y

# for nvidia drivers
sudo dnf install kernel-devel
sudo dnf install akmod-nvidia xorg-x11-drv-nvidia-cuda

sudo systemctl enable nvidia-hibernate.service nvidia-suspend.service nvidia-resume.service nvidia-powerd.service

# for asus stuff
sudo dnf copr enable lukenukem/asus-linux
sudo dnf update

sudo dnf install asusctl supergfxctl
sudo dnf update --refresh
sudo systemctl enable supergfxd.service
sudo dnf install asusctl-rog-gui


# neofetch
sudo dnf install neofetch


# plex media server
sudo dnf install https://downloads.plex.tv/plex-media-server-new/1.32.5.7349-8f4248874/redhat/plexmediaserver-1.32.5.7349-8f4248874.x86_64.rpm
sudo systemctl enable plexmediaserver
sudo systemctl start plexmediaserver
echo "go to http://$ip_address_here:32400/web/ to set up plex"

# blender

flatpak install flathub org.blender.Blender

# appimage launcher
sudo dnf install https://github.com/TheAssassin/AppImageLauncher/releases/download/v2.2.0/appimagelauncher-2.2.0-travis995.0f91801.x86_64.rpm


# qbittorent
cd ~/Downloads
wget https://www.fosshub.com/qBittorrent.html?dwl=qbittorrent-4.5.4_x86_64.AppImage


# qbittorent cli
sudo rpm --import 'https://dl.cloudsmith.io/public/qbittorrent-cli/qbittorrent-cli/gpg.F8756541ADDA2B7D.key'
sudo dnf config-manager --add-repo https://repos.fedarovich.com/fedora/37/qbittorrent-cli.repo

sudo dnf install qbittorrent-cli



echo "please reboot"

# $  qbt settings set username $username
# $ qbt settings set password