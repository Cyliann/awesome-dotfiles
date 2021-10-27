#!/bin/sh
sudo pacman -S --noconfirm --needed git

echo cloning dotfiles
git clone https://github.com/Cyliann/Dotfiles

echo "installing aur helper (paru)"
sudo pacman -S --noconfirm --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

cd ../Dotfiles

echo "installing packages"
sudo paru -S --noconfirm --skipreview --needed - < pkg_list

echo "moving files"
mv .config ~
mv -t .. .bashrc .profile .xinitrc

echo "moving Wallpapers"
[ ! -d "~/Pictures" ] && mkdir ~/Pictures
mv Wallpapers ~/Pictures

echo "cleaing"
cd ..
rm -rf Dotfiles
rm -rf paru
