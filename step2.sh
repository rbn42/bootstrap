debootstrap $1 /mnt/installer http://archive.ubuntu.com/ubuntu
cat sources.list | sed "s/vivid/$1/g" >  /mnt/installer/etc/apt/sources.list
