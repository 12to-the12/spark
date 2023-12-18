#!/bin/bash
sudo dnf install wget git python3 gperftools-libs libglvnd-glx 

cd ~
wget -q https://raw.githubusercontent.com/AUTOMATIC1111/stable-diffusion-webui/master/webui.sh
chmod +x ./webui.sh
# this should fail with a bad python version
./webui.sh || (echo "script failed" && sudo dnf install python3.10 && cd stable-diffusion-webui &&\
python3.10 -m venv venv && which python && source venv/bin/activate &&\
 pip install --upgrade pip && which python && ./webui.sh)
echo "stable diffusion installed"
sh <(curl -sL https://raw.githubusercontent.com/12to-the12/spark/main/install-models.sh)
sh <(curl -sL https://raw.githubusercontent.com/12to-the12/spark/main/fedora-stable-diffusion-download.sh)