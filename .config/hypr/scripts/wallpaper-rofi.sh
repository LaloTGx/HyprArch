#!/bin/bash

# Carpeta de wallpapers
WALL_DIR=~/.config/hypr/bg

# Lista de archivos ordenados alfabéticamente/numericamente
WALL=$(find "$WALL_DIR" -type f -printf "%f\n" | sort -V | rofi -dmenu -i -p "Wallpaper:")

# Si se selecciona algo, aplicarlo con swww
if [ -n "$WALL" ]; then
    # Lista de transiciones disponibles
    transitions=("fade" "grow" "outer" "random" "simple" "left" "right" "top" "bottom" "circle" "wipe")

    # Escoge una transición aleatoria
    transition=${transitions[$RANDOM % ${#transitions[@]}]}

    swww img "$WALL_DIR/$WALL" --transition-type "$transition" --transition-step 90
fi

