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
	ln -sf ~/toinstall/config ~/.config/i3/config
	ln -sf ~/toinstall/bashrc ~/.bashrc
	ln -sf ~/toinstall/conkyrc ~/.conkyrc
	ln -sf ~/toinstall/i3blocks.conf ~/.i3blocks.conf
	ln -sf ~/toinstall/Xresources ~/.Xresources
	ln -sf ~/toinstall/xinitrc ~/.xinitrc
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
	echo Enabling Wireless Services (WICD)! Detected: $wifi
	sudo systemctl enable wicd.service && sleep 1
	sudo gpasswd -a $(whoami) users
	echo RENAMING WIFI ADAPTER IN CONFIG!
	sed -i -- "s/wlan0/$wifi/g" i3blocks.conf
	sed -i -- "s/wlan1/$wifi/g" i3blocks.conf
	sed -i -- "s/wlp1s0/$wifi/g" i3blocks.conf
	sed -i -- "s/wlp2s0/$wifi/g" i3blocks.conf
	sed -i -- "s/wlp3s0/$wifi/g" i3blocks.conf
	sed -i -- "s/wlp4s0/$wifi/g" i3blocks.conf
	sed -i -- "s/wlp5s0/$wifi/g" i3blocks.conf
	echo POST-INSTALL Finished, please start/reboot!
	sleep 1
fi
