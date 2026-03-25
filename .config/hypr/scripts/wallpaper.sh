#!/bin/bash

# Rutas
BG_DIR="$HOME/.config/hypr/bg"
DARK_DIR="$BG_DIR/bgdark"
LIGHT_DIR="$BG_DIR/bglight"

# Buscamos una imagen aleatoria dentro del directorio de fondos
WALLPAPER=$(find "$BG_DIR" -type f \( -name "*.jpg" -o -name "*.png" -o -name "*.jpeg" -o -name "*.webp" \) | shuf -n 1)

# Si por alguna razón no encuentra nada, salimos para evitar errores
if [ -z "$WALLPAPER" ]; then
    exit 1
fi

# Lógica de detección de carpeta para el MODO
if [[ "$WALLPAPER" == *"/bglight/"* ]]; then
    MODE="light"
elif [[ "$WALLPAPER" == *"/bgdark/"* ]]; then
    MODE="dark"
else
    MODE="dark"
fi

# Aplicar el wallpaper con swww
awww img "$WALLPAPER" --transition-type wipe --transition-step 90

# Ejecutar matugen con el modo detectado
matugen image "$WALLPAPER" --mode "$MODE" --source-color-index 0 --continue-on-error -j hex > "$HOME/.cache/matugen/colors.json"
