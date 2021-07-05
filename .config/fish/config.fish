set -g -x fish_greeting ''

wal -r && clear

neofetch

cat ~/.cache/wal/sequences &  

source ~/.bashrc

#Startx Automatically
sh ~/.scripts/auto_startx

# THEME PURE #
set fish_function_path /home/cylian/.config/fish/functions/theme-pure/functions/ $fish_function_path
source /home/cylian/.config/fish/functions/theme-pure/conf.d/pure.fish
