#!/bin/bash

### Reflector
sudo pacman -Sy --noconfirm --needed reflector rsync
sudo reflector --sort rate --save /etc/pacman.d/mirrorlist --country France --protocol https --latest 5 --verbose

### Upgrade
sudo pacman -Syyu --noconfirm --needed

### Bash
sudo pacman -S --noconfirm --needed bash-completion

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
okular \
partitionmanager \
plasma \
plasma-firewall \
sddm \
vim \
virt-manager \
yakuake

### AUR
sudo pacman -S --noconfirm --needed fakeroot gcc git make
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

### Virtualization Qemu/KVM
sudo pacman -S --noconfirm --needed dnsmasq libvirt openbsd-netcat qemu x11-ssh-askpass
sudo usermod -aG libvirt $USER

### Docker
sudo pacman -S --noconfirm --needed docker
sudo usermod -aG docker $USER

### SSH
sudo pacman -S --noconfirm --needed openssh
sudo systemctl enable --now sshd

### Firewall
sudo pacman -S --noconfirm --needed ufw
sudo ufw enable

### Gstreamer
sudo pacman -S --noconfirm --needed gst-plugins-{bad,base,good,ugly}

### Fonts
sudo pacman -S ttf-bitstream-vera ttf-dejavu ttf-liberation

### Services
sudo systemctl enable --now avahi-daemon avahi-dnsconfd bluetooth docker libvirtd sddm
exit 0
