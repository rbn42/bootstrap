#安装工具
#這東西在arch下面弄有很大問題，可能最好用ubuntu來處理
sudo apt-get install debootstrap
cd ~/git/chroot_script
sudo su
#格式化一个分区,挂载到/mnt/installer
#gparted
bash step1.sh /dev/sda7
chroot /mnt/installer /bin/bash
cd 
bash step2.sh
bash step3.sh
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
