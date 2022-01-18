#!/bin/sh

# installs most of the stuff I need in arch, may make it more flexible in the future

cd ~

sudo pacman -S --needed git nano neovim
sudo pacman -S --needed base-devel

git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si
cd ..

yay

yay -S --needed xorg-server xf86-video-amdgpu awesome picom xcape numlockx polkit-gnome \
lxappearance adwaita-dark ly \
noto-fonts-emoji ttf-comic-mono-git wqy-zenhei \
lshw sshfs xdg-user-dirs xdg-utils fuse \
fish fastfetch cpupower \
pulseaudio pavucontrol alsa-utils \
pcmanfm vscodium-bin ffmpeg alacritty meld \
maim xclip slop \
firefox discord spotify

mkdir -p .config
cd .config
git clone https://github.com/crispypin/awesomewm-config awesome
cd ~

mkdir -p archive bin documents downloads music pictures proj temp uni videos .templates .desktop

cd proj
git clone https://github.com/crispypin/crispypin
cp -f crispypin/config/user-dirs.dirs ~/.config/
xdg-user-dirs-update
rmdir Desktop/ Downloads/ Documents/ Pictures/ Music/ Videos/ Templates/ Public/


yay -S --needed steam blender gnome-system-monitor godot obs-studio v4l2loopback-dkms mpv eog gimp multimc5 redshift element-desktop trash-cli file-roller pfetch yt-dlp

