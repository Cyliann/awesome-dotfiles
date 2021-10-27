#
# ~/.bashrc
#


# Useful aliases
alias c='clear'
alias r='ranger'
alias ..='cd ..'
alias ls='ls -CF --color=auto'
alias grep='grep --color=auto'
alias gimme='sudo pacman -S'
alias yeet='sudo pacman -R'
alias maria-db='sudo /opt/lampp/bin/mysql -u root'
alias md='mkdir'
alias v='nvim'
alias cat='bat'
alias sudo='sudo '
alias music='~/.ncmpcpp/ncmpcpp-ueberzug/ncmpcpp-ueberzug'
alias neofetch='neofetch --ascii ~/.config/neofetch/logo'
alias tree='tree -C'

# Set PATH so it includes user's private bin directories
set PATH "$HOME/.scripts:$PATH"
set PATH "$HOME/.local/bin:$PATH"


