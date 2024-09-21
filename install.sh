#!/bin/bash

# Install packages for both Mac and Linux

# asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.1

# Neovim
asdf plug add neovim
asdf install neovim stable
asdf global neovim stable

# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

# TPM
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
