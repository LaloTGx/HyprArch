#!/bin/bash

# Colores para texto
RED="\033[1;31m"
REDLIGHT="\e[1;91m"
YELLOW="\e[1;93m"
CYANLIGHT="\e[0;96m"
WHITELIGHT="\e[1;97m"
BGBLACK="\e[40m"
RESET="\033[0m"

# Ruta base
TITLE_DIR="$HOME/.config/rofi/scripts/r_menu/dmusic"

# Mostrar título
show_title() {
  clear
  echo -e "${CYANLIGHT}"
  cat "$TITLE_DIR/titledmusic.txt"
  echo -e "${YELLOW}"
}

TARGET_DIR="$HOME/Music"

if [ ! -d "$TARGET_DIR" ]; then
    mkdir -p "$TARGET_DIR"
fi

show_title
echo
echo
echo " Press [Enter] without a URL to exit"
echo
echo -e "${RESET}"
read -p "  Paste YouTube URL: " url
echo
[[ -z "$url" ]] && exit 0
echo "Select download format music:"
echo "1) mp3"
echo "2) flac"
read -p "Option [1-2]: " choice

case $choice in
    1)
        ext="mp3"
        ;;
    2)
        ext="flac"
        ;;
    *)
        echo "Invalid option. Exiting."
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
