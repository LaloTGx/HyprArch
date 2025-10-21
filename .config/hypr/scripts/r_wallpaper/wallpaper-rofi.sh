#!/bin/bash

# Carpeta de wallpapers
WALL_DIR="$HOME/.config/hypr/bg"

cd "$WALL_DIR" || exit 1
IFS=$'\n'

# Mostrar imágenes como íconos en Rofi
SELECTED_WALL=$(for a in *.jpg *.png *.jpeg; do
    echo -en "$a\0icon\x1f$WALL_DIR/$a\n"
done | rofi -dmenu -p "   Wallpaper:  ")

# Aplicar fondo con transición si se selecciona uno
if [ -n "$SELECTED_WALL" ]; then
    transitions=("grow" "outer" "left" "right" "top" "bottom" "center" "wipe" "wave")
    transition=${transitions[$RANDOM % ${#transitions[@]}]}
    swww img "$WALL_DIR/$SELECTED_WALL" --transition-type "$transition" --transition-step 90
fi
