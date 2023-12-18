#!/bin/bash


# install brew
# https://brew.sh/
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


cd ~
wget -q https://raw.githubusercontent.com/AUTOMATIC1111/stable-diffusion-webui/master/webui.sh
chmod +x ./webui.sh
# this should fail with a bad python version
./webui.sh || (brew install python3.10 && cd stable-diffusion-webui &&\
python3.10 -m venv venv && which python && source venv/bin/activate &&\
 pip install --upgrade pip && which python && ./webui.sh)

sh < (curl -sL https://raw.githubusercontent.com/12to-the12/spark/main/install-models.sh)
