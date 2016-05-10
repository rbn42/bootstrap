export ROOT_UUID=$(blkid $1 -s UUID -o value)
export HOME_UUID=$(blkid $2 -s UUID -o value)
echo UUID=$ROOT_UUID /               ext4    errors=remount-ro 0       1
echo \#UUID=$HOME_UUID /home           ext4    defaults        0       2
