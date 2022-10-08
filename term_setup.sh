#! /usr/bin/bash

apt update && apt upgrade -y

# zsh
apt install zsh
# Set zsh as main shell
chsh -s zsh

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

read -p "Install NodeJS? " -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
  source ~/.zshrc
  nvm install node
  nvm use node
fi
