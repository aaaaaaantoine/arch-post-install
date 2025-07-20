#!/bin/bash

### Installation de Bash Complétion
sudo pacman -S --noconfirm --needed bash-completion nano

### Reflector
sudo pacman -S --noconfirm --needed reflector rsync
sudo reflector --sort rate --save /etc/pacman.d/mirrorlist --country France --protocol https --latest 5 --verbose

### Virtualisation Qemu/KVM
sudo pacman -S --noconfirm --needed libvirt qemu
sudo systemctl enable --now libvirtd
sudo usermod -a -G libvirt $USER

### Cockpit
#sudo pacman -S --noconfirm --needed cockpit
#sudo systemctl enable --now cockpit.socket

### Parefeu
sudo pacman -S --noconfirm --needed ufw
sudo ufw allow ssh
#sudo ufw allow 9090/tcp
sudo ufw enable

exit 0
