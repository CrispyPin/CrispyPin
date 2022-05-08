#!/bin/sh

# installs most of the stuff I need in arch, may make it more flexible in the future

cd ~

sudo pacman -S --needed git neovim base-devel

git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si
cd ~

yay

yay -S --needed xorg-server xf86-video-amdgpu awesome picom xcape numlockx polkit-gnome \
lxappearance dracula-gtk-theme ly \
noto-fonts-emoji ttf-comic-mono-git wqy-zenhei \
lshw sshfs xdg-user-dirs xdg-utils fuse \
fish fastfetch pfetch cpupower \
pulseaudio ncpamixer alsa-utils \
pcmanfm vscodium-bin ffmpeg alacritty kitty meld cloc \
maim xclip slop xdotool \
firefox discord spotify

mkdir -p .config
git clone https://github.com/crispypin/awesomewm-config .config/awesome

mkdir -p archive bin documents downloads music pictures proj temp uni videos .templates .desktop

cd proj
git clone https://github.com/crispypin/crispypin
cp -f crispypin/config/user-dirs.dirs ~/.config/
xdg-user-dirs-update
rmdir Desktop/ Downloads/ Documents/ Pictures/ Music/ Videos/ Templates/ Public/


yay -S --needed \
steam obs-studio-git linux-headers v4l2loopback-dkms \
blender btop godot gimp \
mpv feh yt-dlp file-roller \
redshift element-desktop gnome-keyring trash-cli \
gvfs-gphoto2 gvfs-mtp jmtpfs

# for building apriltags
yay -S --needed gst-plugins-good
sudo ln -s /usr/bin/make /usr/bin/gmake
sudo ln -s /usr/lib/glib-2.0/include/glibconfig.h /usr/include/glib-2.0/glibconfig.h


timedatectl set-ntp true
