<h1 align="center">
  <a href="https://github.com/Aevstiel/Lycia-Theme/">Lycia</a> Theme
</h3>

<p align="center">
  <a href="https://github.com/Aevstiel/Lycia-Theme/stargazers">
    <img src="https://img.shields.io/github/stars/Aevstiel/Lycia-Theme?style=for-the-badge&logo=starship&color=CC4B63&logoColor=E3BFF2&labelColor=140E1A">
  </a>
  <a href="https://github.com/Aevstiel/Lycia-Theme/issues">
    <img src="https://img.shields.io/github/issues/Aevstiel/Lycia-Theme?style=for-the-badge&logo=gitbook&color=AC5ED6&logoColor=E3BFF2&labelColor=140E1A">
  </a>
  <a href="https://github.com/Aevstiel/Lycia-Theme/contributors">
    <img src="https://img.shields.io/github/contributors/Aevstiel/Lycia-Theme?style=for-the-badge&logo=github&color=DEABAB&logoColor=E3BFF2&labelColor=140E1A">
  </a>
</p>

<p align="center">
  <a href="https://stand-with-ukraine.pp.ua">
    <img alt="StandWithUkraine" src="https://img.shields.io/badge/Support-Ukraine-FFC93C?style=for-the-badge&logoColor=cad3f5&labelColor=07689F">
  </a>
</p>

Lycia is a modern GNOME theme using the Lycia soft colours and contemporary GTK4 design language.

![screenshot](images/screenshot.png?raw=true)

## Features
- GNOME Shell
- GDM Login Screen
- GTK4 / Libadwaita Support
- GTK3 / Legacy
- Constant Updates

## Requirements

- GTK `>=3.20`
- `gnome-themes-extra` (or `gnome-themes-standard`)
- Murrine engine — The package name depends on the distro.
  - `gtk-engine-murrine` on Arch Linux
  - `gtk-murrine-engine` on Fedora
  - `gtk2-engine-murrine` on openSUSE
  - `gtk2-engines-murrine` on Debian, Ubuntu, etc.
- `sassc` — build dependency

## Installation

### Manual Installation

Clone this repository to a temporary directory:

```sh
git clone https://github.com/Aevstiel/Lycia-Theme
```

Run the following commands in the terminal:

```sh
sh ./install.sh
```

> [!TIP]
> `./install.sh` asks you if you want to install the GTK 4 theme and the GDM(login screen) theme.


### Fix for Flatpak

```sh
sudo flatpak override --filesystem=xdg-config/gtk-3.0 && sudo flatpak override --filesystem=xdg-config/gtk-4.0
```

## Uninstallation

```sh
sh ./uninstall.sh
```
## Roadmap

### Ecosystem
- [ ] Icon Theme
- [ ] Cursor Theme
- [ ] Wallpaper Collection
- [ ] GRUB Theme
- [ ] Plymouth Theme
- [ ] Firefox Theme
- [ ] Discord Theme
- [ ] Telegram Theme
- [ ] VS Code Theme
- [ ] VS Code Icons
- [ ] Terminal Colour Schemes

### Desktop Support
- [ ] KDE Plasma Support
- [ ] Qt Application Theming
- [ ] Cinnamon Support
- [ ] XFCE Support

### Distribution
- [ ] GNOME-Look Release
- [ ] AUR Package
- [ ] Nix Package

## Other Projects (Work in Progress)

| Project | GitHub |
| --------------------------- | ----- |
| Colour Palette | [Source](https://github.com/Aevstiel/Lycia) |
| Start Page | [Source](https://github.com/Aevstiel/Lycia) |
| GRUB Theme | [Source](https://github.com/Aevstiel/Lycia-GRUB) |
| Discord Theme | [Source](https://github.com/Aevstiel/Lycia-Discord) |
| Neofetch | [Source](https://github.com/Aevstiel/Lycia-Neofetch) |
