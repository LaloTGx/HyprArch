#!/bin/bash

BG_DIR="$HOME/.config/hypr/bg"

if [ ! -d "$BG_DIR" ]; then
    exit 1
fi

WALLPAPER=$(find "$BG_DIR" -type f \( -name "*.jpg" -o -name "*.png" -o -name "*.jpeg" -o -name "*.webp" \) | shuf -n 1)

if [ -z "$WALLPAPER" ]; then
    exit 1
fi

if [[ "$WALLPAPER" == *"/bglight/"* ]]; then
    MODE="light"
else
    MODE="dark"
fi

transitions=("grow" "outer" "left" "right" "top" "bottom" "center" "wipe" "wave")
transition=${transitions[$RANDOM % ${#transitions[@]}]}

awww img "$WALLPAPER" --transition-type "$transition" --transition-step 90

matugen image "$WALLPAPER" --mode "$MODE" --source-color-index 0 --continue-on-error -j hex > "$HOME/.cache/matugen/colors.json"

gsettings set org.gnome.desktop.interface color-scheme prefer-"$MODE"
