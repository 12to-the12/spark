#!/bin/bash

# the goal of this script is to automate as much as possible of the setup of a new computer. It's meant to be used in conjunction with the copying over of the entire home directory

#> [!note]
#> this won't work with my current ~/.bashrc because it aliases rm to a message telling me to use trash-cli

echo "And we see a spark of life"

echo "Please refer to"
echo "https://asus-linux.org/wiki/fedora-guide/"
echo "for the G-14"
sudo dnf update -y


# for gcc and development
sudo dnf install -y @development-tools gcc-c++ wl-clipboard libxkbcommon-devel dbus-devel wxGTK3-devel


# for ssh
sudo dnf install -y openssh-server
sudo systemctl enable sshd
sudo systemctl start sshd
sudo systemctl status sshd

# zerotier
curl -s https://install.zerotier.com | sudo bash

# adds rpmfusion repo
sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf update -y

# for nvidia drivers
sudo dnf install -y kernel-devel
sudo dnf install -y akmod-nvidia
# gives nvidia-smi:
sudo dnf install -y xorg-x11-drv-nvidia-cuda

sudo systemctl enable nvidia-hibernate.service nvidia-suspend.service nvidia-resume.service nvidia-powerd.service

# for asus stuff
sudo dnf copr enable lukenukem/asus-linux-y
sudo dnf update -y

sudo dnf install -y asusctl supergfxctl
sudo dnf update --refresh
sudo systemctl enable supergfxd.service
sudo dnf install -y asusctl-rog-gui



# get rustup for rust
# see https://www.rust-lang.org/learn/get-started
# everything is installed in ~/.cargo/bin
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# cargo-make
cargo install --force cargo-make --version 0.34.0

# espanso
# see https://espanso.org/docs/install/linux/#wayland-compile
# Clone the Espanso repository
git clone https://github.com/federico-terzi/espanso

cd espanso

# Compile espanso in release mode
# NOTE: this will take a while (~5/15 minutes)
cargo make --profile release --env NO_X11=true build-binary 

# move binary
sudo mv target/release/espanso /usr/local/bin/espanso
# give permissions
sudo setcap "cap_dac_override+p" $(which espanso)
# clean up folder
cd ~
rm -rf ./espanso


# Visual Studio Code (the flatpak hsa given me problems both times I've naively installed it)
# see https://code.visualstudio.com/docs/setup/linux
# this installs the key and repository
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
# and this installs the program
dnf check-update
sudo dnf install -y code # or code-insiders

# Blender 
# download page: https://www.blender.org/download/
# this downloads 3.6.4
# NOTE: requires some configuration for this method, see Obsidian Linux Journey section on .desktop files
mkdir ~/software
cd ~/software
wget https://ftp.halifax.rwth-aachen.de/blender/release/Blender3.6/blender-3.6.4-linux-x64.tar.xz
tar xf blender-3.6.4-linux-x64.tar.xz


# because I think Konsole looks a bit better
sudo dnf install -y konsole
# add flatpak remote
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo


# add flatpak-beta remote
# for fractal see https://gitlab.gnome.org/GNOME/fractal
flatpak remote-add --user --if-not-exists flathub-beta https://flathub.org/beta-repo/flathub-beta.flatpakrepo

# install Fractal [matrix] client
# see https://gitlab.gnome.org/GNOME/fractal
flatpak install --user flathub-beta org.gnome.Fractal

# run Fractal application
# flatpak run org.gnome.Fractal//betflatpak install flathub org.signal.Signal 

# Signal flatpak
# see https://github.com/flathub/org.signal.Signal
flatpak install flathub org.signal.Signal
flatpak override --user --env=SIGNAL_USE_WAYLAND=1 org.signal.Signal
flatpak override --user --env=SIGNAL_DISABLE_GPU_SANDBOX=1 org.signal.Signal



# some cli utilities

# speedtest
sudo dnf install -y speedtest-cli

# neofetch
sudo dnf install -y neofetch

# trash-cli
# see https://github.com/andreafrancia/trash-cli
sudo dnf install -y trash-cli

# btop++
# see https://github.com/aristocratos/btop#installation
sudo dnf install -y btop

# bat, a colorized cat with git integration
# see https://github.com/sharkdp/bat
sudo dnf install -y btop

# lolcat, rainbow terminal
sudo dnf install -y lolcat


