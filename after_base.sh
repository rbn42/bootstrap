pacman -S nvidia xorg #xfce4 
#不用通过xfce4安装startx
pacman -S xorg-xinit  xfce4-panel

pacman -S asciidoc autoconf automake autopep8 cmake ctags \
    dialog fcitx-configtool \
    fcitx-gtk2 fcitx-gtk3 fcitx-qt4 fcitx-qt5 fcitx-rime fcitx-ui-light \
    fish gcc git \
    glibc \
    gzip imagemagick \
    make ntfs-3g \
    opendesktop-fonts pamixer pkg-config pulseaudio pulseaudio-alsa \
    xterm \
    udisks2 \

echo python
pacman -S --noconfirm \
    ipython ipython2 \
    python-docopt \
    python-nose python-numpy python-pandas python-pip python-scipy \
    python2-numpy \
    python2-pip python2-scipy qt5-graphicaleffects qt5-quickcontrols \
    python-pyquery \
    python-pillow \
echo spell
pacman -S --noconfirm aspell-en
echo standalone app
pacman -S \
    feh \
    scrot trash-cli w3m wget wmctrl xdotool \
    htop \
    screenfetch \
    gvim  \
    conky \
    unrar unzip p7zip \
    the_silver_searcher rsync dunst cronie \
    aria2  \
    mpv     ncmpcpp     mpd    mpc \
    unclutter \
    xautomation  \
    openssh  \
    youtube-dl \
    xbindkeys \


#youtube-dl youtube下载?

echo ranger 
pacman -S xsel lynx elinks highlight atool mediainfo

echo ui common
bash ./ui_common.sh --noconfirm 
echo ui qt
bash ./ui_qt.sh --noconfirm 

#img2txt pdftotext 

#startx

#pacman -S xbindkeys
#xbindkeys
#ln -s /opt/cuda/  /usr/local/cuda-7.5       
