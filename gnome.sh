#!/bin/bash

sudo pacman -Syyu --noconfirm --needed

### Installation de Bash Complétion
sudo pacman -S --noconfirm --needed bash-completion

### Reflector
sudo pacman -S --noconfirm --needed reflector rsync
sudo reflector --sort rate --save /etc/pacman.d/mirrorlist --country France --protocol https --latest 5 --verbose

### GNOME
sudo pacman -S --noconfirm --needed \
abiword \
alacarte \
baobab \
celluloid \
deja-dup \
eartag \
epiphany \
fragments \
gdm \
geary \
git \
gnome-backgrounds \
gnome-calculator \
gnome-calendar \
gnome-clocks \
gnome-color-manager \
gnome-console \
gnome-contacts \
gnome-control-center \
gnome-disk-utility \
gnome-keyring \
gnome-menus \
gnome-music \
gnome-podcasts \
gnome-remote-desktop \
gnome-session \
gnome-settings-daemon \
gnome-shell \
gnome-shell-extensions \
gnome-software \
gnome-system-monitor \
gnome-text-editor \
gnome-tour \
gnome-user-docs \
gnome-user-share \
gnome-weather \
grilo-plugins \
gnucash \
gnumeric \
gvfs \
gvfs-mtp \
gvfs-nfs \
gvfs-smb \
kodi \
loupe \
malcontent \
nautilus \
newsflash \
papers \
secrets \
shortwave \
rygel \
tecla \
vim \
xdg-desktop-portal-gnome \
xdg-user-dirs-gtk \
yelp

sudo systemctl enable --now gdm

### AUR
sudo pacman -S --noconfirm --needed fakeroot gcc git make
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

### Virtualisation Qemu/KVM
sudo pacman -S --noconfirm --needed dnsmasq libvirt openbsd-netcat qemu virt-manager x11-ssh-askpass
sudo systemctl enable --now libvirtd
sudo usermod -a -G libvirt $USER

### Parefeu
sudo pacman -S --noconfirm --needed ufw
sudo ufw allow ssh
sudo ufw enable

### Gstreamer
sudo pacman -S --noconfirm --needed gst-plugins-{bad,base,good,ugly}

### Polices
sudo pacman -S --noconfirm --needed noto-fonts ttf-bitstream-vera ttf-dejavu ttf-liberation

### Services SystemD
sudo systemctl enable --now avahi-daemon avahi-dnsconfd bluetooth
