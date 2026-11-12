# Ubuntu installation notes


Install basic tools
sudo apt install vim
sudo apt install curl


Install tailscale

curl -fsSL https://tailscale.com/install.sh | sh
sudo tailscale up

you can check with

systemctl is-enabled tailscaled
systemctl is-active tailscaled
tailscale status

sudo apt update
sudo apt upgrade


enable openssh

sudo apt install openssh-server
sudo systemctl enable --now ssh
whoami
tailscale ip -4

check with
systemctl is-enabled ssh
systemctl is-active ssh


Fix escape switch in ubuntu
sudo apt install gnome-tweaks
gnome-tweaks

install tools using my installation script

install uv


Install vivado

download vivado installer 

sudo mkdir -p /opt/Xilinx
ls -ld /opt/Xilinx/
sudo chown -R "$USER:$USER" /opt/Xilinx
ls -ld /opt/Xilinx/
chmod +x FPGAs_AdaptiveSoCs_Unified_SDI_2025.2.1_0320_0604_Lin64.bin
./FPGAs_AdaptiveSoCs_Unified_SDI_2025.2.1_0320_0604_Lin64.bin

go to 
/opt/Xilinx/2025.2.1/Vivado/data/xicom/cable_drivers/lin64/install_script/install_drivers/
sudo ./install_drivers

install missing drivers
sudo apt-get install libinfo5
sudo apt-get install libtinfo5
sudo apt install libncurses5



sudo apt install make
sudo apt install git
sudo apt install g++
sudo apt install libtinfo6 libncurses6
cat /etc/os-release

sudo apt install tar
sudo apt install gzip
sudo apt install gcc
sudo apt install g++
sudo apt install make
sudo apt install build-essential
sudo apt install python3-pip

sudo apt-get install xclip

install starship

curl -sS https://starship.rs/install.sh | sh
in bashrc
eval "$(starship init bash)"
starship preset plain-text-symbols -o ~/.config/starship.toml


sudo apt install ./code_1.122.1-1780040850_amd64.deb

ps aux | grep gnome-keyring
dpkg -l | grep -E 'libsecret-1-0|libsecret-1-dev'
sudo apt install gnome-keyring

sudo apt install tcl
sudo apt install ./jabref_5.15_amd64.deb
sudo apt install ./zoom_amd64.deb
sudo add-apt-repository ppa:inkscape.dev/stable
sudo apt update
sudo apt install inkscape

wget https://mega.nz/linux/repo/xUbuntu_24.04/amd64/megasync-xUbuntu_24.04_amd64.deb && sudo apt install "$PWD/megasync-xUbuntu_24.04_amd64.deb"

sudo apt install ./rustdesk-1.4.6-x86_64.deb
sudo apt install ./xtigervncviewer_1.16.2-1ubuntu1_amd64.deb
curl -f https://zed.dev/install.sh | sh
sudo apt install zathura
sudo apt install okular
sudo apt install libfuse2t64
wget https://cernboxdistr.web.cern.ch/Linux/repo/cernbox-5.3.2.15486-x86_64.AppImage
sudo apt install qpdfview
sudo apt install zathura
sudo apt install okular
sudo apt install qpdfview
sudo add-apt-repository ppa:appimagelauncher-team/stable
