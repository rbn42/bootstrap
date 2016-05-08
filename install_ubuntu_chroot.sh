#安装工具
sudo apt-get install debootstrap
#以下全程root操作
sudo su
#格式化一个分区,挂载到/mnt/installer
gparted
export TARGET_DISK="/dev/sda6"
mkdir /mnt/installer
mount $TARGET_DISK /mnt/installer
#下载ubuntu 14.04 系统
debootstrap trusty /mnt/installer http://archive.ubuntu.com/ubuntu
#chroot到14.04系统
mount --bind /dev /mnt/installer/dev
mount --bind /dev/pts /mnt/installer/dev/pts
mount -t proc proc /mnt/installer/proc
mount -t sysfs sys /mnt/installer/sys

cd /mnt/installer/root
git clone https://github.com/rbn42/chroot_script.git
git checkout ubuntu1404

#默认的sources.list里面的源很少，我这里宿主系统就是ubuntu，所以直接复制进去，然后再修改源的版本
#否则的话上网找一份吧
cat  /etc/sources.list > /mnt/install/etc/apt/sources.list
vi /mnt/install/etc/apt/sources.list

chroot /mnt/installer /bin/bash
cd ~/chroot_script
bash step2.sh
#安装grub，有跳提示的时候，可以什么都不选，略过
apt-get install grub-pc -y 
#手动生成grub.cfg
grub-mkconfig -o /boot/grub/grub.cfg   
#手动安装grub引导
grub-install /dev/sda
#以防万一，检查下grub.cfg生成正确。
vi /boot/grub/grub.cfg

#添加一个管理员账号
adduser username
gpasswd -a username sudo
#设定/etc/fstab，这个很重要，简单的做法是复制宿主系统的/etc/fstab到新系统
#这里不展开了，上网查吧
vi /etc/fstab

#重启系统，如果是n卡，并且做了我上面说的操作，那么大概进不了gui 按ctrl+alt+f1进入tty界面，用管理员账号登陆
#停止x
sudo service lightdm stop
#安装n卡驱动
sudo su
cd
bash NVI*
#安装基本全选yes
sudo ln -s /usr/lib/libGL.so.1  /usr/lib/libGL.so
sudo rm /usr/lib/x86_64-linux-gnu/libGL.so 
sudo ln -s /usr/lib/libGL.so /usr/lib/x86_64-linux-gnu/libGL.so 
