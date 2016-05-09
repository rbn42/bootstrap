cp *.sh /tmp/root.x86_64/root
mount --bind /tmp/root.x86_64 /tmp/root.x86_64
cd /tmp/root.x86_64
cp /etc/resolv.conf etc/
mount -t proc /proc proc
mount --rbind /sys sys
mount --rbind /dev dev
mount --rbind /run run    # (assuming /run exists on the system)
chroot /tmp/root.x86_64 /bin/bash
