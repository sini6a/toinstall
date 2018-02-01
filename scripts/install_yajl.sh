#!/bin/bash
clear

echo "--> WGET Installed! <--"
echo "--- Installing YAJL ---"
sleep 3
sudo pacman -S yajl --noconfirm --needed || sleep infinity
echo "--> YAJL Installed! <--" && sleep 3 && clear
