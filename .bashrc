#
# ~/.bashrc
#


# Useful aliases
alias c='clear'
alias ..='cd ..'
alias ls='ls -CF --color=auto'
alias grep='grep --color=auto'
alias gimme='sudo pacman -S'
alias yeet='sudo pacman -R'
alias maria-db='sudo /opt/lampp/bin/mysql -u root'
alias md='mkdir'
alias v='nvim'
alias cat='bat'

# Set PATH so it includes user's private bin directories
set PATH "$HOME/.scripts:$PATH"


