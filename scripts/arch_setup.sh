#!/bin/sh

cd ~

sudo pacman -S --needed git nano nvim
sudo pacman -S --needed base-devel

git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si
cd ..

yay

yay -S --needed xorg awesome picom xcape numlockx \
lxappearance lightdm lightdm-gtk-greeter \
noto-fonts-emoji ttf-comic-mono-git wqy-zenhei \
lshw sshfs xdg-user-dirs fish fastfetch cpupower \
pulseaudio pavu-control alsa-utils \
pcmanfm vscodium-bin ffmpeg alacritty meld \
maim xclip slop \
firefox discord spotify steam

mkdir -p .config
cd .config
git clone https://github.com/crispypin/awesomewm-config awesome
cd ~

mkdir -p archive bin documents downloads music pictures proj temp uni videos 
cd proj
git clone https://github.com/crispypin/crispypin

