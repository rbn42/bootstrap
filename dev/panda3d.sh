#sudo apt -y install build-essential pkg-config python-dev libpng-dev libjpeg-dev libtiff-dev zlib1g-dev libssl-dev libx11-dev libgl1-mesa-dev libxrandr-dev libxxf86dga-dev libxcursor-dev bison flex libfreetype6-dev libvorbis-dev libeigen3-dev libopenal-dev libode-dev libbullet-dev nvidia-cg-toolkit libgtk2.0-dev

#sudo pacman -S opencv
#sudo pacman -S bullet
#sudo pacman -S nvidia-cg-toolkit
#sudo pacman -S ode
#sudo pacman -S fftw

#ln -s /usr/lib/libGL.so.xx.xx.xx /usr/lib/libGL.so

#python2 python3 只能装一个,因为so库文件的路径是重叠的.
#暂时先装上之前用过的python2

cd ~/git
git clone https://github.com/panda3d/panda3d.git
mv panda3d panda3d-py2
cd panda3d-py2
python2.7 makepanda/makepanda.py --everything --installer  --no-vision   --threads 2
#编译很容易失败,重启电脑多试几次.
sudo python2.7 makepanda/installpanda.py 
sudo ldconfig


cd ~/git
git clone https://github.com/panda3d/panda3d.git
cd panda3d
python3 makepanda/makepanda.py --everything --installer  --no-vision   --threads 2
#编译很容易失败,重启电脑多试几次.
sudo python3 makepanda/installpanda.py 
sudo ldconfig


