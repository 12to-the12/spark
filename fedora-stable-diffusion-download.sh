#!/bin/bash
sudo dnf install wget git python3 gperftools-libs libglvnd-glx 

cd ~
wget -q https://raw.githubusercontent.com/AUTOMATIC1111/stable-diffusion-webui/master/webui.sh
chmod +x ./webui.sh
# this should fail with a bad python version
./webui.sh || (sudo dnf install python3.10 && cd stable-diffusion-webui &&\
python3.10 -m venv venv && which python && source venv/bin/activate &&\
 pip install --upgrade pip && which python && ./webui.sh)

 