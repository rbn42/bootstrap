#建立/root
mkdir -p /mnt/fedora/var/lib/rpm
rpm --root /mnt/fedora --initdb
rpm --rebuilddb --root=/mnt/fedora
cd /mnt/fedora
wget "http://ucmirror.canterbury.ac.nz/linux/fedora/linux//releases/23/Everything/x86_64/os/Packages/f/fedora-release-23-1.noarch.rpm"
# populate /mnt/fedora/etc with information about the fedora repositories
rpm -i --root=/mnt/fedora --nodeps /mnt/fedora/fedora-release*
mkdir /mnt/fedora/proc
mkdir /mnt/fedora/dev
mkdir /mnt/fedora/sys   
mount -o bind /proc /mnt/fedora/proc
mount -o bind /dev /mnt/fedora/dev
mount -o bind /sys /mnt/fedora/sys
yum --installroot=/mnt/fedora  install -y yum

ln -s /mnt/fedora/etc/pki /etc/pki
rpm -ivh --force-debian --nodeps --root /mnt/fedora fedora-release*rpm
yum --installroot /mnt/fedora install yum

mount -t proc proc /mnt/fedora/proc
mount -t sysfs sysfs /mnt/fedora/sys
chroot /mnt/fedora /bin/bash --login

#debootstrap $1 /mnt/installer http://archive.ubuntu.com/ubuntu
#cat sources.list | sed "s/vivid/$1/g" >  /mnt/installer/etc/apt/sources.list
