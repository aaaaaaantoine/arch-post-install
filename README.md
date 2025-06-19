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
gnome-podcasts \
secrets \
shortwave \
vim 
```

### Virtualisation Qemu/KVM
```sh
sudo pacman -S --noconfirm --needed dnsmasq libvirt openbsd-netcat qemu
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
