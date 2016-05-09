#安装工具
#這東西在arch下面弄有很大問題，可能最好用ubuntu來處理
sudo apt-get install debootstrap
cd ~/git/chroot_script
sudo su
export DEV_ROOT=/dev/sda7
export DEV_HOME=/dev/sda5
#格式化一个分区,挂载到/mnt/installer
bash step1.sh $DEV_ROOT
#下载ubuntu 15.04 系统
bash step2.sh vivid
#生成fstab，默認關閉了/home
bash ./gen-fstab.sh $DEV_ROOT $DEV_HOME > /mnt/installer/etc/fstab
#chroot
bash chroot.sh
cd 
#語言設定
source setlocale.sh en US UTF-8
#時區設定
bash settimezone.sh Pacific/Auckland
#添加32位支持；
dpkg --add-architecture i386
#主機名設定
bash sethostname.sh ubuntu
#軟件包
bash step6.sh
#n卡驅動前置操作，不是n卡不要執行
bash nvidia-pre.sh "http://us.download.nvidia.com/XFree86/Linux-x86_64/361.42/NVIDIA-Linux-x86_64-361.42.run"
#添加一个管理员账号
bash adduser.sh username
#手动生成grub.cfg或者可以在宿主系統grub-mkconfig更新添加新系統
#grub-mkconfig -o /boot/grub/grub.cfg   
#手动安装grub引导
#grub-install /dev/sda
#以防万一，检查下grub.cfg生成正确。
vi /boot/grub/grub.cfg

#重启系统，

#如果是n卡，并且做了我上面说的操作，那么大概进不了gui 按ctrl+alt+f1进入tty界面，用管理员账号登陆
sudo su
cd
#安装n卡驱动
#但是這裏安裝的時候32bit庫還是無法安裝成功，如果需要32bit支持，需要補充一些軟件包，在step8.sh中有。
bash nvidia-install.sh
#重啓測試
reboot

#安裝其他軟件
sudo su
cd
bash step8.sh
