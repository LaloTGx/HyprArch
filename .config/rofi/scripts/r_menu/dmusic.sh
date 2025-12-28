#!/bin/bash

TARGET_DIR="$HOME/Music"

if [ ! -d "$TARGET_DIR" ]; then
    mkdir -p "$TARGET_DIR"
fi

read -p "Introduce la URL de YouTube: " url
echo "Selecciona el formato:"
echo "1) mp3"
echo "2) flac"
read -p "Opción [1-2]: " choice

case $choice in
    1)
        ext="mp3"
        ;;
    2)
        ext="flac"
        ;;
    *)
        echo "Opción no válida."
        exit 1
        ;;
esac

yt-dlp -x --audio-format "$ext" --audio-quality 0 \
    -o "$TARGET_DIR/%(title)s.%(ext)s" \
    --embed-metadata --embed-thumbnail \
    "$url"

# Avisa a MPD que hay música nueva
if command -v mpc > /dev/null; then
    mpc update
fi
