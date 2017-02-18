#!/bin/bash

x="0"
if [ "$x" == 0 ]; then
	if [ -f /usr/bin/yaourt ]; then #CHECK IF YAOURT IS INSTALLED
		if [ -d /etc/X11/ ]; then #CHECK IF XORG-SERVER IS INSTALLED
			x="1"; else 
			if [ uname -m == "armv7l" ]; then #CHECK IF IT's ARMV7L
				clear
				echo Installing packages for armv7l
				sleep 2
				cd ~/toinstall && yaourt -Syu packagesall.txt && x="0"; else
				clear
				echo Installing packages for non-armv7l
				sleep 2
				cd ~/toinstall && yaourt -Syu packagesall.txt --noconfirm && x="0";
			fi
		fi
	else if [ -f /usr/bin/wget ]; then #CHECK IF WGET IS INSTALLED FOR INSTALLING YAOURT
		clear
		echo Installing Yaourt and dependecies!
		sleep 3
		sudo pacman -S yajl --noconfirm
		wget https://aur.archlinux.org/cgit/aur.git/snapshot/package-query.tar.gz -P ~/
		wget https://aur.archlinux.org/cgit/aur.git/snapshot/yaourt.tar.gz -P ~/
		tar -zxf ~/*.tar.gz
		cd ~/package-query && makepkg && sudo pacman -U *.pkg.tar.gz
		cd ~/yaourt && makepkg && sudo pacman -U *.pkg.tar.gz 
		x="0"; else
		clear
		echo Installing WGET!
		sleep 3
		sudo pacman -S wget && x="0";
		fi
	fi
fi
if [ "$x" == 1 ]; then
	clear
	echo Everything is installed... Now symlinking!
	sleep 3
	mkdir -p ~/.config/i3
	ln -sf ~/toinstall/config ~/.config/i3/config
	ln -sf ~/toinstall/bashrc ~/.bashrc
	ln -sf ~/toinstall/conkyrc ~/.conkyrc
	ln -sf ~/toinstall/i3blocks.conf ~/.i3blocks.conf
	ln -sf ~/toinstall/Xresources ~/.Xresources
	x="2";
	echo Done! Everything is symlinked. Now POST-INSTALL!
	sleep 3
else	echo $x
fi
if [ "$x" == 2 ]; then 
	echo POST-INSTALL 
	echo Enabling systemctl services!
	sleep 1
	echo Enabling SLIM!
	sudo systemctl enable slim && sleep 1
	if [ -z acpi ]; then 
		echo Not enabling ACPID! && sleep 1
	else 
		echo Enabling ACPID!
		sudo systemctl enable acpid && sleep 1
	fi
	echo Enabling NETCTL-AUTO!
	sudo systemctl enable netctl-auto@$(basename /sys/class/net/w*) && sleep 1
	echo POST-INSTALL Finished, please reboot!
	sleep 1
fi
