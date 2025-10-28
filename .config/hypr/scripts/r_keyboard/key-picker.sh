#!/bin/bash

KEYS_FILE="$HOME/.config/hypr/scripts/r_keyboard/keys.txt"

# Mostrar el menú con Rofi
CHOICE=$(cat "$KEYS_FILE" | rofi -dmenu -i -p "   Tecla:" -theme-str 'listview { lines: 10; }')
[ -z "$CHOICE" ] && exit 0

# Extraer el primer campo (la tecla real)
KEY=$(echo "$CHOICE" | awk '{print $1}')

# Copiar o escribirla directamente
if command -v wtype &>/dev/null; then
    sleep 0.15
    wtype "$KEY"
else
    echo -n "$KEY" | wl-copy
    notify-send "Teclado Virtual" "$KEY copiado"
fi
