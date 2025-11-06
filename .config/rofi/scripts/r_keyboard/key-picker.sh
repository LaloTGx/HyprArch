#!/bin/bash

KEYS_FILE="$HOME/.config/rofi/scripts/r_keyboard/keys.txt"

# Bloque modular: Editor de comandos
edit_commands() {
    kitty -e nvim "$KEYS_FILE"
    notify-send "Add Key" "Archivo de Teclas abierto en Neovim"
    exit 0
}

# Mostrar el menú con Rofi
CHOICE=$(cat "$KEYS_FILE" | rofi -dmenu -i -p "   Tecla:" -theme-str 'listview { lines: 10; }')
[ -z "$CHOICE" ] && exit 0

# Si elige la opción especial para editar, ejecutamos el bloque y salimos
if [[ "$CHOICE" == "Add Commands"* ]]; then
    edit_commands
fi

# Extraer la parte antes del ">"
KEY=$(echo "$CHOICE" | cut -d '>' -f1 | sed 's/[[:space:]]*$//')

# Copiar al portapapeles
if command -v copyq &>/dev/null; then
    copyq copy "$KEY"
    notify-send "Teclado Virtual" "‘$KEY’ copiado al portapapeles"
else
    echo -n "$KEY" | wl-copy
    notify-send "Teclado Virtual" "‘$KEY’ copiado con wl-copy"
fi

# Escribir directamente si existe wtype (solo si estás en Wayland)
if command -v wtype &>/dev/null; then
    sleep 0.15
    wtype "$KEY"
fi
