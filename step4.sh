pacman -S grub dialog
#grub可以暫時不用裝，在宿主系統中mkconfig更新一下就可以啓動系統了
#grub-install  /dev/sda
#grub-mkconfig -o /boot/grub/grub.cfg
pacman -S sudo wpa_supplicant xf86-input-evdev nvidia-libgl
pacman -S nvidia libx264 ttf-ubuntu-font-family ttf-freefont
pacman -S gvim firefox  vlc  thunderbird wmctrl xdotool   
#############################for fvwm
#pacman -S fvwm
#pacman -S xorg sddm fvwm
#systemctl enable sddm
#ln -s /opt/cuda/  /usr/local/cuda-7.5       
