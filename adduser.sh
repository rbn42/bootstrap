useradd -m -g users -G wheel -s /bin/bash $1
passwd $1
