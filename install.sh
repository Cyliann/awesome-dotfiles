#!/bash/sh
sudo pacman -S git

echo cloning dotfiles
#git clone https://github.com/Cyliann/Dotfiles

cd Dotfiles

echo installing packages
sudo pacman -S - < pkg_list

echo moving files
#mv .config ~
#mv -t .bashrc .profile .xinitrc

echo moving Wallpapers
#[ ! -d "~/Pictures" ] && mkdir ~/Pictures
#mv Wallpapers ~/Pictures
