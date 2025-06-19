## Guide Arch Linux GNOME Post Install

### Mise à jour du système
```sh
sudo pacman -Syyu bash-completion --noconfirm --needed
```

### Reflector
```sh
sudo pacman -S reflector rsync --noconfirm --needed
sudo reflector --sort rate --save /etc/pacman.d/mirrorlist --country France --protocol https --latest 5 --verbose
```

### Installation de l'environnement GNOME
```sh
sudo pacman -S --noconfirm --needed \
abiword \
alacarte \
celluloid \
curl \
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
```

### Logiciels pour suppresion 
```sh
sudo pacman -Rns --noconfirm evince sushi gnome-logs gnome-font-viewer snapshot decibels gnome-maps gnome-characters totem simple-scan
```

### AUR
```sh
sudo pacman -S --noconfirm --needed fakeroot gcc git make
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

### Virtualisation Qemu/KVM
```sh
sudo pacman -S --noconfirm --needed dnsmasq libvirt openbsd-netcat qemu virt-manager
sudo systemctl enable --now libvirtd
sudo usermod -a -G libvirt antoine
```

### Parefeu
```sh
sudo pacman -S --noconfirm --needed ufw
sudo ufw allow ssh
sudo ufw enable
```

### Gstreamer
```sh
sudo pacman -S --noconfirm --needed gst-plugins-{bad,base,good,ugly}
```

### Polices
```sh
sudo pacman -S --noconfirm --needed noto-fonts ttf-bitstream-vera ttf-dejavu ttf-liberation
```

### Services SystemD
```sh
sudo systemctl enable --now avahi-daemon avahi-dnsconfd bleutooth gdm 
```

---

## Créer une connexion par pont pour les VMs
```sh
sudo pacman -S --noconfirm --needed bridge-utils netctl
sudo nano /etc/netctl/bridge

Description="Bridge connection"
Interface=br0
Connection=bridge
BindsToInterfaces=(enp1s0)
MACAddress='52:54:00:a8:b9:6b'
IP=static
Address='192.168.1.31/24'
Gateway='192.168.1.1'
SkipForwardingDelay=yes
```

```sh
sudo netctl enable bridge
sudo netctl start bridge
```
