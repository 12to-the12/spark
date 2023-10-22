#!/bin/bash

# this changes the XDG directories on GNOME to lowercase

# see /home/logan/.config/user-dirs.dirs

cd ~

mkdir desktop
mv ~/Desktop/* ~/desktop/
trash-put ~/Desktop/

mkdir downloads
mv ~/Downloads/* ~/downloads/
trash-put ~/Downloads/

mkdir templates
mv ~/Templates/* ~/templates/
trash-put ~/Templates/

mkdir public
mv ~/Public/* ~/public/
trash-put ~/Public/

mkdir downloads
mv ~/Downloads/* ~/downloads/
trash-put ~/Downloads/

mkdir documents
mv ~/Documents/* ~/documents/
trash-put ~/Documents/

mkdir ~/media/
# cd ~/media/

mkdir ~/media/music
mv ~/Music/* ~/media/music
trash-put ~/Music/

mkdir ~/media/images
mv ~/Pictures/* ~/media/images
trash-put ~/Pictures/

mkdir ~/media/video
mv ~/Videos/* ~/media/video
trash-put ~/Videos/
