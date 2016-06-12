export EDITOR=vim
sudoedit /etc/pacman.conf
"""
[multilib]
Include = /etc/pacman.d/mirrorlist
"""
sudo pacman -S wine
