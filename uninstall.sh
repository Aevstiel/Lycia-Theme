#!/usr/bin/env bash

set -euo pipefail

THEMES_DIR="${HOME}/.themes"
GTK4_DIR="${HOME}/.config/gtk-4.0"

THEMES=(
"Lycia"
"Lycia-hdpi"
"Lycia-xhdpi"
)

echo "========================================="
echo " Lycia Theme Uninstaller"
echo "========================================="
echo

echo "Removing installed themes..."

for theme in "${THEMES[@]}"; do
if [[ -d "${THEMES_DIR}/${theme}" ]]; then
echo "→ Removing ${theme}"
rm -rf "${THEMES_DIR:?}/${theme}"
fi
done

echo
echo "Theme directories removed."
echo

read -rp "Restore GTK4 / Libadwaita files from backup? [Y/n]: " RESTORE_GTK4
RESTORE_GTK4="${RESTORE_GTK4:-Y}"

if [[ "${RESTORE_GTK4}" =~ ^[Yy]$ ]]; then
if [[ -d "${GTK4_DIR}" ]]; then
echo
echo "Removing Lycia GTK4 symlinks..."

```
    for file in gtk.css gtk-dark.css assets; do
        if [[ -L "${GTK4_DIR}/${file}" ]]; then
            rm -f "${GTK4_DIR}/${file}"
        fi
    done

    LATEST_BACKUP="$(
        ls -1dt "${HOME}"/.config/gtk-4.0.backup.* 2>/dev/null | head -n1
    )"

    if [[ -n "${LATEST_BACKUP:-}" && -d "${LATEST_BACKUP}" ]]; then
        echo "Restoring backup:"
        echo "  ${LATEST_BACKUP}"

        cp -a "${LATEST_BACKUP}/." "${GTK4_DIR}/"

        echo "GTK4 files restored."
    else
        echo "No GTK4 backup found."
    fi
fi
```

fi

echo
echo "If you previously installed the Lycia GDM theme,"
echo "the original GNOME Shell resource can be restored."
echo

read -rp "Restore original GDM theme? [Y/n]: " RESTORE_GDM
RESTORE_GDM="${RESTORE_GDM:-Y}"

if [[ "${RESTORE_GDM}" =~ ^[Yy]$ ]]; then
BACKUP="/usr/share/gnome-shell/gnome-shell-theme.gresource.bak"

```
if sudo test -f "${BACKUP}"; then
    echo
    echo "Restoring GDM theme..."

    sudo cp \
        "${BACKUP}" \
        /usr/share/gnome-shell/gnome-shell-theme.gresource

    echo "Original GDM theme restored."
else
    echo
    echo "No GDM backup found:"
    echo "  ${BACKUP}"
fi
```

fi

echo
echo "Done."

