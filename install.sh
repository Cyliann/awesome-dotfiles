#!/bin/sh
sudo pacman -S -needed git

echo cloning dotfiles
#git clone https://github.com/Cyliann/Dotfiles

echo "installing aur helper (paru)"
#sudo pacman -S --needed base-devel
#git clone https://aur.archlinux.org/paru.git
#cd paru
#makepkg -si

cd ../Dotfiles

echo "installing packages"
#sudo paru -S - < pkg_list

echo "moving files"
#mv .config ~
#mv -t .. .bashrc .profile .xinitrc

echo "moving Wallpapers"
#[ ! -d "~/Pictures" ] && mkdir ~/Pictures
#mv Wallpapers ~/Pictures

echo "cleaing"
#cd ..
#rm -R Dotfiles
#rm -R paru
