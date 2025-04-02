#!/usr/bin/env bash

INSTALL=true

while getopts ":hu" option; do
   case $option in
      h) echo "-u for update only, otherwise full install"
         exit;;
      u) INSTALL=false;;
     \?) echo "Error: Invalid option"
         exit;;
   esac
done

if $INSTALL
then
  echo -e "\n[dot] Installing system from scratch"
else
  echo -e "\n[dot] Updating system"
fi

if $INSTALL
then
  echo -e "\n[dot] Installing system dependencies"
  sudo dnf install eza fish yazi
else
  echo -e "\n[dot] Updating system dependencies"
  sudo dnf update
fi

if $INSTALL
then
  echo -e "\n[dot] Symlinking dotfiles"
  ln -svf "$PWD/config/.gitconfig" ~
  ln -svf "$PWD/config/yazi" ~/.config
  ln -svf "$PWD/fish" ~/.config
fi

if $INSTALL
then
  echo -e "\n[dot] Installing fnm"
  curl -fsSL https://fnm.vercel.app/install | bash
fi

echo -e "\n[dot] Installing additional fonts"
curl -LO https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.tar.xz
sudo rm -rf /usr/share/fonts/fira-code
sudo mkdir /usr/share/fonts/fira-code
sudo tar xf FiraCode.tar.xz -C /usr/share/fonts/fira-code
rm FiraCode.tar.xz

echo -e "\n[dot] Installing NeoVim"
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim
sudo mkdir /opt/nvim
sudo tar -xzf nvim-linux-x86_64.tar.gz -C /opt/nvim --strip-components=1
rm nvim-linux-x86_64.tar.gz
