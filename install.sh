#!/bin/bash
os=$(uname -m)
x="0"
if [ "$x" == 0 ]; then
	if [ -f /usr/bin/yaourt ]; then #CHECK IF YAOURT IS INSTALLED
		if [ -f /usr/bin/Xorg ]; then #CHECK IF XORG-SERVER IS INSTALLED
			x="1"; else 
			if [ "$os" == 'armv7l' ]; then #CHECK IF IT's ARMV7L
				clear
				echo Installing packages for armv7l
				sleep 2
				yaourt -Sy ~/toinstall/packagesall.txt && x="0"; else
				clear
				echo Installing packages for non-armv7l
				sleep 2
				yaourt -Sy ~/toinstall/packagesall.txt --noconfirm && x="0";
			fi
		fi
	else if [ -f /usr/bin/wget ]; then #CHECK IF WGET IS INSTALLED FOR INSTALLING YAOURT
		clear
		echo Installing Yaourt and dependecies!
		sleep 3
		sudo pacman -S yajl --noconfirm
		wget https://aur.archlinux.org/cgit/aur.git/snapshot/package-query.tar.gz -P ~/
		wget https://aur.archlinux.org/cgit/aur.git/snapshot/yaourt.tar.gz -P ~/ &&
		tar zxf ~/yaourt.tar.gz -C ~/ &&
		tar zxf ~/package-query.tar.gz -C ~/
		cd ~/package-query && makepkg && sudo pacman -U ~/package-query/*.pkg.tar.xz --noconfirm
		cd ~/yaourt && makepkg && sudo pacman -U ~/yaourt/*.pkg.tar.xz --noconfirm
		x="0"; else
		clear
		echo Installing WGET!
		sleep 3
		sudo pacman -S wget --noconfirm && x="0";
		fi
	fi
fi
if [ "$x" == 1 ]; then
	clear
	echo Everything is installed... Now symlinking!
	sleep 3
	mkdir -p ~/.config/i3
	mkdir ~/.config/rofi
	cp ~/toinstall/Monokai.rasi ~/.config/rofi/config.rasi
	ln -sfv ~/toinstall/config ~/.config/i3/config
	ln -sfv ~/toinstall/bashrc ~/.bashrc
	ln -sfv ~/toinstall/conkyrc ~/.conkyrc
	ln -sfv ~/toinstall/i3blocks.conf ~/.i3blocks.conf
	ln -sfv ~/toinstall/Xresources ~/.Xresources
	ln -sfv ~/toinstall/xinitrc ~/.xinitrc
	x="2";
	echo Done! Everything is symlinked. Now POST-INSTALL!
	sleep 3
else	echo $x
fi
wifi=$(basename /sys/class/net/w*) 
if [ "$x" == 2 ]; then 
	echo POST-INSTALL 
	echo Enabling systemctl services!
	sleep 1
	if [ "$(ls -A /sys/class/power_supply/)" ]; then 
		echo Enabling ACPID! && sleep 1
		sudo systemctl enable acpid && sleep 1
	else 
		echo Not enabling ACPID!
	fi
	if [ "$os" == 'armv7l' ]; then #CHECK IF IT's ARMV7L
		echo "Not enabling cpupower" && sleep 1
	else
		sudo systemctl enable cpupower
	fi
	echo "Enabling Wireless Services (NetworkManager)! Detected: $wifi"
	sudo systemctl enable NetworkManager
	sudo gpasswd -a $(whoami) users
	echo "Enabling SLIM"
	sudo systemctl enable slim
	echo POST-INSTALL Finished! Now I will start SLIM for you
	sleep 2
	sudo systemctl start slim
fi
