cd /mnt/funtoo
wget "http://distfiles.gentoo.org/releases/amd64/autobuilds/20160505/stage3-amd64-20160505.tar.bz2"
tar xvjpf stage3-*.tar.bz2 --xattrs
wget "http://distfiles.gentoo.org/snapshots/portage-latest.tar.bz2"
tar xfpj portage-latest.tar.bz2 -C /mnt/sabayon/usr
