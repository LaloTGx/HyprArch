#!/bin/bash

# Ruta de notas
NOTAS_FILE="$HOME/Notes/notes.md"

# Verificar si el archivo existe
if [ ! -f "$NOTAS_FILE" ]; then
    notify-send "Notefications" "No se encontró el archivo de notas."
    exit 1
fi

# Usamos awk como parser
# El RS (Record Separator) es el delimitador de notas
awk 'BEGIN {RS="---"} {
    # Limpiar espacios en blanco al inicio y final
    gsub(/^[[:space:]]+|[[:space:]]+$/, "", $0);

    if ($0 != "") {
        # Parser para el título
        match($0, /# [^\n]*/);
        titulo = substr($0, RSTART + 2, RLENGTH - 2);

        # Parser para la descripción
        match($0, /\* .*/);
        descripcion = substr($0, RSTART + 2);

        # Ejecutar notify-send
        system("notify-send \"" titulo "\" \"" descripcion "\" -u critical -t 15000");
    }
}' "$NOTAS_FILE"
