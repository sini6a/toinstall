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
# Copy rofi config
cp ~/toinstall/configs/rofi_config ~/.config/rofi/config.rasi
# Symlink everything else
ln -sfv ~/toinstall/configs/i3_config ~/.config/i3/config
ln -sfv ~/toinstall/configs/bash_config ~/.bashrc
ln -sfv ~/toinstall/configs/conky_config ~/.conkyrc
ln -sfv ~/toinstall/configs/i3blocks_config ~/.i3blocks.conf
ln -sfv ~/toinstall/configs/compton_config ~/.compton.conf
ln -sfv ~/toinstall/configs/Xresources ~/.Xresources
ln -sfv ~/toinstall/configs/xinitrc ~/.xinitrc
echo "--> Everything symlinked! <--" && sleep 3 && clear
