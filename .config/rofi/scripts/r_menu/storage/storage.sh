#!/usr/bin/env bash

# Colores para texto
RED="\033[1;31m"
REDLIGHT="\e[1;91m"
YELLOW="\e[1;33m"
CYANLIGHT="\e[0;96m"
WHITELIGHT="\e[1;97m"
BGBLACK="\e[40m"
RESET="\033[0m"

# Rutas base
TITLE_DIR="$HOME/.config/rofi/scripts/r_menu/storage"

# Mostrar título
show_title() {
  clear
  echo -e "${REDLIGHT}"
  cat "$TITLE_DIR/titlestorage.txt"
  echo -e "${RESET}"
}

show_title
echo
echo "================ List Block Devices ============"
echo
lsblk -f
echo
echo "================ Disk Usage (/) ================"
echo
du -hxd1 / 2>/dev/null | sort -h
echo
echo "Press any key to exit..."
read -n 1
