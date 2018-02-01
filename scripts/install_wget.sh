#!/bin/bash
clear

echo "--- Installing WGET ---"
sleep 3
sudo pacman -S wget --noconfirm --needed || sleep infinity
echo "--> WGET Installed! <--" && sleep 3 && clear 
