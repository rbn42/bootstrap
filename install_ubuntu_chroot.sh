#安装工具
#這東西在arch下面弄有很大問題，可能最好用ubuntu來處理
sudo apt-get install debootstrap
cd ~/git/chroot_script
sudo su
#格式化一个分区,挂载到/mnt/installer
bash step1.sh /dev/sda7
#下载ubuntu 15.04 系统
bash step2.sh vivid
cp *.sh   /mnt/installer/root
chroot /mnt/installer /bin/bash
cd 
#語言設定
bash setlocale.sh en US UTF-8
#時區設定
bash settimezone.sh Pacific/Auckland
#添加32位支持；主機名設定
bash sethostname.sh ubuntu
#軟件包
bash step6.sh
#n卡驅動前置操作，不是n卡不要執行
bash step7.sh

#添加一个管理员账号
bash adduser.sh username

#安装grub，有跳提示的时候，可以什么都不选，略过
apt-get install grub-pc -y 
#手动生成grub.cfg
grub-mkconfig -o /boot/grub/grub.cfg   
#手动安装grub引导
grub-install /dev/sda
#以防万一，检查下grub.cfg生成正确。
vi /boot/grub/grub.cfg

#设定/etc/fstab，設定/home。跳過也可以。
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
