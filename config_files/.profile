#Startx Automatically
[[ $(fgconsole 2>/dev/null) == 1 ]] && exec startx -- vt1 &> /dev/null

if [ -n "$DESKTOP_SESSION" ];then					#
    eval $(gnome-keyring-daemon --start)	# Start gnome-keyring
    export SSH_AUTH_SOCK									#
fi

# Set PATH so it includes user's private bin directories
set PATH "$HOME/.scripts:$PATH"
