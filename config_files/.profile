#Startx Automatically
[[ $(fgconsole 2>/dev/null) == 1 ]] && exec startx -- vt1 &> /dev/null


# Set PATH so it includes user's private bin directories
set PATH "$HOME/.scripts:$PATH"
