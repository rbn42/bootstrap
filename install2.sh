#2018-05-29 22:36:55 Tue CST
#arch和非arch下的公有操作
#一些必要的包可以补充进来

cd
bash ./setlocale.sh en_US.UTF-8
bash ./sethostname.sh arch
bash ./settimezone.sh Asia/Shanghai
mkinitcpio -p linux

echo nameserver 8.8.8.8 > /etc/resolv.conf

pacman -S sudo wpa_supplicant dialog grub netctl ppp dhcpcd wpa_actiond pacman-contrib

visudo #uncomment /wheel
bash adduser.sh #username

grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
#到此为止重启,继续安装容易产生错误.
#update grub in ubuntu, reboot
#passwd root # set random passwd, disable root

