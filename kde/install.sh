#!/bin/bash
sudo pacman -S --needed base-devel

mkdir git
cd git
git clone https://aur.archlinux.org/package-query.git
cd package-query
makepkg -si
cd ..
git clone https://aur.archlinux.org/yaourt.git
cd yaourt
makepkg -si
cd ..

yaourt vim-gnome 
sudo pacman -S wget
sudo pacman -S rofi
sudo pacman -S unzip
sudo pacman -S xdotool wmctrl python-docopt 
sudo pacman -S cmake

sudo pacman -S fcitx fcitx-qt4 fcitx-qt5 fcitx-gtk2 fcitx-gtk3 fcitx-configtool
sudo pacman -S opencc
sudo pacman -S kcm-fcitx 
yaourt fcitx-sogoupinyin

sudo pacman -S screenfetch

sudo pacman -S    wqy-microhei   
sudo pacman -S    wqy-microhei-lite
sudo pacman -S      wqy-bitmapfont
sudo pacman -S      wqy-zenhei
sudo pacman -S      ttf-arphic-ukai
sudo pacman -S      ttf-arphic-uming
sudo pacman -S      adobe-source-han-sans-cn-fonts
