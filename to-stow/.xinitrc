exec awesome
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

setxkbmap -layout pl

eval $(gnome-keyring-daemon --start) #start gnome-keyring
export SSH_AUTH_SOCK

# MPD daemon start (if no other user instance exists)
[ ! -s ~/.config/mpd/pid ] && mpd
