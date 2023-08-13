echo "And we see a spark of life"

echo "Please refer to"
echo "https://asus-linux.org/wiki/fedora-guide/"

sudo dnf update -y

sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm


sudo dnf update -y
sudo dnf install kernel-devel
sudo dnf install akmod-nvidia xorg-x11-drv-nvidia-cuda

sudo systemctl enable nvidia-hibernate.service nvidia-suspend.service nvidia-resume.service nvidia-powerd.service


sudo dnf copr enable lukenukem/asus-linux
sudo dnf update


sudo dnf install asusctl supergfxctl
sudo dnf update --refresh
sudo systemctl enable supergfxd.service

sudo dnf install asusctl-rog-gui

sudo dnf install openssh-server
sudo systemctl enable sshd
sudo systemctl start sshd
sudo systemctl status sshd

echo "Then reboot"