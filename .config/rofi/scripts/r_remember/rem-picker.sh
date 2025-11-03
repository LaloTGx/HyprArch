#!/bin/bash

CONFIG_DIR="$HOME/.config/rofi/scripts/r_remember/"
ICON_DIR="$CONFIG_DIR/icons"
KEYS_FILE="$CONFIG_DIR/cmd.txt"

# Bloque modular: Editor de comandos
edit_commands() {
    kitty -e nvim "$KEYS_FILE"
    notify-send "Rofi Remember" "Archivo de comandos abierto en Neovim"
    exit 0
}

# Leer las opciones del archivo (con íconos y comando visible)
ENTRIES=""
while IFS="|" read -r NAME CMD ICON_NAME; do
    [ -z "$NAME" ] && continue

    DISPLAY_TEXT="$NAME | $CMD"

    # Buscar ícono
    if [ -n "$ICON_NAME" ] && [ -f "$ICON_DIR/$ICON_NAME" ]; then
        ICON="$ICON_DIR/$ICON_NAME"
    else
        ICON_BASENAME="$(echo "$NAME" | tr '[:upper:]' '[:lower:]' | tr ' ' '_')"
        for ext in png svg jpg jpeg webp; do
            if [ -f "$ICON_DIR/$ICON_BASENAME.$ext" ]; then
                ICON="$ICON_DIR/$ICON_BASENAME.$ext"
                break
            fi
        done
    fi

    # Agregar entrada con ícono si existe
    if [ -n "$ICON" ] && [ -f "$ICON" ]; then
        ENTRIES+="$DISPLAY_TEXT\0icon\x1f$ICON\n"
    else
        ENTRIES+="$DISPLAY_TEXT\n"
    fi
done < "$KEYS_FILE"

# Mostrar menú con rofi
CHOICE=$(echo -en "$ENTRIES" | rofi -dmenu -i -p "   Remember:" -show-icons -theme-str 'listview { lines: 10; }')
[ -z "$CHOICE" ] && exit 0

# Si elige editar, abrir archivo y salir
if [[ "$CHOICE" == "Add Commands"* ]]; then
    edit_commands
fi

# Obtener solo el comando (lo que está después del "|")
CMD=$(echo "$CHOICE" | awk -F'|' '{print $2}' | sed 's/^ *//;s/ *$//')

# Copiar o escribir el comando, sin ejecutarlo
if command -v wtype &>/dev/null; then
    sleep 0.15
    wtype "$CMD"
else
    echo -n "$CMD" | wl-copy
    notify-send "Comando copiado" "$CMD"
fi
