###chroot 到安装环境
cd /media/$USER/arch/
cd /tmp
wget https://mirrors.kernel.org/archlinux/iso/2016.05.01/archlinux-bootstrap-2016.05.01-x86_64.tar.gz

sudo su

tar xf arch*.tar.gz
mount --bind /tmp/root.x86_64 /tmp/root.x86_64
cd /tmp/root.x86_64
cp /etc/resolv.conf etc
mount -t proc /proc proc
mount --rbind /sys sys
mount --rbind /dev dev
mount --rbind /run run    # (assuming /run exists on the system)
chroot /tmp/root.x86_64 /bin/bash

pacman-key --init
pacman-key --populate archlinux

#chroot内部没有编辑器
sudo vim /tmp/root.x86_64/etc/pacman.d/mirrorlist
pacman -Syyu
pacman -S git
mkdir ~/git
cd ~/git
git clone https://github.com/rbn42/chroot_script.git
cd ~/git/chroot_script
git checkout arch201605
#step1
bash step1.sh

pacman -Syyu
pacman -S git
mkdir ~/git
cd ~/git
git clone https://github.com/rbn42/chroot_script.git
cd ~/git/chroot_script
git checkout arch201605
#step2
bash step2.sh


#备用grub
sudo su
cat /home/iso/grub.cfg >> /tmp/root.x86_64/mnt/boot/grub/grub.cfg

visudo #uncomment /wheel
export u=
useradd -m -g users -G wheel -s /bin/bash $u
passwd $u
su $u


#重启后再做一下步骤,不然会受内核影响?
#安装kde
pacman -S  plasma-desktop 
pacman -S  plasma-wayland-session
startplasmacompositor

pacman -S plasma sddm
#显卡选择nvidia-340xx-libgl
systemctl enable sddm
systemctl start sddm
# nano /etc/sddm.conf
[Theme]
Current=breeze
CursorTheme=breeze_cursors
FacesDir=/usr/share/sddm/faces
ThemeDir=/usr/share/sddm/themes
#kde桌面组件可以全部去掉,用conky顶上,主要需要的是,可以开启rofi,有一个resource monitor,有时间,resource monitor尽量做小,桌面排满字符并不好,有个开始菜单,因为开关机会需要
#即使做到这个程度,title bar很明显浪费了,果然还是unity设计的比较好.
