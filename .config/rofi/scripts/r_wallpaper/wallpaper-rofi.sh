#!/bin/bash

# Directorios
BG_BASE="$HOME/.config/hypr/bg"
DARK_DIR="$BG_BASE/bgdark"
LIGHT_DIR="$BG_BASE/bglight"

# Crea la carpeta de matugen por si no hay ninguna caroeta
mkdir -p ~/.config/matugen/templates
mkdir -p ~/.cache/matugen

# Si no hay imagenes no mostrara nada
shopt -s nullglob

# Mostrar los wallpapers como iconos en rofi
SELECTED_WALL=$({
    cd "$DARK_DIR" || exit
    for a in *.jpg *.png *.jpeg; do
        echo -en "$a\0icon\x1f$DARK_DIR/$a\n"
    done

    cd "$LIGHT_DIR" || exit
    for a in *.jpg *.png *.jpeg; do
        echo -en "$a\0icon\x1f$LIGHT_DIR/$a\n"
    done
} | rofi -dmenu -p " Wallpaper: ")

[ -z "$SELECTED_WALL" ] && exit 0

# Deteccion de directorios para generar la paleta (modo oscuro, modo claro)
if [ -f "$DARK_DIR/$SELECTED_WALL" ]; then
    FULL_PATH="$DARK_DIR/$SELECTED_WALL"
    MODE="dark"
elif [ -f "$LIGHT_DIR/$SELECTED_WALL" ]; then
    FULL_PATH="$LIGHT_DIR/$SELECTED_WALL"
    MODE="light"
else
    exit 1
fi

# Genera la trancision, notificacion y la paleta de colores del wallpaper seleccionado
transitions=("grow" "outer" "left" "right" "top" "bottom" "center" "wipe" "wave")
transition=${transitions[$RANDOM % ${#transitions[@]}]}

swww img "$FULL_PATH" --transition-type "$transition" --transition-step 90
notify-send "🖼️ Wallpaper" "$SELECTED_WALL"
matugen image "$FULL_PATH" --mode "$MODE" -j hex > ~/.cache/matugen/colors.json
