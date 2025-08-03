#!/bin/bash

### Bash & Vim
sudo pacman -S --noconfirm --needed bash-completion vim

### Reflector
sudo pacman -S --noconfirm --needed reflector rsync
sudo reflector --sort rate --save /etc/pacman.d/mirrorlist --country France --protocol https --latest 5 --verbose

### Virtualization Qemu/KVM
sudo pacman -S --noconfirm --needed libvirt qemu
sudo systemctl enable --now libvirtd
sudo usermod -aG libvirt $USER

### Firewall
sudo pacman -S --noconfirm --needed ufw
sudo ufw allow ssh
sudo ufw enable
exit 0
