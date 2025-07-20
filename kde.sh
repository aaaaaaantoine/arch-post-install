#!/bin/bash

sudo pacman -Syyu --noconfirm --needed

### Bash Complétion
sudo pacman -S --noconfirm --needed bash-completion

### Reflector
sudo pacman -S --noconfirm --needed reflector rsync
sudo reflector --sort rate --save /etc/pacman.d/mirrorlist --country France --protocol https --latest 5 --verbose

### KDE Plasma
sudo pacman -Syyu --noconfirm --needed \
akregator \
ark \
calligra \
dolphin \
dragon \
elisa \
falkon \
gwenview \
kaccounts-integration \
kaccounts-providers \
kaddressbook \
kate \
kcalc \
kdenlive \
kdevelop-meta \
kexi \
kdepim-addons \
kmail \
kodi \
korganizer \
konsole \
kontact \
konversation \
krdc \
krita \
ktorrent \
libvncserver \
partitionmanager \
plasma \
plasma-firewall \
sddm \
vim \
virt-manager \
yakuake

sudo systemctl enable --now sddm

### AUR
sudo pacman -S --noconfirm --needed fakeroot gcc git make
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

### Virtualisation Qemu/KVM
sudo pacman -S --noconfirm --needed dnsmasq libvirt openbsd-netcat qemu x11-ssh-askpass
sudo systemctl enable --now libvirtd
sudo usermod -a -G libvirt $USER

### OpenSSH
sudo pacman -S --noconfirm --needed openssh
sudo systemctl enable --now sshd

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
