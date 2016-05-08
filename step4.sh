echo arch > /etc/hostname
echo 127.0.0.1     arch >> /etc/hostname
ln -s /usr/share/zoneinfo/Pacific/Auckland /etc/localtime
mkinitcpio -p linux
echo en_US.UTF-8 UTF-8   >> /etc/locale.gen 
echo zh_CN.UTF-8 UTF-8   >> /etc/locale.gen 
echo localectl set-locale LANG=en_US.UTF-8 >> /etc/locale.conf
locale-gen

pacman -S  grub
pacman -S dialog
#grub可以暫時不用裝，在宿主系統中mkconfig更新一下就可以啓動系統了
#grub-install  /dev/sda
#grub-mkconfig -o /boot/grub/grub.cfg

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

#############################for fvwm
pacman -S xorg sddm fvwm
systemctl enable sddm
ln -s /opt/cuda/  /usr/local/cuda-7.5       
