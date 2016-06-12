#sudo apt -y install build-essential pkg-config python-dev libpng-dev libjpeg-dev libtiff-dev zlib1g-dev libssl-dev libx11-dev libgl1-mesa-dev libxrandr-dev libxxf86dga-dev libxcursor-dev bison flex libfreetype6-dev libvorbis-dev libeigen3-dev libopenal-dev libode-dev libbullet-dev nvidia-cg-toolkit libgtk2.0-dev

#sudo pacman -S opencv
#sudo pacman -S bullet
#sudo pacman -S nvidia-cg-toolkit
#sudo pacman -S ode
#sudo pacman -S fftw

#ln -s /usr/lib/libGL.so.xx.xx.xx /usr/lib/libGL.so
cd ~/git
#rm panda3d -fr
git clone https://github.com/panda3d/panda3d.git
cd panda3d
python2.7 makepanda/makepanda.py --everything --installer  --no-vision   --threads 2 

#sudo dpkg -i panda3d*.deb 
#sudo apt install -f

