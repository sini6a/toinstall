#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
export PS1="\\$ [\033[0;32m\]\w\[\033[0;37m\]] > \[$(tput sgr0)\]"

alias peerflix='peerflix --path ~/Videos/'
alias pacman='sudo pacman'
alias mount='sudo mount'
alias umount='sudo umount'
alias :wq='vim'
alias mp3="youtube-dl -x --audio-format mp3 --audio-quality 320K"
export VISUAL="vim"
alias msfconsole="sudo systemctl start postgresql.service && msfconsole -x \"db_connect ${USER}@msf\" && sudo systemctl stop postgresql.service"
alias dvor="ffplay rtsp://192.168.1.200:554/11"
alias unlock="sudo rm /var/lib/pacman/db.lck"
