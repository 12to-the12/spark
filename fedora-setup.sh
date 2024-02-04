#!/bin/bash

# the goal of this script is to automate as much as possible of the setup of a new computer. It's meant to be used in conjunction with the copying over of the entire home directory
# this serves as a setup manual and resource repository as well as an install script

# additionally, this document has become a reference for how configure things on my Fedora Linux install
# see "Linux Journey" in my notes repository for a journal fighting with the system (mostly the GPU)
# the Linux Journey note is where how to do things is recorded, this file is for configuration


#> [!note]
#> this won't work with my current ~/.bashrc because it aliases rm to a message telling me to use trash-cli

#> [!note]
#> the previous note is incorrect, bash doesn't inherit aliases unless they are exported



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
flatpak install -y --user flathub-beta org.gnome.Fractal

# run Fractal application
# flatpak run org.gnome.Fractal//betflatpak install flathub org.signal.Signal 

# Signal flatpak
# see https://github.com/flathub/org.signal.Signal
flatpak install -y flathub org.signal.Signal
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
sudo dnf install -y bat

# lolcat, rainbow terminal
sudo dnf install -y lolcat
sudo dnf install -y cronie cronie-anacron

# yt-dly, fork of youtube-dl
# for donwloading youtube videos
# I have it aliased to youtube-dl
sudo dnf install -y yt-dlp


# for cron jobs
# handy site to help enter the correct time intervals:
# https://crontab.guru/
sudo dnf install -y cronie cronie-anacron

# cava music visualizer
# see https://github.com/karlstav/cava
# prerequisites
sudo dnf install -y alsa-lib-devel ncurses-devel fftw3-devel pulseaudio-libs-devel libtool autoconf-archive iniparser-devel pkgconf
# cava
sudo dnf install -y cava

# waybar
# see https://repology.org/project/waybar/versions
sudo dnf install -y waybar
# vim
sudo dnf install -y vim

# cmatrix
# for hacking visuals
sudo dnf install -y cmatrix

# see https://github.com/bugaevc/wl-clipboard
sudo dnf install -y wl-clipboard

# little bonsai trees in the terminal
sudo dnf install -y cbonsai

# a prettier tmux dropin
# see https://github.com/zellij-org/zellij
sudo dnf copr enable varlad/zellij 
sudo dnf install -y zellij

# superceded by oh my zsh
# # powerline shell prompt customization
# # see https://github.com/b-ryan/powerline-shell
# pip install powerline-shell

sudo dnf install -y util-linux-user
sudo dnf install -y zsh
# chsh -s $(which zsh)

# audio player
# see https://mpv.io/installation/
# Fedora isn't listed but it still works
sudo dnf install -y mpv

# gsu disk usage visualizer
# see https://github.com/dundee/gdu
curl -L https://github.com/dundee/gdu/releases/latest/download/gdu_linux_amd64.tgz | tar xz
chmod +x gdu_linux_amd64
sudo mv gdu_linux_amd64 /usr/bin/gdu


# gpt assistance and piping (magic)
# see https://github.com/TheR1D/shell_gpt
pip install shell-gpt


# for fetching gpu information
# see https://github.com/wookayin/gpustat
# gpustat -i 1
# note: the blue number is *fan* utilization
pip install gpustat

# # disk usage viewer (gdu is much faster)
# # see https://dev.yorhel.nl/ncdu
# sudo dnf install -y ncdu

# AwesomeWM with GNOME
# see https://github.com/SirJson/awesomewm-gnome
# sudo dnf copr enable victoroliveira/gnome-flashback
# dnf install -y gnome-flashback


# little terminal globe
# https://ostechnix.com/run-ascii-globe-in-terminal-with-globe-cli-utility/
cargo install globe-cli



