pacman -S nvidia xorg xfce4 \
    asciidoc autoconf automake autopep8 cmake ctags \
    dialog fcitx-configtool \
    fcitx-gtk2 fcitx-gtk3 fcitx-qt4 fcitx-qt5 fcitx-rime fcitx-ui-light \
    fish gcc git \
    glibc \
    gzip imagemagick \
    make ntfs-3g \
    opendesktop-fonts pamixer pkg-config pulseaudio pulseaudio-alsa \
    xterm \
    udisks2 \

echo font
pacman -S --noconfirm \
    adobe-source-code-pro-fonts adobe-source-han-sans-cn-fonts \
    adobe-source-han-sans-tw-fonts adobe-source-sans-pro-fonts \
    adobe-source-serif-pro-fonts \
    ttf-arphic-ukai ttf-arphic-uming ttf-dejavu ttf-droid ttf-freefont \
    ttf-linux-libertine ttf-ubuntu-font-family wqy-microhei \
    wqy-microhei-lite \
    wqy-zenhei \

echo python
pacman -S --noconfirm \
    ipython ipython2 \
    python-docopt \
    python-nose python-numpy python-pandas python-pip python-scipy \
    python2-numpy \
    python2-pip python2-scipy qt5-graphicaleffects qt5-quickcontrols \
    python-pyquery \

echo standalone app
pacman -S \
    feh \
    scrot trash-cli w3m wget wmctrl xdotool \
    gparted     htop \
    screenfetch \
    gvim  \
    conky \
    unrar unzip p7zip \
    the_silver_searcher rsync dunst cronie \
    aria2 firefox     thunderbird     transmission-gtk \
    thunar \
    mpv     ncmpcpp     mpd    mpc \

echo ranger 
pacman -S xsel lynx elinks highlight atool mediainfo
#img2txt pdftotext 

#startx

#pacman -S xbindkeys
#xbindkeys
#ln -s /opt/cuda/  /usr/local/cuda-7.5       
