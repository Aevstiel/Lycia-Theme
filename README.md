# Lycia Theme

Lycia is a [Material Design](https://material.io) theme for GNOME/GTK based desktop environments.

Based on vinceliuice -- [Orchis Theme](https://github.com/vinceliuice/Orchis-theme/)

![screenshot](images/screenshot.png?raw=true)

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
git clone https://github.com/Aevstiel/Lycia
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

## Other Projects

| Project | GitHub |
| --------------------------- | ----- |
| Colour Palette | [Source](https://github.com/Aevstiel/Lycia) |
| Start Page | [Source](https://github.com/Aevstiel/Lycia) |
| GRUB Theme | [Source](https://github.com/Aevstiel/Lycia-GRUB) |
| Discord Theme | [Source](https://github.com/Aevstiel/Lycia-Discord) |
| Neofetch | [Source](https://github.com/Aevstiel/Lycia-Neofetch) |
