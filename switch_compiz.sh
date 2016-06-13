#yaourt -S compiz-core
mkdir ~/arch-build
cd ~/arch-build


cd ~/arch-build
git clone https://aur.archlinux.org/compiz.git
git clone https://aur.archlinux.org/compiz-core.git
git clone https://aur.archlinux.org/compiz-fusion-plugins-extra.git
git clone https://aur.archlinux.org/compiz-fusion-plugins-experimental.git
#git clone https://aur.archlinux.org/emerald-themes.git

cd ~/arch-build/compiz/;makepkg
cd ~/arch-build/compiz-core;makepkg -i
sudo pacman -R emerald0.9
sudo pacman -R compiz
yaourt -S ccsm
yaourt -S compiz-fusion-plugins-main
cd ~/arch-build/compiz-fusion-plugins-extra;makepkg -i
cd ~/arch-build/compiz-fusion-plugins-experimental;makepkg -i 
yaourt -S emerald

sudo pacman -R emerald compiz-fusion-plugins-extra compiz-fusion-plugins-experimental compiz-fusion-plugins-main ccsm compiz
cd ~/arch-build/compiz/;makepkg -i
yaourt -S emerald0.9

