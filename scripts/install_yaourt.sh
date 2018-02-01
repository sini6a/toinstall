#!/bin/bash
clear

echo "--> WGET Installed! <--"
echo "--> YAJL Installed! <--"
echo "--- Installing YAOURT ---"
sleep 3
# Downloading YAOURT from AUR
wget https://aur.archlinux.org/cgit/aur.git/snapshot/package-query.tar.gz -P ~/ || sleep infinity
wget https://aur.archlinux.org/cgit/aur.git/snapshot/yaourt.tar.gz -P ~/ || sleep infinity
# Extracting tar to home dir
tar zxf ~/yaourt.tar.gz -C ~/
tar zxf ~/package-query.tar.gz -C ~/
# Installing packages
cd ~/package-query && makepkg && sudo pacman -U ~/package-query/*.pkg.tar.xz --noconfirm --needed
cd ~/yaourt && makepkg && sudo pacman -U ~/yaourt/*.pkg.tar.xz --noconfirm --needed
# Cleaning up
rm -r ~/package-query*
rm -r ~/yaourt*
echo "--> YAOURT Installed! <--" && sleep 3 && clear
