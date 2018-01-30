# Details
This are my personal dot files. 

You can use and modify for your personal use.
For now only my post-install script works as expected and I am working on OS-install script.
<br />These are the steps I use to make same environment on multiple PC's:
1. Install Arch Linux.
2. Connect to WIFI using wifi-menu.
3. Create user, give it root rights, and log in (see below).
3. Install GIT and clone repository (see below).
4. Execute ./post_install.sh
After everything is installed and symlinked you should reboot system and greeted with slim login

- Creating user
As root:
1. useradd -m -G wheel username
2. passwd username
3. visudo

- Installing GIT and cloning repository:
Repo should be cloned in home directory in order for script to work properly.
1. pacman -S git
2. cd ~/ && git clone http://github.com/sini6a/toinstall

You can check packages.txt to see what packages are installed to your system and eventually append what you need.

This is still WIP so please be patient. 

# Screenshots
Fake Busy:
![Alt text](/screenshots/scrot1.png?raw=true "Screenshot Fake Busy")
Clean:
![Alt text](/screenshots/scrot2.png?raw=true "Screenshot Clean")
