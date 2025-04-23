#!/bin/bash
# https://espanso.org/docs/install/linux/#wayland-compile

if espanso -V
then
  exit
fi


sudo dnf install -y @development-tools gcc-c++ wl-clipboard libxkbcommon-devel dbus-devel wxGTK-devel.x86_64 &&\
cargo install --force cargo-make --version 0.34.0 &&\
cd /tmp &&\
rm -rf /tmp/espanso &&\
git clone https://github.com/espanso/espanso &&\
cd espanso &&\
cargo make --profile release --env NO_X11=true build-binary &&\
sudo mv target/release/espanso /usr/local/bin/espanso &&\
rm -rf /tmp/espanso &&\
sudo setcap "cap_dac_override+p" $(which espanso) &&\
espanso service register &&\
espanso start

