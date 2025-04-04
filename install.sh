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
  echo -e "\n[dot] Installing system (dnf) dependencies"
  sudo dnf install eza fd fzf fish kitty ripgrep yazi xsel
else
  echo -e "\n[dot] Updating system (dnf) dependencies"
  sudo dnf update
fi

if $INSTALL
then
  echo -e "\n[dot] installing Flatpaks"
  flatpak install flathub md.obsidian.Obsidian
else
  echo -e "\n[dot] Updating Flatpaks"
  sudo flatpak update
fi

if $INSTALL
then
  echo -e "\n[dot] Symlinking dotfiles"
  ln -svf "$PWD/config/.gitconfig" ~
  ln -svf "$PWD/config/kitty" ~/.config
  ln -svf "$PWD/config/nvim" ~/.config
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