# nevermind, this doesn't work with the latest version of Fedora
# # tlp battery saving
# # see https://www.linrunner.de/tlp/installation/fedora.html
# sudo dnf install -y tlp
# sudo dnf remove power-profiles-daemon
# # note: this is what gives the GNOME power profiles widget
# systemctl enable tlp.service
# systemctl mask systemd-rfkill.service systemd-rfkill.socket

# tlp doesn't work
# # tlp ui
# # see https://github.com/d4nj1/TLPUI
# # and https://flathub.org/apps/com.github.d4nj1.tlpui
# flatpak install flathub com.github.d4nj1.tlpui


# see https://github.com/jadahl/gnome-monitor-config
# and https://www.reddit.com/r/gnome/comments/xhive9/how_to_change_screen_refresh_rate_with_a_terminal/
sudo dnf install -y gnome-monitor-config


# docker
# see https://docs.docker.com/engine/install/fedora/
# preamble
sudo dnf -y install dnf-plugins-core
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
# install docker
sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
# start docker
sudo systemctl start docker
# start docker on boot
sudo systemctl enable docker.service
sudo systemctl enable containerd.service
# make it not start on boot
# sudo systemctl disable docker.service
# sudo systemctl disable containerd.service
# verify it's working
sudo docker run hello-world


# made unnecessary by docker {

# # plex media server
# sudo dnf install -y https://downloads.plex.tv/plex-media-server-new/1.32.5.7349-8f4248874/redhat/plexmediaserver-1.32.5.7349-8f4248874.x86_64.rpm
# sudo systemctl enable plexmediaserver
# sudo systemctl start plexmediaserver
# echo "go to http://$ip_address_here:32400/web/ to set up plex"

# }

# # blender
# flatpak install flathub org.blender.Blender

# appimage launcher
sudo dnf install -y https://github.com/TheAssassin/AppImageLauncher/releases/download/v2.2.0/appimagelauncher-2.2.0-travis995.0f91801.x86_64.rpm

# vlc
sudo dnf install -y vlc

# fixing Plex error s4032(manifest) on Firefox
# probably a codec error
# see https://www.virtualconfusion.net/plex-error-s4032/
# sudo dnf install https://download1.rpmfusion.org/{free/fedora/rpmfusion-free,nonfree/fedora/rpmfusion-nonfree}-release-$(rpm -E %fedora).noarch.rpm
# sudo dnf install -y compat-ffmpeg28 ffmpeg-libs
sudo dnf install -y ffmpeg --allowerasing


# tor
# see https://www.torproject.org/download/
cd ~/software
wget https://www.torproject.org/dist/torbrowser/13.0/tor-browser-linux-x86_64-13.0.tar.xz
tar xf tor-browser-linux-x86_64-13.0.tar.xz
cd ~

# kiwix
# see https://kiwix.org/en/applications/
# sudo dnf install -y kiwix-desktop

# GAMING

# Prism Launcher
# see https://prismlauncher.org/download/linux/
# enables the copr repo
sudo dnf copr enable g3tchoo/prismlauncher
# stable releases
sudo dnf install -y prismlauncher
# --allowerasing    
# # nightly builds
# sudo dnf install -y prismlauncher-nightly
# # stable Qt 5 releases
# sudo dnf install -y prismlauncher-qt5


# steam
# the rpm version wasn't opening a window
# wait, now it's working, the flatpak was sandboxedd and wouldn't grab my ~/.local/share/Steam, so I went with the rpm
sudo dnf install -y steam
flatpak install flathub com.valvesoftware.Steam
# ran this to uninstall the flatpak, pretty simple:
# flatpak uninstall com.valvesoftware.Steam


# CKAN
# see https://github.com/KSP-CKAN/CKAN/blob/master/doc/rpm-repo.md
sudo dnf config-manager --add-repo https://ksp-ckan.s3-us-west-2.amazonaws.com/rpm/stable/ckan_stable.repo
sudo dnf install -y ckansudo rpm --import 'https://dl.cloudsmith.io/public/qbittorrent-cli/qbittorrent-cli/gpg.F8756541ADDA2B7D.key'
sudo dnf config-manager --add-repo https://repos.fedarovich.com/fedora/37/qbittorrent-cli.repo

sudo dnf install -y qbittorrent-cli





# $  qbt settings set username $username
# $ qbt settings set password

# Calibre
# download page: https://calibre-ebook.com/download_linux
sudo -v && wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sudo sh /dev/stdin

# Spotify
# see https://docs.fedoraproject.org/en-US/quick-docs/installing-spotify/
flatpak install flathub com.spotify.Client




echo "please reboot"

