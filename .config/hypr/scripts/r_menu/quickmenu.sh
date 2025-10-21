#!/bin/bash

CONFIG_DIR="$HOME/.config/hypr/scripts/r_menu/"
ICON_DIR="$CONFIG_DIR/icons"
MENU_FILE="$CONFIG_DIR/menu.txt"

# Leer las opciones del archivo
ENTRIES=""
while IFS="|" read -r NAME CMD ICON_NAME; do
    [ -z "$NAME" ] && continue

    # Si se especificó el nombre del icono en el txt, úsalo
    if [ -n "$ICON_NAME" ] && [ -f "$ICON_DIR/$ICON_NAME" ]; then
        ICON="$ICON_DIR/$ICON_NAME"
    else
        # Si no, intentar generar el nombre automáticamente
        ICON_BASENAME="$(echo "$NAME" | tr '[:upper:]' '[:lower:]' | tr ' ' '_')"
        for ext in png svg jpg jpeg webp; do
            if [ -f "$ICON_DIR/$ICON_BASENAME.$ext" ]; then
                ICON="$ICON_DIR/$ICON_BASENAME.$ext"
                break
            fi
        done
    fi

    # Agregar la entrada con o sin icono
    if [ -n "$ICON" ] && [ -f "$ICON" ]; then
        ENTRIES+="$NAME\0icon\x1f$ICON\n"
    else
        ENTRIES+="$NAME\n"
    fi
done < "$MENU_FILE"

# Mostrar menú con rofi
CHOICE=$(echo -en "$ENTRIES" | rofi -dmenu -p "   Command:  " -show-icons)

[ -z "$CHOICE" ] && exit 0

# Buscar y ejecutar el comando correspondiente
CMD=$(grep "^$CHOICE|" "$MENU_FILE" | cut -d"|" -f2- | cut -d"|" -f1)
if [ -n "$CMD" ]; then
    if [[ "$CMD" == *"wl-mirror"* ]]; then
        if pgrep -x "wl-mirror" > /dev/null; then
            pkill -x "wl-mirror"
            notify-send "Mirror" "Mirror detenido"
        else
            eval "$CMD" &
            notify-send "Mirror" "Mirror iniciado"
        fi
    else
        eval "$CMD"
    fi
else
    notify-send "Error" "No se encontró comando para '$CHOICE'"
fi
