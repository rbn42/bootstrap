echo arch > /etc/hostname
echo 127.0.0.1     arch >> /etc/hostname
ln -s /usr/share/zoneinfo/Pacific/Auckland /etc/localtime
mkinitcpio -p linux
echo en_US.UTF-8 UTF-8   >> /etc/locale.gen 
echo zh_CN.UTF-8 UTF-8   >> /etc/locale.gen 
locale-gen

pacman -S  grub
pacman -S dialog
grub-install  /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

pacman -S sudo
pacman -S wpa_supplicant
pacman -S xf86-input-evdev
pacman -S nvidia-libgl
pacman -S nvidia
#pacman -S nvidia-dkms
pacman -S fvwm
pacman -S libx264
pacman -S ttf-ubuntu-font-family ttf-freefont
pacman -S gvim firefox  vlc  thunderbird wmctrl xdotool   
