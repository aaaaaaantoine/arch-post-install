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

* Libvirt
* SSH
* Rsync
* Ufw
* Vim

</details>

## Lancer le script

* Bureau KDE personnalisé.
```sh
bash -c "$(curl -fsSL https://raw.githubusercontent.com/aaaaaaantoine/arch-post-install/main/kde.sh)" 
```

* Bureau GNOME personnalisé.
```sh
bash -c "$(curl -fsSL https://raw.githubusercontent.com/aaaaaaantoine/arch-post-install/main/gnome.sh)" 
```

* Arch Server prêt à l'emploi.
```sh
bash -c "$(curl -fsSL https://raw.githubusercontent.com/aaaaaaantoine/arch-post-install/main/server.sh)" 
```

---

### Pont réseau pour vos VM avec systemd-networkd
1) Si vous utilisez un gestionnaire de réseau tel que Network Manager, désactiver le.
```sh
sudo systemctl disable --now NetworkManager
```

2) Lancez le service systemd:
```sh
sudo systemctl enable systemd-networkd
sudo systemctl start systemd-networkd
```

3) Fichiers de configuration:

```sh
# nano /etc/systemd/network/10-br0.netdev
```
```sh
[NetDev]
Name=br0
Kind=bridge
```
```sh
# nano /etc/systemd/network/10-br0.network
```
```sh
[Match]
Name=br0

[Network]
Address=192.168.1.50/24
Gateway=192.168.1.1
DNS=192.168.1.1
```

```sh
#nano /etc/systemd/network/20-eth0.network
```

```sh
[Match]
Name=enp1s0

[Network]
Bridge=br0
```

4) En fin, redémarrez le service:

```sh
sudo systemctl restart systemd-networkd
```

5) Vérifiez que la configuration fonctionne bien
```sh
networkctl status
```
