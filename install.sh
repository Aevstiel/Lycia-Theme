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
install_gtk4=${install_gtk4:-Y}

if [[ "$install_gtk4" =~ ^[Yy]$ ]]; then
    GTK4_DIR="$HOME/.config/gtk-4.0"
    THEME_GTK4_DIR="$HOME/.themes/Lycia/gtk-4.0"

    echo "Installing GTK4 / Libadwaita theme..."

    mkdir -p "$GTK4_DIR"

    BACKUP_DIR="$(ls -1dt "$HOME"/.config/gtk-4.0.backup.* 2>/dev/null | head -n1)"

if [[ -z "${BACKUP_DIR:-}" ]]; then
    BACKUP_DIR="$GTK4_DIR.backup.$(date +%Y%m%d-%H%M%S)"
    mkdir -p "$BACKUP_DIR"

    for file in gtk.css gtk-dark.css assets; do
        if [[ -e "$GTK4_DIR/$file" || -L "$GTK4_DIR/$file" ]]; then
            mv "$GTK4_DIR/$file" "$BACKUP_DIR/"
        fi
    done

    echo "GTK4 backup created:"
    echo "  $BACKUP_DIR"
else
    echo "Existing GTK4 backup found:"
    echo "  $BACKUP_DIR"
fi

    ln -sfn "$THEME_GTK4_DIR/gtk.css" "$GTK4_DIR/gtk.css"

    [[ -e "$THEME_GTK4_DIR/gtk-dark.css" ]] && \
        ln -sfn "$THEME_GTK4_DIR/gtk-dark.css" "$GTK4_DIR/gtk-dark.css"

    [[ -e "$THEME_GTK4_DIR/assets" ]] && \
        ln -sfn "$THEME_GTK4_DIR/assets" "$GTK4_DIR/assets"

    echo "GTK4 files installed."
    echo "Backup saved to: $BACKUP_DIR"
fi

echo "WARNING:"
echo "Installing the GDM theme modifies system GNOME Shell resources."
echo "This may cause login screen issues or break after GNOME updates."
echo

read -rp "Install GDM theme? [y/N]: " INSTALL_GDM
INSTALL_GDM="${INSTALL_GDM:-N}"

case "${INSTALL_GDM}" in
    [Yy]|[Yy][Ee][Ss])

        GDM_THEME="${SRC_DIR}/Lycia/gnome-shell/gnome-shell-theme.gresource"

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

        if ! sudo test -f /usr/share/gnome-shell/gnome-shell-theme.gresource.bak; then
    sudo cp \
        /usr/share/gnome-shell/gnome-shell-theme.gresource \
        /usr/share/gnome-shell/gnome-shell-theme.gresource.bak
fi

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
