#!/bin/bash
export DBUS_SESSION_BUS_ADDRESS="${DBUS_SESSION_BUS_ADDRESS:-unix:path=/run/user/$(id -u)/bus}"

EMOJI_DIR="$HOME/.config/rofi/scripts/r_emoji"
EMOJI_JSON="$EMOJI_DIR/emoji.json"
EMOJI_URL="https://unpkg.com/emoji.json/emoji.json"

# Crear carpeta si no existe
mkdir -p "$EMOJI_DIR"

# Si teclea "--update", fuerza la descarga del JSON
if [[ "$1" == "--update" ]]; then
    echo "Actualizando lista de emojis..."
    curl -sL "$EMOJI_URL" -o "$EMOJI_JSON"
    notify-send "Emoji Picker" "Lista de emojis actualizada"
    exit 0
fi

# Descarga el json solo si no existe o está vacío
if [ ! -s "$EMOJI_JSON" ]; then
    echo "Descargando lista inicial de emojis..."
    curl -sL "$EMOJI_URL" -o "$EMOJI_JSON"
fi

# Verificar jq
if ! command -v jq &>/dev/null; then
    notify-send "Emoji Picker" "Instala jq (sudo pacman -S jq)"
    exit 1
fi

# Mostrar emojis directamente desde el JSON
CHOICE=$(jq -r '.[] | "\(.char) \(.name)"' "$EMOJI_JSON" | rofi -dmenu -i -p "󰞅   Emoji:  " -theme-str 'listview { lines: 15; }')
[ -z "$CHOICE" ] && exit 0

EMOJI=$(echo "$CHOICE" | awk '{print $1}')

# Copiar al portapapeles
if command -v copyq &>/dev/null; then
    copyq copy "$EMOJI"
    notify-send "Emoji Picker" "$EMOJI copiado"
else
    echo -n "$EMOJI" | wl-copy
    notify-send "Emoji Picker" "$EMOJI copiado con wl-copy"
fi

# Escribir directamente al campo de texto si existe wtype
if command -v wtype &>/dev/null; then
    sleep 0.15
    wtype "$EMOJI"
fi
