#!/usr/bin/env bash

REDLIGHT="\e[1;91m"
WHITELIGHT="\e[1;97m"
RESET="\033[0m"

NOTES_FILE="$HOME/Notes/notes.md"
SCRIPT_DIR="$HOME/.config/rofi/scripts/r_menu/notes"
TITLE_FILE="$SCRIPT_DIR/titlenote.txt"

# Asegurar que el archivo existe antes de empezar
mkdir -p "$(dirname "$NOTES_FILE")"
[ ! -f "$NOTES_FILE" ] && echo "# Nueva Nota. * Escribe algo aquí" > "$NOTES_FILE"

get_tasks() {
    # Extrae solo las líneas que empiezan con #
    mapfile -t TASKS < <(grep "^#" "$NOTES_FILE" 2>/dev/null)
}

current=0

while true; do
  clear
  # Título decorativo
  [ -f "$TITLE_FILE" ] && echo -e "${REDLIGHT}$(cat "$TITLE_FILE")${RESET}" || echo -e "${REDLIGHT}=== NOTEFICATIONS TUI ===${RESET}"

  get_tasks

  if [ ${#TASKS[@]} -eq 0 ]; then
    echo -e "  ${REDLIGHT}(Archivo vacío o sin títulos)${RESET}"
  else
    echo -e "  Títulos detectados en notes.md:\n"
    for i in "${!TASKS[@]}"; do
      # Limpiar el '#' para que se vea estético
      display_name=$(echo "${TASKS[$i]}" | sed 's/^# //')

      if [ "$i" -eq "$current" ]; then
        echo -e "${WHITELIGHT}  ➜ $display_name ${RESET}"
      else
        echo "    $display_name"
      fi
    done
  fi

  echo -e "\n${REDLIGHT}──────────────────────────────────────────${RESET}"
  echo -e "[Enter] Edit notes | [j/k] Move | [q] Exit"

  read -rsn1 key

  case "$key" in
    j) ((current++)); [ "$current" -ge "${#TASKS[@]}" ] && current=0 ;;
    k) ((current--)); [ "$current" -lt 0 ] && current=$((${#TASKS[@]} - 1)) ;;
    "")
      nvim "$NOTES_FILE"
      ;;
    q)
      clear
      exit 0
      ;;
  esac
done
