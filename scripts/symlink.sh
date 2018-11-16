#!/bin/bash
clear

echo "--> WGET Installed! <--"
echo "--> YAJL Installed! <--"
echo "--> YAOURT Installed! <--"
echo "--> Packages installed! <--"
echo "--- Symlinking config files ---"
sleep 3

# Create needed directories
mkdir -p ~/.config/i3
mkdir -p ~/.config/rofi
mkdir -p ~/.config/openbox

# Copy rofi config
cp ~/toinstall/configs/rofi_config ~/.config/rofi/config.rasi

# Symlink bash and X
ln -sfv ~/toinstall/configs/bash_config ~/.bashrc
ln -sfv ~/toinstall/configs/conky_config ~/.conkyrc
ln -sfv ~/toinstall/configs/Xresources ~/.Xresources
ln -sfv ~/toinstall/configs/xinitrc ~/.xinitrc

# Symlink compton
ln -sfv ~/toinstall/configs/compton_config ~/.compton.conf

# Symlink i3
ln -sfv ~/toinstall/configs/i3/i3_config ~/.config/i3/config
ln -sfv ~/toinstall/configs/i3/i3blocks_config ~/.i3blocks.conf

# Symlink openbox
ln -sfv ~/toinstall/configs/openbox/main_config ~/.config/openbox/rc.xml
ln -sfv ~/toinstall/configs/openbox/autostart ~/.config/openbox/autostart
ln -sfv ~/toinstall/configs/openbox/menu_config ~/.config/openbox/menu.xml

echo "--> Everything symlinked! <--" && sleep 3 && clear

