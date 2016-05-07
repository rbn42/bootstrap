
cd /tmp
rm -fr arch*
wget https://mirrors.kernel.org/archlinux/iso/2016.05.01/archlinux-bootstrap-2016.05.01-x86_64.tar.gz
tar xf arch*.tar.gz
mount --bind /tmp/root.x86_64 /tmp/root.x86_64
cd /tmp/root.x86_64
cp /etc/resolv.conf etc/
mount -t proc /proc proc
mount --rbind /sys sys
mount --rbind /dev dev
mount --rbind /run run    # (assuming /run exists on the system)


cd /tmp/root.x86_64/root
mkdir git
cd git  
git clone https://github.com/rbn42/chroot_script.git
cd chroot_script
git checkout arch201605


