#!/bin/bash
#
# if ARMARCH = TRUE then install Yaourt and install packages!
x="0"
if [ "$x" == 0 ]; then
	if [ -f /usr/bin/yaourt ]; then
		if [ -d /etc/X11/ ]; then
			x="1"; else 
			if [ uname -m == "armv7l" ]; then
				clear
				echo Installing packages for armv7l
				cd ~/toinstall && yaourt -Syu packagesall.txt && x="0"; else
				clear
				echo Installing packages for non-armv7l
				cd ~/toinstall && yaourt -Syu packagesall.txt --noconfirm && x="0";
			fi
		fi
	else if [ -f /usr/bin/wget ]; then
		clear
		echo Installing Yaourt and dependecies!
		sudo pacman -S yajl --noconfirm
		wget https://aur.archlinux.org/cgit/aur.git/snapshot/package-query.tar.gz -P ~/
		wget https://aur.archlinux.org/cgit/aur.git/snapshot/yaourt.tar.gz -P ~/
		tar -zxf ~/*.tar.gz
		cd ~/package-query && makepkg && sudo pacman -U *.pkg.tar.gz
		cd ~/yaourt && makepkg && sudo pacman -U *.pkg.tar.gz 
		x="0"; else
		clear
		echo Installing WGET!
		sudo pacman -S wget && x="0";
		fi
	fi
fi
if [ "$x" == 1 ]; then
	clear
	echo Everything is installed... Now symlinking!
	mkdir -p ~/.config/i3
	ln -sf ~/toinstall/config ~/.config/i3/config
	ln -sf ~/toinstall/bashrc ~/.bashrc
	ln -sf ~/toinstall/conkyrc ~/.conkyrc
	ln -sf ~/toinstall/i3blocks.conf ~/.i3blocks.conf
	ln -sf ~/toinstall/Xresources ~/.Xresources
	echo Done! Everything is symlinked. ENJOY!!!
else	echo $x
fi

	
