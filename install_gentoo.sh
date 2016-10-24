#尝试在u16安装
sudo su
DEV_ROOT=/dev/sda6
DEV_HOME=/dev/sda5
#格式化一个分区,挂载到/mnt/installer
bash step1.sh $DEV_ROOT
ln -s /mnt/installer /mnt/gentoo
URL="http://distfiles.gentoo.org/releases/amd64/autobuilds/20160505/stage3-amd64-20160505.tar.bz2"
URL="http://distfiles.gentoo.org/releases/amd64/autobuilds/20160526/stage4-amd64-minimal-20160526.tar.bz2"
URL="http://distfiles.gentoo.org/releases/amd64/autobuilds/current-stage4-amd64-minimal/stage4-amd64-minimal-20161020.tar.bz2"
bash ./download_tarbar.sh "$URL"
#生成fstab，默認關閉了/home
bash ./gen-fstab.sh $DEV_ROOT $DEV_HOME > /mnt/installer/etc/fstab
mkdir /mnt/gentoo/etc/portage/repos.conf
cp /mnt/gentoo/usr/share/portage/config/repos.conf /mnt/gentoo/etc/portage/repos.conf/gentoo.conf
bash ./chroot.sh
cd
source /etc/profile

emerge-webrsync
emerge --sync
emerge -auDN @world
eselect profile list
eselect profile set 3

echo "Pacific/Auckland" > /etc/timezone
emerge --config sys-libs/timezone-data
bash setlocale.sh
env-update && source /etc/profile && export PS1="(chroot) $PS1"

emerge --ask sys-kernel/gentoo-sources
emerge --ask sys-kernel/genkernel
#u16编译出现segmentation fault,或许要换成arch或者gentoo原盘才行
genkernel all

#不過gentoo管理grub太麻煩了，還是給ubuntu處理
emerge linux-firmware networkmanager
rc-update add NetworkManager default
