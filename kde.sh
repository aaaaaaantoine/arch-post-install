#!/bin/bash

# Script à exécuter après l'installation d'une Archlinux KDE Minimale.
# Commentez les sections qui ne vous intéressent pas.
# Pour l'utiliser vous aurez besoin de sudo et que votre utilisateur soit dans ce groupe.

echo "-----------------------------------------------"
echo "Script Archlinux à usage général"
echo "-----------------------------------------------"

sudo sed -i 's/#VerbosePkgLists/VerbosePkgLists/' /etc/pacman.conf

# Installation de Reflector
sudo pacman -Sy --noconfirm --needed reflector rsync

# Détecter les mirroirs les plus rapide
sudo reflector --save /etc/pacman.d/mirrorlist --country France --sort rate --protocol http --latest 5 --verbose

# Mise à jour du système
sudo pacman -Su --noconfirm

# Installation de KDE Plasma
sudo pacman -S --noconfirm --needed \
akregator \
bash-completion \
calligra \
calligra-plan \
digikam \
dragon \
elisa \
firefox \
firefox-i18n-fr \
firewalld \
ghostwriter \
gwenview \
kaccounts-providers \
kcalc \
kcolorchooser \
kdeconnect \
kdenlive \
kdevelop-meta \
kexi \
kid3 \
kodi \
kontact \
konversation \
krita \
ksystemlog \
ktorrent \
kwave \
okular \
partitionmanager \
virtualbox \
yakuake

# Polices d'écriture
sudo pacman -S --noconfirm --needed \
nerd-fonts \
ttf-bitstream-vera \
ttf-dejavu \
ttf-liberation 

# VirtualBox
sudo gpasswd -a $USER vboxusers

# Services Systemd
sudo systemctl enable --now avahi-daemon avahi-dnsconfd bluetooth sshd
#sudo systemctl enable --now firewalld

echo "Le script post-installation est terminé, veuillez redémarrer le système"
