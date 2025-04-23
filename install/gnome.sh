echo -e "\n[dot] Configuring Gnome"

# Text editor
dconf write /org/gnome/TextEditor/custom-font "'FiraCode Nerd Font 11'"
dconf write /org/gnome/TextEditor/use-system-font "false"

# Appearance
dconf write /org/gnome/desktop/background/picture-uri "'file:///usr/share/backgrounds/gnome/drool-l.svg'"
dconf write /org/gnome/desktop/background/picture-uri-dark "'file:///usr/share/backgrounds/gnome/drool-d.svg'"
dconf write /org/gnome/desktop/background/primary-color "'#86b6ef'"
dconf write /org/gnome/desktop/background/secondary-color "'#000000'"

dconf write /org/gnome/desktop/screensaver/picture-uri "'file:///usr/share/backgrounds/gnome/drool-l.svg'"
dconf write /org/gnome/desktop/screensaver/primary-color "'#86b6ef'"
dconf write /org/gnome/desktop/screensaver/secondary-color "'#000000'"

dconf write /org/gnome/desktop/interface/accent-color "'red'"
dconf write /org/gnome/desktop/interface/color-scheme "'prefer-dark'"
dconf write /org/gnome/desktop/interface/enable-hot-corners "false"

# Windows
dconf write /org/gnome/desktop/wm/preferences/num-workspaces "1"

# Nautilus
dconf write /org/gnome/desktop/nautilus/icon-view/default-zoom-level "'small'"
dconf write /org/gnome/desktop/nautilus/preferences/default-folder-viewer "'list-view'"

# Obsidian
dconf write /org/gnome/portal/filechooser/md.obsidian.Obsidian/last-folder-path "'/home/riastar/notes'"

# Night mode
dconf write /org/gnome/settings-deamon/plugins/color/night-light-enabled "true"
dconf write /org/gnome/settings-deamon/plugins/color/night-light-schedule-automatic "false"
dconf write /org/gnome/settings-deamon/plugins/color/night-light-schedule-from "23.0"
dconf write /org/gnome/settings-deamon/plugins/color/night-light-schedule-to "5.0"

# Power management
dconf write /org/gnome/settings-deamon/plugins/power/power-saver-profile-on-low-battery "false"
dconf write /org/gnome/settings-deamon/plugins/power/sleep-inactive-ac-type "'nothing'"
dconf write /org/gnome/settings-deamon/plugins/power/sleep-inactive-battery-type "'nothing'"
