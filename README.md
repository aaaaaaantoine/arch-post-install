# Arch Linux Minimal Post-Install

## Aperçu

* Ce dépôt contient plusieurs scripts bash simple pour installer des logiciels après une installation de [Archlinux](https://www.archlinux.org/) Minimal depuis le script d'installation fourni dans l'iso "Arch-Install".

* **gnome.sh** pour un GNOME personnalisé.
* **server.sh** pour un serveur de virtualisation prêt à l'emploi avec le WebUI Cockpit et Libvirt.

<details closed><summary>Liste des paquets pour GNOME</summary>

* Abiword
* Alacarte
* Celluloid
* Deja-dup
* Epiphany
* Geary
* Gnome Builder
* Gnome Calendar
* Gnome Console
* Gnome Music
* Gnucash
* Gnumeric
* Kodi
* Secrets
* shortwave
* Ufw
* Vim 

</details>

<details closed><summary>Liste des paquets pour Server</summary>

* Cockpit
* Libvirt
* SSH
* Rsync
* Ufw
* Vim

</details>

## Lancer le script

* Bureau GNOME personnalisé.
```sh
bash -c "$(curl -fsSL https://raw.githubusercontent.com/aaaaaaantoine/arch-post-install/main/gnome.sh)" 
```

* Arch Server prêt à l'emploi.
```sh
bash -c "$(curl -fsSL https://raw.githubusercontent.com/aaaaaaantoine/arch-post-install/main/server.sh)" 
```

---

### Pont réseau pour vos VM avec netctl
```sh
sudo pacman -S --noconfirm --needed bridge-utils netctl
sudo vim /etc/netctl/bridge
```

```txt
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
