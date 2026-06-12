#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC_DIR="${SCRIPT_DIR}/src"
THEMES_DIR="${HOME}/.themes"

THEMES=(
    "Lycia"
    "Lycia-hdpi"
    "Lycia-xhdpi"
)

echo "========================================="
echo " Lycia Theme Installer"
echo "========================================="
echo

for theme in "${THEMES[@]}"; do
    if [[ ! -d "${SRC_DIR}/${theme}" ]]; then
        echo "Error: Missing theme directory:"
        echo "  ${SRC_DIR}/${theme}"
        exit 1
    fi
done

mkdir -p "${THEMES_DIR}"

echo "Installing GTK/GNOME themes..."
echo

for theme in "${THEMES[@]}"; do
    echo "→ Installing ${theme}"
    rm -rf "${THEMES_DIR:?}/${theme}"
    cp -a "${SRC_DIR}/${theme}" "${THEMES_DIR}/"
done

echo
echo "Themes installed successfully to:"
echo "  ${THEMES_DIR}"
echo

read -rp "Install GTK4 / Libadwaita theme files? [Y/n]: " install_gtk4

if [[ -z "$install_gtk4" || "$install_gtk4" =~ ^[Yy]$ ]]; then
    echo "Installing GTK4 / Libadwaita theme..."

    mkdir -p "$HOME/.config/gtk-4.0"
    cp -r "src/Lycia/gtk-4.0/." "$HOME/.config/gtk-4.0/"

    echo "GTK4 / Libadwaita files installed."
fi

echo "WARNING:"
echo "Installing the GDM theme modifies system GNOME Shell resources."
echo "This may cause login screen issues or break after GNOME updates."
echo

read -rp "Install GDM theme? [y/N]: " INSTALL_GDM
INSTALL_GDM="${INSTALL_GDM:-N}"

case "${INSTALL_GDM}" in
    [Yy]|[Yy][Ee][Ss])

        GDM_THEME="${SRC_DIR}/Lycia/gnome-shell-theme.gresource"

        if [[ ! -f "${GDM_THEME}" ]]; then
            echo
            echo "Error: GDM theme resource not found:"
            echo "  ${GDM_THEME}"
            exit 1
        fi

        echo
        echo "Installing GDM theme..."
        echo "You may be prompted for your sudo password."
        echo

        sudo cp \
            /usr/share/gnome-shell/gnome-shell-theme.gresource \
            /usr/share/gnome-shell/gnome-shell-theme.gresource.bak

        sudo cp \
            "${GDM_THEME}" \
            /usr/share/gnome-shell/gnome-shell-theme.gresource

        echo
        echo "GDM theme installed."
        echo "Backup created at:"
        echo "  /usr/share/gnome-shell/gnome-shell-theme.gresource.bak"
        ;;

    *)
        echo
        echo "Skipping GDM theme installation."
        ;;
esac

echo
echo "Done."
