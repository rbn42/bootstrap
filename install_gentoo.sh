#在ubuntu1604环境下安装
#stage4的编译倒是没什么问题
#失败于equo rescue generate这个步骤,过不去
sudo su
export DEV_ROOT=/dev/sda2
export DEV_HOME=/dev/sda5
export TARBAR="http://distfiles.gentoo.org/releases/amd64/autobuilds/20160526/stage4-amd64-minimal-20160526.tar.bz2"
#格式化一个分区,挂载到/mnt/installer
bash step1.sh $DEV_ROOT
ln -s /mnt/installer /mnt/sabayon
ln -s /mnt/installer /mnt/gentoo
bash ./download_tarbar.sh $TARBAR
#生成fstab，默認關閉了/home
bash ./gen-fstab.sh $DEV_ROOT $DEV_HOME > /mnt/installer/etc/fstab
#mkdir /mnt/gentoo/etc/portage/repos.conf
#cp /mnt/gentoo/usr/share/portage/config/repos.conf /mnt/gentoo/etc/portage/repos.conf/gentoo.conf

#rm /dev/shm && mkdir /dev/shm
#mount -t tmpfs -o nosuid,nodev,noexec shm /dev/shm
##Also ensure that mode 1777 is set
#chmod 1777 /dev/shm

bash ./chroot.sh
cd

export LANG=en_US
export LANGUAGE=${LANG}
export LC_ALL=${LANG}.UTF-8
env-update
eselect python set 1    #sets python 2.7 as default
source /etc/profile
ls -sf /usr/share/zoneinfo/Pacific/Auckland /etc/localtime 
#echo hostname=\"sabayon\" > /etc/conf.d/hostname
#echo 127.0.0.1 sabayon > /etc/hosts

#
mv /usr/portage/metadata/timestamp.x  ./
emerge-webrsync
emerge --sync
#emerge -auDN @world
#Entropy and Equo
emerge -avt equo --autounmask-write
etc-update
emerge -avt equo
emerge -avt entropy

#First things first, knowing that Entropy databases are sqlite3, I created an empty sqlite3 database :

cd /var/lib/entropy/client/database/amd64
sqlite3 equo.db
#Inside that database I created one random table, and saved it :
'''
create table randomtable(randomvalue);
.quit
'''
#Tried to create the database one more time :
equo rescue generate
equo rescue generate
equo rescue resurrect


source /etc/profile

eselect profile list
eselect profile set 3

echo "Pacific/Auckland" > /etc/timezone
emerge --config sys-libs/timezone-data
bash setlocale.sh
env-update && source /etc/profile && export PS1="(chroot) $PS1"

emerge --ask sys-kernel/gentoo-sources
emerge --ask sys-kernel/genkernel
genkernel all

#不過gentoo管理grub太麻煩了，還是給ubuntu處理
emerge linux-firmware networkmanager
rc-update add NetworkManager default
