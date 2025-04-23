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

./install/fonts.sh
./install/gnome.sh
./install/gtile.sh
./install/neovim.sh
