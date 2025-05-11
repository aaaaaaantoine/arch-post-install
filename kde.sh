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

# Installation de mes utilitaires pour KDE Plasma
sudo pacman -S --noconfirm \
ark \
calligra \
calligraplan \
digikam \
dragonplayer \
elisa \
firefox \
firefox-i18n-fr \
gwenview \
kate \
kcal \
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
ufw \
vim \
virtualbox \
yakuake

# VirtualBox
sudo gpasswd -a $USER vboxusers

echo "Le script post-installation est terminé, veuillez redémarrer le système"
