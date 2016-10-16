#
# ~/.bashrc
#

# Check for an interactive session
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='\[\e[1;30m\]» \[\e[0;33m\]\H@\u\[\e[1;30m\]╺─╸\[\e[1;30m\][\[\e[0m\]\W\[\e[1;30m\]]\[\e[1;34m\]\[\e[0m\]\[\e[m \] '
alias peerflix='peerflix --path ~/Videos/'
alias pacman='sudo pacman'
alias mount='sudo mount'
alias umount='sudo umount'
