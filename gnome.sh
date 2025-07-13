#!/bin/bash

### Installation de Bash Complétion
sudo pacman -S --noconfirm --needed bash-completion

### Reflector
sudo pacman -S --noconfirm --needed reflector rsync
sudo reflector --sort rate --save /etc/pacman.d/mirrorlist --country France --protocol https --latest 5 --verbose

### GNOME
sudo pacman -S --noconfirm --needed \
abiword \
alacarte \
celluloid \
deja-dup \
eartag \
epiphany \
fragments \
geary \
gnome \
gnome-builder \
gnome-calendar \
gnome-console \
gnome-music \
gnome-podcasts \
gnucash \
gnumeric \
git \
kodi \
papers \
secrets \
shortwave \
vim 
sudo systemctl enable --now gdm

### AUR
sudo pacman -S --noconfirm --needed fakeroot gcc git make
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

### Virtualisation Qemu/KVM
sudo pacman -S --noconfirm --needed dnsmasq libvirt openbsd-netcat qemu
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
