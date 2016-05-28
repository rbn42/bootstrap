cd /mnt/gentoo
wget $1
tar xvjpf *.tar.bz2 --xattrs
wget "http://distfiles.gentoo.org/snapshots/portage-latest.tar.bz2"
tar xfpj portage-latest.tar.bz2 -C /mnt/sabayon/usr
