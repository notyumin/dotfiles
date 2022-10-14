#! /usr/bin/bash

# check for sudo
if [ $EUID != 0 ]; then
  sudo "$0"
  exit
fi

apt update && apt upgrade -y

# zsh
apt install zsh
# Set zsh as main shell
chsh -s $(which zsh)

# P10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
ln -s ./.zshrc ~/.zshrc
ln -s ./.zshenv ~/.zshenv
ln -s ./.p10k.zsh ~/.p10k.zsh

# nvim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage --appimage-extract
./squashfs-root/AppRun --version
mv squashfs-root /
ln -s /squashfs-root/AppRun /usr/bin/nvim

# AstroNvim
git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
nvim +PackerSync

# lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep '"tag_name":' |  sed -E 's/.*"v*([^"]+)".*/\1/')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
sudo tar xf lazygit.tar.gz -C /usr/local/bin lazygit

# Git credentials
git config --global credential.helper store
git config --global user.name "notyumin"
git config --global user.email "notyumin@gmail.com"

# ~~ Languages ~~
read -p "Install Golang? " -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
  goVersion="1.19.2" # need to manually update
  curl -OL "https://go.dev/dl/go${goVersion}.linux-amd64.tar.gz"
  sudo tar -C /usr/local -xvf "go${goVersion}.linux-amd64.tar.gz"
  echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.zshrc
fi

read -p "Install Python? " -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
  sudo apt install python3
fi

read -p "Install Nvm/NodeJS? " -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
  source ~/.zshrc
  nvm install node
  nvm use node
fi
