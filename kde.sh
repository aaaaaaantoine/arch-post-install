#!/bin/bash

# Script à exécuter après l'installation d'une Archlinux KDE Minimale.
# Commentez les sections qui ne vous intéressent pas.
# Pour l'utiliser vous aurez besoin de sudo et que votre utilisateur soit dans ce groupe.

echo "-----------------------------------------------"
echo "Script Archlinux à usage général"
echo "-----------------------------------------------"

# Installation de Reflector
sudo pacman -Sy reflector rsync

# Détecter les mirroirs les plus rapide
sudo reflector \
--save /etc/pacman.d/mirrorlist \
--country France,Germany \
--protocol https \
--latest 5

# Mise à jour du système
sudo pacman -Su

# Installation de KDE Plasma
sudo pacman -S \
bash-completion \
calligra \
calligraplan \
digikam \
dragonplayer \
elisa \
firefox \
firefox-i18n-fr \
firewalld \
gwenview \
kcolorchooser \
kdeconnect \
kdenlive \
kdevelop \
kdevelop-l10n \
kexi \
kid3 \
kodi \
kontact \
konversation \
krita \
ksystemlog \
ktorrent \
kwave \
partitionmanager \
vim \
virtualbox \
yakuake

# Polices d'écriture
sudo pacman -S --noconfirm \
nerd-fonts \
ttf-bitstream-vera \
ttf-dejavu \
ttf-liberation 

# VirtualBox
sudo gpasswd -a $USER vboxusers

# Services Systemd
sudo systemctl enable --now avahi-daemon avahi-dnsconfd bluetooth ssh
#sudo systemctl enable --now firewalld

echo "Le script post-installation est terminé, veuillez redémarrer le système"
