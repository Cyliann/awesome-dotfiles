#Startx Automatically
[[ $(fgconsole 2>/dev/null) == 1 ]] && exec startx -- vt1 &> /dev/null

# MPD daemon start (if no other user instance exists)
[ ! -s ~/.config/mpd/pid ] && mpd

# Set PATH so it includes user's private bin directories
set PATH "$HOME/.scripts:$PATH"
