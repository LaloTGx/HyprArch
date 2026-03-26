#!/bin/bash

NOTAS_FILE="$HOME/Notes/notes.md"

if [ ! -f "$NOTAS_FILE" ]; then
    notify-send "Notefications" "No se encontró el archivo de notas."
    exit 1
fi

awk 'BEGIN {RS="---"} {
    gsub(/^[[:space:]]+|[[:space:]]+$/, "", $0);
    if ($0 != "") {
        notas[i++] = $0;
    }
}
END {
    for (j = i - 1; j >= 0; j--) {
        match(notas[j], /# [^\n]*/);
        titulo = substr(notas[j], RSTART + 2, RLENGTH - 2);

        match(notas[j], /\* .*/);
        descripcion = substr(notas[j], RSTART + 2);

        system("notify-send \"" titulo "\" \"" descripcion "\" -u critical -t 15000");

        # Pausa de 2 segundos entre notificaciones
        if (j > 0) {
            system("sleep 2");
        }
    }
}' "$NOTAS_FILE"