# nordvpn
# see https://nordvpn.com/download/linux/
# note: to login, run nordvpn login, then copy the url at the connect button and run nordvpn login --callback "url-goes-here"
sh <(curl -sSf https://downloads.nordcdn.com/apps/linux/install.sh)

# VirtualBox
sudo dnf install -y VirtualBox

# borgbackup
# backup program
# see https://borgbackup.readthedocs.io/en/stable/installation.html
sudo dnf install -y borgbackup

# and borgmatic to simplify it
# see https://torsion.org/borgmatic/docs/how-to/set-up-backups/
sudo dnf install -y borgmatic
# generates config at /etc/borgmatic/config.yaml
sudo borgmatic config generate




# bitwarden
cd ~/downloads/
wget https://vault.bitwarden.com/download/?app=desktop&platform=linux&variant=rpm
sudo dnf install index.html?app=desktop&platform=linux&variant=rpm
cd ~

# oh my zsh
# see https://github.com/ohmyzsh/ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended



# notetaking
cd ~/applications # this is where my appimages live


# marktext
# see https://github.com/marktext/marktext/blob/develop/docs/LINUX.md
wget https://github.com/marktext/marktext/releases/download/v0.17.1/marktext-x86_64.AppImagesolve(equation, H)
wget https://github.com/Zettlr/Zettlr/releases/download/v3.0.3/Zettlr-3.0.3-x86_64.AppImage # -O Zettlr.AppImage

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
# flatpak install -y flathub com.github.d4nj1.tlpui


# # and https://flathub.org/apps/com.github.d4nj1.tlpui
# flatpak install -y flathub com.github.d4nj1.tlpui


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
# DONT DO THIS:
# sudo dnf install -y https://downloads.plex.tv/plex-media-server-new/1.32.5.7349-8f4248874/redhat/plexmediaserver-1.32.5.7349-8f4248874.x86_64.rpm
# use docker instead baby
# sudo systemctl enable plexmediaserver
# sudo systemctl start plexmediaserver
# echo "go to http://$ip_address_here:32400/web/ to set up plex"

# }

# # blender
# flatpak install -y flathub org.blender.Blender

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



# brave browser
# see https://brave.com/linux/
sudo dnf install -y dnf-plugins-core
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
sudo dnf install -y brave-browser


# tor
# see https://www.torproject.org/download/
cd ~/software
wget https://www.torproject.org/dist/torbrowser/13.0/tor-browser-linux-x86_64-13.0.tar.xz
tar xf tor-browser-linux-x86_64-13.0.tar.xz
cd ~

# kiwix
# see https://kiwix.org/en/applications/
# sudo dnf install -y kiwix-desktop


# activity watch
# see https://github.com/ActivityWatch/activitywatch/releases/tag/v0.12.2
cd ~/software
wget https://github.com/ActivityWatch/activitywatch/releases/download/v0.12.2/activitywatch-v0.12.2-linux-x86_64.zip
unzip activitywatch-v0.12.2-linux-x86_64.zip




# GAMING

# Prism Launch er
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
flatpak install -y flathub com.valvesoftware.Steam
# ran this to uninstall the flatpak, pretty simple:
# flatpak uninstall com.valvesoftware.Steam



# CKAN
# see https://github.com/KSP-CKAN/CKAN/blob/master/doc/rpm-repo.md
sudo dnf config-manager --add-repo https://ksp-ckan.s3-us-west-2.amazonaws.com/rpm/stable/ckan_stable.repo
sudo dnf install ckan



# sudo dnf install -y ckansudo rpm --import 'https://dl.cloudsmith.io/public/qbittorrent-cli/qbittorrent-cli/gpg.F8756541ADDA2B7D.key'
# sudo dnf config-manager --add-repo https://repos.fedarovich.com/fedora/37/qbittorrent-c
# sudo dnf install -y qbittorrent-cli





# $  qbt settings set username $username
# $ qbt settings set password

# Calibre
# download page: https://calibre-ebook.com/download_linux
sudo -v && wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sudo sh /dev/stdin

# Spotify
# see https://docs.fedoraproject.org/en-US/quick-docs/installing-spotify/
flatpak install -y flathub com.spotify.Client

# and a terminal client
# see https://github.com/Rigellute/spotify-tui
sudo dnf copr enable atSpotify
# see https://github.com/pwittchen/spotify-cli-linux
pip install spotifycli

# Spicetfiy to make it shiny
# see https://spicetify.app/docs/advanced-usage/installation/
curl -fsSL https://raw.githubusercontent.com/spicetify/spicetify-cli/master/install.sh | sh
# now config it
# flatpak spotify is /var/lib/flatpak/app/com.spotify.Client/x86_64/stable/active/files/extra/share/spotify/
# spicetify config
# set the path to the spotify executable and spotify preferences in the spicetify config file
# note: bash expansion does not work


#prefs file is at ~/.var/app/com.spotify.Client/config/spotify/prefs
# Spicetify theme pack
# see https://github.com/spicetify/spicetify-themes/tree/master
# examples: https://github.com/spicetify/spicetify-themes/blob/master/THEMES.md
git clone --depth=1 https://github.com/spicetify/spicetify-themes.git 
cd spicetify-themes
cp -r * ~/.config/spicetify/Themes
# to set the theme
spicetify config current_theme Dribbblish
# note: color schemes aren't available for all themes
spicetify config color_scheme White
spicetify apply
spicetify backup apply

# to install a better terminal
# website: https://sw.kovidgoyal.net/kitty/
# github: 
sudo dnf install -y kitty

# *couldn't get this to work, sticking with GTILE extension*
# pop shell tiling window manager for GNOME
# learned about it from this reddit thread: https://www.reddit.com/r/unixporn/comments/179c7il/gnome_but_for_people_who_dont_like_gnome/SCHEME_NAME
# see https://github.com/pop-os/shell#installation for installation
# this reddit thread is a better usage manual: https://www.reddit.com/r/pop_os/comments/pze1p5/trying_to_use_pop_shell/
# NOTE: I'm pretty sure the trailing period on the sudo make install. line is a type in the thread
# sudo dnf install gnome-shell-extension-pop-shell xprop
# git clone https://github.com/pop-os/shell-shortcuts /home/$USER/fedora/pop-theme/shell-shortcuts
# cd /home/$USER/fedora/pop-theme/shell-shortcuts
# make
# sudo make install


# THEMES


# GTK
# from https://github.com/Fausto-Korpsvart/Gruvbox-GTK-Theme
# overrides flatpak themes
sudo flatpak override --filesystem=$HOME/.themes
sudo flatpak override --filesystem=$HOME/.icons

# good source of themes: https://www.pling.com/u/fkorpsvart
sudo dnf install -y gtk-murrine-engine
sudo dnf install -y gnome-themes-extra


# OpenZIM reader ( the kiwix format)
# https://github.com/birros/web-archives
flatpak install -y com.github.birros.WebArchives


# TMUX Plugin Manager
# see https://github.com/tmux-plugins/tpm
# plugin list: https://github.com/tmux-plugins/list
# spotify: https://github.com/pwittchen/tmux-plugin-spotify
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm



# FONTS
# ligatures baby
dnf install fira-code-fonts



# DARKTABLE
# see https://software.opensuse.org/download.html?project=graphics:darktable&package=darktable
sudo dnf config-manager --add-repo https://download.opensuse.org/repositories/graphics:darktable/Fedora_38/graphics:darktable.repo
sudo dnf install -y darktable


### GRUB THEMES
# see https://github.com/jacksaur/Gorgeous-GRUB on how to customize GRUB
# I like Matter
# here: 
# wget https://github.com/mateosss/matter/releases/latest/download/matter.zip
# quickstart guide:
# https://github.com/mateosss/matter#quick-start
# It should be already grabbed if you just ported over the whole home directory
# source of icons:
# https://pictogrammers.com/library/mdi/
cd ~//boot-customization/grub-customization/matter
sudo python ./matter.py # this gets a list of GRUB entries
# sudo ./matter.py -i fedora fedora fedora fedora microsoft-windows cog
# and that will match the svg names in ~/matter/icons to the entries listed
# ./matter.py -u # to completely remove matter
# sudo ./matter.py --fontfile ~/grub-customization/Inter-V.ttf --fontname Inter Variable --fontsize 40



# Inter font .ttf (the version of inter I use with my OS is .otf, but Matter uses .ttf, hopefully it looks similar enough)
# grabzip https://www.fontsquirrel.com/fonts/download/inter
# 


# SETTING BOOT SPLASH SCREEN / ANIMATION
# prerequisites, should already be installed
sudo dnf install -y plymouth plymouth-themes
# collection of themes and short guide:
# https://www.gnome-look.org/browse?cat=108&ord=l
# on fedora run:
# plymouth-set-default-theme
# to check your current theme
# plymouth-set-default-theme --list
# to get the available themes
# sudo plymouth-set-default-theme tribar -R
# to change it, and
# sudo cp -r .angular /usr/share/plymouth/themes/
# to move a folder containing a collection of images into the library
# note: got error trying to set it, just installed plymouth-plugin-script to fix it



# edit ~/.config/user-dirs.dirs to change default folder under home




# overskride bluetooth manager written in Rust
# from https://github.com/kaii-lb/overskride
sudo systemctl enable --now bluetooth
curl -sSL https://github.com/kaii-lb/overskride/releases/latest/download/overskride.flatpak -o ~/overskride.flatpak
sudo flatpak install -y ~/overskride.flatpak
rm ~/overskride.flatpak







# fc-list to get fonts



# make dnf faster and parallel
# see https://bash-prompt.net/guides/bash-dnf-speed/
# sudo nano /etc/dnf/dnf.conf
# add
# max_parallel_downloads=20
# fastestmirror=True
# also allows you to change the number of kernels to retain

# freetube youtube client
# see https://freetubeapp.io/
sudo dnf install https://github.com/FreeTubeApp/FreeTube/releases/download/v0.19.1-beta/freetube_0.19.1_amd64.rpm




echo "please reboot"



