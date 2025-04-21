echo -e "\n[dot] Installing gTile Gnome extensions"

curl -LO https://github.com/gTile/gTile/releases/latest/download/gtile.dist.tgz
gnome-extensions install -f ./gtile.dist.tgz
rm ./gtile.dist.tgz

dconf write /org/gnome/shell/extensions/gtile/preset-resize-1 "['<SUPER>Left']"
dconf write /org/gnome/shell/extensions/gtile/preset-resize-2 "['<SUPER>Down']"
dconf write /org/gnome/shell/extensions/gtile/preset-resize-3 "['<SUPER>Right']"
dconf write /org/gnome/shell/extensions/gtile/preset-resize-4 "['<SUPER>Up']"
dconf write /org/gnome/shell/extensions/gtile/resize1 "'6x1 1:1 3:1, 1:1 2:1, 1:1 1:1'"
dconf write /org/gnome/shell/extensions/gtile/resize2 "'6x1 3:1 4:1, 2:1 4:1, 3:1 5:1, 2:1 5:1'"
dconf write /org/gnome/shell/extensions/gtile/resize3 "'6x1 4:1 6:1, 5:1 6:1, 6:1 6:1'"
dconf write /org/gnome/shell/extensions/gtile/resize4 "'6x1 2:1 5:1, 3:1 5:1, 2:1 4:1, 3:1 4:1'"

