<div align="center">
<h1 align="center">
<br>Archlinux Post Install
</h1>
<h3>◦ Développé avec les logiciels et outils ci-dessous.</h3>

<p align="center">
<img src="https://img.shields.io/badge/GNU%20Bash-4EAA25.svg?style&logo=GNU-Bash&logoColor=white" alt="GNU%20Bash" />
<img src="https://img.shields.io/badge/Markdown-000000.svg?style&logo=Markdown&logoColor=white" alt="Markdown" />
</p>
<img src="https://img.shields.io/github/languages/top/aaaaaaantoine/arch-post-install?style&color=5D6D7E" alt="GitHub top language" />
<img src="https://img.shields.io/github/languages/code-size/aaaaaaantoine/arch-post-install?style&color=5D6D7E" alt="GitHub code size in bytes" />
<img src="https://img.shields.io/github/commit-activity/m/aaaaaaantoine/arch-post-install?style&color=5D6D7E" alt="GitHub commit activity" />
<img src="https://img.shields.io/badge/License-GPL%20v3-yellow.svg?style&color=5D6D7E" alt="GitHub license" />
</div>

---

 
## 📍 Aperçu

Ce dépôt contient plusieurs scripts bash simple pour installer des logiciels après une installation [Archlinux](https://archlinux.org/download/) KDE Minimale depuis les script ArchInstall.

---

## 📦 Logiciels

<details closed><summary>Liste des paquets pour KDE</summary>

* Calligra
* Digikam
* Elisa
* Ghostwriter
* Kcolorchooser
* Kdenlive
* Kdevelop
* Kexi
* Kid3
* Kodi
* Kontact
* Konversation
* Krita
* Ksystemlog
* Ktorrent
* Kwave
* Plasma-firewall
* Ufw
* Vim
* VirtualBox
* yakuake

</details>

---

## ⚙️ Dépendance

Vérifiez que le paquet curl soit bien installé sur votre système.

```sh
sudo pacman -Sy curl
```

---

## 🤖 Lancer le script

KDE Plasma personnalisé.

```sh
sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/aaaaaaantoine/arch-post-install/main/kde.sh)" 
```
