# Details
This are my personal dot files. 

You can use and modify them for your personal use.
Arch Linux install script is now completed and ready for use.
Post-Install script also completed and ready for use.
<br />
INSTALLATION
> 1. Install Arch Linux.
> 2. Connect to WIFI using wifi-menu.
> 3. Create user, give root rights, and log in (see below).
> 3. Install GIT and Clone repository (see below).
> 4. Execute ./post_install.sh
<br />After Post-Install script completition, you should reboot your computer and be greeted with SLIM Login Manager.

CREATING USER
> <br />As root:
> 1. useradd -m -G wheel username
> 2. passwd username
> 3. visudo

INSTALLING GIT AND CLONING REPO:
> 1. pacman -S git
> 2. cd ~/ && git clone http://github.com/sini6a/toinstall
<br />Repo must be cloned in home directory.

You can check packages.txt and packages_aur.txt to see what packages are installed to your system and eventually append what you need.

This is still WIP so please be patient. 

# Screenshots
Fake Busy:
![Alt text](/screenshots/scrot1.png?raw=true "Screenshot Fake Busy")
Clean:
![Alt text](/screenshots/scrot2.png?raw=true "Screenshot Clean")
