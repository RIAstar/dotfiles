echo -e "\n[dot] Installing additional fonts"

curl -LO https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.tar.xz
sudo rm -rf /usr/share/fonts/fira-code
sudo mkdir /usr/share/fonts/fira-code
sudo tar xf FiraCode.tar.xz -C /usr/share/fonts/fira-code
rm FiraCode.tar.xz

sudo ln -svf /mnt/miles/gfx/font/sans-serif/arial /usr/share/fonts
sudo ln -svf /mnt/miles/gfx/font/sans-serif/gill-sans /usr/share/fonts
sudo ln -svf /mnt/miles/gfx/font/bold/kabel /usr/share/fonts
